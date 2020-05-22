-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_DischargeLetter
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
-- Current Database: `DB_SC_DischargeLetter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_DischargeLetter` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_DischargeLetter`;

--
-- Table structure for table `cronRunningHistory`
--

DROP TABLE IF EXISTS `cronRunningHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronRunningHistory` (
  `runningID` int(10) NOT NULL AUTO_INCREMENT,
  `cronName` varchar(100) NOT NULL,
  `lastRunOnDateTime` datetime NOT NULL,
  PRIMARY KEY (`runningID`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dischargeLetterTemplate`
--

DROP TABLE IF EXISTS `dischargeLetterTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dischargeLetterTemplate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `providerUid` varchar(36) NOT NULL,
  `isDefault` enum('yes','no') NOT NULL DEFAULT 'no',
  `templateName` varchar(255) DEFAULT NULL,
  `letterSubject` text NOT NULL,
  `letterBody` text NOT NULL,
  `letterSignature` text NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimezone` varchar(100) DEFAULT NULL,
  `createdByUid` varchar(36) NOT NULL,
  `isDeleted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `deletedOn` datetime DEFAULT NULL,
  `deletedOnTimezone` varchar(100) DEFAULT NULL,
  `deletedByUid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dischargeablePatientListUpdatedViaCron`
--

DROP TABLE IF EXISTS `dischargeablePatientListUpdatedViaCron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dischargeablePatientListUpdatedViaCron` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `patientName` varchar(255) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `providerName` varchar(255) NOT NULL,
  `lastAppointmentID` int(10) NOT NULL,
  `lastAppointmentOn` datetime NOT NULL,
  `lastAppointmentStatusID` int(10) NOT NULL,
  `lastAppointmentStatus` varchar(255) NOT NULL,
  `messageForProvider` text NOT NULL,
  `urlToRetain` text,
  `urlToPatientFile` text,
  `cronRunningID` int(10) NOT NULL,
  `isMessageSent` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRetained` enum('Yes','No') NOT NULL DEFAULT 'No',
  `retainedOnDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7260 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dischargeablePatientListUpdatedViaCron23Oct`
--

DROP TABLE IF EXISTS `dischargeablePatientListUpdatedViaCron23Oct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dischargeablePatientListUpdatedViaCron23Oct` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `patientName` varchar(255) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `providerName` varchar(255) NOT NULL,
  `lastAppointmentID` int(10) NOT NULL,
  `lastAppointmentOn` datetime NOT NULL,
  `lastAppointmentStatusID` int(10) NOT NULL,
  `lastAppointmentStatus` varchar(255) NOT NULL,
  `messageForProvider` text NOT NULL,
  `urlToRetain` text,
  `urlToPatientFile` text,
  `cronRunningID` int(10) NOT NULL,
  `isMessageSent` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRetained` enum('Yes','No') NOT NULL DEFAULT 'No',
  `retainedOnDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3815 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dischargeablePatientListUpdatedViaCronNew`
--

DROP TABLE IF EXISTS `dischargeablePatientListUpdatedViaCronNew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dischargeablePatientListUpdatedViaCronNew` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `patientName` varchar(255) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `providerName` varchar(255) NOT NULL,
  `lastAppointmentID` int(10) NOT NULL,
  `lastAppointmentOn` datetime NOT NULL,
  `lastAppointmentStatusID` int(10) NOT NULL,
  `lastAppointmentStatus` varchar(255) NOT NULL,
  `messageForProvider` text NOT NULL,
  `urlToRetain` text,
  `urlToPatientFile` text,
  `cronRunningID` int(10) NOT NULL,
  `isMessageSent` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRetained` enum('Yes','No') NOT NULL DEFAULT 'No',
  `retainedOnDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3673 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dischargeablePatientListUpdatedViaCronOld`
--

DROP TABLE IF EXISTS `dischargeablePatientListUpdatedViaCronOld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dischargeablePatientListUpdatedViaCronOld` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `patientName` varchar(255) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `providerName` varchar(255) NOT NULL,
  `lastAppointmentID` int(10) NOT NULL,
  `lastAppointmentOn` datetime NOT NULL,
  `lastAppointmentStatusID` int(10) NOT NULL,
  `lastAppointmentStatus` varchar(255) NOT NULL,
  `messageForProvider` text NOT NULL,
  `urlToRetain` text,
  `urlToPatientFile` text,
  `cronRunningID` int(10) NOT NULL,
  `isMessageSent` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRetained` enum('Yes','No') NOT NULL DEFAULT 'No',
  `retainedOnDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dischargeablePatientListUpdatedViaCronOldBkp`
--

DROP TABLE IF EXISTS `dischargeablePatientListUpdatedViaCronOldBkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dischargeablePatientListUpdatedViaCronOldBkp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `patientName` varchar(255) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `providerName` varchar(255) NOT NULL,
  `lastAppointmentID` int(10) NOT NULL,
  `lastAppointmentOn` datetime NOT NULL,
  `lastAppointmentStatusID` int(10) NOT NULL,
  `lastAppointmentStatus` varchar(255) NOT NULL,
  `messageForProvider` text NOT NULL,
  `urlToRetain` text,
  `urlToPatientFile` text,
  `cronRunningID` int(10) NOT NULL,
  `isMessageSent` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRetained` enum('Yes','No') NOT NULL DEFAULT 'No',
  `retainedOnDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientDischargeDetails`
--

DROP TABLE IF EXISTS `patientDischargeDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientDischargeDetails` (
  `dischargeID` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `dischargedOn` datetime NOT NULL,
  `isPatientInformed` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`dischargeID`),
  UNIQUE KEY `patientUid` (`patientUid`)
) ENGINE=InnoDB AUTO_INCREMENT=7645 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientRetentionDetails`
--

DROP TABLE IF EXISTS `patientRetentionDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientRetentionDetails` (
  `retaintionID` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `retainedOnDateTime` datetime NOT NULL,
  `retainedForDays` int(10) NOT NULL,
  `nextApprovalDate` date NOT NULL,
  PRIMARY KEY (`retaintionID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerSpecificSettings`
--

DROP TABLE IF EXISTS `providerSpecificSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerSpecificSettings` (
  `settingsId` int(10) NOT NULL AUTO_INCREMENT,
  `providerUid` varchar(36) NOT NULL,
  `isDefault` enum('yes','no') NOT NULL DEFAULT 'no',
  `maxInactiveDaysAllowed` int(5) DEFAULT NULL,
  `monthsToConsiderForDischarge` int(3) DEFAULT NULL,
  `createdByUid` varchar(36) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimezone` varchar(100) NOT NULL,
  `isItActive` enum('yes','no') NOT NULL DEFAULT 'yes',
  `updatedByUid` varchar(36) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedOnTimezone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`settingsId`),
  KEY `providerUid` (`providerUid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trackFailedToDischargePatients`
--

DROP TABLE IF EXISTS `trackFailedToDischargePatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackFailedToDischargePatients` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` varchar(36) NOT NULL,
  `providerUid` varchar(36) NOT NULL,
  `failedAttemptOnDateTime` datetime NOT NULL,
  `failedReason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8683 DEFAULT CHARSET=latin1;
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
