var DB = require("../db");
module.exports = {
    index: (req, res)=>{
        var sql = '';
        if (req.cookies.info.vendor){
            sql = `SELECT * FROM danhgia WHERE vendorname = '${req.cookies.info.vendor}' ORDER BY id DESC`;
        }
        else sql = `SELECT * FROM danhgia ORDER BY id DESC`
        DB.query(sql , (err, results, fields)=>{
            if (err) throw err;
            if (results){
                var role = req.cookies.info.role;

                res.render('cms/main_layout', { content: "feedback/index", footer: 'foods/footer', data: {fb:results, role:role}, role: role });
            }
        })
    }
}