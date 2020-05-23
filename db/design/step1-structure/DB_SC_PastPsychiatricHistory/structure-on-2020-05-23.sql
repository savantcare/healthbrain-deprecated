-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_PastPsychiatricHistory
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
-- Current Database: `DB_SC_PastPsychiatricHistory`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_PastPsychiatricHistory` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_PastPsychiatricHistory`;

--
-- Table structure for table `pastPsychiatricHistory`
--

DROP TABLE IF EXISTS `pastPsychiatricHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastPsychiatricHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `pphxTypeId` int(11) NOT NULL,
  `note` text,
  `firstParentId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtIPAddress` varchar(80) DEFAULT NULL,
  `createdAtTimeZone` varchar(80) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedFromIPAddress` varchar(80) DEFAULT NULL,
  `deletedOnTimeZone` varchar(80) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(80) DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(80) DEFAULT NULL,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_deletedOnDateTime` (`deletedOnDateTime`),
  KEY `idx_discontinuedOnDateTime` (`discontinuedOnDateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3366 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pastPsychiatricHistoryTypeMaster`
--

DROP TABLE IF EXISTS `pastPsychiatricHistoryTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastPsychiatricHistoryTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pphxType` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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