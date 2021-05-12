const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const fileUpload = require('express-fileupload');
const passport = require('passport');
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const {database} = require('./keys');

//Inicializar
const app = express();
require('./lib/passport');
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

app.use(session({
    secret: 'CDJRGAMES',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}))

//Middleware
app.use(flash());
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());

//Variables globales
app.use((req,res, next) => {
    app.locals.message = req.flash('message');
    app.locals.success = req.flash('success');    
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
