-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Documents
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
-- Current Database: `DB_SC_Documents`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Documents` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Documents`;

--
-- Table structure for table `documentComments`
--

DROP TABLE IF EXISTS `documentComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentComments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploadID` int(11) unsigned NOT NULL,
  `comment` text NOT NULL,
  `uidOfCommentedBy` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploadID` (`uploadID`),
  KEY `uidOfCommentedBy` (`uidOfCommentedBy`),
  CONSTRAINT `documentComments_ibfk_1` FOREIGN KEY (`uidOfCommentedBy`) REFERENCES `documentUploadFolder` (`uploadID`),
  CONSTRAINT `documentComments_ibfk_2` FOREIGN KEY (`uidOfCommentedBy`) REFERENCES `DB_SCEMR_PROD`.`users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='One uploadID can have multiple comments associated with it.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentLabel`
--

DROP TABLE IF EXISTS `documentLabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentLabel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `isDelete` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentUploadFolder`
--

DROP TABLE IF EXISTS `documentUploadFolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentUploadFolder` (
  `uploadID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `folder` varchar(512) NOT NULL DEFAULT '',
  `labelId` int(11) DEFAULT '1',
  `docStatus` varchar(50) NOT NULL,
  `uidOfUploadedBy` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdatedAt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uploadID`),
  KEY `ForUserID` (`uidOfUploadedBy`),
  KEY `ForPatientID` (`uidOfPatient`),
  CONSTRAINT `ForUserID` FOREIGN KEY (`uidOfUploadedBy`) REFERENCES `DB_SCEMR_PROD`.`users` (`id`),
  CONSTRAINT `documentUploadFolder_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `DB_SCEMR_PROD`.`users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31745 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploadID` int(11) unsigned NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` text,
  `fileType` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foruploadid` (`uploadID`),
  KEY `uploadID` (`uploadID`),
  CONSTRAINT `foruploadid` FOREIGN KEY (`uploadID`) REFERENCES `documentUploadFolder` (`uploadID`)
) ENGINE=InnoDB AUTO_INCREMENT=33750 DEFAULT CHARSET=utf8 COMMENT='1. One upload ID can have multiple documents 2. File content is stored in the documents table since we do not want the app to depend on the file system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentsTemp`
--

DROP TABLE IF EXISTS `documentsTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentsTemp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tempID` varchar(128) NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` text,
  `fileType` varchar(128) NOT NULL DEFAULT '',
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `folderID` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `documentsTemp_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `DB_SCEMR_PROD`.`users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21789 DEFAULT CHARSET=utf8 COMMENT='1. Documents are put in this table temporarily. Once we get the upload id than we move the documents to the documents table. 2. When the documents are uploaded the uploadID is still not available. The uploadID only becomes available when the user hits the "Save" button. Hence we need this temp table.';
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
