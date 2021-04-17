const express = require('express');
const morgan = require('morgan');

//Inicializar
const app = express();

//Configuraciones
app.set('port',process.env.PORT || 4000);

//Middleware
app.use(morgan('dev'));

//Variables globales

//Rutas

//Archivos publicos

//Comenzar servidor
app.listen(app.get('port'), ()=>{
    console.log('Servidor en el puerto:',app.get('port'));
});

