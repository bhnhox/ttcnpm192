var DB = require("../db");

module.exports = {
    index: (req, res) => {
        DB.query('SELECT * FROM foods WHERE trash = 0 ORDER BY created_date DESC',
            function (err, results, fields) {
                if (err) throw err;
                res.render('cms/main_layout', { content: "foods/index", footer: 'foods/footer', data: results });
            })
    },
    add: (req, res) => {
        console.log("req:", req.file);
        var sql = `INSERT INTO foods (title, image, price, description, in_menu, created_date) VALUES ('${req.body.title}','${req.path}',${req.body.price},'${req.body.description}',${req.body.in_menu == "on" ? 1 : 0},NOW())`;
        DB.query(sql,
            function (err, results, fields) {
                if (err) throw err;
                res.redirect("/cms/foods");
            });
    },
    changeStateMenu: (req, res) => {
        DB.query(`UPDATE foods SET in_menu=${req.body.in_menu ? 1 : 0} WHERE id=${req.body.id}`,
            function (err, results, fields) {
                if (err) throw err;
                res.send({ success: true });
            })
    },
    get: (req, res) => {
        DB.query(`SELECT * FROM foods WHERE trash = 0 AND id=${req.params.id}`,
            function (err, results, fields) {
                if (err) throw err;
                if (results.length > 0) {
                    res.send(results[0]);
                }
            })
    },
    update: (req,res)=>{
        DB.query(`UPDATE foods SET title='${req.body.title}', price=${req.body.price}, description='${req.body.description}', in_menu=${req.body.in_menu ? 1 : 0} WHERE id=${req.params.id}`)
        res.redirect('/cms/foods');
    },
    delete: (req,res)=>{
        DB.query(`DELETE FROM foods WHERE id=${req.params.id}`);
        res.redirect('/cms/foods');
    }
}