var express = require('express');
var router = express.Router();

// var bcrypt = require("bcrypt");
var saltRounds = 11;

var sgMail = require('@sendgrid/mail');
var SENDGRID_API_KEY = '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';
sgMail.setApiKey(SENDGRID_API_KEY);

var authy_api_key = "ytpV4bJYcMnV7moGNJ8pKfNM2NZLK65M";
var authy_apiURL = "https://api.authy.com";
var verification = require('../auth/phoneverfication');
var phoneVerification = verification(authy_api_key, authy_apiURL);

var jwt = require('jsonwebtoken');

var toMysqlFormat = require("../includes/mySQLFormat");

var connection = require("../db/db_bunny.js");
var userService = require('../auth/user.service');

router.post('/auth', (req, res) => {
    var email = req.query.email;
    var password = req.query.password;
    var dateCreated = toMysqlFormat(new Date());
    connection.query("SELECT * from tbl_user WHERE email=?", [email], function (err, rows) {
        if (rows.length > 0) {
            // if(bcrypt.compareSync(password, rows[0].password)) {
            if (rows[0].password === password) {
                var user = rows[0];
                console.log("authenticating");
                var token = jwt.sign({ user }, 'bunneykey');
                res.send({ token: token, data: user, created_at: dateCreated, success: true });
                // res.writeHead(200, {
                //     'Set-Cookie': 'sesh=wakadoo; expires=' + new Date(new Date().getTime() + 86409000).toUTCString()
                // });
            } else {
                res.sendStatus(401).send({ message: "Incorrect password." });
            }
        } else {
            res.sendStatus(401).send({ message: "Incorrect email address." });
        }

    });
});

router.post('/register', (req, res) => {
    var firstName = req.query.firstName;
    var lastName = req.query.lastName;
    var password = "";
    var email = req.query.email;
    var mobile = req.query.mobile;
    var userType = req.query.userType;
    var avatar = "/assets/avatars/default.jpg";
    var dateCreated = toMysqlFormat(new Date());
    var address1 = req.query.address1;
    var address2 = req.query.address2;
    var address = JSON.stringify({ address1: address1, address2: address2 });

    var insertUser = "INSERT INTO tbl_user (password, userType, dateCreated, isActive, email) VALUE (?, ?, ?, ?, ?);";
    var insertUserProfile = "INSERT INTO tbl_userprofile(userProfileID, firstName, lastName, address, address1, address2, mobile, avatar) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    var selectUserEmail = "SELECT * FROM tbl_user WHERE email=?;";
    var updateUser = "UPDATE tbl_user SET userProfileID=? WHERE email=?;"
    var dateCreated = toMysqlFormat(new Date());

    connection.query(selectUserEmail, [email], (err, users) => {
        if (users.length > 0) {
            console.log("Email not available.");
            return res.send({ message: "Email not available." });
        } else {
            connection.query(insertUser, [password, userType, dateCreated, 0, email], (err, rows) => {
                if (err) console.log(err)
                connection.query(selectUserEmail, [email], function (err, rows) {
                    console.log(rows);
                    var userID = rows[0].userID;
                    var user = rows[0];
                    connection.query(insertUserProfile + updateUser, [userID, firstName, lastName, address, address1, address2, mobile, avatar, userID, email], (err, rows) => {
                        if (err) console.log(err)
                        if (user) {
                            var token = jwt.sign(user, 'bunneykey');
                            sendEmailConfirmation(email, token);

                            res.send({ token: token, data: user, created_at: dateCreated, success: true });
                        }
                    });
                });
            })
        }
    })
});

router.post('/generate', userService.verifyToken, (req, res) => {
    var phone_number = req.query.phoneNumber;
    var country_code = req.query.countryCode;
    var via = "SMS";

    sendPhoneVerification(phone_number, country_code, via, res);
});

router.post('/setup-password', userService.verifyToken, (req, res) => {
    var password = bcrypt.hashSync(req.query.password, saltRounds);
    var email = req.token.email;
    var updateUserPassword = "UPDATE tbl_user SET password=? WHERE email=?;"
    connection.query(updateUserPassword, [password, email], (err, user) => {
        if (err) console.log(err)
    });
});

router.post('/verify-phone', (req, res) => {
    var phone_number = req.query.phoneNumber;
    var country_code = req.query.countryCode;
    var token = req.query.token;

    verifyPhoneToken(phone_number, country_code, token, res);
});

function sendEmailConfirmation(recipient, token) {
    console.log("Sending to " + recipient + " .....");
    const msg = {
        to: recipient,
        from: 'support@bunney.com',
        subject: 'Welcome to Bunney! Confirm Your Email',
        text: "You're almost there!\n Click the confirmation button below.",
        html: '<a href="http://localhost:8000/verify?token=' + token + '" style="margin-left: 100px; font-size: 16px; background-color: #CD853F; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;margin: 4px 2px;cursor: pointer;">Confirm Email Address</a>',
    };
    sgMail.send(msg);
}

function sendPhoneVerification(phone_number, country_code, via, res) {
    console.log("Sending verification code to " + phone_number + " ....");
    phoneVerification.requestPhoneVerification(phone_number, country_code, via, () => {
        return res.send({ message: "Verification code was sent to " + phone_number + "." });
    });
}

function verifyPhoneToken(phone_number, country_code, token, res) {
    console.log("Verifying code ....");
    phoneVerification.verifyPhoneToken(phone_number, country_code, token, (err) => {
        // if(err) return res.send({ message: "Incorrect verification code!" });
        return res.send({ message: "Verified successfully." });
    });
}



module.exports = router;
