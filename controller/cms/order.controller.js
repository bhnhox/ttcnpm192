var DB = require("../db");
const { log } = require("debug");

module.exports = {
    index: async (req, res) => {
        var donhangs = await new Promise((resolve, reject)=>{
            DB.query("SELECT * FROM xacnhan WHERE daubepxacnhan is null", 
            function(err,results,fields){
                if (err) throw err;
                resolve(results);
            })
        });
        for (let i=0; i<donhangs.length; i++){
            donhangs[i].foods = await new Promise((resolve,reject)=>{
                DB.query(`SELECT * from chonhang inner join  foods on foods.id = chonhang.idmon AND idgiohang = ${donhangs[i].idgiohang}`,
                function(err, results, fields){
                    if (err) throw err;
                    resolve(results);
                })
            })
        }
        // res.send(donhangs);
        res.render('cms/main_layout',{content: "order/index",data:donhangs});
    },
    xacnhan: (req, res)=>{
        var name = req.cookies.info.username;
        DB.query(`UPDATE xacnhan SET daubepxacnhan='${name}' WHERE id=${req.body.id}`,
        function(err, results, fields){
            if (err) throw err;
            res.send({status: "success", id:req.body.id});
        })
    }
}