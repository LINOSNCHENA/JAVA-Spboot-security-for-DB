
DELETE FROM roles21;
DELETE FROM users21;

INSERT INTO roles21(name) VALUES('ROLE_USER');
INSERT INTO roles21(name) VALUES('ROLE_MODERATOR');
INSERT INTO roles21(name) VALUES('ROLE_ADMIN');

INSERT INTO users21(username, password) VALUES('Nikolas', 'Nikolas');
INSERT INTO users21(username, password) VALUES('Lorena', 'Lorena');
INSERT INTO users21(username, password) VALUES('Leon', 'Leon');

select * from users21;
select * from roles21;