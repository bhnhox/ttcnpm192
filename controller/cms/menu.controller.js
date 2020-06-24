var DB = require("../db");

module.exports = {
    index: async (req, res) => {
        var menuID = await new Promise((resolve, reject) => {
            DB.query(`SELECT * FROM menu WHERE DATE(created_date) = DATE(NOW())`,
                function (err, results, fields) {
                    if (err) reject(err);
                    if (results.length > 0) {
                        resolve(results[0].id);
                    }
                    else {
                        DB.query(`INSERT INTO menu (created_date) VALUES (NOW())`,
                            function (err, result) {
                                resolve(result.insertId);
                            })
                    }
                });
        });
        DB.query(`SELECT * from menu_foods INNER JOIN foods ON menu_foods.foodID = foods.id AND menu_foods.trash = 0 AND  menu_foods.menuID=${menuID}`,
        function(err, results, fields){
            if (err) throw err;
            res.send(results);
        })

    }
}