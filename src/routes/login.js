const express = require('express');
const router = express.Router();
//Conexion a la BD
const pool = require('../database');

router.get('/',(req, res) => {
    res.render('juegos/add');
});

router.post('/',(req, res) => {
  res.send('recibido');
});
router.get('/add', (req, res) => {
    res.render('user/login.hbs');
});

module.exports = router;