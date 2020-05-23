-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_OfficeAllyClaims_BAK
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
-- Current Database: `DB_SC_OfficeAllyClaims_BAK`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_OfficeAllyClaims_BAK` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_OfficeAllyClaims_BAK`;

--
-- Table structure for table `claimsUsingOfficeAllyDataFromFileEDI`
--

DROP TABLE IF EXISTS `claimsUsingOfficeAllyDataFromFileEDI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimsUsingOfficeAllyDataFromFileEDI` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) DEFAULT NULL,
  `fileID` varchar(50) DEFAULT NULL,
  `claimID` varchar(50) DEFAULT NULL,
  `patientAcctNo` varchar(50) DEFAULT NULL,
  `patientName` varchar(50) DEFAULT NULL COMMENT 'lastName, firstName',
  `amount` float(10,2) DEFAULT NULL,
  `practiceID` varchar(50) DEFAULT NULL,
  `taxID` varchar(50) DEFAULT NULL,
  `payer` varchar(50) DEFAULT NULL,
  `payerProcessDate` date DEFAULT NULL,
  `payerRefID` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `payerResponse` text,
  `fileReadeDateTime` datetime DEFAULT NULL,
  `fileReadeTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20414 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimsUsingOfficeAllyDataFromFileERA`
--

DROP TABLE IF EXISTS `claimsUsingOfficeAllyDataFromFileERA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimsUsingOfficeAllyDataFromFileERA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` varchar(50) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL COMMENT 'lastName, firstName',
  `accntNo` varchar(50) DEFAULT NULL,
  `checkNumber` varchar(50) DEFAULT NULL,
  `paymentAmount` float(10,2) DEFAULT NULL,
  `chargeAmount` float(10,2) DEFAULT NULL,
  `dateOfTransaction` datetime DEFAULT NULL,
  `fileReadeDateTime` datetime DEFAULT NULL,
  `fileReadeTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11268 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimsUsingOfficeAllyDataFromFileHCFA`
--

DROP TABLE IF EXISTS `claimsUsingOfficeAllyDataFromFileHCFA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimsUsingOfficeAllyDataFromFileHCFA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) DEFAULT NULL,
  `claimID` varchar(50) DEFAULT NULL,
  `patientID` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL COMMENT 'lastName, firstName ',
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `cptCode` varchar(50) DEFAULT NULL,
  `diagnosticCode` varchar(50) DEFAULT NULL,
  `taxID` varchar(50) DEFAULT NULL,
  `accntNo` varchar(50) DEFAULT NULL,
  `physID` varchar(50) DEFAULT NULL,
  `fileReadeDateTime` datetime DEFAULT NULL,
  `fileReadeTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12791 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentDetails`
--

DROP TABLE IF EXISTS `paymentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EraID` int(11) DEFAULT NULL,
  `emrEventID` int(11) DEFAULT NULL,
  `emrEventStartDateTime` datetime DEFAULT NULL,
  `emrEventEndDateTime` datetime DEFAULT NULL,
  `serviceDate` date DEFAULT NULL,
  `cpt` varchar(50) DEFAULT NULL,
  `chargeAmount` float(10,2) DEFAULT NULL,
  `paymentAmount` float(10,2) DEFAULT NULL,
  `isUpdatedByScript` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `era` (`EraID`),
  CONSTRAINT `paymentDetails_ibfk_1` FOREIGN KEY (`EraID`) REFERENCES `claimsUsingOfficeAllyDataFromFileERA` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22570 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uploadFileDetails`
--

DROP TABLE IF EXISTS `uploadFileDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadFileDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusMasterID` int(11) NOT NULL,
  `eventId` int(11) DEFAULT NULL,
  `planID` int(11) DEFAULT NULL COMMENT '[1=>''Other'', 2=>''Medicare'',3=>''Medicaid'',4=>''Tricare'',5=>''Champva'',6=>''Group health'',7=>''Feca blk lung'']',
  `fileName` varchar(100) DEFAULT NULL,
  `requestData` longtext,
  `createdById` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploadStatusMaster` (`statusMasterID`),
  CONSTRAINT `uploadStatusMaster` FOREIGN KEY (`statusMasterID`) REFERENCES `uploadFileStatusMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6348 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uploadFileStatusMaster`
--

DROP TABLE IF EXISTS `uploadFileStatusMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadFileStatusMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
