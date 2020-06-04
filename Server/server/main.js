const express = require('express');
const app = express();
const server = require('http').Server(app);
const bodyParser=require("body-parser");
var id=1;
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

//app.use(express.static('public'));
/*app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());*/
app.use(express.json());
const mysqlConnection = require('./database');

app.get('/', (req, res)=> {    
    console.log(id);
    mysqlConnection.query('select * from books',(err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }
        else{
            console.log('Maaaaal');
        }
    });
});

app.post('/', (req, res)=> {
    //console.log(req.body)
    let message=req.body
    let actionBook=message['action']['book']
    //console.log(message['action']['book'])
    switch(actionBook){
        case 'add':
            let titleObject=message['section']['book']
            mysqlConnection.query('insert into books values (?,?)',[id++,titleObject]);
        break;
        case 'delete':
            console.log(message['section']['book'])
            mysqlConnection.query('delete from books where title = ?',[message['section']['book']]);
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


server.listen(process.env.PORT || 8080, ()=> {
  console.log("Servidor corriendo en http://localhost:8080");
});