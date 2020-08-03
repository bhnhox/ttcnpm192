var express = require('express');
var BillController = require('../../controller/cms/bill.controller');
var router = express.Router();

router.get('/', BillController.index)

module.exports = router;