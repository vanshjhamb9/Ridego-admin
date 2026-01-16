// Ridego - database:

// root@e2e-68-139:/home/Admin-Ridego/middleware# 
// auth.js  databse_query.js  db.js  send.js
// root@e2e-68-139:/home/Admin-Ridego/middleware# cat db.js
const mysql = require("mysql2");
const fs = require('fs');


const DB_HOST = process.env.DB_HOST || '127.0.0.1';
const DB_USER = process.env.DB_USER || 'inowix';
const DB_PASS = process.env.DB_PASS || 'Inowix@123';
const DB_NAME = process.env.DB_NAME || 'ridego_db';

console.log('DB config:', { host: DB_HOST, user: DB_USER, database: DB_NAME });

var connection = mysql.createPool({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASS,
    database: DB_NAME,
    waitForConnections: true,
    connectionLimit: 1000,
    charset: 'utf8mb4'
});

// var connection = mysql.createPool({
//     host: 'localhost',
//     port: 3306,
//     user: 'root',
//     password: 'Shekhar@2024',
//     database: 'RiderAppDB',
//     connectionLimit: 100,
//     charset: 'utf8mb4',
//     // ssl: {
//     //     ca: fs.readFileSync('ca.pem')
//     // }
// });


const mySqlQury = (qry) => {
    return new Promise((resolve, reject) => {
        connection.query(qry, (err, row) => {
            if (err) return reject(err);
            resolve(row)
        })
    })
}




module.exports = { connection, mySqlQury }