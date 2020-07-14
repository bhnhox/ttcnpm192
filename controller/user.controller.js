
var md5 = require('md5');
const { log } = require('debug');

//End of Import lowDB
//Date time
var d = new Date();
var mysql = require('mysql');
const { connect } = require('../routes');
var con = require('./db')

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
            var sql = ` call themspvaogiohang(${foodID},${amount},${result[0].id});`;
            // var sql = `insert into chonhang(idmon, soluong, time, idgiohang)values( '${foodID}', '${amount}',DATE(NOW()),'${result[0].id}')`;
            con.query(sql, function (err, result) {
                if (err) {
                    console.log(err);

                } else {


                    res.send("Thêm vào giỏ hàng thành công");

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


                    res.render('xemgiohang', { title: 'Express', name: name, role: role, data: result, status:"" });

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
var sql = `call thanhtoangiohang('${name}')`;
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else { 
   res.render('xemgiohang', { title: 'Express', name: name, role: role, data: [], status:"Đặt hàng thành công" }); 

        } })
    // var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
    // con.query(sql, function (err, result) {
    //     if (err) {
    //         console.log(err);

    //     } else {


    //         var sql = `insert into donhang(idgiohang) values('${result[0].id}')`;
    //         con.query(sql, function (err, result) {
    //             if (err) {

    //                 console.log(err);

    //             } else {




    //                 var sql = `insert into giohang(username) values('${name}')`;
    //                 con.query(sql, function (err, result) {
    //                     if (err) {
    //                         console.log(err);

    //                     } else {

    //                         res.redirect('/');
    //                         //   res.render('xemgiohang', { title: 'Express', name: name, role: role, data: result });

    //                     }
    //                 })


    //             }
    //         })

    //         var sql = `insert into xacnhan(iddonhang) values('${result[0].id}')`;
    //         con.query(sql, function (err, result) {
    //             if (err) {

    //                 console.log(err);

    //             } else {


    //             }
    //         })

    //     }
    // })
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

                return res.render('dangki', { title: 'Express', status: 'Tai khoan da duoc dang ki', name: "", role: "" });

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

    res.render('dangnhap', { title: 'Thêm thẻ', status: '', name: name, role: role });
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

    res.render('themthe', { title: 'Express', status: 'Thêm thẻ', name: name, role: role });
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
            status = "Thêm thẻ thành công"
            res.render('themthe', { title: 'Thêm thẻ', status: status, name: name, role: role });

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

            res.render('naptien', { title: 'Nạp tiền vào tài khoản', status: 'Nạp tiền vào tài khoản', name: name, role: role, card: result });

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
//vao trang quan ly user của admin
module.exports.adminquanlynguoidung = function (req, res) {

    var name = req.cookies.info.username;
    var role = req.cookies.info.role;

    var result = "";
    if (role == "admin") {
        res.render('adminquanlynguoidung', {role:role});

    } else if (role == "vendor") {
        res.render('vendorquanly', {role:role});

    }



}
//Thêm vendor/thungan
module.exports.themvendor = function (req, res) {
    var role = req.cookies.info.role;
    var vendorowner = req.cookies.info.username;
    var name = req.body.flag; 
    console.log(req.body);
    
    if (role == 'admin') {


        var name = req.body.vendorname;
        if (!name) {
            var usr = req.body.username;
            var pass = md5(req.body.password);
            var role = 'thungan';
            var phone = req.body.phone;
            var sql = `INSERT INTO user (username, password,phone,role,ngaydk) VALUES ('${usr}','${pass}','${phone}','${role}',NOW())`;
            con.query(sql, function (err, result, kq) {
                if (err) {
                    if (err.errno != 1062) {
                        console.log(err);
                        res.send('Có lỗi khi đăng kí')

                    } else if (err.errno == 1062) {

                        res.send('Tài khoản đã được đăng kí')

                    } else {
                        console.log(err);

                    }
                }

                else {
                    var sql = `INSERT INTO giohang (username) VALUES ('${usr}')`;
                    con.query(sql, function (err, result, kq) {
                        if (err) { console.log(err); } else {
                            // return res.render('dangnhap', { title: 'Express', status: 'Dang ki thanh cong', name: "", role: "" });
                            var sql = `INSERT INTO thungan (username, ngayvaolam, trangthai) VALUES ('${usr}',NOW(), 'active' )`;
                            con.query(sql, function (err, result, kq) {
                                if (err) { console.log(err); } else {
                                    res.send('Thêm thành công')

                                }
                            })
                        }
                    })


                }

            })
        } else {
            var usr = req.body.username;
            var pass = md5(req.body.password);
            var phone = req.body.phone;
            var name = req.body.vendorname;
            var admin = req.cookies.info.username;
            var role = 'vendor';
            var sql = `INSERT INTO user (username, password,phone,role,ngaydk) VALUES ('${usr}','${pass}','${phone}','${role}',NOW())`;
            con.query(sql, function (err, result, kq) {
                if (err) {
                    if (err.errno != 1062) {
                        console.log(err);
                        res.send('Có lỗi khi đăng kí')

                    } else if (err.errno == 1062) {

                        res.send('Tài khoản đã được đăng kí')

                    } else {
                        console.log(err);

                    }
                }

                else {
                    var sql = `INSERT INTO giohang (username) VALUES ('${usr}')`;
                    con.query(sql, function (err, result, kq) {
                        if (err) { console.log(err); } else {
                            // return res.render('dangnhap', { title: 'Express', status: 'Dang ki thanh cong', name: "", role: "" });
                            var sql = `INSERT INTO vendor (username, tenquay, ngaytao, adminthuchien) VALUES ('${usr}','${name}',NOW(), '${admin}' )`;
                            con.query(sql, function (err, result, kq) {
                                if (err) { console.log(err); } else {
                                    res.send('Thêm thành công')

                                }
                            })
                        }
                    })


                }

            })
        }
    } else if (role == "vendor") {

      //vendorname se la flag
        console.log('them dau bep 1' + name);

        if (name == 'nhanvien') {
            var usr = req.body.username;
            var pass = md5(req.body.password);
            var role = 'nhanvien';
            var phone = req.body.phone;
            var sql = `INSERT INTO user (username, password,phone,role,ngaydk) VALUES ('${usr}','${pass}','${phone}','${role}',NOW())`;
            con.query(sql, function (err, result, kq) {
                if (err) {
                    if (err.errno != 1062) {
                        console.log(err);
                        res.send('Có lỗi khi đăng kí')

                    } else if (err.errno == 1062) {

                        res.send('Tài khoản đã được đăng kí')

                    } else {
                        console.log(err);

                    }
                }

                else {
                    var sql = `INSERT INTO giohang (username) VALUES ('${usr}')`;
                    con.query(sql, function (err, result, kq) {
                        if (err) { console.log(err); } else {
                            // return res.render('dangnhap', { title: 'Express', status: 'Dang ki thanh cong', name: "", role: "" });
                            var sql = `INSERT INTO nhanvien (username, ngayvaolam, trangthai, vendorowner) VALUES ('${usr}',NOW(), 'active','${vendorowner}' )`;
                            con.query(sql, function (err, result, kq) {
                                if (err) { console.log(err); } else {
                                    res.send('Thêm thành công')

                                }
                            })
                        }
                    })


                }

            })
        } else if (name == 'daubep') {
            
            var usr = req.body.username;
            var pass = md5(req.body.password);
            var role = 'nhanvien';
            var phone = req.body.phone;
            var sql = `INSERT INTO user (username, password,phone,role,ngaydk) VALUES ('${usr}','${pass}','${phone}','${role}',NOW())`;
            con.query(sql, function (err, result, kq) {
                if (err) {
                    if (err.errno != 1062) {
                        console.log(err);
                        res.send('Có lỗi khi đăng kí')

                    } else if (err.errno == 1062) {

                        res.send('Tài khoản đã được đăng kí')

                    } else {
                        console.log(err);

                    }
                }

                else {

                    var sql = `INSERT INTO giohang (username) VALUES ('${usr}')`;
                    con.query(sql, function (err, result, kq) {
                        if (err) { console.log(err); } else {
                            // return res.render('dangnhap', { title: 'Express', status: 'Dang ki thanh cong', name: "", role: "" });
                            var sql = `INSERT INTO daubep (username, ngayvaolam, trangthai, vendorowner) VALUES ('${usr}',NOW(), 'active','${vendorowner}' )`;
                            con.query(sql, function (err, result, kq) {
                                if (err) { console.log(err); } else {
                                    res.send('Thêm thành công')

                                }
                            })
                        }
                    })


                }

            })
        }
    }
}
//Get vendor/thungan form input
module.exports.editformvendor = function (req, res) {

    var name = req.cookies.info.username;
    var role = req.cookies.info.role;
    if (role == 'admin') {
        var username = req.body.username;
        var action = req.body.action;
        console.log(req.body);

        if (action == 'vendor') {
            var sql = `Select * from vendor where username = '${username}' `;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send(result[0]);

                }
            })
        } else {
            var sql = `Select * from thungan where username = '${username}' `;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send(result[0]);

                }
            })
        }
    } else if (role == "vendor") {
        var username = req.body.username;
        var action = req.body.action;
        console.log(req.body);

        if (action == 'daubep') {
            var sql = `Select * from daubep where username = '${username}' `;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send(result[0]);

                }
            })
        } else if (action == 'nhanvien')  {
            var sql = `Select * from nhanvien where username = '${username}' `;
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send(result[0]);

                }
            })
        }
    }
}
//Post edit vendor /thu ngan
module.exports.editvendor = function (req, res) {
    var action = req.body.tenquay;
    var name = req.cookies.info.username;
    var role = req.cookies.info.role;

    if (role == 'admin') {


        if (!action) {

            var trangthai = req.body.trangthai;
            var username = req.body.username;
            console.log(req.body);

            console.log("usr la " + username);

            if (trangthai == 'active') {
                console.log("submit thu ngan active");

                sql = `UPDATE thungan SET trangthai = 'active',ngaynghiviec = NULL  WHERE username = '${username}'; `;

            } else {
                console.log("submit thu ngan inactive co usr la " + username);

                sql = `UPDATE thungan SET trangthai = 'inactive',ngaynghiviec = NOW()  WHERE username = '${username}'; `;

            }
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send('Cập nhật thành công')

                }
            })


        } else {

            console.log("submit vendor");

            var name = req.cookies.info.username;
            var usernamevendor = req.body.usernamevendor;
            var tenquay = req.body.tenquay;
            var trangthai = req.body.trangthai;
            var id = req.body.id;
            console.log(trangthai);

            var sql;
            if (trangthai == 'inactive') {
                sql = `UPDATE vendor SET username = '${usernamevendor}',tenquay = '${tenquay}',adminthuchien = '${name}',trangthai = 'inactive',ngaydong = NOW()  WHERE id = '${id}'; `;

            } else {
                sql = `UPDATE vendor SET username = '${usernamevendor}',tenquay = '${tenquay}',adminthuchien = '${name}',trangthai = 'active',ngaydong = NULL  WHERE id = '${id}'; `;

            }
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send('Cập nhật thành công')

                }
            })

        }
    } else if (role == "vendor") {
        var flag = req.body.flag;
        console.log(req.body);

        if (flag == "daubep") {

            var trangthai = req.body.trangthai;
            var username = req.body.username;
            console.log(req.body);

            console.log("usr la " + username);

            if (trangthai == 'active') {
                console.log("submit daubep active");

                sql = `UPDATE daubep SET trangthai = 'active',ngaynghiviec = NULL  WHERE username = '${username}'; `;

            } else {
                console.log("submit daubep inactive co usr la " + username);

                sql = `UPDATE daubep SET trangthai = 'inactive',ngaynghiviec = NOW()  WHERE username = '${username}'; `;

            }
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send('Cập nhật thành công')

                }
            })


        } else  if (flag == "nhanvien") {

            console.log("submit nhanvien");

            var trangthai = req.body.trangthai;
            var username = req.body.username;
            console.log(req.body);

            console.log("usr la " + username);

            if (trangthai == 'active') {
                console.log("submit nhanvien active");

                sql = `UPDATE nhanvien SET trangthai = 'active',ngaynghiviec = NULL  WHERE username = '${username}'; `;

            } else {
                console.log("submit nhanvien inactive co usr la " + username);

                sql = `UPDATE nhanvien SET trangthai = 'inactive',ngaynghiviec = NOW()  WHERE username = '${username}'; `;

            }
            con.query(sql, function (err, result, kq) {
                if (err) { console.log(err); } else {

                    res.send('Cập nhật thành công')

                }
            })

        }
    }
}
//Get vendor table
module.exports.vendortable = function (req, res) {
    var name = req.cookies.info.username;
    var role = req.cookies.info.role;
    
    if (role == 'admin') {


        var action = req.body.action;
        console.log(action);

        if (action == "vendor") {
            var sql = `Select * from vendor `;
            con.query(sql, function (err, result) {
                if (err) { console.log(err); } else {

                    res.send(result);

                }
            })
        } else if (action == 'thungan') {

            var sql = `Select * from thungan `;
            con.query(sql, function (err, result) {
                if (err) { console.log(err); } else {

                    res.send(result);

                }
            })
        }
    } else if (role == "vendor") {
        var action = req.body.action;
        console.log(action);

        if (action == "daubep") {
            var sql = `Select * from daubep where vendorowner = '${name}' `;
            con.query(sql, function (err, result) {
                if (err) { console.log(err); } else {

                    res.send(result);

                }
            })
        } else if (action == 'nhanvien') {

            var sql = `Select * from nhanvien where vendorowner = '${name}' `;
            con.query(sql, function (err, result) {
                if (err) { console.log(err); } else {

                    res.send(result);

                }
            })
        }
    }
}