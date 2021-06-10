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
CREATE SCHEMA IF NOT EXISTS `heroku_c238f2dbe557831` DEFAULT CHARACTER SET utf8mb4 ;
USE `heroku_c238f2dbe557831` ;

-- -----------------------------------------------------
-- Table `database_cdjr_games`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`games` (
  `id_game` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcoin` VARCHAR(800) NOT NULL,
  `valoracion` INT(11) NULL DEFAULT NULL,
  `img_url` VARCHAR(150) NOT NULL,
  `lanzamiento` DATE NOT NULL,
  `jugadores` VARCHAR(50) NULL,
  `video_link` TINYTEXT CHARACTER SET 'armscii8' NULL,
  PRIMARY KEY (`id_game`),
  UNIQUE INDEX `id_game_UNIQUE` (`id_game` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`comments` (
  `id_comment` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comentario` MEDIUMTEXT NOT NULL,
  `game_id_game` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_comment`, `game_id_game`),
  INDEX `fk_comments_games-list1_idx` (`game_id_game` ASC) ,
  CONSTRAINT `fk_comments_games-list1`
    FOREIGN KEY (`game_id_game`)
    REFERENCES `heroku_c238f2dbe557831`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`genres` (
  `id_genres` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_genres`),
  UNIQUE INDEX `idgenres_UNIQUE` (`id_genres` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`users` (
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
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`lista` (
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
    REFERENCES `heroku_c238f2dbe557831`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_games1`
    FOREIGN KEY (`games_id_game`)
    REFERENCES `heroku_c238f2dbe557831`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`languages` (
  `id_language` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_language`),
  UNIQUE INDEX `language_UNIQUE` (`language` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`Plataformas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`Plataformas` (
  `id_plataforma` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`games_has_genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`games_has_genres` (
  `games_id_game` INT(10) UNSIGNED NOT NULL,
  `genres_id_genres` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`games_id_game`, `genres_id_genres`),
  INDEX `fk_games_has_genres_genres1_idx` (`genres_id_genres` ASC) ,
  INDEX `fk_games_has_genres_games1_idx` (`games_id_game` ASC) ,
  CONSTRAINT `fk_games_has_genres_games1`
    FOREIGN KEY (`games_id_game`)
    REFERENCES `heroku_c238f2dbe557831`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_genres_genres1`
    FOREIGN KEY (`genres_id_genres`)
    REFERENCES `heroku_c238f2dbe557831`.`genres` (`id_genres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`games_has_languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroku_c238f2dbe557831`.`games_has_languages` (
  `games_id_game` INT(10) UNSIGNED NOT NULL,
  `languages_id_language` INT NOT NULL,
  PRIMARY KEY (`games_id_game`, `languages_id_language`),
  INDEX `fk_games_has_languages_languages1_idx` (`languages_id_language` ASC) ,
  INDEX `fk_games_has_languages_games1_idx` (`games_id_game` ASC) ,
  CONSTRAINT `fk_games_has_languages_games1`
    FOREIGN KEY (`games_id_game`)
    REFERENCES `heroku_c238f2dbe557831`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_languages_languages1`
    FOREIGN KEY (`languages_id_language`)
    REFERENCES `heroku_c238f2dbe557831`.`languages` (`id_language`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`games_has_Plataformas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dheroku_c238f2dbe557831`.`games_has_Plataformas` (
  `games_id_game` INT(10) UNSIGNED NOT NULL,
  `Plataformas_id_plataforma` INT NOT NULL,
  PRIMARY KEY (`games_id_game`, `Plataformas_id_plataforma`),
  INDEX `fk_games_has_Plataformas_Plataformas1_idx` (`Plataformas_id_plataforma` ASC) ,
  INDEX `fk_games_has_Plataformas_games1_idx` (`games_id_game` ASC) ,
  CONSTRAINT `fk_games_has_Plataformas_games1`
    FOREIGN KEY (`games_id_game`)
    REFERENCES `heroku_c238f2dbe557831`.`games` (`id_game`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_Plataformas_Plataformas1`
    FOREIGN KEY (`Plataformas_id_plataforma`)
    REFERENCES `heroku_c238f2dbe557831`.`Plataformas` (`id_plataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
