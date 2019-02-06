'use strict';
var express = require('express');
var app = express();
var passport = require('passport');
var cors = require('cors');
var session = require("express-session");
var bodyParser = require("body-parser");

var toMysqlFormat = require("./includes/mySQLFormat");

//Including Routes
var users = require("./routes/user")
var api = require("./routes/api")

app.use(express.static("public"));
app.use(session({ secret: "cats" }));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use(passport.session());

app.use('/', api); 
app.use('/user', users); 

var corsOptions = {
	origin: '*',
	optionsSuccessStatus: 200
};

app.use(cors(corsOptions));

app.listen(8000, () => {
	console.log('Server running on port 8000');
});

app.get('/', (req, res) => {
	res.send("Hello World!");
});

app.get('/verify', (req, res) => {
	console.log(req.query.token);
	res.send("You are Verified!");
});

app.get('/test', (req, res) => {
	res.writeHead(200, {
		'Set-Cookie':'sesh=wakadoo; expires='+new Date(new Date().getTime()+86409000).toUTCString()
	});

	res.send("test");
});