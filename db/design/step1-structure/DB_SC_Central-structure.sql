-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Central
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
-- Current Database: `DB_SC_Central`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Central` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Central`;

--
-- Table structure for table `appointmentNoteSettingsForProvider`
--

DROP TABLE IF EXISTS `appointmentNoteSettingsForProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentNoteSettingsForProvider` (
  `settingID` int(10) NOT NULL AUTO_INCREMENT,
  `providerID` int(10) DEFAULT NULL,
  `keyName` varchar(100) DEFAULT NULL,
  `keyValue` longblob,
  `keyType` varchar(50) DEFAULT NULL,
  `createdBy` int(10) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimezone` varchar(100) NOT NULL,
  `isCurrentlyActive` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`settingID`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areasOfExpertiseForProvider`
--

DROP TABLE IF EXISTS `areasOfExpertiseForProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areasOfExpertiseForProvider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaOfExpertiseID` int(4) NOT NULL,
  `providerID` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areasOfExpertiseMaster`
--

DROP TABLE IF EXISTS `areasOfExpertiseMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areasOfExpertiseMaster` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `companyID` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clinicRoomCurrentlyUsedBy`
--

DROP TABLE IF EXISTS `clinicRoomCurrentlyUsedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicRoomCurrentlyUsedBy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPersonUsingTheClinicRoomCurrently` int(11) NOT NULL,
  `clinicRoomId` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inRoom` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commonScreenReport`
--

DROP TABLE IF EXISTS `commonScreenReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commonScreenReport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commonScreenId` int(11) NOT NULL,
  `lastRequestReceived` datetime DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38808 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbVersions`
--

DROP TABLE IF EXISTS `dbVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbVersions` (
  `versionID` int(11) NOT NULL AUTO_INCREMENT,
  `upgradeSQLStatements` text NOT NULL,
  `currentDBVersionFlag` tinyint(1) NOT NULL,
  `reasonsForThisDBChangeExplainedByDev` text NOT NULL,
  `dbChangeDoneByName` text NOT NULL,
  `dbChangeDoneOn` date DEFAULT NULL,
  PRIMARY KEY (`versionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `locationID` int(10) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `streetAddress` varchar(255) DEFAULT NULL,
  `streetAddressLine2` varchar(255) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `labelToShowOnRequestAppointmentPage` varchar(255) NOT NULL,
  `urlOfYelpReviewPage` varchar(255) DEFAULT NULL,
  `pngOfRoomLayout` text,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locationsRoom`
--

DROP TABLE IF EXISTS `locationsRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationsRoom` (
  `roomId` int(11) NOT NULL AUTO_INCREMENT,
  `locationId` int(11) NOT NULL,
  `RoomNo` int(11) NOT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `commonScreenIpAddr` varchar(255) NOT NULL,
  `commonScreenSocketChannelId` varchar(255) DEFAULT NULL,
  `commonScreenMacOsUserIdForVNC` varchar(255) DEFAULT NULL,
  `commonScreenMacOsUserPasswordForVNC` varchar(255) DEFAULT NULL,
  `commonScreenMacOsUserLoggedIn` int(4) DEFAULT '0',
  `commonScreenVncServerPort--notused` int(4) NOT NULL,
  `commonScreenVncWebSocketPort--notused` int(4) NOT NULL,
  `firstURLToLoadWhenBrowserStarts` varchar(255) NOT NULL DEFAULT 'http://127.0.0.1/',
  `changeURLOnRaspebrryPiBasedOnUserWork` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mappingOfAssetAndRoom`
--

DROP TABLE IF EXISTS `mappingOfAssetAndRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappingOfAssetAndRoom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roomId` int(11) NOT NULL,
  `assetID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roomId` (`roomId`),
  KEY `assetID` (`assetID`),
  CONSTRAINT `mappingOfAssetAndRoom_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `locationsRoom` (`roomId`),
  CONSTRAINT `mappingOfAssetAndRoom_ibfk_2` FOREIGN KEY (`assetID`) REFERENCES `DB_SCEMR_PROD`.`assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterLanguages`
--

DROP TABLE IF EXISTS `masterLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterLanguages` (
  `languageId` int(10) NOT NULL AUTO_INCREMENT,
  `languageName` varchar(100) NOT NULL,
  `languageCode` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerCommunicationInfoForAppointment`
--

DROP TABLE IF EXISTS `providerCommunicationInfoForAppointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerCommunicationInfoForAppointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerID` int(11) NOT NULL,
  `zoomLink` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `providerID` (`providerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerListedInNoteSettings`
--

DROP TABLE IF EXISTS `providerListedInNoteSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerListedInNoteSettings` (
  `mappingID` int(10) NOT NULL AUTO_INCREMENT,
  `providerID` int(10) NOT NULL,
  PRIMARY KEY (`mappingID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerLocationMaster`
--

DROP TABLE IF EXISTS `providerLocationMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerLocationMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerId` int(11) NOT NULL,
  `locationId` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `notesForProgrammer` text NOT NULL,
  `isDefault` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortUrls`
--

DROP TABLE IF EXISTS `shortUrls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortUrls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientUUID` varchar(36) NOT NULL,
  `shortURLKey` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `ShortUrlDestination` longtext NOT NULL,
  `clickCount` int(11) NOT NULL DEFAULT '0',
  `lastClick` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161898 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surescriptsAuditLogDetails`
--

DROP TABLE IF EXISTS `surescriptsAuditLogDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surescriptsAuditLogDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `uidOfPatient` int(11) DEFAULT NULL,
  `drugName` varchar(255) DEFAULT NULL,
  `surescriptsAuditLogMasterId` int(11) NOT NULL,
  `description` text,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `issueDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surescriptsAuditLogMasterId` (`surescriptsAuditLogMasterId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=26963 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surescriptsAuditLogMasters`
--

DROP TABLE IF EXISTS `surescriptsAuditLogMasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surescriptsAuditLogMasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=System 1=Prescription',
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
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
