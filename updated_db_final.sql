-- MySQL Script generated by MySQL Workbench
-- Sat Feb 27 08:00:43 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema inslydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inslydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inslydb` DEFAULT CHARACTER SET utf8 ;
USE `inslydb` ;

-- -----------------------------------------------------
-- Table `inslydb`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inslydb`.`language` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(55) NOT NULL,
  `code` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inslydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inslydb`.`employee` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  `ssn` VARCHAR(20) NOT NULL,
  `birthday` DATETIME NULL DEFAULT NULL,
  `contact` VARCHAR(11) NOT NULL,
  `is_current` TINYINT(1) NULL DEFAULT NULL,
  `created_by` INT(11) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ssn_index` (`ssn` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inslydb`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inslydb`.`education` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `school` TEXT NOT NULL,
  `degree` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `language_id` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `language_id`, `employee_id`),
  INDEX `fk_education_language1_idx` (`language_id` ASC) ,
  INDEX `fk_education_employee1_idx` (`employee_id` ASC) ,
  CONSTRAINT `fk_education_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `inslydb`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `inslydb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inslydb`.`work_experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inslydb`.`work_experience` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `company` VARCHAR(255) NOT NULL,
  `employment_type` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NULL DEFAULT NULL,
  `employee_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `employee_id`, `language_id`),
  INDEX `fk_work_experience_employee1_idx` (`employee_id` ASC) ,
  INDEX `fk_work_experience_language1_idx` (`language_id` ASC) ,
  CONSTRAINT `fk_work_experience_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `inslydb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_experience_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `inslydb`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
