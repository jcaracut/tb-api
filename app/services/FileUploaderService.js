var path = require('path');
var multer = require('multer');
var aws = require('aws-sdk')
var multerS3 = require('multer-s3');

aws.config.update({
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    region: 'us-east-2'
});

var s3 = new aws.S3();

var upload = multer({
    storage: multerS3({
        s3: s3,
        bucket: 'bunney',
        key: function (req, file, cb) {
            var newFileName = Date.now() + "-" + file.originalname;
            var fullPath = "uploads/" + newFileName;
            cb(null, fullPath);
        }
    })
});

var uploadContract = multer({
    storage: multerS3({
        s3: s3,
        bucket: 'bunney',
        acl: 'public-read',
        key: function (req, file, cb) {
            var newFileName = req.filename;
            var fullPath = "assets/uploads/contracts/" + newFileName;
            cb(null, fullPath);
        }
    })
});



module.exports = {
    upload: upload.single("file"),
    uploadContract: uploadContract.single("contract"),
    uploadMany: upload.array("file", 5)
}