CREATE DATABASE  IF NOT EXISTS `inslydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `inslydb`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: inslydb
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` text NOT NULL,
  `degree` varchar(255) NOT NULL,
  `description` text,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `language_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`language_id`,`employee_id`),
  KEY `fk_education_language1_idx` (`language_id`),
  KEY `fk_education_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_education_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_education_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'Harvard','Bachelors','abc','2013-02-27','2017-02-27',1,1),(2,'QAU','Masters','def','2018-01-01','2020-02-27',2,1),(3,'IIUI','Phd','ghi','2012-02-27','2017-02-27',2,2),(4,'NUML','Diploma','jkl','2020-02-27','2021-02-27',3,2);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `ssn` varchar(20) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `contact` varchar(11) NOT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn_index` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Mobeen','1234','1990-12-02 00:00:00','03025679378',1,0,'2021-02-27 00:00:00','2021-02-27 00:00:00'),(2,'Ahmed','5678','0000-00-00 00:00:00','03015263749',1,0,'2021-02-27 00:00:00','2021-02-27 00:00:00');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(55) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English','en'),(2,'French','fr'),(3,'Spanish','sp');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_experience`
--

DROP TABLE IF EXISTS `work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `employment_type` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `description` text,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`employee_id`,`language_id`),
  KEY `fk_work_experience_employee1_idx` (`employee_id`),
  KEY `fk_work_experience_language1_idx` (`language_id`),
  CONSTRAINT `fk_work_experience_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_experience_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_experience`
--

LOCK TABLES `work_experience` WRITE;
/*!40000 ALTER TABLE `work_experience` DISABLE KEYS */;
INSERT INTO `work_experience` VALUES (1,'Web App developer','Netsol','Full time','Pakistan','abc','2015-01-01 00:00:00','2017-01-01 00:00:00',1,2),(2,'CRM Dynamics Expert','Microsoft','Full time','Qatar','def','2017-01-01 00:00:00','2020-01-01 00:00:00',1,3),(3,'Full Stack Developer','Elixir','Full time','Canada','ghi','2014-01-01 00:00:00','2017-01-01 00:00:00',2,1),(4,'Quality Assurance Engineer','TEO','Part time','Dubai','jkl','2017-01-01 00:00:00','2021-01-01 00:00:00',2,2);
/*!40000 ALTER TABLE `work_experience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-01  3:36:50
