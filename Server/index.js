var express =require('express');
const fs = require('fs')
var play = require('audio-play');
var load = require('audio-loader');
const bodyParser = require('body-parser');

var ip = require("ip");

var winston = require('winston');
var expressWinston = require('express-winston');

var dgram=require("dgram");

var server = dgram.createSocket("udp4");

server.bind(function(){
    server.setBroadcast(true);
    setInterval(broadcast,5000);
})

var myip=ip.address();
var broadcastip=ip.subnet(myip,'255.255.255.0').broadcastAddress;

function broadcast(){
    var message=new Buffer(myip);
    server.send(message,0,message.length,6024,broadcastip,function(){
        //console.log("broadcast!")
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

var playingAmbience=null;


function playAmbience(name){

    if(playingAmbience)
        playingAmbience.pause();

    var toLoad="ambiences/"+name;
    if(!fs.existsSync(toLoad))
        return;

    load(toLoad).then(function(audioBuffer){
        playingAmbience=play(audioBuffer,{
            loop:true,
            autoplay:true
        })
    })
}

function playSfx(name){

    var toLoad="sfx/"+name+".wav";
    if(!fs.existsSync(toLoad))
        return;

    load(toLoad).then(play);
}

function getAllFiles(folder){
    return fs.readdirSync(folder);
}

app.get('/', function(req,res){
    res.send("hello!");
});

app.get('/ambiences', function(req,res){
    var ambiences=getAllFiles("ambiences");
    res.json(ambiences);
});

app.get('/sfx', function(req,res){
    var sfx=getAllFiles("sfx");
    res.json(sfx);
});

app.post('/play', function(req,res){
    var data=req.body;
    if(data.type && data.name){

    if(data.type==="ambience")
        playAmbience(data.name)
    else if(data.type==="sfx")
        playSfx(data.name)
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