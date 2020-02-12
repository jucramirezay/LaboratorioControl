//const socket = require("../socket.js").socket;
//const mosca = require('mosca');
//const mqtt = require('mqtt');
const express = require('express');
const app = express();
const path = require('path');
const bodyparser = require("body-parser");

app.use(express.static(path.dirname(require.resolve("mosca"))+ "/view"));
app.use(express.static(path.join(__dirname, 'view')));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyparser);

//const io = socketIO(serverExpress);

////////////Renderizado enviado al router////////////
//Carga de archivos estáticos
const experimento1 = (req, res, next) => { 
    res.render('experimento1');
}

////////////Broker mosca////////////
/*var server = new mosca.Server(settings);

server.on('ready', () => {
    console.log("Mosca broker esta creado en el puerto: ", settings.port);
});

server.on('clientConnected', (client) => {
    clienteMQTT = client.id;
    console.log("Conectado al experimento1 el modulo: ", client.id);
});

server.on('published', (packet, client) => {
      if((packet.payload == '{"clientId":"ESP8266Client-1","topic":"experimento1/constantes/kp"}') || 
        (packet.payload == '{"clientId":"ESP8266Client-1","topic":"experimento1/constantes/kd"}') || 
        (packet.payload == '{"clientId":"ESP8266Client-1","topic":"experimento1/constantes/ki"}') ||
        (packet.payload == "Hola mundo") || (packet.payload == "ESP8266Client-1") || 
        (packet.payload == `{"clientId":"${clienteMQTT}","topic":"experimento1/constantes/ki"}`)) {
        mensaje = "0";
      } else {
        mensaje = packet.payload.toString();
      }
});  

server.on('subscribed', (topic, client) => {
    console.log('Suscrito a: ', topic);
});

////////////Socket.io////////////

io.on('connection', (socket) => {
    console.log("Cliente socket.io conectado: ", socket.id);

    setInterval(() => {
        if(mensaje == message.payload) {
            mensaje = " ";
        } else {
            //socket.io.emit
            socket.emit('message', {mensaje} );
        }
    }, 1000);       
    
    socket.on('kpEvent', (data) => {
        message.topic = message.topic.replace("experimento1/constantes", "experimento1/constantes/kp");
        message.payload = data.kp.toString();
        server.publish(message, () => {
          message.topic = "experimento1/constantes";
        });
      });
    
    socket.on('kdEvent', (data) => {
        message.topic = message.topic.replace("experimento1/constantes", "experimento1/constantes/kd");
        message.payload = data.kd.toString();
        server.publish(message, () => {
          message.topic = "experimento1/constantes";
        });
      });
      
    socket.on('kiEvent', (data) => {
        message.topic = message.topic.replace("experimento1/constantes", "experimento1/constantes/ki");
        message.payload = data.ki.toString();
        server.publish(message, () => {
          message.topic = "experimento1/constantes";
        });
      });
    
    socket.on('refEvent', (data) => {
        message.topic = message.topic.replace("experimento1/constantes", "experimento1/constantes/ref");
        message.payload = data.ref.toString();
        server.publish(message, () => {
          message.topic = "experimento1/constantes";
          console.log("Publicado: ", message.payload);
        });
      });

});

////////////Cliente mqtt////////////
client.on('connect', () => {
    client.subscribe('experimento1/constantes/kp', (err) => { });
    client.subscribe('experimento1/constantes/kd', (err) => { });
    client.subscribe('experimento1/constantes/ki', (err) => { });
    client.subscribe('experimento1/constantes/ref', (err) => { });
});
  
client.on('message', (topic, message) => {
});*/
  
module.exports = {
    experimento1: experimento1,
}



