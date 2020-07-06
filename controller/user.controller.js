
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
var d  = new Date();


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
        if(err){
            if (err.errno != 1062 ) {
                console.log(err.errno);
                return res.render('dangki', { title: 'Express', status: 'Co loi khi dang ki' });
    
    
            } else if(err.errno == 1062){
                console.log(err);
                
                return res.render('dangnhap', { title: 'Express', status: 'Tai khoan da duoc dang ki' });
    
            }  else {
                console.log(err);
                
            }
        }
        
        else {
            return res.render('dangnhap', { title: 'Express', status: 'Dang ki thanh cong' });

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
module.exports.themthe = function(req,res){

    var name = req.cookies.info.username;
    var role = req.cookies.info.role;
  
    res.render('themthe',{ title: 'Express', status: '', name: name, role: role });
  }
//Post them the
module.exports.postthemthe = function(req,res){

    var name = req.cookies.info.username;
    var namecard = req.body.namecard;
    var idcard = req.body.idbankcard;
    var bankname = req.body.bankname;
    var role = req.cookies.info.role;
  
    var sql = `INSERT INTO card (namecard, bankname,usernameowner,timecreate,idbankcard) VALUES ('${namecard}','${bankname}','${name}','${d}','${idcard}')`;
      con.query(sql, function (err, result, kq) {
          if(err){console.log(err);} else {
              status="success"
            res.render('themthe',{ title: 'Express', status: status, name: name, role: role });
  
          }
        })
  
  }
//Get nap tien
module.exports.naptien = function(req,res){

    var name = req.cookies.info.username;
    var role = req.cookies.info.role;
  
    var sql = `Select * from card where usernameowner = '${name}'`;
    con.query(sql, function (err, result, kq) {
        if(err){console.log(err);} else {
          
            res.render('naptien',{ title: 'Express', status: '', name: name, role: role , card :result});
  
        }
      })
  }
//Post nap tien
module.exports.postnaptien = function(req,res){
    var role = req.cookies.info.role;
  
    var name = req.cookies.info.username;
    var amount = req.body.amount;
    var idcard = req.body.idbankcard;
    var password = md5(req.body.password);
  
      var sql = `select * from user where username = '${name}'`;

      con.query(sql, function (err, result, kq) {
          if(err){console.log(err);
            res.render('naptien',{ title: 'Express', status: 'Có lỗi trong quá trình xử lý', name: name, role: role , card :result});
  
          } else {
           if(result[0].password == password){
               console.log(result);
               
             var sql = `insert into deposit(amount, time, status, idcard,username ) values ('${amount}','${d}','success','${idcard}','${name}' )`;
             con.query(sql, function (err, result, kq) {
                if(err){console.log(err);
                  res.render('naptien',{ title: 'Express', status: 'Có lỗi trong quá trình xử lý', name: name, role: role , card :result});
        
                } else {
                    var sql = `Select * from card where usernameowner = '${name}'`;
                    con.query(sql, function (err, result, kq) {
                        if(err){console.log(err);} else {
                          
                            res.render('naptien',{ title: 'Express', status: 'Nap tien thanh cong', name: name, role: role , card :result});
                  
                        }
                      }) 
                }})
  
           } else if(result.password[0] != password) {
            
  
            res.render('naptien',{ title: 'Express', status: 'Sai mật khẩu', name: name, role: role , card :result});
  
           } else {
            res.render('naptien',{ title: 'Express', status: 'Có lỗi trong quá trình xử lý', name: name, role: role , card :result});
  
           }
  
          }
        })
  
  };
