var mysql = require('mysql');
var DB = mysql.createConnection({
    host: "127.0.0.1",
    user: "ngoctrong102",
    password: "v.n.t.12345",
    database: "food_court"
});
DB.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

module.exports = DB;