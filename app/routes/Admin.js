const router = require('express').Router();
const passport = require('../middleware/auth');

//Controllers
var AdminsController = require('../controllers/AdminsController');

router.post('/deleteUser', passport.auth, AdminsController.deleteUser);
router.post('/banUser', passport.auth, AdminsController.banUser);
router.post('/deleteCycle', passport.auth, AdminsController.deleteCycle);
router.post('/activateUser', AdminsController.activateUser);
router.post('/deactivateUser', AdminsController.deactivateUser);
router.post('/verifyUser', passport.auth, AdminsController.verifyUser);
router.post('/verifyFarm', passport.auth, AdminsController.verifyFarm);
router.post("/openNewCycle", passport.auth, AdminsController.openNewCycle)
router.post("/updateCycle", passport.auth, AdminsController.updateCycle)
router.post('/deleteCycle', passport.auth, AdminsController.deleteCycle);
router.post("/sendNotification", passport.auth, AdminsController.sendNotification)
router.post("/updateInvestment", passport.auth, AdminsController.updateInvestment)
router.post("/getInvestmentRecords", passport.auth, AdminsController.getInvestmentRecords)


// router.post('/updateUser', AdminsController.updateUser);
router.get('/getAllUnverifiedUsers', passport.auth, AdminsController.getAllUnverifiedUsers);
router.get('/getAllUnverifiedFarms', passport.auth, AdminsController.getAllUnverifiedFarms);
router.get('/getFarmBreeder', passport.auth, AdminsController.getFarmBreeder);
router.get('/getAllUsers', passport.auth, AdminsController.getAllUsers);
router.get('/getAllFarms', passport.auth, AdminsController.getAllFarms);
router.get('/getAllBreeders', passport.auth, AdminsController.getAllBreeders);
router.get('/getAllInvestors', passport.auth, AdminsController.getAllInvestors);
router.get('/getMessages', passport.auth, AdminsController.getMessages);
router.get('/getCycles', passport.auth, AdminsController.getCycles);



module.exports = router;