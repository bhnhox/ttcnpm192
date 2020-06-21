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
router.get('/', function(req, res, next) {
  var name = "";
  var role = "";
  if(req.cookies.info.name){
    name = req.cookies.info.name;
    role = req.cookies.info.role;
  }
  res.render('index', { title: 'Express', name : name, role :role });
});

/* GET Dang ki page. */
router.get('/dangki', controller.dangki);
/* POST home page. */
router.post('/dangki', controller.xacthucdangki);
//Login
router.get('/dangnhap', controller.dangnhap);
//Xac thuc dang nhap
router.post('/xacthucdangnhap', auth.xacthucdangnhap);
//Thêm thẻ
router.get('/themthe', auth.authen,controller.themthe);

router.post('/themthe',auth.authen, controller.postthemthe);

//Nạp tiền
router.get('/naptien',auth.authen, controller.naptien);
//Post nap tien
router.post('/naptien',auth.authen, controller.postnaptien )

//dang xuat
router.get('/dangxuat', controller.logout)


module.exports = router;
