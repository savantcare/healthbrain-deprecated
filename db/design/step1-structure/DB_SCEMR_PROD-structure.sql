-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
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
-- Current Database: `DB_SCEMR_PROD`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SCEMR_PROD` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SCEMR_PROD`;

--
-- Table structure for table `MSEAffectOptionsMaster`
--

DROP TABLE IF EXISTS `MSEAffectOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEAffectOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEAppearanceOptionsMaster`
--

DROP TABLE IF EXISTS `MSEAppearanceOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEAppearanceOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEAttitudeOptionsMaster`
--

DROP TABLE IF EXISTS `MSEAttitudeOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEAttitudeOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSECognitionOptionsMaster`
--

DROP TABLE IF EXISTS `MSECognitionOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSECognitionOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEConstitutionalOptionsMaster`
--

DROP TABLE IF EXISTS `MSEConstitutionalOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEConstitutionalOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEEyeContactOptionsMaster`
--

DROP TABLE IF EXISTS `MSEEyeContactOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEEyeContactOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEForPatients`
--

DROP TABLE IF EXISTS `MSEForPatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEForPatients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `isReviewed` enum('yes','no') NOT NULL DEFAULT 'no',
  `affectOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `affectExtraInfo` varchar(255) DEFAULT NULL,
  `appearanceOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `appearanceExtraInfo` varchar(255) DEFAULT NULL,
  `attitudeOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `attitudeExtraInfo` varchar(255) DEFAULT NULL,
  `cognitionOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `cognitionExtraInfo` varchar(255) DEFAULT NULL,
  `constitutionalOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `constitutionalExtraInfo` varchar(255) DEFAULT NULL,
  `eyeContactOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `eyeContactExtraInfo` varchar(255) DEFAULT NULL,
  `impulseControlOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `impulseControlExtraInfo` varchar(255) DEFAULT NULL,
  `insightOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `insightExtraInfo` varchar(255) DEFAULT NULL,
  `judgementOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `judgementExtraInfo` varchar(255) DEFAULT NULL,
  `perceptionOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `perceptionExtraInfo` varchar(255) DEFAULT NULL,
  `psychomotorOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `psychomotorExtraInfo` varchar(255) DEFAULT NULL,
  `speechOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `speechExtraInfo` varchar(255) DEFAULT NULL,
  `thoughtContentOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `thoughtContentExtraInfo` varchar(255) DEFAULT NULL,
  `thoughtProcessOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `thoughtProcessExtraInfo` varchar(255) DEFAULT NULL,
  `neurologicalOptionsSelectedSumValue` int(11) NOT NULL DEFAULT '0',
  `neurologicalExtraInfo` varchar(255) DEFAULT NULL,
  `moodInfo` varchar(255) DEFAULT NULL,
  `timezoneAbbreviationForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reviewedOn` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfDoctor` (`uidOfDoctor`),
  CONSTRAINT `MSEForPatients_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `MSEForPatients_ibfk_2` FOREIGN KEY (`uidOfDoctor`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133858 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEForPatientsBkp`
--

DROP TABLE IF EXISTS `MSEForPatientsBkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEForPatientsBkp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `affectOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `affectExtraInfo` varchar(255) DEFAULT NULL,
  `appearanceOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `appearanceExtraInfo` varchar(255) DEFAULT NULL,
  `attitudeOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `attitudeExtraInfo` varchar(255) DEFAULT NULL,
  `cognitionOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `cognitionExtraInfo` varchar(255) DEFAULT NULL,
  `constitutionalOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `constitutionalExtraInfo` varchar(255) DEFAULT NULL,
  `eyeContactOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `eyeContactExtraInfo` varchar(255) DEFAULT NULL,
  `impulseControlOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `impulseControlExtraInfo` varchar(255) DEFAULT NULL,
  `insightOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `insightExtraInfo` varchar(255) DEFAULT NULL,
  `judgementOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `judgementExtraInfo` varchar(255) DEFAULT NULL,
  `perceptionOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `perceptionExtraInfo` varchar(255) DEFAULT NULL,
  `psychomotorOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `psychomotorExtraInfo` varchar(255) DEFAULT NULL,
  `speechOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `speechExtraInfo` varchar(255) DEFAULT NULL,
  `thoughtContentOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `thoughtContentExtraInfo` varchar(255) DEFAULT NULL,
  `thoughtProcessOptionsSelectedSumValue` int(11) unsigned NOT NULL DEFAULT '0',
  `thoughtProcessExtraInfo` varchar(255) DEFAULT NULL,
  `moodInfo` varchar(255) DEFAULT NULL,
  `timezoneAbbreviationForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfDoctor` (`uidOfDoctor`)
) ENGINE=InnoDB AUTO_INCREMENT=1624 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEImpulseControlOptionsMaster`
--

DROP TABLE IF EXISTS `MSEImpulseControlOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEImpulseControlOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEInsightOptionsMaster`
--

DROP TABLE IF EXISTS `MSEInsightOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEInsightOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEJudgementOptionsMaster`
--

DROP TABLE IF EXISTS `MSEJudgementOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEJudgementOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSENeurologicalOptionsMaster`
--

DROP TABLE IF EXISTS `MSENeurologicalOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSENeurologicalOptionsMaster` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `createdAtTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEPerceptionOptionsMaster`
--

DROP TABLE IF EXISTS `MSEPerceptionOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEPerceptionOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEPsychomotorOptionsMaster`
--

DROP TABLE IF EXISTS `MSEPsychomotorOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEPsychomotorOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSESpeechOptionsMaster`
--

DROP TABLE IF EXISTS `MSESpeechOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSESpeechOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEThoughtContentOptionsMaster`
--

DROP TABLE IF EXISTS `MSEThoughtContentOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEThoughtContentOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MSEThoughtProcessOptionsMaster`
--

DROP TABLE IF EXISTS `MSEThoughtProcessOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEThoughtProcessOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRSMasterCategory`
--

DROP TABLE IF EXISTS `PRSMasterCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRSMasterCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRSMasterKeys`
--

DROP TABLE IF EXISTS `PRSMasterKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRSMasterKeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterCategoryId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `valueInputFormElementType` varchar(10) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterCategoryId` (`masterCategoryId`),
  KEY `status` (`status`),
  CONSTRAINT `PRSMasterKeys_ibfk_1` FOREIGN KEY (`masterCategoryId`) REFERENCES `PRSMasterCategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRSMasterKeysValues`
--

DROP TABLE IF EXISTS `PRSMasterKeysValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRSMasterKeysValues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterKeyId` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `masterKeyId` (`masterKeyId`),
  CONSTRAINT `PRSMasterKeysValues_ibfk_1` FOREIGN KEY (`masterKeyId`) REFERENCES `PRSMasterKeys` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRSPatient`
--

DROP TABLE IF EXISTS `PRSPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRSPatient` (
  `prsReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `timezoneAbbreviationForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reviewedOn` date DEFAULT NULL,
  PRIMARY KEY (`prsReportID`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfDoctor` (`uidOfDoctor`),
  CONSTRAINT `PRSPatient_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `PRSPatient_ibfk_2` FOREIGN KEY (`uidOfDoctor`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRSPatientData`
--

DROP TABLE IF EXISTS `PRSPatientData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRSPatientData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prsReportID` int(11) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `uidOfDoctor` int(11) unsigned NOT NULL,
  `masterCategoryId` int(11) NOT NULL,
  `masterKeyId` int(11) DEFAULT NULL,
  `value` text,
  `timezoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reportId` (`prsReportID`),
  KEY `categoryId` (`masterCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=929261 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accessSuspensionAndRestoreLog`
--

DROP TABLE IF EXISTS `accessSuspensionAndRestoreLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessSuspensionAndRestoreLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspendedLoggedinId` int(11) DEFAULT NULL,
  `suspendedOnDate` datetime DEFAULT NULL,
  `suspendedOnTimeZone` varchar(10) DEFAULT NULL,
  `suspensionRemovedByUid` int(11) DEFAULT NULL,
  `suspensionRemovedByDate` datetime DEFAULT NULL,
  `suspensionRemovedByTimeZone` varchar(10) DEFAULT NULL,
  `Note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityLog`
--

DROP TABLE IF EXISTS `activityLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfActivityDoneBy` int(11) unsigned DEFAULT NULL,
  `uidOfActivityDoneOn` int(11) unsigned DEFAULT NULL,
  `idOfEventOnWhichAcitivtyIsDone` int(11) DEFAULT NULL,
  `timeOfActivity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timezoneAbbreviationForActivity` varchar(255) DEFAULT NULL,
  `clientIPAddressForActivity` text,
  `typeOfSection` varchar(50) DEFAULT NULL,
  `pluginID` tinyint(4) unsigned DEFAULT NULL,
  `typeOfActivity` enum('add','edit','delete','open','review','rating','priority','api request') NOT NULL,
  `pluginRowIDWhereActivityIsDone` int(11) unsigned DEFAULT NULL,
  `pluginRowNameWhereActivityIsDone` varchar(255) DEFAULT NULL,
  `pluginFieldName` varchar(255) DEFAULT NULL,
  `oldValue` varchar(2000) DEFAULT NULL,
  `newValue` varchar(2000) DEFAULT NULL,
  `apiRequestText` text,
  `apiResponseText` text,
  `othersDetailInfo` text,
  PRIMARY KEY (`id`),
  KEY `uidOfActivityDoneBy` (`uidOfActivityDoneBy`),
  KEY `uidOfActivityDoneOn` (`uidOfActivityDoneOn`),
  KEY `pluginID` (`pluginID`),
  KEY `eventId` (`idOfEventOnWhichAcitivtyIsDone`),
  CONSTRAINT `activityLog_ibfk_1` FOREIGN KEY (`uidOfActivityDoneBy`) REFERENCES `users` (`id`),
  CONSTRAINT `activityLog_ibfk_2` FOREIGN KEY (`uidOfActivityDoneOn`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12394484 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityLogForMasterDB`
--

DROP TABLE IF EXISTS `activityLogForMasterDB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLogForMasterDB` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activityDoneBy` int(10) NOT NULL,
  `activityDoneOnScript` int(10) NOT NULL,
  `activityDoneOnColumn` varchar(50) NOT NULL,
  `timeOfActivity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `oldValue` varchar(100) NOT NULL,
  `newValue` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityLogReadMark`
--

DROP TABLE IF EXISTS `activityLogReadMark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLogReadMark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readedUserId` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `activityLogId` int(11) DEFAULT NULL,
  `helpDeskLogId` int(11) DEFAULT NULL,
  `activityDoneOn` datetime DEFAULT NULL,
  `readMarkDoneAt` datetime DEFAULT NULL,
  `readMarkDoneAtTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityLogReportCustomFilters`
--

DROP TABLE IF EXISTS `activityLogReportCustomFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLogReportCustomFilters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(255) DEFAULT NULL,
  `noOfTimesAccessed` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityLogReportSummaries`
--

DROP TABLE IF EXISTS `activityLogReportSummaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLogReportSummaries` (
  `summaryReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportName` varchar(255) NOT NULL,
  `customReportID` int(11) unsigned NOT NULL,
  `fieldNamesUsedInSummaryReportStoredAsCSV` text NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`summaryReportID`),
  KEY `customReportID` (`customReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityLogReportSummaryStates`
--

DROP TABLE IF EXISTS `activityLogReportSummaryStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLogReportSummaryStates` (
  `stateID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportID` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateConfigurationObject` text NOT NULL,
  `isStateLocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `allUsersWithDateOfBirth`
--

DROP TABLE IF EXISTS `allUsersWithDateOfBirth`;
/*!50001 DROP VIEW IF EXISTS `allUsersWithDateOfBirth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `allUsersWithDateOfBirth` AS SELECT 
 1 AS `name`,
 1 AS `id`,
 1 AS `typeId`,
 1 AS `googleCalendarID`,
 1 AS `typeOfResource`,
 1 AS `dateOfBirth`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `createdById` int(11) DEFAULT NULL,
  `originId` varchar(15) DEFAULT NULL,
  `allergen` varchar(255) DEFAULT NULL,
  `reactions` varchar(255) DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the allergy is locked or not',
  `timeValue` varchar(50) DEFAULT NULL,
  `timeValueType` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `endDate` timestamp NULL DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UID` (`uid`),
  CONSTRAINT `allergies_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1328 DEFAULT CHARSET=latin1 COMMENT='1. spelling for severity is incorrect added by VK on 27/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allowUserToLoginAtRiskOfBeingHackedLog`
--

DROP TABLE IF EXISTS `allowUserToLoginAtRiskOfBeingHackedLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowUserToLoginAtRiskOfBeingHackedLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `searchedUid` int(11) DEFAULT NULL,
  `answerData` text,
  `answerScore` varchar(6) DEFAULT NULL,
  `answerSubmittedByUid` int(11) DEFAULT NULL,
  `answerVerifedByUid` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `androidUsersInstanceId`
--

DROP TABLE IF EXISTS `androidUsersInstanceId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `androidUsersInstanceId` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `instanceId` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apiAccessMaster`
--

DROP TABLE IF EXISTS `apiAccessMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiAccessMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `locationInNginx` varchar(255) DEFAULT NULL,
  `minSecurityLevelOfUserRoleToAccess` int(5) unsigned DEFAULT NULL,
  `Notes` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetTypes`
--

DROP TABLE IF EXISTS `assetTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `companyID` int(11) unsigned DEFAULT NULL,
  `locationID` int(10) DEFAULT NULL,
  `relatedUserID` int(11) DEFAULT NULL,
  `commonScreenIpAddr` varchar(255) DEFAULT NULL,
  `commonScreenVncServerPort` int(4) DEFAULT NULL,
  `commonScreenBrowserRemoteControlPort` int(4) DEFAULT NULL,
  `commonScreenVncWebSocketPort` int(4) DEFAULT NULL,
  `isThisShared` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`type`) REFERENCES `assetTypes` (`id`),
  CONSTRAINT `assets_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autoCreateGoogleBlockingEvent`
--

DROP TABLE IF EXISTS `autoCreateGoogleBlockingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoCreateGoogleBlockingEvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerID` int(11) NOT NULL,
  `eventDate` date DEFAULT NULL,
  `googleEventID` varchar(200) DEFAULT NULL,
  `actionOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`providerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2592 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `birthplace`
--

DROP TABLE IF EXISTS `birthplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birthplace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `firstParentID` int(11) unsigned NOT NULL DEFAULT '0',
  `createdByUID` int(11) unsigned DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) unsigned DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `discontinuedByUID` int(11) unsigned DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3587 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `careGiverName`
--

DROP TABLE IF EXISTS `careGiverName`;
/*!50001 DROP VIEW IF EXISTS `careGiverName`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `careGiverName` AS SELECT 
 1 AS `careGiverFName`,
 1 AS `careGiverLName`,
 1 AS `uidOfCareGiver`,
 1 AS `uidOfPatient`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `careTeam`
--

DROP TABLE IF EXISTS `careTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careTeam` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfCareGiver` int(11) unsigned DEFAULT NULL,
  `careTeamDesignationID` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfCareGiver` (`uidOfCareGiver`),
  KEY `careTeamDesignationID` (`careTeamDesignationID`),
  CONSTRAINT `careTeam_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `careTeam_ibfk_2` FOREIGN KEY (`uidOfCareGiver`) REFERENCES `users` (`id`),
  CONSTRAINT `careTeam_ibfk_3` FOREIGN KEY (`careTeamDesignationID`) REFERENCES `careTeamMasterDesignations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20223 DEFAULT CHARSET=latin1 COMMENT='see sc-165 on 27/6 by VK';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `careTeamMasterDesignations`
--

DROP TABLE IF EXISTS `careTeamMasterDesignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careTeamMasterDesignations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companyID` int(11) unsigned NOT NULL,
  `designationName` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `careTeamMasterDesignations_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='see sc-165 on 27/6 by VK';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `careteamStatus`
--

DROP TABLE IF EXISTS `careteamStatus`;
/*!50001 DROP VIEW IF EXISTS `careteamStatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `careteamStatus` AS SELECT 
 1 AS `eventID`,
 1 AS `eventStatusID`,
 1 AS `attendeeId`,
 1 AS `host`,
 1 AS `hostRoleId`,
 1 AS `hostRole`,
 1 AS `startDateTime`,
 1 AS `id`,
 1 AS `careteamflag`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `cashFlowView`
--

DROP TABLE IF EXISTS `cashFlowView`;
/*!50001 DROP VIEW IF EXISTS `cashFlowView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cashFlowView` AS SELECT 
 1 AS `providerId`,
 1 AS `providerName`,
 1 AS `CashInflow`,
 1 AS `CashOutflow`,
 1 AS `cptCodeID`,
 1 AS `startDateTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `choiceOfPatientAboutSCSubmittingInsuranceClaimsOnBehalfOfPatient`
--

DROP TABLE IF EXISTS `choiceOfPatientAboutSCSubmittingInsuranceClaimsOnBehalfOfPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choiceOfPatientAboutSCSubmittingInsuranceClaimsOnBehalfOfPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `allowSCtoSubmitClaims` enum('Yes','No') NOT NULL DEFAULT 'Yes' COMMENT 'Whether patient wants SC to file claims on behalf of patient for out of network services',
  `uidOfValueSetBy` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `claimFormServiceFacilityDetails`
--

DROP TABLE IF EXISTS `claimFormServiceFacilityDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimFormServiceFacilityDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceFacilityMasterId` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `npiId` varchar(255) DEFAULT NULL,
  `taxId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimFormServiceFacilityMaster`
--

DROP TABLE IF EXISTS `claimFormServiceFacilityMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimFormServiceFacilityMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimMaster`
--

DROP TABLE IF EXISTS `claimMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `eligableClaimID` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` int(11) unsigned NOT NULL,
  `curlRequestParameters` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimsReturnValue`
--

DROP TABLE IF EXISTS `claimsReturnValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimsReturnValue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `claimID` int(11) unsigned NOT NULL,
  `returnJSON` text NOT NULL,
  `jsonReceivedAt` datetime NOT NULL,
  `jsonReceivedAtTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coSign`
--

DROP TABLE IF EXISTS `coSign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coSign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(10) unsigned NOT NULL,
  `requestedByUID` int(11) NOT NULL,
  `requestedOnDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `requestedOnTimeZone` varchar(255) DEFAULT NULL,
  `toBeCoSignedByUID` int(11) NOT NULL,
  `coSignedOnDateTime` timestamp NULL DEFAULT NULL,
  `coSignedOnTimeZone` varchar(255) DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `commentAddedByCoSigner` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19175 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communicationLetter`
--

DROP TABLE IF EXISTS `communicationLetter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communicationLetter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `letterContent` text,
  `status` tinyint(4) unsigned DEFAULT '0',
  `uidOfPatientToWhichThisIsRelated` int(11) unsigned DEFAULT '0',
  `uidOfCreatedBy` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uidOfCreatedBy` (`uidOfCreatedBy`),
  KEY `uidOfPatientToWhichThisIsRelated` (`uidOfPatientToWhichThisIsRelated`),
  KEY `status` (`status`),
  CONSTRAINT `communicationLetter_ibfk_1` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `communicationLetter_ibfk_2` FOREIGN KEY (`uidOfPatientToWhichThisIsRelated`) REFERENCES `users` (`id`),
  CONSTRAINT `communicationLetter_ibfk_3` FOREIGN KEY (`status`) REFERENCES `communicationLetterMasterStatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communicationLetterMasterStatus`
--

DROP TABLE IF EXISTS `communicationLetterMasterStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communicationLetterMasterStatus` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `statusName` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communicationLetterTemplate`
--

DROP TABLE IF EXISTS `communicationLetterTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communicationLetterTemplate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `templateName` varchar(128) DEFAULT NULL,
  `letterContent` text,
  `status` tinyint(4) unsigned DEFAULT '0',
  `uidOfCreatedBy` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uidOfCreatedBy` (`uidOfCreatedBy`),
  KEY `status` (`status`),
  CONSTRAINT `communicationLetterTemplate_ibfk_1` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `communicationLetterTemplate_ibfk_2` FOREIGN KEY (`status`) REFERENCES `communicationLetterMasterStatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communicationOther`
--

DROP TABLE IF EXISTS `communicationOther`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communicationOther` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `messageSummary` text,
  `status` tinyint(4) unsigned DEFAULT '0',
  `uidOfPatientToWhichThisIsRelated` int(11) unsigned DEFAULT '0',
  `uidOfCreatedBy` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uidOfCreatedBy` (`uidOfCreatedBy`),
  KEY `uidOfPatientToWhichThisIsRelated` (`uidOfPatientToWhichThisIsRelated`),
  KEY `status` (`status`),
  CONSTRAINT `communicationOther_ibfk_1` FOREIGN KEY (`uidOfPatientToWhichThisIsRelated`) REFERENCES `users` (`id`),
  CONSTRAINT `communicationOther_ibfk_2` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `communicationOther_ibfk_3` FOREIGN KEY (`status`) REFERENCES `communicationLetterMasterStatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companyMasters`
--

DROP TABLE IF EXISTS `companyMasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyMasters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `logo` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conflictRelationshipBetweenServiceStatementMaster`
--

DROP TABLE IF EXISTS `conflictRelationshipBetweenServiceStatementMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conflictRelationshipBetweenServiceStatementMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceStatementMasterId` int(11) NOT NULL,
  `conflictWithServiceStatementMasterId` int(11) DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactPhoneNumberMasterTypes`
--

DROP TABLE IF EXISTS `contactPhoneNumberMasterTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactPhoneNumberMasterTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactPhoneNumbers`
--

DROP TABLE IF EXISTS `contactPhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactPhoneNumbers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contactID` int(11) unsigned DEFAULT '0',
  `phoneNumberTypeID` tinyint(4) unsigned DEFAULT '0',
  `phoneNumber` varchar(128) NOT NULL DEFAULT '',
  `countryDialCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phoneNumberTypeID` (`phoneNumberTypeID`),
  KEY `contactID` (`contactID`),
  CONSTRAINT `contactPhoneNumbers_ibfk_1` FOREIGN KEY (`phoneNumberTypeID`) REFERENCES `contactPhoneNumberMasterTypes` (`id`),
  CONSTRAINT `contactPhoneNumbers_ibfk_2` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8822 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactStreetAddressMasterTypes`
--

DROP TABLE IF EXISTS `contactStreetAddressMasterTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactStreetAddressMasterTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactTypesMaster`
--

DROP TABLE IF EXISTS `contactTypesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactTypesMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueContactId` varchar(36) DEFAULT NULL,
  `uid` int(11) unsigned NOT NULL,
  `contactName` varchar(120) DEFAULT NULL,
  `contactTypeID` tinyint(4) unsigned NOT NULL,
  `savedOrSubmitted` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1: saved, 2: submitted',
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the contact is locked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `contactTypeID` (`contactTypeID`),
  CONSTRAINT `contacts_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `contacts_ibfk_3` FOREIGN KEY (`contactTypeID`) REFERENCES `contactTypesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9653 DEFAULT CHARSET=utf8 COMMENT='conatcts* tables are used to store addressbook of the user. For e.g. I can add Rob Levitsky as a emergency contact. His name and contact type will be in contacts table (1 row). His phone numbers will be in contactPhoneNumbers, if he has 5 phone numbers than there will be 5 rows inserted into the contactPhoneNumbers table. His email addresses will be in contactEmailAddresses. His mailing address will be in contactStreetAddresses table.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_contacts` BEFORE INSERT ON `contacts` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND   TABLE_NAME   = 'contacts' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.publicUniqueContactId IS NULL) THEN
    	SET NEW.publicUniqueContactId = @P1;
    ELSEIF (NEW.publicUniqueContactId = '') THEN
    	SET NEW.publicUniqueContactId = @P1;  
	ELSE
    	SET NEW.publicUniqueContactId = NEW.publicUniqueContactId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contactsEmailAddressMasterTypes`
--

DROP TABLE IF EXISTS `contactsEmailAddressMasterTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactsEmailAddressMasterTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactsEmailAddresses`
--

DROP TABLE IF EXISTS `contactsEmailAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactsEmailAddresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contactID` int(11) unsigned DEFAULT '0',
  `emailAddressTypeID` tinyint(4) unsigned DEFAULT '0',
  `emailAddress` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `contactID` (`contactID`),
  KEY `emailAddressTypeID` (`emailAddressTypeID`),
  CONSTRAINT `contactsEmailAddresses_ibfk_1` FOREIGN KEY (`emailAddressTypeID`) REFERENCES `contactsEmailAddressMasterTypes` (`id`),
  CONSTRAINT `contactsEmailAddresses_ibfk_2` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4887 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contactsStreetAddresses`
--

DROP TABLE IF EXISTS `contactsStreetAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactsStreetAddresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contactID` int(11) unsigned DEFAULT '0',
  `addressLine1` varchar(128) DEFAULT NULL,
  `addressLine2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `zipCode` varchar(128) DEFAULT NULL,
  `streetAddressTypeID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contactID` (`contactID`),
  KEY `streetAddressTypeID` (`streetAddressTypeID`),
  CONSTRAINT `contactsStreetAddresses_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`id`),
  CONSTRAINT `contactsStreetAddresses_ibfk_2` FOREIGN KEY (`streetAddressTypeID`) REFERENCES `contactStreetAddressMasterTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4874 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `controlRefreshingBySocketForCustomReports`
--

DROP TABLE IF EXISTS `controlRefreshingBySocketForCustomReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlRefreshingBySocketForCustomReports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `customReportID` int(11) DEFAULT NULL,
  `reportType` enum('payments','event','user') NOT NULL,
  `reportStatus` varchar(100) DEFAULT NULL,
  `refreshBySocket` enum('on','off') DEFAULT NULL,
  `actionDateTime` datetime DEFAULT NULL,
  `actionTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `controlRefreshingBySocketForSummaryReports`
--

DROP TABLE IF EXISTS `controlRefreshingBySocketForSummaryReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlRefreshingBySocketForSummaryReports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `stateId` int(11) DEFAULT NULL,
  `reportType` enum('payments','event','user') NOT NULL,
  `reportStatus` varchar(100) DEFAULT NULL,
  `refreshBySocket` enum('on','off') DEFAULT NULL,
  `actionDateTime` datetime DEFAULT NULL,
  `actionTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coverageInsuranceAmountDetails`
--

DROP TABLE IF EXISTS `coverageInsuranceAmountDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coverageInsuranceAmountDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coverageIncMasterID` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amountEnteredByID` int(11) NOT NULL,
  `amountEnteredOnDate` datetime DEFAULT NULL,
  `amountEnteredOnTimeZone` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `lastCheckedOn` datetime DEFAULT NULL,
  `lastCheckedOnTimeZoneOffset` varchar(255) DEFAULT NULL,
  `lastCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `lastCheckedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coverageIncMasterID` (`coverageIncMasterID`),
  CONSTRAINT `coverageInsuranceAmountDetails_ibfk_1` FOREIGN KEY (`coverageIncMasterID`) REFERENCES `coverageInsuranceDisplayMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32435 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coverageInsuranceDisplayMaster`
--

DROP TABLE IF EXISTS `coverageInsuranceDisplayMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coverageInsuranceDisplayMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `displayOrder` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodePaymentComments`
--

DROP TABLE IF EXISTS `cptCodePaymentComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodePaymentComments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cptCodePaymentID` int(11) unsigned DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `createdByID` (`uidOfCreatedBy`),
  KEY `cptCodePaymentID` (`cptCodePaymentID`),
  CONSTRAINT `cptCodePaymentComments_ibfk_1` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `cptCodePaymentComments_ibfk_2` FOREIGN KEY (`cptCodePaymentID`) REFERENCES `cptCodesPayment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodeRateChangeActivityLog`
--

DROP TABLE IF EXISTS `cptCodeRateChangeActivityLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodeRateChangeActivityLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `cptCodeId` int(11) DEFAULT NULL,
  `cptCodeName` int(11) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `oldValue` decimal(10,2) DEFAULT NULL,
  `newValue` decimal(10,2) DEFAULT NULL,
  `createdByName` varchar(255) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesCurrentRatesAsPerContractMaster`
--

DROP TABLE IF EXISTS `cptCodesCurrentRatesAsPerContractMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesCurrentRatesAsPerContractMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `insuranceCompanyUID` int(11) unsigned DEFAULT NULL,
  `cptCodeID` int(11) unsigned NOT NULL,
  `agreedUponFeesForThisService` decimal(10,2) NOT NULL,
  `avgOfLast10Appts` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `insuranceCompanyUID` (`insuranceCompanyUID`),
  KEY `cptCodeID` (`cptCodeID`),
  CONSTRAINT `cptCodesCurrentRatesAsPerContractMaster_ibfk_1` FOREIGN KEY (`cptCodeID`) REFERENCES `cptCodesMaster` (`id`),
  CONSTRAINT `cptCodesCurrentRatesAsPerContractMaster_ibfk_2` FOREIGN KEY (`insuranceCompanyUID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1723 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesForAnAppointment`
--

DROP TABLE IF EXISTS `cptCodesForAnAppointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesForAnAppointment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned DEFAULT NULL,
  `cptCodeID` int(11) unsigned DEFAULT NULL,
  `cptCodeAmountExpectedAsPerContractOnCodingDate` decimal(10,2) NOT NULL,
  `isThisEntityLockedAndHenceNonEditable` enum('Yes','No') NOT NULL,
  `isThisCodeAllowedFromSCBrainCoding` enum('yes','no') NOT NULL DEFAULT 'yes',
  `noteForDisallowingInSCBrain` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `updated_by` int(11) unsigned DEFAULT NULL,
  `createdFrom` varchar(11) DEFAULT NULL,
  `isCachedForPaymentsReport` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not cached, 1 = cached',
  `timeZoneForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timeZoneForUpdatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cptCodeID` (`cptCodeID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `cptCodesForAnAppointment_ibfk_1` FOREIGN KEY (`cptCodeID`) REFERENCES `cptCodesMaster` (`id`),
  CONSTRAINT `cptCodesForAnAppointment_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=115019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesMaster`
--

DROP TABLE IF EXISTS `cptCodesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isThisEntityLockedAndHenceNonEditable` enum('Yes','No') NOT NULL DEFAULT 'No',
  `allowUserToLockFromCodingPanel` enum('Yes','No') NOT NULL,
  `allowCustomCodesForCoding` varchar(11) NOT NULL DEFAULT 'No',
  `createdBy` int(11) unsigned NOT NULL,
  `createdAtTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesPayment`
--

DROP TABLE IF EXISTS `cptCodesPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesPayment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cptCodeForAppointmentID` int(11) unsigned NOT NULL,
  `paymentStatusID` tinyint(4) unsigned DEFAULT NULL,
  `totalPaymentClaimedIncludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentClaimedForSCAcExcludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountInSCAccount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `badDebtAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `badDebtEntryDoneBy` int(11) DEFAULT NULL,
  `badDebtEntryDoneOn` datetime DEFAULT NULL,
  `badDebtEntryDoneOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `entityResponsibleToMakeThisPayment` tinyint(4) unsigned DEFAULT NULL,
  `instrumentInformationForThisPayment` varchar(255) DEFAULT NULL,
  `statusOfClaimFiledOnBehalfOfPatient` enum('Step 1: Claim to be submitted by SC','Step 2: Claim submitted by SC and now under process by Insurance company','Step 3A: Money received by the patient','Step 3B: Insurance company refuses to pay money to patient') DEFAULT NULL,
  `amountReceivedByThePatient` decimal(10,2) DEFAULT NULL,
  `insuranceUIDOnCreationDateIfClaimFilingIsRequired` int(11) unsigned DEFAULT NULL,
  `notes` text,
  `notesForBilling` text,
  `paymentMethodID` tinyint(4) unsigned DEFAULT NULL,
  `accountThisPaymentIsBeingMadeToID` int(11) DEFAULT '1',
  `transactionFee` decimal(10,2) DEFAULT NULL,
  `transactionIdProvidedByPaymentGateway` varchar(50) DEFAULT NULL,
  `isThisEntityLockedAndHenceNonEditable` enum('Yes','No') NOT NULL DEFAULT 'No',
  `financialInstitutionID` int(11) unsigned DEFAULT NULL,
  `dateOfTransactionInSCAccount` date DEFAULT NULL,
  `bankPostDateOfOfficeAlly` date DEFAULT NULL,
  `quickbookStatus` enum('Step 1: Data not entered','Step 2: Data entered but not matching with financial institution','Step 3: Data entered and matching with financial institution') DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `timeZoneForCreatedOn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timeZoneForUpdatedOn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `chargedCCNumber` varchar(30) DEFAULT NULL,
  `claimLastSubmittedOn` datetime DEFAULT NULL,
  `claimLastSubmittedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `claimLastSubmittedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cptCodeForAppointmentID` (`cptCodeForAppointmentID`),
  KEY `paymentStatusID` (`paymentStatusID`),
  KEY `entityResponsibleToMakeThisPayment` (`entityResponsibleToMakeThisPayment`),
  KEY `insuraneUIDOnCreationDateIfClaimFilingIsReqd` (`insuranceUIDOnCreationDateIfClaimFilingIsRequired`),
  KEY `paymentMethodID` (`paymentMethodID`),
  KEY `accountThisPaymentIsBeingMadeToID` (`id`),
  KEY `accountThisPaymentIsBeingMadeT_2` (`accountThisPaymentIsBeingMadeToID`),
  CONSTRAINT `cptCodesPayment_ibfk_1` FOREIGN KEY (`cptCodeForAppointmentID`) REFERENCES `cptCodesForAnAppointment` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_2` FOREIGN KEY (`paymentStatusID`) REFERENCES `cptCodesPaymentStatusMaster` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_3` FOREIGN KEY (`entityResponsibleToMakeThisPayment`) REFERENCES `cptPaymentEntityResponsibleToSCMaster` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_4` FOREIGN KEY (`insuranceUIDOnCreationDateIfClaimFilingIsRequired`) REFERENCES `users` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_5` FOREIGN KEY (`paymentMethodID`) REFERENCES `cptCodesPaymentMethodMaster` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_6` FOREIGN KEY (`accountThisPaymentIsBeingMadeToID`) REFERENCES `paymentAccountBeingMadeMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesPaymentAttachments`
--

DROP TABLE IF EXISTS `cptCodesPaymentAttachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesPaymentAttachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymentID` int(11) unsigned NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileContent` longblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentID` (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=104705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesPaymentMethodMaster`
--

DROP TABLE IF EXISTS `cptCodesPaymentMethodMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesPaymentMethodMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `statusAndMethod` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptCodesPaymentStatusMaster`
--

DROP TABLE IF EXISTS `cptCodesPaymentStatusMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesPaymentStatusMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `statusAndMethod` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptPaymentEntityResponsibleToSCCurrentInformation`
--

DROP TABLE IF EXISTS `cptPaymentEntityResponsibleToSCCurrentInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptPaymentEntityResponsibleToSCCurrentInformation` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `idOfEntityResponsibleForPaymentToSC` tinyint(3) unsigned NOT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idOfEntityResponsibleForPaymentToSC` (`idOfEntityResponsibleForPaymentToSC`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `cptPaymentEntityResponsibleToSCCurrentInformation_ibfk_2` FOREIGN KEY (`idOfEntityResponsibleForPaymentToSC`) REFERENCES `cptPaymentEntityResponsibleToSCMaster` (`id`),
  CONSTRAINT `cptPaymentEntityResponsibleToSCCurrentInformation_ibfk_3` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptPaymentEntityResponsibleToSCMaster`
--

DROP TABLE IF EXISTS `cptPaymentEntityResponsibleToSCMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptPaymentEntityResponsibleToSCMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptPaymentInstrumentAttachmentCurrentInformation`
--

DROP TABLE IF EXISTS `cptPaymentInstrumentAttachmentCurrentInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptPaymentInstrumentAttachmentCurrentInformation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payerID` int(11) unsigned NOT NULL,
  `attachedFileName` varchar(255) NOT NULL,
  `binaryContentOfPayerFile` longblob,
  PRIMARY KEY (`id`),
  KEY `payerID` (`payerID`),
  CONSTRAINT `cptPaymentInstrumentAttachmentCurrentInformation_ibfk_1` FOREIGN KEY (`payerID`) REFERENCES `cptPaymentInstrumentCurrentInformation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cptPaymentInstrumentCurrentInformation`
--

DROP TABLE IF EXISTS `cptPaymentInstrumentCurrentInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptPaymentInstrumentCurrentInformation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paymentInformationUniqueId` varchar(36) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `type` enum('Bank account','CC','Insurance','Other') DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `accountHolderName` text,
  `relationWithPatient` text,
  `isThisAccountOwnedByPatient` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `forTypeBankOrCCOrInsuranceAccountNumber` varchar(30) DEFAULT NULL,
  `forTypeBankRoutingNumber` varchar(30) DEFAULT NULL,
  `forTypeCCSecurityCode` varchar(5) DEFAULT NULL,
  `forTypeCCExpirationMonth` int(11) DEFAULT NULL,
  `forTypeCCExpirationYear` int(11) DEFAULT NULL,
  `forTypeInsuranceUIDOfCompany` int(11) unsigned DEFAULT NULL,
  `forTypeCCBillingZipCode` varchar(20) DEFAULT NULL,
  `forTypeCCIsCardValid` enum('yes','no') NOT NULL DEFAULT 'yes',
  `forTypeCCIsExpiryValid` enum('yes','no') DEFAULT NULL,
  `forTypeCCIsCVVValid` enum('yes','no') DEFAULT NULL,
  `forTypeCCIsZipValid` enum('yes','no') DEFAULT NULL,
  `note` text,
  `isPrimary` tinyint(1) unsigned NOT NULL COMMENT '0: secondary, 1: primary',
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the cptPaymentInstrumentCurrentInformation is locked or not',
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdatedAt` varchar(255) DEFAULT NULL,
  `priority` smallint(4) DEFAULT NULL,
  `payerNote` text,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfCreatedBy` (`uidOfCreatedBy`),
  KEY `forTypeInsuranceIDOfCompany` (`forTypeInsuranceUIDOfCompany`),
  CONSTRAINT `cptPaymentInstrumentCurrentInformation_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `cptPaymentInstrumentCurrentInformation_ibfk_2` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35976 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_PIC` BEFORE INSERT ON `cptPaymentInstrumentCurrentInformation` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND TABLE_NAME = 'cptPaymentInstrumentCurrentInformation' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.paymentInformationUniqueId IS NULL) THEN
    	SET NEW.paymentInformationUniqueId = @P1;
    ELSEIF (NEW.paymentInformationUniqueId = '') THEN
    	SET NEW.paymentInformationUniqueId = @P1;  
	ELSE
    	SET NEW.paymentInformationUniqueId = NEW.paymentInformationUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cronCreatedCacheForDetectDuplicateUsers`
--

DROP TABLE IF EXISTS `cronCreatedCacheForDetectDuplicateUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedCacheForDetectDuplicateUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '1 = Using Phone no',
  `phoneNo` varchar(20) DEFAULT NULL,
  `userDetails` longtext,
  `lastUpdatedOn` datetime NOT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedCacheForSlotsAvailableForNext6Months`
--

DROP TABLE IF EXISTS `cronCreatedCacheForSlotsAvailableForNext6Months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedCacheForSlotsAvailableForNext6Months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `visitType` enum('first','repeat') DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `nonSharedRoomId` int(10) DEFAULT NULL,
  `sharedRoomId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91507509 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedFollowUpAppointmentsForNext6Months`
--

DROP TABLE IF EXISTS `cronCreatedFollowUpAppointmentsForNext6Months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedFollowUpAppointmentsForNext6Months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64595877 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByClaimsReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByClaimsReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByClaimsReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scClaimID` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(200) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStartDateTime` datetime DEFAULT NULL,
  `claimCurrentStageID` int(11) unsigned DEFAULT NULL,
  `claimCurrentStageName` varchar(300) DEFAULT NULL,
  `claimFilledOnDateTime` datetime DEFAULT NULL,
  `claimFilledOnTimeZone` varchar(255) DEFAULT NULL,
  `claimFilledByUID` int(11) DEFAULT NULL,
  `claimFilledByFullName` varchar(200) DEFAULT NULL,
  `claimAmount` decimal(10,2) DEFAULT NULL,
  `eligibleClaimID` varchar(50) DEFAULT NULL,
  `insuranceCompanyID` int(11) DEFAULT NULL,
  `insuranceCompanyFullName` varchar(200) DEFAULT NULL,
  `reportDataLastUpdatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByClinicCapacityUtilizationReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByClinicCapacityUtilizationReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByClinicCapacityUtilizationReport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locationId` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `currentMonthTotalAFA` int(11) DEFAULT NULL,
  `currentMonthTotalAppointmentMinutes` int(11) DEFAULT NULL,
  `lastMonthTotalAFA` int(11) DEFAULT NULL,
  `lastMonthTotalAppointmentMinutes` int(11) DEFAULT NULL,
  `last3MonthTotalAFA` int(11) DEFAULT NULL,
  `last3MonthTotalAppointmentMinutes` int(11) DEFAULT NULL,
  `last6MonthTotalAFA` int(11) DEFAULT NULL,
  `last6MonthTotalAppointmentMinutes` int(11) DEFAULT NULL,
  `isCached` int(1) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByEventsReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByEventsReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByEventsReport` (
  `companyID` int(11) unsigned DEFAULT NULL,
  `eventID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patientUID` int(11) unsigned DEFAULT NULL,
  `patientFullName` varchar(255) DEFAULT NULL,
  `patientDOB` date DEFAULT NULL,
  `scEmployeeUID` int(11) unsigned DEFAULT NULL,
  `scEmployeeFullName` varchar(255) DEFAULT NULL,
  `eventTypeName` varchar(255) NOT NULL,
  `eventSummary` varchar(128) DEFAULT NULL,
  `eventStatusName` varchar(255) DEFAULT NULL,
  `eventStatusUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `eventStatusUpdatedByFullName` varchar(255) DEFAULT NULL,
  `eventLockStatus` enum('Yes','No') NOT NULL COMMENT 'Yes = Locked, no = Not lockeN',
  `eventCreatedOn` datetime DEFAULT NULL,
  `eventCreatedByUID` int(11) unsigned DEFAULT NULL,
  `eventCreatedByFullName` varchar(255) NOT NULL,
  `eventUpdatedOn` datetime DEFAULT NULL,
  `eventUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `eventUpdatedByFullName` varchar(255) DEFAULT NULL,
  `eventStartDateTime` datetime DEFAULT NULL,
  `eventDurationInMinutes` int(11) DEFAULT NULL,
  `eventActualTimeSpentInMinutes` int(11) DEFAULT NULL,
  `eventNoOfCptCodeAssigned` smallint(2) NOT NULL DEFAULT '0',
  `eventNoOfZeroAmountExpectedCptCodeAssigned` smallint(2) NOT NULL DEFAULT '0',
  `eventEndDateTime` datetime DEFAULT NULL,
  `codingTotalAmountExpected` decimal(10,2) DEFAULT NULL,
  `codingTotalAmountReceived` decimal(10,2) DEFAULT NULL,
  `paymentTotalClaimed` decimal(10,2) DEFAULT NULL,
  `paymentTotalReceived` decimal(10,2) DEFAULT NULL,
  `paymentTotalRemaining` decimal(10,2) DEFAULT NULL COMMENT 'paymentTotalClaimed - paymentTotalReceived',
  `taskAssignedByUID` int(11) unsigned DEFAULT NULL,
  `taskAssignedByFullName` varchar(255) DEFAULT NULL,
  `taskRoleAssignedToUID` int(11) unsigned DEFAULT NULL,
  `taskRoleAssignedToFullName` varchar(255) DEFAULT NULL,
  `allNotesAreLocked` enum('Yes','No','Not applicable') DEFAULT NULL,
  `typeOfNote1` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote1` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote1` varchar(255) DEFAULT NULL,
  `typeOfNote2` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote2` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote2` varchar(255) DEFAULT NULL,
  `typeOfNote3` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote3` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote3` varchar(255) DEFAULT NULL,
  `typeOfNote4` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote4` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote4` varchar(255) DEFAULT NULL,
  `typeOfNote5` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote5` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote5` varchar(255) DEFAULT NULL,
  `typeOfNote6` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote6` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote6` varchar(255) DEFAULT NULL,
  `typeOfNote7` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote7` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote7` varchar(255) DEFAULT NULL,
  `typeOfNote8` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote8` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote8` varchar(255) DEFAULT NULL,
  `typeOfNote9` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote9` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote9` varchar(255) DEFAULT NULL,
  `typeOfNote10` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote10` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote10` varchar(255) DEFAULT NULL,
  `notesLockedOn` datetime DEFAULT NULL,
  `notesLockedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `notesLockedByUID` int(11) DEFAULT NULL,
  `notesLockedByFullName` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `toBeCoSignedByUID` int(11) unsigned DEFAULT NULL,
  `toBeCoSignedByFullName` varchar(255) DEFAULT NULL,
  `coSignedOnDateTime` datetime DEFAULT NULL,
  `assetID` int(11) DEFAULT NULL,
  `assetName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=445912 DEFAULT CHARSET=utf8 COMMENT='This is a denomalized table. Advnatages 1. easier to program 2. fast page load for end user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByEventsReport1`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByEventsReport1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByEventsReport1` (
  `companyID` int(11) unsigned DEFAULT NULL,
  `eventID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patientUID` int(11) unsigned DEFAULT NULL,
  `patientFullName` varchar(255) DEFAULT NULL,
  `patientDOB` date DEFAULT NULL,
  `scEmployeeUID` int(11) unsigned DEFAULT NULL,
  `scEmployeeFullName` varchar(255) DEFAULT NULL,
  `eventTypeName` varchar(255) NOT NULL,
  `eventSummary` varchar(128) DEFAULT NULL,
  `eventStatusName` varchar(255) DEFAULT NULL,
  `eventStatusUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `eventStatusUpdatedByFullName` varchar(255) DEFAULT NULL,
  `eventLockStatus` enum('Yes','No') NOT NULL COMMENT 'Yes = Locked, no = Not lockeN',
  `eventCreatedOn` datetime DEFAULT NULL,
  `eventCreatedByUID` int(11) unsigned DEFAULT NULL,
  `eventCreatedByFullName` varchar(255) NOT NULL,
  `eventUpdatedOn` datetime DEFAULT NULL,
  `eventUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `eventUpdatedByFullName` varchar(255) DEFAULT NULL,
  `eventStartDateTime` datetime DEFAULT NULL,
  `eventDurationInMinutes` int(11) DEFAULT NULL,
  `eventActualTimeSpentInMinutes` int(11) DEFAULT NULL,
  `eventNoOfCptCodeAssigned` smallint(2) NOT NULL DEFAULT '0',
  `eventNoOfZeroAmountExpectedCptCodeAssigned` smallint(2) NOT NULL DEFAULT '0',
  `eventEndDateTime` datetime DEFAULT NULL,
  `codingTotalAmountExpected` decimal(10,2) DEFAULT NULL,
  `codingTotalAmountReceived` decimal(10,2) DEFAULT NULL,
  `paymentTotalClaimed` decimal(10,2) DEFAULT NULL,
  `paymentTotalReceived` decimal(10,2) DEFAULT NULL,
  `paymentTotalRemaining` decimal(10,2) DEFAULT NULL COMMENT 'paymentTotalClaimed - paymentTotalReceived',
  `taskAssignedByUID` int(11) unsigned DEFAULT NULL,
  `taskAssignedByFullName` varchar(255) DEFAULT NULL,
  `taskRoleAssignedToUID` int(11) unsigned DEFAULT NULL,
  `taskRoleAssignedToFullName` varchar(255) DEFAULT NULL,
  `allNotesAreLocked` enum('Yes','No','Not applicable') DEFAULT NULL,
  `typeOfNote1` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote1` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote1` varchar(255) DEFAULT NULL,
  `typeOfNote2` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote2` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote2` varchar(255) DEFAULT NULL,
  `typeOfNote3` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote3` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote3` varchar(255) DEFAULT NULL,
  `typeOfNote4` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote4` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote4` varchar(255) DEFAULT NULL,
  `typeOfNote5` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote5` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote5` varchar(255) DEFAULT NULL,
  `typeOfNote6` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote6` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote6` varchar(255) DEFAULT NULL,
  `typeOfNote7` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote7` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote7` varchar(255) DEFAULT NULL,
  `typeOfNote8` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote8` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote8` varchar(255) DEFAULT NULL,
  `typeOfNote9` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote9` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote9` varchar(255) DEFAULT NULL,
  `typeOfNote10` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote10` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote10` varchar(255) DEFAULT NULL,
  `notesLockedOn` datetime DEFAULT NULL,
  `notesLockedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `notesLockedByUID` int(11) DEFAULT NULL,
  `notesLockedByFullName` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `toBeCoSignedByUID` int(11) unsigned DEFAULT NULL,
  `toBeCoSignedByFullName` varchar(255) DEFAULT NULL,
  `coSignedOnDateTime` datetime DEFAULT NULL,
  `assetID` int(11) DEFAULT NULL,
  `assetName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=445908 DEFAULT CHARSET=utf8 COMMENT='This is a denomalized table. Advnatages 1. easier to program 2. fast page load for end user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByPatientHoursReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByPatientHoursReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByPatientHoursReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `providerId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL,
  `startDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalAFA` varchar(255) DEFAULT '0',
  `totalPatientHours` varchar(255) DEFAULT '0',
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_providerid` (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=150577 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByPatientHoursReportV4`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByPatientHoursReportV4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByPatientHoursReportV4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `providerID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `date` date NOT NULL,
  `totalAFA` int(11) NOT NULL DEFAULT '0',
  `totalAFUA` int(11) NOT NULL DEFAULT '0',
  `totalPatientHours` int(11) NOT NULL DEFAULT '0',
  `totalRVU` decimal(10,2) NOT NULL DEFAULT '0.00',
  `totalAppointmentCount` int(11) NOT NULL DEFAULT '0',
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_providerid` (`providerID`)
) ENGINE=InnoDB AUTO_INCREMENT=17201102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByPatientInsuranceInfoUpdateReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByPatientInsuranceInfoUpdateReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByPatientInsuranceInfoUpdateReport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `patientName` varchar(255) DEFAULT NULL,
  `patientDOB` date DEFAULT NULL,
  `latestAppointmentID` int(11) DEFAULT NULL,
  `latestAppointmentDate` datetime DEFAULT NULL,
  `numberOfEventCodedButIncomingPaymentEntryNotDone` int(11) NOT NULL DEFAULT '0',
  `detailsOfEventCodedButIncomingPaymentEntryNotDone` longtext,
  `numberOfEventCodedButNoIncomingPaymentEntryFoundForInsuranceCom` int(11) NOT NULL DEFAULT '0',
  `detailsOfEventCodedButNoIncomingPaymentEntryFoundForInsuranceCom` longtext,
  `numberOfEventUnsuccessfulByRobots` int(11) NOT NULL DEFAULT '0',
  `detailsOfEventUnsuccessfulByRobots` longtext,
  `copayUpdatedOn` datetime DEFAULT NULL,
  `copayUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `copayUpdatedByUID` int(11) DEFAULT NULL,
  `copayUpdatedByName` varchar(255) DEFAULT NULL,
  `copayCheckedByUID` int(11) DEFAULT NULL,
  `copayCheckedByName` varchar(255) DEFAULT NULL,
  `copayCheckedOn` datetime DEFAULT NULL,
  `copayCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleUpdatedOn` datetime DEFAULT NULL,
  `annualDeductibleUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleUpdatedByUID` int(11) DEFAULT NULL,
  `annualDeductibleUpdatedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleCheckedByUID` int(11) DEFAULT NULL,
  `annualDeductibleCheckedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleCheckedOn` datetime DEFAULT NULL,
  `annualDeductibleCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingUpdatedOn` datetime DEFAULT NULL,
  `annualDeductibleRemainingUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingUpdatedByUID` int(11) DEFAULT NULL,
  `annualDeductibleRemainingUpdatedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingCheckedByUID` int(11) DEFAULT NULL,
  `annualDeductibleRemainingCheckedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingCheckedOn` datetime DEFAULT NULL,
  `annualDeductibleRemainingCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `coinsuranceUpdatedOn` datetime DEFAULT NULL,
  `coinsuranceUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `coinsuranceUpdatedByUID` int(11) DEFAULT NULL,
  `coinsuranceUpdatedByName` varchar(255) DEFAULT NULL,
  `coinsuranceCheckedByUID` int(11) DEFAULT NULL,
  `coinsuranceCheckedByName` varchar(255) DEFAULT NULL,
  `coinsuranceCheckedOn` datetime DEFAULT NULL,
  `coinsuranceCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByPaymentsReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByPaymentsReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByPaymentsReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `uidOfProvider` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `dobOfPatient` date DEFAULT NULL,
  `cptCodeID` int(11) unsigned DEFAULT NULL,
  `cptCodeName` varchar(128) DEFAULT NULL,
  `paymentID` int(11) unsigned DEFAULT NULL,
  `fullNameOfProvider` varchar(255) DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `eventTypeName` varchar(255) NOT NULL,
  `eventStatusName` varchar(255) DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedBy` varchar(255) NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `durationInMinute` int(11) DEFAULT NULL,
  `companyID` int(11) unsigned DEFAULT NULL,
  `billingStatus` varchar(255) DEFAULT NULL,
  `cptAmountExpected` decimal(10,2) DEFAULT NULL,
  `cptAmountReceived` decimal(10,2) DEFAULT NULL,
  `cptAmountBadDebt` decimal(10,2) DEFAULT NULL,
  `cptAmountRemaining` decimal(10,2) DEFAULT NULL,
  `paymentAmountClaimedIncludingFinanceCharges` decimal(10,2) DEFAULT NULL,
  `paymentAmountClaimedForSCExcludingFinanceCharges` decimal(10,2) DEFAULT NULL,
  `paymentAmountTransactionFee` decimal(10,2) DEFAULT NULL,
  `paymentAmountReceived` decimal(10,2) DEFAULT NULL,
  `paymentAmountBadDebt` decimal(10,2) DEFAULT NULL,
  `paymentBadDebtUpdatedOn` datetime DEFAULT NULL,
  `paymentBadDebtUpdatedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `paymentBadDebtUpdatedByUID` int(11) DEFAULT NULL,
  `paymentBadDebtUpdatedByName` varchar(255) DEFAULT NULL,
  `paymentAmountRemaining` decimal(10,2) DEFAULT NULL,
  `paymentMerchantOneTransactionID` varchar(50) DEFAULT NULL,
  `paymentAccountThisPaymentIsBeingMadeFrom` varchar(255) DEFAULT NULL,
  `paymentLast4DigitChargedCreditCardNo` varchar(4) DEFAULT NULL,
  `paymentStatus` varchar(255) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `entityResponsibleToMakeThisPayment` varchar(128) DEFAULT NULL,
  `nameOfInsuranceCompanyPaymentRecdFrom` varchar(255) DEFAULT NULL,
  `uidOfInsuranceCompanyPaymentRecdFrom` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isEventLocked` enum('No','Yes') DEFAULT NULL,
  `isCptLocked` enum('No','Yes') DEFAULT NULL,
  `isPaymentLocked` enum('No','Yes') DEFAULT NULL,
  `cptCreatedAt` datetime DEFAULT NULL,
  `cptCreatedByUID` int(11) unsigned DEFAULT NULL,
  `cptCreatedByFullName` varchar(255) DEFAULT NULL,
  `cptUpdatedAt` datetime DEFAULT NULL,
  `cptUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `cptUpdatedByFullName` varchar(255) DEFAULT NULL,
  `paymentCreatedAt` datetime DEFAULT NULL,
  `paymentCreatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentCreatedByFullName` varchar(255) DEFAULT NULL,
  `paymentUpdatedAt` datetime DEFAULT NULL,
  `paymentUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentUpdatedByFullName` varchar(255) DEFAULT NULL,
  `financialInstitutionID` int(11) unsigned DEFAULT NULL,
  `financialInstitutionName` varchar(255) DEFAULT NULL,
  `quickbookStatus` varchar(255) DEFAULT NULL,
  `dateTheMoneyComeIntoSCAccount` date DEFAULT NULL,
  `bankPostDateOfOfficeAlly` date DEFAULT NULL,
  `paymentNotes` varchar(255) DEFAULT NULL,
  `paymentStatusOfClaimFiledOnBehalfOfPatient` varchar(500) DEFAULT NULL,
  `claimLastSubmittedOn` datetime DEFAULT NULL,
  `claimLastSubmittedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `claimLastSubmittedByUID` int(11) DEFAULT NULL,
  `claimLastSubmittedByFullName` varchar(255) DEFAULT NULL,
  `assetID` int(11) DEFAULT NULL,
  `assetName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1761272 DEFAULT CHARSET=utf8 COMMENT='This is a denomalized table. Advnatages 1. easier to program 2. fast page load for end user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedByUserReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByUserReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByUserReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `userFullName` varchar(255) NOT NULL,
  `userRoleTypeID` int(11) unsigned DEFAULT NULL,
  `userRoleTypeName` varchar(255) DEFAULT NULL,
  `userDOB` date DEFAULT NULL,
  `numberOfLoggedIn` int(11) DEFAULT NULL,
  `userLastLoggedIn` datetime DEFAULT NULL,
  `userLastLoggedInTimeZone` varchar(255) DEFAULT NULL,
  `primaryCareTeamID` int(11) unsigned DEFAULT NULL,
  `primaryCareTeamName` varchar(255) DEFAULT NULL,
  `userCreatedOn` datetime DEFAULT NULL,
  `userCreatedOnTimeZone` varchar(255) DEFAULT NULL,
  `userCreatedByUID` int(11) unsigned DEFAULT NULL,
  `userCreatedByFullName` varchar(255) DEFAULT NULL,
  `userCity` varchar(200) DEFAULT NULL,
  `userState` varchar(200) DEFAULT NULL,
  `userInsuranceCompany1UID` int(11) DEFAULT NULL,
  `userInsuranceCompany1FullName` varchar(200) DEFAULT NULL,
  `userInsuranceCompany2UID` int(11) DEFAULT NULL,
  `userInsuranceCompany2FullName` varchar(200) DEFAULT NULL,
  `firstEventID` int(10) unsigned DEFAULT NULL,
  `firstAppointmentDate` datetime DEFAULT NULL,
  `firstAppointmentCreatedOn` datetime DEFAULT NULL,
  `firstAppointmentCreatedByUID` int(11) unsigned DEFAULT NULL,
  `firstAppointmentCreatedByFullName` varchar(255) DEFAULT NULL,
  `lastAppointmentID` int(11) unsigned DEFAULT NULL,
  `lastAppointmentDate` datetime DEFAULT NULL,
  `nextScheduledAppointmentID` int(11) unsigned DEFAULT NULL,
  `nextScheduledAppointmentDate` datetime DEFAULT NULL,
  `noOfTotalAppointments` int(11) DEFAULT NULL,
  `noOfCancelledAppointments` int(11) DEFAULT NULL,
  `noOfNoShowAppointments` int(11) DEFAULT NULL,
  `noOfUnlockedAppointments` int(11) DEFAULT NULL,
  `referredByUID` int(11) unsigned DEFAULT NULL,
  `referredByFullName` varchar(255) DEFAULT NULL,
  `noOfTasks` int(11) DEFAULT NULL,
  `noOfPhoneEncounter` int(11) DEFAULT NULL,
  `noOfPrescriptionRefill` int(11) DEFAULT NULL,
  `noOfOfficialLetters` int(11) DEFAULT NULL,
  `noOfRedFlag` int(11) DEFAULT NULL,
  `noOfSocialHistory` int(11) DEFAULT NULL,
  `noOfContacts` int(11) DEFAULT NULL,
  `noOfMedications` int(11) DEFAULT NULL,
  `noOfGoals` int(11) DEFAULT NULL,
  `noOfEmergencyContacts` int(11) DEFAULT NULL,
  `noOfSymptoms` int(11) DEFAULT NULL,
  `noOfMSE` int(11) DEFAULT NULL,
  `noOfROS` int(11) DEFAULT NULL,
  `companyID` int(11) DEFAULT NULL,
  `paymentDefaulter` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2785873 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronScriptsManagement`
--

DROP TABLE IF EXISTS `cronScriptsManagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronScriptsManagement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scriptCommandName` varchar(255) NOT NULL,
  `scriptDescription` varchar(255) NOT NULL,
  `scheduledFrequency` enum('other','everyMinute','everyFiveMinutes','everyTenMinutes','everyThirtyMinutes','hourly','daily','weekly','monthly','yearly') NOT NULL DEFAULT 'other',
  `scriptHealth` enum('Error free','Error') NOT NULL DEFAULT 'Error',
  `errorMessage` text,
  `lastRunDateTime` datetime DEFAULT NULL,
  `timeZoneForLastRun` varchar(255) DEFAULT NULL,
  `isItEnabled` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `cacheUpdatedTillActivity` int(11) DEFAULT NULL COMMENT 'This will contain the activity log id which was last updated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbStructureChangeVersions`
--

DROP TABLE IF EXISTS `dbStructureChangeVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbStructureChangeVersions` (
  `versionNumberOfDB` int(11) NOT NULL AUTO_INCREMENT,
  `doneBy` varchar(255) NOT NULL,
  `whyDone` text NOT NULL,
  `dateDoneOn` date NOT NULL,
  `sqlToUpgradeDB` text NOT NULL,
  PRIMARY KEY (`versionNumberOfDB`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceCellPhoneCallDuration`
--

DROP TABLE IF EXISTS `deviceCellPhoneCallDuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceCellPhoneCallDuration` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `type` char(1) DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  `duration` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=54226 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceCellPhoneInformation`
--

DROP TABLE IF EXISTS `deviceCellPhoneInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceCellPhoneInformation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `deviceID` bigint(20) NOT NULL DEFAULT '0',
  `primaryEmailIDOnTheDevice` varchar(255) DEFAULT NULL,
  `gmtOffset` int(11) DEFAULT '0',
  `countryCode` char(2) DEFAULT 'in',
  `deviceName` varchar(255) DEFAULT NULL,
  `otherEmailsConfiguredOnDevice` varchar(255) DEFAULT NULL,
  `sessionKey` varchar(35) DEFAULT NULL,
  `registeredOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLogin` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `deviceCellPhoneInformation_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deviceCellPhoneMovement`
--

DROP TABLE IF EXISTS `deviceCellPhoneMovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceCellPhoneMovement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `distance` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `deviceCellPhoneMovement_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `digitalSignUserPublicKeyDetail`
--

DROP TABLE IF EXISTS `digitalSignUserPublicKeyDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digitalSignUserPublicKeyDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `publicKey` blob NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discourseTagsToShowForTrainingCompletionComparativeReport`
--

DROP TABLE IF EXISTS `discourseTagsToShowForTrainingCompletionComparativeReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discourseTagsToShowForTrainingCompletionComparativeReport` (
  `userRoleID` int(11) NOT NULL,
  `tags` text NOT NULL,
  UNIQUE KEY `userRoleID` (`userRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctorsAdword`
--

DROP TABLE IF EXISTS `doctorsAdword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorsAdword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adwordCode` varchar(100) NOT NULL,
  `uidOfProvider` int(11) NOT NULL,
  `isLatest` int(11) NOT NULL,
  `createdByUID` int(11) unsigned DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) unsigned DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dokuwiki_group`
--

DROP TABLE IF EXISTS `dokuwiki_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokuwiki_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dokuwiki_member`
--

DROP TABLE IF EXISTS `dokuwiki_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokuwiki_member` (
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  UNIQUE KEY `IDX_unique_member` (`uid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dokuwiki_user`
--

DROP TABLE IF EXISTS `dokuwiki_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dokuwiki_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsmDecisionTree`
--

DROP TABLE IF EXISTS `dsmDecisionTree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsmDecisionTree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decision` text NOT NULL,
  `greenID` int(11) DEFAULT NULL,
  `redID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dsmPatient`
--

DROP TABLE IF EXISTS `dsmPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsmPatient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dsmMasterID` int(11) unsigned NOT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dsmMasterID` (`dsmMasterID`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfDoctor` (`uidOfDoctor`),
  CONSTRAINT `dsmPatient_ibfk_1` FOREIGN KEY (`dsmMasterID`) REFERENCES `DB_SC_Diagnosis`.`dsmMasterCodes` (`id`),
  CONSTRAINT `dsmPatient_ibfk_2` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `dsmPatient_ibfk_3` FOREIGN KEY (`uidOfDoctor`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleClaimComments`
--

DROP TABLE IF EXISTS `eligibleClaimComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleClaimComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claimID` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleClaimStage`
--

DROP TABLE IF EXISTS `eligibleClaimStage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleClaimStage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleConfig`
--

DROP TABLE IF EXISTS `eligibleConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleConfig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(200) NOT NULL,
  `API_Type` enum('Live','SandBox') DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleForClaimsOfPatient`
--

DROP TABLE IF EXISTS `eligibleForClaimsOfPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleForClaimsOfPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `claimsDataInJSON` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) unsigned NOT NULL,
  `curlRequestSend` text NOT NULL,
  `stageID` int(11) NOT NULL,
  `claimReferenceID` varchar(200) DEFAULT NULL,
  `isUpdatedOnClaimsReportTable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not updated, 1 = Updated',
  PRIMARY KEY (`id`),
  KEY `stageID` (`stageID`),
  CONSTRAINT `eligibleForClaimsOfPatient_ibfk_1` FOREIGN KEY (`stageID`) REFERENCES `eligibleClaimStage` (`id`),
  CONSTRAINT `eligibleForClaimsOfPatient_ibfk_2` FOREIGN KEY (`stageID`) REFERENCES `eligibleClaimStage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligiblePatientInsuranceCoverage`
--

DROP TABLE IF EXISTS `eligiblePatientInsuranceCoverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligiblePatientInsuranceCoverage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patientUID` int(11) unsigned NOT NULL,
  `coverageDataInJSON` longtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) unsigned NOT NULL,
  `curlRequestSend` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20288 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligiblePayerDetail`
--

DROP TABLE IF EXISTS `eligiblePayerDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligiblePayerDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scInsuranceID` int(11) unsigned NOT NULL,
  `eligiblePayerIDForCoverage` varchar(100) NOT NULL COMMENT 'This ID use for coverage',
  `eligiblePayerIDForClaim` varchar(100) DEFAULT NULL COMMENT 'This ID use for claim',
  `updatedBy` int(11) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `addrLineA` varchar(100) DEFAULT NULL,
  `addrLineB` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligiblePayerId`
--

DROP TABLE IF EXISTS `eligiblePayerId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligiblePayerId` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scInsuranceID` int(11) unsigned NOT NULL,
  `eligiblePayerID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleRelationshipMaster`
--

DROP TABLE IF EXISTS `eligibleRelationshipMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleRelationshipMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleReturnDataForStageOfClaim`
--

DROP TABLE IF EXISTS `eligibleReturnDataForStageOfClaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleReturnDataForStageOfClaim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claimHistoryTableID` int(11) NOT NULL,
  `returnDataFromEligible` longtext,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `claimHistory` (`claimHistoryTableID`) USING BTREE,
  CONSTRAINT `linkToStageHistoryTable` FOREIGN KEY (`claimHistoryTableID`) REFERENCES `eligibleStageHistoryOfClaim` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eligibleStageHistoryOfClaim`
--

DROP TABLE IF EXISTS `eligibleStageHistoryOfClaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibleStageHistoryOfClaim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `claimID` int(11) NOT NULL,
  `stageID` int(11) NOT NULL,
  `updatedByID` int(11) DEFAULT NULL,
  `updatedDateTime` datetime DEFAULT NULL,
  `updatedTimeZone` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailsHistory`
--

DROP TABLE IF EXISTS `emailsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailsHistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fromEmailAddress` varchar(255) NOT NULL,
  `toEmailAddress` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `attachments` varchar(255) DEFAULT NULL,
  `uidOfPatientThisEmailIsShownInUI` int(11) unsigned DEFAULT NULL,
  `idOfEmailOnMailServer` int(11) unsigned NOT NULL,
  `fetchedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'at which time email fetched on by sheduler',
  PRIMARY KEY (`id`),
  KEY `uidOfPatientThisEmailIsShownInUI` (`uidOfPatientThisEmailIsShownInUI`),
  CONSTRAINT `emailsHistory_ibfk_1` FOREIGN KEY (`uidOfPatientThisEmailIsShownInUI`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventDocumentComments`
--

DROP TABLE IF EXISTS `eventDocumentComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDocumentComments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploadID` int(11) unsigned NOT NULL,
  `comment` text NOT NULL,
  `uidOfCommentedBy` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uploadID` (`uploadID`),
  KEY `uidOfCommentedBy` (`uidOfCommentedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='One uploadID can have multiple comments associated with it.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventDocumentUploadFolder`
--

DROP TABLE IF EXISTS `eventDocumentUploadFolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDocumentUploadFolder` (
  `uploadID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `folder` varchar(512) NOT NULL DEFAULT '',
  `docStatus` varchar(50) NOT NULL,
  `uidOfUploadedBy` int(11) unsigned DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uploadID`),
  KEY `ForUserID` (`uidOfUploadedBy`),
  KEY `ForPatientID` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventDocuments`
--

DROP TABLE IF EXISTS `eventDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDocuments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploadID` int(11) unsigned NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL DEFAULT '',
  `fileType` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `foruploadid` (`uploadID`),
  KEY `uploadID` (`uploadID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='1. One upload ID can have multiple documents 2. File content is stored in the documents table since we do not want the app to depend on the file system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventDocumentsTemp`
--

DROP TABLE IF EXISTS `eventDocumentsTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDocumentsTemp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tempID` varchar(128) NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL DEFAULT '',
  `fileType` varchar(128) NOT NULL DEFAULT '',
  `eventID` int(11) unsigned DEFAULT NULL,
  `folderID` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1. Documents are put in this table temporarily. Once we get the upload id than we move the documents to the documents table. 2. When the documents are uploaded the uploadID is still not available. The uploadID only becomes available when the user hits the "Save" button. Hence we need this temp table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventRemindersMasterSettings`
--

DROP TABLE IF EXISTS `eventRemindersMasterSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventRemindersMasterSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isSendingScriptEnabled` enum('Yes','No') NOT NULL DEFAULT 'No',
  `emailSubjectTemplate` text NOT NULL,
  `emailBodyTemplate` text NOT NULL,
  `smsBodyTemplate` text NOT NULL,
  `isItLatest` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: old, 1: latest',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `isItLatest` (`isItLatest`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventRemindersUserSettings`
--

DROP TABLE IF EXISTS `eventRemindersUserSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventRemindersUserSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `receiverSettings` text,
  `typeSettings` text,
  `firstReminderTimeInHours` smallint(5) unsigned NOT NULL DEFAULT '0',
  `secondReminderTimeInHours` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userID` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventTempForImportFromDrupal`
--

DROP TABLE IF EXISTS `eventTempForImportFromDrupal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventTempForImportFromDrupal` (
  `eventID` int(11) NOT NULL,
  `appointmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventsOfGoogleCalendar`
--

DROP TABLE IF EXISTS `eventsOfGoogleCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsOfGoogleCalendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `googleCalendarEventID` varchar(255) DEFAULT NULL,
  `googleCalendarID` varchar(255) DEFAULT NULL,
  `eventStartDate` datetime DEFAULT NULL,
  `eventEndDate` datetime DEFAULT NULL,
  `eventSummary` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventsReportCustomFilters`
--

DROP TABLE IF EXISTS `eventsReportCustomFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsReportCustomFilters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(255) DEFAULT NULL,
  `noOfTimesAccessed` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventsReportSummaries`
--

DROP TABLE IF EXISTS `eventsReportSummaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsReportSummaries` (
  `summaryReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportName` varchar(255) NOT NULL,
  `customReportID` int(11) unsigned NOT NULL,
  `fieldNamesUsedInSummaryReportStoredAsCSV` text NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`summaryReportID`),
  KEY `customReportID` (`customReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventsReportSummaryStates`
--

DROP TABLE IF EXISTS `eventsReportSummaryStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsReportSummaryStates` (
  `stateID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportID` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateConfigurationObject` text NOT NULL,
  `isStateLocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `urlsToShowThisQuestionAtCommaSeperated` text NOT NULL,
  `uidOfAuthor` int(11) unsigned DEFAULT NULL,
  `question` varchar(256) DEFAULT NULL,
  `answer` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `authorID` (`uidOfAuthor`),
  CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`uidOfAuthor`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faqComment`
--

DROP TABLE IF EXISTS `faqComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqComment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `faqID` int(11) unsigned NOT NULL,
  `comment` varchar(255) NOT NULL,
  `uidOfCommentedBy` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `faqID` (`faqID`),
  KEY `uidOfCommentedBy` (`uidOfCommentedBy`),
  CONSTRAINT `faqComment_ibfk_1` FOREIGN KEY (`faqID`) REFERENCES `faq` (`id`),
  CONSTRAINT `faqComment_ibfk_2` FOREIGN KEY (`uidOfCommentedBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faviconFromProfileImage`
--

DROP TABLE IF EXISTS `faviconFromProfileImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faviconFromProfileImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `image` varbinary(10000) DEFAULT NULL,
  `imageForRedFlag` varbinary(10000) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY AUTO_INCREMENT=371 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faxDocuments`
--

DROP TABLE IF EXISTS `faxDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faxDocuments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `faxLabel` varchar(255) NOT NULL,
  `faxMailId` int(11) unsigned NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileType` varchar(255) NOT NULL,
  `FileContent` longblob NOT NULL,
  `isAssigned` int(1) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filesReportSummaries`
--

DROP TABLE IF EXISTS `filesReportSummaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filesReportSummaries` (
  `summaryReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportName` varchar(255) NOT NULL,
  `customReportID` int(11) unsigned NOT NULL,
  `fieldNamesUsedInSummaryReportStoredAsCSV` text NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`summaryReportID`),
  KEY `customReportID` (`customReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filesReportSummaryStates`
--

DROP TABLE IF EXISTS `filesReportSummaryStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filesReportSummaryStates` (
  `stateID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportID` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateConfigurationObject` text NOT NULL,
  `isStateLocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stateID`),
  KEY `summaryReportID` (`summaryReportID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genderTypesMaster`
--

DROP TABLE IF EXISTS `genderTypesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genderTypesMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `genderTypesMasterUniqueId` varchar(36) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_GTM` BEFORE INSERT ON `genderTypesMaster` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND TABLE_NAME = 'genderTypesMaster' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.genderTypesMasterUniqueId IS NULL) THEN
    	SET NEW.genderTypesMasterUniqueId = @P1;
    ELSEIF (NEW.genderTypesMasterUniqueId = '') THEN
    	SET NEW.genderTypesMasterUniqueId = @P1;  
	ELSE
    	SET NEW.genderTypesMasterUniqueId = NEW.genderTypesMasterUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `googleCalendarSyncTokenByDoctor`
--

DROP TABLE IF EXISTS `googleCalendarSyncTokenByDoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleCalendarSyncTokenByDoctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `nextSyncToken` varchar(255) DEFAULT NULL,
  `resourceId` varchar(255) DEFAULT NULL,
  `watchSetDateTime` datetime DEFAULT NULL,
  `watchSetTimeZone` varchar(255) DEFAULT NULL,
  `watchExpirationDateTime` datetime DEFAULT NULL,
  `watchExpirationTimeZone` varchar(255) DEFAULT NULL,
  `watchAddress` varchar(100) DEFAULT NULL,
  `watchSetID` varchar(100) DEFAULT NULL,
  `createdOnDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googleNotificationDetails`
--

DROP TABLE IF EXISTS `googleNotificationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleNotificationDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `notificationType` enum('sent','receipt') DEFAULT NULL,
  `insertedFrom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3990898 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `googleSyncTokenForCreateAfaAppintmentOfADoctor`
--

DROP TABLE IF EXISTS `googleSyncTokenForCreateAfaAppintmentOfADoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googleSyncTokenForCreateAfaAppintmentOfADoctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) NOT NULL,
  `nextSyncToken` varchar(255) DEFAULT NULL,
  `nextPageToken` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `greetingsMailNotification`
--

DROP TABLE IF EXISTS `greetingsMailNotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greetingsMailNotification` (
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `userName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `daId` int(11) unsigned,
  `daName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `daEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `homePageCustomReports`
--

DROP TABLE IF EXISTS `homePageCustomReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homePageCustomReports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `customReportID` int(11) unsigned NOT NULL,
  `reportType` enum('payments','event','user','helpdesk') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `homePageSummaryReportStates`
--

DROP TABLE IF EXISTS `homePageSummaryReportStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homePageSummaryReportStates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `stateid` int(11) unsigned NOT NULL,
  `reportType` enum('payments','event','user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hospitalizationDetail`
--

DROP TABLE IF EXISTS `hospitalizationDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitalizationDetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `description` text,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the hospitalizationDetail is locked or not',
  `hospitalizationForWhichPatient` int(11) unsigned NOT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hospitalizationForWhichPatient` (`hospitalizationForWhichPatient`),
  KEY `uidOfCreatedBy` (`uidOfCreatedBy`),
  CONSTRAINT `hospitalizationDetail_ibfk_1` FOREIGN KEY (`hospitalizationForWhichPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `hospitalizationDetail_ibfk_2` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1432 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intakeFilledByGuardian`
--

DROP TABLE IF EXISTS `intakeFilledByGuardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intakeFilledByGuardian` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` int(10) DEFAULT NULL,
  `guardianUid` int(10) NOT NULL,
  `relationshipDetails` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intakeQuestions`
--

DROP TABLE IF EXISTS `intakeQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intakeQuestions` (
  `questionnID` int(11) NOT NULL AUTO_INCREMENT,
  `questionText` varchar(255) NOT NULL,
  `pluginID` int(11) NOT NULL,
  `Notes` text NOT NULL,
  PRIMARY KEY (`questionnID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitedUsers`
--

DROP TABLE IF EXISTS `invitedUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitedUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitedEmailId` varchar(255) NOT NULL,
  `roomId` int(11) NOT NULL,
  `status` enum('Invited','Accepted','Rejected','') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letDoctorBeDoctor`
--

DROP TABLE IF EXISTS `letDoctorBeDoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letDoctorBeDoctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientUid` int(11) NOT NULL,
  `didThePatientGiveConsentToUseLetDoctorBeDoctorSystem` enum('yes','no') NOT NULL DEFAULT 'no',
  `document` text,
  `fileContent` longblob,
  `notes` text,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedBy` int(11) DEFAULT NULL,
  `deletedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loginAttempts`
--

DROP TABLE IF EXISTS `loginAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginAttempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(50) DEFAULT NULL,
  `failedAttemptCount` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2945 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailQueueAttachment`
--

DROP TABLE IF EXISTS `mailQueueAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailQueueAttachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailQueueId` int(11) unsigned NOT NULL,
  `fileContent` longblob NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailQueueOutgoing`
--

DROP TABLE IF EXISTS `mailQueueOutgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailQueueOutgoing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `toAddress` varchar(255) DEFAULT NULL,
  `toName` varchar(255) DEFAULT NULL,
  `toMultiple` text,
  `fromAddress` varchar(255) DEFAULT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `ccAddress` varchar(255) DEFAULT NULL,
  `ccName` varchar(255) DEFAULT NULL,
  `ccToMultiple` text,
  `bccAddress` varchar(255) DEFAULT NULL,
  `bccName` varchar(255) DEFAULT NULL,
  `bccToMultiple` text,
  `subject` text,
  `messageHeader` text,
  `messageBody` text,
  `contentType` enum('text','html') NOT NULL DEFAULT 'text',
  `returnPath` varchar(255) DEFAULT NULL,
  `insertedFrom` varchar(255) DEFAULT NULL,
  `developedBy` varchar(255) DEFAULT NULL,
  `additionalInfo` text,
  `errorFound` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149079 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailQueueOutgoingOldStructure`
--

DROP TABLE IF EXISTS `mailQueueOutgoingOldStructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailQueueOutgoingOldStructure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `toAddress` varchar(255) DEFAULT NULL,
  `toName` varchar(255) DEFAULT NULL,
  `fromAddress` varchar(255) DEFAULT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `ccAddress` varchar(255) DEFAULT NULL,
  `ccName` varchar(255) DEFAULT NULL,
  `ccToMultiple` text,
  `bccAddress` varchar(255) DEFAULT NULL,
  `bccName` varchar(255) DEFAULT NULL,
  `subject` text,
  `messageHeader` text,
  `messageBody` text,
  `contentType` enum('text','html') NOT NULL DEFAULT 'text',
  `returnPath` varchar(255) DEFAULT NULL,
  `insertedFrom` varchar(255) DEFAULT NULL,
  `developedBy` varchar(255) DEFAULT NULL,
  `additionalInfo` text,
  `errorFound` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99415 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailQueueOutgoing_29thApril2019`
--

DROP TABLE IF EXISTS `mailQueueOutgoing_29thApril2019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailQueueOutgoing_29thApril2019` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `toAddress` varchar(255) DEFAULT NULL,
  `toName` varchar(255) DEFAULT NULL,
  `toMultiple` text,
  `fromAddress` varchar(255) DEFAULT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `ccAddress` varchar(255) DEFAULT NULL,
  `ccName` varchar(255) DEFAULT NULL,
  `ccToMultiple` text,
  `bccAddress` varchar(255) DEFAULT NULL,
  `bccName` varchar(255) DEFAULT NULL,
  `bccToMultiple` text,
  `subject` text,
  `messageHeader` text,
  `messageBody` text,
  `contentType` enum('text','html') NOT NULL DEFAULT 'text',
  `returnPath` varchar(255) DEFAULT NULL,
  `insertedFrom` varchar(255) DEFAULT NULL,
  `developedBy` varchar(255) DEFAULT NULL,
  `additionalInfo` text,
  `errorFound` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129866 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matchingSystemFeedback`
--

DROP TABLE IF EXISTS `matchingSystemFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchingSystemFeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `feedback` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4810 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationOrderDigitalSignDoc`
--

DROP TABLE IF EXISTS `medicationOrderDigitalSignDoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationOrderDigitalSignDoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `medicationId` varchar(255) DEFAULT NULL,
  `signedDoc` blob NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meditateUsers`
--

DROP TABLE IF EXISTS `meditateUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meditateUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fbId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailId` (`fbId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchantOnePaymentGatewayAVSResponseCodeMaster`
--

DROP TABLE IF EXISTS `merchantOnePaymentGatewayAVSResponseCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantOnePaymentGatewayAVSResponseCodeMaster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchantOnePaymentGatewayCVVResponseCodeMaster`
--

DROP TABLE IF EXISTS `merchantOnePaymentGatewayCVVResponseCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantOnePaymentGatewayCVVResponseCodeMaster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchantOnePaymentGatewayConfig`
--

DROP TABLE IF EXISTS `merchantOnePaymentGatewayConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantOnePaymentGatewayConfig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(200) NOT NULL,
  `apiType` enum('Test','Live') DEFAULT NULL,
  `updatedBy` varchar(100) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `merchantOnePaymentGatewayResultCodeMaster`
--

DROP TABLE IF EXISTS `merchantOnePaymentGatewayResultCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantOnePaymentGatewayResultCodeMaster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miscellaneousNoteTypeMaster`
--

DROP TABLE IF EXISTS `miscellaneousNoteTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneousNoteTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noteType` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modeOfAppointment`
--

DROP TABLE IF EXISTS `modeOfAppointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modeOfAppointment` (
  `modeID` int(10) NOT NULL AUTO_INCREMENT,
  `modeName` varchar(100) NOT NULL,
  PRIMARY KEY (`modeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `netcamDisplayOrder`
--

DROP TABLE IF EXISTS `netcamDisplayOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `netcamDisplayOrder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cameraID` int(11) NOT NULL,
  `camOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `netcamInfo`
--

DROP TABLE IF EXISTS `netcamInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `netcamInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portForExternalAccess` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `dayShiftPeople` text NOT NULL,
  `nightShiftPeople` text NOT NULL,
  `cameraTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `userName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `daId` int(11) unsigned,
  `daName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `daEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npiIdForDoctors`
--

DROP TABLE IF EXISTS `npiIdForDoctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `npiIdForDoctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) NOT NULL,
  `npiID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `officialLetterTypesMaster`
--

DROP TABLE IF EXISTS `officialLetterTypesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officialLetterTypesMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openTabsOfUsers`
--

DROP TABLE IF EXISTS `openTabsOfUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openTabsOfUsers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `openTabs` text COMMENT 'opened tab history in serialized array',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  CONSTRAINT `openTabsOfUsers_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagePermissionMaster`
--

DROP TABLE IF EXISTS `pagePermissionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagePermissionMaster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pageUrl` varchar(255) NOT NULL,
  `groupID` int(11) NOT NULL COMMENT 'dokiwiki group id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panelSettingsCommonToAllEventDetailEmrTabs`
--

DROP TABLE IF EXISTS `panelSettingsCommonToAllEventDetailEmrTabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelSettingsCommonToAllEventDetailEmrTabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `pluginID` tinyint(4) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  `panelColor` varchar(120) NOT NULL,
  `isMinimized` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1403 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panelSettingsCommonToUserRoleForAllUserDetailEmrTabs`
--

DROP TABLE IF EXISTS `panelSettingsCommonToUserRoleForAllUserDetailEmrTabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelSettingsCommonToUserRoleForAllUserDetailEmrTabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleID` int(11) unsigned DEFAULT NULL,
  `pluginID` tinyint(4) unsigned DEFAULT NULL,
  `weight` int(11) unsigned DEFAULT '0',
  `isThePanelMovable` enum('Yes','No') NOT NULL,
  `isGrouped` tinyint(1) NOT NULL DEFAULT '0',
  `groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sectionID` (`pluginID`),
  KEY `uid` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panelSettingsUniqueToEachUserDetailEmrTabs`
--

DROP TABLE IF EXISTS `panelSettingsUniqueToEachUserDetailEmrTabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelSettingsUniqueToEachUserDetailEmrTabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `pluginID` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `minimized` tinyint(1) unsigned NOT NULL COMMENT '0: not minimized, 1: minimized, 2: Hidden. Change to be done: Rename this field to visibleStateOfPanel. Instead of tinyint make it enum.',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `pluginID` (`pluginID`),
  CONSTRAINT `panelSettingsUniqueToEachUserDetailEmrTabs_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `panelSettingsUniqueToEachUserDetailEmrTabs_ibfk_2` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `panelSettingsUniqueToEachUserDetailEmrTabs_ibfk_3` FOREIGN KEY (`pluginID`) REFERENCES `pluginMaster` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=6220 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panelSettingsUniqueToUserForAllUserDetailEmrTabs`
--

DROP TABLE IF EXISTS `panelSettingsUniqueToUserForAllUserDetailEmrTabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelSettingsUniqueToUserForAllUserDetailEmrTabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `pluginID` tinyint(4) unsigned DEFAULT NULL,
  `weight` int(11) unsigned DEFAULT '0',
  `panelColor` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sectionID` (`pluginID`),
  KEY `uid` (`uid`),
  CONSTRAINT `panelSettingsUniqueToUserForAllUserDetailEmrTabs_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `panelSettingsUniqueToUserForAllUserDetailEmrTabs_ibfk_2` FOREIGN KEY (`pluginID`) REFERENCES `pluginMaster` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `patientFeedbackForReport`
--

DROP TABLE IF EXISTS `patientFeedbackForReport`;
/*!50001 DROP VIEW IF EXISTS `patientFeedbackForReport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `patientFeedbackForReport` AS SELECT 
 1 AS `id`,
 1 AS `eventId`,
 1 AS `doctorDaId`,
 1 AS `rateYourExpeWithYourDoctOrTherapist`,
 1 AS `rateYourOverallExpecWithDoctorsAssis`,
 1 AS `commentsFeedbackSuggestion`,
 1 AS `timeZone`,
 1 AS `dateTime`,
 1 AS `patientId`,
 1 AS `providerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patientFeedbackSurvey`
--

DROP TABLE IF EXISTS `patientFeedbackSurvey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientFeedbackSurvey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `doctorDaId` int(11) NOT NULL,
  `rateYourExpeWithYourDoctOrTherapist` int(11) NOT NULL,
  `rateYourOverallExpecWithDoctorsAssis` int(11) NOT NULL,
  `commentsFeedbackSuggestion` longtext NOT NULL,
  `timeZone` varchar(4) NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1091 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientHoursReportDefaultFilterDataSet`
--

DROP TABLE IF EXISTS `patientHoursReportDefaultFilterDataSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientHoursReportDefaultFilterDataSet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataSet` longtext NOT NULL,
  `lastUpdatedBy` int(11) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientTherapyMaster`
--

DROP TABLE IF EXISTS `patientTherapyMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientTherapyMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) unsigned NOT NULL,
  `therapist_id` int(11) unsigned NOT NULL,
  `therapist_roleid` int(10) unsigned DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentAccountBeingMadeMaster`
--

DROP TABLE IF EXISTS `paymentAccountBeingMadeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentAccountBeingMadeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentDefaulterPatientHistory`
--

DROP TABLE IF EXISTS `paymentDefaulterPatientHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentDefaulterPatientHistory` (
  `paymentDefaulterID` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) NOT NULL,
  `isDefaulter` enum('yes','no') DEFAULT NULL,
  `detailedReason` text,
  `uidMarkedBy` int(11) NOT NULL,
  `markedAt` datetime NOT NULL,
  `markedAtTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paymentDefaulterID`)
) ENGINE=InnoDB AUTO_INCREMENT=4360 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `paymentReportView`
--

DROP TABLE IF EXISTS `paymentReportView`;
/*!50001 DROP VIEW IF EXISTS `paymentReportView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `paymentReportView` AS SELECT 
 1 AS `paymentTableId`,
 1 AS `cptCodeForAppointmentID`,
 1 AS `paymentAmountClaimedIncludingFinanceCharges`,
 1 AS `paymentAmountClaimedForSCExcludingFinanceCharges`,
 1 AS `paymentAmountReceived`,
 1 AS `paymentAmountBadDebt`,
 1 AS `transactionFee`,
 1 AS `tansactionID`,
 1 AS `paymentStatusID`,
 1 AS `paymentStatus`,
 1 AS `paymentMethodID`,
 1 AS `paymentMethod`,
 1 AS `paymentAccountThisPaymentIsBeingMadeFrom`,
 1 AS `paymentLast4DigitChargedCreditCardNo`,
 1 AS `entityResponsibleToMakeThisPaymentID`,
 1 AS `entityResponsibleToMakeThisPayment`,
 1 AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,
 1 AS `nameOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `eventId`,
 1 AS `isCptLocked`,
 1 AS `isPaymentLocked`,
 1 AS `cptCreatedAt`,
 1 AS `cptUpdatedAt`,
 1 AS `cptCreatedByUID`,
 1 AS `cptUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByName`,
 1 AS `paymentBadDebtUpdatedOn`,
 1 AS `paymentBadDebtUpdatedOnTimeZone`,
 1 AS `paymentCreatedAt`,
 1 AS `paymentUpdatedAt`,
 1 AS `paymentCreatedByUID`,
 1 AS `paymentUpdatedByUID`,
 1 AS `financialInstitutionID`,
 1 AS `quickbookStatus`,
 1 AS `cptCreatedByFullName`,
 1 AS `cptUpdatedByFullName`,
 1 AS `paymentCreatedByFullName`,
 1 AS `paymentUpdatedByFullName`,
 1 AS `financialInstitutionName`,
 1 AS `paymentNotes`,
 1 AS `dateTheMoneyComeIntoSCAccount`,
 1 AS `bankPostDateOfOfficeAlly`,
 1 AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,
 1 AS `claimLastSubmittedOn`,
 1 AS `claimLastSubmittedOnTimeZone`,
 1 AS `claimLastSubmittedByUID`,
 1 AS `claimLastSubmittedByFullName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `payment_report_latest`
--

DROP TABLE IF EXISTS `payment_report_latest`;
/*!50001 DROP VIEW IF EXISTS `payment_report_latest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `payment_report_latest` AS SELECT 
 1 AS `paymentTableId`,
 1 AS `cptCodeForAppointmentID`,
 1 AS `paymentAmountClaimedIncludingFinanceCharges`,
 1 AS `paymentAmountClaimedForSCExcludingFinanceCharges`,
 1 AS `paymentAmountReceived`,
 1 AS `paymentAmountBadDebt`,
 1 AS `transactionFee`,
 1 AS `tansactionID`,
 1 AS `paymentStatusID`,
 1 AS `paymentStatus`,
 1 AS `paymentMethodID`,
 1 AS `paymentMethod`,
 1 AS `paymentAccountThisPaymentIsBeingMadeFrom`,
 1 AS `paymentLast4DigitChargedCreditCardNo`,
 1 AS `entityResponsibleToMakeThisPaymentID`,
 1 AS `entityResponsibleToMakeThisPayment`,
 1 AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,
 1 AS `nameOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `eventId`,
 1 AS `isCptLocked`,
 1 AS `isPaymentLocked`,
 1 AS `cptCreatedAt`,
 1 AS `cptUpdatedAt`,
 1 AS `cptCreatedByUID`,
 1 AS `cptUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByName`,
 1 AS `paymentBadDebtUpdatedOn`,
 1 AS `paymentBadDebtUpdatedOnTimeZone`,
 1 AS `paymentCreatedAt`,
 1 AS `paymentUpdatedAt`,
 1 AS `paymentCreatedByUID`,
 1 AS `paymentUpdatedByUID`,
 1 AS `financialInstitutionID`,
 1 AS `quickbookStatus`,
 1 AS `cptCreatedByFullName`,
 1 AS `cptUpdatedByFullName`,
 1 AS `paymentCreatedByFullName`,
 1 AS `paymentUpdatedByFullName`,
 1 AS `financialInstitutionName`,
 1 AS `paymentNotes`,
 1 AS `dateTheMoneyComeIntoSCAccount`,
 1 AS `bankPostDateOfOfficeAlly`,
 1 AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,
 1 AS `claimLastSubmittedOn`,
 1 AS `claimLastSubmittedOnTimeZone`,
 1 AS `claimLastSubmittedByUID`,
 1 AS `claimLastSubmittedByFullName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `payment_report_latest1`
--

DROP TABLE IF EXISTS `payment_report_latest1`;
/*!50001 DROP VIEW IF EXISTS `payment_report_latest1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `payment_report_latest1` AS SELECT 
 1 AS `paymentTableId`,
 1 AS `cptCodeForAppointmentID`,
 1 AS `paymentAmountClaimedIncludingFinanceCharges`,
 1 AS `paymentAmountClaimedForSCExcludingFinanceCharges`,
 1 AS `paymentAmountReceived`,
 1 AS `paymentAmountBadDebt`,
 1 AS `transactionFee`,
 1 AS `tansactionID`,
 1 AS `paymentStatusID`,
 1 AS `paymentStatus`,
 1 AS `paymentMethodID`,
 1 AS `paymentMethod`,
 1 AS `paymentAccountThisPaymentIsBeingMadeFrom`,
 1 AS `paymentLast4DigitChargedCreditCardNo`,
 1 AS `entityResponsibleToMakeThisPaymentID`,
 1 AS `entityResponsibleToMakeThisPayment`,
 1 AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,
 1 AS `nameOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `eventId`,
 1 AS `isCptLocked`,
 1 AS `isPaymentLocked`,
 1 AS `cptCreatedAt`,
 1 AS `cptUpdatedAt`,
 1 AS `cptCreatedByUID`,
 1 AS `cptUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByName`,
 1 AS `paymentBadDebtUpdatedOn`,
 1 AS `paymentBadDebtUpdatedOnTimeZone`,
 1 AS `paymentCreatedAt`,
 1 AS `paymentUpdatedAt`,
 1 AS `paymentCreatedByUID`,
 1 AS `paymentUpdatedByUID`,
 1 AS `financialInstitutionID`,
 1 AS `quickbookStatus`,
 1 AS `cptCreatedByFullName`,
 1 AS `cptUpdatedByFullName`,
 1 AS `paymentCreatedByFullName`,
 1 AS `paymentUpdatedByFullName`,
 1 AS `financialInstitutionName`,
 1 AS `paymentNotes`,
 1 AS `dateTheMoneyComeIntoSCAccount`,
 1 AS `bankPostDateOfOfficeAlly`,
 1 AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,
 1 AS `claimLastSubmittedOn`,
 1 AS `claimLastSubmittedOnTimeZone`,
 1 AS `claimLastSubmittedByUID`,
 1 AS `claimLastSubmittedByFullName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `payment_report_latest2`
--

DROP TABLE IF EXISTS `payment_report_latest2`;
/*!50001 DROP VIEW IF EXISTS `payment_report_latest2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `payment_report_latest2` AS SELECT 
 1 AS `paymentID`,
 1 AS `eventID`,
 1 AS `eventTypeName`,
 1 AS `eventStatusName`,
 1 AS `uidOfCreatedBy`,
 1 AS `fullNameOfCreatedBy`,
 1 AS `startDateTime`,
 1 AS `endDateTime`,
 1 AS `durationInMinute`,
 1 AS `companyID`,
 1 AS `isEventLocked`,
 1 AS `assetID`,
 1 AS `assetName`,
 1 AS `billingStatus`,
 1 AS `cptCodeForAppointmentID`,
 1 AS `cptCodeName`,
 1 AS `cptCodeID`,
 1 AS `paymentAmountClaimedIncludingFinanceCharges`,
 1 AS `paymentAmountClaimedForSCExcludingFinanceCharges`,
 1 AS `paymentAmountTransactionFee`,
 1 AS `paymentMerchantOneTransactionID`,
 1 AS `paymentAccountThisPaymentIsBeingMadeFrom`,
 1 AS `paymentLast4DigitChargedCreditCardNo`,
 1 AS `paymentAmountReceived`,
 1 AS `paymentAmountBadDebt`,
 1 AS `paymentAmountRemaining`,
 1 AS `paymentStatus`,
 1 AS `paymentMethod`,
 1 AS `entityResponsibleToMakeThisPaymentID`,
 1 AS `isCptLocked`,
 1 AS `isPaymentLocked`,
 1 AS `cptCreatedAt`,
 1 AS `cptCreatedByUID`,
 1 AS `cptCreatedByFullName`,
 1 AS `cptUpdatedAt`,
 1 AS `cptUpdatedByUID`,
 1 AS `cptUpdatedByFullName`,
 1 AS `paymentBadDebtUpdatedOn`,
 1 AS `paymentBadDebtUpdatedOnTimeZone`,
 1 AS `paymentBadDebtUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByName`,
 1 AS `paymentCreatedAt`,
 1 AS `paymentCreatedByUID`,
 1 AS `paymentCreatedByFullName`,
 1 AS `paymentUpdatedAt`,
 1 AS `paymentUpdatedByUID`,
 1 AS `paymentUpdatedByFullName`,
 1 AS `financialInstitutionID`,
 1 AS `financialInstitutionName`,
 1 AS `quickbookStatus`,
 1 AS `paymentNotes`,
 1 AS `dateTheMoneyComeIntoSCAccount`,
 1 AS `bankPostDateOfOfficeAlly`,
 1 AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,
 1 AS `nameOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `uidOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `claimLastSubmittedOn`,
 1 AS `claimLastSubmittedOnTimeZone`,
 1 AS `claimLastSubmittedByUID`,
 1 AS `claimLastSubmittedByFullName`,
 1 AS `cptAmountExpected`,
 1 AS `cptAmountReceived`,
 1 AS `cptAmountBadDebt`,
 1 AS `cptAmountRemaining`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paymentsReportCustomFilters`
--

DROP TABLE IF EXISTS `paymentsReportCustomFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentsReportCustomFilters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(255) DEFAULT NULL,
  `noOfTimesAccessed` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentsReportSummaries`
--

DROP TABLE IF EXISTS `paymentsReportSummaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentsReportSummaries` (
  `summaryReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportName` varchar(255) NOT NULL,
  `customReportID` int(11) unsigned NOT NULL,
  `fieldNamesUsedInSummaryReportStoredAsCSV` text NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`summaryReportID`),
  KEY `customReportID` (`customReportID`),
  CONSTRAINT `paymentsReportSummaries_ibfk_1` FOREIGN KEY (`customReportID`) REFERENCES `paymentsReportCustomFilters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentsReportSummaryStates`
--

DROP TABLE IF EXISTS `paymentsReportSummaryStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentsReportSummaryStates` (
  `stateID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportID` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateConfigurationObject` text NOT NULL,
  `isStateLocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pdfNoteSectionVisibilitySetting`
--

DROP TABLE IF EXISTS `pdfNoteSectionVisibilitySetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdfNoteSectionVisibilitySetting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `providerId` int(10) NOT NULL,
  `socialHistory` tinyint(1) NOT NULL DEFAULT '1',
  `majorLifeEvents` tinyint(1) NOT NULL DEFAULT '1',
  `selfHarmDetails` tinyint(1) NOT NULL DEFAULT '1',
  `substanceUseDetails` tinyint(1) NOT NULL DEFAULT '1',
  `hospitalisationHistory` tinyint(1) NOT NULL DEFAULT '1',
  `diagnosisHistory` tinyint(1) NOT NULL DEFAULT '1',
  `ruleOutDiagnosisHistory` tinyint(1) NOT NULL DEFAULT '1',
  `pastPRSDetails` tinyint(1) NOT NULL DEFAULT '1',
  `pastMSEDetails` tinyint(1) NOT NULL DEFAULT '1',
  `MSEDetails` tinyint(1) NOT NULL DEFAULT '1',
  `allergiesHistory` tinyint(1) NOT NULL DEFAULT '1',
  `bodyMeasurementDetails` tinyint(1) NOT NULL DEFAULT '1',
  `currentMedicineDetails` tinyint(1) NOT NULL DEFAULT '1',
  `discontinuedMedicineDetails` tinyint(1) NOT NULL DEFAULT '1',
  `currentPRSDetails` tinyint(1) NOT NULL DEFAULT '1',
  `medicationRefillDetails` tinyint(1) NOT NULL DEFAULT '1',
  `recommendationDetails` tinyint(1) NOT NULL DEFAULT '1',
  `reminderDetails` tinyint(1) NOT NULL DEFAULT '1',
  `serviceStatementDetails` tinyint(1) NOT NULL DEFAULT '1',
  `planCommentDetails` tinyint(1) NOT NULL DEFAULT '1',
  `medicalHistory` tinyint(1) NOT NULL DEFAULT '1',
  `outpatientTreatment` tinyint(1) NOT NULL DEFAULT '1',
  `medsTrials` tinyint(1) NOT NULL DEFAULT '1',
  `historyOfViolence` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `providerId` (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `createdTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pharmacyName` varchar(128) DEFAULT NULL,
  `isOnSurescripts` enum('no','yes') NOT NULL DEFAULT 'no',
  `pharmacyStreetAddressLine1` varchar(128) DEFAULT NULL,
  `pharmacyStreetAddressLine2` varchar(128) DEFAULT NULL,
  `pharmacyCity` varchar(128) DEFAULT NULL,
  `pharmacyState` varchar(128) DEFAULT NULL,
  `pharmacyPhone` varchar(128) DEFAULT NULL,
  `pharmacyFax` varchar(128) DEFAULT NULL,
  `pharmacyURL` varchar(128) DEFAULT NULL,
  `pharmacyNotes` text,
  `primaryOrSecondary` tinyint(4) unsigned DEFAULT '0' COMMENT '1: primary, 2: secondary',
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `originId` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinCodeForSignToEMRMaster`
--

DROP TABLE IF EXISTS `pinCodeForSignToEMRMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinCodeForSignToEMRMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pinCode` varchar(4) NOT NULL,
  `updatedByUID` int(11) NOT NULL,
  `updatedByDateTime` datetime NOT NULL,
  `updatedByTimeZome` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginMaster`
--

DROP TABLE IF EXISTS `pluginMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMaster` (
  `pluginID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `sectionID` tinyint(4) unsigned DEFAULT NULL,
  `pluginTitle` varchar(255) DEFAULT NULL,
  `hotkey` varchar(50) DEFAULT NULL,
  `typeOfSectionThisPluginIsUsefulIn` varchar(255) DEFAULT NULL COMMENT 'Each section has further classification of mutually exclusive types. Like users have user roles and events have event types. Some plugins like Coding and payment for section events are not applicable when the event type is conference. We will store this information here.',
  `pluginCategoryMasterId` tinyint(3) unsigned DEFAULT NULL,
  `parentPluginId` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`pluginID`),
  KEY `sectionID` (`sectionID`),
  KEY `parentPluginId` (`parentPluginId`),
  KEY `pluginCategoryMasterId` (`pluginCategoryMasterId`),
  CONSTRAINT `pluginMaster_ibfk_1` FOREIGN KEY (`sectionID`) REFERENCES `sectionsMaster` (`id`),
  CONSTRAINT `pluginMaster_ibfk_2` FOREIGN KEY (`parentPluginId`) REFERENCES `pluginMaster` (`pluginID`),
  CONSTRAINT `pluginMaster_ibfk_3` FOREIGN KEY (`pluginCategoryMasterId`) REFERENCES `pluginMasterCategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 4/8';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginMasterCategories`
--

DROP TABLE IF EXISTS `pluginMasterCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMasterCategories` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginMasterForPatientPortal`
--

DROP TABLE IF EXISTS `pluginMasterForPatientPortal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMasterForPatientPortal` (
  `pluginID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pluginTitle` varchar(255) DEFAULT NULL,
  `isEnabled` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginMasterPermissionForMyPortal`
--

DROP TABLE IF EXISTS `pluginMasterPermissionForMyPortal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMasterPermissionForMyPortal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pluginID` tinyint(4) unsigned NOT NULL,
  `roleID` tinyint(4) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleID` (`roleID`),
  KEY `pluginID` (`pluginID`),
  CONSTRAINT `pluginMasterPermissionForMyPortal_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `userRoleTypesMaster` (`id`),
  CONSTRAINT `pluginMasterPermissionForMyPortal_ibfk_2` FOREIGN KEY (`pluginID`) REFERENCES `pluginMasterForPatientPortal` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginPermission`
--

DROP TABLE IF EXISTS `pluginPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginPermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginID` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  `rolePermissionForPlugin` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginsSelectedByDefaultForUserRole`
--

DROP TABLE IF EXISTS `pluginsSelectedByDefaultForUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsSelectedByDefaultForUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` tinyint(4) unsigned NOT NULL,
  `pluginId` tinyint(4) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `displayOrderNumber` int(11) DEFAULT NULL,
  `pluginDisplayState` enum('open','close') NOT NULL DEFAULT 'open',
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `pluginId` (`pluginId`),
  CONSTRAINT `pluginsSelectedByDefaultForUserRole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `userRoleTypesMaster` (`id`),
  CONSTRAINT `pluginsSelectedByDefaultForUserRole_ibfk_2` FOREIGN KEY (`pluginId`) REFERENCES `pluginMaster` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginsSelectedByDefaultInEMRCustomizerForUserRole`
--

DROP TABLE IF EXISTS `pluginsSelectedByDefaultInEMRCustomizerForUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsSelectedByDefaultInEMRCustomizerForUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` tinyint(4) unsigned NOT NULL,
  `pluginId` tinyint(4) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `displayOrderNumber` int(11) DEFAULT NULL,
  `pluginDisplayState` enum('open','close') NOT NULL DEFAULT 'open',
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `pluginId` (`pluginId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginsSelectedByUserForUserRole`
--

DROP TABLE IF EXISTS `pluginsSelectedByUserForUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsSelectedByUserForUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `roleId` tinyint(4) unsigned NOT NULL,
  `pluginId` tinyint(4) unsigned NOT NULL,
  `pluginWeight` tinyint(3) unsigned NOT NULL,
  `pluginState` enum('open','close') NOT NULL DEFAULT 'close',
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `roleId` (`roleId`),
  KEY `pluginId` (`pluginId`),
  CONSTRAINT `pluginsSelectedByUserForUserRole_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `pluginsSelectedByUserForUserRole_ibfk_3` FOREIGN KEY (`pluginId`) REFERENCES `pluginMaster` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=12495 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preferredInsuranceCompaniesOfProvider`
--

DROP TABLE IF EXISTS `preferredInsuranceCompaniesOfProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferredInsuranceCompaniesOfProvider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfProvider` int(11) unsigned NOT NULL,
  `uidOfInsuranceCompany` int(11) unsigned DEFAULT NULL COMMENT 'user id of Insurance company - In contract with SC',
  `flgNoInsuranceCompany` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: false, 1: true',
  `flgAssignmentFromSCPsychiatrist` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: false, 1: true',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfProvider` (`uidOfProvider`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processNotes`
--

DROP TABLE IF EXISTS `processNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` text NOT NULL,
  `locked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `userID` int(11) NOT NULL,
  `addedByID` int(11) NOT NULL,
  `addedOnDateTime` datetime NOT NULL,
  `addedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processingFeesDetailsMaster`
--

DROP TABLE IF EXISTS `processingFeesDetailsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processingFeesDetailsMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `processingType` enum('Credit card','Insurance') DEFAULT NULL,
  `feesPercentage` decimal(3,2) NOT NULL DEFAULT '0.00',
  `feesFixed` decimal(3,2) NOT NULL DEFAULT '0.00',
  `createdByUID` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `updatedByUID` int(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerPatientMappingForWidget`
--

DROP TABLE IF EXISTS `providerPatientMappingForWidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerPatientMappingForWidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widgetID` varchar(50) DEFAULT NULL,
  `uidOfDoctor` int(11) NOT NULL DEFAULT '0',
  `uidOfPatient` int(11) NOT NULL DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT '0',
  `lastVisitedAt` datetime DEFAULT NULL,
  `lastVisitedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providersSpecificDetails`
--

DROP TABLE IF EXISTS `providersSpecificDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providersSpecificDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfDoctor` int(11) NOT NULL,
  `practiceStartedAtYear` int(11) DEFAULT NULL,
  `websiteProfileURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `providerunlocknotedetails`
--

DROP TABLE IF EXISTS `providerunlocknotedetails`;
/*!50001 DROP VIEW IF EXISTS `providerunlocknotedetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `providerunlocknotedetails` AS SELECT 
 1 AS `scEmployeeUID`,
 1 AS `eventId`,
 1 AS `eventStartDateTime`,
 1 AS `slab`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reasonForVisitMaster`
--

DROP TABLE IF EXISTS `reasonForVisitMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reasonForVisitMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reasonForVisit` varchar(255) NOT NULL,
  `hasDetail` tinyint(1) NOT NULL DEFAULT '0',
  `isLocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redFlags`
--

DROP TABLE IF EXISTS `redFlags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redFlags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) NOT NULL,
  `uidOfFlagCreatedBy` int(11) NOT NULL,
  `uidOfFlagCreatedOn` int(11) NOT NULL,
  `flagText` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  `isThisLocked` enum('yes','no') DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `deletedOnTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=786 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redFlags_bk`
--

DROP TABLE IF EXISTS `redFlags_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redFlags_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) NOT NULL DEFAULT '0',
  `uidOfFlagCreatedBy` int(11) NOT NULL,
  `uidOfFlagCreatedOn` int(11) NOT NULL,
  `flagText` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(255) DEFAULT NULL,
  `isThisLocked` enum('yes','no') DEFAULT NULL,
  `isDeleted` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `deletedOnTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referral`
--

DROP TABLE IF EXISTS `referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `uidOfReferred` int(11) unsigned DEFAULT NULL,
  `referralType` enum('referredBy','referredTo') NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the referral is locked or not',
  `notes` varchar(255) DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfReferred` (`uidOfReferred`),
  CONSTRAINT `referral_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`),
  CONSTRAINT `referral_ibfk_2` FOREIGN KEY (`uidOfReferred`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remAttachments`
--

DROP TABLE IF EXISTS `remAttachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remAttachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fileContent` longblob,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1607 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remCalendarSearchBoxState`
--

DROP TABLE IF EXISTS `remCalendarSearchBoxState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remCalendarSearchBoxState` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `attendeesSelected` varchar(255) DEFAULT NULL,
  `assestsSelected` varchar(255) DEFAULT NULL,
  `eventTypesSelected` varchar(255) DEFAULT NULL,
  `eventStatusTypesSelected` varchar(255) DEFAULT NULL,
  `eventChildTypesSelected` varchar(255) DEFAULT NULL,
  `lastViewedCalendarFor` varchar(100) DEFAULT NULL,
  `lastViewedCalendarType` enum('month','agendaWeek','agendaDay') NOT NULL DEFAULT 'month',
  `lastViewedCalendarTitle` varchar(100) DEFAULT NULL,
  `lastViewedAttendeesInfo` text COMMENT 'This field holds the color code and patient hours for the attendees selected in calendar search box',
  `userSpecificCalendarSettings` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `remCalendarSearchBoxState_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remColorsNotAllowedByCompanyAdminToUseInCalendar`
--

DROP TABLE IF EXISTS `remColorsNotAllowedByCompanyAdminToUseInCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remColorsNotAllowedByCompanyAdminToUseInCalendar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `companyID` int(11) unsigned NOT NULL,
  `colorID` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyID_2` (`companyID`,`colorID`),
  KEY `companyID` (`companyID`),
  KEY `colorID` (`colorID`),
  CONSTRAINT `remColorsNotAllowedByCompanyAdminToUseInCalendar_ibfk_1` FOREIGN KEY (`colorID`) REFERENCES `remMasterColorsHexAndNameTuple` (`colorID`),
  CONSTRAINT `remColorsNotAllowedByCompanyAdminToUseInCalendar_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventAssets`
--

DROP TABLE IF EXISTS `remEventAssets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventAssets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL DEFAULT '0',
  `assetID` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `eventID` (`eventID`),
  KEY `assetID` (`assetID`),
  CONSTRAINT `remEventAssets_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`),
  CONSTRAINT `remEventAssets_ibfk_2` FOREIGN KEY (`assetID`) REFERENCES `assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135850 DEFAULT CHARSET=utf8 COMMENT='ok by vk on 27/6, ok by sk on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventAttendees`
--

DROP TABLE IF EXISTS `remEventAttendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventAttendees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `isThisUserHost` tinyint(3) unsigned NOT NULL COMMENT '0: attendee, 1: host',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eventID` (`eventID`),
  KEY `uid` (`uid`),
  KEY `userHost` (`isThisUserHost`),
  CONSTRAINT `remEventAttendees_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `remEventAttendees_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=639788 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventFieldsSettingsForEventType`
--

DROP TABLE IF EXISTS `remEventFieldsSettingsForEventType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventFieldsSettingsForEventType` (
  `settingsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventTypeID` int(10) unsigned NOT NULL,
  `eventFieldID` int(10) unsigned NOT NULL,
  `eventCustomFieldName` varchar(100) NOT NULL,
  `isThisRequired` tinyint(1) NOT NULL COMMENT '0=Not Required, 1=Required',
  PRIMARY KEY (`settingsID`),
  KEY `eventTypeID` (`eventTypeID`),
  KEY `eventFieldID` (`eventFieldID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventLocations`
--

DROP TABLE IF EXISTS `remEventLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventLocations` (
  `mappingID` int(10) NOT NULL AUTO_INCREMENT,
  `eventID` int(10) NOT NULL,
  `locationID` int(10) NOT NULL,
  `createdByUid` int(10) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mappingID`)
) ENGINE=InnoDB AUTO_INCREMENT=41570 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventNotes`
--

DROP TABLE IF EXISTS `remEventNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventNotes` (
  `noteID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentNoteID` int(11) unsigned DEFAULT NULL,
  `eventID` int(11) unsigned NOT NULL,
  `noteTypeID` tinyint(4) unsigned NOT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `notes` text CHARACTER SET utf8 NOT NULL,
  `IsNoteMinimized` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0: not minimized, 1: minimized',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`noteID`),
  KEY `noteTypeID` (`noteTypeID`),
  KEY `createdByUserID` (`uidOfCreatedBy`),
  KEY `eventID` (`eventID`),
  KEY `parentId` (`parentNoteID`),
  CONSTRAINT `remEventNotes_ibfk_1` FOREIGN KEY (`noteTypeID`) REFERENCES `remMasterEventNoteTypes` (`id`),
  CONSTRAINT `remEventNotes_ibfk_2` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `remEventNotes_ibfk_3` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`),
  CONSTRAINT `remEventNotes_ibfk_4` FOREIGN KEY (`parentNoteID`) REFERENCES `remEventNotes` (`noteID`)
) ENGINE=InnoDB AUTO_INCREMENT=3060117 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventNotesLockingPermissionSetting`
--

DROP TABLE IF EXISTS `remEventNotesLockingPermissionSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventNotesLockingPermissionSetting` (
  `settingsId` int(10) NOT NULL AUTO_INCREMENT,
  `roleId` int(10) NOT NULL,
  `mse` tinyint(1) NOT NULL DEFAULT '0',
  `ros` tinyint(1) NOT NULL DEFAULT '0',
  `subjective` tinyint(1) NOT NULL DEFAULT '0',
  `assessment` tinyint(1) NOT NULL DEFAULT '0',
  `plan` tinyint(1) NOT NULL DEFAULT '0',
  `coding` tinyint(1) NOT NULL DEFAULT '0',
  `reason` tinyint(1) NOT NULL DEFAULT '0',
  `diagnosis` tinyint(1) NOT NULL DEFAULT '0',
  `isLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `medication` tinyint(1) NOT NULL DEFAULT '0',
  `medicineRefill` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`settingsId`),
  UNIQUE KEY `roleId` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventStatusChronology`
--

DROP TABLE IF EXISTS `remEventStatusChronology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventStatusChronology` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL DEFAULT '0',
  `eventStatusID` tinyint(4) unsigned DEFAULT NULL,
  `uidOfStatusSetBy` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventID` (`eventID`),
  KEY `eventStatusID` (`eventStatusID`),
  KEY `uidOfStatusSetBy` (`uidOfStatusSetBy`),
  CONSTRAINT `remEventStatusChronology_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`),
  CONSTRAINT `remEventStatusChronology_ibfk_2` FOREIGN KEY (`eventStatusID`) REFERENCES `remMasterEventStatusForEventType` (`id`),
  CONSTRAINT `remEventStatusChronology_ibfk_3` FOREIGN KEY (`uidOfStatusSetBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324239 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventTypeDependency`
--

DROP TABLE IF EXISTS `remEventTypeDependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventTypeDependency` (
  `dependencyID` int(10) NOT NULL AUTO_INCREMENT,
  `eventTypeId` int(10) NOT NULL,
  `dependantEventType` int(10) DEFAULT NULL,
  `dependencyAddedBy` int(10) NOT NULL,
  `dependencyAddedOn` datetime NOT NULL,
  `dependencyAddedTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dependencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEventVoices`
--

DROP TABLE IF EXISTS `remEventVoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEventVoices` (
  `voiceID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `binaryContentOfAudioFile` longblob NOT NULL,
  `audioName` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`voiceID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `remEventVoices_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remEvents`
--

DROP TABLE IF EXISTS `remEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remEvents` (
  `eventID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueEventId` varchar(36) DEFAULT NULL,
  `managedByRecurringEventParentID` int(11) DEFAULT NULL,
  `eventTypeID` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `locationOfThisEvent` varchar(255) NOT NULL DEFAULT '4966 El Camino Real%*Unit 224%*Los Altos, CA 94022%*United States',
  `cacheFieldCronCreatedForEventTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `companyID` int(11) unsigned DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the event is locked or not',
  `isNoteContainerMinimized` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0 : link has not been clicked. 1. Nornal size open 2 : minimized, 3 : user chosen custom size',
  `checkin_status` int(11) DEFAULT NULL,
  `checkingUpdatedAt` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `uidOfUpdatedBy` int(11) unsigned DEFAULT NULL,
  `timeZoneForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timeZoneForUpdatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isCached` tinyint(1) NOT NULL DEFAULT '0',
  `priority` enum('Green','Yellow','Red') NOT NULL DEFAULT 'Green',
  `googleCalendarEventID` varchar(255) DEFAULT NULL,
  `startDateTimeOfIntake` datetime DEFAULT NULL,
  `startTimeZoneOfIntake` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isPreferredBunching` tinyint(1) DEFAULT NULL,
  `timeSpent` int(10) DEFAULT NULL,
  `maxAllowedTime` int(3) DEFAULT NULL,
  `minAllowedTime` int(3) DEFAULT NULL,
  `isSurveyLinkSent` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`eventID`),
  KEY `eventTypeID` (`eventTypeID`),
  KEY `createdByUserID` (`uidOfCreatedBy`),
  KEY `companyID` (`companyID`),
  KEY `managedByRecurringEventParentID` (`managedByRecurringEventParentID`),
  CONSTRAINT `remEvents_ibfk_1` FOREIGN KEY (`eventTypeID`) REFERENCES `remMasterEventTypes` (`id`),
  CONSTRAINT `remEvents_ibfk_2` FOREIGN KEY (`uidOfCreatedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `remEvents_ibfk_3` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`),
  CONSTRAINT `remEvents_ibfk_4` FOREIGN KEY (`managedByRecurringEventParentID`) REFERENCES `remRecurringEventParents` (`recurringEventID`)
) ENGINE=InnoDB AUTO_INCREMENT=500294 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/7';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_remEvent` BEFORE INSERT ON `remEvents` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND   TABLE_NAME   = 'remEvents' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.publicUniqueEventId IS NULL) THEN
    	SET NEW.publicUniqueEventId = @P1;
    ELSEIF (NEW.publicUniqueEventId = '') THEN
    	SET NEW.publicUniqueEventId = @P1;  
	ELSE
    	SET NEW.publicUniqueEventId = NEW.publicUniqueEventId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `remForEventTypeAppointmentDetails`
--

DROP TABLE IF EXISTS `remForEventTypeAppointmentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remForEventTypeAppointmentDetails` (
  `eventID` int(11) unsigned NOT NULL,
  `patientID` int(10) unsigned NOT NULL,
  `reasonForVisitID` tinyint(3) unsigned DEFAULT NULL,
  `socialHistoryJsonWhenAppointmentSAPNoteIsLocked` text,
  `diagnosisJsonWhenAppointmentSAPNoteIsLocked` text,
  `allergiesJsonWhenAppointmentSAPNoteIsLocked` text,
  `medicationsJsonWhenAppointmentSAPNoteIsLocked` text,
  `hospitalizationHistoryJsonWhenAppointmentSAPNoteIsLocked` text,
  `isSubjectiveAssessmentPlanNoteLocked` enum('Yes','No') DEFAULT NULL,
  `dateTimeSAPNoteLockedAt` datetime DEFAULT NULL,
  `dateTimeSAPNoteLockedAtTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `SAPNoteLockedBy` int(11) DEFAULT NULL,
  `pdfFileContent` longblob,
  `pdfFileContentPasswordProtected` longblob,
  `billingStatusOfThisAppointment` enum('Step1: Appointment note (Plan) not locked not ready for coding','Step2: Appointment note locked ready for coding','Step3: Appointment coding finished.','Step4: Partial payment received. In process for more payments.','Step5: Complete payment received') DEFAULT NULL,
  `mseReportID` int(10) unsigned DEFAULT NULL,
  `prsReportID` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `reasonForVisitDetails` text,
  KEY `remForEventTypeAppointmentDetails_ibfk_1` (`eventID`),
  CONSTRAINT `remForEventTypeAppointmentDetails_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remForEventTypeOfficialLetterDetails`
--

DROP TABLE IF EXISTS `remForEventTypeOfficialLetterDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remForEventTypeOfficialLetterDetails` (
  `eventID` int(11) unsigned NOT NULL,
  `officialLetterTypeId` int(11) unsigned DEFAULT NULL,
  `savedOfficialLetterID` int(11) DEFAULT NULL COMMENT 'It is used when letter created from V3 Official Letter panel. Saved letter unique id is stored in this field.',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `eventID` (`eventID`),
  KEY `officialLetterTypeId` (`officialLetterTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remForEventTypeTaskDetails`
--

DROP TABLE IF EXISTS `remForEventTypeTaskDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remForEventTypeTaskDetails` (
  `eventID` int(11) unsigned NOT NULL,
  `toBeDoneNow` tinyint(4) unsigned DEFAULT NULL,
  `uidOfAssignedBy` int(11) unsigned DEFAULT NULL COMMENT 'We use eventAttendees to keep track of who is supposed to do the work and this work is about which patient. The person supposed to do the work is marked as the host.',
  `deadline` timestamp NULL DEFAULT NULL,
  `roleAssignedTo` tinyint(3) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `completeIn` datetime DEFAULT NULL,
  KEY `eventID` (`eventID`),
  KEY `uidOfAssignedBy` (`uidOfAssignedBy`),
  KEY `roleAssignedTo` (`roleAssignedTo`) USING BTREE,
  CONSTRAINT `remForEventTypeTaskDetails_ibfk_1` FOREIGN KEY (`uidOfAssignedBy`) REFERENCES `users` (`id`),
  CONSTRAINT `remForEventTypeTaskDetails_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`),
  CONSTRAINT `remForEventTypeTaskDetails_ibfk_3` FOREIGN KEY (`roleAssignedTo`) REFERENCES `userRoleTypesMaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remForwardPatientsToOtherAvailableDoctors`
--

DROP TABLE IF EXISTS `remForwardPatientsToOtherAvailableDoctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remForwardPatientsToOtherAvailableDoctors` (
  `eventForwardID` int(11) NOT NULL AUTO_INCREMENT,
  `eventID` int(11) DEFAULT NULL,
  `patientID` int(11) NOT NULL,
  `forwardedByDocID` int(11) DEFAULT NULL,
  `forwardedToDocID` int(11) DEFAULT NULL,
  `isPatientAcceptedByDoc` enum('yes','no','onhold') DEFAULT NULL,
  `forwardingDateTime` datetime NOT NULL,
  `responseDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`eventForwardID`)
) ENGINE=InnoDB AUTO_INCREMENT=6731 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMappingOfEventModes`
--

DROP TABLE IF EXISTS `remMappingOfEventModes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMappingOfEventModes` (
  `mappingID` int(10) NOT NULL AUTO_INCREMENT,
  `eventID` int(10) NOT NULL,
  `modeID` int(10) NOT NULL,
  `createdByUid` int(10) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mappingID`)
) ENGINE=InnoDB AUTO_INCREMENT=113389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMasterColorsHexAndNameTuple`
--

DROP TABLE IF EXISTS `remMasterColorsHexAndNameTuple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterColorsHexAndNameTuple` (
  `colorID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hexCode` char(6) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMasterEventFields`
--

DROP TABLE IF EXISTS `remMasterEventFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventFields` (
  `eventFieldID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventFieldName` varchar(100) NOT NULL,
  PRIMARY KEY (`eventFieldID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMasterEventNoteTypes`
--

DROP TABLE IF EXISTS `remMasterEventNoteTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventNoteTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `eventTypeID` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `initialTemplateContent` text,
  `numberOfNotesOfThisNoteTypeAllowedInAnEvent` tinyint(4) NOT NULL,
  `requiredForLockingNotesOfAnEvent` enum('No','Yes') NOT NULL DEFAULT 'No',
  `AllowedToAddAfterNotesOfAnEventIsLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`),
  KEY `eventTypeID` (`eventTypeID`),
  CONSTRAINT `remMasterEventNoteTypes_ibfk_1` FOREIGN KEY (`eventTypeID`) REFERENCES `remMasterEventTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 30/8';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMasterEventStatusForEventType`
--

DROP TABLE IF EXISTS `remMasterEventStatusForEventType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventStatusForEventType` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `eventTypeID` tinyint(4) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventTypeID` (`eventTypeID`),
  CONSTRAINT `remMasterEventStatusForEventType_ibfk_1` FOREIGN KEY (`eventTypeID`) REFERENCES `remMasterEventTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMasterEventTypes`
--

DROP TABLE IF EXISTS `remMasterEventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `nonReleavantPlugins` text,
  `createdAtTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restrictConflictOnEventTypeIDs` varchar(100) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `isAllDayEvent` enum('yes','no') NOT NULL DEFAULT 'no',
  `parentEventTypeID` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/07';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remMiscellaneousNotes`
--

DROP TABLE IF EXISTS `remMiscellaneousNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMiscellaneousNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `note` text,
  `billingDurationInMinutes` varchar(255) DEFAULT NULL,
  `miscellaneousNoteTypeMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28272 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remRecurringEventParents`
--

DROP TABLE IF EXISTS `remRecurringEventParents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remRecurringEventParents` (
  `recurringEventID` int(11) NOT NULL AUTO_INCREMENT,
  `typeOfEvent` int(11) DEFAULT NULL,
  `reoccursEvery` enum('day','weekday','week','month','year','weekend','dayOfWeek') DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `durationOfEvent` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `timeZoneForUpdatedAt` varchar(255) DEFAULT NULL,
  `isItLocked` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'This field decides whether the recurring event is locked or not',
  PRIMARY KEY (`recurringEventID`)
) ENGINE=InnoDB AUTO_INCREMENT=3791 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remUserDefaultSettings`
--

DROP TABLE IF EXISTS `remUserDefaultSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remUserDefaultSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `defaultHosts` text,
  `defaultAssets` text,
  `eventTypeId` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `eventStatusId` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `eventDuration` tinyint(4) NOT NULL DEFAULT '0',
  `location` int(10) DEFAULT NULL,
  `calendarEventBackGroundColorCode` varchar(10) DEFAULT NULL,
  `calendarEventTextColorCode` varchar(10) DEFAULT NULL,
  `allowSCBrainToCancelIncompleteAppts` enum('yes','no') NOT NULL DEFAULT 'no',
  `hourGapForNewAppointment` int(10) DEFAULT NULL,
  `durationForNewAppointmentOld` int(10) DEFAULT NULL,
  `durationForRepeatAppointmentOld` int(10) DEFAULT NULL,
  `durationForAdminHours` int(10) DEFAULT NULL,
  `maxIntakesAllowedInADay` int(10) DEFAULT NULL,
  `patientDurationForInitialConsultationOld` int(10) DEFAULT NULL,
  `patientDurationForFollowupOld` int(10) DEFAULT NULL,
  `doMatchingBeforeAppt` enum('yes','no') NOT NULL DEFAULT 'no',
  `durationComboForInitialConsultation` text,
  `durationComboForFollowup` text,
  `doGoogleAdvertising` enum('yes','no') NOT NULL DEFAULT 'yes',
  `doZocdocAdvertising` enum('yes','no') NOT NULL DEFAULT 'yes',
  `superSpeciality` enum('childPsychiatrist','medicallyComplicated') DEFAULT NULL,
  `provides` text COMMENT 'This will contain a serialized array for facilities provided by provider like Therapy or Medication etc.',
  `supportedLanguages` text COMMENT 'This will contain a serialised array of the language list that the provider supports',
  `messageForPatient` text COMMENT 'If the doctor has filled out a message when “Request initial consultation is clicked” show this message to the user and they must click on “I agree” to go the next page',
  `defaultEntriesCountToShowOnAppointmentPanel` int(3) DEFAULT '2',
  `defaultRecursionType` varchar(100) DEFAULT NULL,
  `PrimaryAvailabilityCalendar` enum('internal','google') DEFAULT NULL,
  `defaultRecursionDay` varchar(100) DEFAULT NULL,
  `defaultScBrainSize` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remindersBkp`
--

DROP TABLE IF EXISTS `remindersBkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remindersBkp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `trackId` varchar(255) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStatusAtTheTimeOfQueue` varchar(255) DEFAULT NULL COMMENT 'this is needed for such case where we need to remove reminders for cancelled events',
  `daysAheadReminder` tinyint(1) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned NOT NULL,
  `fullNameOfDoctor` varchar(255) DEFAULT NULL,
  `uidOfDoctorsAdmin` int(11) unsigned DEFAULT NULL,
  `fullNameOfDoctorsAdmin` varchar(255) DEFAULT NULL,
  `emailAddressOfDoctorsAdmin` varchar(255) DEFAULT NULL,
  `fromUID` int(11) unsigned DEFAULT NULL,
  `fromEmail` varchar(255) DEFAULT NULL,
  `fromFullName` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `subject` text,
  `messageHeader` text,
  `messageBody` text,
  `contentType` enum('text','html') NOT NULL DEFAULT 'text',
  `reminderChannel` enum('email','text','call') NOT NULL,
  `status` enum('processing','scheduled','sending','sent','failed','error') NOT NULL,
  `messageForAdmin` varchar(255) DEFAULT NULL,
  `timeToSend` datetime DEFAULT NULL,
  `scriptTookActionAt` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `emailReceivedByDA` enum('Not set','Yes','No') DEFAULT 'Not set',
  PRIMARY KEY (`id`),
  KEY `trackId` (`trackId`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `reminderTypeID` (`reminderTypeID`),
  KEY `fromUID` (`fromUID`)
) ENGINE=InnoDB AUTO_INCREMENT=33187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportMasterTable`
--

DROP TABLE IF EXISTS `reportMasterTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportMasterTable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reportName` varchar(255) NOT NULL,
  `tableName` varchar(255) NOT NULL,
  `updateAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roiPatientData`
--

DROP TABLE IF EXISTS `roiPatientData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roiPatientData` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueRoiId` varchar(36) DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL,
  `policyMasterID` tinyint(4) unsigned DEFAULT NULL,
  `roiUploadID` int(11) DEFAULT NULL,
  `roiFillableValues` text,
  `signature` blob,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isDiscontinued` enum('yes','no') NOT NULL DEFAULT 'no',
  `discontinuedText` text,
  `discontinuedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2271 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_roi` BEFORE INSERT ON `roiPatientData` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND   TABLE_NAME   = 'roiPatientData' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.publicUniqueRoiId IS NULL) THEN
    	SET NEW.publicUniqueRoiId = @P1;
    ELSEIF (NEW.publicUniqueRoiId = '') THEN
    	SET NEW.publicUniqueRoiId = @P1;  
	ELSE
    	SET NEW.publicUniqueRoiId = NEW.publicUniqueRoiId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rvuPointMaster`
--

DROP TABLE IF EXISTS `rvuPointMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rvuPointMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userRoleID` int(11) NOT NULL,
  `cptCodeID` int(11) DEFAULT NULL,
  `rvuPointPerCode` decimal(5,2) DEFAULT '0.00',
  `notes` text,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` int(11) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scBrainRecommendations`
--

DROP TABLE IF EXISTS `scBrainRecommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scBrainRecommendations` (
  `idOfRecommendation` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfScriptMakingTheRecommendation` varchar(255) NOT NULL,
  `textOfRecommendation` varchar(140) NOT NULL,
  `uidOfRecommendationMadeFor` int(10) unsigned NOT NULL,
  `timeRecommendationCreated` datetime NOT NULL,
  `timeZoneOfRecommendationCreated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idOfRecommendation`)
) ENGINE=InnoDB AUTO_INCREMENT=28983 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scPatientState`
--

DROP TABLE IF EXISTS `scPatientState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scPatientState` (
  `uidOfPatient` int(10) NOT NULL,
  `patientState` enum('matchingStarted','awaitingResponse','providerMatched','matchingComplete') NOT NULL DEFAULT 'matchingStarted',
  `locationChosen` int(10) DEFAULT NULL,
  `providerChosen` int(10) DEFAULT NULL,
  `providerMatched` int(10) DEFAULT NULL,
  `isMatchingRequired` enum('Yes','No') DEFAULT NULL,
  `listOfSlidesCompleted` text,
  UNIQUE KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secondaryRoleID`
--

DROP TABLE IF EXISTS `secondaryRoleID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondaryRoleID` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sectionsMaster`
--

DROP TABLE IF EXISTS `sectionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `pageUrl` varchar(255) DEFAULT NULL,
  `minSecurityLevelToAccess` int(5) unsigned DEFAULT NULL,
  `isDeleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: not deleted, 1: deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `selfHarmAttempts`
--

DROP TABLE IF EXISTS `selfHarmAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selfHarmAttempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `selfHarmType` enum('suicide','plannedSuicide','selfhurt') NOT NULL,
  `description` text,
  `howManyTimes` int(11) DEFAULT NULL,
  `mostResentAttempt` date DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` date DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `originId` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  `updatedAtTimezone` varchar(255) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `delStatus` int(11) NOT NULL DEFAULT '0',
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1194 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviceStatementsForEvent`
--

DROP TABLE IF EXISTS `serviceStatementsForEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceStatementsForEvent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) unsigned NOT NULL DEFAULT '0',
  `serviceStatementID` int(10) unsigned NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(3) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19759 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviceStatementsForEvent_bk_for_migration`
--

DROP TABLE IF EXISTS `serviceStatementsForEvent_bk_for_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceStatementsForEvent_bk_for_migration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceStatementID` int(10) unsigned NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `isDeleted` enum('No','Yes') NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8308 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviceStatementsMaster`
--

DROP TABLE IF EXISTS `serviceStatementsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceStatementsMaster` (
  `serviceStatementID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceStatement` longtext NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serviceStatementID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setScPrinterTimezone`
--

DROP TABLE IF EXISTS `setScPrinterTimezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setScPrinterTimezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(10) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `showHideOldAppList`
--

DROP TABLE IF EXISTS `showHideOldAppList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showHideOldAppList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionMasterId` int(11) NOT NULL,
  `oldAppName` varchar(150) DEFAULT NULL,
  `showHideOption` enum('yes','no') NOT NULL DEFAULT 'yes',
  `changedBy` int(11) unsigned DEFAULT NULL,
  `changedOn` datetime DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changedBy` (`changedBy`),
  CONSTRAINT `showHideOldAppList_ibfk_1` FOREIGN KEY (`changedBy`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `siteWideHelpMaster`
--

DROP TABLE IF EXISTS `siteWideHelpMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteWideHelpMaster` (
  `helpID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `context` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`helpID`),
  KEY `uid` (`uid`),
  KEY `helpID` (`helpID`),
  CONSTRAINT `siteWideHelpMaster_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `slabView`
--

DROP TABLE IF EXISTS `slabView`;
/*!50001 DROP VIEW IF EXISTS `slabView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `slabView` AS SELECT 
 1 AS `eventID`,
 1 AS `patientUID`,
 1 AS `scEmployeeUID`,
 1 AS `scEmployeeFullName`,
 1 AS `eventTypeName`,
 1 AS `allNotesAreLocked`,
 1 AS `eventStatusName`,
 1 AS `eventStartDateTime`,
 1 AS `dateDifference`,
 1 AS `minDate`,
 1 AS `slab`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `smsQueueOutgoing`
--

DROP TABLE IF EXISTS `smsQueueOutgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsQueueOutgoing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL COMMENT 'should be numbers only, having country code and phone number without any delimiter. otherwise notify developer by email.',
  `authID` varchar(255) NOT NULL DEFAULT 'MAMGU0MTC2ODG5YMRHMZ' COMMENT 'auth_id of plivo acount',
  `authToken` varchar(255) NOT NULL DEFAULT 'MGI0YWU4ZDM2ZTcyYzdhNjFlNjljOTg3MGI0ODNk' COMMENT 'auth_token of plivo account',
  `smsContent` text,
  `debugMode` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE' COMMENT 'will be used by developer for testing',
  `emergencyMessage` enum('Yes','No') NOT NULL DEFAULT 'No',
  `additionalInfo` text COMMENT 'info to debug if malformed entry happens',
  `respectiveDeveloper` varchar(255) DEFAULT NULL COMMENT 'to whom send email incase of malformed entry',
  `reminderID` int(11) unsigned DEFAULT NULL,
  `errorFound` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44084 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smsQueueOutgoing-bkp-12Apr2019`
--

DROP TABLE IF EXISTS `smsQueueOutgoing-bkp-12Apr2019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsQueueOutgoing-bkp-12Apr2019` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL COMMENT 'should be numbers only, having country code and phone number without any delimiter. otherwise notify developer by email.',
  `authID` varchar(255) NOT NULL DEFAULT 'MAMGU0MTC2ODG5YMRHMZ' COMMENT 'auth_id of plivo acount',
  `authToken` varchar(255) NOT NULL DEFAULT 'MGI0YWU4ZDM2ZTcyYzdhNjFlNjljOTg3MGI0ODNk' COMMENT 'auth_token of plivo account',
  `smsContent` text,
  `debugMode` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE' COMMENT 'will be used by developer for testing',
  `emergencyMessage` enum('Yes','No') NOT NULL DEFAULT 'No',
  `additionalInfo` text COMMENT 'info to debug if malformed entry happens',
  `respectiveDeveloper` varchar(255) DEFAULT NULL COMMENT 'to whom send email incase of malformed entry',
  `reminderID` int(11) unsigned DEFAULT NULL,
  `errorFound` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29966 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryChartStates`
--

DROP TABLE IF EXISTS `socialHistoryChartStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryChartStates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `trackerOptions` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_3` (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `id_4` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryCurrentStatus`
--

DROP TABLE IF EXISTS `socialHistoryCurrentStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryCurrentStatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) DEFAULT NULL,
  `originId` int(10) DEFAULT NULL,
  `socialHistoryUniqueId` varchar(36) DEFAULT NULL,
  `socialHistoryCurrentStatusMasterID` tinyint(4) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdTimeZone` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  `discontinuedByUid` int(11) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `socialHistoryCurrentStatusMasterId` (`socialHistoryCurrentStatusMasterID`),
  CONSTRAINT `socialHistoryCurrentStatus_ibfk_1` FOREIGN KEY (`socialHistoryCurrentStatusMasterID`) REFERENCES `socialHistoryCurrentStatusMasterTypes` (`id`),
  CONSTRAINT `socialHistoryCurrentStatus_ibfk_2` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18744 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_SHCS` BEFORE INSERT ON `socialHistoryCurrentStatus` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND TABLE_NAME = 'socialHistoryCurrentStatus' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.socialHistoryUniqueId IS NULL) THEN
    	SET NEW.socialHistoryUniqueId = @P1;
    ELSEIF (NEW.socialHistoryUniqueId = '') THEN
    	SET NEW.socialHistoryUniqueId = @P1;  
	ELSE
    	SET NEW.socialHistoryUniqueId = NEW.socialHistoryUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `socialHistoryCurrentStatusMasterTypes`
--

DROP TABLE IF EXISTS `socialHistoryCurrentStatusMasterTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryCurrentStatusMasterTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryCurrentStatus_bak`
--

DROP TABLE IF EXISTS `socialHistoryCurrentStatus_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryCurrentStatus_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `originId` int(10) DEFAULT NULL,
  `socialHistoryUniqueId` varchar(36) DEFAULT NULL,
  `socialHistoryCurrentStatusMasterID` tinyint(4) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdTimeZone` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  `discontinuedByUid` int(11) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `discountinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `socialHistoryCurrentStatusMasterId` (`socialHistoryCurrentStatusMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=18724 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryFamily`
--

DROP TABLE IF EXISTS `socialHistoryFamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryFamily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOnUID` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdTimezone` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedTimezone` varchar(255) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `isItLocked` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1593 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryFreeText`
--

DROP TABLE IF EXISTS `socialHistoryFreeText`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryFreeText` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOnUID` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdTimezone` varchar(255) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `isItLocked` varchar(10) DEFAULT NULL,
  `notes` text,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryMultiPointChild`
--

DROP TABLE IF EXISTS `socialHistoryMultiPointChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryMultiPointChild` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `timeValueType` enum('atAge','atYear','yearsAgo','date') DEFAULT NULL,
  `timeValue` varchar(128) NOT NULL,
  `startDate` varchar(255) NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the socialHistoryMultiPointChild is locked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` enum('No','Yes') NOT NULL,
  `created_by` int(11) NOT NULL,
  `notes` text NOT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `socialHistoryMultiPointChild_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryMultiPointEducation`
--

DROP TABLE IF EXISTS `socialHistoryMultiPointEducation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryMultiPointEducation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `timeValueType` enum('atAge','atYear','yearsAgo','date') DEFAULT NULL,
  `timeValue` varchar(128) NOT NULL,
  `startDate` varchar(255) NOT NULL,
  `endDate` varchar(255) NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the socialHistoryMultiPointEducation is locked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` enum('No','Yes') NOT NULL,
  `created_by` int(10) NOT NULL,
  `notes` text NOT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `socialHistoryMultiPointEducation_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryMultiPointEmployment`
--

DROP TABLE IF EXISTS `socialHistoryMultiPointEmployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryMultiPointEmployment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `timeValueType` enum('atAge','atYear','yearsAgo','date') DEFAULT NULL,
  `timeValue` varchar(128) DEFAULT NULL,
  `startDate` varchar(255) NOT NULL,
  `endDate` varchar(255) NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the socialHistoryMultiPointEmployment is locked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` enum('No','Yes') NOT NULL,
  `created_by` int(11) NOT NULL,
  `notes` text NOT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `socialHistoryMultiPointEmployment_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryMultiPointMarital`
--

DROP TABLE IF EXISTS `socialHistoryMultiPointMarital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryMultiPointMarital` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `timeValueType` enum('atAge','atYear','yearsAgo','date') DEFAULT NULL,
  `timeValue` varchar(128) NOT NULL,
  `startDate` varchar(255) NOT NULL,
  `endDate` varchar(255) NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the socialHistoryMultiPointMarital is locked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` enum('No','Yes') NOT NULL,
  `created_by` int(10) NOT NULL,
  `discontinuedByUID` int(11) NOT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `socialHistoryMultiPointMarital_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `socialHistoryOtherMajorLifeEvents`
--

DROP TABLE IF EXISTS `socialHistoryOtherMajorLifeEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialHistoryOtherMajorLifeEvents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `majorLifeEventUniqueId` varchar(36) DEFAULT NULL,
  `firstParentID` int(11) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `eventName` varchar(255) NOT NULL,
  `timeValueType` enum('atAge','atYear','yearsAgo','date') DEFAULT NULL,
  `timeValue` varchar(128) DEFAULT '',
  `notes` text,
  `description` text,
  `entryCreatedFrom` enum('intake_psychiatrist','intake_therapist','intake_rehab','') DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the socialHistoryOtherMajorLifeEvents is locked or not',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `deletedByUID` int(10) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `socialHistoryOtherMajorLifeEvents_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_SHOLME` BEFORE INSERT ON `socialHistoryOtherMajorLifeEvents` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND TABLE_NAME = 'socialHistoryOtherMajorLifeEvents' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.majorLifeEventUniqueId IS NULL) THEN
    	SET NEW.majorLifeEventUniqueId = @P1;
    ELSEIF (NEW.majorLifeEventUniqueId = '') THEN
    	SET NEW.majorLifeEventUniqueId = @P1;  
	ELSE
    	SET NEW.majorLifeEventUniqueId = NEW.majorLifeEventUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sonkaUserLocations`
--

DROP TABLE IF EXISTS `sonkaUserLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sonkaUserLocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL COMMENT 'db=DB_SC_Central ->locations',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialNeedsRequiredByPatient`
--

DROP TABLE IF EXISTS `specialNeedsRequiredByPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialNeedsRequiredByPatient` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `patientUid` int(10) NOT NULL,
  `specialRequirementInfo` text NOT NULL,
  `createdByUid` int(10) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sr_test`
--

DROP TABLE IF EXISTS `sr_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sr_test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `requestText` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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

--
-- Table structure for table `statusOfGoogleCalendarBySc`
--

DROP TABLE IF EXISTS `statusOfGoogleCalendarBySc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statusOfGoogleCalendarBySc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventID` int(11) DEFAULT NULL,
  `messageOfEvent` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3766640 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substanceAbuse`
--

DROP TABLE IF EXISTS `substanceAbuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substanceAbuse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `substanceName` varchar(128) DEFAULT NULL,
  `quantity` tinyint(4) unsigned DEFAULT NULL,
  `unit` varchar(150) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `createdById` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `originId` int(11) NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `graphColor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `substanceAbuse_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substanceAbuseNotes`
--

DROP TABLE IF EXISTS `substanceAbuseNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substanceAbuseNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `originId` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(255) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptoms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `symptomUniqueId` varchar(36) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `symptom` varchar(128) DEFAULT NULL,
  `severity` enum('None(0)','Mild(1)','Moderate(2)','Severe(3)') NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the symptoms is locked or not',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `createdByUid` (`createdByUid`),
  CONSTRAINT `symptoms_ibfk_1` FOREIGN KEY (`uidOfPatient`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1877 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_symptoms` BEFORE INSERT ON `symptoms` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND   TABLE_NAME   = 'symptoms' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.symptomUniqueId IS NULL) THEN
    	SET NEW.symptomUniqueId = @P1;
    ELSEIF (NEW.symptomUniqueId = '') THEN
    	SET NEW.symptomUniqueId = @P1;  
	ELSE
    	SET NEW.symptomUniqueId = NEW.symptomUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tblShowOnIpad`
--

DROP TABLE IF EXISTS `tblShowOnIpad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblShowOnIpad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorID` int(11) DEFAULT NULL,
  `patientIDToShowOnIpad` int(11) DEFAULT NULL,
  `panelIDToShowOnIpad` int(11) DEFAULT NULL,
  `sectionNameToShowOnIpad` varchar(100) DEFAULT 'myFile',
  `updated_at_datetime` datetime DEFAULT NULL,
  `updated_at_timezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teleHealthCoverageForPatient`
--

DROP TABLE IF EXISTS `teleHealthCoverageForPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teleHealthCoverageForPatient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) NOT NULL,
  `isTeleHealthCoverageAllowed` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  `detailedReason` text COLLATE utf8_unicode_ci,
  `uidMarkedBy` int(11) NOT NULL,
  `markedAt` datetime NOT NULL,
  `markedAtTimezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5053 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tempForNoteLockedAtImport`
--

DROP TABLE IF EXISTS `tempForNoteLockedAtImport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempForNoteLockedAtImport` (
  `eventID` int(11) NOT NULL,
  `dateTimeSAPNoteLockedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_payment_report`
--

DROP TABLE IF EXISTS `temp_payment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_payment_report` (
  `paymentTableId` int(11) unsigned NOT NULL DEFAULT '0',
  `cptCodeForAppointmentID` int(11) unsigned NOT NULL,
  `paymentAmountClaimedIncludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountClaimedForSCExcludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountReceived` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountBadDebt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transactionFee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tansactionID` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `paymentStatusID` tinyint(4) unsigned DEFAULT NULL,
  `paymentStatus` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentMethodID` tinyint(4) unsigned DEFAULT NULL,
  `paymentMethod` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentAccountThisPaymentIsBeingMadeFrom` varchar(255) NOT NULL DEFAULT '',
  `paymentLast4DigitChargedCreditCardNo` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `entityResponsibleToMakeThisPaymentID` tinyint(4) unsigned DEFAULT NULL,
  `entityResponsibleToMakeThisPayment` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `insuranceUIDOnCreationDateIfClaimFilingIsRequired` int(11) unsigned DEFAULT NULL,
  `nameOfInsuranceCompanyPaymentRecdFrom` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `eventId` int(11) unsigned DEFAULT NULL,
  `isCptLocked` enum('Yes','No') CHARACTER SET utf8,
  `isPaymentLocked` enum('Yes','No') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `cptCreatedAt` datetime DEFAULT NULL,
  `cptUpdatedAt` datetime DEFAULT NULL,
  `cptCreatedByUID` int(11) unsigned DEFAULT NULL,
  `cptUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentBadDebtUpdatedByUID` int(11) DEFAULT NULL,
  `paymentBadDebtUpdatedByName` text CHARACTER SET utf8 NOT NULL,
  `paymentBadDebtUpdatedOn` datetime DEFAULT NULL,
  `paymentBadDebtUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `paymentCreatedAt` datetime NOT NULL,
  `paymentUpdatedAt` datetime DEFAULT NULL,
  `paymentCreatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentUpdatedByUID` int(11) DEFAULT NULL,
  `financialInstitutionID` int(11) unsigned DEFAULT NULL,
  `quickbookStatus` enum('Step 1: Data not entered','Step 2: Data entered but not matching with financial institution','Step 3: Data entered and matching with financial institution') CHARACTER SET utf8 DEFAULT NULL,
  `cptCreatedByFullName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `cptUpdatedByFullName` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentCreatedByFullName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `paymentUpdatedByFullName` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `financialInstitutionName` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentNotes` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `dateTheMoneyComeIntoSCAccount` date DEFAULT NULL,
  `bankPostDateOfOfficeAlly` date DEFAULT NULL,
  `paymentStatusOfClaimFiledOnBehalfOfPatient` varchar(72) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `claimLastSubmittedOn` datetime DEFAULT NULL,
  `claimLastSubmittedOnTimeZone` varchar(255) DEFAULT NULL,
  `claimLastSubmittedByUID` int(11) DEFAULT NULL,
  `claimLastSubmittedByFullName` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testAllergi`
--

DROP TABLE IF EXISTS `testAllergi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testAllergi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `discontinuedOn` datetime DEFAULT NULL,
  `deletedOn` datetime DEFAULT NULL,
  `appointmentOn` datetime DEFAULT NULL,
  `firstParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeZoneMaster`
--

DROP TABLE IF EXISTS `timeZoneMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeZoneMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(100) NOT NULL,
  `timeZone` varchar(100) NOT NULL,
  `offset` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `unlockedReportSlab`
--

DROP TABLE IF EXISTS `unlockedReportSlab`;
/*!50001 DROP VIEW IF EXISTS `unlockedReportSlab`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unlockedReportSlab` AS SELECT 
 1 AS `eventID`,
 1 AS `patientUID`,
 1 AS `scEmployeeUID`,
 1 AS `scEmployeeFullName`,
 1 AS `eventTypeName`,
 1 AS `allNotesAreLocked`,
 1 AS `eventStatusName`,
 1 AS `eventStartDateTime`,
 1 AS `dateDifference`,
 1 AS `minDate`,
 1 AS `slab`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `unlocknotereport`
--

DROP TABLE IF EXISTS `unlocknotereport`;
/*!50001 DROP VIEW IF EXISTS `unlocknotereport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unlocknotereport` AS SELECT 
 1 AS `scEmployeeUID`,
 1 AS `roleName`,
 1 AS `scEmployeeFullName`,
 1 AS `minDate`,
 1 AS `totalAppointment`,
 1 AS `days14To27_total`,
 1 AS `days14To27`,
 1 AS `days28To44_total`,
 1 AS `days28To44`,
 1 AS `days45To59_total`,
 1 AS `days45To59`,
 1 AS `daysAfter60_total`,
 1 AS `daysAfter60`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `unlockreportmasterdata`
--

DROP TABLE IF EXISTS `unlockreportmasterdata`;
/*!50001 DROP VIEW IF EXISTS `unlockreportmasterdata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unlockreportmasterdata` AS SELECT 
 1 AS `eventID`,
 1 AS `patientUID`,
 1 AS `scEmployeeUID`,
 1 AS `scEmployeeFullName`,
 1 AS `eventTypeName`,
 1 AS `allNotesAreLocked`,
 1 AS `eventStatusName`,
 1 AS `eventStartDateTime`,
 1 AS `dateDifference`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `unsubscribeDetails`
--

DROP TABLE IF EXISTS `unsubscribeDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unsubscribeDetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeId` tinyint(4) unsigned NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `unsubscribedUID` int(11) unsigned NOT NULL,
  `unsubscribedByUID` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1479 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsubscribeDetailsCall`
--

DROP TABLE IF EXISTS `unsubscribeDetailsCall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unsubscribeDetailsCall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeId` tinyint(4) unsigned NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `unsubscribedUID` int(11) unsigned NOT NULL,
  `unsubscribedByUID` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsubscribeDetailsText`
--

DROP TABLE IF EXISTS `unsubscribeDetailsText`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unsubscribeDetailsText` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeId` tinyint(4) unsigned NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `unsubscribedUID` int(11) unsigned NOT NULL,
  `unsubscribedByUID` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userActiveTabDetails`
--

DROP TABLE IF EXISTS `userActiveTabDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userActiveTabDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `currentScreen` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userAssociationBetweenDoctorAndDoctorAdmin`
--

DROP TABLE IF EXISTS `userAssociationBetweenDoctorAndDoctorAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAssociationBetweenDoctorAndDoctorAdmin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfDoctor` int(11) unsigned NOT NULL,
  `uidOfDoctorsAdmin` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userAssociationMasterTypes`
--

DROP TABLE IF EXISTS `userAssociationMasterTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAssociationMasterTypes` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userAssociationRooms`
--

DROP TABLE IF EXISTS `userAssociationRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userAssociationRooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` enum('Active','Inactive','Rejected','Invited') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userChat`
--

DROP TABLE IF EXISTS `userChat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userChat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `senderId` int(11) unsigned NOT NULL,
  `receiverId` int(11) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userDateOfBirth`
--

DROP TABLE IF EXISTS `userDateOfBirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userDateOfBirth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `dateOfBirthNotes` text,
  `firstParentID` int(11) unsigned NOT NULL DEFAULT '0',
  `createdByUID` int(11) unsigned DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) unsigned DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `discontinuedByUID` int(11) unsigned DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15944 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userEmailAddressesExtraOverLoginEmail`
--

DROP TABLE IF EXISTS `userEmailAddressesExtraOverLoginEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userEmailAddressesExtraOverLoginEmail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT '0',
  `emailAddressTypeID` tinyint(4) unsigned DEFAULT '0' COMMENT 'type id comes from contactsEmailAddressMasterTypes',
  `emailAddress` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `notes` text NOT NULL,
  `discontinuedOnDate` datetime DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contactID` (`uid`),
  KEY `emailAddressTypeID` (`emailAddressTypeID`),
  CONSTRAINT `userEmailAddressesExtraOverLoginEmail_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `userEmailAddressesExtraOverLoginEmail_ibfk_2` FOREIGN KEY (`emailAddressTypeID`) REFERENCES `contactsEmailAddressMasterTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4016 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userGender`
--

DROP TABLE IF EXISTS `userGender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userGender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned NOT NULL,
  `genderTypeID` tinyint(1) DEFAULT NULL,
  `firstParentID` int(11) unsigned NOT NULL DEFAULT '0',
  `createdByUID` int(11) unsigned DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) unsigned DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `deletedByUID` int(11) unsigned DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10205 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userOptimisedProfileImages`
--

DROP TABLE IF EXISTS `userOptimisedProfileImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userOptimisedProfileImages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `userOptimisedProfileImages_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COMMENT='created for ad pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userOtherDetails`
--

DROP TABLE IF EXISTS `userOtherDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userOtherDetails` (
  `userID` int(11) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceUserDetailsUrl` text,
  `fetchedRowData` longtext,
  `createdOnDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userPhoneExtension`
--

DROP TABLE IF EXISTS `userPhoneExtension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userPhoneExtension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `extension` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userPhoneNumbers`
--

DROP TABLE IF EXISTS `userPhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userPhoneNumbers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT '0',
  `phoneNumberTypeID` tinyint(4) unsigned DEFAULT '0' COMMENT 'the type id comes from contactPhoneNumberMasterTypes',
  `phoneNumber` varchar(128) NOT NULL DEFAULT '',
  `countryDialCode` varchar(4) DEFAULT '1',
  `discontinuedOnDate` datetime DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phoneNumberTypeID` (`phoneNumberTypeID`),
  KEY `contactID` (`uid`),
  FULLTEXT KEY `phone_search` (`phoneNumber`),
  CONSTRAINT `userPhoneNumbers_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `userPhoneNumbers_ibfk_2` FOREIGN KEY (`phoneNumberTypeID`) REFERENCES `contactPhoneNumberMasterTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20350 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6. Doc: Say a user has a cell phone and a work phone. So for that uid there will be 2 entries in the userPhoneNumbers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userProfileImages`
--

DROP TABLE IF EXISTS `userProfileImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfileImages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profileImageUniqueId` varchar(36) DEFAULT NULL,
  `uid` int(11) unsigned NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `userProfileImages_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2163 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 28/7';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_UPI` BEFORE INSERT ON `userProfileImages` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND TABLE_NAME = 'userProfileImages' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.profileImageUniqueId IS NULL) THEN
    	SET NEW.profileImageUniqueId = @P1;
    ELSEIF (NEW.profileImageUniqueId = '') THEN
    	SET NEW.profileImageUniqueId = @P1;  
	ELSE
    	SET NEW.profileImageUniqueId = NEW.profileImageUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userProfileImagesBack`
--

DROP TABLE IF EXISTS `userProfileImagesBack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfileImagesBack` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1882 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 28/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userReportCustomFilters`
--

DROP TABLE IF EXISTS `userReportCustomFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userReportCustomFilters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(255) DEFAULT NULL,
  `noOfTimesAccessed` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userReportSummaries`
--

DROP TABLE IF EXISTS `userReportSummaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userReportSummaries` (
  `summaryReportID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportName` varchar(255) NOT NULL,
  `customReportID` int(11) unsigned NOT NULL,
  `fieldNamesUsedInSummaryReportStoredAsCSV` text NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`summaryReportID`),
  KEY `customReportID` (`customReportID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userReportSummaryStates`
--

DROP TABLE IF EXISTS `userReportSummaryStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userReportSummaryStates` (
  `stateID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `summaryReportID` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateConfigurationObject` text NOT NULL,
  `isStateLocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userRoleTypesMaster`
--

DROP TABLE IF EXISTS `userRoleTypesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRoleTypesMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `securityLevel` int(5) DEFAULT '1',
  `roleType` enum('Internal','External') NOT NULL DEFAULT 'External',
  `companyID` int(11) unsigned DEFAULT NULL,
  `isThisUserTypeInternal` tinyint(1) unsigned DEFAULT '0' COMMENT '0 is for no 1 is for yes',
  `isThisAllowedForPublicAccess` enum('yes','no') NOT NULL DEFAULT 'no',
  `isBookingAndPatientHourAllowed` enum('yes','no') NOT NULL DEFAULT 'no',
  `isPubliclyViewable` enum('yes','no') NOT NULL DEFAULT 'no',
  `isPatientLoginAllowed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `isEmrLoginAllowed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `userRoleTypesMaster_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSelectedOptionForIntakeDetailData`
--

DROP TABLE IF EXISTS `userSelectedOptionForIntakeDetailData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSelectedOptionForIntakeDetailData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `hasDiagnosisData` enum('yes','no') DEFAULT NULL,
  `hasSuicideData` enum('yes','no') DEFAULT NULL,
  `hasPlannedSuicideData` enum('yes','no') DEFAULT NULL,
  `hasSelfHurtData` enum('yes','no') DEFAULT NULL,
  `hasMentalHealthData` enum('yes','no') DEFAULT NULL,
  `hasHospitalisationData` enum('yes','no') DEFAULT NULL,
  `hasVisitedPsychiatristData` enum('yes','no') DEFAULT NULL,
  `hasVisitedTherapistData` enum('yes','no') DEFAULT NULL,
  `hasRehabData` enum('yes','no') DEFAULT NULL,
  `hasPsychotropicMedData` enum('yes','no') DEFAULT NULL,
  `hasAllergicMedData` enum('yes','no') DEFAULT NULL,
  `isCurrentlyEmployed` enum('yes','no') DEFAULT NULL,
  `hasMajorLifeEventData` enum('yes','no') DEFAULT NULL,
  `hasInsuranceInContract` enum('yes','no') DEFAULT NULL,
  `canClimbStairs` enum('yes','no') DEFAULT NULL,
  `initialPurposeOfVisit` text,
  `onGoingMedications` text,
  `pastMedications` text,
  `specialNeedsRequired` enum('yes','no') DEFAULT NULL,
  `additionalNote` varchar(255) DEFAULT NULL,
  `canAffordCopay` enum('yes','no') DEFAULT NULL,
  `isTmsOnly` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSession`
--

DROP TABLE IF EXISTS `userSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSession` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `localIpAddress` varchar(32) NOT NULL,
  `sessionData` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1237 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSettings`
--

DROP TABLE IF EXISTS `userSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `settingsTypeId` int(11) NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSettingsTypeMaster`
--

DROP TABLE IF EXISTS `userSettingsTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSettingsTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingsTypeName` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSocialAccountInformation`
--

DROP TABLE IF EXISTS `userSocialAccountInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSocialAccountInformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `socialAccountTypeId` int(11) DEFAULT NULL,
  `socialAccountAddress` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `discontinuedOnDate` datetime DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userSocialAddressMasterType`
--

DROP TABLE IF EXISTS `userSocialAddressMasterType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSocialAddressMasterType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userStreetAddresses`
--

DROP TABLE IF EXISTS `userStreetAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userStreetAddresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) unsigned DEFAULT NULL,
  `publicUniqueAddressId` varchar(36) DEFAULT NULL,
  `uid` int(11) unsigned DEFAULT '0',
  `createdById` int(11) DEFAULT NULL,
  `addressLine1` varchar(128) DEFAULT NULL,
  `addressLine2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `zipCode` varchar(128) DEFAULT NULL,
  `streetAddressTypeID` tinyint(4) unsigned DEFAULT NULL COMMENT 'For typeID use: contactStreetAddressMasterTypes',
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `originId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contactID` (`uid`),
  KEY `streetAddressTypeID` (`streetAddressTypeID`),
  CONSTRAINT `userStreetAddresses_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `userStreetAddresses_ibfk_2` FOREIGN KEY (`streetAddressTypeID`) REFERENCES `contactStreetAddressMasterTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15460 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_streetAddress` BEFORE INSERT ON `userStreetAddresses` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND   TABLE_NAME   = 'userStreetAddresses' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.publicUniqueAddressId IS NULL) THEN
    	SET NEW.publicUniqueAddressId = @P1;
    ELSEIF (NEW.publicUniqueAddressId = '') THEN
    	SET NEW.publicUniqueAddressId = @P1;  
	ELSE
    	SET NEW.publicUniqueAddressId = NEW.publicUniqueAddressId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userStreetAddresses_bak`
--

DROP TABLE IF EXISTS `userStreetAddresses_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userStreetAddresses_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueAddressId` varchar(36) DEFAULT NULL,
  `uid` int(11) unsigned DEFAULT '0',
  `createdById` int(11) DEFAULT NULL,
  `addressLine1` varchar(128) DEFAULT NULL,
  `addressLine2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `zipCode` varchar(128) DEFAULT NULL,
  `streetAddressTypeID` tinyint(4) unsigned DEFAULT NULL COMMENT 'For typeID use: contactStreetAddressMasterTypes',
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `originId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contactID` (`uid`),
  KEY `streetAddressTypeID` (`streetAddressTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15163 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userWhereAbouts`
--

DROP TABLE IF EXISTS `userWhereAbouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userWhereAbouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `whereAboutMasterID` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userWhereAboutsMaster`
--

DROP TABLE IF EXISTS `userWhereAboutsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userWhereAboutsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `facebookID` text,
  `emailAddress` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `wikiUid` varchar(255) DEFAULT NULL,
  `wikiPass` varchar(255) DEFAULT NULL,
  `roleID` tinyint(4) unsigned DEFAULT NULL,
  `genderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `namePrefix` varchar(100) DEFAULT NULL,
  `nameSuffix` varchar(256) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not deleted, 1: deleted',
  `companyID` int(11) unsigned DEFAULT NULL,
  `emailValidatedOn` datetime DEFAULT NULL,
  `emailValidationCode` varchar(6) DEFAULT NULL,
  `forgotPasswordAccessToken` varchar(255) DEFAULT NULL,
  `allowedToLogin` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allowedToMasterDB` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dateOfBirth` date DEFAULT NULL COMMENT 'On 19th sept 2015 changed from 2 seperate tables to reduce complexity',
  `dateOfBirthNotes` text,
  `preferredTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isCachedForUserReport` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not Cached, 1 = Cached',
  `numberOfLoggedIn` tinyint(11) NOT NULL DEFAULT '0',
  `lastLoggedIn` datetime DEFAULT NULL,
  `timeZoneAbbreviationOfLastLoggedIn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `TFASecretCode` varchar(50) DEFAULT NULL,
  `receiveOTPByUsing` enum('GoogleAuthenticator','SMS') DEFAULT NULL,
  `uidOfTFASecretCodeUpdatedBy` int(11) unsigned DEFAULT NULL,
  `forgotPasswordSecretCodeViaSMS` varchar(6) DEFAULT NULL,
  `isIntakeComplete` enum('yes','no') DEFAULT NULL,
  `isUserVisibleOnBookingSystem` enum('Yes','No') NOT NULL DEFAULT 'No',
  `googleCalendarID` varchar(255) DEFAULT NULL,
  `otpForMobileAppsLogin` varchar(10) DEFAULT NULL,
  `otpForMobileAppsLastUpdatedOn` datetime DEFAULT NULL,
  `associatedCalendarColorCode` varchar(10) DEFAULT NULL,
  `sentDataToGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `recieveDataFromGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `snapShot` longblob,
  `snapShotTime` datetime DEFAULT NULL,
  `skypeId` varchar(255) DEFAULT NULL,
  `facetimeId` varchar(255) DEFAULT NULL,
  `userSignUpSource` varchar(100) DEFAULT NULL,
  `temporaryDisableTFACurrentStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailAddress` (`emailAddress`),
  KEY `roleID` (`roleID`),
  KEY `companyID` (`companyID`),
  KEY `genderTypeID` (`genderTypeID`),
  FULLTEXT KEY `name search` (`firstName`,`middleName`,`lastName`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `userRoleTypesMaster` (`id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`genderTypeID`) REFERENCES `genderTypesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20597 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/7';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_user` BEFORE INSERT ON `users` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SCEMR_PROD' AND   TABLE_NAME   = 'users' INTO @P2;
    
    Select uuid_v4_custom(@P2) INTO @P1;
    
    IF (NEW.publicUniqueId IS NULL) THEN
    	SET NEW.publicUniqueId = @P1;
    ELSEIF (NEW.publicUniqueId = '') THEN
    	SET NEW.publicUniqueId = @P1;  
	ELSE
    	SET NEW.publicUniqueId = NEW.publicUniqueId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usersAdditionalInfo`
--

DROP TABLE IF EXISTS `usersAdditionalInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersAdditionalInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `isLoginSuspendedDueToManyAttempts` enum('Yes','No') NOT NULL DEFAULT 'No',
  `rocketChatId` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersAssociatedWithDoctor`
--

DROP TABLE IF EXISTS `usersAssociatedWithDoctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersAssociatedWithDoctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfDoctor` int(11) unsigned NOT NULL,
  `uidOfAssociatedUser` int(11) unsigned NOT NULL,
  `userAssociationMasterTypeId` tinyint(3) unsigned NOT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfDoctor` (`uidOfDoctor`),
  KEY `uidOfAssociatedUser` (`uidOfAssociatedUser`),
  KEY `userAssociationMasterTypeId` (`userAssociationMasterTypeId`),
  CONSTRAINT `usersAssociatedWithDoctor_ibfk_1` FOREIGN KEY (`uidOfDoctor`) REFERENCES `users` (`id`),
  CONSTRAINT `usersAssociatedWithDoctor_ibfk_2` FOREIGN KEY (`uidOfAssociatedUser`) REFERENCES `users` (`id`),
  CONSTRAINT `usersAssociatedWithDoctor_ibfk_3` FOREIGN KEY (`userAssociationMasterTypeId`) REFERENCES `userAssociationMasterTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2189 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersCareerHighlights`
--

DROP TABLE IF EXISTS `usersCareerHighlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersCareerHighlights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `uidOfLoggedInUser` int(11) unsigned NOT NULL,
  `detail` varchar(255) NOT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `idOfLoggedInUser` (`uidOfLoggedInUser`),
  CONSTRAINT `usersCareerHighlights_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  CONSTRAINT `usersCareerHighlights_ibfk_2` FOREIGN KEY (`uidOfLoggedInUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersExpertiseDetails`
--

DROP TABLE IF EXISTS `usersExpertiseDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersExpertiseDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `uidOfLoggedInUser` int(11) unsigned NOT NULL,
  `detail` varchar(255) NOT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `idOfLoggedInUser` (`uidOfLoggedInUser`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersMeditationsHistory`
--

DROP TABLE IF EXISTS `usersMeditationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersMeditationsHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `meditateTime` int(11) NOT NULL,
  `sessionOm` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersRooms`
--

DROP TABLE IF EXISTS `usersRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersRooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomName` varchar(255) NOT NULL,
  `createdUserId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersTempForImportFromDrupal`
--

DROP TABLE IF EXISTS `usersTempForImportFromDrupal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersTempForImportFromDrupal` (
  `uid` int(11) unsigned NOT NULL,
  `drupalUID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `videosReportCustomFilters`
--

DROP TABLE IF EXISTS `videosReportCustomFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videosReportCustomFilters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(255) DEFAULT NULL,
  `noOfTimesAccessed` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voiceCallQueueOutgoing`
--

DROP TABLE IF EXISTS `voiceCallQueueOutgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voiceCallQueueOutgoing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL DEFAULT '16506902362' COMMENT '16506902362 is SC phone number',
  `destination` varchar(255) DEFAULT NULL COMMENT 'should be numbers only, having country code and phone number without any delimiter. otherwise notify developer by email.',
  `answerURL` varchar(255) DEFAULT NULL COMMENT 'must have an api that is able to generate xml to be used by plivo',
  `answerMethod` enum('GET','POST') NOT NULL DEFAULT 'GET',
  `authID` varchar(255) NOT NULL DEFAULT 'MAMGU0MTC2ODG5YMRHMZ' COMMENT 'auth_id of plivo acount',
  `authToken` varchar(255) NOT NULL DEFAULT 'MGI0YWU4ZDM2ZTcyYzdhNjFlNjljOTg3MGI0ODNk' COMMENT 'auth_token of plivo account',
  `debugMode` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE' COMMENT 'will be used by developer for testing',
  `emergencyMessage` enum('Yes','No') NOT NULL DEFAULT 'No',
  `additionalInfo` text COMMENT 'info to debug if malformed entry happens',
  `respectiveDeveloper` varchar(255) DEFAULT NULL COMMENT 'to whom send email incase of malformed entry',
  `reminderID` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1625 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voiceCallQueueOutgoingForTest`
--

DROP TABLE IF EXISTS `voiceCallQueueOutgoingForTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voiceCallQueueOutgoingForTest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL DEFAULT '16506902362' COMMENT '16506902362 is SC phone number',
  `destination` varchar(255) DEFAULT NULL COMMENT 'should be numbers only, having country code and phone number without any delimiter. otherwise notify developer by email.',
  `answerURL` varchar(255) DEFAULT NULL COMMENT 'must have an api that is able to generate xml to be used by plivo',
  `answerMethod` enum('GET','POST') NOT NULL DEFAULT 'GET',
  `authID` varchar(255) NOT NULL DEFAULT 'MAMGU0MTC2ODG5YMRHMZ' COMMENT 'auth_id of plivo acount',
  `authToken` varchar(255) NOT NULL DEFAULT 'MGI0YWU4ZDM2ZTcyYzdhNjFlNjljOTg3MGI0ODNk' COMMENT 'auth_token of plivo account',
  `debugMode` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE' COMMENT 'will be used by developer for testing',
  `emergencyMessage` enum('Yes','No') NOT NULL DEFAULT 'No',
  `additionalInfo` text COMMENT 'info to debug if malformed entry happens',
  `respectiveDeveloper` varchar(255) DEFAULT NULL COMMENT 'to whom send email incase of malformed entry',
  `reminderID` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voiceCallQueueOutgoingLogTable`
--

DROP TABLE IF EXISTS `voiceCallQueueOutgoingLogTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voiceCallQueueOutgoingLogTable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idOfVoiceCallQueue` int(11) unsigned NOT NULL,
  `source` varchar(255) NOT NULL DEFAULT '16506902362' COMMENT '16506902362 is SC phone number',
  `destination` varchar(255) DEFAULT NULL COMMENT 'should be numbers only, having country code and phone number without any delimiter. otherwise notify developer by email.',
  `answerURL` varchar(255) DEFAULT NULL COMMENT 'must have an api that is able to generate xml to be used by plivo',
  `answerMethod` enum('GET','POST') NOT NULL DEFAULT 'GET',
  `authID` varchar(255) NOT NULL DEFAULT 'MAMGU0MTC2ODG5YMRHMZ' COMMENT 'auth_id of plivo acount',
  `authToken` varchar(255) NOT NULL DEFAULT 'MGI0YWU4ZDM2ZTcyYzdhNjFlNjljOTg3MGI0ODNk' COMMENT 'auth_token of plivo account',
  `debugMode` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE' COMMENT 'will be used by developer for testing',
  `emergencyMessage` enum('Yes','No') NOT NULL DEFAULT 'No',
  `additionalInfo` text COMMENT 'info to debug if malformed entry happens',
  `respectiveDeveloper` varchar(255) DEFAULT NULL COMMENT 'to whom send email incase of malformed entry',
  `reminderID` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataString` text,
  `plivoApiResponse` text,
  `reminderStatusUpdation` enum('na','sent','failed') NOT NULL DEFAULT 'na',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21158 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zocdocRequestInfo`
--

DROP TABLE IF EXISTS `zocdocRequestInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zocdocRequestInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestReceivedOn` datetime NOT NULL,
  `summary` text,
  `googleCalendarID` text,
  `googleCalendarEventID` text,
  `doctorEmail` text,
  `status` text,
  `startDate` text,
  `endDate` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4584894 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `DB_SCEMR_PROD`
--

USE `DB_SCEMR_PROD`;

--
-- Final view structure for view `allUsersWithDateOfBirth`
--

/*!50001 DROP VIEW IF EXISTS `allUsersWithDateOfBirth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `allUsersWithDateOfBirth` AS select concat_ws(' ',`DB_SCEMR_PROD`.`users`.`firstName`,`DB_SCEMR_PROD`.`users`.`lastName`,convert(date_format(`dob`.`dateOfBirth`,'(%M %D %Y)') using utf8)) AS `name`,`DB_SCEMR_PROD`.`users`.`id` AS `id`,`DB_SCEMR_PROD`.`users`.`roleID` AS `typeId`,`DB_SCEMR_PROD`.`users`.`googleCalendarID` AS `googleCalendarID`,`DB_SCEMR_PROD`.`userRoleTypesMaster`.`name` AS `typeOfResource`,`dob`.`dateOfBirth` AS `dateOfBirth` from ((`DB_SCEMR_PROD`.`users` left join `DB_SCEMR_PROD`.`userRoleTypesMaster` on((`DB_SCEMR_PROD`.`users`.`roleID` = `DB_SCEMR_PROD`.`userRoleTypesMaster`.`id`))) left join (select `DB_SCEMR_PROD`.`userDateOfBirth`.`id` AS `id`,`DB_SCEMR_PROD`.`userDateOfBirth`.`uidOfPatient` AS `uidOfPatient`,`DB_SCEMR_PROD`.`userDateOfBirth`.`dateOfBirth` AS `dateOfBirth` from `DB_SCEMR_PROD`.`userDateOfBirth` where `DB_SCEMR_PROD`.`userDateOfBirth`.`id` in (select max(`DB_SCEMR_PROD`.`userDateOfBirth`.`id`) from (`DB_SCEMR_PROD`.`userDateOfBirth` left join `DB_SCEMR_PROD`.`users` on((`DB_SCEMR_PROD`.`users`.`id` = `DB_SCEMR_PROD`.`userDateOfBirth`.`uidOfPatient`))) where ((`DB_SCEMR_PROD`.`users`.`isDeleted` = 0) and (`DB_SCEMR_PROD`.`users`.`companyID` = 3)) group by `DB_SCEMR_PROD`.`userDateOfBirth`.`firstParentID`)) `dob` on((`dob`.`uidOfPatient` = `DB_SCEMR_PROD`.`users`.`id`))) where ((`DB_SCEMR_PROD`.`users`.`isDeleted` = 0) and (`DB_SCEMR_PROD`.`users`.`companyID` = 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `careGiverName`
--

/*!50001 DROP VIEW IF EXISTS `careGiverName`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `careGiverName` AS (select `DB_SCEMR_PROD`.`users`.`firstName` AS `careGiverFName`,`DB_SCEMR_PROD`.`users`.`lastName` AS `careGiverLName`,`DB_SC_CareTeam`.`careTeam`.`uidOfCareGiver` AS `uidOfCareGiver`,`DB_SC_CareTeam`.`careTeam`.`uidOfPatient` AS `uidOfPatient` from (`DB_SC_CareTeam`.`careTeam` join `DB_SCEMR_PROD`.`users` on((`DB_SCEMR_PROD`.`users`.`id` = `DB_SC_CareTeam`.`careTeam`.`uidOfCareGiver`))) where (`DB_SC_CareTeam`.`careTeam`.`id` in (select max(`DB_SC_CareTeam`.`careTeam`.`id`) from (`DB_SC_CareTeam`.`careTeam` left join `DB_SC_CareTeam`.`careTeamMasterDesignations` `careTeamMD` on((`DB_SC_CareTeam`.`careTeam`.`careTeamDesignationID` = `careTeamMD`.`id`))) where (`careTeamMD`.`designationName` = 'Primary team') group by `DB_SC_CareTeam`.`careTeam`.`firstParentId`) and isnull(`DB_SC_CareTeam`.`careTeam`.`deletedOnDateTime`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `careteamStatus`
--

/*!50001 DROP VIEW IF EXISTS `careteamStatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `careteamStatus` AS (select `finaldata`.`eventID` AS `eventID`,`finaldata`.`eventStatusID` AS `eventStatusID`,`finaldata`.`attendeeId` AS `attendeeId`,`finaldata`.`host` AS `host`,`finaldata`.`hostRoleId` AS `hostRoleId`,`finaldata`.`hostRole` AS `hostRole`,`finaldata`.`startDateTime` AS `startDateTime`,`DB_SCEMR_PROD`.`careTeam`.`id` AS `id`,(case when isnull(`DB_SCEMR_PROD`.`careTeam`.`id`) then 0 else 1 end) AS `careteamflag` from (((select `newdata`.`eventID` AS `eventID`,`newdata`.`eventStatusID` AS `eventStatusID`,`newdata`.`uid` AS `attendeeId`,`newdata`.`host` AS `host`,`newdata`.`roleID` AS `hostRoleId`,`DB_SCEMR_PROD`.`userRoleTypesMaster`.`name` AS `hostRole`,`newdata`.`startDateTime` AS `startDateTime` from (((select `testdata`.`eventID` AS `eventID`,`testdata`.`uid` AS `uid`,`testdata`.`startDateTime` AS `startDateTime`,`testdata`.`eventStatusID` AS `eventStatusID`,`testdata`.`host` AS `host`,`DB_SCEMR_PROD`.`users`.`roleID` AS `roleID` from (((select `dummydata`.`eventID` AS `eventID`,`dummydata`.`uid` AS `uid`,`dummydata`.`startDateTime` AS `startDateTime`,`dummydata`.`eventStatusID` AS `eventStatusID`,`DB_SCEMR_PROD`.`remEventAttendees`.`uid` AS `host` from (((select `DB_SCEMR_PROD`.`remEvents`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`remEventAttendees`.`uid` AS `uid`,`DB_SCEMR_PROD`.`remEvents`.`startDateTime` AS `startDateTime`,`remEventStatusChronology`.`eventStatusID` AS `eventStatusID` from ((`DB_SCEMR_PROD`.`remEventAttendees` join `DB_SCEMR_PROD`.`remEvents` on(((`DB_SCEMR_PROD`.`remEvents`.`eventID` = `DB_SCEMR_PROD`.`remEventAttendees`.`eventID`) and (`DB_SCEMR_PROD`.`remEventAttendees`.`isThisUserHost` = 0)))) join (select `DB_SCEMR_PROD`.`remEventStatusChronology`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`remEventStatusChronology`.`eventStatusID` AS `eventStatusID` from `DB_SCEMR_PROD`.`remEventStatusChronology` where `DB_SCEMR_PROD`.`remEventStatusChronology`.`id` in (select max(`DB_SCEMR_PROD`.`remEventStatusChronology`.`id`) from `DB_SCEMR_PROD`.`remEventStatusChronology` group by `DB_SCEMR_PROD`.`remEventStatusChronology`.`eventID`)) `remEventStatusChronology` on((`remEventStatusChronology`.`eventID` = `DB_SCEMR_PROD`.`remEventAttendees`.`eventID`))) where ((`DB_SCEMR_PROD`.`remEvents`.`eventTypeID` = 1) and (`remEventStatusChronology`.`eventStatusID` in (2,5,6))) order by `DB_SCEMR_PROD`.`remEventAttendees`.`uid`,`DB_SCEMR_PROD`.`remEvents`.`startDateTime`)) `dummydata` left join `DB_SCEMR_PROD`.`remEventAttendees` on(((`dummydata`.`eventID` = `DB_SCEMR_PROD`.`remEventAttendees`.`eventID`) and (`DB_SCEMR_PROD`.`remEventAttendees`.`isThisUserHost` = 1)))))) `testdata` join `DB_SCEMR_PROD`.`users` on((`DB_SCEMR_PROD`.`users`.`id` = `testdata`.`host`))))) `newdata` join `DB_SCEMR_PROD`.`userRoleTypesMaster` on((`DB_SCEMR_PROD`.`userRoleTypesMaster`.`id` = `newdata`.`roleID`))))) `finaldata` left join `DB_SCEMR_PROD`.`careTeam` on(((`DB_SCEMR_PROD`.`careTeam`.`uidOfCareGiver` = `finaldata`.`host`) and (`DB_SCEMR_PROD`.`careTeam`.`uidOfPatient` = `finaldata`.`attendeeId`)))) order by `finaldata`.`attendeeId`,`finaldata`.`startDateTime`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cashFlowView`
--

/*!50001 DROP VIEW IF EXISTS `cashFlowView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `cashFlowView` AS select `u`.`id` AS `providerId`,concat(ifnull(`u`.`namePrefix`,''),' ',`u`.`firstName`,' ',`u`.`lastName`) AS `providerName`,(case when (`ca`.`cptCodeID` <> 62) then `cp`.`paymentAmountInSCAccount` else 0 end) AS `CashInflow`,(case when (`ca`.`cptCodeID` = 62) then `cp`.`paymentAmountInSCAccount` else 0 end) AS `CashOutflow`,`ca`.`cptCodeID` AS `cptCodeID`,`e`.`startDateTime` AS `startDateTime` from ((((`cptCodesPayment` `cp` left join `cptCodesForAnAppointment` `ca` on((`ca`.`id` = `cp`.`cptCodeForAppointmentID`))) left join `remEvents` `e` on((`e`.`eventID` = `ca`.`eventID`))) left join `remEventAttendees` `ea` on(((`e`.`eventID` = `ea`.`eventID`) and (`ea`.`isThisUserHost` = 1)))) left join `users` `u` on((`ea`.`uid` = `u`.`id`))) where (`cp`.`paymentStatusID` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patientFeedbackForReport`
--

/*!50001 DROP VIEW IF EXISTS `patientFeedbackForReport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `patientFeedbackForReport` AS (select `f`.`id` AS `id`,`f`.`eventId` AS `eventId`,`f`.`doctorDaId` AS `doctorDaId`,`f`.`rateYourExpeWithYourDoctOrTherapist` AS `rateYourExpeWithYourDoctOrTherapist`,`f`.`rateYourOverallExpecWithDoctorsAssis` AS `rateYourOverallExpecWithDoctorsAssis`,`f`.`commentsFeedbackSuggestion` AS `commentsFeedbackSuggestion`,`f`.`timeZone` AS `timeZone`,`f`.`dateTime` AS `dateTime`,`user`.`uid` AS `patientId`,`provider`.`uid` AS `providerId` from ((`patientFeedbackSurvey` `f` join `remEventAttendees` `user` on(((`user`.`eventID` = `f`.`eventId`) and (`user`.`isThisUserHost` = 0)))) join `remEventAttendees` `provider` on(((`provider`.`eventID` = `f`.`eventId`) and (`provider`.`isThisUserHost` = 1))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paymentReportView`
--

/*!50001 DROP VIEW IF EXISTS `paymentReportView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `paymentReportView` AS (select `payment`.`id` AS `paymentTableId`,`payment`.`cptCodeForAppointmentID` AS `cptCodeForAppointmentID`,`payment`.`totalPaymentClaimedIncludingFinanceCharges` AS `paymentAmountClaimedIncludingFinanceCharges`,`payment`.`paymentClaimedForSCAcExcludingFinanceCharges` AS `paymentAmountClaimedForSCExcludingFinanceCharges`,`payment`.`paymentAmountInSCAccount` AS `paymentAmountReceived`,`payment`.`badDebtAmount` AS `paymentAmountBadDebt`,ifnull(`payment`.`transactionFee`,0) AS `transactionFee`,`payment`.`transactionIdProvidedByPaymentGateway` AS `tansactionID`,`payment`.`paymentStatusID` AS `paymentStatusID`,ifnull(`paymentStatus`.`statusAndMethod`,'') AS `paymentStatus`,`payment`.`paymentMethodID` AS `paymentMethodID`,ifnull(`paymentMethod`.`statusAndMethod`,'') AS `paymentMethod`,ifnull(`paymentAccount`.`name`,'') AS `paymentAccountThisPaymentIsBeingMadeFrom`,ifnull(right(`payment`.`chargedCCNumber`,4),NULL) AS `paymentLast4DigitChargedCreditCardNo`,`payment`.`entityResponsibleToMakeThisPayment` AS `entityResponsibleToMakeThisPaymentID`,ifnull(`entityResponsibleToSC`.`name`,'') AS `entityResponsibleToMakeThisPayment`,`payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired` AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,ifnull(concat_ws(' ',`insuranceCompany`.`firstName`,`insuranceCompany`.`lastName`),'') AS `nameOfInsuranceCompanyPaymentRecdFrom`,`cptCodesForAnAppointment`.`eventID` AS `eventId`,`cptCodesForAnAppointment`.`isThisEntityLockedAndHenceNonEditable` AS `isCptLocked`,`payment`.`isThisEntityLockedAndHenceNonEditable` AS `isPaymentLocked`,`cptCodesForAnAppointment`.`created_at` AS `cptCreatedAt`,`cptCodesForAnAppointment`.`updated_at` AS `cptUpdatedAt`,`cptCodesForAnAppointment`.`created_by` AS `cptCreatedByUID`,`cptCodesForAnAppointment`.`updated_by` AS `cptUpdatedByUID`,`payment`.`badDebtEntryDoneBy` AS `paymentBadDebtUpdatedByUID`,ifnull(concat_ws(' ',`badDebtUpdatedBy`.`firstName`,`badDebtUpdatedBy`.`middleName`,`badDebtUpdatedBy`.`lastName`),'') AS `paymentBadDebtUpdatedByName`,`payment`.`badDebtEntryDoneOn` AS `paymentBadDebtUpdatedOn`,`payment`.`badDebtEntryDoneOnTimeZone` AS `paymentBadDebtUpdatedOnTimeZone`,`payment`.`created_on` AS `paymentCreatedAt`,`payment`.`updated_on` AS `paymentUpdatedAt`,`payment`.`created_by` AS `paymentCreatedByUID`,`payment`.`updated_by` AS `paymentUpdatedByUID`,`payment`.`financialInstitutionID` AS `financialInstitutionID`,`payment`.`quickbookStatus` AS `quickbookStatus`,concat_ws(' ',`cptCreatedBy`.`firstName`,`cptCreatedBy`.`lastName`) AS `cptCreatedByFullName`,ifnull(concat_ws(' ',`cptUpdatedBy`.`firstName`,`cptUpdatedBy`.`lastName`),'') AS `cptUpdatedByFullName`,concat_ws(' ',`paymentCreatedBy`.`firstName`,`paymentCreatedBy`.`lastName`) AS `paymentCreatedByFullName`,ifnull(concat_ws(' ',`paymentUpdatedBy`.`firstName`,`paymentUpdatedBy`.`lastName`),'') AS `paymentUpdatedByFullName`,ifnull(concat_ws(' ',`financialInstitution`.`firstName`,`financialInstitution`.`lastName`),'') AS `financialInstitutionName`,ifnull(`payment`.`notes`,'') AS `paymentNotes`,`payment`.`dateOfTransactionInSCAccount` AS `dateTheMoneyComeIntoSCAccount`,`payment`.`bankPostDateOfOfficeAlly` AS `bankPostDateOfOfficeAlly`,ifnull(`payment`.`statusOfClaimFiledOnBehalfOfPatient`,'') AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,`payment`.`claimLastSubmittedOn` AS `claimLastSubmittedOn`,`payment`.`claimLastSubmittedOnTimeZone` AS `claimLastSubmittedOnTimeZone`,`payment`.`claimLastSubmittedBy` AS `claimLastSubmittedByUID`,ifnull(concat_ws(' ',`claimLastSubmittedBy`.`firstName`,`claimLastSubmittedBy`.`middleName`,`claimLastSubmittedBy`.`lastName`),'') AS `claimLastSubmittedByFullName` from (((((((((((((`cptCodesPayment` `payment` left join `paymentAccountBeingMadeMaster` `paymentAccount` on((`paymentAccount`.`id` = `payment`.`accountThisPaymentIsBeingMadeToID`))) left join `cptCodesPaymentStatusMaster` `paymentStatus` on((`paymentStatus`.`id` = `payment`.`paymentStatusID`))) left join `cptCodesPaymentMethodMaster` `paymentMethod` on((`paymentMethod`.`id` = `payment`.`paymentMethodID`))) left join `cptPaymentEntityResponsibleToSCMaster` `entityResponsibleToSC` on((`entityResponsibleToSC`.`id` = `payment`.`entityResponsibleToMakeThisPayment`))) left join `users` `insuranceCompany` on((`insuranceCompany`.`id` = `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired`))) left join `users` `cptCreatedBy` on((`cptCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `cptUpdatedBy` on((`cptUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `paymentCreatedBy` on((`paymentCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `paymentUpdatedBy` on((`paymentUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `financialInstitution` on((`financialInstitution`.`id` = `payment`.`financialInstitutionID`))) left join `users` `badDebtUpdatedBy` on((`badDebtUpdatedBy`.`id` = `payment`.`badDebtEntryDoneBy`))) left join `users` `claimLastSubmittedBy` on((`claimLastSubmittedBy`.`id` = `payment`.`claimLastSubmittedBy`))) left join `cptCodesForAnAppointment` on((`cptCodesForAnAppointment`.`id` = `payment`.`cptCodeForAppointmentID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment_report_latest`
--

/*!50001 DROP VIEW IF EXISTS `payment_report_latest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_report_latest` AS (select `payment`.`id` AS `paymentTableId`,`payment`.`cptCodeForAppointmentID` AS `cptCodeForAppointmentID`,`payment`.`totalPaymentClaimedIncludingFinanceCharges` AS `paymentAmountClaimedIncludingFinanceCharges`,`payment`.`paymentClaimedForSCAcExcludingFinanceCharges` AS `paymentAmountClaimedForSCExcludingFinanceCharges`,`payment`.`paymentAmountInSCAccount` AS `paymentAmountReceived`,`payment`.`badDebtAmount` AS `paymentAmountBadDebt`,ifnull(`payment`.`transactionFee`,0) AS `transactionFee`,`payment`.`transactionIdProvidedByPaymentGateway` AS `tansactionID`,`payment`.`paymentStatusID` AS `paymentStatusID`,ifnull(`paymentStatus`.`statusAndMethod`,'') AS `paymentStatus`,`payment`.`paymentMethodID` AS `paymentMethodID`,ifnull(`paymentMethod`.`statusAndMethod`,'') AS `paymentMethod`,ifnull(`paymentAccount`.`name`,'') AS `paymentAccountThisPaymentIsBeingMadeFrom`,ifnull(right(`payment`.`chargedCCNumber`,4),NULL) AS `paymentLast4DigitChargedCreditCardNo`,`payment`.`entityResponsibleToMakeThisPayment` AS `entityResponsibleToMakeThisPaymentID`,ifnull(`entityResponsibleToSC`.`name`,'') AS `entityResponsibleToMakeThisPayment`,`payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired` AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,ifnull(concat_ws(' ',`insuranceCompany`.`firstName`,`insuranceCompany`.`lastName`),'') AS `nameOfInsuranceCompanyPaymentRecdFrom`,`cptCodesForAnAppointment`.`eventID` AS `eventId`,`cptCodesForAnAppointment`.`isThisEntityLockedAndHenceNonEditable` AS `isCptLocked`,`payment`.`isThisEntityLockedAndHenceNonEditable` AS `isPaymentLocked`,`cptCodesForAnAppointment`.`created_at` AS `cptCreatedAt`,`cptCodesForAnAppointment`.`updated_at` AS `cptUpdatedAt`,`cptCodesForAnAppointment`.`created_by` AS `cptCreatedByUID`,`cptCodesForAnAppointment`.`updated_by` AS `cptUpdatedByUID`,`payment`.`badDebtEntryDoneBy` AS `paymentBadDebtUpdatedByUID`,ifnull(concat_ws(' ',`badDebtUpdatedBy`.`firstName`,`badDebtUpdatedBy`.`middleName`,`badDebtUpdatedBy`.`lastName`),'') AS `paymentBadDebtUpdatedByName`,`payment`.`badDebtEntryDoneOn` AS `paymentBadDebtUpdatedOn`,`payment`.`badDebtEntryDoneOnTimeZone` AS `paymentBadDebtUpdatedOnTimeZone`,`payment`.`created_on` AS `paymentCreatedAt`,`payment`.`updated_on` AS `paymentUpdatedAt`,`payment`.`created_by` AS `paymentCreatedByUID`,`payment`.`updated_by` AS `paymentUpdatedByUID`,`payment`.`financialInstitutionID` AS `financialInstitutionID`,`payment`.`quickbookStatus` AS `quickbookStatus`,concat_ws(' ',`cptCreatedBy`.`firstName`,`cptCreatedBy`.`lastName`) AS `cptCreatedByFullName`,ifnull(concat_ws(' ',`cptUpdatedBy`.`firstName`,`cptUpdatedBy`.`lastName`),'') AS `cptUpdatedByFullName`,concat_ws(' ',`paymentCreatedBy`.`firstName`,`paymentCreatedBy`.`lastName`) AS `paymentCreatedByFullName`,ifnull(concat_ws(' ',`paymentUpdatedBy`.`firstName`,`paymentUpdatedBy`.`lastName`),'') AS `paymentUpdatedByFullName`,ifnull(concat_ws(' ',`financialInstitution`.`firstName`,`financialInstitution`.`lastName`),'') AS `financialInstitutionName`,ifnull(`payment`.`notes`,'') AS `paymentNotes`,`payment`.`dateOfTransactionInSCAccount` AS `dateTheMoneyComeIntoSCAccount`,`payment`.`bankPostDateOfOfficeAlly` AS `bankPostDateOfOfficeAlly`,ifnull(`payment`.`statusOfClaimFiledOnBehalfOfPatient`,'') AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,`payment`.`claimLastSubmittedOn` AS `claimLastSubmittedOn`,`payment`.`claimLastSubmittedOnTimeZone` AS `claimLastSubmittedOnTimeZone`,`payment`.`claimLastSubmittedBy` AS `claimLastSubmittedByUID`,ifnull(concat_ws(' ',`claimLastSubmittedBy`.`firstName`,`claimLastSubmittedBy`.`middleName`,`claimLastSubmittedBy`.`lastName`),'') AS `claimLastSubmittedByFullName` from (((((((((((((`cptCodesPayment` `payment` left join `paymentAccountBeingMadeMaster` `paymentAccount` on((`paymentAccount`.`id` = `payment`.`accountThisPaymentIsBeingMadeToID`))) left join `cptCodesPaymentStatusMaster` `paymentStatus` on((`paymentStatus`.`id` = `payment`.`paymentStatusID`))) left join `cptCodesPaymentMethodMaster` `paymentMethod` on((`paymentMethod`.`id` = `payment`.`paymentMethodID`))) left join `cptPaymentEntityResponsibleToSCMaster` `entityResponsibleToSC` on((`entityResponsibleToSC`.`id` = `payment`.`entityResponsibleToMakeThisPayment`))) left join `users` `insuranceCompany` on((`insuranceCompany`.`id` = `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired`))) left join `users` `cptCreatedBy` on((`cptCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `cptUpdatedBy` on((`cptUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `paymentCreatedBy` on((`paymentCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `paymentUpdatedBy` on((`paymentUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `financialInstitution` on((`financialInstitution`.`id` = `payment`.`financialInstitutionID`))) left join `users` `badDebtUpdatedBy` on((`badDebtUpdatedBy`.`id` = `payment`.`badDebtEntryDoneBy`))) left join `users` `claimLastSubmittedBy` on((`claimLastSubmittedBy`.`id` = `payment`.`claimLastSubmittedBy`))) left join `cptCodesForAnAppointment` on((`cptCodesForAnAppointment`.`id` = `payment`.`cptCodeForAppointmentID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment_report_latest1`
--

/*!50001 DROP VIEW IF EXISTS `payment_report_latest1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_report_latest1` AS (select `payment`.`id` AS `paymentTableId`,`payment`.`cptCodeForAppointmentID` AS `cptCodeForAppointmentID`,`payment`.`totalPaymentClaimedIncludingFinanceCharges` AS `paymentAmountClaimedIncludingFinanceCharges`,`payment`.`paymentClaimedForSCAcExcludingFinanceCharges` AS `paymentAmountClaimedForSCExcludingFinanceCharges`,`payment`.`paymentAmountInSCAccount` AS `paymentAmountReceived`,`payment`.`badDebtAmount` AS `paymentAmountBadDebt`,ifnull(`payment`.`transactionFee`,0) AS `transactionFee`,`payment`.`transactionIdProvidedByPaymentGateway` AS `tansactionID`,`payment`.`paymentStatusID` AS `paymentStatusID`,ifnull(`paymentStatus`.`statusAndMethod`,'') AS `paymentStatus`,`payment`.`paymentMethodID` AS `paymentMethodID`,ifnull(`paymentMethod`.`statusAndMethod`,'') AS `paymentMethod`,ifnull(`paymentAccount`.`name`,'') AS `paymentAccountThisPaymentIsBeingMadeFrom`,ifnull(right(`payment`.`chargedCCNumber`,4),NULL) AS `paymentLast4DigitChargedCreditCardNo`,`payment`.`entityResponsibleToMakeThisPayment` AS `entityResponsibleToMakeThisPaymentID`,ifnull(`entityResponsibleToSC`.`name`,'') AS `entityResponsibleToMakeThisPayment`,`payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired` AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,ifnull(concat_ws(' ',`insuranceCompany`.`firstName`,`insuranceCompany`.`lastName`),'') AS `nameOfInsuranceCompanyPaymentRecdFrom`,`cptCodesForAnAppointment`.`eventID` AS `eventId`,`cptCodesForAnAppointment`.`isThisEntityLockedAndHenceNonEditable` AS `isCptLocked`,`payment`.`isThisEntityLockedAndHenceNonEditable` AS `isPaymentLocked`,`cptCodesForAnAppointment`.`created_at` AS `cptCreatedAt`,`cptCodesForAnAppointment`.`updated_at` AS `cptUpdatedAt`,`cptCodesForAnAppointment`.`created_by` AS `cptCreatedByUID`,`cptCodesForAnAppointment`.`updated_by` AS `cptUpdatedByUID`,`payment`.`badDebtEntryDoneBy` AS `paymentBadDebtUpdatedByUID`,ifnull(concat_ws(' ',`badDebtUpdatedBy`.`firstName`,`badDebtUpdatedBy`.`middleName`,`badDebtUpdatedBy`.`lastName`),'') AS `paymentBadDebtUpdatedByName`,`payment`.`badDebtEntryDoneOn` AS `paymentBadDebtUpdatedOn`,`payment`.`badDebtEntryDoneOnTimeZone` AS `paymentBadDebtUpdatedOnTimeZone`,`payment`.`created_on` AS `paymentCreatedAt`,`payment`.`updated_on` AS `paymentUpdatedAt`,`payment`.`created_by` AS `paymentCreatedByUID`,`payment`.`updated_by` AS `paymentUpdatedByUID`,`payment`.`financialInstitutionID` AS `financialInstitutionID`,`payment`.`quickbookStatus` AS `quickbookStatus`,concat_ws(' ',`cptCreatedBy`.`firstName`,`cptCreatedBy`.`lastName`) AS `cptCreatedByFullName`,ifnull(concat_ws(' ',`cptUpdatedBy`.`firstName`,`cptUpdatedBy`.`lastName`),'') AS `cptUpdatedByFullName`,concat_ws(' ',`paymentCreatedBy`.`firstName`,`paymentCreatedBy`.`lastName`) AS `paymentCreatedByFullName`,ifnull(concat_ws(' ',`paymentUpdatedBy`.`firstName`,`paymentUpdatedBy`.`lastName`),'') AS `paymentUpdatedByFullName`,ifnull(concat_ws(' ',`financialInstitution`.`firstName`,`financialInstitution`.`lastName`),'') AS `financialInstitutionName`,ifnull(`payment`.`notes`,'') AS `paymentNotes`,`payment`.`dateOfTransactionInSCAccount` AS `dateTheMoneyComeIntoSCAccount`,`payment`.`bankPostDateOfOfficeAlly` AS `bankPostDateOfOfficeAlly`,ifnull(`payment`.`statusOfClaimFiledOnBehalfOfPatient`,'') AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,`payment`.`claimLastSubmittedOn` AS `claimLastSubmittedOn`,`payment`.`claimLastSubmittedOnTimeZone` AS `claimLastSubmittedOnTimeZone`,`payment`.`claimLastSubmittedBy` AS `claimLastSubmittedByUID`,ifnull(concat_ws(' ',`claimLastSubmittedBy`.`firstName`,`claimLastSubmittedBy`.`middleName`,`claimLastSubmittedBy`.`lastName`),'') AS `claimLastSubmittedByFullName` from (((((((((((((`cptCodesPayment` `payment` left join `paymentAccountBeingMadeMaster` `paymentAccount` on((`paymentAccount`.`id` = `payment`.`accountThisPaymentIsBeingMadeToID`))) left join `cptCodesPaymentStatusMaster` `paymentStatus` on((`paymentStatus`.`id` = `payment`.`paymentStatusID`))) left join `cptCodesPaymentMethodMaster` `paymentMethod` on((`paymentMethod`.`id` = `payment`.`paymentMethodID`))) left join `cptPaymentEntityResponsibleToSCMaster` `entityResponsibleToSC` on((`entityResponsibleToSC`.`id` = `payment`.`entityResponsibleToMakeThisPayment`))) left join `users` `insuranceCompany` on((`insuranceCompany`.`id` = `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired`))) left join `users` `cptCreatedBy` on((`cptCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `cptUpdatedBy` on((`cptUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `paymentCreatedBy` on((`paymentCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `paymentUpdatedBy` on((`paymentUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `financialInstitution` on((`financialInstitution`.`id` = `payment`.`financialInstitutionID`))) left join `users` `badDebtUpdatedBy` on((`badDebtUpdatedBy`.`id` = `payment`.`badDebtEntryDoneBy`))) left join `users` `claimLastSubmittedBy` on((`claimLastSubmittedBy`.`id` = `payment`.`claimLastSubmittedBy`))) left join `cptCodesForAnAppointment` on((`cptCodesForAnAppointment`.`id` = `payment`.`cptCodeForAppointmentID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payment_report_latest2`
--

/*!50001 DROP VIEW IF EXISTS `payment_report_latest2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_report_latest2` AS select `payment`.`id` AS `paymentID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID` AS `eventID`,`eventdetails`.`eventTypeName` AS `eventTypeName`,'' AS `eventStatusName`,`eventdetails`.`uidOfCreatedBy` AS `uidOfCreatedBy`,`eventdetails`.`fullNameOfCreatedBy` AS `fullNameOfCreatedBy`,`eventdetails`.`startDateTime` AS `startDateTime`,`eventdetails`.`endDateTime` AS `endDateTime`,`eventdetails`.`duration` AS `durationInMinute`,`eventdetails`.`companyID` AS `companyID`,`eventdetails`.`lockStatus` AS `isEventLocked`,`eventdetails`.`assetID` AS `assetID`,'' AS `assetName`,`eventdetails`.`billingStatus` AS `billingStatus`,`payment`.`cptCodeForAppointmentID` AS `cptCodeForAppointmentID`,`cptDetails`.`cptCodeName` AS `cptCodeName`,`cptDetails`.`cptCodeID` AS `cptCodeID`,`payment`.`totalPaymentClaimedIncludingFinanceCharges` AS `paymentAmountClaimedIncludingFinanceCharges`,`payment`.`paymentClaimedForSCAcExcludingFinanceCharges` AS `paymentAmountClaimedForSCExcludingFinanceCharges`,ifnull(`payment`.`transactionFee`,0) AS `paymentAmountTransactionFee`,`payment`.`transactionIdProvidedByPaymentGateway` AS `paymentMerchantOneTransactionID`,ifnull(`paymentAccount`.`name`,'') AS `paymentAccountThisPaymentIsBeingMadeFrom`,ifnull(right(`payment`.`chargedCCNumber`,4),NULL) AS `paymentLast4DigitChargedCreditCardNo`,`payment`.`paymentAmountInSCAccount` AS `paymentAmountReceived`,`payment`.`badDebtAmount` AS `paymentAmountBadDebt`,(`payment`.`totalPaymentClaimedIncludingFinanceCharges` - ifnull(`payment`.`transactionFee`,0)) AS `paymentAmountRemaining`,ifnull(`paymentStatus`.`statusAndMethod`,'') AS `paymentStatus`,ifnull(`paymentMethod`.`statusAndMethod`,'') AS `paymentMethod`,`payment`.`entityResponsibleToMakeThisPayment` AS `entityResponsibleToMakeThisPaymentID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`isThisEntityLockedAndHenceNonEditable` AS `isCptLocked`,`payment`.`isThisEntityLockedAndHenceNonEditable` AS `isPaymentLocked`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`created_at` AS `cptCreatedAt`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`created_by` AS `cptCreatedByUID`,concat_ws(' ',`cptCreatedBy`.`firstName`,`cptCreatedBy`.`lastName`) AS `cptCreatedByFullName`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`updated_at` AS `cptUpdatedAt`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`updated_by` AS `cptUpdatedByUID`,ifnull(concat_ws(' ',`cptUpdatedBy`.`firstName`,`cptUpdatedBy`.`lastName`),'') AS `cptUpdatedByFullName`,`payment`.`badDebtEntryDoneOn` AS `paymentBadDebtUpdatedOn`,`payment`.`badDebtEntryDoneOnTimeZone` AS `paymentBadDebtUpdatedOnTimeZone`,`payment`.`badDebtEntryDoneBy` AS `paymentBadDebtUpdatedByUID`,ifnull(concat_ws(' ',`badDebtUpdatedBy`.`firstName`,`badDebtUpdatedBy`.`middleName`,`badDebtUpdatedBy`.`lastName`),'') AS `paymentBadDebtUpdatedByName`,`payment`.`created_on` AS `paymentCreatedAt`,`payment`.`created_by` AS `paymentCreatedByUID`,concat_ws(' ',`paymentCreatedBy`.`firstName`,`paymentCreatedBy`.`lastName`) AS `paymentCreatedByFullName`,`payment`.`updated_on` AS `paymentUpdatedAt`,`payment`.`updated_by` AS `paymentUpdatedByUID`,ifnull(concat_ws(' ',`paymentUpdatedBy`.`firstName`,`paymentUpdatedBy`.`lastName`),'') AS `paymentUpdatedByFullName`,`payment`.`financialInstitutionID` AS `financialInstitutionID`,ifnull(concat_ws(' ',`financialInstitution`.`firstName`,`financialInstitution`.`lastName`),'') AS `financialInstitutionName`,`payment`.`quickbookStatus` AS `quickbookStatus`,ifnull(`payment`.`notes`,'') AS `paymentNotes`,`payment`.`dateOfTransactionInSCAccount` AS `dateTheMoneyComeIntoSCAccount`,`payment`.`bankPostDateOfOfficeAlly` AS `bankPostDateOfOfficeAlly`,ifnull(`payment`.`statusOfClaimFiledOnBehalfOfPatient`,'') AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,(case when (`payment`.`entityResponsibleToMakeThisPayment` <> 1) then ifnull(concat_ws(' ',`insuranceCompany`.`firstName`,`insuranceCompany`.`lastName`),'') else NULL end) AS `nameOfInsuranceCompanyPaymentRecdFrom`,(case when (`payment`.`entityResponsibleToMakeThisPayment` <> 1) then `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired` else NULL end) AS `uidOfInsuranceCompanyPaymentRecdFrom`,`payment`.`claimLastSubmittedOn` AS `claimLastSubmittedOn`,`payment`.`claimLastSubmittedOnTimeZone` AS `claimLastSubmittedOnTimeZone`,`payment`.`claimLastSubmittedBy` AS `claimLastSubmittedByUID`,ifnull(concat_ws(' ',`claimLastSubmittedBy`.`firstName`,`claimLastSubmittedBy`.`middleName`,`claimLastSubmittedBy`.`lastName`),'') AS `claimLastSubmittedByFullName`,`cptDetails`.`cptAmountExpected` AS `cptAmountExpected`,`cptDetails`.`cptAmountReceived` AS `cptAmountReceived`,`cptDetails`.`cptAmountBadDebt` AS `cptAmountBadDebt`,`cptDetails`.`cptAmountRemaining` AS `cptAmountRemaining` from (((((((((((((((`DB_SCEMR_PROD`.`cptCodesPayment` `payment` left join `DB_SCEMR_PROD`.`paymentAccountBeingMadeMaster` `paymentAccount` on((`paymentAccount`.`id` = `payment`.`accountThisPaymentIsBeingMadeToID`))) left join `DB_SCEMR_PROD`.`cptCodesPaymentStatusMaster` `paymentStatus` on((`paymentStatus`.`id` = `payment`.`paymentStatusID`))) left join `DB_SCEMR_PROD`.`cptCodesPaymentMethodMaster` `paymentMethod` on((`paymentMethod`.`id` = `payment`.`paymentMethodID`))) left join `DB_SCEMR_PROD`.`cptPaymentEntityResponsibleToSCMaster` `entityResponsibleToSC` on((`entityResponsibleToSC`.`id` = `payment`.`entityResponsibleToMakeThisPayment`))) left join `DB_SCEMR_PROD`.`users` `insuranceCompany` on((`insuranceCompany`.`id` = `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired`))) left join `DB_SCEMR_PROD`.`users` `cptCreatedBy` on((`cptCreatedBy`.`id` = `payment`.`created_by`))) left join `DB_SCEMR_PROD`.`users` `cptUpdatedBy` on((`cptUpdatedBy`.`id` = `payment`.`updated_by`))) left join `DB_SCEMR_PROD`.`users` `paymentCreatedBy` on((`paymentCreatedBy`.`id` = `payment`.`created_by`))) left join `DB_SCEMR_PROD`.`users` `paymentUpdatedBy` on((`paymentUpdatedBy`.`id` = `payment`.`updated_by`))) left join `DB_SCEMR_PROD`.`users` `financialInstitution` on((`financialInstitution`.`id` = `payment`.`financialInstitutionID`))) left join `DB_SCEMR_PROD`.`users` `badDebtUpdatedBy` on((`badDebtUpdatedBy`.`id` = `payment`.`badDebtEntryDoneBy`))) left join `DB_SCEMR_PROD`.`users` `claimLastSubmittedBy` on((`claimLastSubmittedBy`.`id` = `payment`.`claimLastSubmittedBy`))) left join `DB_SCEMR_PROD`.`cptCodesForAnAppointment` on((`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`id` = `payment`.`cptCodeForAppointmentID`))) left join (select `cpt`.`cptAmountExpected` AS `cptAmountExpected`,`cpt`.`cptAmountReceived` AS `cptAmountReceived`,`cpt`.`cptAmountBadDebt` AS `cptAmountBadDebt`,`cpt`.`eventID` AS `eventID`,`cpt`.`cptCodeID` AS `cptCodeID`,`cpt`.`cptCodeName` AS `cptCodeName`,(`cpt`.`cptAmountExpected` - (`cpt`.`cptAmountReceived` + `cpt`.`cptAmountBadDebt`)) AS `cptAmountRemaining` from (select `DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeAmountExpectedAsPerContractOnCodingDate` AS `cptAmountExpected`,round(sum(`DB_SCEMR_PROD`.`cptCodesPayment`.`paymentAmountInSCAccount`),2) AS `cptAmountReceived`,round(sum(`DB_SCEMR_PROD`.`cptCodesPayment`.`badDebtAmount`),2) AS `cptAmountBadDebt`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeID` AS `cptCodeID`,`DB_SCEMR_PROD`.`cptCodesMaster`.`name` AS `cptCodeName` from ((`DB_SCEMR_PROD`.`cptCodesForAnAppointment` join `DB_SCEMR_PROD`.`cptCodesPayment` on((`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`id` = `DB_SCEMR_PROD`.`cptCodesPayment`.`cptCodeForAppointmentID`))) left join `DB_SCEMR_PROD`.`cptCodesMaster` on((`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeID` = `DB_SCEMR_PROD`.`cptCodesMaster`.`id`))) group by `DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeID`) `cpt`) `cptDetails` on(((`payment`.`cptCodeForAppointmentID` = `cptDetails`.`cptCodeID`) and (`cptDetails`.`eventID` is not null) and (`cptDetails`.`cptCodeID` is not null)))) left join (select `events`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`remForEventTypeAppointmentDetails`.`billingStatusOfThisAppointment` AS `billingStatus`,`mEventType`.`name` AS `eventTypeName`,`events`.`uidOfCreatedBy` AS `uidOfCreatedBy`,concat_ws(' ',`eventUsers`.`firstName`,`eventUsers`.`lastName`) AS `fullNameOfCreatedBy`,`events`.`startDateTime` AS `startDateTime`,`events`.`endDateTime` AS `endDateTime`,`events`.`companyID` AS `companyID`,timestampdiff(MINUTE,`events`.`startDateTime`,`events`.`endDateTime`) AS `duration`,`events`.`isItLocked` AS `lockStatus`,`eventAsset`.`assetID` AS `assetID` from ((((`DB_SCEMR_PROD`.`remEvents` `events` join `DB_SCEMR_PROD`.`users` `eventUsers` on((`events`.`uidOfCreatedBy` = `eventUsers`.`id`))) join `DB_SCEMR_PROD`.`remMasterEventTypes` `mEventType` on((`events`.`eventTypeID` = `mEventType`.`id`))) left join `DB_SCEMR_PROD`.`remEventAssets` `eventAsset` on((`eventAsset`.`eventID` = `events`.`eventID`))) join `DB_SCEMR_PROD`.`remForEventTypeAppointmentDetails` on((`DB_SCEMR_PROD`.`remForEventTypeAppointmentDetails`.`eventID` = `events`.`eventID`))) order by `events`.`eventID`) `eventdetails` on((`eventdetails`.`eventID` = `DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `providerunlocknotedetails`
--

/*!50001 DROP VIEW IF EXISTS `providerunlocknotedetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `providerunlocknotedetails` AS (select `unlockedReportSlab`.`scEmployeeUID` AS `scEmployeeUID`,`unlockedReportSlab`.`eventID` AS `eventId`,`unlockedReportSlab`.`eventStartDateTime` AS `eventStartDateTime`,`unlockedReportSlab`.`slab` AS `slab` from `DB_SCEMR_PROD`.`unlockedReportSlab` where (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes') order by `unlockedReportSlab`.`scEmployeeUID`,`unlockedReportSlab`.`eventStartDateTime`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `slabView`
--

/*!50001 DROP VIEW IF EXISTS `slabView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `slabView` AS (select `mainData`.`eventID` AS `eventID`,`mainData`.`patientUID` AS `patientUID`,`mainData`.`scEmployeeUID` AS `scEmployeeUID`,`mainData`.`scEmployeeFullName` AS `scEmployeeFullName`,`mainData`.`eventTypeName` AS `eventTypeName`,`mainData`.`allNotesAreLocked` AS `allNotesAreLocked`,`mainData`.`eventStatusName` AS `eventStatusName`,`mainData`.`eventStartDateTime` AS `eventStartDateTime`,`mainData`.`dateDifference` AS `dateDifference`,`subData`.`minDate` AS `minDate`,(case when (`mainData`.`dateDifference` between 14 and 27) then '14-27' when (`mainData`.`dateDifference` between 28 and 44) then '28-44' when (`mainData`.`dateDifference` between 45 and 59) then '45-59' when (`mainData`.`dateDifference` >= 60) then 'after60' end) AS `slab` from (`DB_SCEMR_PROD`.`unlockreportmasterdata` `mainData` join (select `unlockreportmasterdata`.`scEmployeeUID` AS `scEmployeeUID`,min(cast(`unlockreportmasterdata`.`eventStartDateTime` as date)) AS `minDate` from `DB_SCEMR_PROD`.`unlockreportmasterdata` where ((`unlockreportmasterdata`.`allNotesAreLocked` <> 'Yes') and (`unlockreportmasterdata`.`dateDifference` > 13)) group by `unlockreportmasterdata`.`scEmployeeUID`) `subData` on((`mainData`.`scEmployeeUID` = `subData`.`scEmployeeUID`))) where (`mainData`.`eventStartDateTime` >= `subData`.`minDate`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unlockedReportSlab`
--

/*!50001 DROP VIEW IF EXISTS `unlockedReportSlab`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `unlockedReportSlab` AS (select `mainData`.`eventID` AS `eventID`,`mainData`.`patientUID` AS `patientUID`,`mainData`.`scEmployeeUID` AS `scEmployeeUID`,`mainData`.`scEmployeeFullName` AS `scEmployeeFullName`,`mainData`.`eventTypeName` AS `eventTypeName`,`mainData`.`allNotesAreLocked` AS `allNotesAreLocked`,`mainData`.`eventStatusName` AS `eventStatusName`,`mainData`.`eventStartDateTime` AS `eventStartDateTime`,`mainData`.`dateDifference` AS `dateDifference`,`subData`.`minDate` AS `minDate`,(case when (`mainData`.`dateDifference` between 14 and 27) then '14-27' when (`mainData`.`dateDifference` between 28 and 44) then '28-44' when (`mainData`.`dateDifference` between 45 and 59) then '45-59' when (`mainData`.`dateDifference` >= 60) then 'after60' end) AS `slab` from (`DB_SCEMR_PROD`.`unlockreportmasterdata` `mainData` join (select `unlockreportmasterdata`.`scEmployeeUID` AS `scEmployeeUID`,min(cast(`unlockreportmasterdata`.`eventStartDateTime` as date)) AS `minDate` from `DB_SCEMR_PROD`.`unlockreportmasterdata` where ((`unlockreportmasterdata`.`allNotesAreLocked` <> 'Yes') and (`unlockreportmasterdata`.`dateDifference` > 13)) group by `unlockreportmasterdata`.`scEmployeeUID`) `subData` on((`mainData`.`scEmployeeUID` = `subData`.`scEmployeeUID`))) where (`mainData`.`eventStartDateTime` >= `subData`.`minDate`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unlocknotereport`
--

/*!50001 DROP VIEW IF EXISTS `unlocknotereport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `unlocknotereport` AS (select `doctorDetail`.`id` AS `scEmployeeUID`,(case when (`doctorDetail`.`roleID` = 7) then 'Doctor' else 'Therapist' end) AS `roleName`,`doctorDetail`.`fullName` AS `scEmployeeFullName`,ifnull(cast(`reportData`.`minDate` as date),'') AS `minDate`,ifnull(`reportData`.`total`,0) AS `totalAppointment`,ifnull(`reportData`.`slab14`,0) AS `days14To27_total`,ifnull(((`reportData`.`slab14` * 100) / `reportData`.`total`),0) AS `days14To27`,ifnull(`reportData`.`slab28`,0) AS `days28To44_total`,ifnull(((`reportData`.`slab28` * 100) / `reportData`.`total`),0) AS `days28To44`,ifnull(`reportData`.`slab45`,0) AS `days45To59_total`,ifnull(((`reportData`.`slab45` * 100) / `reportData`.`total`),0) AS `days45To59`,ifnull(`reportData`.`slab60`,0) AS `daysAfter60_total`,ifnull(((`reportData`.`slab60` * 100) / `reportData`.`total`),0) AS `daysAfter60` from (((select `DB_SCEMR_PROD`.`users`.`id` AS `id`,concat(`DB_SCEMR_PROD`.`users`.`firstName`,' ',`DB_SCEMR_PROD`.`users`.`lastName`) AS `fullName`,`DB_SCEMR_PROD`.`users`.`roleID` AS `roleID` from `DB_SCEMR_PROD`.`users` where ((`DB_SCEMR_PROD`.`users`.`roleID` in (7,32)) and (`DB_SCEMR_PROD`.`users`.`id` <> 5985)))) `doctorDetail` left join (select `unlockedReportSlab`.`scEmployeeUID` AS `scEmployeeUID`,`unlockedReportSlab`.`minDate` AS `minDate`,count(0) AS `total`,sum((case when ((`unlockedReportSlab`.`slab` = '14-27') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab14`,sum((case when ((`unlockedReportSlab`.`slab` = '28-44') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab28`,sum((case when ((`unlockedReportSlab`.`slab` = '45-59') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab45`,sum((case when ((`unlockedReportSlab`.`slab` = 'after60') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab60` from `DB_SCEMR_PROD`.`unlockedReportSlab` group by `unlockedReportSlab`.`scEmployeeUID`) `reportData` on((`reportData`.`scEmployeeUID` = `doctorDetail`.`id`))) order by `doctorDetail`.`roleID`,`doctorDetail`.`fullName`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unlockreportmasterdata`
--

/*!50001 DROP VIEW IF EXISTS `unlockreportmasterdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `unlockreportmasterdata` AS (select `cronCreatedForCacheUsedByEventsReport1`.`eventID` AS `eventID`,`cronCreatedForCacheUsedByEventsReport1`.`patientUID` AS `patientUID`,`cronCreatedForCacheUsedByEventsReport1`.`scEmployeeUID` AS `scEmployeeUID`,`cronCreatedForCacheUsedByEventsReport1`.`scEmployeeFullName` AS `scEmployeeFullName`,`cronCreatedForCacheUsedByEventsReport1`.`eventTypeName` AS `eventTypeName`,`cronCreatedForCacheUsedByEventsReport1`.`allNotesAreLocked` AS `allNotesAreLocked`,`cronCreatedForCacheUsedByEventsReport1`.`eventStatusName` AS `eventStatusName`,`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` AS `eventStartDateTime`,(to_days(cast(convert_tz(now(),'UTC','America/Los_Angeles') as date)) - to_days(cast(`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` as date))) AS `dateDifference` from `cronCreatedForCacheUsedByEventsReport1` where ((`cronCreatedForCacheUsedByEventsReport1`.`eventTypeName` = 'Appointment') and (`cronCreatedForCacheUsedByEventsReport1`.`eventStatusName` = 'Step 4: Approved by doc') and (`cronCreatedForCacheUsedByEventsReport1`.`patientUID` <> 453) and (cast(`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` as date) <= cast(convert_tz(now(),'UTC','America/Los_Angeles') as date)) and (cast(`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` as date) >= (cast(convert_tz(now(),'UTC','America/Los_Angeles') as date) - interval 6 month))) order by `cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
