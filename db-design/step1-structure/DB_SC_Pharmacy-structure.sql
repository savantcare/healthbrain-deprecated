-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Pharmacy
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
-- Current Database: `DB_SC_Pharmacy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Pharmacy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Pharmacy`;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) DEFAULT NULL,
  `stateCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29739 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) NOT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `createdTimeZone` varchar(5) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pharmacyName` varchar(128) DEFAULT NULL,
  `pharmacyType` enum('On surescripts','Not on surescripts') DEFAULT NULL,
  `NCPDPID` varchar(255) DEFAULT NULL,
  `NPI` varchar(100) DEFAULT NULL,
  `pharmacyStreetAddressLine1` varchar(128) DEFAULT NULL,
  `pharmacyStreetAddressLine2` varchar(128) DEFAULT NULL,
  `pharmacyCity` varchar(128) DEFAULT NULL,
  `pharmacyState` varchar(128) DEFAULT NULL,
  `pharmacyZip` varchar(50) DEFAULT NULL,
  `pharmacyPhone` varchar(128) DEFAULT NULL,
  `pharmacyFax` varchar(128) DEFAULT NULL,
  `pharmacyURL` varchar(128) DEFAULT NULL,
  `pharmacyNotes` text,
  `primaryOrSecondary` tinyint(4) unsigned DEFAULT '0' COMMENT '1: primary, 2: secondary',
  `updated_at` datetime DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) NOT NULL,
  `notes` text NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=5845 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy_bk`
--

DROP TABLE IF EXISTS `pharmacy_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `createdTimeZone` varchar(5) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pharmacyName` varchar(128) DEFAULT NULL,
  `pharmacyType` enum('On surescripts','Not on surescripts') DEFAULT NULL,
  `NCPDPID` varchar(255) DEFAULT NULL,
  `NPI` varchar(100) DEFAULT NULL,
  `pharmacyStreetAddressLine1` varchar(128) DEFAULT NULL,
  `pharmacyStreetAddressLine2` varchar(128) DEFAULT NULL,
  `pharmacyCity` varchar(128) DEFAULT NULL,
  `pharmacyState` varchar(128) DEFAULT NULL,
  `pharmacyZip` varchar(50) DEFAULT NULL,
  `pharmacyPhone` varchar(128) DEFAULT NULL,
  `pharmacyFax` varchar(128) DEFAULT NULL,
  `pharmacyURL` varchar(128) DEFAULT NULL,
  `pharmacyNotes` text,
  `primaryOrSecondary` tinyint(4) unsigned DEFAULT '0' COMMENT '1: primary, 2: secondary',
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=5131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(255) DEFAULT NULL,
  `stateCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
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
