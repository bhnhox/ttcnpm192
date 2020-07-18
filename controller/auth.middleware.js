var md5 = require('md5');
var mysql = require('mysql');
const { log } = require('debug');
var con = require('./db')
    //Get date
var d = new Date();


//Post xacthucdangnhap
module.exports.xacthucdangnhap = function(req, res, next) {
    var usr = req.body.usr;
    var pass = md5(req.body.pass);
    var sql = `SELECT * FROM user where username = '${usr}' `;

    con.query(sql, async function(err, result, kq) {
        if (err) {
            console.log(err);
            return res.render('dangnhap', { title: 'Express', status: 'Co loi khi dang nhap' });
        } else {
            if (result[0]) {


                if (result[0].password == pass) {
                    var info = {
                        'username': usr,
                        'password': pass,
                        'role': result[0].role
                    };
                    if (info.role == 'daubep' || info.role == 'nhanvien') {

                        info.vendor = await new Promise((resolve, reject) => {
                            con.query(`SELECT * FROM ${info.role} WHERE username = '${usr}'`, (err, results, fields) => {
                                if (err) throw err;
                                if (results) {
                                    resolve(results[0].vendorowner);
                                }
                            })
                        });
                    }
                    if (info.role == 'vendor') info.vendor = usr;
                    res.cookie('info', info);

                    res.redirect('/');
                } else {
                    return res.render('dangnhap', { title: 'Express', status: 'Sai username hoặc password', name: "", role: "" });

                }
            } else {
                return res.render('dangnhap', { title: 'Express', status: 'Sai username hoặc password', name: "", role: "" });

            }


        }


    })


}

//kiem tra dang nhap
module.exports.authen = function(req, res, next) {
    var info = req.cookies.info;


    if (!info) {
        //res.render('dangnhap', { title: 'Express', status: '' });

        res.redirect("/dangnhap");
    } else if (info.username) {
        var username = info.username
        var password = info.password;

        var sql = `select * from user where username = '${username}'`;
        con.query(sql, function(err, result, kq) {
            if (err) { console.log(err); } else {
                if (username == result[0].username && password == result[0].password) {
                    next();

                } else {

                    res.redirect("/dangnhap")
                }
            }

        })
    } else { res.redirect("/dangnhap") }
}

//Kiem tra bao tri
module.exports.checkMaintainmode = function(req, res, next) {
    var username = "";
    var role = "";
    if (req.cookies.info) {
        username = req.cookies.info.username;
        role = req.cookies.info.role;

    }
    var sql = `SELECT * FROM food_court.baotri where idbaotri  =  (select max( idbaotri) from food_court.baotri   )`;
    con.query(sql, function(err, result, kq) {
        if (err) { console.log(err); } else {

            if (result[0].trangthai == 'off') {
                next()

            } else if (result[0].trangthai == 'on') {
                if (role == 'admin') {

                    next()
                } else {
                    res.render('baotri', { title: 'Đang bảo trì' })

                }


            } else {
                console.log("co loi");

            }

        }
    })

}

//Post bật bao tri
module.exports.postbatbaotri = function(req, res, next) {
        username = req.cookie.info.username;
        role = req.cookie.info.role;
        if (role == 'admin') {



            var sql = `insert into baotri (username, trangthai, thoi gian) values( '${username}', 'on','${d}')`;
            con.query(sql, function(err, result, kq) {
                if (err) { console.log(err); } else {
                    console.log('sucess');

                }
            })


        } else {
            res.redirect('/');
        }
    }
    //Post tắt bao tri
module.exports.postbatbaotri = function(req, res, next) {
    username = req.cookie.info.username;
    role = req.cookie.info.role;
    if (role == 'admin') {



        var sql = `insert into baotri (username, trangthai, thoi gian) values( '${username}', 'off','${d}')`;
        con.query(sql, function(err, result, kq) {
            if (err) { console.log(err); } else {
                console.log('sucess');

            }
        })


    } else {
        res.redirect('/');
    }
}


//Check role
module.exports.checkRole = function(req, res, next) {
    var role = "";
    role = req.cookies.info.role;

    if (role == "admin" || role == "vendor" || role == "daubep") {
        next()
    } else {
        res.redirect('/');
    }
}