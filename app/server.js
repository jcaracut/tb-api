'use strict';
//Import .env configurations
require('dotenv').config();

const PORT = process.env.PORT || 8080;

const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require("body-parser");
const connection = require("./db/db_bunny.js");

const passport = require('passport');
const passportJWT = require("passport-jwt");
const JWTStrategy = passportJWT.Strategy;
const ExtractJWT = passportJWT.ExtractJwt;

const opts = {
	jwtFromRequest: ExtractJWT.fromAuthHeaderAsBearerToken(),
	secretOrKey: process.env.SECRET
};

const strategy = new JWTStrategy(opts, (jwtPayload, next) => {
		connection.query("SELECT * FROM tbl_user WHERE user_id=?", [jwtPayload.user_id], function (err, user) {
			console.log(user[0])
			next(null, user[0])
		});
	}
)

passport.use(strategy);
app.use(express.static("public"));
app.use(bodyParser.json({limit: '2mb', extended: true}))
app.use(bodyParser.urlencoded({limit: '2mb', extended: true}))
app.use(cors());

app.use('/api/v1', require('./routes/Route'));

app.listen(PORT, () => {
	console.log('Server running on port ' + PORT);
});

module.exports = app;
