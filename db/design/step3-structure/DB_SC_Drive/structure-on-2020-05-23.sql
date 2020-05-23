-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Drive
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
-- Current Database: `DB_SC_Drive`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Drive` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Drive`;

--
-- Table structure for table `assignedDetails`
--

DROP TABLE IF EXISTS `assignedDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignedDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileMasterID` int(11) NOT NULL,
  `patientId` int(11) unsigned DEFAULT NULL,
  `assignedByID` int(11) unsigned DEFAULT NULL,
  `startPage` int(11) DEFAULT NULL,
  `endPage` int(11) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(100) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileMasterID` (`fileMasterID`) USING BTREE,
  KEY `patientId` (`patientId`),
  KEY `assignedByID` (`assignedByID`),
  CONSTRAINT `assignedDetails_ibfk_1` FOREIGN KEY (`fileMasterID`) REFERENCES `driveFilesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2541 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveFileSettings`
--

DROP TABLE IF EXISTS `driveFileSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFileSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) DEFAULT NULL,
  `fieldType` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileId` (`fileId`),
  CONSTRAINT `driveFileSettings_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `driveFilesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveFileTags`
--

DROP TABLE IF EXISTS `driveFileTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFileTags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoID` int(11) NOT NULL,
  `tagID` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdOnTimezone` varchar(10) DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `videoIDIndex` (`videoID`),
  KEY `uidOfCreatedByIndex` (`uidOfCreatedBy`),
  KEY `tagID` (`tagID`),
  CONSTRAINT `driveFileTags_ibfk_1` FOREIGN KEY (`tagID`) REFERENCES `driveTagsMaster` (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=5585 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveFilesMaster`
--

DROP TABLE IF EXISTS `driveFilesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFilesMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `content` longblob,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `createdOnTimezone` varchar(100) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isThisLocked` enum('yes','no') DEFAULT NULL,
  `videoParentID` int(11) DEFAULT NULL,
  `deletedBy` int(11) unsigned DEFAULT NULL,
  `deletedDate` timestamp NULL DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uidOfCreatedByIndex` (`uidOfCreatedBy`),
  FULLTEXT KEY `driveFile_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14372 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveFilesMasterAsOn4feb`
--

DROP TABLE IF EXISTS `driveFilesMasterAsOn4feb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFilesMasterAsOn4feb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `createdOnTimezone` varchar(10) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isThisLocked` enum('yes','no') DEFAULT NULL,
  `videoParentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfCreatedByIndex` (`uidOfCreatedBy`),
  FULLTEXT KEY `driveFile_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=981 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveFilesMaster_bk_for_migration`
--

DROP TABLE IF EXISTS `driveFilesMaster_bk_for_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFilesMaster_bk_for_migration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `createdOnTimezone` varchar(10) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isThisLocked` enum('yes','no') DEFAULT NULL,
  `videoParentID` int(11) DEFAULT NULL,
  `deletedBy` int(11) unsigned DEFAULT NULL,
  `deletedDate` timestamp NULL DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uidOfCreatedByIndex` (`uidOfCreatedBy`),
  FULLTEXT KEY `driveFile_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5362 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveFilesViewer`
--

DROP TABLE IF EXISTS `driveFilesViewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFilesViewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driveFilesMasterId` int(11) DEFAULT NULL,
  `videoId` int(11) NOT NULL,
  `uidOfViewedBy` int(11) unsigned NOT NULL,
  `createdOnTimezone` varchar(10) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `viewedTimeInSecond` int(11) DEFAULT NULL,
  `totalTimeInSecond` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `driveFilesMasterId` (`videoId`),
  KEY `usersIdx` (`uidOfViewedBy`),
  CONSTRAINT `driveFilesViewer_ibfk_2` FOREIGN KEY (`videoId`) REFERENCES `driveFilesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1149 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driveTagsMaster`
--

DROP TABLE IF EXISTS `driveTagsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveTagsMaster` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdOnTimezone` varchar(10) DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`tagID`),
  KEY `tagMasterUidOfCreatedByIndex` (`uidOfCreatedBy`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileDownloadMaster`
--

DROP TABLE IF EXISTS `fileDownloadMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileDownloadMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `downloadedOn` datetime DEFAULT NULL,
  `downloadedOnTimezone` varchar(10) DEFAULT NULL,
  `uidOfDownloadedBy` int(11) unsigned NOT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileDownloadMasterUidOfDownloadedByIndex` (`uidOfDownloadedBy`),
  KEY `fileIdIndex` (`fileId`),
  CONSTRAINT `fileDownloadMaster_ibfk_2` FOREIGN KEY (`fileId`) REFERENCES `driveFilesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1747 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileExtensionMaster`
--

DROP TABLE IF EXISTS `fileExtensionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileExtensionMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileExtensionType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filePageNumber`
--

DROP TABLE IF EXISTS `filePageNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filePageNumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileMasterID` int(11) NOT NULL,
  `totalNumberOfPage` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileMasterID` (`fileMasterID`) USING BTREE,
  CONSTRAINT `filePageNumber_ibfk_1` FOREIGN KEY (`fileMasterID`) REFERENCES `driveFilesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1648 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileTypeAndExtensionMapping`
--

DROP TABLE IF EXISTS `fileTypeAndExtensionMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileTypeAndExtensionMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileTypeId` int(11) DEFAULT NULL,
  `fileExtensionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fileTypeId` (`fileTypeId`),
  KEY `fileExtensionId` (`fileExtensionId`),
  CONSTRAINT `fileTypeAndExtensionMapping_ibfk_1` FOREIGN KEY (`fileTypeId`) REFERENCES `fileTypeMaster` (`id`),
  CONSTRAINT `fileTypeAndExtensionMapping_ibfk_2` FOREIGN KEY (`fileExtensionId`) REFERENCES `fileExtensionMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileTypeMaster`
--

DROP TABLE IF EXISTS `fileTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
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
