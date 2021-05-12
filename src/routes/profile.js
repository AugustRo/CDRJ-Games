const express = require ('express');
const router = express.Router();

//Conexión a la BD

const pool = require('../database');

router.get('/add',(req, res) => {
    res.render('user/profile');
});

router.get('/', (req, res) => {
    res.render('user/profile.hbs');
});

module.exports = router;