var path = require('path');
var multer = require('multer');
var aws = require('aws-sdk')
var multerS3 = require('multer-s3');
var connection = require("../db/db_bunny");

aws.config.update({
	secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
	accessKeyId: process.env.AWS_ACCESS_KEY_ID,
	region: 'us-east-2'
});

var s3 = new aws.S3();
var fileFilter = function (req, file, callback) {
	var ext = path.extname(file.originalname)
	if (ext !== '.PNG' && ext !== '.png' && ext !== '.jpg' && ext !== '.JPG' && ext !== '.jpeg' && ext !== '.JPEG') {
		return callback(/*res.end('Only images are allowed')*/ null, false)
	}
	callback(null, true)
}

var uploadID = multer({
	storage: multerS3({
		s3: s3,
		bucket: 'bunney',
		acl: 'public-read',
		key: function (req, file, cb) {
			var newFileName = file.originalname;
			var fullPath = "assets/uploads/images/users/id/" + newFileName;
			cb(null, fullPath);
		}
	}),
	fileFilter: fileFilter
});

var uploadFarm = multer({
	storage: multerS3({
		s3: s3,
		bucket: 'bunney',
		acl: 'public-read',
		key: function (req, file, cb) {
			var filename = file.originalname;
			var fullPath = "assets/uploads/images/farms/image/" + filename;
			console.log(fullPath)
			cb(null, fullPath);
		}
	}),
	fileFilter: fileFilter
});

var uploadRabbit = multer({
	storage: multerS3({
		s3: s3,
		bucket: 'bunney',
		acl: 'public-read',
		key: function (req, file, cb) {
			var filename =file.originalname;
			var fullPath = "assets/uploads/images/farms/rabbits/" + filename;
			cb(null, fullPath);
		}
	}),
	fileFilter: fileFilter
});

var uploadAvatarImage = multer({
	storage: multerS3({
		s3: s3,
		bucket: 'bunney',
		acl: 'public-read',
		key: function (req, file, cb) {
			var filename = req.user.user_id + "-" + Date.now() + path.extname(file.originalname);
			var avatar = "//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/" + filename;

			var updateUserAvatar = "UPDATE tbl_user_profile SET avatar=? WHERE user_id=?"

			connection.query(updateUserAvatar, [avatar, req.user.user_id], (err, user) => {
				if (err) console.log(err)
				if (user.affectedRows > 0) {
					console.log("Avatar is uploaded successfully!")
				} else {
					console.log("Avatar upload failed!")
				}
			});
			var fullPath = "assets/uploads/images/users/avatar/" + filename;
			cb(null, fullPath);
		}
	}),
	fileFilter: fileFilter
});


var uploadReciept = multer({

	storage: multerS3({
		s3: s3,
		bucket: 'bunney',
		acl: 'public-read',
		key: function (req, file, cb) {
			var filename = file.originalname;
			var fullPath = "assets/uploads/images/farms/reciepts/" + filename;
			cb(null, fullPath);
		}
	}),
	fileFilter: fileFilter
});


var uploadPaymentReciept = multer({

	storage: multerS3({
		s3: s3,
		bucket: 'bunney',
		acl: 'public-read',
		key: function (req, file, cb) {
			var filename = file.originalname;
			var fullPath = "assets/uploads/images/payment/reciepts/" + filename;
			cb(null, fullPath);
		}
	}),
	fileFilter: fileFilter
});

module.exports = {
	uploadAvatar: uploadAvatarImage.single('avatar'),
	uploadFarm: uploadFarm.single('farm'),
	uploadReciept: uploadReciept.single("reciept"),
	uploadPaymentReciept: uploadPaymentReciept.single("reciept"),
	uploadRabbit: uploadRabbit.single("rabbit"),
	// uploadReciepts: uploadReciepts.array("reciept", 4),
	uploadID: uploadID.single('id')
};