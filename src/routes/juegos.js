const express = require('express');
const fileUpload = require('express-fileupload');
const router = express.Router();
router.use(fileUpload());

//Conexion a la BD
const pool = require('../database');

//Ruta para entrar en Add juegos
router.get('/add', (req, res) => {
    res.render('juegos/add');
});

//Ruta que lee los juegos
router.get('/', async (req, res) => {
  const games = await pool.query('SELECT * FROM games')
    res.render('juegos/list', {games});
});

module.exports = router;