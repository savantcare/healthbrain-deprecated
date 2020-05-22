-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_SubstanseUse
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
-- Current Database: `DB_SC_SubstanseUse`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_SubstanseUse` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_SubstanseUse`;

--
-- Table structure for table `substanceUse`
--

DROP TABLE IF EXISTS `substanceUse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substanceUse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `firstParentID` int(11) DEFAULT NULL,
  `substanceName` varchar(128) DEFAULT NULL,
  `quantity` double unsigned DEFAULT NULL,
  `unit` varchar(150) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `graphColor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substanceUseNotes`
--

DROP TABLE IF EXISTS `substanceUseNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substanceUseNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `substanceUseFirstParentID` int(11) NOT NULL,
  `substanceUseName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(255) DEFAULT NULL,
  `notes` text,
  `dateForNotes` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substanceUse_backup`
--

DROP TABLE IF EXISTS `substanceUse_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substanceUse_backup` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `firstParentID` int(11) DEFAULT NULL,
  `substanceName` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `quantity` double unsigned DEFAULT NULL,
  `unit` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `graphColor` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
