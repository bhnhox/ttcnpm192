
var md5 = require('md5');
const { log } = require('debug');

//End of Import lowDB
//Date time
var d = new Date();
var mysql = require('mysql');
const { connect } = require('../routes');
var con = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "admin123",
    port: "3306",
    database: "food_court"
});

//Get date
var d = new Date();
//Index
module.exports.index = function (req, res, next) {
    var name = "";
    var role = "";
    if (req.cookies.info) {
        name = req.cookies.info.username;
        role = req.cookies.info.role;

    }
    var sql = `SELECT *, menu_foods.id AS id from menu_foods INNER JOIN foods ON menu_foods.foodID = foods.id AND menu_foods.trash = 0 AND  menu_foods.menuID= (select max(id) from menu);`
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else {
            res.render('index', { title: 'Express', name: name, role: role, data: result });

        }
    })
}

//Them vao gio hang
module.exports.themvaogiohang = function (req, res, next) {
    var name = "";
    var role = "";
    if (req.cookies.info) {
        name = req.cookies.info.username;
        role = req.cookies.info.role;

    }
    var foodID = req.body.idfood;
    var amount = req.body.amount;
    var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else {


            //case san phan chua duoc them truoc do
            var sql = `insert into chonhang(idmon, soluong, time, idgiohang)values( '${foodID}', '${amount}',DATE(NOW()),'${result[0].id}')`;
            con.query(sql, function (err, result) {
                if (err) {
                    console.log(err);

                } else {


                    res.redirect('/');

                }
            })


        }
    })
}


//Them vao gio hang
module.exports.xemgiohang = function (req, res, next) {
    var name = "";
    var role = "";
    if (req.cookies.info) {
        name = req.cookies.info.username;
        role = req.cookies.info.role;

    }

    var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else {


            //case san phan chua duoc them truoc do
            var sql = `SELECT chonhang.idmon, chonhang.soluong, foods.price,foods.image,foods.description, idmon as id FROM food_court.chonhang  inner join  foods ON foods.id = chonhang.idmon and  chonhang.idgiohang = '${result[0].id}';`;
            con.query(sql, function (err, result) {
                if (err) {
                    console.log(err);

                } else {


                    res.render('xemgiohang', { title: 'Express', name: name, role: role, data: result });

                }
            })


        }
    })
}
//Thanh toán giỏ hàng
module.exports.thanhtoangiohang = function (req, res, next) {
    var name = "";
    var role = "";
    if (req.cookies.info) {
        name = req.cookies.info.username;
        role = req.cookies.info.role;

    }

    var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else {


            var sql = `insert into donhang(idgiohang) values('${result[0].id}')`;
            con.query(sql, function (err, result) {
                if (err) {

                    console.log(err);

                } else {
                    var sql = `insert into giohang(username) values('${name}')`;
                    con.query(sql, function (err, result) {
                        if (err) {
                            console.log(err);

                        } else {

                            res.redirect('/');
                         //   res.render('xemgiohang', { title: 'Express', name: name, role: role, data: result });

                        }
                    })


                }
            })
            var sql = `insert into xacnhan(iddonhang) values('${result[0].id}')`;
            con.query(sql, function (err, result) {
                if (err) {

                    console.log(err);

                } else {


                } })

        }
    })
}
        //Dang ki
        module.exports.dangki = function (req, res) {
            var name;
            if (req.cookies.info) {
                if (req.cookies.info.username) {
                    name = req.cookies.info.username;
                } else {
                    name = "";
                }
            }
            else {
                name = "";

            }
            res.render('dangki', { title: 'Express', status: '', name: name, role: "" });
        }



        module.exports.xacthucdangki = function (req, res) {
            var usr = req.body.usr;
            var pass = md5(req.body.pass);
            var phone = req.body.phone;
            var role = req.body.role;
            var ngaydk = d;
            var sql = `INSERT INTO user (username, password,phone,role,ngaydk) VALUES ('${usr}','${pass}','${phone}','${role}','${ngaydk}')`;
            con.query(sql, function (err, result, kq) {
                if (err) {
                    if (err.errno != 1062) {
                        console.log(err);
                        return res.render('dangki', { title: 'Express', status: 'Co loi khi dang ki', name: "", role: "" });


                    } else if (err.errno == 1062) {
                        console.log(err);

                        return res.render('dangnhap', { title: 'Express', status: 'Tai khoan da duoc dang ki', name: "", role: "" });

                    } else {
                        console.log(err);

                    }
                }

                else {
                    var sql = `INSERT INTO giohang (username) VALUES ('${usr}')`;
                    con.query(sql, function (err, result, kq) {
                        if (err) { console.log(err); } else {
                            return res.render('dangnhap', { title: 'Express', status: 'Dang ki thanh cong', name: "", role: "" });

                        }
                    })


                }

            })
            //Thêm thẻ
            module.exports.themthe = function (req, res) {




            }



        }




        // res.render('dangki', { title: 'Express', status: 'Tai khoan da duoc dang ki' });





        module.exports.dangnhap = function (req, res, next) {
            var name, role;
            if (req.cookies.info) {
                if (req.cookies.info.username) {
                    name = req.cookies.info.username;
                    role = req.cookies.info.role;


                } else {
                    name = "";
                    role = "";
                }
            }
            else {
                name = "";
                role = "";
            }

            res.render('dangnhap', { title: 'Express', status: '', name: name, role: role });
        }

        //Dang xuat
        //Logout
        module.exports.logout = function (req, res, next) {
            //    res.cookie('info',{'username':usr, 'password':pass});

            res.cookie('info', { expires: Date.now() });
            res.redirect('/');
        }
        //Them the
        module.exports.themthe = function (req, res) {

            var name = req.cookies.info.username;
            var role = req.cookies.info.role;

            res.render('themthe', { title: 'Express', status: '', name: name, role: role });
        }
        //Post them the
        module.exports.postthemthe = function (req, res) {

            var name = req.cookies.info.username;
            var namecard = req.body.namecard;
            var idcard = req.body.idbankcard;
            var bankname = req.body.bankname;
            var role = req.cookies.info.role;

            var sql = `INSERT INTO card (namecard, bankname,usernameowner,timecreate,idbankcard) VALUES ('${namecard}','${bankname}','${name}','${d}','${idcard}')`;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {
                    status = "success"
                    res.render('themthe', { title: 'Express', status: status, name: name, role: role });

                }
            })

        }

        //Get nap tien
        module.exports.naptien = function (req, res) {

            var name = req.cookies.info.username;
            var role = req.cookies.info.role;

            var sql = `Select * from card where usernameowner = '${name}'`;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.render('naptien', { title: 'Express', status: '', name: name, role: role, card: result });

                }
            })
        }
        //Post nap tien
        module.exports.postnaptien = function (req, res) {
            var role = req.cookies.info.role;

            var name = req.cookies.info.username;
            var amount = req.body.amount;
            var idcard = req.body.idbankcard;
            var password = md5(req.body.password);

            var sql = `select * from user where username = '${name}'`;

            con.query(sql, function (err, result, kq) {
                if (err) {
                    console.log(err);
                    res.render('naptien', { title: 'Express', status: 'Có lỗi trong quá trình xử lý', name: name, role: role, card: result });

                } else {
                    if (result[0].password == password) {
                        console.log(result);

                        var sql = `insert into deposit(amount, time, status, idcard,username ) values ('${amount}','${d}','success','${idcard}','${name}' ); `;
                        con.query(sql, function (err, result, kq) {
                            if (err) {
                                console.log(err);
                                res.render('naptien', { title: 'Express', status: 'Có lỗi trong quá trình xử lý', name: name, role: role, card: result });

                            } else {
                                var sql = ` update user set balance = balance + ${amount} where username = '${name}';`;
                                con.query(sql, function (err, result, kq) {
                                    if (err) { console.log(err); } else {
                                        var sql = `Select * from card where usernameowner = '${name}'`;
                                        con.query(sql, function (err, result, kq) {
                                            if (err) { console.log(err); } else {


                                                res.render('naptien', { title: 'Express', status: 'Nap tien thanh cong', name: name, role: role, card: result });

                                            }
                                        })
                                    }
                                })

                            }
                        })

                    } else if (result.password[0] != password) {


                        res.render('naptien', { title: 'Express', status: 'Sai mật khẩu', name: name, role: role, card: result });

                    } else {
                        res.render('naptien', { title: 'Express', status: 'Có lỗi trong quá trình xử lý', name: name, role: role, card: result });

                    }

                }
            })

        };
        //Get xem so du
        module.exports.xemsodu = function (req, res) {

            var name = req.cookies.info.username;
            var role = req.cookies.info.role;

            var sql = `Select * from user where username = '${name}'`;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.render('xemsodu', { title: 'Express', status: '', name: name, role: role, sodu: result[0].balance });

                }
            })
        }