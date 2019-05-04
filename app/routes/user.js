var router = require('express').Router();
const passport = require('../middleware/auth');

//Controllers
var UsersController = require('../controllers/UsersController');

router.post('/auth/login', UsersController.login);
router.post('/register', UsersController.register);
router.post('/generateEmailVerification', UsersController.generateEmailVerificationCode);
router.post('/generatePhoneVerification', UsersController.generatePhoneVerificationCode);
router.post('/verifyPhone', UsersController.verifyPhoneToken);
router.post('/uploadID', UsersController.uploadID);
router.post('/updateUserIDPicture', passport.auth, UsersController.updateUserIDPicture);
router.post('/updateUserAvatar', passport.auth, UsersController.uploadAvatar);
router.post('/updateUserProfile', passport.auth, UsersController.updateUserProfile);
router.post('/sendMessageToAdmin', passport.auth, UsersController.sendMessageToAdmin);
router.post('/updateUserVaultBalance', passport.auth, UsersController.updateUserVaultBalance);

router.get('/verifyEmail', UsersController.verifyEmail);
router.get("/getVaultInfo", passport.auth, UsersController.getVaultInfo);
router.get("/getLoggedInUser", passport.auth, UsersController.getLoggedInUser);
router.get("/getNotifications", passport.auth, UsersController.getNotifications);

module.exports = router;