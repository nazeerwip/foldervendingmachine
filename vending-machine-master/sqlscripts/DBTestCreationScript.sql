DROP DATABASE IF EXISTS	VendingMachineTest;
CREATE DATABASE VendingMachineTest;

USE VendingMachineTest;

CREATE TABLE `Items`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `cost` DECIMAL(5,2),
    `quantity` int,
    PRIMARY KEY (`id`)

);

INSERT INTO `Items` (`name`, `cost`, `quantity`)
			  VALUES("Chips", 1.15, 3),
                    ("Snickers", 1.00, 6),
                    ("PayDay", .95, 12),
                    ("Cheese Crackers", .78, 8),
                    ("Plain Pop-Tarts", 2.45, 3);