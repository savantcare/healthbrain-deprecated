-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_EmployeePerformanceReport
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
-- Current Database: `DB_SC_EmployeePerformanceReport`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_EmployeePerformanceReport` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_EmployeePerformanceReport`;

--
-- Table structure for table `associationBetweenEmployeeAndManager`
--

DROP TABLE IF EXISTS `associationBetweenEmployeeAndManager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associationBetweenEmployeeAndManager` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `uidOfEmployee` int(100) NOT NULL,
  `uidOfManager` int(100) NOT NULL,
  `createdByUid` int(100) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimezone` varchar(10) NOT NULL,
  `isDeleted` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedByUid` int(100) DEFAULT NULL,
  `deletedOn` datetime DEFAULT NULL,
  `deletedOnTimezone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autoHdrCreatedByVM`
--

DROP TABLE IF EXISTS `autoHdrCreatedByVM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoHdrCreatedByVM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hdrID` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `calDateTime` datetime DEFAULT NULL,
  `voiceMessageID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5312 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `callLogDetails_v4`
--

DROP TABLE IF EXISTS `callLogDetails_v4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callLogDetails_v4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relatedToUID` int(11) NOT NULL,
  `dateTime` datetime DEFAULT NULL,
  `callType` enum('Answered','Not answered','Made','Other') NOT NULL DEFAULT 'Other',
  `sourcePhoneNo` varchar(20) DEFAULT NULL,
  `destinationPhoneNo` varchar(20) DEFAULT NULL,
  `recordingFileName` varchar(255) DEFAULT NULL,
  `secondsOnPhone` int(11) DEFAULT NULL,
  `updatedOn` datetime NOT NULL,
  `updatedOnTimeZone` varchar(10) NOT NULL,
  KEY `id` (`id`),
  KEY `relatedToUID` (`relatedToUID`)
) ENGINE=InnoDB AUTO_INCREMENT=2005625 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeePerformanceData`
--

DROP TABLE IF EXISTS `employeePerformanceData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeePerformanceData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `src` varchar(20) DEFAULT NULL,
  `dst` varchar(20) DEFAULT NULL,
  `recordingFileName` varchar(255) DEFAULT NULL,
  `numberOfCallsAnswered` int(11) DEFAULT NULL,
  `numberOfCallsNoAnswered` int(11) DEFAULT NULL,
  `numberOfCallsMade` int(11) DEFAULT NULL,
  `secondsOnPhone` int(11) DEFAULT NULL,
  `numberOfMessagesInVMBox` int(11) DEFAULT NULL,
  `numberOfMessagesForReachingInVMBox` int(11) DEFAULT NULL,
  `numberOfHDRClosed` int(11) DEFAULT NULL,
  `numberOfHDRCreated` int(11) DEFAULT NULL,
  `liveChat` int(11) DEFAULT NULL,
  `smsSent` int(11) DEFAULT NULL,
  `smsRecd` int(11) DEFAULT NULL,
  `emailsSent` int(11) DEFAULT NULL,
  `emailsRecd` int(11) DEFAULT NULL,
  `daysAbsent` int(11) DEFAULT NULL,
  `hdrCreat` enum('no','yes') NOT NULL DEFAULT 'no',
  `voiceMessageID` varchar(200) DEFAULT NULL,
  `ratingPoint` int(11) DEFAULT NULL,
  `ratingVoiceMessageFile` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67277348 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ringGroup`
--

DROP TABLE IF EXISTS `ringGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(200) NOT NULL,
  `callDateTime` datetime NOT NULL,
  `callStatus` varchar(100) DEFAULT NULL,
  `src` varchar(20) DEFAULT NULL,
  `dst` varchar(20) DEFAULT NULL COMMENT 'call receiver',
  `did` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchFilterSetting`
--

DROP TABLE IF EXISTS `searchFilterSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchFilterSetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `userRole` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supervisorRatings`
--

DROP TABLE IF EXISTS `supervisorRatings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisorRatings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `individualRating` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workPointsMaster`
--

DROP TABLE IF EXISTS `workPointsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workPointsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hdrCreated` decimal(10,2) DEFAULT NULL,
  `hdrClosed` decimal(10,2) DEFAULT NULL,
  `callsMade` decimal(10,2) DEFAULT NULL,
  `callsReceived` decimal(10,2) DEFAULT NULL,
  `callsNotAnswered` decimal(10,2) NOT NULL,
  `taskClosed` decimal(10,2) NOT NULL,
  `taskOpenCurrently` decimal(10,2) NOT NULL,
  `ageOfOpenTask` decimal(10,2) NOT NULL,
  `taskInProgress` decimal(10,2) NOT NULL,
  `hdrOpenCurrently` decimal(10,2) NOT NULL,
  `hdrInProgress` decimal(10,2) NOT NULL,
  `ageOfOpenHdr` decimal(10,2) NOT NULL,
  `managerOpenTaskPoint` decimal(10,2) NOT NULL,
  `managerOpenHDRPoint` decimal(10,2) NOT NULL,
  `hdrOpenExceedsMaxDay` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
