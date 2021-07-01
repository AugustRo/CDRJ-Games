const express = require('express');
const router = express.Router();
const passport = require('passport');
const {isLoggedIn, isNotLoggedIn} = require('../lib/auth');
//REGISTRO

router.get('/signup', (req, res) => {
    res.render('user/signup');
});

router.post('/signup',isNotLoggedIn, passport.authenticate('user.signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true
}));

//LOGIN

router.get('/login',isNotLoggedIn,(req, res) => {
    res.render('user/login');
});

router.post('/login',(req, res, next) => {
    passport.authenticate('user.login', {
      successRedirect: '/profile',
      failureRedirect: '/login',
      failureFlash: true
    })(req, res, next);
});

router.get('/profile', isLoggedIn, (req, res) => {
    res.render('user/profile');
});

router.get('/salir', (req, res) => {
    req.logOut();
    res.redirect('/login');
})

module.exports = router;