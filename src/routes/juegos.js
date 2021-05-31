const express = require('express');
const fileUpload = require('express-fileupload');
const router = express.Router();
const util = require('util');
const path = require('path');


const app = express();


app.use(fileUpload())
    //Conexion a la BD
const pool = require('../database');
const { url } = require('inspector');

//Ruta para entrar en Add juegos
router.get('/add', (req, res) => {
    res.render('juegos/add');
});
router.post('/add', async(req, res) => {
    console.log(req.files.img);
    try {
        console.log(req.files.img);
        const file = req.files.img;
        const filename = file.name;
        const size = file.data.length;
        const extension = path.extname(filename);
        console.log(extension)
        const allowedextensions = /png|jpeg|jpg/;
        if (!allowedextensions.test(extension)) throw "La extensión del archivo no es soportada";
        if (size > 10000000) throw "El tamaño del archivo debe ser 10MB máximo";
        const name = file.name;
        console.log(file.name);
        const nombre = req.body.nombre;
        const descripcoin = req.body.descripcoin;
        const URL = "./src/public/catalogo/" + name;
        await pool.query('INSERT INTO games (nombre,descripcoin,img_url) VALUES ("' + nombre + '","' + descripcoin + '","' + name + '")');
        console.log(URL);
        util.promisify(file.mv)(URL);
        //const games = await pool.query('SELECT * FROM games')
        req.flash('success', 'El juego ha sido agregado al catálogo de manera exitosa.');
        res.redirect('add');
    } catch (error) {
        console.log(error)
        res.status(500).json({

        })
    }
});

//Ruta que lee los juegos
router.get('/', async(req, res) => {
    const games = await pool.query('SELECT * FROM games')
    res.render('juegos/list', { games });
});

router.get('/detalles/:id', async(req, res) => {
    id_game = req.params.id;
    const game = await pool.query('SELECT * FROM games WHERE id_game =' + id_game);
    console.log(game);
    res.render('juegos/detalles', { game });
});

module.exports = router;