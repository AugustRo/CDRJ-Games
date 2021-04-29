const express = require('express');
const router = express.Router();
//Conexion a la BD
const pool = require('../database');

router.get('/add',(req, res) => {
    res.render('user/signup');
});

router.post('/add',(req, res) => {
    console.log(req.body);
  res.send('recibido');
});

router.get('/', (req, res) => {
  res.render('user/signup.hbs');
});

module.exports = router;