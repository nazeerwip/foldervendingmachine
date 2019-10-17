DROP DATABASE IF EXISTS	VendingMachine;
CREATE DATABASE VendingMachine;

USE VendingMachine;

CREATE TABLE `Items`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `cost` DECIMAL(5,2),
    `quantity` int,
    PRIMARY KEY (`id`)

);