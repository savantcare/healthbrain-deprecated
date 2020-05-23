-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Monitoring
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
-- Current Database: `DB_SC_Monitoring`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Monitoring` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Monitoring`;

--
-- Table structure for table `activityLog`
--

DROP TABLE IF EXISTS `activityLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `conditionID` int(11) NOT NULL,
  `frequencyID` int(11) NOT NULL,
  `oldValue` text,
  `newValue` text,
  `activityDoneBy` int(11) NOT NULL,
  `activityDoneOn` datetime NOT NULL,
  `activityDoneOnTimeZone` varchar(3) NOT NULL,
  `activityType` enum('Insert','Update','Delete') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cellAvailableDetailsMaster`
--

DROP TABLE IF EXISTS `cellAvailableDetailsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellAvailableDetailsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(255) NOT NULL,
  `frequencyID` int(11) NOT NULL,
  `conditionID` int(11) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdatedBy` int(11) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  `lastUpdatedOnTimeZone` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conditionOfMonitoringNameMaster`
--

DROP TABLE IF EXISTS `conditionOfMonitoringNameMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditionOfMonitoringNameMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `select_option_details` text,
  `monitoring_type_id` tinyint(4) NOT NULL DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_on_time_zone` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitoring_type_id` (`monitoring_type_id`),
  CONSTRAINT `conditionOfMonitoringNameMaster_ibfk_1` FOREIGN KEY (`monitoring_type_id`) REFERENCES `monitoringType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conditionOfMonitoringTypeMaster`
--

DROP TABLE IF EXISTS `conditionOfMonitoringTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditionOfMonitoringTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = normal, 1 = with data select option',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cronCreatedForCacheUsedBySmartBarAgentToDisplayRequiredData`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedBySmartBarAgentToDisplayRequiredData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedBySmartBarAgentToDisplayRequiredData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `drug_name` varchar(255) NOT NULL,
  `monitoring_type_id` tinyint(4) NOT NULL,
  `medication_start_date` date NOT NULL,
  `condition_id` int(11) NOT NULL,
  `condition_name` varchar(255) NOT NULL,
  `frequency_id` int(11) NOT NULL,
  `frequency_name` varchar(255) NOT NULL,
  `data_required_from_date` date NOT NULL,
  `insert_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3230 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencyOfMonitoringNameMaster`
--

DROP TABLE IF EXISTS `frequencyOfMonitoringNameMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencyOfMonitoringNameMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `no_of_days_when_meds_prescribed` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_on_time_zone` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `frequencyOfMonitoringNameMaster_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `frequencyOfMonitoringTypeMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frequencyOfMonitoringTypeMaster`
--

DROP TABLE IF EXISTS `frequencyOfMonitoringTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencyOfMonitoringTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationWiseConfigurationDetails`
--

DROP TABLE IF EXISTS `medicationWiseConfigurationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationWiseConfigurationDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) NOT NULL,
  `is_it_condition_or_frequency` enum('Condition','Frequency') NOT NULL,
  `condition_or_frequency_id` int(11) NOT NULL,
  `specifier` text,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_on_time_zone` varchar(3) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_on_time_zone` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicationWiseConsentConfigurationDetails`
--

DROP TABLE IF EXISTS `medicationWiseConsentConfigurationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationWiseConsentConfigurationDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) NOT NULL,
  `consent_question_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_on_time_zone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitoringDataPointsInEMR`
--

DROP TABLE IF EXISTS `monitoringDataPointsInEMR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoringDataPointsInEMR` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_of_monitoring_id` int(11) NOT NULL,
  `db_name` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `data_field_names` varchar(255) NOT NULL,
  `data_display_pattern` varchar(255) NOT NULL COMMENT 'Use $ symbol with field name to design, e.g. : $id,$name,$value etc.',
  `where_filed_names` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condition_of_monitoring_id` (`condition_of_monitoring_id`),
  CONSTRAINT `monitoringDataPointsInEMR_ibfk_1` FOREIGN KEY (`condition_of_monitoring_id`) REFERENCES `conditionOfMonitoringNameMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitoringType`
--

DROP TABLE IF EXISTS `monitoringType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoringType` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientMonitoringDetails`
--

DROP TABLE IF EXISTS `patientMonitoringDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientMonitoringDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `frequencyID` int(11) NOT NULL,
  `conditionID` int(11) NOT NULL,
  `value` text,
  `isJsonData` enum('Yes','No') NOT NULL DEFAULT 'No',
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` varchar(3) NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedOnTimeZone` varchar(3) DEFAULT NULL,
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
