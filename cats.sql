CREATE DATABASE cats_db;

USE cats_db;

CREATE TABLE cats
  (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
  );

INSERT INTO cats (name, age) VALUES
  ("Tom", 6),
  ("Jerry's Bane", 15);

SELECT * FROM cats;
