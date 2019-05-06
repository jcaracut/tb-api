var sgMail = require('@sendgrid/mail');
sgMail.setApiKey(process.env.SENDGRID_API_KEY);
const ImageUploader = require("../services/ImageUploaderService");
const verification = require('../auth/phoneverfication');
const phoneVerification = verification(process.env.AUTHY_API_KEY, process.env.AUTHY_API_URL);
const toMysqlFormat = require("../includes/mySQLFormat");
const connection = require("../db/db_bunny");
const jwt = require('jsonwebtoken');
const md5 = require("md5")


const UsersController = {
    login: (req, res) => {
        var email = req.body.email;
        var password = req.body.password;
        var date = toMysqlFormat(new Date());

        connection.query("SELECT * FROM tbl_user WHERE email=?", [email, 1], function (err, users) {
            if (users.length > 0) {
                if (md5(password) === users[0].password) {
                    if (users[0].is_banned === 1) {
                        res.status(404).json({ message: "Account has been banned.", success: false });
                    } else if (users[0].is_active === 0) {
                        var user = {
                            user_id: users[0].user_id,
                            email: users[0].email,
                            user_type: users[0].user_type,
                            is_active: users[0].is_active,
                            is_verify: users[0].is_verify,
                            verification: 0
                        };
                        res.json({ data: user, created_at: date, success: true });
                    } else if (users[0].is_active === 1) {
                        var user = {
                            user_id: users[0].user_id,
                            email: users[0].email,
                            user_type: users[0].user_type,
                            is_active: users[0].is_active,
                            is_verify: users[0].is_verify
                        };

                        var token = jwt.sign(user, process.env.SECRET, {
                            expiresIn: 86400 // 24 hr
                        });
                        user.verification = 1;
                        req.user = user;

                        if (token) res.json({ token: token, data: user, created_at: date, success: true });
                    }
                } else {
                    res.status(400).json({ message: "Incorrect password", success: false });
                }
            } else {
                res.status(400).json({ message: "Incorrect email address.", success: false });
            }
        });
    },
    register: (req, res) => {
        var password = req.body.password;
        var firstName = req.body.firstName;
        var lastName = req.body.lastName;
        var email = req.body.email;
        var password = req.body.password;
        var mobile = req.body.phoneNumber;
        var userType = req.body.userType;
        var avatar = (userType == 1) ? "//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/investor.png" : "//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/breeder.png";
        var dateCreated = toMysqlFormat(new Date());
        var address1 = req.body.address1 + "," + req.body.city + " " + req.body.zipcode;
        var address2 = req.body.address2;
        var address = address1 + " " + address2
        var zipcode = req.body.zipcode;
        var city = req.body.city;
        var province = req.body.province;
        var government_issued_id = req.body.government_issued_id

        var insertUser = "INSERT INTO tbl_user (password, user_type, date_created, is_active, email, is_verify) VALUE (?, ?, ?, ?, ?, ?);";
        var insertUserProfile = "INSERT INTO `tbl_user_profile`(`first_name`, `last_name`, `address`, `address1`, `address2`, `mobile`, `avatar`, `user_id`, `zipcode`, `city`, `province`, `government_issued_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        var selectUserEmail = "SELECT * FROM tbl_user WHERE email=?;";
        var selectUserMobileNumber = "SELECT * FROM tbl_user_profile WHERE mobile=?;";
        var addUserRegistration = 'INSERT INTO `tbl_registration`(`hashcode`, `email`, `is_active`, `mobile`, `date_created`) VALUES (?, ?, ?, ?, ?);'
        var dateCreated = toMysqlFormat(new Date());

        connection.query(selectUserMobileNumber, [mobile], (err, mobiles) => {
            if (mobiles.length > 0) {
                res.status(400).json({ message: "Phone Number not available.", success: false });
            } else {
                connection.query(selectUserEmail, [email], (err, users) => {
                    if (err) throw err;
                    if (users.length > 0) {
                        res.status(400).json({ message: "Email not available.", success: true });
                    } else {
                        connection.query(insertUser, [md5(password), userType, dateCreated, 0, email, 0], (err, users2) => {
                            if (err) throw err;
                            connection.query(selectUserEmail, [email], function (err1, row) {
                                if (err1) res.status(500).json(err1);
                                var user_id = row[0].user_id;
                                connection.query(insertUserProfile, [firstName, lastName, address, address1, address2, req.body.phoneNumber, avatar, user_id, zipcode, city, province, government_issued_id], (err2, row1) => {
                                    if (err2) res.status(500).json(err2);
                                    var user = {
                                        user_id: row[0].user_id,
                                        email: row[0].email,
                                        user_type: row[0].user_type,
                                        is_active: row[0].is_active,
                                        is_verify: row[0].is_verify
                                    };
                                    var token = jwt.sign(user, process.env.SECRET, {
                                        expiresIn: 3600 * 24// 1 hr
                                    });
                                    user.verification = 1;
                                    user.phoneNumber = req.body.phoneNumber
                                    req.user = user;
                                    connection.query(addUserRegistration, [token, email, 1, req.body.phoneNumber, dateCreated], (err3, userRegistration) => {
                                        if (err3) res.status(500).json(err3);
                                        if (userRegistration.affectedRows > 0) {
                                            createVaultInfo(user.user_id)
                                            res.json({ token: token, data: user, created_at: dateCreated, success: true });
                                        } else {
                                            res.status(500).json({ success: false, message: "Cannot register user." })
                                        }
                                    });
                                });
                            });
                        })
                    }
                });
            }
        });
    },
    generatePhoneVerificationCode: function (req, res) {
        var phone_number = req.body.phoneNumber;
        var country_code = 63;
        var via = "SMS";

        phoneVerification.requestPhoneVerification(phone_number, country_code, via, () => {
            console.log("Verification code was sent to " + phone_number + ".");
            res.json({ message: "Verification code was sent to " + phone_number + ".", success: true });
        });

    },
    generateEmailVerificationCode: function (req, res) {
        var recipient = req.body.email;
        var token = req.body.token;

        var msg = {
            to: recipient,
            from: 'support@bunney.com',
            subject: 'Welcome to Bunney! Confirm Your Email',
            text: "You're almost there!\n Click the confirmation button below.",
            html: '<a href="http://localhost:8080/api/v1/user/verifyEmail?token=' + token + '" style="margin-left: 100px; font-size: 16px; background-color: #CD853F; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;margin: 4px 2px;cursor: pointer;">Confirm Email Address</a>',
        };
        sgMail.send(msg);
        res.status(200).json({ message: "success", success: true })

    },
    verifyPhoneToken: function (req, res) {
        var phone_number = req.body.phoneNumber;
        var country_code = 63;
        var token = req.body.token;
        var updateUserActive = "UPDATE tbl_user as U, tbl_user_profile as UP SET U.is_active=? WHERE UP.mobile=? and U.user_id = UP.user_id"
        var removeUserRegistration = "UPDATE tbl_registration SET is_active=? WHERE mobile=?;";

        if (phone_number && country_code && token) {
            phoneVerification.verifyPhoneToken(phone_number, country_code, token, function (err, response) {
                if (err) {
                    console.log('Error creating phone registration request', err);
                    res.status(500).json(err);
                } else {
                    console.log('Phone Confirmation Success: ', response);
                    if (response.success) {

                        connection.query(updateUserActive, [1, phone_number], (err, user) => {
                            if (err) res.status(500).json({ success: false });
                            console.log(user)
                            if (user.affectedRows == 1) {
                                connection.query(removeUserRegistration, [0, phone_number], (err, user1) => {
                                    if (user1.affectedRows > 0) {
                                        res.json({ message: "Success", success: true });
                                    }
                                });
                            } else {
                                res.status(500).json({ success: false });
                            }
                        });
                    }
                }
            });
        } else {
            console.log('Failed in Confirm Phone request body: ', req.body);
            res.status(500).json({ error: "Missing fields" });
        }

    },
    verifyEmail: function (req, res) {
        var hashcode = req.query.token;

        if (hashcode) {
            const selectUserRegistration = "SELECT * FROM tbl_registration WHERE hashcode=? and is_active=?;";
            const verifyUser = "UPDATE tbl_user SET is_active=? WHERE email=?;";
            const removeUserRegistration = "UPDATE tbl_registration SET is_active=? WHERE email=?;";

            connection.query(selectUserRegistration, [hashcode, 1], (err, user) => {
                if (user.length > 0) {
                    connection.query(verifyUser, [1, user[0].email], (err, user1) => {
                        if (user1.affectedRows === 1) {
                            connection.query(removeUserRegistration, [0, user[0].email], (err, user1) => {
                                if (user1.affectedRows > 0) {
                                    // res.json({ message: "Success", success: true });
                                    res.redirect("http://localhost:4200/verification?verified=true");
                                }
                            });
                        }
                    });
                } else {
                    res.redirect("http://localhost:4200/pagenotfound");
                }
            });
        } else {
            res.status(400).json({ success: false });
        }
    },
    updateUserProfile: function (req, res) {
        var user_profile_id = req.body.user_profile_id;
        var first_name = req.body.first_name;
        var last_name = req.body.last_name;
        var address = req.body.address;
        var mobile = req.body.mobile;

        var updateUserProfile = "UPDATE `tbl_user_profile` SET `first_name`=?,`last_name`=?,`address`=?,`mobile`=? WHERE `user_profile_id`=?;";

        connection.query(updateUserProfile, [first_name, last_name, address, mobile, user_profile_id], (err, user) => {
            if (user.affectedRows > 0) {
                res.json({ success: true })
            } else {
                res.json({ success: false })
            }
        });
    },
    uploadAvatar: function (req, res) {
        req.filename = req.user.user_id + "-" + Date.now() + ".jpg";
        ImageUploader.uploadAvatar(req, res, function (err) {
            // if (err instanceof multer.MulterError) {
            //     ({ message: "A Multer error occurred when uploading." });
            // } else if (err) {
            //     message: "An unknown error occurred when uploading." });
            // }

            if (err) {
                console.log(err)
                res.status(500).json(err)

            } else if (!req.body && !req.files) {
                res.json({ success: false });
            } else {
                res.json({ success: true })
                // var avatar = "//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/" + req.filename;

                // var updateUserAvatar = "UPDATE tbl_user_profile SET avatar=? WHERE user_id=?"

                // connection.query(updateUserAvatar, [avatar, req.user.user_id], (err, user) => {
                //     if (err) console.log(err)
                //     console.log(user)
                //     if (user.affectedRows > 0) {
                //         res.json({ success: true })
                //     } else {
                //         res.json({ success: false })
                //     }
                // });
            }
        });
    },
    uploadID: function (req, res) {
        ImageUploader.uploadID(req, res, function (err) {
            // if (err instanceof multer.MulterError) {
            //     ({ message: "A Multer error occurred when uploading." });
            // } else if (err) {
            //     message: "An unknown error occurred when uploading."
            // }

            if (!req.body && !req.files) {
                res.json({ success: false });
            } else {
                console.log("Success");
                res.json({ success: true });
            }
        });
    },
    updateUserIDPicture: (req, res) => {
        var user_id = req.user.user_id;
        var image = req.body.image;

        var updateUserIDPicturePath = "UPDATE tbl_user_profile SET government_issued_id=? WHERE user_id=?"

        connection.query(updateUserIDPicturePath, [image, user_id], (err, user) => {
            if (err) res.status(500).json(err)
            if (user.affectedRows === 1) {
                res.json({ message: "ID picture has been uploaded!", success: true });
            } else {
                res.status(500).json({ message: "Cannot update ID picture.", success: false });
            }
        });
    },
    updateUserVaultBalance: function (req, res) {
        var user_id = req.body.user_id;
        var amount = req.body.amount;
        var selectUserVault = "SELECT * FROM tbl_vault_info WHERE user_id=?";

        var addUserWalletCredit = "UPDATE tbl_vault_info SET balance=? WHERE user_id=?";
        connection.query(selectUserVault, [user_id], (err, vault) => {
            if (err) {
                res.status(500).json(err);
            }
            if (vault.length > 0) {

                var currentBalanceAmount = vault[0].balance;
                var newCreditAmount = currentBalanceAmount + amount;

                connection.query(addUserWalletCredit, [newCreditAmount, user_id], (err1, vault1) => {
                    if (err1) {
                        res.status(500).json(err);
                    }
                    if (vault1.affectedRows === 1) {
                        res.json({ message: "Vault balance been updated.", success: true });
                    } else {
                        res.json({ success: false });
                    }
                });
            } else {
                res.json({ message: "Cannot complete the transaction! Please try again.", success: false });
            }
        });
    },
    getVaultInfo: function (req, res) {
        var user_id = req.user.user_id;

        var selectUserWallet = "SELECT * FROM tbl_vault_info WHERE user_id=?";
        connection.query(selectUserWallet, [user_id], (err, vault) => {
            if (err) res.status(500).json({ error: err });
            if (vault.length > 0) {
                res.json({ vault: vault[0], message: "success", success: true });
            } else {
                res.status(500).json({ success: false });
            }
        });

    },
    getLoggedInUser: function (req, res) {
        var user_id = req.user.user_id;
        var selectUserProfile = "SELECT * FROM tbl_user_profile WHERE user_id=?"

        connection.query(selectUserProfile, [user_id], (err, users) => {
            if (users.length > 0) {
                var user = users[0]
                user.email = req.user.email
                user.is_verify = req.user.is_verify
                res.json({ user: user })
            } else {
                res.status(401).json({ message: "An error occured!", success: false });
            }
        });
    },
    sendEmailForgotPassword: function (req, res) {
        var recipient = req.body.email;
        var token = req.token;
        var insertUserForgotPassword = "INSERT INTO `tbl_forgot_password`(`hashcode`, `email`, `date_created`) VALUES (?, ?, ?)"
        var date_created = toMysqlFormat(Date.now())

        var msg = {
            to: recipient,
            from: 'support@bunney.com',
            subject: 'Reset your password.',
            text: "Click the reset password button!",
            html: '<a href="http://localhost:8080/api/v1/user/verifyForgotPassword?token=' + token + '" style="margin-left: 100px; font-size: 16px; background-color: #CD853F; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;margin: 4px 2px;cursor: pointer;">Reset Password</a>',
        };
        sgMail.send(msg);

        connection.query(insertUserForgotPassword, [token, email, date_created], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.length > 0) {
                res.json({ user: users[0] })
            } else {
                res.status(400).json({ message: "An error occured!", success: false });
            }
        });

        res.status(200).json({ message: "success", success: true })
    },
    verifyForgotPassword: function (req, res) {
        var token = req.query.token;
        var removeUserForgotPasswordExistence = "DELETE FROM tbl_forgot_password WHERE hashcode=?"

        connection.query(removeUserForgotPasswordExistence, [token], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.affectedRows > 0) {
                res.redirect("http://localhost:4200/resetPassword")
            } else {
                res.status(400).json({ message: "An error occured!", success: false });
            }
        });
        res.status(200).json({ message: "success", success: true })
    },
    getNotifications: (req, res) => {
        var user_type = req.user.user_type;
        var user_id = req.user.user_id;

        var selectNotifications = (user_type == "1") ? "SELECT * FROM tbl_investor_notification WHERE user_id=? ORDER BY date_created DESC" : "SELECT * FROM tbl_breeder_notification WHERE user_id=? ORDER BY date_created DESC";

        connection.query(selectNotifications, [user_id], (err, notifications) => {
            if (err) res.status(500).json(err)
            if (notifications.length > 0) {
                res.json({ notifications: notifications, success: true })
            } else {
                res.status(404).json({ message: "No notifications!", success: false });
            }
        });
    },
    readNotification: (req, res) => {
        var user_type = req.body.user_type;
        var notification_id = req.body.notification_id;
        var updateNotification = (user_type == 1) ? "UPDATE tbl_investor_notification SET is_read=> WHERE notification_id=?" : "UPDATE tbl_breeder_notification SET is_read=> WHERE notification_id=?";

        connection.query(updateNotification, [1, notification_id], (err, notifications) => {
            if (err) res.status(500).json(err)
            if (notifications.length > 0) {
                res.json({ success: true })
            } else {
                res.status(404).json({ success: false });
            }
        });
    },
    sendMessageToAdmin: (req, res) => {
        var subject = req.body.subject;
        var message = req.body.message;
        var user_id = req.user.user_id;

        if (!subject || !message) res.status(500).json({ success: false, message: "Please make sure to have subject or message." })

        var insertNotification = "INSERT INTO `tbl_admin_messages`(`subject`, `message`, `date_added`, `is_read`, `is_active`, `user_id`) VALUES (?, ?, ?, ?, ?, ?)"
        var date = toMysqlFormat(new Date())
        connection.query(insertNotification, [subject, message, date, 0, 1, user_id], (err, notif) => {
            if (err) res.status(500).json(err)
            if (notif.affectedRows > 0) {
                res.json({ success: true })
            } else {
                res.json({ success: false })
            }
        });

    },
    sendNotificationToBreeder: (req, res) => {
        var subject = req.body.subject;
        var message = req.body.message;

        if (!subject || !message) res.status(500).json({ success: false, message: "Please make sure to have subject or message." })

        var insertNotification = "INSERT INTO `tbl_breeder_notification`(`subject`, `message`, `date_added`, `is_read`, `is_active`, `user_id`) VALUES (?, ?, ?, ?, ?, ?)"
        var date = toMysqlFormat(new Date())
        connection.query(insertNotification, [subject, message, date, 0, 1, user_id], (err, notif) => {
            if (err) res.status(500).json(err)
            if (notif.affectedRows > 0) {
                res.json({ success: true })
            } else {
                res.json({ success: false })
            }
        });

    }
};

function createVaultInfo(user) {
    const createVaultInfo = "INSERT INTO `tbl_vault_info`(`user_id`, `invested_money`, `profit`, `unit_earnings`, `reinvests`, `withdrawn`, `return`, `active_investments`, `balance`, `is_active`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    connection.query(createVaultInfo, [user, 0, 0, 0, 0, 0, 0, 0, 0, 1], (err, wallet) => {
        if (err) console.log(err);
        if (wallet.affectedRows > 0) {
            console.log("Vault has been created.")
        } else {
            console.log("Cannot create vault for user " + user)
        }
    });
}

module.exports = UsersController;