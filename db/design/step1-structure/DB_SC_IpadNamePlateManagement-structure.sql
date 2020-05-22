-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_IpadNamePlateManagement
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
-- Current Database: `DB_SC_IpadNamePlateManagement`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_IpadNamePlateManagement` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_IpadNamePlateManagement`;

--
-- Table structure for table `ipadDetails`
--

DROP TABLE IF EXISTS `ipadDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipadDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceUUID` varchar(255) NOT NULL,
  `deviceIdentifierName` varchar(200) DEFAULT NULL,
  `roomID` int(11) DEFAULT NULL,
  `pnpUrlID` int(11) DEFAULT NULL COMMENT 'Current showing url id',
  `urlToShowOnIpadNamePlate` varchar(255) NOT NULL DEFAULT 'https://www.savantcare.com',
  `captureByIpad` longblob,
  `captureDateTime` datetime DEFAULT NULL,
  `updateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curentstatus` (`pnpUrlID`),
  KEY `locationRoomID` (`id`),
  KEY `roomLocation` (`roomID`),
  CONSTRAINT `ipadDetails_ibfk_1` FOREIGN KEY (`pnpUrlID`) REFERENCES `masterProviderNamePlateURL` (`id`),
  CONSTRAINT `roomLocation` FOREIGN KEY (`roomID`) REFERENCES `DB_SC_Central`.`locationsRoom` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipadDetails-test`
--

DROP TABLE IF EXISTS `ipadDetails-test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipadDetails-test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceUUID` varchar(255) NOT NULL,
  `deviceIdentifierName` varchar(200) DEFAULT NULL,
  `roomID` int(11) DEFAULT NULL,
  `pnpUrlID` int(11) DEFAULT NULL COMMENT 'Current showing url id',
  `urlToShowOnIpadNamePlate` varchar(255) NOT NULL DEFAULT 'https://www.savantcare.com',
  `captureByIpad` longblob,
  `captureDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curentstatus` (`pnpUrlID`),
  KEY `locationRoomID` (`id`),
  KEY `roomLocation` (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipad_status`
--

DROP TABLE IF EXISTS `ipad_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipad_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipad_id` int(11) DEFAULT NULL,
  `last_request_received` datetime DEFAULT NULL,
  `nameplateAppVersion` varchar(25) DEFAULT NULL,
  `createdBy` int(11) NOT NULL COMMENT 'Zero means : Created by Cron, Integer means : Created by user(userId)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310074 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterProviderNamePlateURL`
--

DROP TABLE IF EXISTS `masterProviderNamePlateURL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterProviderNamePlateURL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerUID` int(11) DEFAULT NULL,
  `providerURL` text,
  `updatedByUID` int(11) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `timeZone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`updatedByUID`) USING BTREE,
  KEY `providerUID` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerCertificates`
--

DROP TABLE IF EXISTS `providerCertificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerCertificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate` blob,
  `certificate_name` text,
  `providerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
