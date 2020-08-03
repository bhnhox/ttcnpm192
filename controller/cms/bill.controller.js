var DB = require("../db");
module.exports = {
    index: async (req, res) => {
        var donhangs = await new Promise((resolve, reject) => {
            var sql = '';
            if (req.cookies.info.vendor) {
                sql = `SELECT xacnhan.id , xacnhan.idgiohang, donhang.id as iddonhang FROM xacnhan inner join donhang on daubepxacnhan is not null AND vendorname = '${req.cookies.info.vendor}' and quayhangxacnhan is not null  and donhang.idgiohang = xacnhan.idgiohang;`
            }
            else {
                sql = `SELECT xacnhan.id , xacnhan.idgiohang, donhang.id as iddonhang FROM xacnhan inner join donhang on daubepxacnhan is not null and quayhangxacnhan is not null  and donhang.idgiohang = xacnhan.idgiohang;`
            }
            DB.query(sql,
                function (err, results, fields) {
                    if (err) throw err;
                    resolve(results);
                })
        });
        for (let i = 0; i < donhangs.length; i++) {
            donhangs[i].foods = await new Promise((resolve, reject) => {
                var sql = '';
                if (req.cookies.info.vendor) {
                    sql = `SELECT * from chonhang inner join foods on foods.id = chonhang.idmon AND idgiohang = ${donhangs[i].idgiohang} AND foods.vendorowner = '${req.cookies.info.vendor}'`;
                }
                else {
                    sql = `SELECT * from chonhang inner join foods on foods.id = chonhang.idmon AND idgiohang = ${donhangs[i].idgiohang}`
                }
                DB.query(sql,
                    function (err, results, fields) {
                        if (err) throw err;
                        resolve(results);
                    })
            })
            donhangs[i].username = await new Promise((res, rej) => {
                DB.query(`select * from giohang where idgiohang=${donhangs[i].idgiohang}`,
                    (err, results, fields) => {
                        if (err) throw err;
                        if (results) res(results[0].username);
                })
            })
        }
        var role = req.cookies.info.role;
        res.render('cms/main_layout', { content: "bill/index", footer: 'bill/footer', data: { bills: donhangs, role: role }, role: role });
    }
}