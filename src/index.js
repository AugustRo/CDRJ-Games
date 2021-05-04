const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const fileUpload = require('express-fileupload');
const { end } = require('./database');
const fs = require('fs');
const busboy = require('connect-busboy');

//Inicializar
const app = express();
app.use(fileUpload({
    createParentPath: true
}));

//Configuraciones
app.set('port',process.env.PORT || 4000);
app.set('views',path.join(__dirname, 'views'));
app.engine('.hbs',exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'),'layouts'),  
    partialsDir: path.join(app.get('views'),'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

//Middleware
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Variables globales
app.use((req,res, next) => {
    next();
})

//Rutas
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/juegos',require('./routes/juegos'));
app.use('/login',require('./routes/login'));
app.use('/signup',require('./routes/signup'));
app.use('/mi_lista', require('./routes/mi_lista'));
//Archivos publicos
app.use(express.static(path.join(__dirname,'public')));

//Comenzar servidor
app.listen(app.get('port'), ()=>{
    console.log('Servidor en el puerto:',app.get('port'));
});
