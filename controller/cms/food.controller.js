var DB = require("../db");

module.exports = {
    index: (req,res)=>{
        DB.query('SELECT * FROM foods', 
        function(err,results,fields){
            if (err) throw err;
            res.render('/cms/main_layout',{data:results,content:"food"});
        })
    }
}