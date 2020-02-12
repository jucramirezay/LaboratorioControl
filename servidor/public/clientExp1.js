const socket = io('http://192.168.4.1:3000'); //Indicar URL del servidor
//var experimento1Var = 0;
//var experimento2Var = 0;

var ctx = document.getElementById("mycanvas").getContext("2d");
var botonp = document.getElementById("constantep");
var botond = document.getElementById("constanted");
var botoni = document.getElementById("constantei");
var botonref = document.getElementById("referencia");
var botonHome = document.getElementById("home");
var botonperiodo = document.getElementById("periodo");
var resultado = document.getElementById("resultado");

var numeros = [];
var referencia = [];
var tiempo = [];
var time = 0;
var contador = 0;
var coma;
var ref;
var mensaje;
var bandera = false;
var caracteres = /^([0-9-.])*$/;
var contadorClientes = 0;
var clienteOpen = false;

var kpCliente = 0.45;
var kiCliente = 0.3;
var kdCliente = 0.051;
var dataPeriodo = 8;
var validador = false;

botonp.addEventListener('click', entregarkp);
botond.addEventListener('click', entregarkd);
botoni.addEventListener('click', entregarki);
botonref.addEventListener('click', entregarRef);
botonperiodo.addEventListener('click', entregarPeriodo);
botonHome.addEventListener('click', home);

setInterval(() => {
  //socket.on('connect', () => {
    clienteOpen = socket.connected;
  //});
   // console.log(clienteOpen);
   //if(clienteOpen == true) {
    socket.emit('clienteConectadoExp1', {
      cliente: clienteOpen,
   });
  //}
}, 1000);

/*socket.on('Cuenta', (data) => {
  console.log(data);
});*/

function home() {
  //var experimento1Var = 0;
  //var experimento2Var = 0;

  /*socket.emit('mqttExp1', {
    experimento1Var: experimento1Var,
    experimento2Var: experimento2Var,
  });*/
}

socket.on('eventClient', (data) => {
    bandera = data.bandera;
    kpCliente = data.kpCliente;
    kiCliente = data.kiCliente;
    kdCliente = data.kdCliente;
    dataPeriodo = data.dataPeriodo;
    if(bandera == true){
      mostrar(kpCliente, kiCliente, kdCliente, dataPeriodo);
    }
});

function verificacion(entrada){
  var valido = caracteres.test(entrada.value);
  if(!valido) {
    alert('Debe introducir un valor valido, solamente se permiten números decimales');
  }
  return valido;
}

function mostrar(kpCliente, kiCliente, kdCliente, dataPeriodo) {
  resultado.innerHTML = "El valor de la constante proporcional es: " + kpCliente + "<br />" +
  "El valor de la constante integral es: " + kiCliente + "<br />"  + 
  "El valor de la constante derivativa es: " + kdCliente + "<br />" + 
  "El valor del periodo es: " + dataPeriodo + " Segundos" + "<br />";
} 

function entregarkp() {
  var constanteProporcional = document.getElementById("kp");
  
  validador = verificacion(constanteProporcional);
  console.log(validador);
  if(validador){
    socket.emit('kpEvent', {
      kp: constanteProporcional.value,
    });
    validador = false;
  }
}

function entregarkd() {
  var constanteDerivativa = document.getElementById("kd");
  
  validador = verificacion(constanteDerivativa);
  if(validador){
    socket.emit('kdEvent', {
      kd: constanteDerivativa.value,
    });
    validador = false;
  }
}

function entregarki() {
  var constanteIntegral = document.getElementById("ki");

  validador = verificacion(constanteIntegral);
  if(validador){
    socket.emit('kiEvent', {
      ki: constanteIntegral.value,
    });
    validador = false;
  }
}

function entregarRef() {
  var valorReferencia = document.getElementById("ref");

  validador = verificacion(valorReferencia);

  if(validador){
    socket.emit('refEvent', {
      ref: valorReferencia.value,
    });
    validador = false;
  }  
}

function entregarPeriodo() {
  var valorPeriodo = document.getElementById("per");

  validador = verificacion(valorPeriodo);
  if(validador){
    socket.emit('perEvent', {
      periodo: valorPeriodo.value,
    });  
    validador = false;
  }
}

var data = {
      labels: tiempo, 
      datasets: [{
        label: 'Distancia',
        backgroundColor: "rgba(0,0,255,1)",
        borderColor: "rgba(0,0,255,1)",
        data: numeros,
        borderWidth: 1,
        fill: false,
        pointRadius: 0,
        pointHoverRadius: 0,
      }, {
        label: 'Referencia',
        backgroundColor: "rgba(255,0,0,1)",
        borderColor: "rgba(255,0,0,1)",
        data: referencia,
        borderWidth: 1,
        fill: false,
        pointRadius: 0,
        pointHoverRadius: 0,
      }],
}; 
    
var options = {
      responsive: true,
      title: {
        display: true,
        text: 'Levitador (Distancia vs tiempo)'
      },
      tooltips: {
        mode: 'index',
        intersect: false
      },
      hover: {
        mode: 'nearest',
        intersect: 'true',
      },
      scales: {
        yAxes: [{
          //stacked: true,
          scaleLabel: {
            display: true,
            labelString: 'Distancia'
          },
          gridLines: {
            display: true,
          },
          ticks: {
            beginAtZero: true,
            min: -20,
            max: 20,
          }
        }],
        xAxes : [{
          display: true,
          scaleLabel: {
            display: true,
            labelString: 'Tiempo'
          },
          ticks: {
            beginAtZero: true,
          },
          stacked: true,
          gridLines: {
            display: true,
          },
        }]
      }
};
        
var chart = Chart.Line(ctx, {
      options: options,
      data: data,
});
  
socket.on('message', (numbers) => {
      coma = numbers.stringTotal.indexOf(',');
      ref = numbers.stringTotal.substring(coma+1, numbers.stringTotal.length+1);
      mensaje = numbers.stringTotal.substring(0, coma);

      time = time + 0.1;
      contador = time.toFixed(2);
      
      chart.data.labels.push(contador); 
      if(time >= 15) {
        chart.data.labels.splice(0, 1); 
        chart.data.datasets[0].data.splice(0, 1);
        chart.data.datasets[1].data.splice(0, 1);   
      }
      chart.data.datasets[0].data.push(mensaje);
      chart.data.datasets[1].data.push(ref);

      chart.update();
      console.log(numbers);
});