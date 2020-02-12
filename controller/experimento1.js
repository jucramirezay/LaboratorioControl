const express = require('express');
const app = express();
const path = require('path');
const bodyparser = require("body-parser");

app.use(express.static(path.dirname(require.resolve("mosca"))+ "/view"));
app.use(express.static(path.join(__dirname, 'view')));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyparser);


////////////Renderizado enviado al router////////////
//Carga de archivos estáticos
const experimento1 = (req, res, next) => { 
    res.render('experimento1');
}
  
module.exports = {
    experimento1: experimento1,
}



