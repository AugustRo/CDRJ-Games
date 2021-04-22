const express = require('express');
const router = express.Router();
//Conexion a la BD
const pool = require('../database');

//router.get('/add',(req, res) => {
    //res.render('juegos/add');
//});

//router.post('/add',(req, res) => {
  //  res.send('recibido');
//});
router.get('/', (req, res) => {
    res.render('login/login.hbs');
});

module.exports = router;