-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `cust_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`cust_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `order_id` INT NOT NULL,
  `cust_id` INT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `order-customer`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Customers` (`cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Goods_total`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Goods_total` (
  `good_id` INT NOT NULL,
  `good_name` VARCHAR(45) NULL,
  `total_quantity` INT NULL,
  PRIMARY KEY (`good_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_Goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order_Goods` (
  `order_id` INT NOT NULL,
  `good_id` INT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `good-order`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `good-warehouse`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Goods_total` (`good_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
