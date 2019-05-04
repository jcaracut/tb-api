var router = require('express').Router();

router.use('/user', require('./user'));
router.use('/admin', require('./Admin'));
router.use('/breeder', require('.breeder'));
router.use('/investor', require('./investor'));

module.exports = router;