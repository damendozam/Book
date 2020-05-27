var express = require('express');
var app = express();
var server = require('http').Server(app);
var bodyParser=require("body-parser");
var mysql = require('mysql')
var myConnection = require('express-myconnection')
/*
    {
        "action": {
            "book": "",
            "chapter": "",
            "paragraph": ""
        },
        "section": {
            "book": "",
            "chapter": "",
            "paragraph": ""
        }
    }
*/

app.use(express.static('public'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(myConnection(mysql,{
    host: 'localhost',
    user: 'root',
    password:'pasword',
    port:3306
    database:'library'
},'single'))

app.get('/', function(req, res) {
  res.status(200).send("Hello World!");
});

app.post('/', function (req, res) {
    //console.log(req.body)
    var message=req.body
    //console.log(message['action']['book'])
    switch(message['action']['book']){
        case 'add':
            console.log(message['section']['book'])
        break;
        case 'delete':
            console.log(message['section']['book'])
        break;
        case 'upload':
            console.log(message['section']['book'])
        break;
        case 'select':
            console.log(message['section']['book'])
        break;
    }
    res.end("Ready\n"); //Responde to device    
});


server.listen(8080, function() {
  console.log("Servidor corriendo en http://localhost:8080");
});