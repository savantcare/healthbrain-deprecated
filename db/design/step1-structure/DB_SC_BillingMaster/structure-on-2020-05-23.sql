-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_BillingMaster
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
-- Current Database: `DB_SC_BillingMaster`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_BillingMaster` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_BillingMaster`;

--
-- Table structure for table `billingCodeMaster`
--

DROP TABLE IF EXISTS `billingCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingCodeMaster` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `combinatorID` int(10) unsigned NOT NULL,
  `billingCodeForNewAppointment` varchar(255) NOT NULL,
  `billingCodeForFollowUpAppointment` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codesForAppointmentTimeMaster`
--

DROP TABLE IF EXISTS `codesForAppointmentTimeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codesForAppointmentTimeMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `appointmentType` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdById` int(11) unsigned NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conflictRelationshipBetweenCods`
--

DROP TABLE IF EXISTS `conflictRelationshipBetweenCods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conflictRelationshipBetweenCods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `codeThatConflict` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examHistoryMdmCombinator`
--

DROP TABLE IF EXISTS `examHistoryMdmCombinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examHistoryMdmCombinator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `examID` int(10) unsigned NOT NULL,
  `historyID` int(10) unsigned NOT NULL,
  `MdmID` int(10) unsigned NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examMaster`
--

DROP TABLE IF EXISTS `examMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examMaster` (
  `examID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historyMaster`
--

DROP TABLE IF EXISTS `historyMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historyMaster` (
  `historyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`historyID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interactiveComplexityCodeMaster`
--

DROP TABLE IF EXISTS `interactiveComplexityCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactiveComplexityCodeMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `interactiveComplexityID` int(11) unsigned NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interactiveComplexityMaster`
--

DROP TABLE IF EXISTS `interactiveComplexityMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactiveComplexityMaster` (
  `interactiveComplexityID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`interactiveComplexityID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mdmMaster`
--

DROP TABLE IF EXISTS `mdmMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdmMaster` (
  `mdmID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mdmID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requireCodesForCode`
--

DROP TABLE IF EXISTS `requireCodesForCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requireCodesForCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `requireCode` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requireServiceStatementsForCode`
--

DROP TABLE IF EXISTS `requireServiceStatementsForCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requireServiceStatementsForCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `serviceStatementID` int(11) DEFAULT NULL,
  `createdByUID` int(11) DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scBrainCodeSkillState`
--

DROP TABLE IF EXISTS `scBrainCodeSkillState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scBrainCodeSkillState` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cptCodeForLos` varchar(11) DEFAULT NULL,
  `cptCodeForTimeInPsytx` varchar(11) DEFAULT NULL,
  `cptCodeForInteractiveComplexity` varchar(11) DEFAULT NULL,
  `cptCodeForCustomCodeJsonData` text,
  `historyID` int(11) DEFAULT NULL,
  `examID` int(11) DEFAULT NULL,
  `mdmID` int(11) DEFAULT NULL,
  `timeInPsytxID` int(11) DEFAULT NULL,
  `isTimeInPsytxCodeWithLos` varchar(11) NOT NULL DEFAULT 'no',
  `interactiveComplexityID` int(11) DEFAULT NULL,
  `timeForAppointmentId` int(11) DEFAULT NULL,
  `timeForAppointmentCode` varchar(255) DEFAULT NULL,
  `codeIsLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `codeIsSubmittedToCodingDept` enum('Yes','No') DEFAULT 'No',
  `isCodingFinished` enum('yes','no') NOT NULL DEFAULT 'no',
  `isFinishedIncomingPaymentEntriesByAutomatedScripts` enum('no','yes') NOT NULL DEFAULT 'no',
  `evaluationAndManagementCodeSelectedType` varchar(255) DEFAULT NULL,
  `notesForCodingDept` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `eventID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36872 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeInPsytxCodeMaster`
--

DROP TABLE IF EXISTS `timeInPsytxCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeInPsytxCodeMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timeInPsytxID` int(10) unsigned NOT NULL,
  `codeWithLos` varchar(255) DEFAULT NULL,
  `codeWithoutLos` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timeInPsytxID` (`timeInPsytxID`),
  CONSTRAINT `timeInPsytxCodeMaster_ibfk_1` FOREIGN KEY (`timeInPsytxID`) REFERENCES `timeInPsytxMaster` (`timeInPsytxID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeInPsytxCodeMasterForTherapist`
--

DROP TABLE IF EXISTS `timeInPsytxCodeMasterForTherapist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeInPsytxCodeMasterForTherapist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timeInPsytxID` int(10) unsigned NOT NULL,
  `codeWithLos` varchar(255) DEFAULT NULL,
  `codeWithoutLos` varchar(255) DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timeInPsytxID` (`timeInPsytxID`),
  CONSTRAINT `timeInPsytxCodeMasterForTherapist_ibfk_1` FOREIGN KEY (`timeInPsytxID`) REFERENCES `timeInPsytxMaster` (`timeInPsytxID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeInPsytxMaster`
--

DROP TABLE IF EXISTS `timeInPsytxMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeInPsytxMaster` (
  `timeInPsytxID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`timeInPsytxID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
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
