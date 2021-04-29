const express = require('express');
const router = express.Router();
//Conexion a la BD
const pool = require('../database');

router.get('/add',(req, res) => {
    res.render('user/signup');
});

router.post('/add', async (req, res) => {
    const {nombre, apellido, username, email, passw} = req.body;
    const  newUser = {
    nombre,
    apellido,
    username,
    email, 
    passw  
    };
    console.log(newUser);
    
    await pool.query('INSERT INTO users set ?', [newUser]);
  res.send('recibido');
});

router.get('/', (req, res) => {
  res.render('user/signup.hbs');
});

module.exports = router;