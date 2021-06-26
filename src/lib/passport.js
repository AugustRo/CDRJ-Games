const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool =require('../database');
const helpers = require('../lib/helpers');

//LOGIN
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
      done(null, user, req.flash('success','Bienvenido: ' + user.username));
      console.log('LOGIN CORRECTO');
    }else
    {
      done(null, false, req.flash('message','Usuario o contraseña incorrectos.'));
      console.log('LOGIN INCORRECTO');
    }
  }else
  {
    // console.log('El username no existe.');
    return done(null, false, req.flash('message','Usuario no encontrado.'));
    
  }
}));

//REGISTRO
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
    return done(null, newUser,req.flash('success','¡El registro fue exitoso! ' + newUser.username));
        
  }));

  passport.serializeUser((user, done) => {
    done(null, user.id);
  });
  
  passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
    done(null, rows[0]);
  });