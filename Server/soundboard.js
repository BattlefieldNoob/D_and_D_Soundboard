const fs = require('fs')
var play = require('audio-play');
var load = require('audio-loader');

var sfxBuffer=[];
var ambienceBuffer=[];

var sfxPreload=getAllFiles("sfx");
var ambiencePreload=getAllFiles("ambiences");

sfxPreload.forEach(function(file){
    var toLoad="sfx/"+file;
    if(fs.existsSync(toLoad)){

    load(toLoad).then(function(buffer){
        console.log(file);
        sfxBuffer.push({name:file,buffer:buffer});
    });
}
});

ambiencePreload.forEach(function(file){
    var toLoad="ambiences/"+file;
    if(fs.existsSync(toLoad)){
        load(toLoad).then(function(buffer){
            console.log(file);
            ambienceBuffer.push({name:file,buffer:buffer});
        });
    }
});

module.exports.playAmbience = function (name){
    console.log(sfxBuffers);
    var found=sfxBuffers.find(function(elem){ return elem.name===name;});
    console.log(found);
    if(found){
        play(found.buffer,{
            loop:true,
            autoplay:true
        });
    }
}

module.exports.playSfx = function (name){
    onsole.log(ambienceBuffer);
    var found=ambienceBuffer.find(function(elem){ return elem.name===name;});
    console.log(found);
    if(found){
        play(found.buffer,{
            loop:true,
            autoplay:true
        });
    }
}

function getAllFiles(folder){
    return fs.readdirSync(folder);
};

module.exports.getAmbiences = function (){return ambienceBuffer.map(function(elem){return elem.name;});};
module.exports.getSfx = function (){return sfxBuffer.map(function(elem){return elem.name;});};