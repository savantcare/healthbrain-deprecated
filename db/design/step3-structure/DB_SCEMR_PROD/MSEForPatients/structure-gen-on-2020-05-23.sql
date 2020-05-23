use DB_SCEMR_PROD;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
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
-- Table structure for table `MSEForPatients`
--

DROP TABLE IF EXISTS `MSEForPatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEForPatients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `isReviewed` enum('yes','no') NOT NULL DEFAULT 'no',
  `affectOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `affectExtraInfo` varchar(255) DEFAULT NULL,
  `appearanceOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `appearanceExtraInfo` varchar(255) DEFAULT NULL,
  `attitudeOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `attitudeExtraInfo` varchar(255) DEFAULT NULL,
  `cognitionOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `cognitionExtraInfo` varchar(255) DEFAULT NULL,
  `constitutionalOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `constitutionalExtraInfo` varchar(255) DEFAULT NULL,
  `eyeContactOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `eyeContactExtraInfo` varchar(255) DEFAULT NULL,
  `impulseControlOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `impulseControlExtraInfo` varchar(255) DEFAULT NULL,
  `insightOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `insightExtraInfo` varchar(255) DEFAULT NULL,
  `judgementOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `judgementExtraInfo` varchar(255) DEFAULT NULL,
  `perceptionOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `perceptionExtraInfo` varchar(255) DEFAULT NULL,
  `psychomotorOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `psychomotorExtraInfo` varchar(255) DEFAULT NULL,
  `speechOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `speechExtraInfo` varchar(255) DEFAULT NULL,
  `thoughtContentOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `thoughtContentExtraInfo` varchar(255) DEFAULT NULL,
  `thoughtProcessOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `thoughtProcessExtraInfo` varchar(255) DEFAULT NULL,
  `neurologicalOptionsSelectedSumValue` int(11) NOT NULL DEFAULT '0',
  `neurologicalExtraInfo` varchar(255) DEFAULT NULL,
  `moodInfo` varchar(255) DEFAULT NULL,
  `timezoneAbbreviationForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reviewedOn` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfDoctor` (`uidOfDoctor`)
) ENGINE=InnoDB AUTO_INCREMENT=100017 DEFAULT CHARSET=utf8;
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
