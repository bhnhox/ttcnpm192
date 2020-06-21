var express = require('express');
var router = express.Router();
var LoginController = require('../../controller/cms/login.controller')

router.get('/', function (req, res, next) {
    if (req.session.user) {
        res.render('cms/main_layout');
    }
    else {
        res.redirect('/cms/login')
    }
});

router.route('/login')
    .get(function (req, res, next) {
        if (req.session.user) {
            res.redirect('/cms')
        }
        else res.render('cms/login/index');
    })
    .post(LoginController.checkLogin);
router.get('/logout', LoginController.logout)
module.exports = router;