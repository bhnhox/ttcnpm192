var DB = require("../db");

module.exports = 
{
    checkLogin: (req,res) => {
        var sql = `SELECT * FROM user WHERE username = '${req.body.username}' and password = '${req.body.password}'`;
        console.log(sql)
        DB.query(`SELECT * FROM user WHERE username = '${req.body.username}' and password = '${req.body.password}'`,
            function(err,results,fields){
                if (err) throw err
                if (results.length > 0){
                    if (results[0].role>1){
                        req.session.user = results[0];
                        res.redirect('/cms');
                    }
                    else {
                        res.render('cms/login',{notify: "Bạn không có quyền truy cập trang quản trị"});
                    }
                }
                else {
                    res.render('cms/login',{notify: "Tài khoản hoặc mật khẩu không đúng"});
                }
            }
        )
    },
    logout: (req,res)=>{
        req.session.destroy();
        res.redirect('/cms')
    }
}