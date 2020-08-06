var DB = require("../db");
var fs = require('fs');
const { rejects } = require("assert");
const { log } = require("console");
module.exports = {
    index: (req, res) => {
        var sql = "";
        if (req.cookies.info.vendor) {
            sql = `SELECT * FROM foods WHERE trash = 0 AND vendorowner = '${req.cookies.info.vendor}' ORDER BY created_date DESC`;
        } else sql = `SELECT * FROM foods WHERE trash = 0 ORDER BY created_date DESC`;
        DB.query(sql,
            function(err, results, fields) {
                if (err) throw err;
                var role = req.cookies.info.role;

                res.render('cms/main_layout', { content: "foods/index", footer: 'foods/footer', data: results, role: role });
            })
    },
    add: (req, res) => {
        console.log("req:", req.file);
        console.log(req.cookies.info);
        var sql = `INSERT INTO foods (title, image, price, description, in_menu, created_date, vendorowner) VALUES ('${req.body.title}','${req.file.filename}',${req.body.price},'${req.body.description}',${req.body.in_menu == "on" ? 1 : 0},NOW(),'${req.cookies.info.vendor}')`;
        DB.query(sql,
            async function(err, results, fields) {
                if (err) throw err;
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
                if (req.body.in_menu == "on") {
                    DB.query(`INSERT INTO menu_foods (menuID,foodID,amount,trash) VALUES (${menuID},${results.insertId},0,0)`);
                }
                res.redirect("/cms/foods");
            });
    },
    changeStateMenu: (req, res) => {
        DB.query(`UPDATE foods SET in_menu=${req.body.in_menu == 'true' ? 1 : 0} WHERE id=${req.body.id}`,
            async function(err, results, fields) {
                if (err) throw err;
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
                DB.query(`SELECT * FROM menu_foods WHERE menuID=${menuID} AND foodID=${req.body.id}`,
                    function(err, results, fields) {
                        if (err) throw err;
                        if (results.length > 0) {
                            DB.query(`UPDATE menu_foods SET trash=${req.body.in_menu == 'true' ? 0 : 1} WHERE id=${results[0].id}`);
                        } else {
                            if (req.body.in_menu == 'true') {
                                DB.query(`INSERT INTO menu_foods (menuID, foodID, amount, trash) VALUES (${menuID},${req.body.id},0,0)`)
                            }
                        }
                    })
                res.send({ success: true });

            })
    },
    get: (req, res) => {
        DB.query(`SELECT * FROM foods WHERE trash = 0 AND id=${req.params.id}`,
            function(err, results, fields) {
                if (err) throw err;
                if (results.length > 0) {
                    res.send(results[0]);
                }
            })
    },
    update: (req, res) => {
        DB.query(`SELECT * FROM foods WHERE id=${req.params.id}`,
            async function(err, results, fields) {
                if (err) throw err;
                var image = "";
                if (req.file) {
                    if (fs.existsSync('public/uploads/foods/' + results[0].image)) {
                        fs.unlinkSync('public/uploads/foods/' + results[0].image)
                    }
                    image = req.file.filename;
                } else image = results[0].image;
                DB.query(`UPDATE foods SET trash=1 WHERE id=${req.params.id}`);
                await DB.query(`INSERT INTO foods (title, image, price, description, in_menu, created_date, vendorowner) VALUES ('${req.body.title}','${image}',${req.body.price},'${req.body.description}',${req.body.in_menu == 'on' ? 1 : 0},NOW(),'${req.cookies.info.vendor}')`,
                    async function(err, results, fields) {
                        var amount = await new Promise((resolve, reject) => {
                            DB.query(`SELECT * FROM menu_foods WHERE foodID = ${req.params.id} ORDER BY id DESC`,
                                function(err, results, fields) {
                                    if (err) reject(err);
                                    if (results.length > 0) {
                                        DB.query(`UPDATE menu_foods set trash=1 WHERE id=${results[0].id}`);
                                        resolve(results[0].amount);
                                    }
                                    resolve(0);
                                });
                        })
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
                        if (req.body.in_menu == 'on') {
                            DB.query(`INSERT INTO menu_foods (menuID,foodID,amount,trash) VALUES (${menuID},${results.insertId},${amount},0)`)
                        }

                    });
                res.redirect('/cms/foods');
            })
    },
    delete: (req, res) => {
        DB.query(`SELECT * FROM foods WHERE id=${req.params.id}`,
            async function(err, results, fields) {
                if (err) throw err;
                if (results.length > 0) {
                    if (fs.existsSync('public/uploads/foods/' + results[0].image)) {
                        fs.unlinkSync('public/uploads/foods/' + results[0].image)
                    }
                    DB.query(`UPDATE foods SET trash=1 WHERE id=${req.params.id}`);
                    if (results[0].in_menu == 1) {
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
                        console.log(menuID);
                        DB.query(`UPDATE menu_foods set trash=1 WHERE menuID=${menuID} AND foodID=${results[0].id}`);
                    }
                }


                res.redirect('/cms/foods');
            });

    }
}