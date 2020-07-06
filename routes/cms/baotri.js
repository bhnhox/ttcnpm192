var express = require('express');
const { Router } = require('express');

var router = express.Router();

var baotriController = require('../../controller/cms/baotri.controller')

router.route('/')
    .get(baotriController.index)
    .post(baotriController.batBaotri)


module.exports = router;