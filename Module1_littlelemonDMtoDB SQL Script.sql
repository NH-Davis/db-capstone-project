-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemon` DEFAULT CHARACTER SET utf8 ;
USE `littlelemon` ;

-- -----------------------------------------------------
-- Table `littlelemon`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`Customer` (
  `CustomerID` VARCHAR(45) NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerEmail` VARCHAR(45) NULL,
  `CustomerPhone` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`Booking` (
  `BookingID` VARCHAR(45) NOT NULL,
  `TableNumber` INT NULL,
  `BookingDate` DATE NULL,
  `CustomerID` VARCHAR(45) NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemon`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`Menu` (
  `MenuID` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NULL,
  `Main` VARCHAR(45) NULL,
  `Starter` VARCHAR(45) NULL,
  `Dessert` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Side` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`Orders` (
  `OrderID` VARCHAR(45) NOT NULL,
  `BookingID` VARCHAR(45) NULL,
  `MenuID` VARCHAR(45) NULL,
  `Cost` DECIMAL(10,2) NULL,
  `Sales` DECIMAL(10,2) NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_BookingID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_MenuID_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `littlelemon`.`Booking` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemon`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
