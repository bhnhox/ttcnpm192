var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var md5 = require('md5'); //md5
var con = require('../controller/db')
var controller = require('../controller/user.controller') //import controller
//Import auth.middleware
var auth = require('../controller/auth.middleware');
//Get from ajax
var bodyParser = require('body-parser');
const { log } = require('debug');
var jsonParser = bodyParser.json()
var urlencodedParser = bodyParser.urlencoded({ extended: false })
var status = "";
//Fetch
function sortObject(o) {
    var sorted = {},
        key, a = [];

    for (key in o) {
        if (o.hasOwnProperty(key)) {
            a.push(key);
        }
    }

    a.sort();

    for (key = 0; key < a.length; key++) {
        sorted[a[key]] = o[a[key]];
    }
    return sorted;
}

//Daytime
var d = new Date();




/* GET home page. */
router.get('/', auth.checkMaintainmode, controller.index);

/* POST Them gio hang. */
router.post('/', auth.checkMaintainmode, controller.themvaogiohang);

/* GET Xem gio hang */
router.get('/xemgiohang', auth.checkMaintainmode, controller.xemgiohang);
/* Use Cap nhat gio hang */
router.use('/capnhatgiohang', auth.checkMaintainmode, controller.capnhatgiohang);
/* Use Xoa san pham gio hang */
router.use('/xoasanphamtronggiohang', auth.checkMaintainmode, controller.xoasanphamtronggiohang);




/* POST Thanh toan gio hang. */
router.post('/thanhtoan', auth.checkMaintainmode, controller.thanhtoangiohang);


/* GET Dang ki page. */
router.get('/dangki', auth.checkMaintainmode, controller.dangki);
/* POST home page. */
router.post('/dangki', auth.checkMaintainmode, controller.xacthucdangki);
//Login
router.get('/dangnhap', controller.dangnhap);
//Xac thuc dang nhap
router.post('/xacthucdangnhap', auth.xacthucdangnhap);
//Thêm thẻ
router.get('/themthe', auth.checkMaintainmode, auth.authen, controller.themthe);

router.post('/themthe', auth.authen, auth.checkMaintainmode, controller.postthemthe);
//Lich su Nạp tiền
router.get('/lichsunaptien', auth.authen, auth.checkMaintainmode, controller.lichsunaptien);
//Lich su Nạp tiền qua the
router.use('/lichsunaptienquathe', auth.authen, auth.checkMaintainmode, controller.lichsunaptienquathe);
//Lich su Nạp tiền qua vnpay
router.use('/lichsunaptienquavnpay', auth.authen, auth.checkMaintainmode, controller.lichsunaptienquavnpay);
//Nạp tiền
router.get('/naptien', auth.authen, auth.checkMaintainmode, controller.naptien);
//Nạp tiền thành công
router.get('/naptienthanhcong', auth.authen, auth.checkMaintainmode, controller.naptienthanhcong);
//Nạp tiền thất bại
router.get('/naptienthatbai', auth.authen, auth.checkMaintainmode, controller.naptienthatbai);
//Lich su dang hang
router.get('/lichsudathang', auth.authen, auth.checkMaintainmode, controller.lichsudathang);
//Post nap tien
router.post('/postnaptien', auth.authen, auth.checkMaintainmode, controller.postnaptien)

//Xem so du
router.get('/xemsodu', auth.authen, auth.checkMaintainmode, controller.xemsodu);
//dang xuat
router.get('/dangxuat', auth.checkMaintainmode, controller.logout)
router.get('/test', function (req, res) {
    var idgiohang = req.body;
    console.log(idgiohang);
    var usr = req.cookiesinfo;
    console.log(usr);

    res.send("Update success!");
})
// Nạp tiền bằng vnpay
router.post('/naptienvnpay', function (req, res) {
    var amount = req.body.amount;
    //Qua trang sandbox VNPAY

    var ipAddr = req.headers['x-forwarded-for'] ||
        req.connection.remoteAddress ||
        req.socket.remoteAddress ||
        req.connection.socket.remoteAddress;

    var config = require('config');
    var dateFormat = require('dateformat');


    var tmnCode = config.get('vnp_TmnCode');
    var secretKey = config.get('vnp_HashSecret');
    var vnpUrl = config.get('vnp_Url');
    var returnUrl = config.get('vnp_ReturnUrl');

    var date = new Date();

    var createDate = dateFormat(date, 'yyyymmddHHmmss');
    var orderId = dateFormat(date, 'HHmmss');
    //Thông tin cần cho thanh toán
    var amount = req.body.amount;;  //Số tiền
    var bankCode = '';  //Mã thẻ

    var orderInfo = "Nap tien vao tai khoan "; //Thông tin order
    var orderType = 'billpayment';  //Loại order
    var locale = 'vn';  //Ngôn ngữ
    if (locale === null || locale === '') {
        locale = 'vn';
    }
    var currCode = 'VND';
    var vnp_Params = {};
    vnp_Params['vnp_Version'] = '2';
    vnp_Params['vnp_Command'] = 'pay';
    vnp_Params['vnp_TmnCode'] = tmnCode;
    // vnp_Params['vnp_Merchant'] = ''
    vnp_Params['vnp_Locale'] = locale;
    vnp_Params['vnp_CurrCode'] = currCode;
    vnp_Params['vnp_TxnRef'] = orderId;
    vnp_Params['vnp_OrderInfo'] = orderInfo;
    vnp_Params['vnp_OrderType'] = orderType;
    vnp_Params['vnp_Amount'] = amount * 100;
    vnp_Params['vnp_ReturnUrl'] = returnUrl;
    vnp_Params['vnp_IpAddr'] = ipAddr;
    vnp_Params['vnp_CreateDate'] = createDate;
    if (bankCode !== null && bankCode !== '') {
        vnp_Params['vnp_BankCode'] = bankCode;
    }

    vnp_Params = sortObject(vnp_Params);

    var querystring = require('qs');
    var signData = secretKey + querystring.stringify(vnp_Params, { encode: false });

    var sha256 = require('sha256');

    var secureHash = sha256(signData);

    vnp_Params['vnp_SecureHashType'] = 'SHA256';
    vnp_Params['vnp_SecureHash'] = secureHash;
    vnpUrl += '?' + querystring.stringify(vnp_Params, { encode: true });

    //Neu muon dung Redirect thi dong dong ben duoi
    // res.status(200).json({code: '00', data: vnpUrl})
    //Neu muon dung Redirect thi mo dong ben duoi va dong dong ben tren

    //Tạo hóa đơn với trạng thái chưa thanh toán
    //start

    var thanhtien = req.body.thanhtien;
    var soluongdat = req.body.soluongdat;
    // var thoigian = d.getDate() + "-" + d.getMonth() + "-" + d.getFullYear() + "-" + d.getHours() + "h" + d.getMinutes() + "p";
    var thoigian = d;






    //end;

    res.redirect(vnpUrl)
    //End qua trang sandbox
    
})
//Payment
router.get('/vnpay_return', function (req, res, next) {
    var vnp_Params = req.query;

    var secureHash = vnp_Params['vnp_SecureHash'];

    delete vnp_Params['vnp_SecureHash'];
    delete vnp_Params['vnp_SecureHashType'];

    vnp_Params = sortObject(vnp_Params);

    var config = require('config');
    var tmnCode = config.get('vnp_TmnCode');
    var secretKey = config.get('vnp_HashSecret');

    var querystring = require('qs');
    var signData = secretKey + querystring.stringify(vnp_Params, { encode: false });

    var sha256 = require('sha256');

    var checkSum = sha256(signData);
    var amount = (vnp_Params.vnp_Amount)/100;
    var transNo = (vnp_Params.vnp_TransactionNo);
    if (transNo == 0) {
        // res.render('error',{message: "Giao dịch thất bại"});
       // res.redirect('naptienthatbai')

       
        //res.render('naptien', { title: 'Express', find: find, listsp: mathang, name: name, role: role, idhoadon: idHoaDon });
    }
    if (secureHash === checkSum && transNo != 0 ) {

        //Kiem tra xem du lieu trong db co hop le hay khong va thong bao ket qua

        //    var hoaDon = db.get("HoaDon").find({ idhoadon: idHoaDon }).value();


        // hoaDon.trangthai='dathanhtoan';
        //  console.log(hoaDon);
        //Luu thong tin vào db

        //Get data đe render trang thongtinhoadon

        var name = "";
        var role = "";

        if (req.cookies.info) {
            if (req.cookies.info.username) {
                name = req.cookies.info.username;
            }
            if (req.cookies.info.role) {
                role = req.cookies.info.role;
            }
        }
        var sql = `insert into vnpay(username, time, amount, transNo) values ('${name}', now(), ${amount},${transNo})`;
        con.query(sql, function (err, result, kq) {
            if (err) { console.log(err); } else {

                var sql = `update user set  balance = balance + ${amount} where username = '${name}'`;
                con.query(sql, function (err, result, kq) {
                    if (err) { console.log(err); } else {
                        res.redirect('naptienthanhcong')
                    }
                })
                           }
        })
       

    } else {
        var name = "";
        var role = "";

        if (req.cookies.info) {
            if (req.cookies.info.username) {
                name = req.cookies.info.username;
            }
            if (req.cookies.info.role) {
                role = req.cookies.info.role;
            }
        }
        var sql = `Select * from card where usernameowner = '${name}'`;
        con.query(sql, function (err, result, kq) {
            if (err) { console.log(err); } else {
    
                res.redirect('naptienthatbai')
    
            }
        })
    }
});

router.get('/vnpay_ipn', function (req, res, next) {
    var vnp_Params = req.query;
    var secureHash = vnp_Params['vnp_SecureHash'];

    delete vnp_Params['vnp_SecureHash'];
    delete vnp_Params['vnp_SecureHashType'];

    vnp_Params = sortObject(vnp_Params);
    var config = require('config');
    var secretKey = config.get('vnp_HashSecret');
    var querystring = require('qs');
    var signData = secretKey + querystring.stringify(vnp_Params, { encode: false });

    var sha256 = require('sha256');

    var checkSum = sha256(signData);

    if (secureHash === checkSum) {
        var orderId = vnp_Params['vnp_TxnRef'];
        var rspCode = vnp_Params['vnp_ResponseCode'];
        //Kiem tra du lieu co hop le khong, cap nhat trang thai don hang va gui ket qua cho VNPAY theo dinh dang duoi
        res.status(200).json({ RspCode: '00', Message: 'success' })
    }
    else {
        res.status(200).json({ RspCode: '97', Message: 'Fail checksum' })
    }
});
router.post('/test', function (req, res) {
    var idgiohang = req.body;
    console.log(idgiohang);
    var usr = req.cookies.info;
    console.log(usr);
    res.send("Update success!");
})
module.exports = router;


//Đầu bếp, thu ngân xác nhận
router.get('/xacnhan', auth.authen, auth.checkMaintainmode, controller.xacnhan);
//Use quay hang xac nhan
router.use('/quayhangxacnhan', auth.authen, auth.checkMaintainmode, controller.quayhangxacnhan);
//Admin đăng kí bên trang cms
router.use('/admindangki', auth.authen, auth.checkMaintainmode, controller.admindangki);
//Sửa người dùng
router.use('/suauser', auth.authen, auth.checkMaintainmode, controller.suauser);

//Sửa người dùng
router.use('/xacnhansuausr', auth.authen, auth.checkMaintainmode, controller.xacnhansuausr);
//Xóa người dùng
router.use('/xoausrcms', auth.authen, auth.checkMaintainmode, controller.xoausrcms);
//Tìm kiếm người dùng cms - admin
router.post('/searchusercms', auth.authen, auth.checkMaintainmode, controller.searchusercms);
//Đánh giá
router.use('/danhgia', auth.authen, auth.checkMaintainmode, controller.danhgia);
//Post giá
router.use('/postreview', auth.authen, auth.checkMaintainmode, controller.postreview);
// xem đơn hàng
router.use('/donhang', controller.donhang)