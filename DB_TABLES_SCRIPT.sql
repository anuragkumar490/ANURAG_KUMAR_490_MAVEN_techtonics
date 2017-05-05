DROP DATABASE IF EXISTS `atmecs`;

CREATE DATABASE `atmecs`;

USE `atmecs`;

DROP TABLE IF EXISTS `atmecs`.`users`;

CREATE TABLE `atmecs`.`Users` (
  `srno` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`srno`)
)
ENGINE = InnoDB;

-- NOTE: Creating Index on `atmecs`.`Users`.`email`: Required for creating reference
/*

When creating a foreign key constraint,
MySQL requires a usable index on both the referencing table and also on the referenced table.
The index on the referencing table is created automatically if one doesn't exist,
but the one on the referenced table needs to be created manually.

*/

CREATE INDEX ix_email_id ON `atmecs`.`Users` (email);


DROP TABLE IF EXISTS `atmecs`.`techtonics`;

CREATE TABLE `atmecs`.`techtonics` (
  `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  `presenter` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `atmecs`.`registered`;

CREATE TABLE `atmecs`.`registered` (
  `reg_id` INTEGER UNSIGNED NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`reg_id`, `email`),
  CONSTRAINT `FK_Registered1` FOREIGN KEY `FK_Registered1` (`reg_id`)
    REFERENCES `techtonics` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Registered2` FOREIGN KEY `FK_Registered2` (`email`)
    REFERENCES `users` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `atmecs`.`requests`;

CREATE TABLE `atmecs`.`requests` (
  `req_id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `topic` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `status` VARCHAR(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`req_id`),
  CONSTRAINT `FK_Requests_1` FOREIGN KEY `FK_Requests_1` (`email`)
    REFERENCES `users` (`email`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)
ENGINE = InnoDB;




INSERT INTO users(name, email, password) VALUES(
						'Anurag',
						'anurag.kumar@atmecs.com',
						'1234'
						);

INSERT INTO users(name, email, password) VALUES(
						'Rahman',
						'rahman@atmecs.com',
						'100'
						);
						
INSERT INTO users(name, email, password) VALUES(
						'Rahul',
						'rahul@atmecs.com',
						'100'
						);
						
INSERT INTO users(name, email, password) VALUES(
						'Yogesh',
						'yogesh@atmecs.com',
						'100'
						);
						
INSERT INTO users(name, email, password) VALUES(
						'Prakash',
						'prakash@atmecs.com',
						'100'
						);
						
INSERT INTO users(name, email, password) VALUES(
						'Vikram',
						'vikram@atmecs.com',
						'100'
						);





INSERT INTO techtonics(date, title, description, presenter) VALUES('2017-05-04 00:00:00', 'ToastMasters', 'Speak English in Confidence', 'Mr. Bhanu');
INSERT INTO techtonics(date, title, description, presenter) VALUES('2017-05-09 00:00:00', 'Android', 'Getting started with Android.', 'Mr. Andy Rubik');
INSERT INTO techtonics(date, title, description, presenter) VALUES('2017-05-11 16:07:00', 'Docker', 'Docker as a Containter.', 'Mr. Dock');
INSERT INTO techtonics(date, title, description, presenter) VALUES('2017-05-15 16:30:00', 'Ansible', 'Ansible as a Configuration management tool', 'Mr. Dock');
INSERT INTO techtonics(date, title, description, presenter) VALUES('2017-05-17 16:30:00', 'Virtualization', 'Virtualization as a foundation to Cloud Computing.', 'Mr. Virtual');



INSERT INTO registered VALUES(3, 'prakash@atmecs.com');
INSERT INTO registered VALUES(4, 'prakash@atmecs.com');
INSERT INTO registered VALUES(4, 'rahman@atmecs.com');
INSERT INTO registered VALUES(4, 'rahul@atmecs.com');
INSERT INTO registered VALUES(3, 'vikram@atmecs.com');
INSERT INTO registered VALUES(4, 'vikram@atmecs.com');
INSERT INTO registered VALUES(3, 'yogesh@atmecs.com');
INSERT INTO registered VALUES(4, 'yogesh@atmecs.com');




INSERT INTO requests(date, topic, email) VALUES('2017-05-04', 'AngularJS', 'prakash@atmecs.com');
INSERT INTO requests(date, topic, email) VALUES('2017-05-04', 'JavaScript', 'rahman@atmecs.com');


-- DELETE FROM users WHERE email='rahman@atmecs.com'; FAIL DUE TO REFERENTIAL INTEGRITY CONSTRAINT