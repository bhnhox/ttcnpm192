var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var md5 = require('md5'); //md5

var controller = require('../controller/user.controller') //import controller
//Import auth.middleware
var auth = require('../controller/auth.middleware');
//Get from ajax
var bodyParser = require('body-parser');
const { log } = require('debug');
var jsonParser = bodyParser.json()
var urlencodedParser = bodyParser.urlencoded({ extended: false })
var status="";
//Fetch

//Daytime
var d = new Date();

//DB info
var con = require('../controller/db');



/* GET home page. */
router.get('/', auth.checkMaintainmode,controller.index);

/* POST Them gio hang. */
router.post('/', auth.checkMaintainmode,controller.themvaogiohang);

/* GET Xem gio hang */
router.get('/xemgiohang', auth.checkMaintainmode,controller.xemgiohang);

/* POST Thanh toan gio hang. */
 router.post('/thanhtoan', auth.checkMaintainmode,controller.thanhtoangiohang);


/* GET Dang ki page. */
router.get('/dangki',auth.checkMaintainmode, controller.dangki);
/* POST home page. */
router.post('/dangki',auth.checkMaintainmode, controller.xacthucdangki);
//Login
router.get('/dangnhap',controller.dangnhap);
//Xac thuc dang nhap
router.post('/xacthucdangnhap',auth.xacthucdangnhap);
//Thêm thẻ
router.get('/themthe',auth.checkMaintainmode, auth.authen,controller.themthe);

router.post('/themthe',auth.authen,auth.checkMaintainmode, controller.postthemthe);

//Nạp tiền
router.get('/naptien',auth.authen,auth.checkMaintainmode, controller.naptien);
//Post nap tien
router.post('/naptien',auth.authen, auth.checkMaintainmode,controller.postnaptien )

//Xem so du
router.get('/xemsodu',auth.authen,auth.checkMaintainmode, controller.xemsodu);
//dang xuat
router.get('/dangxuat',auth.checkMaintainmode, controller.logout)
router.get('/test', function ( req,res) {
  var idgiohang = req.body;
  console.log(idgiohang);
var usr = req.cookiesinfo;
console.log(usr);

  res.send("Update success!");
})

router.post('/test', function ( req,res) {
  var idgiohang = req.body;
console.log(idgiohang);
var usr = req.cookies.info;
console.log(usr);
  res.send("Update success!");
})
module.exports = router;


//Đầu bếp, thu ngân xác nhận
router.get('/xacnhan', function ( req,res) {
  var name = req.cookies.info.username;
  var role = req.cookies.info.role;
if(role == 'daubep'){
res.render('Xacnhan/xacnhancuadaubep',{title: 'Express', name: name, role: role, data: "", status:"" })
} else if(role == 'thungan'){
res.render('Xacnhan/xacnhancuathungan',{title: 'Express', name: name, role: role, data: "", status:""} )
} else if(role == 'user'){
res.render('Xacnhan/xacnhancuanguoidung',{title: 'Express', name: name, role: role, data: "", status:""} )
}


  
})