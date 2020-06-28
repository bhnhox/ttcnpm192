var DB = require("../db");
const { log } = require("debug");

module.exports = {
    index: async (req, res) => {
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
        function(err, results, fields){
            if (err) throw err;
            res.render('cms/main_layout',{content: "baotri/index",data:results[0]});
        })

    },
    setAmount: (req, res)=>{
        for (var key in req.body){
            DB.query(`UPDATE menu_foods SET amount=${req.body[key]} WHERE id=${key}`);
            
        }
        res.redirect('/cms/menu');
    },
    batBaotri: (req,res)=>{
    //    var hanhdong = req.body.hanhdong);
        
    //     if()
        
    }
}