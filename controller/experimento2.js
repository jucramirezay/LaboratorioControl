const express = require('express');
const app = express();
const path = require('path');
const bodyparser = require("body-parser");

app.use(express.static(path.dirname(require.resolve("mosca"))+ "/view"));
app.use(express.static(path.join(__dirname, 'view')));
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyparser);

//Carga de archivos estáticos
const experimento2 = (req, res, next) => {
    res.render('experimento2', {
        title: "Segundo experimento", 
    });
}

module.exports = {
    experimento2: experimento2,
}