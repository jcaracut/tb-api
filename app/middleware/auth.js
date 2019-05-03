
const passport = require("passport");
const jwt = require("jsonwebtoken")

async function verifyToken(req, res, next) {
    if (!req.header('X-Token')) {
        res.status(401).send("Session is expired. Please login again!");
    } else {
        next();
    }
}

async function auth(req, res, next) {
    passport.authenticate("jwt", { session: false }, (err, payload) => {
        if (err) res.status(401).json({ error: err })
    });
    if (req.headers.authorization) {
        var token = req.headers.authorization.split(" ")[1];
        jwt.verify(token, process.env.SECRET, function (err, decoded) {
            if (err) {
                if (err) res.status(500).json({ error: err })
            } else {
                req.user = decoded;
                req.token = token;
                next()
            }
        });
    } else {
        res.status(401).send("Session is expired. Please login again!");
    }
}

module.exports = {
    verifyToken,
    auth
};