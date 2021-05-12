const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

passport.use('local.signup', new LocalStrategy({
 usernameField: 'username',
 passwordField: 'passw',
 passReqToCallback: true

}, async (req, username, passw, done) => {
console.log(req.body);


}));

//passport.serializeUser((usr,done) => {

//});