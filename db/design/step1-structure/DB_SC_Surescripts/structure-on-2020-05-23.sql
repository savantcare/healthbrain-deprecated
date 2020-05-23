-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Surescripts
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
-- Current Database: `DB_SC_Surescripts`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Surescripts` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Surescripts`;

--
-- Table structure for table `270MessageResponse`
--

DROP TABLE IF EXISTS `270MessageResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `270MessageResponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `270MessagesId` int(11) NOT NULL,
  `message271Response` longtext,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(3) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `270Messages`
--

DROP TABLE IF EXISTS `270Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `270Messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `message` longtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimeZone` varchar(3) NOT NULL,
  `createdByUID` int(11) unsigned NOT NULL,
  `curlRequestSend` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271CoverageDetailFromSurescript`
--

DROP TABLE IF EXISTS `271CoverageDetailFromSurescript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271CoverageDetailFromSurescript` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `271MessagesFromSurescriptId` int(11) unsigned NOT NULL,
  `271DemographicInfoByPBMId` int(11) NOT NULL,
  `eligibilityOrBenefitInformation` varchar(255) DEFAULT NULL,
  `serviceType` varchar(255) DEFAULT NULL,
  `insuranceType` varchar(255) DEFAULT NULL,
  `planCoverageDescription` varchar(255) DEFAULT NULL,
  `monetaryAmount` varchar(255) DEFAULT NULL,
  `coverageDetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271MessagesFromSurescriptId` (`271MessagesFromSurescriptId`),
  KEY `271DemographicInfoByPBMId` (`271DemographicInfoByPBMId`),
  CONSTRAINT `271coveragedetailfromsurescript_ibfk_1` FOREIGN KEY (`271MessagesFromSurescriptId`) REFERENCES `271MessagesFromSurescript` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271DemographicInfoByPBM`
--

DROP TABLE IF EXISTS `271DemographicInfoByPBM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271DemographicInfoByPBM` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PBMName` varchar(255) DEFAULT NULL,
  `PBMParticipantID` varchar(255) DEFAULT NULL,
  `PBMMemberID` varchar(255) DEFAULT NULL,
  `271MessagesFromSurescriptId` int(11) unsigned NOT NULL,
  `subscriberChangeFlag` varchar(11) DEFAULT NULL,
  `subscriberSuffixName` varchar(255) DEFAULT NULL,
  `subscriberFirstName` varchar(255) DEFAULT NULL,
  `subscriberMiddleName` varchar(255) DEFAULT NULL,
  `subscriberLastName` varchar(255) DEFAULT NULL,
  `subscriberGender` varchar(255) DEFAULT NULL,
  `subscriberDateOfBirth` varchar(255) DEFAULT NULL,
  `subscriberStreetAddress1` varchar(255) DEFAULT NULL,
  `subscriberStreetAddress2` varchar(255) DEFAULT NULL,
  `subscriberCity` varchar(255) DEFAULT NULL,
  `subscriberState` varchar(255) DEFAULT NULL,
  `subscriberZip` varchar(255) DEFAULT NULL,
  `isRequestValid` enum('Y','N') NOT NULL DEFAULT 'Y',
  `rejectReason` varchar(255) DEFAULT NULL,
  `followUpAction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271MessagesFromSurescriptId` (`271MessagesFromSurescriptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271HeaderDetailFromSurescript`
--

DROP TABLE IF EXISTS `271HeaderDetailFromSurescript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271HeaderDetailFromSurescript` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `271MessagesFromSurescriptId` int(11) unsigned NOT NULL,
  `relatesToMessageID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271MessagesFromSurescriptId` (`271MessagesFromSurescriptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterLoop`
--

DROP TABLE IF EXISTS `271MasterLoop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterLoop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loopID` varchar(255) NOT NULL,
  `loopDetail` varchar(255) DEFAULT NULL,
  `loopRepeat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentDetail`
--

DROP TABLE IF EXISTS `271MasterSegmentDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentDetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentID` varchar(255) NOT NULL,
  `segmentName` varchar(255) NOT NULL,
  `loopMasterID` int(11) unsigned NOT NULL,
  `maxUse` int(11) DEFAULT NULL,
  `loopRepeat` int(11) DEFAULT NULL,
  `usage` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `loopMasterID` (`loopMasterID`),
  CONSTRAINT `271MasterSegmentDetail_ibfk_1` FOREIGN KEY (`loopMasterID`) REFERENCES `271MasterLoop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentDetailDataElementSummary`
--

DROP TABLE IF EXISTS `271MasterSegmentDetailDataElementSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentDetailDataElementSummary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentDetailMasterId` int(11) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataElement` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `attributes` varchar(255) NOT NULL,
  `isAdditionalCode` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentDetailMasterId`),
  CONSTRAINT `271segmentdetaildataelementsummarymaster_ibfk_1` FOREIGN KEY (`segmentDetailMasterId`) REFERENCES `271MasterSegmentDetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentDetailDataElementSummaryAdditionalCode`
--

DROP TABLE IF EXISTS `271MasterSegmentDetailDataElementSummaryAdditionalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentDetailDataElementSummaryAdditionalCode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `segmentDetailDataElementSummaryMasterId` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentDetailDataElementSummaryMasterId`),
  CONSTRAINT `271segmentdetaildataelementsummarymasteradditionalcode_ibfk_1` FOREIGN KEY (`segmentDetailDataElementSummaryMasterId`) REFERENCES `271MasterSegmentDetailDataElementSummary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentHeader`
--

DROP TABLE IF EXISTS `271MasterSegmentHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentHeader` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentID` varchar(255) NOT NULL,
  `segmentName` varchar(255) NOT NULL,
  `maxUse` int(11) DEFAULT NULL,
  `usage` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentHeaderDataElementSummary`
--

DROP TABLE IF EXISTS `271MasterSegmentHeaderDataElementSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentHeaderDataElementSummary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentHeaderMasterId` int(11) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataElement` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `attributes` varchar(255) NOT NULL,
  `isAdditionalCode` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentHeaderMasterId`),
  CONSTRAINT `271MasterSegmentHeaderDataElementSummary_ibfk_1` FOREIGN KEY (`segmentHeaderMasterId`) REFERENCES `271MasterSegmentHeader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentHeaderDataElementSummaryAdditionalCode`
--

DROP TABLE IF EXISTS `271MasterSegmentHeaderDataElementSummaryAdditionalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentHeaderDataElementSummaryAdditionalCode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `segmentHeaderDataElementSummaryMasterId` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentHeaderDataElementSummaryMasterId`),
  CONSTRAINT `271MasterSegmentHeaderDataElementSummaryAdditionalCode_ibfk_1` FOREIGN KEY (`segmentHeaderDataElementSummaryMasterId`) REFERENCES `271MasterSegmentHeaderDataElementSummary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentTrailer`
--

DROP TABLE IF EXISTS `271MasterSegmentTrailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentTrailer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentID` varchar(255) NOT NULL,
  `segmentName` varchar(255) NOT NULL,
  `loopMasterID` int(11) unsigned NOT NULL,
  `maxUse` int(11) DEFAULT NULL,
  `loopRepeat` int(11) DEFAULT NULL,
  `usage` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loopMasterID` (`loopMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentTrailerDataElementSummary`
--

DROP TABLE IF EXISTS `271MasterSegmentTrailerDataElementSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentTrailerDataElementSummary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentTrailerMasterId` int(11) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataElement` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `attributes` varchar(255) NOT NULL,
  `isAdditionalCode` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `segmentTrailerMasterId` (`segmentTrailerMasterId`),
  CONSTRAINT `271segmenttrailerdataelementsummarymaster_ibfk_1` FOREIGN KEY (`segmentTrailerMasterId`) REFERENCES `271MasterSegmentTrailer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MasterSegmentTrailerDataElementSummaryAdditionalCode`
--

DROP TABLE IF EXISTS `271MasterSegmentTrailerDataElementSummaryAdditionalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentTrailerDataElementSummaryAdditionalCode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `segmentTrailerDataElementSummaryMasterId` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentTrailerDataElementSummaryMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271MessagesFromSurescript`
--

DROP TABLE IF EXISTS `271MessagesFromSurescript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MessagesFromSurescript` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `270MessagesId` int(11) NOT NULL,
  `originalMessageReceived` text NOT NULL,
  `xmlMessageArrivedAtByTransformingOriginalMessage` longtext NOT NULL,
  `xmlConversionDoneAt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `270MessagesId` (`270MessagesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `271PlanDetailFromSurescript`
--

DROP TABLE IF EXISTS `271PlanDetailFromSurescript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271PlanDetailFromSurescript` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `271MessagesFromSurescriptId` int(11) unsigned NOT NULL,
  `271CoverageDetailFromSurescriptId` int(11) unsigned NOT NULL,
  `planCoverageDescription` varchar(255) DEFAULT NULL,
  `planDate` varchar(255) DEFAULT NULL,
  `planId` varchar(11) DEFAULT NULL,
  `groupId` varchar(255) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `cardHolderId` varchar(255) DEFAULT NULL,
  `personCode` varchar(255) DEFAULT NULL,
  `FSLFile` varchar(255) DEFAULT NULL,
  `ALTFile` varchar(255) DEFAULT NULL,
  `COVFile` varchar(255) DEFAULT NULL,
  `copayFile` varchar(255) DEFAULT NULL,
  `bin` varchar(255) DEFAULT NULL,
  `PCNNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271MessagesFromSurescriptId` (`271MessagesFromSurescriptId`),
  KEY `271CoverageDetailFromSurescriptId` (`271CoverageDetailFromSurescriptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directory`
--

DROP TABLE IF EXISTS `directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory` (
  `NCPDPID` int(11) DEFAULT NULL,
  `StoreNumber` varchar(20) DEFAULT NULL,
  `OrganizationName` varchar(100) DEFAULT NULL,
  `AddressLine1` varchar(100) DEFAULT NULL,
  `AddressLine2` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `StandardizedAddressLine1` varchar(100) DEFAULT NULL,
  `StandardizedAddressLine2` varchar(100) DEFAULT NULL,
  `StandardizedCity` varchar(50) DEFAULT NULL,
  `StandardizedState` varchar(50) DEFAULT NULL,
  `StandardizedZip` int(11) DEFAULT NULL,
  `PhonePrimary` varchar(100) DEFAULT NULL,
  `Fax` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `AlternatePhoneNumbers` varchar(100) DEFAULT NULL,
  `ActiveStartTime` datetime DEFAULT NULL,
  `ActiveEndTime` datetime DEFAULT NULL,
  `ServiceLevel` varchar(100) DEFAULT NULL,
  `PartnerAccount` varchar(100) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  `CrossStreet` varchar(100) DEFAULT NULL,
  `RecordChange` varchar(100) DEFAULT NULL,
  `OldServiceLevel` varchar(100) DEFAULT NULL,
  `Version` varchar(100) DEFAULT NULL,
  `NPI` varchar(100) DEFAULT NULL,
  `SpecialtyType` varchar(100) DEFAULT NULL,
  `FileID` varchar(100) DEFAULT NULL,
  `StateLicenseNumber` varchar(100) DEFAULT NULL,
  `MedicareNumber` varchar(100) DEFAULT NULL,
  `MedicaidNumber` varchar(100) DEFAULT NULL,
  `PPONumber` varchar(100) DEFAULT NULL,
  `PayerID` varchar(100) DEFAULT NULL,
  `BINLocationNumber` varchar(100) DEFAULT NULL,
  `DEANumber` varchar(100) DEFAULT NULL,
  `HIN` varchar(100) DEFAULT NULL,
  `SecondaryCoverage` varchar(100) DEFAULT NULL,
  `NAICCode` varchar(100) DEFAULT NULL,
  `PromotionNumber` varchar(100) DEFAULT NULL,
  `SocialSecurity` varchar(100) DEFAULT NULL,
  `PriorAuthorization` varchar(100) DEFAULT NULL,
  `MutuallyDefined` varchar(100) DEFAULT NULL,
  `DirectAddress` varchar(100) DEFAULT NULL,
  `OrganizationType` varchar(100) DEFAULT NULL,
  `OrganizationID` int(11) DEFAULT NULL,
  `ParentOrganizationID` varchar(100) DEFAULT NULL,
  `Latitude` varchar(100) DEFAULT NULL,
  `Longitude` varchar(100) DEFAULT NULL,
  `Precise` varchar(100) DEFAULT NULL,
  `UseCases` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lastFetchedMedDataByCron`
--

DROP TABLE IF EXISTS `lastFetchedMedDataByCron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lastFetchedMedDataByCron` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `medDataFromSureScriptLastId` int(11) unsigned NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lastMedDataFromSureScriptId` (`medDataFromSureScriptLastId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterLast270MessageIDSubmittedToSurescripts`
--

DROP TABLE IF EXISTS `masterLast270MessageIDSubmittedToSurescripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterLast270MessageIDSubmittedToSurescripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last270MessageID` int(11) NOT NULL COMMENT 'Do not empty entry for this table',
  PRIMARY KEY (`id`),
  KEY `last270MessageID` (`last270MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterLastMedHistoryRequestIDSubmittedToSurescripts`
--

DROP TABLE IF EXISTS `masterLastMedHistoryRequestIDSubmittedToSurescripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterLastMedHistoryRequestIDSubmittedToSurescripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastMedHistoryRequestID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lastMedHistoryRequestID` (`lastMedHistoryRequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medDataByUserIdFromSureScriptByCron`
--

DROP TABLE IF EXISTS `medDataByUserIdFromSureScriptByCron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medDataByUserIdFromSureScriptByCron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `drugDescription` varchar(255) NOT NULL,
  `lastFillDate` varchar(255) NOT NULL,
  `medHistoryResponseIds` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medDataFromSureScript`
--

DROP TABLE IF EXISTS `medDataFromSureScript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medDataFromSureScript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medHistoryResponseId` int(11) NOT NULL,
  `medHistoryRequestId` int(11) unsigned NOT NULL,
  `drugDescription` varchar(255) DEFAULT NULL,
  `productCode` varchar(255) DEFAULT NULL,
  `productCodeQualifier` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `codeListQualifier` varchar(255) DEFAULT NULL,
  `unitSourceCode` varchar(255) DEFAULT NULL,
  `potencyUnitCode` varchar(255) DEFAULT NULL,
  `daysSupply` varchar(255) DEFAULT NULL,
  `lastFillDate` varchar(255) DEFAULT NULL,
  `note` text,
  `directions` text,
  PRIMARY KEY (`id`),
  KEY `medHistoryResponseId` (`medHistoryResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medHistoryErrorResponse`
--

DROP TABLE IF EXISTS `medHistoryErrorResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medHistoryErrorResponse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `medHistoryResponseId` int(11) unsigned NOT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medHistoryResponseId` (`medHistoryResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medHistoryRequest`
--

DROP TABLE IF EXISTS `medHistoryRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medHistoryRequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestXML` longtext,
  `271DemographicInfoByPBMId` int(11) DEFAULT NULL,
  `moreHistoryRequest` enum('yes','no') NOT NULL DEFAULT 'no',
  `isFilRequest` enum('yes','no') NOT NULL DEFAULT 'no',
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(11) DEFAULT NULL,
  `271MessagesFromSurescriptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271DemographicInfoByPBM271DemographicInfoByPBMId` (`271DemographicInfoByPBMId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medHistoryResponse`
--

DROP TABLE IF EXISTS `medHistoryResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medHistoryResponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medHistoryRequestId` int(11) NOT NULL,
  `responseXml` longtext,
  `moreHistoryRequest` enum('yes','no') NOT NULL DEFAULT 'no',
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medHistoryRequestId` (`medHistoryRequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
