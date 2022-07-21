
use presly;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;

CREATE TABLE `users`
(
  `username` VARCHAR (90) NOT NULL,
  `password` VARCHAR (90) NOT NULL,
  `enabled` INT NOT NULL,
  PRIMARY KEY (`username`)
);

CREATE TABLE `authorities`
(  `username` VARCHAR(90) NOT NULL,
  `authority` VARCHAR (90) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`)
  REFERENCES `users` (`username`)
);

select count(*)
from users, authorities;
select *
from users, authorities;
