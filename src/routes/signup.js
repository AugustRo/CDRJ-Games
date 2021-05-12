const express = require('express');
const router = express.Router();
//Conexion a la BD
const pool = require('../database');
//passport.
const passport = require('passport');

router.get('/add',(req, res) => {
    res.render('user/signup');
});

router.post('/add', passport.authenticate('local.signup', {
  successRedirect: '/',
  failureRedirect: '/',
  failureFlash: true
}));

//router.post('/add', async (req, res) => {
 //   const {nombre, apellido, username, email, passw} = req.body;
 //   const  newUser = {
 //   nombre,
 //   apellido,
 //   username,
 //  email, 
 //   passw  
 //   };
 //   console.log(newUser);
    
 //   await pool.query('INSERT INTO users set ?', [newUser]);
 //   res.render('index');
//});


router.get('/profile', (req, res) => {
  res.send('Página perfil')
});



router.get('/', (req, res) => {
  res.render('user/signup.hbs');
});

module.exports = router;