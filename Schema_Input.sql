INSERT INTO roles(name) VALUES('ROLE_USER');
INSERT INTO roles(name) VALUES('ROLE_MODERATOR');
INSERT INTO roles(name) VALUES('ROLE_ADMIN');

DROP TABLE IF EXISTS users;
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(255), password varchar);
INSERT INTO users(username, password) VALUES('User1-Audi', 52642);
INSERT INTO users(username, password) VALUES('user2-Mercedes', 57127);

DROP TABLE IF EXISTS roles;
CREATE TABLE roles(id SERIAL PRIMARY KEY, name VARCHAR(255), password varchar);
INSERT INTO roles(name, password) VALUES('role1-Audi', 52642);
INSERT INTO roles(name, password) VALUES('role2-Mercedes', 57127);

select * from users;
