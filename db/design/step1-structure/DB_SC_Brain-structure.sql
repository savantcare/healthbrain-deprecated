-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Brain
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
-- Current Database: `DB_SC_Brain`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Brain` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Brain`;

--
-- Table structure for table `comparativeStudyCustomFilterSetting`
--

DROP TABLE IF EXISTS `comparativeStudyCustomFilterSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comparativeStudyCustomFilterSetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `columnSetting` varchar(255) DEFAULT NULL,
  `modificationDateTIme` datetime DEFAULT NULL,
  `modificationTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctorRecommendationsForPatient`
--

DROP TABLE IF EXISTS `doctorRecommendationsForPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorRecommendationsForPatient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `recommendationDescription` longtext,
  `uidOfRecommendationMadeBy` int(10) unsigned NOT NULL,
  `uidOfRecommendationMadeFor` int(10) unsigned NOT NULL,
  `recommendationCreated` datetime NOT NULL,
  `timeZoneOfRecommendationCreated` char(5) NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL COMMENT 'rename to deletedOnDateTime',
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL COMMENT 'rename to discontinuedOnDateTime',
  `discontinuedTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL COMMENT 'Why this recommendation is discontinued?',
  `originId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctorRecommendationsForPatient_bk_for_migration`
--

DROP TABLE IF EXISTS `doctorRecommendationsForPatient_bk_for_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorRecommendationsForPatient_bk_for_migration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT NULL,
  `recommendationDescription` longtext NOT NULL,
  `uidOfRecommendationMadeBy` int(10) unsigned NOT NULL,
  `uidOfRecommendationMadeFor` int(10) unsigned NOT NULL,
  `recommendationCreated` datetime NOT NULL,
  `timeZoneOfRecommendationCreated` char(5) NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL COMMENT 'rename to deletedOnDateTime',
  `deletedTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL COMMENT 'rename to discontinuedOnDateTime',
  `discontinuedTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL COMMENT 'Why this recommendation is discontinued?',
  `originId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11464 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planComments`
--

DROP TABLE IF EXISTS `planComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text NOT NULL,
  `patientId` int(10) unsigned NOT NULL,
  `createdById` int(10) unsigned NOT NULL,
  `createdDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdDateTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedByUID` int(10) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(50) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(10) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(50) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstParentId` int(11) DEFAULT NULL,
  `uidOfPatient` int(10) unsigned NOT NULL,
  `description` text,
  `reminderStartDate` datetime NOT NULL,
  `createdBy` int(10) unsigned NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdTimeZone` char(5) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `originId` int(11) NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` char(5) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` char(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminders_bk_for_migration`
--

DROP TABLE IF EXISTS `reminders_bk_for_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders_bk_for_migration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(10) unsigned NOT NULL,
  `description` text,
  `reminderStartDate` datetime NOT NULL,
  `createdBy` int(10) unsigned NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdTimeZone` char(5) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `originId` int(11) NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` char(5) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` char(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1854 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scBrainSkillSuggestionEditPrioritiesMaster`
--

DROP TABLE IF EXISTS `scBrainSkillSuggestionEditPrioritiesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scBrainSkillSuggestionEditPrioritiesMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primaryRoleID` int(11) NOT NULL,
  `secondaryRoleID` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scBrainSkillSuggestionMaster`
--

DROP TABLE IF EXISTS `scBrainSkillSuggestionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scBrainSkillSuggestionMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `suggestion` text,
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scBrainSkillsUsageCount`
--

DROP TABLE IF EXISTS `scBrainSkillsUsageCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scBrainSkillsUsageCount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `skillName` varchar(255) DEFAULT NULL,
  `type` enum('read','write') DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=671763 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skillMinimizeSettings`
--

DROP TABLE IF EXISTS `skillMinimizeSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillMinimizeSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(100) NOT NULL,
  `providerId` int(11) NOT NULL,
  `patientId` int(11) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skillsUsageCount`
--

DROP TABLE IF EXISTS `skillsUsageCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillsUsageCount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `skillName` varchar(255) DEFAULT NULL,
  `readCount` int(11) DEFAULT NULL,
  `writeCount` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(11) DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedAtTimezone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1964 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblContextMaster`
--

DROP TABLE IF EXISTS `tblContextMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblContextMaster` (
  `contextID` decimal(10,0) NOT NULL,
  `contextName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblContextSpecficAutoResponseMaster`
--

DROP TABLE IF EXISTS `tblContextSpecficAutoResponseMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblContextSpecficAutoResponseMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `userRole` int(11) DEFAULT NULL,
  `contextID` decimal(10,0) NOT NULL,
  `skillName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
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
