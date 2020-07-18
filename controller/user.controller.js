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

    //Tim so luong hien tai va so sanh sau do moi add procedure vao

    //var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
    var sql = `select amount from menu_foods where id =  (select  max(id) from menu_foods  where foodid = '${foodID}' );`;
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else {
            console.log("hrere");

            console.log(result);
            if (result[0].amount >= amount) {
                var sql = ` call themspvaogiohang(${foodID},${amount},'${name}');`;
                con.query(sql, function (err, result) {
                    if (err) {
                        console.log(err);

                    } else {
                        console.log(result);
                        res.send("Thêm vào giỏ hàng thành công");
                    }
                })
            } else {
                res.send("Số lượng hiện tại không đủ");

            }
            //case san phan chua duoc them truoc do



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



            var sql = `SELECT chonhang.idmon, chonhang.soluong, menu_foods.amount, foods.price,foods.image,foods.description, idmon as id FROM food_court.chonhang  inner join  foods inner join menu_foods  ON foods.id = chonhang.idmon and  chonhang.idgiohang = ${result[0].id} and menu_foods.menuID = (select max(id) from menu) and menu_foods.foodid =  chonhang.idmon ;`;
            con.query(sql, function (err, result) {
                if (err) {
                    console.log(err);

                } else {

                    console.log(result);
                    res.render('xemgiohang', { title: 'Express', name: name, role: role, data: result, status: "" });

                }
            })


        }
    })
}
//Cap nhat gio hang
module.exports.capnhatgiohang = function async(req, res, next) {
    var name = "";
    var role = "";
    if (req.cookies.info) {
        name = req.cookies.info.username;
        role = req.cookies.info.role;

    }
    var soluong = req.body.soluong;
    soluong = parseInt(soluong);
    console.log(Number.isInteger(soluong));
    //Kiểm tra số lượng món ăn
    if (soluong < 1) {
      return  res.send("Số lượng món ăn phải lớn hơn 0");
    } else if (!Number.isInteger(soluong)) {
      return  res.send("Số lượng món ăn không hợp lệ");
    }
    var id = req.body.id;

    //Kiểm tra số lượng trong stock
    var sql = `select max(id) as id from menu`;
    con.query(sql, async function (err, result) {
        if (err) {
            console.log(err);
            return  res.send("Có lỗi");
        } else {
            let soluonginstock = await new Promise((resolve, reject) => {
                var sql = `select amount from menu_foods where foodid = ${id} and menuid = ${result[0].id};`;
                con.query(sql, async function (err, results, fields) {
                    if (err) throw err;
                    else {
                        return resolve(results[0].amount)
                    }
                })
            });
            if (soluonginstock < soluong) {
                return  res.send("Số lượng món ăn trong quầy không đủ")
            } else {
                var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
                con.query(sql, function (err, result) {
                    if (err) {
                        console.log(err);
                    } else {

                        //case san phan chua duoc them truoc do
                        var sql = `update chonhang set soluong = ${soluong} where idgiohang = ${result[0].id} ;`;
                        con.query(sql, function (err, result) {
                            if (err) {
                                console.log(err);

                            } else {
                                console.log("here");

                              return  res.send("Cập nhật thành công");

                            }
                        })


                    }
                })
            }


        }
       


    })


}
//Xoa san pham trong gio hang
module.exports.xoasanphamtronggiohang = function (req, res, next) {
    var name = "";
    var role = "";
    if (req.cookies.info) {
        name = req.cookies.info.username;
        role = req.cookies.info.role;

    }

    var id = req.body.id;
    var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;
    con.query(sql, function (err, result) {
        if (err) {
            console.log(err);

        } else {


            //case san phan chua duoc them truoc do
            var sql = `delete from  chonhang where idgiohang = ${result[0].id} and idmon = ${id} ;`;
            con.query(sql, function (err, result) {
                if (err) {
                    console.log(err);

                } else {

                    res.send("Xóa  thành công")

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
        id = req.body.id;

    }

    var sql = `select max(idgiohang) as id from giohang where username = '${name}'`;

    con.query(sql, async (err, result, fields) => {
        if (err) throw err;
        else {
            var tongtien = 0, ketquasosanh = [];
            var idgiohang = result[0].id;
            let dulieu = await new Promise((resolve, reject) => {
                var sql = `SELECT chonhang.idmon, chonhang.soluong,foods.vendorowner, foods.price,foods.image,foods.description, foods.title as tenmon, a.amount FROM food_court.chonhang  inner join  foods inner join menu_foods as a ON foods.id = chonhang.idmon and  chonhang.idgiohang = ${idgiohang} and a.foodID =chonhang.idmon and a.menuid = (select max(id) from menu)  ;`;
                con.query(sql, async function (err, results, fields) {
                    console.log(sql);
                    if (err) throw err;
                    else {
                        return resolve(results)
                    }
                })
            });
            dulieu.forEach(element => {
                if (element.soluong > element.amount) {

                    ketquasosanh.push({ idmon: element.idmon, amount: element.tenmon, tenmon: element.amount });

                }
                tongtien += element.price * element.soluong;

            });

            if (tongtien == 0) {
            return    res.send('0');
            }
            if (ketquasosanh.length == 0) { //Toi buoc tinh tien
                let balance = await new Promise((resolve, reject) => {  //Lay so tien hien tai
                    var sql = `select balance from user where username = ('${name}')`;
                    con.query(sql, function (err, result) {
                        if (err) {
                            console.log(err);

                        } else {
                            return resolve(result[0].balance)
                        }
                    })
                });
                if (balance - tongtien < 0) {
                  return  res.send("nem");

                } else {
                    //Bảng xác nhận
                    var tenquay =  await new Promise((resolve, reject) => {  //lấy vendorowner trong giỏ hàng
                        var sql = `SELECT distinct  vendor.tenquay FROM food_court.chonhang  inner join  foods inner join menu_foods  inner join vendor ON foods.id = chonhang.idmon and  chonhang.idgiohang = ${idgiohang} and menu_foods.menuID = (select max(id) from menu) and menu_foods.foodid =  chonhang.idmon where  foods.vendorowner  = vendor.username  ;`;
                        con.query(sql, function (err, result) {
                            if (err) {
                                console.log(err);
    
                            } else {
                                return resolve(result);
                            }
                        })
                    });
                    //Thêm vào bảng đơn hàng
                   
                        
                        var addxacnhan =  await new Promise((resolve, reject) => {  //Thêm vào bảng xác nhận
                            var sql = `insert into donhang(idgiohang) values(${idgiohang});`;
                            con.query(sql, function (err, result) {
                                if (err) {
                                    console.log(err);
        
                                } else {
                                    return resolve(result);
                                }
                            })
                        });
                       

                    
                    tenquay.forEach( async element => {
                        
                        var addxacnhan =  await new Promise((resolve, reject) => {  //Thêm vào bảng xác nhận
                            var sql = `insert into xacnhan(idgiohang, vendorname) values (${idgiohang}, '${element.tenquay}');`;
                            con.query(sql, function (err, result) {
                                if (err) {
                                    console.log(err);
        
                                } else {
                                    return resolve(result);
                                }
                            })
                        });
                       

                    })
                    //Cộng tiền cho vendorowner và thêm vào bảng lịch sử nạp tiền của vendor
                     //Tính tiền từng sản phẩm sau đó add tiền vô tài khoản vendor tương ứng và bảng lịch sử nạp tiền của vendor
                    var infofooods =  await new Promise((resolve, reject) => { 
                        var sql = `SELECT   vendor.tenquay ,chonhang.idmon,chonhang.soluong, foods.price, donhang.idgiohang as donhang  FROM food_court.chonhang  inner join  foods inner join menu_foods  inner join vendor inner join donhang ON foods.id = chonhang.idmon and  chonhang.idgiohang = ${idgiohang} and menu_foods.menuID = (select max(id) from menu) and menu_foods.foodid =  chonhang.idmon and  foods.vendorowner  = vendor.username  and donhang.idgiohang = chonhang.idgiohang;`;  //Lấy thông tin từng sản phẩm của đơn hàng mua tại quầy
                        con.query(sql, function (err, result) {
                            if (err) {
                                console.log(err);
    
                            } else {
                                return resolve(result);
                            }
                        })
                    });
                    console.log(infofooods);
                    infofooods.forEach( async element => { //Thêm vào tài khoản của vendor và bảng lịch sử nạp tiền
                        
                        var addbalance =  await new Promise((resolve, reject) => {  //Thêm vào bảng xác nhận
                            var sql = `update user set balance = balance + ${element.price * element.soluong}  where username = '${element.tenquay}';`;
                            con.query(sql, function (err, result) {
                                if (err) {
                                    console.log(err);
        
                                } else {
                                    return resolve(result);
                                }
                            })
                        });
                       
                        var addlichsu =   await new Promise((resolve, reject) => {  //Thêm vào bảng xác nhận
                            var sql = `insert into lichsunaptienvendor(tenquay, iddonhang, sotien, idfood) values('${element.tenquay}',${element.donhang},${element.soluong*element.price}, ${element.idmon}      ) `;
                            con.query(sql, function (err, result) {
                                if (err) {
                                    console.log(err);
        
                                } else {
                                    return resolve(result);
                                }
                            })
                        });


                    })
                    var sql = `call thanhtoangiohang ('${name}', ${tongtien})`;
                    con.query(sql, function (err, result) {
                        if (err) {
                            console.log(err);

                        } else {
                            //Thêm mới vào bảng Xacnhan. procedure sẽ không có bảng xác nhận nữa.


                            res.send('success');
                        }
                    })

                }

            } else {
                console.log(ketquasosanh);
                res.send(ketquasosanh);

            }




        }
    })



    // var sql = `call thanhtoangiohang('${name}')`;
    // con.query(sql, function (err, result) {
    //     if (err) {
    //         console.log(err);

    //     } else {
    //         res.render('xemgiohang', { title: 'Express', name: name, role: role, data: [], status: "Đặt hàng thành công" });

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
    } else {
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
        } else {
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
    } else {
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
        res.render('adminquanlynguoidung', { role: role });

    } else if (role == "vendor") {
        res.render('vendorquanly', { role: role });

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
                } else {
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
                } else {
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
                } else {
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
            var role = 'daubep';
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
                } else {

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
        } else if (action == 'nhanvien') {
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


        } else if (flag == "nhanvien") {

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
module.exports.xacnhan = async (req, res) => {

    name = req.cookies.info.username;
    role = req.cookies.info.role;
    if (role == "nhanvien") {
        var donhangs = await new Promise((resolve, reject) => {
            con.query(`select xacnhan.id, xacnhan.daubepxacnhan, xacnhan.userxacnhan, xacnhan.quayhangxacnhan, xacnhan.idgiohang  from xacnhan inner join nhanvien inner join daubep on daubep.username = xacnhan.daubepxacnhan and daubep.vendorowner = nhanvien.vendorowner and nhanvien.username = '${name}' and xacnhan.quayhangxacnhan is null;`,
                function (err, results, fields) {
                    if (err) throw err;
                    resolve(results);
                })
        });
        for (let i = 0; i < donhangs.length; i++) {
            donhangs[i].foods = await new Promise((resolve, reject) => {
                con.query(`SELECT * from chonhang inner join  foods on foods.id = chonhang.idmon AND idgiohang = ${donhangs[i].idgiohang}`,
                    function (err, results, fields) {
                        if (err) throw err;
                        resolve(results);
                    })
            })
        }
        // res.send(donhangs);
        res.render('Xacnhan/xacnhancuanhanvien', { title: 'Express', name: name, role: role, data: donhangs, status: "" })
    } else if (role == 'user') {
        var donhangs = await new Promise((resolve, reject) => {
            con.query(`select xacnhan.id, xacnhan.daubepxacnhan, xacnhan.userxacnhan, xacnhan.quayhangxacnhan, xacnhan.idgiohang  from xacnhan  inner join giohang on xacnhan.daubepxacnhan is not null and xacnhan.quayhangxacnhan is not null and giohang.idgiohang = xacnhan.idgiohang and  giohang.username = '${name}' and xacnhan.userxacnhan is null;`,
                function (err, results, fields) {
                    if (err) throw err;
                    resolve(results);
                })
        });
        for (let i = 0; i < donhangs.length; i++) {
            donhangs[i].foods = await new Promise((resolve, reject) => {
                con.query(`SELECT * from chonhang inner join  foods on foods.id = chonhang.idmon AND idgiohang = ${donhangs[i].idgiohang}`,
                    function (err, results, fields) {
                        if (err) throw err;
                        resolve(results);
                    })
            })
        }
        // res.send(donhangs);
        res.render('Xacnhan/xacnhancuanguoidung', { title: 'Express', name: name, role: role, data: donhangs, status: "" })
    } else {
        res.redirect('/')
    }


}
module.exports.quayhangxacnhan = function (req, res) {
    role = req.cookies.info.role;
    var name = req.cookies.info.username;
    if (role == 'nhanvien') {


        con.query(`UPDATE xacnhan SET quayhangxacnhan='${name}' ,timequayhangxacnhan= now() WHERE id=${req.body.id}`,
            function (err, results, fields) {
                if (err) throw err;
                res.send({ status: "success", id: req.body.id });
            })
    } else if (role == 'user') {
        con.query(`UPDATE xacnhan SET userxacnhan='${name}' , timeuserxacnhan= now() WHERE id=${req.body.id}`,
            function (err, results, fields) {
                if (err) throw err;
                res.send({ status: "success", id: req.body.id });
            })
    }
}