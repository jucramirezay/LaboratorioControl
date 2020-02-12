//Carga de todos los frameworks y paquetes a utilizar
const mosca = require('mosca');
const mqtt = require('mqtt');
const express = require("express");
const app = express();
const socketIO = require('socket.io');
const path = require("path");
const routes = require("./routes/routes.js");
const bodyParser = require("body-parser");
//URL del dispositivo que va a funcionar como servidor
const client = mqtt.connect('mqtt://192.168.4.1'); 
var stringTotal;
var mensaje;
var settings = {
    port: 1883, //Puerto donde se va a crear el broker MQTT
};
//Variables que se van a utilizar para el envio en MQTT
var message = {
  topic: 'constantes/experimento1',
  payload: " ",
  qos: 0,
  retain: false,
};
var messageExp2 = {
  topic: 'constantes/experimento2',
  payload: " ",
  qos: 0,
  retain: false,
};
var mqtt1 = {
  topic: 'mqttaccept1',
  payload: " ",
  qos: 0,
  retain: false,
}
var mqtt2 = {
  topic: 'mqttaccept2',
  payload: " ",
  qos: 0,
  retain: false,
}

var clienteMQTT = "";
//Inicializar con los valores por defecto de las constantes
var kpCliente;
var kiCliente;
var kdCliente;
//Incializar con el valor por defecto del periodo
var dataPeriodo;
var clienteConectadoExp1 = false;
//Inicializar con los valores por defecto de las constantes
var kpClienteExp2;
var kiClienteExp2;
var kdClienteExp2;
//Incializar con el valor por defecto del periodo
var dataPeriodoExp2;
var clienteConectadoExp2 = false;
var clienteIndex = false;

//Settings
app.set('port', process.env.PORT || 3000); //Puerto HTTP servidor
app.set('views', path.join(__dirname, 'view'));
app.set('view engine', 'ejs');

//Creación del servidor HTTP
const serverExpress = app.listen(app.get('port'), () => {
    console.log("Servidor express creado en el puerto: ", app.get('port'));
});

//middlewares que indican el paso de datos, no es necesario crearlos
//simplemente es una función de reconocimiento de envío y recepción de datos
app.use((req, res, next) => {
  //  console.log(`${req.url} - ${req.method}`);
    next();
});

//Carga del archivo routes.js, creado en la carpeta /routes
app.use(routes);

//Archivos estáticos, se cargan del lado del cliente
app.use(express.static(path.dirname(require.resolve("mosca"))+ "/view"));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser);

////////////Broker mosca////////////
//Se cargan la configuración del broker, para este caso el puerto MQTT
var server = new mosca.Server(settings);

server.on('ready', () => {
  console.log("Mosca broker esta creado en el puerto: ", settings.port);
});

//Verificación de clientes conectados
server.on('clientConnected', (client) => {
    clienteMQTT = client.id;
    console.log("Listo conectado el cliente: ", client.id);
})

//Indica los topics a los cuales se suscribieron los clientes
server.on('subscribed', (topic, client) => {
  console.log('cliente: ', client.id, ' Suscrito a: ', topic);
});

//Función que indica la publicación de datos por parte de los clientes MQTT
server.on('published', (packet, client) => {
      stringTotal = packet.payload.toString();
});

//socketIO
const io = socketIO(serverExpress);

//Función principal que maneja la comunicación por WebSockets
io.on('connection', (socket) => {
    console.log("Cliente socket.io conectado: ", socket.id);

    //Envía los datos publicados al navegador cada 100 milisegundos
    setInterval(() => {
      if((mensaje == message.payload) || (mensaje == messageExp2.payload)) {
        mensaje = " ";
      } else {
        socket.emit('message', {stringTotal}, (datos) => {
          console.log("publicado: ", datos);
        });
      }    
    }, 100);

    //Envía los valores de las constantes cada segundo al navegador 
    setInterval(() => {
      socket.emit('eventClient', {
        bandera: true,
        kpCliente: kpCliente,
        kiCliente: kiCliente,
        kdCliente: kdCliente,
        dataPeriodo: dataPeriodo,
      });
    }, 1000);

    setInterval(() => {
      socket.emit('eventClientExp2', {
        bandera: true,
        kpClienteExp2: kpClienteExp2,
        kiClienteExp2: kiClienteExp2,
        kdClienteExp2: kdClienteExp2,
        dataPeriodoExp2: dataPeriodoExp2,
      });
    }, 1000);

    //Indica si el cliente esta en la página de inicio
    socket.on('clientesIndex', (data) => {
      clienteIndex = data.clienteIndex;
     // console.log("cliente index: ", clienteIndex)
    })
    
    //Indica si el cliente esta en el Experimento 1
    socket.on('clienteConectadoExp1', (data) => {
        clienteConectadoExp1 = data.cliente;
     //   console.log("Experimento 1: ", clienteConectadoExp1);
    });

    //Indica si el cliente esta en el Experimento 2
    socket.on('clienteConectadoExp2', (data) => {
      clienteConectadoExp2 = data.cliente;
     // console.log("Experimento 2: ", clienteConectadoExp2);
    });

    if(clienteIndex == true && clienteConectadoExp1 == true){
      clienteConectadoExp1 = false;
    } 
    if(clienteIndex == true && clienteConectadoExp2 == true){
      clienteConectadoExp2 = false;
    } 

    //Envía la información sobre que experimento esta poblado por clientes
    setInterval(() => {
        socket.emit('ExperimentoActivo', {
          clienteConectadoExp1: clienteConectadoExp1,
          clienteConectadoExp2: clienteConectadoExp2,
        });  
      }, 1000);

    /*Eventos que indican la llegada de datos por parte del navegador
    Envía estos datos al NodeMCU del experimento respectivo, desde donde
    fue lanzado el evento*/
    socket.on('kpEvent', (data) => {
      message.topic = message.topic.replace("constantes/experimento1", "constantes/experimento1/kp");
      message.payload = data.kp.toString();
      kpCliente = message.payload;
      server.publish(message, () => {
        console.log("enviado kpEvent");
        message.topic = "constantes/experimento1";
      });
    });
  
    socket.on('kdEvent', (data) => {
      message.topic = message.topic.replace("constantes/experimento1", "constantes/experimento1/kd");
      message.payload = data.kd.toString();
      kdCliente = message.payload;
      server.publish(message, () => {
        console.log("enviado kdEvent");
        message.topic = "constantes/experimento1";
      });
    });
    
    socket.on('kiEvent', (data) => {
      message.topic = message.topic.replace("constantes/experimento1", "constantes/experimento1/ki");
      message.payload = data.ki.toString();
      kiCliente = message.payload;
      server.publish(message, () => {
        console.log("enviado kiEvent");
        message.topic = "constantes/experimento1";
      });
    });
  
    socket.on('refEvent', (data) => {
      message.topic = message.topic.replace("constantes/experimento1", "constantes/experimento1/ref");
      message.payload = data.ref.toString();
      server.publish(message, () => {
        console.log("enviado refEvent");
        message.topic = "constantes/experimento1";
      });
    });

    socket.on('perEvent', (data) => {
      message.topic = message.topic.replace("constantes/experimento1", "constantes/experimento1/periodo");
      message.payload = data.periodo.toString();
      dataPeriodo = message.payload;
      server.publish(message, () => {
        console.log("enviado perEvent");
        message.topic = "constantes/experimento1";
      });
    });

    socket.on('kpEventExp2', (data) => {
      messageExp2.topic = messageExp2.topic.replace("constantes/experimento2", "constantes/experimento2/kp");
      messageExp2.payload = data.kp.toString();
      kpClienteExp2 = messageExp2.payload;
      server.publish(messageExp2, () => {
        console.log("enviado kpEventExp2");
        messageExp2.topic = "constantes/experimento2";
      });
    });
  
    socket.on('kdEventExp2', (data) => {
      messageExp2.topic = messageExp2.topic.replace("constantes/experimento2", "constantes/experimento2/kd");
      messageExp2.payload = data.kd.toString();
      kdClienteExp2 = messageExp2.payload;
      server.publish(messageExp2, () => {
        console.log("enviado kdEventExp2");
        messageExp2.topic = "constantes/experimento2";
      });
    });
    
    socket.on('kiEventExp2', (data) => {
      messageExp2.topic = messageExp2.topic.replace("constantes/experimento2", "constantes/experimento2/ki");
      messageExp2.payload = data.ki.toString();
      kiClienteExp2 = messageExp2.payload;
      server.publish(messageExp2, () => {
        console.log("enviado kiEventExp2");
        messageExp2.topic = "constantes/experimento2";
      });
    });
  
    socket.on('refEventExp2', (data) => {
      messageExp2.topic = messageExp2.topic.replace("constantes/experimento2", "constantes/experimento2/ref");
      messageExp2.payload = data.ref.toString();
      server.publish(messageExp2, () => {
        console.log("enviado refEventExp2");
        messageExp2.topic = "constantes/experimento2";
      });
    });

    socket.on('perEventExp2', (data) => {
      messageExp2.topic = messageExp2.topic.replace("constantes/experimento2", "constantes/experimento2/periodo");
      messageExp2.payload = data.periodo.toString();
      dataPeriodoExp2 = messageExp2.payload;
      server.publish(messageExp2, () => {
        console.log("enviado perEventExp2");
        messageExp2.topic = "constantes/experimento2";
      });
    });

    //Eventos que envian el indicativo para el NodeMCU, ya puede enviar datos
    socket.on('mqttExp1', (data) => {
      mqtt1.payload = data.experimento1Var.toString();
      mqtt2.payload = data.experimento2Var.toString();
      server.publish(mqtt1, () => {
        console.log("Enviado mqtt1: ", mqtt1);
      });
      server.publish(mqtt2, () => {
        console.log("Enviado mqtt2: ", mqtt2);
      });
    });

    socket.on('mqttExp2', (data) => {
      mqtt1.payload = data.experimento1Var.toString();
      mqtt2.payload = data.experimento2Var.toString();
      server.publish(mqtt1, () => {
        console.log("Enviado mqtt1: ", mqtt1);
      });
      server.publish(mqtt2, () => {
        console.log("Enviado mqtt2: ", mqtt2);
      });
    });

});

////////////Cliente mqtt////////////
/*Creación de los clientes MQTT, el broker debe crear sus propios clientes
para que así le lleguen los datos de acuerdo a lo enviado por el navegador*/
client.on('connect', () => {
    client.subscribe('constantes/experimento1/kp', (err) => { });
    client.subscribe('constantes/experimento1/kd', (err) => { });
    client.subscribe('constantes/experimento1/ki', (err) => { });
    client.subscribe('constantes/experimento1/ref', (err) => { });
    client.subscribe('constantes/experimento1/periodo', (err) => { });
    client.subscribe('constantes/experimento2/kp', (err) => { });
    client.subscribe('constantes/experimento2/kd', (err) => { });
    client.subscribe('constantes/experimento2/ki', (err) => { });
    client.subscribe('constantes/experimento2/ref', (err) => { });
    client.subscribe('constantes/experimento2/periodo', (err) => { });
    client.subscribe('mqttaccept1', (err) => { });
    client.subscribe('mqttaccept2', (err) => { });
});
  
client.on('message', (topic, message) => {
});