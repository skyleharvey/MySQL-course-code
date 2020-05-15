DROP DATABASE IF EXISTS who_loves_whom;
CREATE DATABASE who_loves_whom;
USE who_loves_whom;
CREATE TABLE lovebirds
(
  kyle_loves VARCHAR(255),
  jen_loves VARCHAR(255)
);

INSERT INTO lovebirds (kyle_loves, jen_loves) VALUES
('Jen', 'Kyle');

SELECT * FROM lovebirds;
