-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Meds_and_Refill
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
-- Current Database: `DB_SC_Meds_and_Refill`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Meds_and_Refill` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Meds_and_Refill`;

--
-- Table structure for table `medicationForms`
--

DROP TABLE IF EXISTS `medicationForms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationForms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `medicationID` int(11) unsigned DEFAULT NULL,
  `formID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicationID` (`medicationID`),
  KEY `formID` (`formID`)
) ENGINE=InnoDB AUTO_INCREMENT=1759 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationMasterForms`
--

DROP TABLE IF EXISTS `medicationMasterForms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationMasterForms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationMasterNames`
--

DROP TABLE IF EXISTS `medicationMasterNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationMasterNames` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PharmGKBAccessionId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `genericNames` text,
  `tradeNames` text,
  `brandMixtures` text,
  `type` varchar(255) DEFAULT NULL,
  `crossReferences` text,
  `smiles` text,
  `dosingGuideline` text,
  `externalVocabulary` text,
  `brandOrGeneric` enum('Brand','Generic') DEFAULT NULL,
  `maxFDAapproved` int(11) DEFAULT NULL,
  `reviewedBy` int(10) unsigned DEFAULT NULL,
  `reviewedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5513 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationMasterStrengths`
--

DROP TABLE IF EXISTS `medicationMasterStrengths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationMasterStrengths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `strength` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationPatients`
--

DROP TABLE IF EXISTS `medicationPatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationPatients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueMedicineId` varchar(36) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `medicineID` int(11) unsigned DEFAULT NULL,
  `formID` int(11) unsigned DEFAULT NULL,
  `strengthID` int(11) unsigned DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT 'This field decides whether the medicationPatients is locked or not',
  `startDate` date DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `frequency` text,
  `noteToPharmacist` text,
  `prescribedBy` int(11) DEFAULT NULL,
  `graphColor` varchar(255) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUid` int(10) DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedByUid` int(20) DEFAULT NULL,
  `discontinuedTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `uidOfDoctor` (`uidOfDoctor`),
  KEY `medicineID` (`medicineID`),
  KEY `formID` (`formID`),
  KEY `strengthID` (`strengthID`)
) ENGINE=InnoDB AUTO_INCREMENT=22015 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_medicine` BEFORE INSERT ON `medicationPatients` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Meds_and_Refill' AND TABLE_NAME = 'medicationPatients' INTO @P2;
    Select uuid_v4_custom_medicine(@P2) INTO @P1;
    IF (NEW.publicUniqueMedicineId IS NULL) THEN
    	SET NEW.publicUniqueMedicineId = @P1;
    ELSEIF (NEW.publicUniqueMedicineId = '') THEN
    	SET NEW.publicUniqueMedicineId = @P1;  
	ELSE
    	SET NEW.publicUniqueMedicineId = NEW.publicUniqueMedicineId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medicationPatientsNotes`
--

DROP TABLE IF EXISTS `medicationPatientsNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationPatientsNotes` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `medicationPatientsId` int(50) NOT NULL,
  `notes` mediumtext NOT NULL,
  `around_which_date` date DEFAULT NULL,
  `createdByUID` int(20) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdTimeZone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5911 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationPatientsRefillRequest`
--

DROP TABLE IF EXISTS `medicationPatientsRefillRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationPatientsRefillRequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientsMedicationOrderID` int(11) DEFAULT NULL,
  `noOfRefill` int(11) DEFAULT NULL,
  `uidOfPatient` int(11) DEFAULT NULL,
  `createdByUid` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationRefill`
--

DROP TABLE IF EXISTS `medicationRefill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationRefill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `medicationPatientID` int(11) unsigned DEFAULT '0',
  `uidOfCreatedBy` int(11) unsigned DEFAULT '0',
  `uidPrescribeBy` int(11) DEFAULT NULL,
  `uidPrescribedBy` int(11) DEFAULT NULL,
  `numberOfRefills` int(11) unsigned DEFAULT '0',
  `qty` int(11) unsigned DEFAULT '0',
  `toBeOrderedOn` date DEFAULT NULL,
  `noteForPatient` text,
  `status` tinyint(3) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(3) DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `isDeleted` int(1) NOT NULL,
  `directionsForPatient` text,
  PRIMARY KEY (`id`),
  KEY `medsPatientIdWithMedsRefill` (`medicationPatientID`),
  KEY `statusId` (`status`),
  CONSTRAINT `medicationRefill_ibfk_1` FOREIGN KEY (`medicationPatientID`) REFERENCES `medicationPatients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationRefillMasterSteps`
--

DROP TABLE IF EXISTS `medicationRefillMasterSteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationRefillMasterSteps` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `step` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationsStrengths`
--

DROP TABLE IF EXISTS `medicationsStrengths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationsStrengths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `medicationID` int(11) unsigned DEFAULT NULL,
  `strengthID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicationID` (`medicationID`),
  KEY `strengthID` (`strengthID`)
) ENGINE=InnoDB AUTO_INCREMENT=2059 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medsFromOtherDoctors`
--

DROP TABLE IF EXISTS `medsFromOtherDoctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medsFromOtherDoctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publicUniqueMedsId` varchar(36) DEFAULT NULL,
  `uidOfPatient` int(11) NOT NULL,
  `NDCCode` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `providerName` varchar(255) DEFAULT NULL,
  `createdByUid` int(11) NOT NULL,
  `status` enum('verified','not verified') NOT NULL DEFAULT 'not verified',
  `statusApprovedByUid` int(11) DEFAULT NULL,
  `statusApprovedOnDate` datetime DEFAULT NULL,
  `statusApprovedOnTimeZone` varchar(10) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  `discontinueByUid` int(11) DEFAULT NULL,
  `discontinueOnDateTime` datetime DEFAULT NULL,
  `discontinueOnTimeZone` varchar(25) DEFAULT NULL,
  `discontinueReason` text,
  `isDeleted` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1299 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_meds` BEFORE INSERT ON `medsFromOtherDoctors` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Meds_and_Refill' AND TABLE_NAME = 'medsFromOtherDoctors' INTO @P2;
    Select uuid_v4_custom_medicine(@P2) INTO @P1;
    IF (NEW.publicUniqueMedsId IS NULL) THEN
    	SET NEW.publicUniqueMedsId = @P1;
    ELSEIF (NEW.publicUniqueMedsId = '') THEN
    	SET NEW.publicUniqueMedsId = @P1;  
	ELSE
    	SET NEW.publicUniqueMedsId = NEW.publicUniqueMedsId;
    END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medsFromOtherDoctors_bk`
--

DROP TABLE IF EXISTS `medsFromOtherDoctors_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medsFromOtherDoctors_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publicUniqueMedsId` varchar(36) DEFAULT NULL,
  `uidOfPatient` int(11) NOT NULL,
  `NDCCode` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `providerName` varchar(255) DEFAULT NULL,
  `createdByUid` int(11) NOT NULL,
  `status` enum('verified','not verified') NOT NULL DEFAULT 'not verified',
  `statusApprovedByUid` int(11) DEFAULT NULL,
  `statusApprovedOnDate` datetime DEFAULT NULL,
  `statusApprovedOnTimeZone` varchar(10) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  `discontinueByUid` int(11) DEFAULT NULL,
  `discontinueOnDateTime` datetime DEFAULT NULL,
  `discontinueOnTimeZone` varchar(25) DEFAULT NULL,
  `discontinueReason` text,
  `isItLocked` varchar(5) NOT NULL DEFAULT 'yes',
  `isDeleted` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientsMedicationOrder`
--

DROP TABLE IF EXISTS `patientsMedicationOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientsMedicationOrder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `drugCode` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_at_timezone` varchar(50) DEFAULT NULL,
  `isItLocked` enum('no','yes') NOT NULL DEFAULT 'no',
  `noteToPharmacist` text,
  `directionToPatient` text,
  `deletedByUid` int(11) DEFAULT NULL,
  `deletedDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(11) DEFAULT NULL,
  `discontinueByUid` int(11) DEFAULT NULL,
  `discontinueOnDateTime` datetime DEFAULT NULL,
  `discontinueOnTimeZone` varchar(10) DEFAULT NULL,
  `discontinueReason` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `numberOfRefills` varchar(255) DEFAULT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `daysSupply` varchar(255) DEFAULT NULL,
  `isDispenseAsWritten` varchar(255) DEFAULT NULL,
  `submittedToAllscriptUID` int(11) DEFAULT NULL,
  `submittedToAllscriptDateTime` datetime DEFAULT NULL,
  `submittedToAllscripTimeZone` varchar(255) DEFAULT NULL,
  `pharmacyNCPDPID` varchar(255) DEFAULT NULL,
  `pharmacySCID` varchar(255) DEFAULT NULL,
  `otherNote` varchar(255) DEFAULT NULL,
  `orderingProviderId` int(11) DEFAULT NULL,
  `isDraft` int(4) NOT NULL DEFAULT '0',
  `isCancelled` int(4) NOT NULL DEFAULT '0',
  `medicationEffectFrom` datetime DEFAULT NULL,
  `surescriptsStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=Not Submit 1= Submit but not verified 2=Error from response 3=Pending 4=Verified(010) status 5=CancelRx pending(000) 6=CancelRx done',
  `autoHdr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `medicationForPatientId` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=36666 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientsMedicationOrder_bk-17Jan2020`
--

DROP TABLE IF EXISTS `patientsMedicationOrder_bk-17Jan2020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientsMedicationOrder_bk-17Jan2020` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `drugCode` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_at_timezone` varchar(50) DEFAULT NULL,
  `isItLocked` enum('no','yes') NOT NULL DEFAULT 'no',
  `noteToPharmacist` text,
  `directionToPatient` text,
  `deletedByUid` int(11) DEFAULT NULL,
  `deletedDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(11) DEFAULT NULL,
  `discontinueByUid` int(11) DEFAULT NULL,
  `discontinueOnDateTime` datetime DEFAULT NULL,
  `discontinueOnTimeZone` varchar(10) DEFAULT NULL,
  `discontinueReason` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `numberOfRefills` varchar(255) DEFAULT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `daysSupply` varchar(255) DEFAULT NULL,
  `isDispenseAsWritten` varchar(255) DEFAULT NULL,
  `submittedToAllscriptUID` int(11) DEFAULT NULL,
  `submittedToAllscriptDateTime` datetime DEFAULT NULL,
  `submittedToAllscripTimeZone` varchar(255) DEFAULT NULL,
  `pharmacyNCPDPID` varchar(255) DEFAULT NULL,
  `pharmacySCID` varchar(255) DEFAULT NULL,
  `otherNote` varchar(255) DEFAULT NULL,
  `orderingProviderId` int(11) DEFAULT NULL,
  `isDraft` int(4) NOT NULL DEFAULT '0',
  `isCancelled` int(4) NOT NULL DEFAULT '0',
  `medicationEffectFrom` datetime DEFAULT NULL,
  `surescriptsStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=Not Submit 1= Submit but not verified 2=Error from response 3=Pending 4=Verified(010) status 5=CancelRx pending(000) 6=CancelRx done',
  `autoHdr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35541 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scMedsReconcillation`
--

DROP TABLE IF EXISTS `scMedsReconcillation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scMedsReconcillation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientsMedicationOrderID` int(11) NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `uidOfPatient` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
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
