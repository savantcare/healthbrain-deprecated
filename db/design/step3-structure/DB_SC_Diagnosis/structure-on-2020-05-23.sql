-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Diagnosis
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
-- Current Database: `DB_SC_Diagnosis`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Diagnosis` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Diagnosis`;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) unsigned DEFAULT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `agree` varchar(255) DEFAULT NULL,
  `assessment` varchar(255) DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the diagnosis is locked or not',
  `startDate` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(10) DEFAULT NULL,
  `createdAtTimezone` varchar(30) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedTimeZone` varchar(5) DEFAULT NULL,
  `discontinueNotes` varchar(255) DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=20067 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosisAssessment`
--

DROP TABLE IF EXISTS `diagnosisAssessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosisAssessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosisId` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `assessment` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  `updateAtTimezone` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(5) DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2547 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diagnosis_bk24December2018`
--

DROP TABLE IF EXISTS `diagnosis_bk24December2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis_bk24December2018` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `agree` varchar(255) DEFAULT NULL,
  `assessment` varchar(255) DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the diagnosis is locked or not',
  `startDate` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(10) DEFAULT NULL,
  `createdAtTimezone` varchar(30) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedTimeZone` varchar(5) DEFAULT NULL,
  `discontinueNotes` varchar(255) DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10660 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsmMasterCodes`
--

DROP TABLE IF EXISTS `dsmMasterCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsmMasterCodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `dsm5Code` varchar(50) DEFAULT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10AndScreenMappingDetails`
--

DROP TABLE IF EXISTS `icd10AndScreenMappingDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10AndScreenMappingDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icd10ID` int(11) NOT NULL,
  `screenID` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10MasterCodes`
--

DROP TABLE IF EXISTS `icd10MasterCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10MasterCodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49841 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10MasterCodes_bk_06.11.2018`
--

DROP TABLE IF EXISTS `icd10MasterCodes_bk_06.11.2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10MasterCodes_bk_06.11.2018` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10MasterCodes_bk_13.11.2018`
--

DROP TABLE IF EXISTS `icd10MasterCodes_bk_13.11.2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10MasterCodes_bk_13.11.2018` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49431 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10MasterCodes_old_12.11.2018`
--

DROP TABLE IF EXISTS `icd10MasterCodes_old_12.11.2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10MasterCodes_old_12.11.2018` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `icd10Code` (`icd10Code`)
) ENGINE=InnoDB AUTO_INCREMENT=49431 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icd10MasterCodes_old_on24oct2018`
--

DROP TABLE IF EXISTS `icd10MasterCodes_old_on24oct2018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icd10MasterCodes_old_on24oct2018` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientReportedDiagnosis`
--

DROP TABLE IF EXISTS `patientReportedDiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientReportedDiagnosis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOnUID` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `diagnosisName` varchar(255) NOT NULL,
  `whenHappened` datetime DEFAULT NULL,
  `status` enum('Patient reported','Other provider confirmed') NOT NULL DEFAULT 'Patient reported',
  `isItLocked` varchar(10) NOT NULL DEFAULT 'No',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(30) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(255) DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `agree` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `originId` int(11) NOT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3404 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientReportedDiagnosisNote`
--

DROP TABLE IF EXISTS `patientReportedDiagnosisNote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientReportedDiagnosisNote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosisReportedId` int(11) NOT NULL,
  `note` text NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdOnTimeZone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diagnosisReportedId` (`diagnosisReportedId`)
) ENGINE=InnoDB AUTO_INCREMENT=2596 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ruledOutDiagnosis`
--

DROP TABLE IF EXISTS `ruledOutDiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruledOutDiagnosis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) NOT NULL,
  `ruledOutOnUID` int(11) unsigned NOT NULL,
  `ruledOutByUID` int(11) unsigned NOT NULL,
  `diagnosisId` int(11) NOT NULL,
  `diagnosisName` varchar(255) NOT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `isItLocked` varchar(10) NOT NULL DEFAULT 'no',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `endDate` timestamp NULL DEFAULT NULL,
  `createdAtTimezone` varchar(30) DEFAULT NULL,
  `ruledOutBy` int(10) unsigned DEFAULT NULL,
  `ruledOutOn` datetime DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ruledOutByUID` (`ruledOutByUID`)
) ENGINE=InnoDB AUTO_INCREMENT=6046 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ruledOutDiagnosis_backup`
--

DROP TABLE IF EXISTS `ruledOutDiagnosis_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruledOutDiagnosis_backup` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `ruledOutOnUID` int(11) unsigned NOT NULL,
  `ruledOutByUID` int(11) unsigned NOT NULL,
  `diagnosisId` int(11) NOT NULL,
  `diagnosisName` varchar(255) NOT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `isItLocked` varchar(10) NOT NULL DEFAULT 'no',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `endDate` timestamp NULL DEFAULT NULL,
  `createdAtTimezone` varchar(30) DEFAULT NULL,
  `ruledOutBy` int(10) unsigned DEFAULT NULL,
  `ruledOutOn` datetime DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ruledOutNotes`
--

DROP TABLE IF EXISTS `ruledOutNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruledOutNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruledOutId` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `note` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  `updatedByUid` int(11) DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  `updateAtTimezone` varchar(10) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(10) DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
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
