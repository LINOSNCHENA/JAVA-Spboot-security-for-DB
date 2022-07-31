const pg = require('pg');
const R = require('ramda');
const cs = 'postgres://postgres:Pemba2018@localhost:5432/presly';

const client = new pg.Client(cs);
client.connect();

client.query('SELECT * FROM users').then(res => {
    const data = res.rows;
    console.log('all data===============11========');
    data.forEach(row => {
        console.log(`Id: ${row.id} Name: ${row.name} Price: ${row.price}`);
        console.log(`Id: ${row.id} UserName: ${row.username} Password: ${row.password}`);
    })
    console.log('all data================22=======');
    console.log('Sorted prices:');
    const prices = R.pluck('price', R.sortBy(R.prop('price'), data));
    console.log(prices);

}).finally(() => {
    client.end()
});