var express = require('express');
const { Router } = require('express');
var router = express.Router();

var FoodController = require('../../controller/cms/food.controller')

router.get('/', FoodController.index);

module.exports = router;