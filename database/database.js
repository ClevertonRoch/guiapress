const Sequelize = require("sequelize");

const connection = new Sequelize('nativawebsite', 'nativawebsite', 'filhotinho1',{
    host: 'mysql.nativawebsite.kinghost.net',
    dialect: 'mysql',
    timezone: "-04:00"
});

module.exports = connection;

