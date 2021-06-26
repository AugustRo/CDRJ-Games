const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const fileUpload = require('express-fileupload');
const flash = require('connect-flash');
const session = require('express-session');
const {database} = require('./keys');
const validator = require('express-validator');
const passport = require('passport');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');
// const helmet = require("helmet");
const fs = require('fs');
const https = require('https');
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

app.use(session({
    secret: 'CDJRGAMES',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}))

//Middleware
//app.use(helmet());
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());

//Variables globales
app.use((req,res, next) => {
    app.locals.message = req.flash('message');
    app.locals.success = req.flash('success'); 
    app.locals.user = req.user;   
    next();
})

//Rutas para la página
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/juegos',require('./routes/juegos'));
app.use('/mi_lista', require('./routes/mi_lista'));
app.use(express.static(path.join(__dirname,'/public')));

//Servidor HTTP
app.listen(app.get('port'), ()=>{
    console.log('Servidor en el puerto:',app.get('port'));
});

//Servidor HTTPS

// https.createServer({
//     key: fs.readFileSync(__dirname + '/'+ 'my_cert.key'),
//     cert: fs.readFileSync(__dirname + '/'+ 'my_cert.crt')
//   }, app).listen(app.get('port'), ()=>{
//     console.log('Servidor en el puerto:',app.get('port'));
// });

// app.get('/', function(req, res){
//     console.log('Hello, I am foo.');
//     res.render('index');
// });

