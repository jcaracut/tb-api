const router = require('express').Router();
const passport = require('../middleware/auth');

//Controllers
var BreedersController = require('../controllers/BreedersController');

// router.get('/getFarms', BreedersController.getFarms);
router.get('/getFarms', passport.auth, BreedersController.getFarms);
router.get('/getCycles', passport.auth, BreedersController.getCycles);
router.get('/getJoinedCycles', passport.auth, BreedersController.getJoinedCycles);
router.get('/getRabbits', passport.auth, BreedersController.getRabbits);
router.get('/getFarmExpenses', passport.auth, BreedersController.getFarmExpenses);
router.get('/getFarmiInvestedMoney', passport.auth, BreedersController.getFarmiInvestedMoney);
router.get('/getCurrentRabbitCycle', passport.auth, BreedersController.getCurrentRabbitCycle);


router.post('/getInvestmentRecords', passport.auth, BreedersController.getInvestmentRecords);
router.post('/addFarm', passport.auth, BreedersController.addFarm);
router.post('/updateFarm', passport.auth, BreedersController.updateFarm);
router.post('/uploadFarm', passport.auth, BreedersController.uploadFarm);
router.post('/updateFarmLocation', passport.auth, BreedersController.updateFarmLocation);
router.post('/addRabbit', passport.auth, BreedersController.addRabbit);
router.post('/uploadRabbit', passport.auth, BreedersController.uploadRabbit);
router.post('/updateRabbit', passport.auth, BreedersController.updateRabbitInfo);
router.post('/addExpenses', passport.auth, BreedersController.addExpenses);
router.post('/deleteExpense', passport.auth, BreedersController.deleteExpense);
router.post('/uploadReciept', passport.auth, BreedersController.uploadReciept);
router.post('/deleteRabbit', passport.auth, BreedersController.deleteRabbit);
router.post('/deleteFarm', passport.auth, BreedersController.deleteFarm);
router.post('/joinCycle', passport.auth, BreedersController.joinCycle);


module.exports = router;