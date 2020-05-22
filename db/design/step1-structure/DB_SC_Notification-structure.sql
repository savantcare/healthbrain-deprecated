-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Notification
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
-- Current Database: `DB_SC_Notification`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Notification` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Notification`;

--
-- Table structure for table `inboundSmsDeliveryReport`
--

DROP TABLE IF EXISTS `inboundSmsDeliveryReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboundSmsDeliveryReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderID` int(11) unsigned DEFAULT NULL,
  `messageUUID` varchar(255) DEFAULT NULL,
  `sourceNumber` varchar(128) NOT NULL,
  `destinationNumber` varchar(128) NOT NULL,
  `content` text,
  `positiveToAttendAppointment` enum('yes','no','undefined') NOT NULL DEFAULT 'undefined',
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reminderID` (`reminderID`)
) ENGINE=InnoDB AUTO_INCREMENT=15983 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifierMasterTemplatePlaceholdersForEmailBody`
--

DROP TABLE IF EXISTS `notifierMasterTemplatePlaceholdersForEmailBody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplatePlaceholdersForEmailBody` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) DEFAULT NULL COMMENT 'Id of reminderTypes',
  `placeholder` varchar(255) DEFAULT NULL,
  `meaning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='This table is to guide users about place holders that are allowed by a programmer in coding level .';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifierMasterTemplatePlaceholdersForEmailSubject`
--

DROP TABLE IF EXISTS `notifierMasterTemplatePlaceholdersForEmailSubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplatePlaceholdersForEmailSubject` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) DEFAULT NULL COMMENT 'Id of reminderTypes',
  `placeholder` varchar(255) DEFAULT NULL,
  `meaning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='This table is to guide users about place holders that are allowed by a programmer in coding level .';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifierMasterTemplatePlaceholdersForSmsBody`
--

DROP TABLE IF EXISTS `notifierMasterTemplatePlaceholdersForSmsBody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplatePlaceholdersForSmsBody` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) DEFAULT NULL COMMENT 'Id of reminderTypes',
  `placeholder` varchar(255) DEFAULT NULL,
  `meaning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='This table is to guide users about place holders that are allowed by a programmer in coding level .';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifierMasterTemplateSettingsForCalls`
--

DROP TABLE IF EXISTS `notifierMasterTemplateSettingsForCalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplateSettingsForCalls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) unsigned DEFAULT NULL COMMENT 'Id of reminderTypes',
  `secondaryIdentifier` varchar(255) NOT NULL DEFAULT 'default',
  `callTemplate` text NOT NULL,
  `isItLatest` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: old, 1: latest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifierMasterTemplateSettingsForEmails`
--

DROP TABLE IF EXISTS `notifierMasterTemplateSettingsForEmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplateSettingsForEmails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) unsigned DEFAULT NULL COMMENT 'Id of reminderTypes',
  `secondaryIdentifier` varchar(255) NOT NULL DEFAULT 'default',
  `emailSubjectTemplate` text NOT NULL,
  `emailBodyTemplate` text NOT NULL,
  `isItLatest` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: old, 1: latest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifierMasterTemplateSettingsForSms`
--

DROP TABLE IF EXISTS `notifierMasterTemplateSettingsForSms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplateSettingsForSms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) unsigned DEFAULT NULL COMMENT 'Id of reminderTypes',
  `secondaryIdentifier` varchar(255) NOT NULL DEFAULT 'default',
  `smsBodyTemplate` text NOT NULL,
  `isItLatest` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: old, 1: latest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outboundSmsDeliveryReport`
--

DROP TABLE IF EXISTS `outboundSmsDeliveryReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outboundSmsDeliveryReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderID` int(11) unsigned DEFAULT NULL,
  `apiID` varchar(255) DEFAULT NULL,
  `messageUUID` varchar(255) DEFAULT NULL,
  `parentMessageUUID` varchar(255) DEFAULT NULL,
  `status` enum('queue','sent','failed','delivered','undelivered','rejected','error') DEFAULT NULL,
  `primaryResponseMessage` varchar(255) DEFAULT NULL,
  `sourceNumber` varchar(128) NOT NULL,
  `destinationNumber` varchar(128) NOT NULL,
  `smsContent` text,
  `attemptNumber` tinyint(4) DEFAULT NULL,
  `nextAttemptTime` datetime DEFAULT NULL,
  `isItLatest` enum('0','1') NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminderID` (`reminderID`)
) ENGINE=InnoDB AUTO_INCREMENT=51751 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plivoSmsRelatedSettings`
--

DROP TABLE IF EXISTS `plivoSmsRelatedSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plivoSmsRelatedSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `dedicatedPlivoNumber` varchar(255) NOT NULL,
  `reportDeleveryUrl` varchar(255) DEFAULT NULL,
  `reportDeleveryUrlMethod` enum('GET','POST') NOT NULL DEFAULT 'GET',
  `messageUrl` varchar(255) DEFAULT NULL,
  `messageUrlMethod` enum('GET','POST') NOT NULL DEFAULT 'POST',
  `plivoAppName` varchar(255) DEFAULT NULL,
  `resendFeature` enum('On','Off') NOT NULL DEFAULT 'Off',
  `resendOptionInfo` text COMMENT 'Serialised array of #attempt vs time',
  PRIMARY KEY (`id`),
  KEY `reminderTypeID` (`reminderTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminderTypes`
--

DROP TABLE IF EXISTS `reminderTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminderTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `nameOfReminder` varchar(255) NOT NULL,
  `priorityLevel` enum('Emergency','Normal') NOT NULL COMMENT 'What is the significance of P level? Reminders with N P level check if any other reminder has been sent in last 7 days. Reminders with E p level do not check if any other reminder has been sent in last 7 days. E.g. for the reminder goal not entered if any other N or E reminder has been sent in last 7 days than it will not be sent.',
  `defaultSender` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `trackId` varchar(255) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStatusAtTheTimeOfQueue` varchar(255) DEFAULT NULL COMMENT 'this is needed for such case where we need to remove reminders for cancelled events',
  `daysAheadReminder` tinyint(1) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
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
  `messageForDevelopers` longtext,
  PRIMARY KEY (`id`),
  KEY `trackId` (`trackId`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `reminderTypeID` (`reminderTypeID`),
  KEY `fromUID` (`fromUID`),
  KEY `eventID` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=14157924 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminders-bkp-old-system-18Sept2019`
--

DROP TABLE IF EXISTS `reminders-bkp-old-system-18Sept2019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders-bkp-old-system-18Sept2019` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `trackId` varchar(255) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStatusAtTheTimeOfQueue` varchar(255) DEFAULT NULL COMMENT 'this is needed for such case where we need to remove reminders for cancelled events',
  `daysAheadReminder` tinyint(1) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
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
  `messageForDevelopers` longtext,
  PRIMARY KEY (`id`),
  KEY `trackId` (`trackId`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `reminderTypeID` (`reminderTypeID`),
  KEY `fromUID` (`fromUID`),
  KEY `eventID` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=13969293 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remindersForTesting`
--

DROP TABLE IF EXISTS `remindersForTesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remindersForTesting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `trackId` varchar(255) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStatusAtTheTimeOfQueue` varchar(255) DEFAULT NULL COMMENT 'this is needed for such case where we need to remove reminders for cancelled events',
  `daysAheadReminder` tinyint(1) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
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
  `messageForDevelopers` longtext,
  PRIMARY KEY (`id`),
  KEY `trackId` (`trackId`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `reminderTypeID` (`reminderTypeID`),
  KEY `fromUID` (`fromUID`),
  KEY `eventID` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=7196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `remindersForTesting-19Aug`
--

DROP TABLE IF EXISTS `remindersForTesting-19Aug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remindersForTesting-19Aug` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `trackId` varchar(255) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStatusAtTheTimeOfQueue` varchar(255) DEFAULT NULL COMMENT 'this is needed for such case where we need to remove reminders for cancelled events',
  `daysAheadReminder` tinyint(1) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
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
  `messageForDevelopers` longtext,
  PRIMARY KEY (`id`),
  KEY `trackId` (`trackId`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `reminderTypeID` (`reminderTypeID`),
  KEY `fromUID` (`fromUID`),
  KEY `eventID` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=latin1;
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
