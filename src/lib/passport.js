const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool =require('../database');
const helpers = require('../lib/helpers');

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