const router = require('express').Router();
const passport = require('../middleware/auth');

//Controllers
var InvestorsController = require('../controllers/InvestorsController');

router.get('/getListOfInvestedFarms', passport.auth, InvestorsController.getListOfInvestedFarms);
router.get('/getListOfInvestedRabbits', passport.auth, InvestorsController.getListOfInvestedRabbits);
router.get("/getCart", passport.auth, InvestorsController.getCart);
router.get("/getAvailableFarms", passport.auth, InvestorsController.getAvailableFarms);
router.get("/getAvailableRabbits", passport.auth, InvestorsController.getAvailableRabbits);
router.get("/getFarmExpensesLog", passport.auth, InvestorsController.getFarmExpensesLog);
router.get("/getContracts", passport.auth, InvestorsController.getContracts);
router.get("/getRemainingCycleDays", passport.auth, InvestorsController.getRemainingCycleDays);
router.get("/getDirectorSign", passport.auth, InvestorsController.getDirectorSign);


router.post("/getActiveInvestments", passport.auth, InvestorsController.getActiveInvestments);
router.post("/addToCart", passport.auth, InvestorsController.addToCart)
router.post("/deleteFromCart", passport.auth, InvestorsController.deleteFromCart)
router.post("/uploadContract", passport.auth, InvestorsController.uploadContract)
router.post("/addActiveInvestment", passport.auth, InvestorsController.addActiveInvestment)
router.post("/updateRabbitStatus", passport.auth, InvestorsController.updateRabbitStatus)


module.exports = router;