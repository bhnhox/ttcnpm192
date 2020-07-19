var express = require('express');
var FeedbackController = require('../../controller/cms/feedback.controller');
var router = express.Router();

router.get('/', FeedbackController.index)

module.exports = router;

