var router = require('express').Router();

router.use('/user', require('./user'));
router.use('/admin', require('./Admin'));
router.use('/breeder', require('.Breeder'));
router.use('/investor', require('./Investor'));

module.exports = router;