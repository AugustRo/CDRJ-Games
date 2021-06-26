const express = require ('express');
const router = express.Router();
const {isLoggedIn} = require('../lib/auth');

//Conexión a la BD

const pool = require('../database');
const { route } = require('./juegos');

router.get('/',isLoggedIn, (req, res) => {
    res.render('juegos/mi_lista');
});

module.exports = router;