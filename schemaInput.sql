use presly;
---- WRONG METHOD

DELETE FROM authorities WHERE username = "root1";
DELETE FROM authorities WHERE username = "root2";


INSERT INTO users (username, password, enabled)
VALUES ('root2', 'root2', 1);
INSERT INTO users (username, password, enabled)
VALUES ('root3', 'root3', 1);

INSERT INTO authorities (username, authority)
VALUES ('root2', 'ROLE_USER');

INSERT INTO authorities (username, authority)
VALUES ('root3', 'ROLE_ADMIN');

SELECT * FROM authorities, users
