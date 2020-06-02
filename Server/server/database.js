const mysql = require('mysql');

const mysqlConnection=mysql.createConnection({
    host:'localhost',
    user: 'root',
    password:'D1e601453',
    port:3306,
    database:'test'
});
mysqlConnection.connect(function (err){
    if(err){
        console.log(err);
        return;
    }
    else{
        console.log('Done!');
    }
});
module.exports= mysqlConnection;
