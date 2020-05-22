-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_MobileApp
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
-- Current Database: `DB_SC_MobileApp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_MobileApp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_MobileApp`;

--
-- Table structure for table `currentMoodDetails`
--

DROP TABLE IF EXISTS `currentMoodDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currentMoodDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moodID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `storeDateTime` datetime NOT NULL,
  `storeTimeZone` varchar(10) NOT NULL,
  `detailText` text,
  `detailStoreDateTime` datetime DEFAULT NULL,
  `detailStoreTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1383 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedbackMaster`
--

DROP TABLE IF EXISTS `feedbackMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moodDeviceDetails`
--

DROP TABLE IF EXISTS `moodDeviceDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodDeviceDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) DEFAULT NULL,
  `tokenNumber` varchar(200) DEFAULT NULL,
  `deviceID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moodsMaster`
--

DROP TABLE IF EXISTS `moodsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodsMaster` (
  `id` smallint(4) NOT NULL,
  `colorCode` varchar(7) NOT NULL,
  `svgMouthCode` varchar(40) NOT NULL,
  `svgMouthShadowCode` varchar(40) NOT NULL,
  `moodValue` tinyint(4) NOT NULL,
  `isDefault` enum('No','Yes') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientFeedback`
--

DROP TABLE IF EXISTS `patientFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientFeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `feedback` int(2) NOT NULL,
  `commentedByUid` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimeZone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientSetPlanBarwickCircadian`
--

DROP TABLE IF EXISTS `patientSetPlanBarwickCircadian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientSetPlanBarwickCircadian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) NOT NULL,
  `setStartTime` time NOT NULL,
  `setEndTime` time NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(10) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientTrackBarwickCircadian`
--

DROP TABLE IF EXISTS `patientTrackBarwickCircadian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientTrackBarwickCircadian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) NOT NULL,
  `setPlanId` int(11) NOT NULL,
  `sleepDate` date NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(10) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pushNotificationLog`
--

DROP TABLE IF EXISTS `pushNotificationLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pushNotificationLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moodDeviceTableID` int(11) NOT NULL,
  `sentNotificationDateTime` datetime DEFAULT NULL,
  `sentNotificationTimeZone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1292 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncDeviceDetails`
--

DROP TABLE IF EXISTS `syncDeviceDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncDeviceDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `sync_date` datetime DEFAULT NULL,
  `device_uuid` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uploadDetailsFromSignToEmr`
--

DROP TABLE IF EXISTS `uploadDetailsFromSignToEmr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadDetailsFromSignToEmr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploadedByID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `folderName` varchar(100) DEFAULT NULL,
  `uploadedDateTime` datetime DEFAULT NULL,
  `uploadedTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userNotificationDetails`
--

DROP TABLE IF EXISTS `userNotificationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userNotificationDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moodDeviceTableID` int(11) NOT NULL,
  `isNotificationEnabled` enum('true','false') NOT NULL,
  `medium` enum('Email','SMS','Phone Notification') DEFAULT NULL,
  `frequency` enum('Daily','Weekly') DEFAULT NULL,
  `notificationDate` date DEFAULT NULL,
  `notificationTime` time DEFAULT NULL,
  `notificationTimeZone` varchar(10) DEFAULT NULL,
  `timeZoneOffset` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `moodDevice` (`moodDeviceTableID`),
  CONSTRAINT `moodDeviceID` FOREIGN KEY (`moodDeviceTableID`) REFERENCES `moodDeviceDetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
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
