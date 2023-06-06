CREATE DATABASE IF NOT EXISTS `test-kabum`;
USE `test-kabum`;

-- `users` table structure
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users`
(
  `user_id`           INT           NOT NULL AUTO_INCREMENT,
  `username`          VARCHAR(32)   NOT NULL,
  `password`          VARCHAR(256)  NOT NULL,
  `active`            TINYINT       NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
);

-- `clients` table structure
DROP TABLE IF EXISTS `clients`;

CREATE TABLE IF NOT EXISTS `clients`
(
  `client_id`         INT           NOT NULL AUTO_INCREMENT,
  `name`              VARCHAR(80)   NOT NULL,
  `cpf`               VARCHAR(11)   NOT NULL,
  `rg`                VARCHAR(12)   NOT NULL,
  `birthdate`         DATE          NOT NULL,
  `phone`             VARCHAR(12)   NOT NULL,
  PRIMARY KEY (`client_id`)
);

-- `address` table structure
DROP TABLE IF EXISTS `address`;

CREATE TABLE IF NOT EXISTS `address`
(
  `address_id`        INT           NOT NULL AUTO_INCREMENT,
  `client_id`         INT           NOT NULL,
  `cep`               VARCHAR(8)    NOT NULL,
  `identification`    VARCHAR(64)   NOT NULL,
  `street`            VARCHAR(128)  NOT NULL,
  `number`            VARCHAR(6)    NOT NULL,
  `complement`        VARCHAR(32)   DEFAULT NULL,
  `reference`         VARCHAR(32)   DEFAULT NULL,
  `neighborhood`      VARCHAR(64)   NOT NULL,
  `city`              VARCHAR(64)   NOT NULL,
  `state`             VARCHAR(2)    NOT NULL,
  PRIMARY KEY (`address_id`),
  FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
);

