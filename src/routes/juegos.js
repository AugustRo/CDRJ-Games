const express = require('express');
const fileUpload = require('express-fileupload');
const router = express.Router();
const fs = require('fs');
const busboy = require('connect-busboy');
//Conexion a la BD
const pool = require('../database');
router.use(busboy());
router.use(fileUpload());

/*router.post('/add', function(req, res) {
  var fstream;
  console.log(req.body);
  req.pipe(req.busboy);
  req.busboy.on('file', function (fieldname, file, filename) {
      console.log("Uploading: " + filename); 
      fstream = fs.createWriteStream(__dirname + '/../catalogo/' + filename);
      file.pipe(fstream);
      fstream.on('close', function () {
          res.redirect('back');
      });
  });
  console.log(req.busboy.filename);
});
*/
router.post('/add', (req, res) => {
  if(req.files){
    console.log(req.files)
    var file = req.files.img
    var filename = img.name
    console.log(filename)
  }
});


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