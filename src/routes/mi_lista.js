const express = require ('express');
const router = express.Router();

//Conexión a la BD

const pool = require('../database');
const { route } = require('./juegos');

router.get('/', (req, res) => {
    res.render('juegos/mi_lista');
});

module.exports = router;