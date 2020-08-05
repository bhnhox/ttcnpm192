var DB = require("../db");
const { log } = require("debug");
var noti = require('../../notification/main');
module.exports = {
    index: async (req, res) => {
        var donhangs = await new Promise((resolve, reject) => {
            DB.query(` SELECT xacnhan.id , xacnhan.idgiohang, donhang.id as iddonhang FROM xacnhan inner join donhang on daubepxacnhan is  null AND vendorname = '${req.cookies.info.vendor}' and quayhangxacnhan is null  and donhang.idgiohang = xacnhan.idgiohang;      `,
                function (err, results, fields) {
                    if (err) throw err;
                    resolve(results);
                })
        });
        for (let i = 0; i < donhangs.length; i++) {
            donhangs[i].foods = await new Promise((resolve, reject) => {
                DB.query(`SELECT * from chonhang inner join  foods on foods.id = chonhang.idmon AND idgiohang = ${donhangs[i].idgiohang} AND foods.vendorowner = '${req.cookies.info.vendor}'`,
                    function (err, results, fields) {
                        if (err) throw err;
                        resolve(results);
                    })
            })
        }
        // res.send(donhangs);
        var role = req.cookies.info.role;

        res.render('cms/main_layout', { content: "order/index", data: donhangs, role: role });
    },
    xacnhan: async (req, res) => {
        var name = req.cookies.info.username;
        var idgiohang = await new Promise((res, rej) => {
            DB.query(`SELECT idgiohang FROM xacnhan WHERE id=${req.body.id}`, (err, results, fields) => {
                if (err) throw err;
                if (results) res(results[0].idgiohang);
            })
        })
        DB.query(`UPDATE xacnhan SET daubepxacnhan='${name}' , timedaubepxacnhan= now() WHERE id=${req.body.id}`,
            async function (err, results, fields) {
                if (err) throw err;
                var foods = await new Promise((res, rej) => {
                    DB.query(`SELECT * from chonhang inner join  foods on foods.id = chonhang.idmon AND idgiohang = ${idgiohang} AND foods.vendorowner = '${req.cookies.info.vendor}'`,
                        (err, results, fields) => {
                            if (err) throw err;
                            if (results) {
                                res(results);
                            }
                        })
                })
                noti.notiFoodReadyNV({
                    vendor: req.cookies.info.vendor,
                    id_xacnhan: req.body.id,
                    foods: foods,
                    donhang: req.body.iddonhang
                })
                res.send({ status: "success", id: req.body.id });
            })
        DB.query(`SELECT * FROM xacnhan WHERE idgiohang='${idgiohang}' AND daubepxacnhan is null`, async (err, results, fields) => {
            if (err) throw err;
            if (results.length == 0) {
                var username = await new Promise((res, rej) => {
                    DB.query(`SELECT username FROM giohang WHERE idgiohang = '${idgiohang}'`, (err, results, fields) => {
                        if (err) throw err;
                        if (results) {
                            res(results[0].username);
                        }
                    });
                })
                var data = {
                    username: username,
                    idgiohang: idgiohang
                }
                noti.notiFoodReady(data);
            }
        })
    }
}