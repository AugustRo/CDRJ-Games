const express = require('express');
const router = express.Router();


const passport = require('passport');

router.get('/signup', (req, res) => {
    res.render('user/signup');
});

router.post('/signup', passport.authenticate('user.signup', {
    successRedirect: '/profile',
    failureRedirect: '/signup',
    failureFlash: true
  }));

  router.get('/login',(req, res) => {
    res.render('user/login');
});

router.get('/profile', (req, res) => {
    res.render('user/profile');
});

module.exports = router;