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
var con = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "admin123",
  port: "3306",
  database: "food_court"
});



/* GET home page. */
router.get('/', auth.checkMaintainmode,function(req, res, next) {
  var name = "";
  var role = "";
  if(req.cookies.info){
    name = req.cookies.info.username;
    role = req.cookies.info.role;
    console.log("here");
    
  }
  res.render('index', { title: 'Express', name : name, role :role });
});

/* GET Dang ki page. */
router.get('/dangki',auth.checkMaintainmode, controller.dangki);
/* POST home page. */
router.post('/dangki',auth.checkMaintainmode, controller.xacthucdangki);
//Login
router.get('/dangnhap', auth.checkMaintainmode,controller.dangnhap);
//Xac thuc dang nhap
router.post('/xacthucdangnhap',auth.checkMaintainmode,auth.xacthucdangnhap);
//Thêm thẻ
router.get('/themthe',auth.checkMaintainmode, auth.authen,controller.themthe);

router.post('/themthe',auth.authen,auth.checkMaintainmode, controller.postthemthe);

//Nạp tiền
router.get('/naptien',auth.authen,auth.checkMaintainmode, controller.naptien);
//Post nap tien
router.post('/naptien',auth.authen, auth.checkMaintainmode,controller.postnaptien )

//dang xuat
router.get('/dangxuat',auth.checkMaintainmode, controller.logout)


module.exports = router;
