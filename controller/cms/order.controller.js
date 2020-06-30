var DB = require("../db");

module.exports = {
    index: async (req, res) => {
        var donhangs = await new Promise((resolve, reject)=>{
            DB.query("SELECT * FROM xacnhan WHERE daubepxacnhan = 0", 
            function(err,results,fields){
                if (err) throw err;
                resolve(results);
            })
        });
        for (let i=0; i<donhangs.length; i++){
            donhangs[i].foods = await new Promise((resolve,reject)=>{
                DB.query(`SELECT * FROM chonhang INNER JOIN foods ON idmon = foods.id AND idgiohang = ${donhangs[i].id}`,
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
        DB.query(`UPDATE xacnhan SET daubepxacnhan=1 WHERE id=${req.body.id}`,
        function(err, results, fields){
            if (err) throw err;
            res.send({status: "success", id:req.body.id});
        })
    }
}