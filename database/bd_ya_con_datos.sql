CREATE DATABASE  IF NOT EXISTS `heroku_c238f2dbe557831` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_c238f2dbe557831`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: us-cdbr-east-04.cleardb.com    Database: heroku_c238f2dbe557831
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comentario` mediumtext NOT NULL,
  `game_id_game` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_comment`,`game_id_game`),
  KEY `fk_comments_games-list1_idx` (`game_id_game`),
  CONSTRAINT `fk_comments_games-list1` FOREIGN KEY (`game_id_game`) REFERENCES `games` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id_game` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcoin` varchar(800) NOT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `img_url` varchar(150) NOT NULL,
  `lanzamiento` date NOT NULL,
  `jugadores` varchar(50) DEFAULT NULL,
  `video_link` tinytext CHARACTER SET armscii8,
  PRIMARY KEY (`id_game`),
  UNIQUE KEY `id_game_UNIQUE` (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'The Legend of Zelda Breath of the Wild','The Legend of Zelda: Breath of the Wild es un videojuego de acción-aventura de 2017 de la serie The Legend of Zelda, desarrollado por la filial Nintendo EPD en colaboración con Monolith Soft y publicado por Nintendo para las consolas Wii U y Nintendo Switch.',9,'1.jpg','0000-00-00',NULL,NULL),(3,'Super Mario 3D All Stars','Super Mario 3D All-Stars es un videojuego compilatorio de plataformas 3D para Nintendo Switch. Este compilado conmemora el 35º aniversario de la franquicia Super Mario de Nintendo.',9,'2.jpg','0000-00-00',NULL,NULL),(4,'Super Smash Bros Ultimate','Super Smash Bros. Ultimate es un videojuego de lucha crossover de la serie Super Smash Bros. desarrollada por Bandai Namco Games y Sora Ltd. y publicado por Nintendo. Este salió a la venta para Nintendo Switch a nivel mundial el 7 de diciembre de 2018. ',9,'3.jpg','0000-00-00',NULL,NULL),(5,'Animal Crossing: New Horizons','Animal Crossing: New Horizons es un videojuego de simulación social desarrollado y publicado por Nintendo para Nintendo Switch, cuya fecha de lanzamiento mundial fue el 20 de marzo de 2020. Es la novena entrega de la saga Animal Crossing.',7,'4.jpg','0000-00-00',NULL,NULL),(6,'Battlefield 1','Battlefield 1 es un videojuego de disparos y acción bélica en primera persona. El título fue desarrollado por DICE y distribuido mundialmente por Electronic Arts para PlayStation 4, Xbox One y Microsoft Windows.',9,'5.jpg','0000-00-00',NULL,NULL),(25,'Dark Souls III','Dark Souls III es un videojuego de rol de acción desarrollado por FromSoftware y publicado por Bandai Namco Entertainment para PlayStation 4, Xbox One y Microsoft Windows. Es la tercera entrega en la saga Souls, ​ Dark Souls III fue lanzado en Japón en marzo de 2016, y de manera mundial en abril del mismo año.​',NULL,'7.jpg','0000-00-00',NULL,NULL),(45,'The Witcher 3: Wild Hunt','The Witcher 3: Wild Hunt es un videojuego de rol desarrollado y publicado por la compañía polaca CD Projekt RED. Esta compañía es la desarrolladora mientras que la distribución corre a cargo de la Warner Bros. Interactive, en el caso de Norteamérica y Bandai Namco para Europa. ',NULL,'12.jpg','0000-00-00',NULL,NULL),(65,'BIOMUTANT','Biomutant es un videojuego perteneciente al género de acción y rol desarrollado por el estudio sueco desarrollador Experiment 101, y publicado por la empresa THQ Nordic. Se lanzó el 25 de mayo de 2021 para Microsoft Windows, PlayStation 4 y Xbox One.',NULL,'EGS_BIOMUTANT_Experiment101_S2-1200x1600-7f18bf0433d6631ea0383abb74e6392a.png','0000-00-00',NULL,NULL),(75,'Halo: The Master Chief Collection','Halo: The Master Chief Collection es una remasterización de los videojuegos de disparos en primera persona de la saga Halo para la consola Xbox One, el cual salió a la venta en Estados Unidos el 11 de noviembre de 2014 y en Europa el 14 de noviembre del mismo año.',NULL,'halo.png','0000-00-00',NULL,NULL),(95,'Crash Bandicoot N. Sane Trilogy','Crash Bandicoot N. Sane Trilogy es un videojuego de plataformas desarrollado por Vicarious Visions y publicado por Activision como una exclusiva temporal para la plataforma PlayStation 4.',NULL,'crash.jpg','0000-00-00',NULL,NULL),(105,'Grand Theft Auto V','Grand Theft Auto V es un videojuego de acción-aventura de mundo abierto desarrollado por el estudio Rockstar North y distribuido por Rockstar Games. Fue lanzado el 17 de septiembre de 2013 para las consolas PlayStation 3 y Xbox 360.​',NULL,'20.jpg','0000-00-00',NULL,NULL),(115,'Ratchet & Clank: Rift Apart ','Ratchet & Clank: Una Dimensión Aparte ​​​ es un videojuego de plataformas desarrollado por Insomniac Games y distribuido por Sony Interactive Entertainment. El videojuego fue lanzado en exclusiva para PlayStation 5.​Se juega desde una perspectiva en tercera persona, al igual que las entregas anteriores.',NULL,'RACRA_ST_PACKSHOT_PS5_ST8_LATAM_RGB_20210125--1-.png','0000-00-00',NULL,NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_has_genres`
--

DROP TABLE IF EXISTS `games_has_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_has_genres` (
  `games_id_game` int(10) unsigned NOT NULL,
  `genres_id_genres` int(10) unsigned NOT NULL,
  PRIMARY KEY (`games_id_game`,`genres_id_genres`),
  KEY `fk_games_has_genres_genres1_idx` (`genres_id_genres`),
  KEY `fk_games_has_genres_games1_idx` (`games_id_game`),
  CONSTRAINT `fk_games_has_genres_games1` FOREIGN KEY (`games_id_game`) REFERENCES `games` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_genres_genres1` FOREIGN KEY (`genres_id_genres`) REFERENCES `genres` (`id_genres`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_has_genres`
--

LOCK TABLES `games_has_genres` WRITE;
/*!40000 ALTER TABLE `games_has_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_has_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_has_languages`
--

DROP TABLE IF EXISTS `games_has_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_has_languages` (
  `games_id_game` int(10) unsigned NOT NULL,
  `languages_id_language` int(11) NOT NULL,
  PRIMARY KEY (`games_id_game`,`languages_id_language`),
  KEY `fk_games_has_languages_languages1_idx` (`languages_id_language`),
  KEY `fk_games_has_languages_games1_idx` (`games_id_game`),
  CONSTRAINT `fk_games_has_languages_games1` FOREIGN KEY (`games_id_game`) REFERENCES `games` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_languages_languages1` FOREIGN KEY (`languages_id_language`) REFERENCES `languages` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_has_languages`
--

LOCK TABLES `games_has_languages` WRITE;
/*!40000 ALTER TABLE `games_has_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_has_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_has_plataformas`
--

DROP TABLE IF EXISTS `games_has_plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_has_plataformas` (
  `games_id_game` int(10) unsigned NOT NULL,
  `Plataformas_id_plataforma` int(11) NOT NULL,
  PRIMARY KEY (`games_id_game`,`Plataformas_id_plataforma`),
  KEY `fk_games_has_Plataformas_Plataformas1_idx` (`Plataformas_id_plataforma`),
  KEY `fk_games_has_Plataformas_games1_idx` (`games_id_game`),
  CONSTRAINT `fk_games_has_Plataformas_Plataformas1` FOREIGN KEY (`Plataformas_id_plataforma`) REFERENCES `plataformas` (`id_plataforma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_Plataformas_games1` FOREIGN KEY (`games_id_game`) REFERENCES `games` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_has_plataformas`
--

LOCK TABLES `games_has_plataformas` WRITE;
/*!40000 ALTER TABLE `games_has_plataformas` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_has_plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id_genres` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_genres`),
  UNIQUE KEY `idgenres_UNIQUE` (`id_genres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id_language` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`id_language`),
  UNIQUE KEY `language_UNIQUE` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista`
--

DROP TABLE IF EXISTS `lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `games_id_game` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`users_id`,`games_id_game`),
  UNIQUE KEY `idlinks_UNIQUE` (`id`),
  KEY `fk_links_users1_idx` (`users_id`),
  KEY `fk_lista_games1_idx` (`games_id_game`),
  CONSTRAINT `fk_links_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_games1` FOREIGN KEY (`games_id_game`) REFERENCES `games` (`id_game`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista`
--

LOCK TABLES `lista` WRITE;
/*!40000 ALTER TABLE `lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mi_lista`
--

DROP TABLE IF EXISTS `mi_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mi_lista` (
  `id_lista` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcoin` varchar(800) NOT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `img_url` varchar(150) NOT NULL,
  `user_id` int(10) NOT NULL,
  `id_game` int(10) NOT NULL,
  `lanzamiento` date NOT NULL,
  `jugadores` varchar(50) DEFAULT NULL,
  `video_link` tinytext CHARACTER SET armscii8,
  PRIMARY KEY (`id_lista`),
  UNIQUE KEY `id_lista_UNIQUE` (`id_lista`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mi_lista`
--

LOCK TABLES `mi_lista` WRITE;
/*!40000 ALTER TABLE `mi_lista` DISABLE KEYS */;
INSERT INTO `mi_lista` VALUES (5,'Grand Theft Auto V','Grand Theft Auto V es un videojuego de acción-aventura de mundo abierto desarrollado por el estudio Rockstar North y distribuido por Rockstar Games. Fue lanzado el 17 de septiembre de 2013 para las consolas PlayStation 3 y Xbox 360.​',NULL,'20.jpg',55,105,'0000-00-00',NULL,NULL),(15,'Dark Souls III','Dark Souls III es un videojuego de rol de acción desarrollado por FromSoftware y publicado por Bandai Namco Entertainment para PlayStation 4, Xbox One y Microsoft Windows. Es la tercera entrega en la saga Souls, ​ Dark Souls III fue lanzado en Japón en marzo de 2016, y de manera mundial en abril del mismo año.​',NULL,'7.jpg',55,25,'0000-00-00',NULL,NULL),(25,'Halo: The Master Chief Collection','Halo: The Master Chief Collection es una remasterización de los videojuegos de disparos en primera persona de la saga Halo para la consola Xbox One, el cual salió a la venta en Estados Unidos el 11 de noviembre de 2014 y en Europa el 14 de noviembre del mismo año.',NULL,'halo.png',55,75,'0000-00-00',NULL,NULL),(35,'Super Smash Bros Ultimate','Super Smash Bros. Ultimate es un videojuego de lucha crossover de la serie Super Smash Bros. desarrollada por Bandai Namco Games y Sora Ltd. y publicado por Nintendo. Este salió a la venta para Nintendo Switch a nivel mundial el 7 de diciembre de 2018. ',NULL,'3.jpg',55,4,'0000-00-00',NULL,NULL),(45,'BIOMUTANT','Biomutant es un videojuego perteneciente al género de acción y rol desarrollado por el estudio sueco desarrollador Experiment 101, y publicado por la empresa THQ Nordic. Se lanzó el 25 de mayo de 2021 para Microsoft Windows, PlayStation 4 y Xbox One.',NULL,'EGS_BIOMUTANT_Experiment101_S2-1200x1600-7f18bf0433d6631ea0383abb74e6392a.png',55,65,'0000-00-00',NULL,NULL),(55,'Ratchet & Clank: Rift Apart ','Ratchet & Clank: Una Dimensión Aparte ​​​ es un videojuego de plataformas desarrollado por Insomniac Games y distribuido por Sony Interactive Entertainment. El videojuego fue lanzado en exclusiva para PlayStation 5.​Se juega desde una perspectiva en tercera persona, al igual que las entregas anteriores.',NULL,'RACRA_ST_PACKSHOT_PS5_ST8_LATAM_RGB_20210125--1-.png',55,115,'0000-00-00',NULL,NULL),(65,'Super Smash Bros Ultimate','Super Smash Bros. Ultimate es un videojuego de lucha crossover de la serie Super Smash Bros. desarrollada por Bandai Namco Games y Sora Ltd. y publicado por Nintendo. Este salió a la venta para Nintendo Switch a nivel mundial el 7 de diciembre de 2018. ',NULL,'3.jpg',55,4,'0000-00-00',NULL,NULL),(75,'Super Smash Bros Ultimate','Super Smash Bros. Ultimate es un videojuego de lucha crossover de la serie Super Smash Bros. desarrollada por Bandai Namco Games y Sora Ltd. y publicado por Nintendo. Este salió a la venta para Nintendo Switch a nivel mundial el 7 de diciembre de 2018. ',NULL,'3.jpg',55,4,'0000-00-00',NULL,NULL),(85,'The Witcher 3: Wild Hunt','The Witcher 3: Wild Hunt es un videojuego de rol desarrollado y publicado por la compañía polaca CD Projekt RED. Esta compañía es la desarrolladora mientras que la distribución corre a cargo de la Warner Bros. Interactive, en el caso de Norteamérica y Bandai Namco para Europa. ',NULL,'12.jpg',55,45,'0000-00-00',NULL,NULL),(95,'Super Smash Bros Ultimate','Super Smash Bros. Ultimate es un videojuego de lucha crossover de la serie Super Smash Bros. desarrollada por Bandai Namco Games y Sora Ltd. y publicado por Nintendo. Este salió a la venta para Nintendo Switch a nivel mundial el 7 de diciembre de 2018. ',NULL,'3.jpg',55,4,'0000-00-00',NULL,NULL),(105,'Super Mario 3D All Stars','Super Mario 3D All-Stars es un videojuego compilatorio de plataformas 3D para Nintendo Switch. Este compilado conmemora el 35º aniversario de la franquicia Super Mario de Nintendo.',NULL,'2.jpg',55,3,'0000-00-00',NULL,NULL),(115,'Super Mario 3D All Stars','Super Mario 3D All-Stars es un videojuego compilatorio de plataformas 3D para Nintendo Switch. Este compilado conmemora el 35º aniversario de la franquicia Super Mario de Nintendo.',NULL,'2.jpg',55,3,'0000-00-00',NULL,NULL),(125,'The Legend of Zelda Breath of the Wild','The Legend of Zelda: Breath of the Wild es un videojuego de acción-aventura de 2017 de la serie The Legend of Zelda, desarrollado por la filial Nintendo EPD en colaboración con Monolith Soft y publicado por Nintendo para las consolas Wii U y Nintendo Switch.',NULL,'1.jpg',55,1,'0000-00-00',NULL,NULL);
/*!40000 ALTER TABLE `mi_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `id_plataforma` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_plataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('-FIZhEvocvM3z8X_ARRIQnEvGX9Nwgzu',1624771028,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('-j0F-WGPRcwSMqo5DXHHTj59eB8KGVCV',1624771305,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('-kIpmDTsCwShMw0YNjjM5ZtTSAL4CTWI',1624852013,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('-tuaAyQwpWUjc6snXbk9krBVAnxmb4Cc',1624849751,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('02aybejoCZhZzW6AsPY5Yh4qkixSDdem',1624852932,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('0AnPjoTGLCoRqBUEV2YvtAsNGrTqRIjD',1624829389,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('0RDQ8do7vxUFAPaVFOj0sRflTcAwarCw',1624770860,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('0ZPCUcggb3n2bvWX_tH9fNA0xCgEu6EW',1624852314,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('1BGWGulTrzOCnU9PymW9Fl9yuYCTsrUB',1624849861,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('2TvaXieOVeBlIfGj3r6kzK-mrTBoxw7l',1624770420,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('3vUJU8jOhsdh9SjPGz0-Vna14Ax5NUwH',1624831447,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('3xBECC8w5RiKPwo8OnHU34pRR3cteXrA',1624834070,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('4i5zfPxUwvC7bTZSZDt-FT9tRc0GQ_GA',1624771226,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('4lgzcZJH0C3oSQCLC76hH6ZbnMbZRQIs',1624830419,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('5-blazLeNqVabwkoNdwCZmqbSAn1xWAB',1624832264,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('54g284enBoUybASaLXq7Gmpf8GwHUHqh',1624834028,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('5a35iK8gCrAZkQ0S0CQWD7NCyddQFM2e',1624849266,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('5z2qE1D1-zXhiIeXadytNyzrp0IQxpu8',1624849793,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('6lcb-y-viaYL7TA9WmwnpQmxFtfNikQA',1624830537,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('7KNwvuoHD3AW42lJOcGXxrkrQ2S8FCyY',1624833255,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('7hHWMmD2O-kszQ4acWqOQBgt4Qem7uiO',1624832398,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('8LwjP-trQIasqtcuTjUDUpAcrK2J8X72',1624830021,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('8l9fnik6z6tMoOzW2Sm7AXEltrlpqVMb',1624830810,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('8r7MG3JfVgI7JLHp9mnn9zLsHZPuNeJC',1624829628,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('94w_I-NA-o02JWQzDslwYq6HL_y1UARV',1624833331,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('9E3ot-ICNET1Tb0TIBnvwZoRLddfeGpE',1624770774,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('AK2YSxVdsGAtCRUx1rfps_ITeTys6Zxy',1624832953,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('AK9YttQNzCNpr_1pmeq18bpOeK6BfIhu',1624831227,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ATdo05a9zCjCedPgCxiy8mbTF-lHGsJ4',1624836070,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('B4CBcTHhxyF-EFQtnv4g-swNG3fj9NfZ',1624849237,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('B875q2Fdu_cxM1xd-MAsanrs2XuNmCF_',1624769459,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Bo5eESeQGwLSoODsAvNuD49wW6etdjLZ',1624771091,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('BpxDTqOhHoD5sReyn7r1ieslntpbiSTP',1624853028,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('BrndowYtXh2hkEZ5BKonCNF-9BVjlCua',1624854315,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('BvWQfEi3priCPblKN0BwzO7-ms6_V6Ya',1624770158,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('CJFZH4ThOE1dvEhFtc0XcllX-Q4HjU5d',1624830431,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Clz3cjdzXiAtG0zLGA35l5qQX3iTX3vT',1624836468,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('DAg0DAgKpe86Gu1l8RrgJsnOkLdwLsCW',1624833777,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('D_UNcTlq2YgSPVs6OrAlY_WKQ_oDhssY',1624849967,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Dc1Mogl1BnH7WYn_b9rXd4QCOGN3zRix',1624771183,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('E-xR0EIh4Ex3T9nCDzwwa5_wL4wlI9qv',1624849572,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('FHKzBAydKSdILe5g_O6RmbRmimVaytaA',1624849533,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('HEkUJ-F_ZLmGA2FySc_nVlQyJIMQ5oM2',1624854419,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('HJst-Dmtwf2RRSRgP8H5v2j05gOE9Qw7',1624854249,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Hd7O-TlPI8FTNTjz1_0mN9hO5xdv2LoG',1624829409,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Hh99hleUpgvMXaCrCvBdsWZVQx6b7JO0',1624854459,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('HyMkDUjl3O6N-qTQ9apU4gK24bBiUaTX',1624830831,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ImMe4LzmlxmZ3RSKKKIM_7dOvkFjeImM',1624852177,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('J6axgMX5mb_BkjqZQQox8x5HVssYIlo9',1624832938,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('JCU8patssZL9TLRk6UbPhy6s7Y_dYzs1',1624852944,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('JGVGF0MUUPJ_1PmQMJGA8_irkZV1u3ee',1624849658,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Jm42lC-sIp6DITqBp43LQSSVPmQg_XwL',1624829589,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('K27fFUKQX1AwmoZ_iiXqKXg8rDsiKmP0',1624831436,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('K8EZomFwL8s7Az2YgOlFoIFryt_IGdCM',1624852992,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('KgNoYaVCTcTASX1YgbJilsBaS7L_Tepi',1624854324,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('L8q40vMqjCrIyqBxr0gpFxNPFYCUfeKJ',1624768545,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('LPMdGINNTm7u0rrfYa8o09sbPf0efclZ',1624831938,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('M8E7ROamAt5tBkxtLARq2o4syhR4Y_Q3',1624854157,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Nmu6o8g9iWk-qjMgyyCtapFmCKMH4HT2',1624770753,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('O6uTgIsArwtm7GaBoHSAmwNKAscr6aJU',1624849729,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('OT9v8tT2qzuHZ1am9tjbBPlEsEkIRp3r',1624849721,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('OWEK38j9BpTGb9ammFWkF30lfKCrWNue',1624848839,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('OZ3SxtrurEbs6a0v8mvD49Q6A7E70Zia',1624829623,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Oo0vLKingAlO3wHMnV6KExTLfJa2reZc',1624770201,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('OuCdqWHedwaomGLwb7KWojzQyqX8oFvj',1624770953,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('OuQJRuECem5kzAQI7vWO50D9276cR3u1',1624849552,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('P7aqfVJh-vfYSBScIoiS4faOnfRc0-td',1624833268,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('PMLF8PfLjgDtHjUY7m_r3_vSZoShL8Ni',1624832219,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('PQpoVx6ieFhxXZgv531QBmxw_IU3-f0D',1624830065,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('PXsgCLp3EKdLrg0LHiNvak49YQQVkpIo',1624771321,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('PY5-5nIRCkBfoAlxtdDJGrxEMRxbm2Gs',1624849316,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('PmgMZ8QZmmR4EEL3crMnCFU08L-UmOga',1624849288,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('QE12Kf4QJB2VCkMvZ1ENhRcpqfoiSwPI',1624771294,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('QFR0QigPl5tHzRT59gkLKHii1Tlg3PVS',1624852867,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('QT2gqyacqnhQhEaQ952OVu5U_3xg8RuN',1624833767,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('RckUCyQaHPlcU7TVlOpG3-UJ5AmPkyTu',1624830410,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('S3AkwRxVrUBPoO9FkGcGcJKWY-dbvS7L',1624770148,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('SXFohMBmfoSh6iMJRWN4Xhh-i3mUpENF',1624854149,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('SdOunvTKnhve-pu9EPjQ3BoppM3C7u_O',1624833043,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('SjYYe-TJFrWVD2Xq0QbuwGnUlzfYuZhc',1624768546,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('TKTM3FzTSIY3OOJ495nuMve_AW5gazVB',1624849297,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('U4n3SaNsb6-A9LJxcBcg7VFHNKlfg0bC',1624851454,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('UCW31wzaU0MVRW5q32imrBfmoj1sr5pX',1624770226,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('USZ24YtFHVANxYEtYmQG7KCVCYhBCGUT',1624829974,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Unz7svpU1A7tO2aSU5eDe287ly-L-zq4',1624833305,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('V72B5DGjnASidtfup08OdrHuQd1PjK4J',1624831042,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('VBE0QgTMk-LbmzICdhC5wAnjXE_ZQs-4',1624849220,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('VvICqjzZHxuAoAyN5ZGrkwnCELlKSbZQ',1624770971,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('W0lAjFqAM8u-OT4J2ljr-tagzaH1hlEn',1624829642,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('WmJ3pGHphZCtwTAtTdE3LcQhvKROdFUq',1624833161,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('X1eAlFPlhvtVxwCGdvERRSGsKVsDHz0h',1624852902,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('X5btV1XUSiBq1iKi1m7yLL2CNeIQcRAK',1624769480,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('X5mzjFZUsEztrdVBQpfoalR7ZN0E3p0-',1624851480,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('XFJL1sa6Xf5QP6bJS-Qi2McI8rHxJ4lV',1624849652,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('XlLUwHroKZY7t_1tZSb7y3Tdz42hXxiK',1624854489,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":55}}'),('XxfabhvBrATkPlLSxEgfgoXfL5pS6kYL',1624849543,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Y2x9wiN8MpuUZphNKmpsTjeRNUqIHjNo',1624849841,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Yd9FtT4Ybm67tWu-oP2wfpPC3JJiQ5Ya',1624833433,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('YucVthxaJ-Wm7FVR6kL-d6aQPlyx4AXK',1624770213,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Z0f0OjF9pBKVAh6RJVce-mRsc97VzHmP',1624770884,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Z8NCxjkQ2_yprRYO2PCk3BojLxyEe72C',1624852029,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ZBh2HUyYouUxC_SYJjQZwKF9ECzinEEm',1624815112,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ZFpFMMRAUDfgqJcOBYATL2TYmMxZgc3F',1624834061,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ZIskslrbongokNL-9a3gYMPhPH7TBMkE',1624771361,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Ze_W0iRFp7-Js8wG7_h_hJ7BdGH2EpId',1624852165,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Zh82SX0qHdOWfPU2rVs4Oz4w4SaF6MZ7',1624771012,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ZsBN9FWyptBWR5jp0p4zcmahSnZuWoU-',1624840681,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('_7aWHKAh8dEwpPdeDh3GNw9qqbktZTsE',1624840715,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('_D6B7-cCU5cOFKzGhKGUVPXkXK1oEUdp',1624853113,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('_DvvLciCAU8uJT8hbMfbnOuB52uqnAdd',1624832241,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('_aq3V3-DYhQ4PJ3wvX_Lq9765tpKdw8Z',1624830004,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('agOY1aLbSgiLDi6Aa43mkJX8MAS6rl9e',1624854257,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ajarqp1eG0iTV0OP57HG6K_hcr9u0ZFH',1624852184,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('aruZfLYMEKRtbRP3pGqtQKriW48UjbB_',1624849228,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('bAEKsUYth5fTrwGm8_CSREkPWf3uj2KT',1624831274,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('bIATS0BJXBdxKjWL-F8HhFGb0O8xAM_P',1624840716,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('bub4zOamfPm6_YGAPP0qWgZIs54-WP1h',1624830519,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('d7xPRB0g5GDXSxoA71fuNsLyCbOcn9U5',1624832081,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('dV2VQZlny_pN-SrnIsriciswCwucO911',1624833846,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ddP9-UiW7zC5IiozK2HX3QB7J1EoyEsR',1624853219,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('eNf9s34uXUSaoLM10ayqWUUYZOksJFKK',1624832303,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('fUpIsYnrx9zN_FREodiaMW8pBOl5cYW1',1624832706,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('fW8B8qKEMhFQgQEpJSviarwSnm9c5lYl',1624830396,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ghLCn18HsZGIEkJUzL33ScbpQCpRh1gM',1624849873,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('hjI-Tc-pqZKBJY_2x-hwD3Kx2vI9tEic',1624833520,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('i2vK127iEaBwoCtSAxM-fBVTeUZSoALI',1624831206,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('in_8AjRIilT7vc_GOrZzMDk8VtiYcwil',1624829793,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ip7Oj1lQSTKnKtXT98DsubKDUNwua48v',1624852003,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('jAa77STpGCWLLrupjljwu_Cp1MZMe6wX',1624853022,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('jTLGFFrasHwFMJ4n9Iix0oaBs-ezzvx5',1624849804,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('jX8CEmvRQpqBVSi2qK58c6JnMJZdMu-h',1624831059,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('jpUEQOSlnC_Kqx4mxLcMqNT9DshxyuUg',1624849215,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('jvxOTp3l9O4Uvah-bH8d5HkP9Z5UgiuO',1624770710,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('kZ2hrnOCy6DDVNf2TKeqjtBUn9IRn-Yp',1624770957,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('kbkiD7NrQDCjnQpHJ5YkrZ23NAG1VWFf',1624853181,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('lFjFvyZ3XbAQpQeDBAT5y0bO7U6SEcEJ',1624836041,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('liHzIQDTfZPZzhmR5loJqK5HrwvC6FJd',1624771337,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('lpdipGjq8ftGvcIv_m0JYs4-A-8E7AUO',1624770878,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('lqL-kvMXc79dLU1S0BlnJO1NBS5UUpTH',1624771105,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('mIQjkcHPfxKlsIKCqP25CNzZ-5wyBHRr',1624853120,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('mc77vR-gHg058VqJ1Px8kxHHEmJvx4Na',1624833642,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('mfKsas6xMbu7zEO6EfJgColcbfb75bMw',1624854386,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('msVpOjQajYxEtM-KUF4LhoiEQhxAJfin',1624831493,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('mzzoa6WaaOIVH5dCvNwHvwBjMg2tXlis',1624833297,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('nIK8P5mipj7l5lqLgknEiS1vokZqqQ-U',1624852450,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('nd8NDLG0fcp0ZnWKuEFdfSIuMRs_xq47',1624853047,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('nkXfhCXCRHwk7mHCtRoX3Fe52Lz2WvMM',1624849900,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ntsuBgcgMZ2oy5jvsVtP98Q-y5gPFXsM',1624854375,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('o63RYGRlnmjC3mSBa7dFEuMzjAutEsKT',1624770332,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('o7ri7hPq9kF34KMB52ql71oTzZC_dZ4O',1624831800,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('oW-Y14cUNfCJVDV2v9kXrns20Dgu9Cbe',1624851444,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('pKf7rYYIQW6-ePlCQYAipA2oJ6p7to_W',1624834054,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('pVRVFpy87BLUp2EeKHy263Zu1irMhbow',1624770181,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('pb5wb8CEvoNaDW9gUYqeFYEBmuc4g_Dr',1624849524,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ptXEKHbBpvhaK_n74q6lCQICI3pQRT5A',1624771086,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('q8PSpSALRb89RvoQ-zRkiiSF7nVaYfn3',1624833311,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('qPvPPLaGPF14BfLRPpU6zR0DML6jh-Rm',1624833341,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('qzaL2guzaQmUIszGxbttOdQKoxZenSKP',1624849851,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('r3iY65jhFC9Nzi2GN0AQDmN1COgGzg80',1624852338,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('rurLMwLBWq7T03Ho1ZjTg73IQDzh2Dme',1624852148,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('slH-mwjEErtcUQlTYJk9N01yIteeIpUR',1624770192,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('t-Bi1AH918ur5ZeOPw1j10qNXoxHi0Rv',1624770240,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('t2BvBj52fRkhVALCrX283lFAwr3SUAfw',1624854196,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('tFr3EUrZBHGPxl_MhEqD8XUvlCyGtlO1',1624854474,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('tzriouydcvG6xUCMWGmmVk4eKTNasl-L',1624853215,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('uUYwvyHKleeRQyHv-tbiTgNwtXAvcqWN',1624831036,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('vGUCMCmEJXeV9ZCZNYssWM60B4B9RWc7',1624851465,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('vHMGIloJxm0pXAGt5jZqRDlKY-8knmC_',1624840701,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('vX45dnFe-pGmb7YpRGjr8jAhzzCLZiUo',1624852042,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('wijC_ocpZ-tP8CZ1KcK18ECTq4bjvr0I',1624771380,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ws4Xykn_3D3_4SeWLAG4kiVkceNH7R62',1624771281,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('xUIHP0Thro4Jt38V3pc6e5zMcEgGSkVu',1624852131,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('xhrNJe29_4_xwDaskq7gU8s3mmmG48sT',1624833241,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('xjGS0q70GXDc_K_ofMv24P9Abp9zt2bd',1624829489,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('y0D5ymwe45AcXhu6xAQDMdkRWLsv_7FS',1624831242,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('y86eEPDEpuId2j8THpKTDQaAFvXwacmW',1624771216,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('yUvlCkR-USbB9oyf_f6k6BmmEaK-QF1m',1624852955,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ybAMeoF4ys_U3ymz5kP0FKmFDvDi62vt',1624849811,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('ycCptke35AfEzklNISd406R0QCUSmH2Y',1624849974,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('z0tf6O-vsC2tZCBu0OlQYimkwyeXPsJv',1624833321,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('zEdYf2uf3_ritlztiUzcq8WJbwOil0_c',1624853055,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passw` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Carlos Agurio','Rodriguez Lopez','Mango243','soyyo24343@gmail.com','$2a$10$4lsYgl/k94tMNVrD8q96Wecsb7eM8v6XnwVFRFuTnZDGGqY9LydKq','2021-06-10 15:45:34'),(15,'Ricardo','Giron Colorado','killerstealer','sahfahsdgfhf@gmail.com','$2a$10$1O/DQMNV/od1TXMTS0AD8u/07pI9qA7Lo5ZquqH0cxFJuPpda7Bz.','2021-06-10 17:36:55'),(25,'Alfredo','Sanchez','Tejarock','asdajsb@ghj.com','$2a$10$TLkiLoqA2janhRJCVAHaIumnkSDPXVHRB4YxT/0nwOMwv3uQOrytu','2021-06-23 16:25:22'),(35,'Alfredo','Sanchez','Tejarock1','teja@gmail.com','$2a$10$.jeHRb9L6ztCpPtRU8SszuSdhkZ1kS32xKNrEdfqnfTwuDbWXe/Oq','2021-06-23 16:37:51'),(45,'Carlos Agurio','Rodriguez Lopez','augustroo','mango1@gmail.com','$2a$10$MQjHcKDHILgiCRJxVOLOXOHy30IA0YDXhRgR22H5u3.cHPIPC2ZAG','2021-06-24 05:29:49'),(55,'Mango','Rodriguez','Sandia243','sandia@gmail.com','$2a$10$yv0v8ksD9YjdXbBqfvS32O2XyQS0RLzcF4cGjgAtzh0LYXCqoCZeq','2021-06-27 03:10:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-26 23:32:34
