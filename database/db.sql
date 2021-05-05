-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema database_cdjr_games
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema database_cdjr_games
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `database_cdjr_games` DEFAULT CHARACTER SET utf8mb4 ;
USE `database_cdjr_games` ;

-- -----------------------------------------------------
-- Table `database_cdjr_games`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`games` (
  `id_game` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcoin` VARCHAR(45) NULL DEFAULT NULL,
  `valoracion` INT(11) NULL DEFAULT NULL,
  `img_url` VARCHAR(150) NULL DEFAULT NULL,
  `gamescol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_game`),
  UNIQUE INDEX `id_game_UNIQUE` (`id_game` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`comments` (
  `id_comment` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comentario` MEDIUMTEXT NOT NULL,
  `game_id_game` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_comment`, `game_id_game`),
  INDEX `fk_comments_games-list1_idx` (`game_id_game` ASC) ,
  CONSTRAINT `fk_comments_games-list1`
    FOREIGN KEY (`game_id_game`)
    REFERENCES `database_cdjr_games`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`genres` (
  `id_genres` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `game_id_game` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_genres`, `game_id_game`),
  UNIQUE INDEX `idgenres_UNIQUE` (`id_genres` ASC) ,
  INDEX `fk_genres_games-list1_idx` (`game_id_game` ASC) ,
  CONSTRAINT `fk_genres_games-list1`
    FOREIGN KEY (`game_id_game`)
    REFERENCES `database_cdjr_games`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `passw` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`lista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`lista` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `users_id` INT(11) NOT NULL,
  `games_id_game` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `games_id_game`),
  UNIQUE INDEX `idlinks_UNIQUE` (`id` ASC) ,
  INDEX `fk_links_users1_idx` (`users_id` ASC) ,
  INDEX `fk_lista_games1_idx` (`games_id_game` ASC) ,
  CONSTRAINT `fk_links_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `database_cdjr_games`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_games1`
    FOREIGN KEY (`games_id_game`)
    REFERENCES `database_cdjr_games`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
