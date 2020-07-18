var DB = require("../db");

module.exports = {
    index: async(req, res) => {
        var menuID = await new Promise((resolve, reject) => {
            DB.query(`SELECT * FROM menu WHERE DATE(created_date) = DATE(NOW())`,
                function(err, results, fields) {
                    if (err) reject(err);
                    if (results.length > 0) {
                        resolve(results[0].id);
                    } else {
                        DB.query(`INSERT INTO menu (created_date) VALUES (NOW())`,
                            function(err, result) {
                                resolve(result.insertId);
                            })
                    }
                });
        });
        DB.query(`SELECT *, menu_foods.id AS id from menu_foods INNER JOIN foods ON menu_foods.foodID = foods.id AND menu_foods.trash = 0 AND  menu_foods.menuID=${menuID} AND foods.vendorowner = '${req.cookies.info.vendor}'`,
            function(err, results, fields) {
                if (err) throw err;
                var role = req.cookies.info.role;

                res.render('cms/main_layout', { content: "menu/index", data: results, role: role });
            })

    },
    setAmount: (req, res) => {
        for (var key in req.body) {
            DB.query(`UPDATE menu_foods SET amount=${req.body[key]} WHERE id=${key}`);

        }
        res.redirect('/cms/menu');
    }
}