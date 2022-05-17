-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema student_reportbook
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema student_reportbook
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `student_reportbook` DEFAULT CHARACTER SET utf8 ;
USE `student_reportbook` ;

-- -----------------------------------------------------
-- Table `student_reportbook`.`student_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_reportbook`.`student_info` (
  `student_id` VARCHAR(90) NOT NULL,
  `student_name` VARCHAR(120) NOT NULL,
  `student_class` VARCHAR(45) NOT NULL,
  `student_DOB` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_reportbook`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_reportbook`.`subjects` (
  `subject_id` VARCHAR(90) NOT NULL,
  `subject_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subject_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_reportbook`.`student_result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_reportbook`.`student_result` (
  `result_id` INT NOT NULL,
  `first_ca` DOUBLE NOT NULL DEFAULT 0.0,
  `second_ca` DOUBLE NOT NULL DEFAULT 0.0,
  `third_ca` DOUBLE NOT NULL DEFAULT 0.0,
  `fourth_ca` DOUBLE NOT NULL DEFAULT 0.0,
  `exam_score` DOUBLE NOT NULL DEFAULT 0.0,
  `result_term` VARCHAR(45) NOT NULL,
  `subject_offered_id` VARCHAR(90) NOT NULL,
  `r_student_id` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`result_id`),
  INDEX `fk_student_result_subject_offered1_idx` (`subject_offered_id` ASC) VISIBLE,
  INDEX `fk_student_result_student_info1_idx` (`r_student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_result_subject_offered1`
    FOREIGN KEY (`subject_offered_id`)
    REFERENCES `student_reportbook`.`subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_result_student_info1`
    FOREIGN KEY (`r_student_id`)
    REFERENCES `student_reportbook`.`student_info` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student_reportbook`.`student_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student_reportbook`.`student_subject` (
  `student_id` VARCHAR(90) NOT NULL,
  `subject_id` VARCHAR(90) NOT NULL,
  INDEX `fk_student_subject_student_info1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_student_subject_subjects1_idx` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_subject_student_info1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student_reportbook`.`student_info` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_subject_subjects1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `student_reportbook`.`subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
