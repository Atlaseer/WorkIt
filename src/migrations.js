import mysql from 'mysql2/promise'
import readFileSync from 'node:fs'
import getProperties from 'properties-file'

var propertiesFilename = '../db.properties'
var properties = getProperties(readFileSync(propertiesFilename))
const connection = await mysql.createConnection({
    host: properties.DB_HOST,
    user: properties.DB_USER,
    password: properties.DB_PWD,
    database: properties.DB_SCHEMA 
})