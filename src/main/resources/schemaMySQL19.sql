use presly;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;
-- users table structure
CREATE TABLE `users` (
  `username` VARCHAR(90) NOT NULL,
  `password` VARCHAR(90) NOT NULL,
  `enabled` INT NOT NULL,
  PRIMARY KEY (`username`)
);
-- authorities table structure
CREATE TABLE `authorities` (
  `username` VARCHAR(90) NOT NULL,
  `authority` VARCHAR(90) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`)
  REFERENCES `users` (`username`)
);

use presly;
DELETE FROM authorities WHERE  username = "rootx1";
DELETE FROM authorities WHERE  username = "rootx2";

DELETE FROM users WHERE  username = "rootx1";
DELETE FROM users WHERE  username = "rootx2";

select count(*) from users, authorities;
select * from users, authorities;

{
	"userName":"rootx1",
	"password":"Monze2019@",
	"roles":"ROLE_ADMIN"
}
http://localhost:8080/register?userName=rootx1&password=Monze2019@&roles=ROLE_ADMIN
{
	"userName":"rootx2",
	"password":"Monze2019@",
	"roles":"ROLE_USER"
}





