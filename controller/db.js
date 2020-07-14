var mysql = require('mysql');
var DB = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "admin123",
    database: "food_court"
});
DB.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

module.exports = DB;