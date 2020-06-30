var express = require('express');
const { Router } = require('express');
const OrderController = require('../../controller/cms/order.controller')
var router = express.Router();

router.route('/')
    .get(OrderController.index)
    .post(OrderController.xacnhan)


module.exports = router;