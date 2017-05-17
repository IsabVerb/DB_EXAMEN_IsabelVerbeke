-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exam_exercise2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exam_exercise2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exam_exercise2` DEFAULT CHARACTER SET utf8 ;
USE `exam_exercise2` ;

-- -----------------------------------------------------
-- Table `exam_exercise2`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam_exercise2`.`patient` (
  `id_patient` INT NOT NULL,
  `pat_name` VARCHAR(45) NULL,
  `pat_sex` ENUM('Male', 'Female') NULL,
  `pat_leeftijd_diagnose` TEXT(50) NULL,
  PRIMARY KEY (`id_patient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam_exercise2`.`gen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam_exercise2`.`gen` (
  `gen_id` INT NOT NULL,
  `gen_name` VARCHAR(45) NULL,
  `gen_locatie` VARCHAR(45) NULL,
  `gen_beschrijving` TEXT(50) NULL,
  PRIMARY KEY (`gen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam_exercise2`.`mutatie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam_exercise2`.`mutatie` (
  `chromosomale_locatie` VARCHAR(10) NULL,
  `mutatie_id` INT NOT NULL,
  `id_patient` INT NULL,
  `gen_id` INT NULL,
  PRIMARY KEY (`mutatie_id`),
  INDEX `fk_mutatie_pat_idx` (`id_patient` ASC),
  INDEX `fk_mutatie_gen_idx` (`gen_id` ASC),
  CONSTRAINT `fk_mutatie_pat`
    FOREIGN KEY (`id_patient`)
    REFERENCES `exam_exercise2`.`patient` (`id_patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mutatie_gen`
    FOREIGN KEY (`gen_id`)
    REFERENCES `exam_exercise2`.`gen` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
