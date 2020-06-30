
var md5 = require('md5');
var mysql = require('mysql');
const { log } = require('debug');
var con = mysql.createConnection({
    host: "127.0.0.1",
    user: "ngoctrong102",
    password: "v.n.t.12345",
    database: "food_court"
});
//Get date
var d  = new Date();


//Post xacthucdangnhap
module.exports.xacthucdangnhap = function (req, res, next) {
    var usr = req.body.usr;
    var pass = md5(req.body.pass);
 var sql= `SELECT * FROM user where username = '${usr}' `;
 
con.query(sql, function (err, result, kq) {
    if (err) {
        console.log(err);
        return res.render('dangnhap', { title: 'Express', status: 'Co loi khi dang nhap' });
    }  else {
            if(result[0].password == pass){
                res.cookie('info', { 'username': usr, 'password': pass, 'role': result[0].role });

             //   return res.render('dangnhap', { title: 'Express', status: 'ok' });
                res.redirect('/');
            } else{
                return res.render('dangnhap', { title: 'Express', status: 'Sai username hoac password' });

            }
        

    }
    

})

    
}

//kiem tra dang nhap
module.exports.authen = function (req, res, next) {
    var info = req.cookies.info;


    if (!info) {
        //res.render('dangnhap', { title: 'Express', status: '' });
        
        res.redirect("/dangnhap");
    } else if (info.username) {
        var username = info.username
        var password = info.password;
        console.log("USR la "+username + " pas la "+ password);
        
        var sql = `select * from user where username = '${username}'`;
        con.query(sql, function (err, result, kq) {
            if(err){console.log(err);} else {
                if (username == result[0].username && password == result[0].password) {
                    next();
        
                }
                else {
        
                    res.redirect("/dangnhap")
                }
            }
        
    } )}
    else { res.redirect("/dangnhap") }
}

//Kiem tra bao tri
module.exports.checkMaintainmode = function (req, res, next) {
    var username = "";
    var role = "";
    if(req.cookies.info){
    username = req.cookies.info.username; 
    role = req.cookies.info.role; 
    
} 
    var sql = `SELECT * FROM food_court.baotri where idbaotri  =  (select max( idbaotri) from food_court.baotri   )`;
    con.query(sql, function (err, result, kq) {
        if(err){console.log(err);} else {
            
            if(result[0].trangthai == 'off'){
                next()
                
            } else if(result[0].trangthai == 'on'){
                if(role == 'admin'){
                    console.log("role hien tai la " + role);
                    
                    next()
                } else  {
                    res.render('baotri', {title :'Đang bảo trì'})

                }

                
            } else  {
                    console.log("co loi");
                    
            }
            
        }})

}

//Check role
module.exports.checkRole = function (req, res, next) {

    var role = req.cookies.info.role;
  //var role = "";
    if(role == "admin"){
        next()
    } else {
        res.redirect('/');
    }
}