-- MySQL Script generated by MySQL Workbench
-- 05/06/15 14:40:43
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema rsvp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rsvp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mattandj_rsvp` DEFAULT CHARACTER SET utf8 ;
USE `mattandj_rsvp` ;

-- -----------------------------------------------------
-- Table `mattandj_rsvp`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mattandj_rsvp`.`guest` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(90) NULL DEFAULT NULL,
  `lastName` VARCHAR(90) NULL DEFAULT NULL,
  `phoneNumber` VARCHAR(90) NULL DEFAULT NULL,
  `address` VARCHAR(90) NULL DEFAULT NULL,
  `notes` VARCHAR(255) NULL DEFAULT NULL,
  `mealId` INT(11) NULL DEFAULT NULL,
  `partySize` VARCHAR(90) NULL DEFAULT NULL,
  `statusId` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `association` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mattandj_rsvp`.`meal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mattandj_rsvp`.`meal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mattandj_rsvp`.`pass_rsvp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mattandj_rsvp`.`pass_rsvp` (
  `id` INT(11) NOT NULL DEFAULT '0',
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mattandj_rsvp`.`plusone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mattandj_rsvp`.`plusone` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `guestID` INT(11) NOT NULL,
  `Name` VARCHAR(90) NULL DEFAULT NULL,
  `mealId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `guestkey_idx` (`guestID` ASC),
  CONSTRAINT `guestkey`
    FOREIGN KEY (`guestID`)
    REFERENCES `mattandj_rsvp`.`guest` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mattandj_rsvp`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mattandj_rsvp`.`status` (
  `id` INT(11) NOT NULL,
  `value` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
