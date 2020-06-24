var express = require('express');
const { Router } = require('express');

var router = express.Router();

var MenuController = require('../../controller/cms/menu.controller')

router.route('/')
    .get(MenuController.index)


module.exports = router;