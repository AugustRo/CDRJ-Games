const express = require('express');
const router = express.Router();
//Conexion a la BD
const pool = require('../database');

router.get('/add',(req, res) => {

    res.render('links/add');
});

module.exports = router;