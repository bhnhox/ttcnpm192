var DB = require("../db");
var ejs = require('ejs');
var  fs = require('fs');

module.exports = {
    index: (req,res)=>{
        DB.query('SELECT * FROM foods WHERE trash = 0', 
        function(err,results,fields){
            if (err) throw err;
            var data = JSON.stringify(results.map((result,index)=>{return [index+1,result.image,result.title,result.price]}));
            console.log(data);
            res.render('cms/main_layout',{content:"foods/index",footer:'foods/footer',datatb:data});
        })
    }
}