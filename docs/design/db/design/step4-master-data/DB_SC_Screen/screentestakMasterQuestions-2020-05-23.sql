use DB_SC_Screen
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Screen
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1-log

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
-- Dumping data for table `screentestakMasterQuestions`
--

LOCK TABLES `screentestakMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screentestakMasterQuestions` DISABLE KEYS */;
INSERT INTO `screentestakMasterQuestions` VALUES (1,NULL,'No','How often do you exercise?',NULL,NULL,'Yes','Select Box','None','once a week','2-3 times a week','daily',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `screentestakMasterQuestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
