
create table if NOT EXISTS usersx(
      id serial primary key, 
      -- ID IDENTITY primary key,
      email VARCHAR,
      password VARCHAR,
      username VARCHAR
);

CREATE TABLE if not exists rolesx (
      id serial primary key, 
      -- id INTEGER NOT NULL AUTO_INCREMENT,
      name VARCHAR(128) NOT NULL,
      PRIMARY KEY (id)
);

Create table IF NOT EXISTS user_roles (
      user_id bigint not null,
      role_id integer not null,
      primary key (user_id, role_id)
)