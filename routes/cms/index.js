var express = require('express');
var router = express.Router();

var FoodRouter = require('./foods');
var MenuRouter = require('./menu');
var OrderRouter = require('./order');

var LoginController = require('../../controller/cms/login.controller')
//Thiện
var BaotriRouter = require('./baotri')
var Auth = require('../../controller/auth.middleware');
const { route } = require('..');

router.get('/',Auth.checkRole, function (req, res, next) {
    res.render('cms/main_layout',{content:"dashboard/home",data:null});

    // if (req.session.user) {
    //     res.render('cms/main_layout',{content:"dashboard/home",data:null});
    // }
    // else {
    //     res.redirect('/cms/login');
    // }
});

// router.route('/login')
//     .get(function (req, res, next) {
//         if (req.session.user) {
//             res.redirect('/cms')
//         }
//         else res.render('cms/login/index');
//     })
//     .post(LoginController.checkLogin);
router.get('/logout',Auth.checkRole, LoginController.logout)
router.use('/foods',Auth.checkRole, FoodRouter);
router.use('/menu',Auth.checkRole, MenuRouter);
router.use('/order',Auth.checkRole, OrderRouter)





//Thiện
//Bảo trì
router.use('/baotri',Auth.checkRole,BaotriRouter );

module.exports = router;