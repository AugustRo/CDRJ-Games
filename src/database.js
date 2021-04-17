const mysql = require('mysql');
const {promisify} = require('util');
const {database} = require('./keys');

const pool= mysql.createPool(database);

pool.getConnection((err, connection) => {
    if(err){
        if(err.code ==='PROTOCOL_CONNECTION_LOST') {
        console.error('La conexion de la database fue cerrada.')    
        }
        if (err.code ==='ER_CON_COUNT_ERROR'){
        console.error('La conexion con la database tiene muchas conexiones')    
         }
        if (err.code === 'ECONNREFUSED'){
        console.error('La conexion con la database fue rechazada')
        }
    }
    if(connection) connection.release();
    console.log('La database esta conectada');
    return;
});
//Promesas Pool Query

pool.query = promisify(pool.query);

module.exports =pool;

