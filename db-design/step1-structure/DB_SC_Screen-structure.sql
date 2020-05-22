-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Screen
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `DB_SC_Screen`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Screen` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Screen`;

--
-- Table structure for table `screenADHDAnnonymous`
--

DROP TABLE IF EXISTS `screenADHDAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenADHDAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenADHDMasterGroups`
--

DROP TABLE IF EXISTS `screenADHDMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenADHDMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenADHDMasterQuestions`
--

DROP TABLE IF EXISTS `screenADHDMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenADHDMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenADHDPatient`
--

DROP TABLE IF EXISTS `screenADHDPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenADHDPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  CONSTRAINT `screenADHDPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenADHDMasterQuestions` (`id`),
  CONSTRAINT `screenADHDPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=4941 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screen` BEFORE INSERT ON `screenADHDPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenADHDPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenAlcoholismscreeningAnnonymous`
--

DROP TABLE IF EXISTS `screenAlcoholismscreeningAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAlcoholismscreeningAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAlcoholismscreeningMasterGroups`
--

DROP TABLE IF EXISTS `screenAlcoholismscreeningMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAlcoholismscreeningMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAlcoholismscreeningMasterQuestions`
--

DROP TABLE IF EXISTS `screenAlcoholismscreeningMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAlcoholismscreeningMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAlcoholismscreeningPatient`
--

DROP TABLE IF EXISTS `screenAlcoholismscreeningPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAlcoholismscreeningPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAnnonymousReportIdMaster`
--

DROP TABLE IF EXISTS `screenAnnonymousReportIdMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAnnonymousReportIdMaster` (
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `idOfScreen` tinyint(4) NOT NULL,
  `timeAnswered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalScore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAnxietyAnnonymous`
--

DROP TABLE IF EXISTS `screenAnxietyAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAnxietyAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAnxietyMasterGroups`
--

DROP TABLE IF EXISTS `screenAnxietyMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAnxietyMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAnxietyMasterQuestions`
--

DROP TABLE IF EXISTS `screenAnxietyMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAnxietyMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenAnxietyPatient`
--

DROP TABLE IF EXISTS `screenAnxietyPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenAnxietyPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  KEY `screenReportID_2` (`screenReportID`),
  CONSTRAINT `screenAnxietyPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenAnxietyMasterQuestions` (`id`),
  CONSTRAINT `screenAnxietyPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=4271 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenAnxiety` BEFORE INSERT ON `screenAnxietyPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenAnxietyPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenBeckDepressionInventoryAnnonymous`
--

DROP TABLE IF EXISTS `screenBeckDepressionInventoryAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeckDepressionInventoryAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeckDepressionInventoryMasterGroups`
--

DROP TABLE IF EXISTS `screenBeckDepressionInventoryMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeckDepressionInventoryMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeckDepressionInventoryMasterQuestions`
--

DROP TABLE IF EXISTS `screenBeckDepressionInventoryMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeckDepressionInventoryMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeckDepressionInventoryPatient`
--

DROP TABLE IF EXISTS `screenBeckDepressionInventoryPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeckDepressionInventoryPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeginnerTechTestAnnonymous`
--

DROP TABLE IF EXISTS `screenBeginnerTechTestAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeginnerTechTestAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeginnerTechTestMasterGroups`
--

DROP TABLE IF EXISTS `screenBeginnerTechTestMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeginnerTechTestMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeginnerTechTestMasterQuestions`
--

DROP TABLE IF EXISTS `screenBeginnerTechTestMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeginnerTechTestMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBeginnerTechTestPatient`
--

DROP TABLE IF EXISTS `screenBeginnerTechTestPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeginnerTechTestPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTechTest` BEFORE INSERT ON `screenBeginnerTechTestPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenBeginnerTechTestPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenBipolarAnnonymous`
--

DROP TABLE IF EXISTS `screenBipolarAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBipolarAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBipolarMasterGroups`
--

DROP TABLE IF EXISTS `screenBipolarMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBipolarMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBipolarMasterQuestions`
--

DROP TABLE IF EXISTS `screenBipolarMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBipolarMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenBipolarPatient`
--

DROP TABLE IF EXISTS `screenBipolarPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBipolarPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  CONSTRAINT `screenBipolarPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenBipolarMasterQuestions` (`id`),
  CONSTRAINT `screenBipolarPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=5170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenBiopolar` BEFORE INSERT ON `screenBipolarPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenBipolarPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenConnie'sScreenAnnonymous`
--

DROP TABLE IF EXISTS `screenConnie'sScreenAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenConnie'sScreenAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenConnie'sScreenMasterGroups`
--

DROP TABLE IF EXISTS `screenConnie'sScreenMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenConnie'sScreenMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenConnie'sScreenMasterQuestions`
--

DROP TABLE IF EXISTS `screenConnie'sScreenMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenConnie'sScreenMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenConnie'sScreenPatient`
--

DROP TABLE IF EXISTS `screenConnie'sScreenPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenConnie'sScreenPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenConnie` BEFORE INSERT ON `screenConnie'sScreenPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND   TABLE_NAME   = 'screenConnie\'sScreenPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenDATechTestAnnonymous`
--

DROP TABLE IF EXISTS `screenDATechTestAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDATechTestAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDATechTestMasterGroups`
--

DROP TABLE IF EXISTS `screenDATechTestMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDATechTestMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDATechTestMasterQuestions`
--

DROP TABLE IF EXISTS `screenDATechTestMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDATechTestMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDATechTestPatient`
--

DROP TABLE IF EXISTS `screenDATechTestPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDATechTestPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenDATech` BEFORE INSERT ON `screenDATechTestPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND   TABLE_NAME   = 'screenDATechTestPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenDepressionAnnonymous`
--

DROP TABLE IF EXISTS `screenDepressionAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDepressionAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDepressionMasterGroups`
--

DROP TABLE IF EXISTS `screenDepressionMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDepressionMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDepressionMasterQuestions`
--

DROP TABLE IF EXISTS `screenDepressionMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDepressionMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDepressionPatient`
--

DROP TABLE IF EXISTS `screenDepressionPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDepressionPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  KEY `screenReportID_2` (`screenReportID`),
  CONSTRAINT `screenDepressionPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenDepressionMasterQuestions` (`id`),
  CONSTRAINT `screenDepressionPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=7242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenDepression` BEFORE INSERT ON `screenDepressionPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND   TABLE_NAME   = 'screenDepressionPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenDepressionScoreSummary`
--

DROP TABLE IF EXISTS `screenDepressionScoreSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDepressionScoreSummary` (
  `lowerBound` int(11) NOT NULL,
  `upperBound` int(11) NOT NULL,
  `symptomSeverity` varchar(255) NOT NULL,
  `Comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDrugAnnonymous`
--

DROP TABLE IF EXISTS `screenDrugAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDrugAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDrugMasterGroups`
--

DROP TABLE IF EXISTS `screenDrugMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDrugMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDrugMasterQuestions`
--

DROP TABLE IF EXISTS `screenDrugMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDrugMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenDrugPatient`
--

DROP TABLE IF EXISTS `screenDrugPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDrugPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  KEY `screenReportID_2` (`screenReportID`),
  CONSTRAINT `screenDrugPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenDrugMasterQuestions` (`id`),
  CONSTRAINT `screenDrugPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenDrug` BEFORE INSERT ON `screenDrugPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND   TABLE_NAME   = 'screenDrugPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenOCDAnnonymous`
--

DROP TABLE IF EXISTS `screenOCDAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenOCDAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenOCDMasterGroups`
--

DROP TABLE IF EXISTS `screenOCDMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenOCDMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenOCDMasterQuestions`
--

DROP TABLE IF EXISTS `screenOCDMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenOCDMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenOCDPatient`
--

DROP TABLE IF EXISTS `screenOCDPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenOCDPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  CONSTRAINT `screenOCDPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenOCDMasterQuestions` (`id`),
  CONSTRAINT `screenOCDPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=1756 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenOCD` BEFORE INSERT ON `screenOCDPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenOCDPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenPTSDAnnonymous`
--

DROP TABLE IF EXISTS `screenPTSDAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenPTSDAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenPTSDMasterGroups`
--

DROP TABLE IF EXISTS `screenPTSDMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenPTSDMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenPTSDMasterQuestions`
--

DROP TABLE IF EXISTS `screenPTSDMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenPTSDMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenPTSDPatient`
--

DROP TABLE IF EXISTS `screenPTSDPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenPTSDPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  CONSTRAINT `screenPTSDPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenPTSDMasterQuestions` (`id`),
  CONSTRAINT `screenPTSDPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenPTSD` BEFORE INSERT ON `screenPTSDPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenPTSDPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenRKscreenAnnonymous`
--

DROP TABLE IF EXISTS `screenRKscreenAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenRKscreenAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenRKscreenMasterGroups`
--

DROP TABLE IF EXISTS `screenRKscreenMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenRKscreenMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenRKscreenMasterQuestions`
--

DROP TABLE IF EXISTS `screenRKscreenMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenRKscreenMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenRKscreenPatient`
--

DROP TABLE IF EXISTS `screenRKscreenPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenRKscreenPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenRK` BEFORE INSERT ON `screenRKscreenPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenRKscreenPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenSPINAnnonymous`
--

DROP TABLE IF EXISTS `screenSPINAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSPINAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSPINMasterGroups`
--

DROP TABLE IF EXISTS `screenSPINMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSPINMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSPINMasterQuestions`
--

DROP TABLE IF EXISTS `screenSPINMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSPINMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSPINPatient`
--

DROP TABLE IF EXISTS `screenSPINPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSPINPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=752 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenSPIN` BEFORE INSERT ON `screenSPINPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenSPINPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenSchizophreniaAnnonymous`
--

DROP TABLE IF EXISTS `screenSchizophreniaAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSchizophreniaAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `uidOfPatient` (`annonymousScreenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSchizophreniaMasterGroups`
--

DROP TABLE IF EXISTS `screenSchizophreniaMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSchizophreniaMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSchizophreniaMasterQuestions`
--

DROP TABLE IF EXISTS `screenSchizophreniaMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSchizophreniaMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(512) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `groupID` tinyint(4) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSchizophreniaPatient`
--

DROP TABLE IF EXISTS `screenSchizophreniaPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSchizophreniaPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  CONSTRAINT `screenSchizophreniaPatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenSchizophreniaMasterQuestions` (`id`),
  CONSTRAINT `screenSchizophreniaPatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=1319 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenSchizophrenia` BEFORE INSERT ON `screenSchizophreniaPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenSchizophreniaPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenSubstanceAnnonymous`
--

DROP TABLE IF EXISTS `screenSubstanceAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSubstanceAnnonymous` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSubstanceMasterGroups`
--

DROP TABLE IF EXISTS `screenSubstanceMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSubstanceMasterGroups` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSubstanceMasterQuestions`
--

DROP TABLE IF EXISTS `screenSubstanceMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSubstanceMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSubstancePatient`
--

DROP TABLE IF EXISTS `screenSubstancePatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSubstancePatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) DEFAULT NULL,
  `screenReportID` int(11) unsigned NOT NULL,
  `questionID` tinyint(4) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`),
  KEY `screenReportID` (`screenReportID`),
  KEY `screenReportID_2` (`screenReportID`),
  CONSTRAINT `screenSubstancePatient_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `screenSubstanceMasterQuestions` (`id`),
  CONSTRAINT `screenSubstancePatient_ibfk_3` FOREIGN KEY (`screenReportID`) REFERENCES `screensTakenByPatient` (`screenReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenSubstance` BEFORE INSERT ON `screenSubstancePatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenSubstancePatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenSuicideScreeningAnnonymous`
--

DROP TABLE IF EXISTS `screenSuicideScreeningAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSuicideScreeningAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSuicideScreeningMasterGroups`
--

DROP TABLE IF EXISTS `screenSuicideScreeningMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSuicideScreeningMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSuicideScreeningMasterQuestions`
--

DROP TABLE IF EXISTS `screenSuicideScreeningMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSuicideScreeningMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenSuicideScreeningPatient`
--

DROP TABLE IF EXISTS `screenSuicideScreeningPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSuicideScreeningPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDAAnnonymous`
--

DROP TABLE IF EXISTS `screenTechTestForDAAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDAAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` tinyint(1) NOT NULL,
  `answerID` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDAMasterGroups`
--

DROP TABLE IF EXISTS `screenTechTestForDAMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDAMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` tinyint(1) NOT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDAMasterQuestions`
--

DROP TABLE IF EXISTS `screenTechTestForDAMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDAMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(1) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') CHARACTER SET latin1 NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pointsForOption1` int(11) NOT NULL,
  `pointsForOption2` int(11) NOT NULL,
  `pointsForOption3` int(11) NOT NULL,
  `pointsForOption4` int(11) NOT NULL,
  `pointsForOption5` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDAPatient`
--

DROP TABLE IF EXISTS `screenTechTestForDAPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDAPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(11) NOT NULL,
  `questionID` tinyint(1) NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTechTestDA` BEFORE INSERT ON `screenTechTestForDAPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenTechTestForDAPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenTechTestForDoctorsAnnonymous`
--

DROP TABLE IF EXISTS `screenTechTestForDoctorsAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDoctorsAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` tinyint(1) NOT NULL,
  `answerID` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDoctorsMasterGroups`
--

DROP TABLE IF EXISTS `screenTechTestForDoctorsMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDoctorsMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` tinyint(1) NOT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDoctorsMasterQuestions`
--

DROP TABLE IF EXISTS `screenTechTestForDoctorsMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDoctorsMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(1) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') CHARACTER SET latin1 NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pointsForOption1` int(11) NOT NULL,
  `pointsForOption2` int(11) NOT NULL,
  `pointsForOption3` int(11) NOT NULL,
  `pointsForOption4` int(11) NOT NULL,
  `pointsForOption5` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestForDoctorsPatient`
--

DROP TABLE IF EXISTS `screenTechTestForDoctorsPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestForDoctorsPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(11) NOT NULL,
  `questionID` tinyint(1) NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTechTestDoctor` BEFORE INSERT ON `screenTechTestForDoctorsPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenTechTestForDoctorsPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenTechTestforProvidersAnnonymous`
--

DROP TABLE IF EXISTS `screenTechTestforProvidersAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestforProvidersAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestforProvidersMasterGroups`
--

DROP TABLE IF EXISTS `screenTechTestforProvidersMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestforProvidersMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestforProvidersMasterQuestions`
--

DROP TABLE IF EXISTS `screenTechTestforProvidersMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestforProvidersMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTechTestforProvidersPatient`
--

DROP TABLE IF EXISTS `screenTechTestforProvidersPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTechTestforProvidersPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTTP` BEFORE INSERT ON `screenTechTestforProvidersPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenTechTestforProvidersPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenTestAnnonymous`
--

DROP TABLE IF EXISTS `screenTestAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTestAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTestMasterGroups`
--

DROP TABLE IF EXISTS `screenTestMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTestMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTestMasterQuestions`
--

DROP TABLE IF EXISTS `screenTestMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTestMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenTestPatient`
--

DROP TABLE IF EXISTS `screenTestPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenTestPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTestp` BEFORE INSERT ON `screenTestPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenTestPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screenYBOCSAnnonymous`
--

DROP TABLE IF EXISTS `screenYBOCSAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenYBOCSAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenYBOCSMasterGroups`
--

DROP TABLE IF EXISTS `screenYBOCSMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenYBOCSMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenYBOCSMasterQuestions`
--

DROP TABLE IF EXISTS `screenYBOCSMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenYBOCSMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screenYBOCSPatient`
--

DROP TABLE IF EXISTS `screenYBOCSPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenYBOCSPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` tinyint(4) unsigned DEFAULT NULL,
  `answerValueDetails` text COLLATE utf8_unicode_ci COMMENT 'To Text box & Text area answer input type value',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenYBOCS` BEFORE INSERT ON `screenYBOCSPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screenYBOCSPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screensAvailableMaster`
--

DROP TABLE IF EXISTS `screensAvailableMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screensAvailableMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `screenName` varchar(255) NOT NULL,
  `scientificName` varchar(255) NOT NULL,
  `clinicalStudies` text NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `dynamicTableAliasName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screensCurrentlyAssignedToPatient`
--

DROP TABLE IF EXISTS `screensCurrentlyAssignedToPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screensCurrentlyAssignedToPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idOfScreen` tinyint(4) NOT NULL,
  `uidOfPersonAssigningTheScreen` int(10) unsigned DEFAULT NULL,
  `uidOfPatientScreenIsAssignedTo` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(10) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(80) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7369 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screensTakenByPatient`
--

DROP TABLE IF EXISTS `screensTakenByPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screensTakenByPatient` (
  `screenReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenReportUniqueID` varchar(36) DEFAULT NULL,
  `idOfScreen` int(11) NOT NULL,
  `reportIsWorkInProgressOrSubmitted` enum('workInProgress','Submitted') NOT NULL DEFAULT 'workInProgress',
  `uidOfPatientTakingTheScreen` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`screenReportID`),
  KEY `uidOfPatientTakingTheScreen` (`uidOfPatientTakingTheScreen`),
  CONSTRAINT `screensTakenByPatient_ibfk_1` FOREIGN KEY (`uidOfPatientTakingTheScreen`) REFERENCES `DB_SCEMR_PROD`.`users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5078 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTakenByPatient` BEFORE INSERT ON `screensTakenByPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screensTakenByPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenReportUniqueID IS NULL) THEN
    	SET NEW.screenReportUniqueID = @P1;
    ELSEIF (NEW.screenReportUniqueID = '') THEN
    	SET NEW.screenReportUniqueID = @P1;  
	ELSE
    	SET NEW.screenReportUniqueID = NEW.screenReportUniqueID;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `screentestakAnnonymous`
--

DROP TABLE IF EXISTS `screentestakAnnonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screentestakAnnonymous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annonymousScreenReportID` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screentestakMasterGroups`
--

DROP TABLE IF EXISTS `screentestakMasterGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screentestakMasterGroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screentestakMasterQuestions`
--

DROP TABLE IF EXISTS `screentestakMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screentestakMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screentestakPatient`
--

DROP TABLE IF EXISTS `screentestakPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screentestakPatient` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screenPatientUniqueId` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenReportID` int(10) unsigned NOT NULL,
  `questionID` smallint(5) unsigned NOT NULL,
  `answerID` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_screenTTKP` BEFORE INSERT ON `screentestakPatient` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Screen' AND TABLE_NAME = 'screentestakPatient' INTO @P2;
    Select generate_uuid4_for_screendb(@P2) INTO @P1;
    IF (NEW.screenPatientUniqueId IS NULL) THEN
    	SET NEW.screenPatientUniqueId = @P1;
    ELSEIF (NEW.screenPatientUniqueId = '') THEN
    	SET NEW.screenPatientUniqueId = @P1;  
	ELSE
    	SET NEW.screenPatientUniqueId = NEW.screenPatientUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `currentDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7800 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
