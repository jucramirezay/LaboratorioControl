const socket = io('http://192.168.4.24:3000'); //Indicar URL del servidor
var experimento1Var = 0;
var experimento2Var = 0;
var confirmadorExp1 = false;
var seleccionExp2 = false;
var confirmadorExp2 = false;
var seleccionExp1 = false;
var clienteIndex = false;

var experimento1 = document.getElementById("experimento1");
var experimento2 = document.getElementById("experimento2");

experimento1.addEventListener('click', entregarExp1);
experimento2.addEventListener('click', entregarExp2);
  
/*socket.on('noExperimento2', (data) => {
  confirmadorExp1 = data.clienteConectadoExp1;
  console.log("Experimento 1:", confirmadorExp1);
  if(confirmadorExp1 == true){
     experimento2.style.display = 'none' 
  } else {
    experimento2.style.display = 'inline'
  }
});

socket.on('noExperimento1', (data) => {
  confirmadorExp2 = data.clienteConectadoExp2;
  console.log("Experimento 2:", confirmadorExp2);
  if(confirmadorExp2 == true){
     experimento1.style.display = 'none' 
  } else {
    experimento1.style.display = 'inline'
  }
});*/

setInterval(() => {
  clienteIndex = socket.connected;

  socket.emit('clientesIndex', {
    clienteIndex: true,
  })
}, 1000);

socket.on('ExperimentoActivo', (data) => {
  confirmadorExp1 = data.clienteConectadoExp1;
  confirmadorExp2 = data.clienteConectadoExp2;
  console.log("Experimento 1: ", confirmadorExp1);
  console.log("Experimento 2: ", confirmadorExp2);
  if(confirmadorExp1 == true){
    experimento2.style.display = 'none' 
  } 
  if (confirmadorExp1 == false){
    experimento2.style.display = 'inline'
  } 
  if(confirmadorExp2 == true){
    experimento1.style.display = 'none' 
  } 
  if(confirmadorExp2 == false){
    experimento1.style.display = 'inline'
  }
});

function entregarExp1() {
    experimento1Var = 1;
    experimento2Var = 0;

    socket.emit('mqttExp1', {
      experimento1Var: experimento1Var,
      experimento2Var: experimento2Var,
    });
}

function entregarExp2() {

   /* seleccionExp2 = true;
    
    if((seleccionExp2 == true) && (confirmadorExp1 == true)) {
      //experimento1Var = 1;
      //experimento2Var = 0;
  
      socket.emit('ErrorExp1', {
        error: true
      });
      
    } else {*/
      experimento1Var = 0;
      experimento2Var = 1;
        
      socket.emit('mqttExp2', {
        experimento1Var: experimento1Var,
        experimento2Var: experimento2Var,
      });
    //}
}
