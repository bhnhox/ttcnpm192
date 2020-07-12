var express = require('express');
var router = express.Router();

var FoodRouter = require('./foods');
var MenuRouter = require('./menu');
var OrderRouter = require('./order');

var LoginController = require('../../controller/cms/login.controller')
//Thiện
var BaotriRouter = require('./baotri')
var Auth = require('../../controller/auth.middleware');
var Controller = require('../../controller/user.controller');

router.get('/',Auth.authen,Auth.checkRole, function (req, res, next) {
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
router.get('/logout',Auth.authen,Auth.checkRole, LoginController.logout)
router.use('/foods',Auth.authen,Auth.checkRole, FoodRouter);
router.use('/menu',Auth.authen,Auth.checkRole, MenuRouter);
//Trang quan ly nguoidung cua admin
router.use('/quanlynguoidung',Auth.authen,Auth.checkRole, Controller.adminquanlynguoidung);
//Trang them vendor
router.use('/themvendor',Auth.authen,Auth.checkRole, Controller.themvendor);

router.use('/editformvendor',Auth.authen,Auth.checkRole, Controller.editformvendor);

router.use('/editvendor',Auth.authen,Auth.checkRole, Controller.editvendor);
router.use('/vendortable',Auth.authen,Auth.checkRole, Controller.vendortable);




//Thiện
//Bảo trì
router.use('/baotri',Auth.checkRole,BaotriRouter );

module.exports = router;