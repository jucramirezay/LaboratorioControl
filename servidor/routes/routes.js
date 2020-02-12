const express = require("express");
const router = express.Router();

const indexController = require("../controller/controller.js");
const controllerExperiment1 = require("../controller/experimento1.js");
const controllerExperiment2 = require("../controller/experimento2.js");

router.get('/', indexController.index);

router.get('/experimento1', controllerExperiment1.experimento1);

router.get('/experimento2', controllerExperiment2.experimento2);

module.exports = router;