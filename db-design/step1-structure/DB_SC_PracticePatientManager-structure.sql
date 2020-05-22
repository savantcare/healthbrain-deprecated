-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_PracticePatientManager
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
-- Current Database: `DB_SC_PracticePatientManager`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_PracticePatientManager` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_PracticePatientManager`;

--
-- Table structure for table `practicePatientAnswers`
--

DROP TABLE IF EXISTS `practicePatientAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practicePatientAnswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questIonId` int(11) DEFAULT NULL,
  `answer` text,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(100) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '"0" denotes activated and "1" denotes deactivated',
  `correctAnswer` int(11) DEFAULT NULL COMMENT '"0" denotes wrong answer and "1" denotes correct answer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practicePatientDataSet`
--

DROP TABLE IF EXISTS `practicePatientDataSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practicePatientDataSet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(100) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `practicePatientQuestions`
--

DROP TABLE IF EXISTS `practicePatientQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practicePatientQuestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  `createdByUid` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '"0" denotes activate and "1" denotes deactivate',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
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
