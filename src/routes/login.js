const express = require('express');
const router = express.Router();

const passport = require ('passport');
const LocalStrategy = require ('passport-local').Strategy;
//Conexion a la BD
const pool = require('../database');
const helpers = require('../lib/helpers');

//SIGN IN

passport.use('user.login', new LocalStrategy({
    usernameField: 'nombre',
    passwordField: 'passw',
    passReqToCallback: true
}, async(req, nombre, passw, done) => {

    console.log(req.body);
    const rows = await pool.query('SELECT * FROM users WHERE username = ?', [nombre]);
    if(rows.length > 0)
    {
      const user = rows[0];
      const validPassword = await helpers.matchPassword(passw, user.passw);
      
      if (validPassword) {
        done(null, user, req.flash('success','BIENVENIDO: ' + user.username));
        console.log('LOGIN CORRECTO');
      }else
      {
        done(null, false, req.flash('message','Usuario o contraseña invalidos'));
        console.log('LOGIN INCORRECTO');
      }
    }else
    {
      console.log('USUARIO NO ENCONTRADO');
      return done(null, false, req.flash('message','Usuario no encontrado'));
      
    }
}));


router.get('/',(req, res) => {
    res.render('user/login');
});

router.post('/user',(req, res, next) => {
  passport.authenticate('user.login', {
    successRedirect: '/profile',
    failureRedirect: '/login',
    failureFlash: true
  })(req, res, next);
});


router.get('/add', (req, res) => {
    res.render('user/login.hbs');
});

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
  done(null, rows[0]);
});

module.exports = router;