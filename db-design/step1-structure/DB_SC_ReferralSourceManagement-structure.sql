-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_ReferralSourceManagement
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
-- Current Database: `DB_SC_ReferralSourceManagement`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_ReferralSourceManagement` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_ReferralSourceManagement`;

--
-- Table structure for table `masterStatus`
--

DROP TABLE IF EXISTS `masterStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personReferred`
--

DROP TABLE IF EXISTS `personReferred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personReferred` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfPersonBeingReferred` varchar(200) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `reasonForReferral` varchar(255) DEFAULT NULL,
  `ReferredBy` varchar(200) DEFAULT NULL,
  `referralSourceID` int(11) DEFAULT NULL,
  `uidOfCreatedBy` int(11) DEFAULT NULL,
  `uidFromEMR` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimeZone` varchar(8) DEFAULT NULL,
  `updatedByUid` int(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(10) DEFAULT NULL,
  `isDeleted` enum('no','yes') NOT NULL DEFAULT 'no',
  `deletedByUid` int(11) DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `deletedAtTimeZone` varchar(10) DEFAULT NULL,
  `isLocked` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referralSourceComments`
--

DROP TABLE IF EXISTS `referralSourceComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referralSourceComments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `referralSourceID` int(11) DEFAULT NULL,
  `comment` text,
  `userIDOfPersonMakingComment` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referralSources`
--

DROP TABLE IF EXISTS `referralSources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referralSources` (
  `referralSourceID` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfReferralSource` varchar(255) DEFAULT NULL,
  `referralSourceIDOfParent` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mailingAddressStreet` varchar(200) DEFAULT NULL,
  `mailingAddressLine1` varchar(200) DEFAULT NULL,
  `mailingAddressLine2` varchar(200) DEFAULT NULL,
  `mailingAddressCity` varchar(100) DEFAULT NULL,
  `mailingAddressState` varchar(100) DEFAULT NULL,
  `mailingAddressZip` varchar(10) DEFAULT NULL,
  `statusID` int(11) DEFAULT NULL,
  `uidOfCreatedBy` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(6) NOT NULL,
  `updatedByUid` int(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updateAtTimeZone` varchar(10) DEFAULT NULL,
  `isDeleted` enum('no','yes') NOT NULL DEFAULT 'no',
  `deletedByUid` int(11) DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `deletedAtTimeZone` varchar(10) DEFAULT NULL,
  `isLocked` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`referralSourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referredPatientUploadedFile`
--

DROP TABLE IF EXISTS `referredPatientUploadedFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referredPatientUploadedFile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referredPersonId` int(11) NOT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `binaryContentOfFile` longblob NOT NULL,
  `uploadedByUid` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempTableForUploadFiles`
--

DROP TABLE IF EXISTS `tempTableForUploadFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempTableForUploadFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeStamp` varchar(100) DEFAULT NULL,
  `fileName` varchar(100) NOT NULL,
  `binaryContentOfFile` longblob NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimeZone` varchar(10) NOT NULL,
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
