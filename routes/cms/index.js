var express = require('express');
var router = express.Router();

var FoodRouter = require('./foods');
var MenuRouter = require('./menu');
var OrderRouter = require('./order');

var FeedbackRouter = require('./feedback')
var BillRouter = require('./bill')

var LoginController = require('../../controller/cms/login.controller')
//Thiện
var BaotriRouter = require('./baotri')
var Auth = require('../../controller/auth.middleware');
var Controller = require('../../controller/user.controller');


//Check role 
var foodmenucheckrole = function foodmenucheckrole(req, res, next) {
    var role = req.cookies.info.role;
    if (role == 'vendor' || role == 'daubep') {
        next()
    } else {
        res.redirect('/cms');
    }

};
var vendorAdminCheckRole = function vendorAdminCheckRole(req, res, next) {
    var role = req.cookies.info.role;
    if (role == 'vendor' || role == 'admin') {
        next()
    } else {
        res.redirect('/cms');
    }

};
var checkRoleDauBep = function checkRoleDauBep(req, res, next) {
    var role = req.cookies.info.role;
    if (role != 'daubep') res.redirect('/cms');
    else next();
};
var adminCheckRole = function adminCheckRole(req, res, next) {
    var role = req.cookies.info.role;
    if (role == 'admin') {
        next()
    } else {
        res.redirect('/cms');
    }

};
//Router
router.get('/', Auth.authen, Auth.checkRole, function (req, res, next) {
    var role = req.cookies.info.role;
    res.render('cms/main_layout', { content: "dashboard/home", data: null, role: role });

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
router.get('/logout', Auth.authen, Auth.checkRole, LoginController.logout)
router.use('/foods', Auth.authen, Auth.checkRole, foodmenucheckrole, FoodRouter);
router.use('/menu', Auth.authen, Auth.checkRole, foodmenucheckrole, MenuRouter);


// feedback
router.use('/feedback', FeedbackRouter);


//Thiện
//Trang quan ly nguoidung cua admin
router.use('/quanlynguoidung', Auth.authen, Auth.checkRole, vendorAdminCheckRole, Controller.adminquanlynguoidung);
//Trang them vendor
router.use('/themvendor', Auth.authen, Auth.checkRole, vendorAdminCheckRole, Controller.themvendor);

router.use('/editformvendor', Auth.authen, Auth.checkRole, vendorAdminCheckRole, Controller.editformvendor);

router.use('/editvendor', Auth.authen, Auth.checkRole, vendorAdminCheckRole, Controller.editvendor);
router.use('/vendortable', Auth.authen, Auth.checkRole, vendorAdminCheckRole, Controller.vendortable);
//Xem order cua dau bep
router.use('/order', Auth.authen, Auth.checkRole, checkRoleDauBep,OrderRouter)
//Bảo trì
router.use('/baotri', Auth.checkRole, adminCheckRole,BaotriRouter);
//Quản lý người dùng của admin
router.use('/cmsquanlyuser', Auth.authen, Auth.checkRole, vendorAdminCheckRole, Controller.adminquanlynguoidunguser);

router.use('/bill', BillRouter)
module.exports = router;