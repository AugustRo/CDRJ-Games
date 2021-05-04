SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema database_cdjr_games
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `database_cdjr_games` DEFAULT CHARACTER SET utf8mb4 ;
USE `database_cdjr_games` ;

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
-- Table `database_cdjr_games`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`games` (
  `id_game` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcoin` VARCHAR(45) NULL,
  `valoracion` INT NULL,
  `users_id` INT(11) NOT NULL,
  `img_url` VARCHAR(150) NULL,
  `gamescol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_game`, `users_id`),
  UNIQUE INDEX `id_game_UNIQUE` (`id_game` ASC),
  INDEX `fk_games-list_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_games-list_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `database_cdjr_games`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`genres` (
  `id_genres` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `games-list_id_game` INT UNSIGNED NOT NULL,
  `games-list_users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id_genres`, `games-list_id_game`, `games-list_users_id`),
  UNIQUE INDEX `idgenres_UNIQUE` (`id_genres` ASC),
  INDEX `fk_genres_games-list1_idx` (`games-list_id_game` ASC, `games-list_users_id` ASC),
  CONSTRAINT `fk_genres_games-list1`
    FOREIGN KEY (`games-list_id_game` , `games-list_users_id`)
    REFERENCES `database_cdjr_games`.`games` (`id_game` , `users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`comments` (
  `id_comment` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comentario` MEDIUMTEXT NOT NULL,
  `games-list_id_game` INT UNSIGNED NOT NULL,
  `games-list_users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id_comment`, `games-list_id_game`, `games-list_users_id`),
  INDEX `fk_comments_games-list1_idx` (`games-list_id_game` ASC, `games-list_users_id` ASC),
  CONSTRAINT `fk_comments_games-list1`
    FOREIGN KEY (`games-list_id_game` , `games-list_users_id`)
    REFERENCES `database_cdjr_games`.`games` (`id_game` , `users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database_cdjr_games`.`links`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database_cdjr_games`.`links` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(150) NULL,
  `url` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL,
  `linkscol` VARCHAR(45) NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  UNIQUE INDEX `idlinks_UNIQUE` (`id` ASC),
  INDEX `fk_links_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_links_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `database_cdjr_games`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
