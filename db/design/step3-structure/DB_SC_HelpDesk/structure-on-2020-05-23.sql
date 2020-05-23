-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_HelpDesk
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
-- Current Database: `DB_SC_HelpDesk`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_HelpDesk` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_HelpDesk`;

--
-- Temporary table structure for view `breakup_performance_report`
--

DROP TABLE IF EXISTS `breakup_performance_report`;
/*!50001 DROP VIEW IF EXISTS `breakup_performance_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `breakup_performance_report` AS SELECT 
 1 AS `assignedId`,
 1 AS `userId`,
 1 AS `id`,
 1 AS `open_time`,
 1 AS `response_time`,
 1 AS `response_duration`,
 1 AS `closed_time`,
 1 AS `resolution_duration`,
 1 AS `response`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `breakup_performance_report_for_month`
--

DROP TABLE IF EXISTS `breakup_performance_report_for_month`;
/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_month`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `breakup_performance_report_for_month` AS SELECT 
 1 AS `assignedId`,
 1 AS `userId`,
 1 AS `id`,
 1 AS `open_time`,
 1 AS `response_time`,
 1 AS `response_duration`,
 1 AS `closed_time`,
 1 AS `resolution_duration`,
 1 AS `response`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `breakup_performance_report_for_week`
--

DROP TABLE IF EXISTS `breakup_performance_report_for_week`;
/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_week`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `breakup_performance_report_for_week` AS SELECT 
 1 AS `assignedId`,
 1 AS `userId`,
 1 AS `id`,
 1 AS `open_time`,
 1 AS `response_time`,
 1 AS `response_duration`,
 1 AS `closed_time`,
 1 AS `resolution_duration`,
 1 AS `response`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `breakup_performance_report_for_year`
--

DROP TABLE IF EXISTS `breakup_performance_report_for_year`;
/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `breakup_performance_report_for_year` AS SELECT 
 1 AS `assignedId`,
 1 AS `userId`,
 1 AS `id`,
 1 AS `open_time`,
 1 AS `response_time`,
 1 AS `response_duration`,
 1 AS `closed_time`,
 1 AS `resolution_duration`,
 1 AS `response`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dailyReportLog`
--

DROP TABLE IF EXISTS `dailyReportLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dailyReportLog` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=910 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `distinct_assignid`
--

DROP TABLE IF EXISTS `distinct_assignid`;
/*!50001 DROP VIEW IF EXISTS `distinct_assignid`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `distinct_assignid` AS SELECT 
 1 AS `assignedId`,
 1 AS `Fullname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `first_response_time`
--

DROP TABLE IF EXISTS `first_response_time`;
/*!50001 DROP VIEW IF EXISTS `first_response_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `first_response_time` AS SELECT 
 1 AS `user_id`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hdrScreenRecordingVideos`
--

DROP TABLE IF EXISTS `hdrScreenRecordingVideos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hdrScreenRecordingVideos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userHelpdeskId` int(11) NOT NULL,
  `fileContent` longblob NOT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `fileType` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isMerged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userHelpdeskId` (`userHelpdeskId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskActivityLog`
--

DROP TABLE IF EXISTS `helpdeskActivityLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskActivityLog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `requestId` int(10) NOT NULL,
  `changeBy` varchar(255) DEFAULT NULL,
  `fieldName` varchar(255) NOT NULL,
  `oldValue` varchar(255) DEFAULT NULL,
  `newValue` varchar(255) DEFAULT NULL,
  `changeOn` datetime NOT NULL,
  `changeTimeZone` varchar(20) DEFAULT '(PST)',
  `remoteIp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158890 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskCommentDocuments`
--

DROP TABLE IF EXISTS `helpdeskCommentDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskCommentDocuments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `commentId` int(11) unsigned NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL DEFAULT '',
  `fileType` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=972 DEFAULT CHARSET=utf8 COMMENT='1. One upload ID can have multiple documents 2. File content is stored in the documents table since we do not want the app to depend on the file system.';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_1` BEFORE INSERT ON `helpdeskCommentDocuments` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    Select uuid_v4_custom(NEW.id) INTO @P1;
    
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
-- Table structure for table `helpdeskCommentDocumentsTemp`
--

DROP TABLE IF EXISTS `helpdeskCommentDocumentsTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskCommentDocumentsTemp` (
  `id` int(11) unsigned NOT NULL,
  `tempID` varchar(128) NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL DEFAULT '',
  `fileType` varchar(128) NOT NULL DEFAULT '',
  `uidOfUploader` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='1. Documents are put in this table temporarily. Once we get the upload id than we move the documents to the documents table. 2. When the documents are uploaded the uploadID is still not available. The uploadID only becomes available when the user hits the "Save" button. Hence we need this temp table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskDefaultUser`
--

DROP TABLE IF EXISTS `helpdeskDefaultUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskDefaultUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskDocuments`
--

DROP TABLE IF EXISTS `helpdeskDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskDocuments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `ticketId` int(11) unsigned NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL DEFAULT '',
  `fileType` varchar(128) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8795 DEFAULT CHARSET=utf8 COMMENT='1. One upload ID can have multiple documents 2. File content is stored in the documents table since we do not want the app to depend on the file system.';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4` BEFORE INSERT ON `helpdeskDocuments` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    Select uuid_v4_custom(NEW.id) INTO @P1;
    
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
-- Table structure for table `helpdeskDocumentsTemp`
--

DROP TABLE IF EXISTS `helpdeskDocumentsTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskDocumentsTemp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tempID` varchar(128) NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL DEFAULT '',
  `fileType` varchar(128) NOT NULL DEFAULT '',
  `uidOfUploader` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uidOfUploader` (`uidOfUploader`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='1. Documents are put in this table temporarily. Once we get the upload id than we move the documents to the documents table. 2. When the documents are uploaded the uploadID is still not available. The uploadID only becomes available when the user hits the "Save" button. Hence we need this temp table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskFeedback`
--

DROP TABLE IF EXISTS `helpdeskFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskFeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hdrId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `starCount` int(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskMailToRequest`
--

DROP TABLE IF EXISTS `helpdeskMailToRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskMailToRequest` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `messageId` int(11) NOT NULL,
  `senderMailId` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mailId` varchar(255) CHARACTER SET latin1 NOT NULL,
  `hdrId` int(11) DEFAULT NULL,
  `encodeType` decimal(10,0) NOT NULL,
  `contentType` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_MAIL` (`messageId`,`mailId`)
) ENGINE=InnoDB AUTO_INCREMENT=6110 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskReportCustomFilters`
--

DROP TABLE IF EXISTS `helpdeskReportCustomFilters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskReportCustomFilters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(10) NOT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(10) DEFAULT NULL,
  `noOfTimesAccessed` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskSecuirtyLevelMaster`
--

DROP TABLE IF EXISTS `helpdeskSecuirtyLevelMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskSecuirtyLevelMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskSourceMaster`
--

DROP TABLE IF EXISTS `helpdeskSourceMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskSourceMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helpdeskUserSecuirtyLevel`
--

DROP TABLE IF EXISTS `helpdeskUserSecuirtyLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpdeskUserSecuirtyLevel` (
  `userId` int(11) NOT NULL,
  `securityLevel` int(11) NOT NULL,
  UNIQUE KEY `uid` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailSentDetails`
--

DROP TABLE IF EXISTS `mailSentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailSentDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HDRId` int(11) NOT NULL,
  `mailType` varchar(255) NOT NULL,
  `mailUniqeKey` varchar(255) NOT NULL,
  `mailSentDateTime` datetime NOT NULL,
  `mailReadDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41095 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `month_table`
--

DROP TABLE IF EXISTS `month_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `month_table` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `openNoReply`
--

DROP TABLE IF EXISTS `openNoReply`;
/*!50001 DROP VIEW IF EXISTS `openNoReply`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `openNoReply` AS SELECT 
 1 AS `ticketId`,
 1 AS `title`,
 1 AS `comment`,
 1 AS `created_at`,
 1 AS `fullname`,
 1 AS `status`,
 1 AS `updated_at`,
 1 AS `typeId`,
 1 AS `assignedId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `performace_hdr`
--

DROP TABLE IF EXISTS `performace_hdr`;
/*!50001 DROP VIEW IF EXISTS `performace_hdr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performace_hdr` AS SELECT 
 1 AS `user_id`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `performance_report_hdr`
--

DROP TABLE IF EXISTS `performance_report_hdr`;
/*!50001 DROP VIEW IF EXISTS `performance_report_hdr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performance_report_hdr` AS SELECT 
 1 AS `user_id`,
 1 AS `role`,
 1 AS `Fullname`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`,
 1 AS `avg_resolution_time_in_min`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `performance_report_hdr_month`
--

DROP TABLE IF EXISTS `performance_report_hdr_month`;
/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_month`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performance_report_hdr_month` AS SELECT 
 1 AS `user_id`,
 1 AS `role`,
 1 AS `Fullname`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`,
 1 AS `avg_resolution_time_in_min`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `performance_report_hdr_week`
--

DROP TABLE IF EXISTS `performance_report_hdr_week`;
/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_week`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performance_report_hdr_week` AS SELECT 
 1 AS `user_id`,
 1 AS `role`,
 1 AS `Fullname`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`,
 1 AS `avg_resolution_time_in_min`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `performance_report_hdr_year`
--

DROP TABLE IF EXISTS `performance_report_hdr_year`;
/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performance_report_hdr_year` AS SELECT 
 1 AS `user_id`,
 1 AS `role`,
 1 AS `Fullname`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`,
 1 AS `avg_resolution_time_in_min`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `preTypeResponse`
--

DROP TABLE IF EXISTS `preTypeResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preTypeResponse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `preTypeText` longtext NOT NULL,
  `originalText` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `resolution_time`
--

DROP TABLE IF EXISTS `resolution_time`;
/*!50001 DROP VIEW IF EXISTS `resolution_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `resolution_time` AS SELECT 
 1 AS `user_id`,
 1 AS `avg_resolution_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `test`
--

DROP TABLE IF EXISTS `test`;
/*!50001 DROP VIEW IF EXISTS `test`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `test` AS SELECT 
 1 AS `ticketId`,
 1 AS `title`,
 1 AS `comment`,
 1 AS `created_at`,
 1 AS `fullname`,
 1 AS `status`,
 1 AS `updated_at`,
 1 AS `typeId`,
 1 AS `userId`,
 1 AS `assignedId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `testAssign`
--

DROP TABLE IF EXISTS `testAssign`;
/*!50001 DROP VIEW IF EXISTS `testAssign`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `testAssign` AS SELECT 
 1 AS `ticketId`,
 1 AS `title`,
 1 AS `comment`,
 1 AS `created_at`,
 1 AS `fullname`,
 1 AS `status`,
 1 AS `updated_at`,
 1 AS `typeId`,
 1 AS `userId`,
 1 AS `assignedId`*/;
SET character_set_client = @saved_cs_client;
--
-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`%` */ /*!50003 TRIGGER `testref` BEFORE INSERT ON `test_table` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
	SELECT uuid_v4_custom(id) INTO P1 FROM test_table WHERE id = NEW.id;
    IF(NEW.uniqueId = null) THEN
    	update test_table SET uniqueId = P1 where id = NEW.id;
	ELSE
    	SET NEW.uniqueId = NEW.uniqueId;
	END IF;
end */;;
DELIMITER ;

--
-- Table structure for table `userHelpdesk`
--

DROP TABLE IF EXISTS `userHelpdesk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userHelpdesk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `userId` int(11) NOT NULL,
  `behalfOf` int(10) DEFAULT '0',
  `typeId` int(11) NOT NULL DEFAULT '1',
  `assignedId` int(11) NOT NULL,
  `statusId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL DEFAULT '10',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdTimeZone` varchar(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTimeZone` varchar(20) NOT NULL,
  `priority` int(10) NOT NULL DEFAULT '1',
  `urls` text,
  `mail_remainder_sent_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statusId` (`statusId`) USING BTREE,
  CONSTRAINT `statusId` FOREIGN KEY (`statusId`) REFERENCES `userHelpdeskStatusMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47450 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_hdr` BEFORE INSERT ON `userHelpdesk` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    Select uuid_v4_custom(NEW.id) INTO @P1;
    
    IF (NEW.publicUniqueId IS NULL) THEN
    	SET NEW.publicUniqueId = @P1;
    ELSEIF (NEW.publicUniqueId = '') THEN
    	SET NEW.publicUniqueId = @P1;  
	ELSE
    	SET NEW.publicUniqueId = NEW.publicUniqueId;
    END IF;
    
    IF (NEW.createdTimeZone like '%Pacific Daylight Tim%') THEN
    	SET NEW.createdTimeZone = '(PDT)';
	ELSE
    	SET NEW.createdTimeZone = NEW.createdTimeZone;
    END IF;
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userHelpdeskComment`
--

DROP TABLE IF EXISTS `userHelpdeskComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userHelpdeskComment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `billingDuration` int(10) NOT NULL DEFAULT '0',
  `ticketId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL DEFAULT '10',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdTimeZone` varchar(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTimeZone` varchar(20) NOT NULL,
  `isPublish` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31440 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_hdr_comment` BEFORE INSERT ON `userHelpdeskComment` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    Select uuid_v4_custom(NEW.id) INTO @P1;
    
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
-- Temporary table structure for view `userHelpdeskForMonth`
--

DROP TABLE IF EXISTS `userHelpdeskForMonth`;
/*!50001 DROP VIEW IF EXISTS `userHelpdeskForMonth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userHelpdeskForMonth` AS SELECT 
 1 AS `id`,
 1 AS `publicUniqueId`,
 1 AS `title`,
 1 AS `description`,
 1 AS `userId`,
 1 AS `behalfOf`,
 1 AS `typeId`,
 1 AS `assignedId`,
 1 AS `statusId`,
 1 AS `sourceId`,
 1 AS `created_at`,
 1 AS `createdTimeZone`,
 1 AS `updated_at`,
 1 AS `updateTimeZone`,
 1 AS `priority`,
 1 AS `urls`,
 1 AS `mail_remainder_sent_date_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `userHelpdeskForWeek`
--

DROP TABLE IF EXISTS `userHelpdeskForWeek`;
/*!50001 DROP VIEW IF EXISTS `userHelpdeskForWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userHelpdeskForWeek` AS SELECT 
 1 AS `id`,
 1 AS `publicUniqueId`,
 1 AS `title`,
 1 AS `description`,
 1 AS `userId`,
 1 AS `behalfOf`,
 1 AS `typeId`,
 1 AS `assignedId`,
 1 AS `statusId`,
 1 AS `sourceId`,
 1 AS `created_at`,
 1 AS `createdTimeZone`,
 1 AS `updated_at`,
 1 AS `updateTimeZone`,
 1 AS `priority`,
 1 AS `urls`,
 1 AS `mail_remainder_sent_date_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `userHelpdeskForYear`
--

DROP TABLE IF EXISTS `userHelpdeskForYear`;
/*!50001 DROP VIEW IF EXISTS `userHelpdeskForYear`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userHelpdeskForYear` AS SELECT 
 1 AS `id`,
 1 AS `publicUniqueId`,
 1 AS `title`,
 1 AS `description`,
 1 AS `userId`,
 1 AS `behalfOf`,
 1 AS `typeId`,
 1 AS `assignedId`,
 1 AS `statusId`,
 1 AS `sourceId`,
 1 AS `created_at`,
 1 AS `createdTimeZone`,
 1 AS `updated_at`,
 1 AS `updateTimeZone`,
 1 AS `priority`,
 1 AS `urls`,
 1 AS `mail_remainder_sent_date_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `userHelpdeskPriorityMaster`
--

DROP TABLE IF EXISTS `userHelpdeskPriorityMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userHelpdeskPriorityMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userHelpdeskStatusMaster`
--

DROP TABLE IF EXISTS `userHelpdeskStatusMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userHelpdeskStatusMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(100) NOT NULL,
  `statusColor` varchar(100) NOT NULL,
  `beColor` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userHelpdeskTypeMaster`
--

DROP TABLE IF EXISTS `userHelpdeskTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userHelpdeskTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(100) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `DB_SC_HelpDesk`
--

USE `DB_SC_HelpDesk`;

--
-- Final view structure for view `breakup_performance_report`
--

/*!50001 DROP VIEW IF EXISTS `breakup_performance_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `breakup_performance_report` AS (select `a`.`assignedId` AS `assignedId`,`a`.`userId` AS `userId`,`a`.`id` AS `id`,`a`.`open_time` AS `open_time`,`a`.`response_time` AS `response_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`response_time`)),'%H:%i') AS `response_duration`,`a`.`closed_time` AS `closed_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`closed_time`)),'%H:%i') AS `resolution_duration`,`a`.`response` AS `response` from (select `h`.`assignedId` AS `assignedId`,`c`.`userId` AS `userId`,`h`.`id` AS `id`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`e`.`response_time` AS `response_time`,`d`.`closed_time` AS `closed_time`,`c`.`response` AS `response` from (((`DB_SC_HelpDesk`.`userHelpdesk` `h` left join (select `c`.`userId` AS `userId`,`c`.`ticketId` AS `ticketId`,count(`c`.`ticketId`) AS `response` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdesk` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId`,`c`.`ticketId` order by `c`.`userId`,`c`.`ticketId`) `c` on((`c`.`ticketId` = `h`.`id`))) left join (select `h`.`assignedId` AS `assignedId`,`latest_data`.`requestId` AS `ticketId`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `DB_SC_HelpDesk`.`userHelpdesk`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdesk` where (`DB_SC_HelpDesk`.`userHelpdesk`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `d` on((`d`.`ticketId` = `h`.`id`))) left join (select `a`.`assignedId` AS `assignedId`,`h`.`id` AS `ticketId`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdesk` `h` on((`h`.`id` = `a`.`id`)))) `e` on((`e`.`ticketId` = `h`.`id`)))) `a`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `breakup_performance_report_for_month`
--

/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `breakup_performance_report_for_month` AS (select `a`.`assignedId` AS `assignedId`,`a`.`userId` AS `userId`,`a`.`id` AS `id`,`a`.`open_time` AS `open_time`,`a`.`response_time` AS `response_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`response_time`)),'%H:%i') AS `response_duration`,`a`.`closed_time` AS `closed_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`closed_time`)),'%H:%i') AS `resolution_duration`,`a`.`response` AS `response` from (select `h`.`assignedId` AS `assignedId`,`c`.`userId` AS `userId`,`h`.`id` AS `id`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`e`.`response_time` AS `response_time`,`d`.`closed_time` AS `closed_time`,`c`.`response` AS `response` from (((`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` left join (select `c`.`userId` AS `userId`,`c`.`ticketId` AS `ticketId`,count(`c`.`ticketId`) AS `response` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId`,`c`.`ticketId` order by `c`.`userId`,`c`.`ticketId`) `c` on((`c`.`ticketId` = `h`.`id`))) left join (select `h`.`assignedId` AS `assignedId`,`latest_data`.`requestId` AS `ticketId`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForMonth`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForMonth` where (`userHelpdeskForMonth`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `d` on((`d`.`ticketId` = `h`.`id`))) left join (select `a`.`assignedId` AS `assignedId`,`h`.`id` AS `ticketId`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` on((`h`.`id` = `a`.`id`)))) `e` on((`e`.`ticketId` = `h`.`id`)))) `a`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `breakup_performance_report_for_week`
--

/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_week`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `breakup_performance_report_for_week` AS (select `a`.`assignedId` AS `assignedId`,`a`.`userId` AS `userId`,`a`.`id` AS `id`,`a`.`open_time` AS `open_time`,`a`.`response_time` AS `response_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`response_time`)),'%H:%i') AS `response_duration`,`a`.`closed_time` AS `closed_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`closed_time`)),'%H:%i') AS `resolution_duration`,`a`.`response` AS `response` from (select `h`.`assignedId` AS `assignedId`,`c`.`userId` AS `userId`,`h`.`id` AS `id`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`e`.`response_time` AS `response_time`,`d`.`closed_time` AS `closed_time`,`c`.`response` AS `response` from (((`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` left join (select `c`.`userId` AS `userId`,`c`.`ticketId` AS `ticketId`,count(`c`.`ticketId`) AS `response` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId`,`c`.`ticketId` order by `c`.`userId`,`c`.`ticketId`) `c` on((`c`.`ticketId` = `h`.`id`))) left join (select `h`.`assignedId` AS `assignedId`,`latest_data`.`requestId` AS `ticketId`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForWeek`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForWeek` where (`userHelpdeskForWeek`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `d` on((`d`.`ticketId` = `h`.`id`))) left join (select `a`.`assignedId` AS `assignedId`,`h`.`id` AS `ticketId`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` on((`h`.`id` = `a`.`id`)))) `e` on((`e`.`ticketId` = `h`.`id`)))) `a`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `breakup_performance_report_for_year`
--

/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `breakup_performance_report_for_year` AS (select `a`.`assignedId` AS `assignedId`,`a`.`userId` AS `userId`,`a`.`id` AS `id`,`a`.`open_time` AS `open_time`,`a`.`response_time` AS `response_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`response_time`)),'%H:%i') AS `response_duration`,`a`.`closed_time` AS `closed_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`closed_time`)),'%H:%i') AS `resolution_duration`,`a`.`response` AS `response` from (select `h`.`assignedId` AS `assignedId`,`c`.`userId` AS `userId`,`h`.`id` AS `id`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`e`.`response_time` AS `response_time`,`d`.`closed_time` AS `closed_time`,`c`.`response` AS `response` from (((`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` left join (select `c`.`userId` AS `userId`,`c`.`ticketId` AS `ticketId`,count(`c`.`ticketId`) AS `response` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForYear` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId`,`c`.`ticketId` order by `c`.`userId`,`c`.`ticketId`) `c` on((`c`.`ticketId` = `h`.`id`))) left join (select `h`.`assignedId` AS `assignedId`,`latest_data`.`requestId` AS `ticketId`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForYear`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForYear` where (`userHelpdeskForYear`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `d` on((`d`.`ticketId` = `h`.`id`))) left join (select `a`.`assignedId` AS `assignedId`,`h`.`id` AS `ticketId`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForYear` `h` on((`h`.`id` = `a`.`id`)))) `e` on((`e`.`ticketId` = `h`.`id`)))) `a`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `distinct_assignid`
--

/*!50001 DROP VIEW IF EXISTS `distinct_assignid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `distinct_assignid` AS (select distinct `h`.`assignedId` AS `assignedId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `Fullname` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SCEMR_PROD`.`users` `u` on(((`u`.`id` = `h`.`assignedId`) and (`u`.`roleID` <> 11))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `first_response_time`
--

/*!50001 DROP VIEW IF EXISTS `first_response_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `first_response_time` AS (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdesk` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `openNoReply`
--

/*!50001 DROP VIEW IF EXISTS `openNoReply`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `openNoReply` AS select `a`.`ticketId` AS `ticketId`,`a`.`title` AS `title`,`a`.`comment` AS `comment`,`a`.`created_at` AS `created_at`,`a`.`fullname` AS `fullname`,`a`.`status` AS `status`,`a`.`updated_at` AS `updated_at`,`a`.`typeId` AS `typeId`,`a`.`assignedId` AS `assignedId` from (select `h`.`id` AS `ticketId`,`h`.`title` AS `title`,`h`.`description` AS `comment`,`h`.`created_at` AS `created_at`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `fullname`,'0' AS `status`,`h`.`updated_at` AS `updated_at`,`h`.`typeId` AS `typeId`,`h`.`assignedId` AS `assignedId` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SCEMR_PROD`.`users` `u` on((`u`.`id` = `h`.`userId`))) where ((`h`.`statusId` <> 2) and (not(`h`.`id` in (select distinct `c`.`ticketId` from `DB_SC_HelpDesk`.`userHelpdeskComment` `c` where (`c`.`isPublish` = 1)))))) `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `performace_hdr`
--

/*!50001 DROP VIEW IF EXISTS `performace_hdr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performace_hdr` AS (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdesk` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdesk` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `performance_report_hdr`
--

/*!50001 DROP VIEW IF EXISTS `performance_report_hdr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performance_report_hdr` AS (select `a`.`assignedId` AS `user_id`,`u`.`roleID` AS `role`,`a`.`Fullname` AS `Fullname`,cast(`p`.`total` as unsigned) AS `total`,cast(ifnull(`p`.`resolved`,0) as unsigned) AS `resolved`,cast(`p`.`reopen` as unsigned) AS `reopen`,`p`.`avg_response` AS `avg_response`,cast(round(ifnull(`r`.`avg_resolution_time_in_min`,0.00),2) as unsigned) AS `avg_resolution_time_in_min`,cast(round(ifnull(`t`.`avg_response_time_in_min`,0.00),2) as unsigned) AS `avg_response_time_in_min` from ((((((select distinct `h`.`assignedId` AS `assignedId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `Fullname` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SCEMR_PROD`.`users` `u` on(((`u`.`id` = `h`.`assignedId`) and (`u`.`roleID` <> 11)))))) `a` left join (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdesk` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdesk` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) `p` on((`a`.`assignedId` = `p`.`user_id`))) left join (select `temp_table`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`temp_table`.`closed_time`,`temp_table`.`open_time`))) / 60) AS `avg_resolution_time_in_min` from (select `latest_data`.`requestId` AS `requestId`,`h`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `DB_SC_HelpDesk`.`userHelpdesk`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdesk` where (`DB_SC_HelpDesk`.`userHelpdesk`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `temp_table` group by `temp_table`.`assignedId` order by `temp_table`.`assignedId`) `r` on((`a`.`assignedId` = `r`.`user_id`))) left join (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdesk` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) `t` on((`a`.`assignedId` = `t`.`user_id`))) left join `DB_SCEMR_PROD`.`users` `u` on((`a`.`assignedId` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `performance_report_hdr_month`
--

/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performance_report_hdr_month` AS (select `a`.`assignedId` AS `user_id`,`u`.`roleID` AS `role`,`a`.`Fullname` AS `Fullname`,cast(`p`.`total` as unsigned) AS `total`,cast(ifnull(`p`.`resolved`,0) as unsigned) AS `resolved`,cast(`p`.`reopen` as unsigned) AS `reopen`,`p`.`avg_response` AS `avg_response`,cast(round(ifnull(`r`.`avg_resolution_time_in_min`,0.00),2) as unsigned) AS `avg_resolution_time_in_min`,cast(round(ifnull(`t`.`avg_response_time_in_min`,0.00),2) as unsigned) AS `avg_response_time_in_min` from ((((((select distinct `h`.`assignedId` AS `assignedId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `Fullname` from (`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` join `DB_SCEMR_PROD`.`users` `u` on(((`u`.`id` = `h`.`assignedId`) and (`u`.`roleID` <> 11)))))) `a` left join (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) `p` on((`a`.`assignedId` = `p`.`user_id`))) left join (select `temp_table`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`temp_table`.`closed_time`,`temp_table`.`open_time`))) / 60) AS `avg_resolution_time_in_min` from (select `latest_data`.`requestId` AS `requestId`,`h`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForMonth`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForMonth` where (`userHelpdeskForMonth`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `temp_table` group by `temp_table`.`assignedId` order by `temp_table`.`assignedId`) `r` on((`a`.`assignedId` = `r`.`user_id`))) left join (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForMonth` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) `t` on((`a`.`assignedId` = `t`.`user_id`))) left join `DB_SCEMR_PROD`.`users` `u` on((`a`.`assignedId` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `performance_report_hdr_week`
--

/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_week`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performance_report_hdr_week` AS (select `a`.`assignedId` AS `user_id`,`u`.`roleID` AS `role`,`a`.`Fullname` AS `Fullname`,cast(`p`.`total` as unsigned) AS `total`,cast(ifnull(`p`.`resolved`,0) as unsigned) AS `resolved`,cast(`p`.`reopen` as unsigned) AS `reopen`,`p`.`avg_response` AS `avg_response`,cast(round(ifnull(`r`.`avg_resolution_time_in_min`,0.00),2) as unsigned) AS `avg_resolution_time_in_min`,cast(round(ifnull(`t`.`avg_response_time_in_min`,0.00),2) as unsigned) AS `avg_response_time_in_min` from ((((((select distinct `h`.`assignedId` AS `assignedId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `Fullname` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join `DB_SCEMR_PROD`.`users` `u` on(((`u`.`id` = `h`.`assignedId`) and (`u`.`roleID` <> 11)))))) `a` left join (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) `p` on((`a`.`assignedId` = `p`.`user_id`))) left join (select `temp_table`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`temp_table`.`closed_time`,`temp_table`.`open_time`))) / 60) AS `avg_resolution_time_in_min` from (select `latest_data`.`requestId` AS `requestId`,`h`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForWeek`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForWeek` where (`userHelpdeskForWeek`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `temp_table` group by `temp_table`.`assignedId` order by `temp_table`.`assignedId`) `r` on((`a`.`assignedId` = `r`.`user_id`))) left join (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) `t` on((`a`.`assignedId` = `t`.`user_id`))) left join `DB_SCEMR_PROD`.`users` `u` on((`a`.`assignedId` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `performance_report_hdr_year`
--

/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performance_report_hdr_year` AS (select `a`.`assignedId` AS `user_id`,`u`.`roleID` AS `role`,`a`.`Fullname` AS `Fullname`,cast(`p`.`total` as unsigned) AS `total`,cast(ifnull(`p`.`resolved`,0) as unsigned) AS `resolved`,cast(`p`.`reopen` as unsigned) AS `reopen`,`p`.`avg_response` AS `avg_response`,cast(round(ifnull(`r`.`avg_resolution_time_in_min`,0.00),2) as unsigned) AS `avg_resolution_time_in_min`,cast(round(ifnull(`t`.`avg_response_time_in_min`,0.00),2) as unsigned) AS `avg_response_time_in_min` from ((((((select distinct `h`.`assignedId` AS `assignedId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `Fullname` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join `DB_SCEMR_PROD`.`users` `u` on(((`u`.`id` = `h`.`assignedId`) and (`u`.`roleID` <> 11)))))) `a` left join (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForYear` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) `p` on((`a`.`assignedId` = `p`.`user_id`))) left join (select `temp_table`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`temp_table`.`closed_time`,`temp_table`.`open_time`))) / 60) AS `avg_resolution_time_in_min` from (select `latest_data`.`requestId` AS `requestId`,`h`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForYear`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForYear` where (`userHelpdeskForYear`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `temp_table` group by `temp_table`.`assignedId` order by `temp_table`.`assignedId`) `r` on((`a`.`assignedId` = `r`.`user_id`))) left join (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForYear` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) `t` on((`a`.`assignedId` = `t`.`user_id`))) left join `DB_SCEMR_PROD`.`users` `u` on((`a`.`assignedId` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resolution_time`
--

/*!50001 DROP VIEW IF EXISTS `resolution_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `resolution_time` AS (select `temp_table`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`temp_table`.`closed_time`,`temp_table`.`open_time`))) / 60) AS `avg_resolution_time_in_min` from (select `latest_data`.`requestId` AS `requestId`,`h`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `DB_SC_HelpDesk`.`userHelpdesk`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdesk` where (`DB_SC_HelpDesk`.`userHelpdesk`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `temp_table` group by `temp_table`.`assignedId` order by `temp_table`.`assignedId`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test`
--

/*!50001 DROP VIEW IF EXISTS `test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `test` AS select `a`.`ticketId` AS `ticketId`,`a`.`title` AS `title`,`a`.`comment` AS `comment`,`a`.`created_at` AS `created_at`,`a`.`fullname` AS `fullname`,`a`.`status` AS `status`,`a`.`updated_at` AS `updated_at`,`a`.`typeId` AS `typeId`,`a`.`userId` AS `userId`,`a`.`assignedId` AS `assignedId` from ((select `h`.`id` AS `ticketId`,`h`.`title` AS `title`,`h`.`description` AS `comment`,`h`.`created_at` AS `created_at`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `fullname`,'0' AS `status`,`h`.`updated_at` AS `updated_at`,`h`.`typeId` AS `typeId`,`h`.`userId` AS `userId`,`h`.`assignedId` AS `assignedId` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SCEMR_PROD`.`users` `u` on((`u`.`id` = `h`.`userId`))) where ((`h`.`statusId` <> 2) and (not(`h`.`id` in (select distinct `c`.`ticketId` from `DB_SC_HelpDesk`.`userHelpdeskComment` `c` where (`c`.`isPublish` = 1)))))) union (select `c`.`ticketId` AS `ticketId`,`h`.`title` AS `title`,`c`.`comment` AS `comment`,`h`.`created_at` AS `created_at`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `fullname`,'1' AS `status`,`h`.`updated_at` AS `updated_at`,`h`.`typeId` AS `typeId`,`h`.`userId` AS `userId`,`h`.`assignedId` AS `assignedId` from ((`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdesk` `h` on(((`c`.`ticketId` = `h`.`id`) and (`c`.`userId` <> `h`.`assignedId`)))) join `DB_SCEMR_PROD`.`users` `u` on((`u`.`id` = `c`.`userId`))) where `c`.`id` in (select max(`c`.`id`) AS `maxid` from `DB_SC_HelpDesk`.`userHelpdeskComment` where ((`c`.`isPublish` = 1) and `c`.`ticketId` in (select `h`.`id` from `DB_SC_HelpDesk`.`userHelpdesk` `h` where (`h`.`statusId` <> 2))) group by `c`.`ticketId`)) order by `updated_at` desc) `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `testAssign`
--

/*!50001 DROP VIEW IF EXISTS `testAssign`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `testAssign` AS select `a`.`ticketId` AS `ticketId`,`a`.`title` AS `title`,`a`.`comment` AS `comment`,`a`.`created_at` AS `created_at`,`a`.`fullname` AS `fullname`,`a`.`status` AS `status`,`a`.`updated_at` AS `updated_at`,`a`.`typeId` AS `typeId`,`a`.`userId` AS `userId`,`a`.`assignedId` AS `assignedId` from ((select `h`.`id` AS `ticketId`,`h`.`title` AS `title`,`h`.`description` AS `comment`,`h`.`created_at` AS `created_at`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `fullname`,'0' AS `status`,`h`.`updated_at` AS `updated_at`,`h`.`typeId` AS `typeId`,`h`.`userId` AS `userId`,`h`.`assignedId` AS `assignedId` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SCEMR_PROD`.`users` `u` on((`u`.`id` = `h`.`userId`))) where ((`h`.`statusId` <> 2) and (not(`h`.`id` in (select distinct `c`.`ticketId` from `DB_SC_HelpDesk`.`userHelpdeskComment` `c` where (`c`.`isPublish` = 1)))))) union (select `c`.`ticketId` AS `ticketId`,`h`.`title` AS `title`,`c`.`comment` AS `comment`,`h`.`created_at` AS `created_at`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `fullname`,'1' AS `status`,`h`.`updated_at` AS `updated_at`,`h`.`typeId` AS `typeId`,`h`.`userId` AS `userId`,`h`.`assignedId` AS `assignedId` from ((`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdesk` `h` on(((`c`.`ticketId` = `h`.`id`) and (`c`.`userId` <> `h`.`assignedId`)))) join `DB_SCEMR_PROD`.`users` `u` on((`u`.`id` = `c`.`userId`))) where `c`.`id` in (select max(`c`.`id`) AS `maxid` from `DB_SC_HelpDesk`.`userHelpdeskComment` where ((`c`.`isPublish` = 1) and `c`.`ticketId` in (select `h`.`id` from `DB_SC_HelpDesk`.`userHelpdesk` `h` where (`h`.`statusId` <> 2))) group by `c`.`ticketId`)) order by `updated_at` desc) `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userHelpdeskForMonth`
--

/*!50001 DROP VIEW IF EXISTS `userHelpdeskForMonth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `userHelpdeskForMonth` AS (select `userHelpdesk`.`id` AS `id`,`userHelpdesk`.`publicUniqueId` AS `publicUniqueId`,`userHelpdesk`.`title` AS `title`,`userHelpdesk`.`description` AS `description`,`userHelpdesk`.`userId` AS `userId`,`userHelpdesk`.`behalfOf` AS `behalfOf`,`userHelpdesk`.`typeId` AS `typeId`,`userHelpdesk`.`assignedId` AS `assignedId`,`userHelpdesk`.`statusId` AS `statusId`,`userHelpdesk`.`sourceId` AS `sourceId`,`userHelpdesk`.`created_at` AS `created_at`,`userHelpdesk`.`createdTimeZone` AS `createdTimeZone`,`userHelpdesk`.`updated_at` AS `updated_at`,`userHelpdesk`.`updateTimeZone` AS `updateTimeZone`,`userHelpdesk`.`priority` AS `priority`,`userHelpdesk`.`urls` AS `urls`,`userHelpdesk`.`mail_remainder_sent_date_time` AS `mail_remainder_sent_date_time` from `userHelpdesk` where (cast(`userHelpdesk`.`created_at` as date) >= (curdate() - interval 1 month))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userHelpdeskForWeek`
--

/*!50001 DROP VIEW IF EXISTS `userHelpdeskForWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `userHelpdeskForWeek` AS (select `userHelpdesk`.`id` AS `id`,`userHelpdesk`.`publicUniqueId` AS `publicUniqueId`,`userHelpdesk`.`title` AS `title`,`userHelpdesk`.`description` AS `description`,`userHelpdesk`.`userId` AS `userId`,`userHelpdesk`.`behalfOf` AS `behalfOf`,`userHelpdesk`.`typeId` AS `typeId`,`userHelpdesk`.`assignedId` AS `assignedId`,`userHelpdesk`.`statusId` AS `statusId`,`userHelpdesk`.`sourceId` AS `sourceId`,`userHelpdesk`.`created_at` AS `created_at`,`userHelpdesk`.`createdTimeZone` AS `createdTimeZone`,`userHelpdesk`.`updated_at` AS `updated_at`,`userHelpdesk`.`updateTimeZone` AS `updateTimeZone`,`userHelpdesk`.`priority` AS `priority`,`userHelpdesk`.`urls` AS `urls`,`userHelpdesk`.`mail_remainder_sent_date_time` AS `mail_remainder_sent_date_time` from `userHelpdesk` where (cast(`userHelpdesk`.`created_at` as date) >= (curdate() - interval 1 week))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userHelpdeskForYear`
--

/*!50001 DROP VIEW IF EXISTS `userHelpdeskForYear`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `userHelpdeskForYear` AS (select `userHelpdesk`.`id` AS `id`,`userHelpdesk`.`publicUniqueId` AS `publicUniqueId`,`userHelpdesk`.`title` AS `title`,`userHelpdesk`.`description` AS `description`,`userHelpdesk`.`userId` AS `userId`,`userHelpdesk`.`behalfOf` AS `behalfOf`,`userHelpdesk`.`typeId` AS `typeId`,`userHelpdesk`.`assignedId` AS `assignedId`,`userHelpdesk`.`statusId` AS `statusId`,`userHelpdesk`.`sourceId` AS `sourceId`,`userHelpdesk`.`created_at` AS `created_at`,`userHelpdesk`.`createdTimeZone` AS `createdTimeZone`,`userHelpdesk`.`updated_at` AS `updated_at`,`userHelpdesk`.`updateTimeZone` AS `updateTimeZone`,`userHelpdesk`.`priority` AS `priority`,`userHelpdesk`.`urls` AS `urls`,`userHelpdesk`.`mail_remainder_sent_date_time` AS `mail_remainder_sent_date_time` from `userHelpdesk` where (cast(`userHelpdesk`.`created_at` as date) >= (curdate() - interval 1 year))) */;
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
