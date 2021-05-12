const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const fileUpload = require('express-fileupload');
const { end } = require('./database');
const fs = require('fs');
const busboy = require('connect-busboy');

const { database } = require('./keys');

const session = require('express-session');
const validator = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');

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

app.use(flash());
app.use(passport.initialize());
app.use(passport.session());

app.use(session({
    secret: 'CDRJ_GAMES',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
  }));



//Variables globales
app.use((req,res, next) => {
    next();
})

//Rutas
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/juegos',require('./routes/juegos'));
app.use('/login',require('./routes/login'));
app.use('/signup', require('./routes/signup'));
app.use('/mi_lista', require('./routes/mi_lista'));
app.use('/profile', require('./routes/profile'));
//Archivos publicos
app.use(express.static(path.join(__dirname,'public')));

//Comenzar servidor
app.listen(app.get('port'), ()=>{
    console.log('Servidor en el puerto:',app.get('port'));
});

//Variables globales
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.success = req.flash('message');
    next();
});
