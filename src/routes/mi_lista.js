const express = require ('express');
const router = express.Router();
const {isLoggedIn} = require('../lib/auth');

//Conexión a la BD

const pool = require('../database');
const { route } = require('./juegos');

router.get('/',isLoggedIn, async(req, res) => {
    const games = await pool.query('SELECT * FROM mi_lista WHERE user_id = ?', [req.user.id]);

    res.render('juegos/mi_lista', { games });
});

router.post('/add/:id',isLoggedIn, async(req, res) => {
    const id_game = req.params.id;


    const user_id = req.user.id; 
    const condicion = await pool.query('SELECT (EXISTS(SELECT 1 FROM mi_lista WHERE id_game = ?)) as condicion',[id_game]);
    console.log(condicion[0]);
    if (condicion[0].condicion == '1') {
        req.flash('message', 'El juego ya se encuentra en tu lista.');
        res.redirect('../');
    }else{
    const tabla2 =  await pool.query('SELECT nombre, descripcoin, img_url FROM games WHERE id_game = ?',[id_game]);
    console.log(tabla2);
    const nombre = tabla2[0].nombre;
    const descripcoin = tabla2[0].descripcoin;
    const img_url = tabla2[0].img_url;

    await pool.query('INSERT INTO mi_lista (nombre,descripcoin,img_url,user_id,id_game) VALUES ("' + nombre + '","' + descripcoin + '","' + img_url + '","' + user_id + '","' + id_game + '")');

  

    req.flash('success', 'El juego ha sido agregado a su lista de manera exitosa.');
    res.redirect('../');
    }
});


module.exports = router;