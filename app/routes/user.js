var express = require('express');
var router = express.Router();
var multer = require('multer');
var bodyParser = require('body-parser');
var path = require('path');


var toMysqlFormat = require("../includes/mySQLFormat");

var connection = require("../db/db_bunny.js");
var userService = require('../auth/user.service');

// router.post('/post', userService.verifyToken, (req, res) => {
// 	var authUser = jwt.verify(req.token, 'bunneykey');
// 	res.send({ authUser: authUser });
// });


var uploadConfig = multer({
	storage: multer.diskStorage({
		destination: function (req, file, callback) { callback(null, '../assets/ids'); },
		filename: function (req, file, callback) { callback(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname)); }

	}),

	fileFilter: function (req, file, callback) {
		var ext = path.extname(file.originalname)
		if (ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {
			return callback(/*res.end('Only images are allowed')*/ null, false)
		}
		callback(null, true)
	}
});

var uploadImage = uploadConfig.single('id');

router.post('/upload', (req, res) => {
	uploadImage(req, res, function (err) {
		if (err instanceof multer.MulterError) {
			res.json({ message: "A Multer error occurred when uploading." });
		} else if (err) {
			res.json({ message: "An unknown error occurred when uploading." });
		}
		console.log("req.body"); //form fields
		console.log(req.body);
		console.log("req.file");
		// var idImage = base64_encode(path.join(__dirname + '/public/uploads/' + req.file.filename));

		if (!req.body && !req.files) {
			res.json({ success: false });
		} else {
			res.json({ success: true });
		}
	});
});

function base64_encode(file) {
	// read binary data
	var bitmap = fs.readFileSync(file);
	// convert binary data to base64 encoded string
	return new Buffer(bitmap).toString('base64');
}




module.exports = router;
