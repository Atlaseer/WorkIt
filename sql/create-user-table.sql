-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- 
-- Schema workit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema workit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `workit` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `workit` ;

-- -----------------------------------------------------
-- Table `workit`.`exercises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `workit`.`exercises` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `exercise_name` VARCHAR(50) NOT NULL,
  `targeted_muscle` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `workit`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `workit`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `workit`.`workouts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `workit`.`workouts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workout_day` VARCHAR(50) NOT NULL,
  `workout_duration` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workouts_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_workouts_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `workit`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `workit`.`sets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `workit`.`sets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `weight` DECIMAL(5,2) NULL DEFAULT NULL,
  `reps` ENUM('reps', 'duration') NULL DEFAULT NULL,
  `exercises_id` INT NOT NULL,
  `workouts_id` INT NOT NULL,
  PRIMARY KEY (`id`, `exercises_id`, `workouts_id`),
  INDEX `fk_sets_exercises1_idx` (`exercises_id` ASC) VISIBLE,
  INDEX `fk_sets_workouts1_idx` (`workouts_id` ASC) VISIBLE,
  CONSTRAINT `fk_sets_exercises1`
    FOREIGN KEY (`exercises_id`)
    REFERENCES `workit`.`exercises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sets_workouts1`
    FOREIGN KEY (`workouts_id`)
    REFERENCES `workit`.`workouts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;