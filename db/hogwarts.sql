DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE students (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4,
  house VARCHAR(255)
  -- house_id INT8 REFERENCES houses( id ) ON DELETE CASCADE
);

CREATE TABLE houses (
  id SERIAL8,
  name VARCHAR(255),
  logo_url VARCHAR(255)
);

INSERT INTO houses( name, logo_url ) VALUES ( 'Gryffindor', 'http://i.imgur.com/j3DbO29.jpg' );
INSERT INTO houses( name, logo_url ) VALUES ( 'Hufflepuff', 'http://i.imgur.com/ceIkZAj.jpg' );
INSERT INTO houses( name, logo_url ) VALUES ( 'Slytherin', 'http://imgur.com/GgXzKzn.jpg' );
INSERT INTO houses( name, logo_url ) VALUES ( 'Ravenclaw', 'http://imgur.com/3czS2cK.jpg' );