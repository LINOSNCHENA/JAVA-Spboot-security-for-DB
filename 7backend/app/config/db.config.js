const Sequelize = require("sequelize");

var db1 = new Sequelize('edbt_trad', 'tasks', '126TorvamS', {
    host: 'pge11tdv.cezdata.corp',
    dialect: 'postgres', // pick one of 'mysql','sqlite','postgres','mssql',
    port: 5434,
});

var db = new Sequelize('presly', 'postgres', 'Pemba2018', {
    host: 'localhost',
    dialect: 'postgres', // pick one of 'mysql','sqlite','postgres','mssql',
    port: 5432,
});

module.exports = { db: db, Sequelize: Sequelize };