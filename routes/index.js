var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var controller = require('../controller/user.controller') //import controller
//Import auth.middleware
var auth = require('../controller/auth.middleware');
//Get from ajax
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json()
var urlencodedParser = bodyParser.urlencoded({ extended: false })

//Fetch
const fetch = require('node-fetch');

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
  res.render('index', { title: 'Express' });
});

/* GET Dang ki page. */
router.get('/dangki', controller.dangki);
/* POST home page. */
router.post('/dangki', controller.xacthucdangki);
//Login
router.get('/dangnhap', controller.dangnhap);
//Xac thuc dang nhap
router.post('/xacthucdangnhap', auth.xacthucdangnhap);
module.exports = router;
