var DB = require("../db");
const { log } = require("debug");
var d = new Date();

module.exports = {
    index: async(req, res) => {
        // var menuID = await new Promise((resolve, reject) => {
        //     DB.query(`SELECT * FROM menu WHERE DATE(created_date) = DATE(NOW())`,
        //         function (err, results, fields) {
        //             if (err) reject(err);
        //             if (results.length > 0) {
        //                 resolve(results[0].id);
        //             }
        //             else {
        //                 DB.query(`INSERT INTO menu (created_date) VALUES (NOW())`,
        //                     function (err, result) {
        //                         resolve(result.insertId);
        //                     })
        //             }
        //         });
        // });
        DB.query(`SELECT * FROM food_court.baotri where idbaotri = (select max(idbaotri) from food_court.baotri);`,
            function(err, results, fields) {
                if (err) throw err;
                var role = req.cookies.info.role;

                res.render('cms/main_layout', { content: "baotri/index", data: results[0], role: role });
            })

    },

    batBaotri: (req, res) => {
        var hanhdong = req.body.hanhdong;
        var username = req.cookies.info.username;

        DB.query(`insert into baotri(username, thoigian, trangthai) values('${username}','${d}','${hanhdong}')`,
            function(err, results, fields) {
                if (err) throw err;
                res.redirect('baotri');
            })


    }
}