const express = require('express');
const router = express.Router();

const passport = require ('passport');
const LocalStrategy = require ('passport-local').Strategy;
//Conexion a la BD
const pool = require('../database');
const helpers = require('../lib/helpers');

//SIGN UP

passport.use('user.signup', new LocalStrategy({
  usernameField: 'username',
  passwordField: 'passw',
  passReqToCallback: true
}, async(req, username, passw, done) => {
  const {nombre, apellido, email} = req.body;
  const  newUser = {
  nombre,
  apellido,
  username,
  email, 
  passw  
  };
  console.log(newUser);
  
  newUser.passw = await helpers.encryptPassword(passw);

  const result = await pool.query('INSERT INTO users set ?', [newUser]);

  newUser.id = result.insertId;
  return done(null, newUser,req.flash('success','REGISTRO EXITOSO' + newUser.username));
      
}));

router.get('/add',(req, res) => {
  res.render('user/signup');
});



router.get('/', (req, res) => {
  res.render('user/signup.hbs');
});


router.post('/add', passport.authenticate('user.signup', {
  successRedirect: '/profile',
  failureRedirect: '/signup',
  failureFlash: true
}));

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
  done(null, rows[0]);
});

module.exports = router;