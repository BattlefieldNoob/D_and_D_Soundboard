var express =require('express');

const bodyParser = require('body-parser');

var ip = require("ip");

var winston = require('winston');
var expressWinston = require('express-winston');

var dgram=require("dgram");

var server = dgram.createSocket("udp4");

var soundboard = require("./soundboard");

server.bind(function(){
    server.setBroadcast(true);
    setInterval(broadcast,1000);
    console.log("start Broadcast");
})

var myip=ip.address();
var broadcastip=ip.subnet(myip,'255.255.255.0').broadcastAddress;

console.log(myip);
console.log(broadcastip);

function broadcast(){
    var message=new Buffer(myip);
    server.send(message,0,message.length,6024,broadcastip,function(){
        //console.log("broadcast!");
    })
}

var app = express();



app.use(expressWinston.logger({
    transports: [
      new winston.transports.Console()
    ],
    format: winston.format.combine(
      winston.format.colorize(),
      winston.format.json()
    ),
    meta: true, // optional: control whether you want to log the meta data about the request (default to true)
    msg: "HTTP {{req.method}} {{req.url}}", // optional: customize the default logging message. E.g. "{{res.statusCode}} {{req.method}} {{res.responseTime}}ms {{req.url}}"
    expressFormat: true, // Use the default Express/morgan request formatting. Enabling this will override any msg if true. Will only output colors with colorize set to true
    colorize: true, // Color the text and status code, using the Express/morgan color palette (text: gray, status: default green, 3XX cyan, 4XX yellow, 5XX red).
    ignoreRoute: function (req, res) { return false; } // optional: allows to skip some log messages based on request and/or response
  }));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


app.get('/', function(req,res){
    res.send("hello!");
});

app.get('/ambiences', function(req,res){
    res.json(soundboard.getAmbiences());
});

app.get('/sfx', function(req,res){
    res.json(soundboard.getSfx());
});

app.post('/play', function(req,res){
    var data=req.body;
    console.log(data);
    if(data.type && data.name){

    if(data.type==="ambience")
        soundboard.playAmbience(data.name);
    else if(data.type==="sfx")
        soundboard.playSfx(data.name);
    else{
        res.status(501).end();
        return
    }
    res.send("hello!");
    return;    

    }
    res.status(501).end();
});

app.use(expressWinston.errorLogger({
    transports: [
      new winston.transports.Console()
    ],
    format: winston.format.combine(
      winston.format.colorize(),
      winston.format.json()
    )
  }));

app.listen(8080,() => console.log("ready on localhost:8080"));
