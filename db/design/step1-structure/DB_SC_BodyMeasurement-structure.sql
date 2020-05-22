-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_BodyMeasurement
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
-- Current Database: `DB_SC_BodyMeasurement`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_BodyMeasurement` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_BodyMeasurement`;

--
-- Table structure for table `bodyMeasurementBMI`
--

DROP TABLE IF EXISTS `bodyMeasurementBMI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBMI` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `bmiValue` decimal(10,2) NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8710 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBMINotes`
--

DROP TABLE IF EXISTS `bodyMeasurementBMINotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBMINotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementBMIID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBMI_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementBMI_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBMI_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `measurementValue` decimal(10,2) DEFAULT NULL,
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(20) DEFAULT '0',
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=4214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBloodPressure`
--

DROP TABLE IF EXISTS `bodyMeasurementBloodPressure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBloodPressure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `systolicValue` int(11) NOT NULL COMMENT 'mm Hg',
  `diastolicValue` int(11) NOT NULL COMMENT 'mm Hg',
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10254 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBloodPressureNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementBloodPressureNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBloodPressureNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementBloodPressureID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `type` enum('S','D') NOT NULL DEFAULT 'S' COMMENT 'S=systolic D= diastolic',
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBloodPressure_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementBloodPressure_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBloodPressure_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `systolicValue` int(11) unsigned DEFAULT NULL COMMENT 'mm Hg',
  `diastolicValue` int(11) unsigned DEFAULT NULL COMMENT 'mm Hg',
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=5033 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBloodSugar`
--

DROP TABLE IF EXISTS `bodyMeasurementBloodSugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBloodSugar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `bloodSugar` int(11) NOT NULL,
  `relationToMeal` enum('Before breakfast','After breakfast','Before lunch','After lunch','Before dinner','After dinner','Bed time','Other') NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBloodSugarNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementBloodSugarNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBloodSugarNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementBloodSugarID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementBloodSugar_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementBloodSugar_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementBloodSugar_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `measurementValue` decimal(10,2) DEFAULT NULL,
  `relationToMeal` enum('Before breakfast','After breakfast','Before lunch','After lunch','Before dinner','After dinner','Bed time','Other') NOT NULL,
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementChartStates`
--

DROP TABLE IF EXISTS `bodyMeasurementChartStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementChartStates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `trackerOptions` text NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementHeight`
--

DROP TABLE IF EXISTS `bodyMeasurementHeight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementHeight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `heightInInch` int(4) NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7260 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementHeightNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementHeightNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementHeightNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementHeightID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementHeight_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementHeight_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementHeight_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `heightInInch` double unsigned DEFAULT NULL,
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=3228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementOxygenSaturation`
--

DROP TABLE IF EXISTS `bodyMeasurementOxygenSaturation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementOxygenSaturation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `oxygenSaturation` int(11) NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementOxygenSaturationNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementOxygenSaturationNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementOxygenSaturationNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementOxygenSaturationID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementOxygenSaturation_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementOxygenSaturation_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementOxygenSaturation_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `oxygenSaturationValue` int(4) unsigned DEFAULT NULL COMMENT 'SaO2 , measured in % of oxygen-saturated hemoglobin relative to total hemoglobin',
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementPulse`
--

DROP TABLE IF EXISTS `bodyMeasurementPulse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementPulse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `beatsPerMinuteValue` int(4) NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firstParentId` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9634 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementPulseNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementPulseNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementPulseNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementPulseID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementPulse_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementPulse_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementPulse_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `beatsPerMinuteValue` int(4) unsigned DEFAULT NULL COMMENT 'BPM',
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=4514 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementTemperature`
--

DROP TABLE IF EXISTS `bodyMeasurementTemperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementTemperature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `temperature` decimal(10,0) NOT NULL,
  `temperatureUnit` enum('C','F') NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3817 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementTemperatureNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementTemperatureNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementTemperatureNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementTemperatureID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementTemperature_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementTemperature_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementTemperature_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `measurementValue` decimal(10,2) DEFAULT NULL,
  `temperatureUnit` enum('F','C') NOT NULL DEFAULT 'F',
  `measurementDate` datetime DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(10) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientID` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=1543 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementWaistCircumference`
--

DROP TABLE IF EXISTS `bodyMeasurementWaistCircumference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementWaistCircumference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `waistCircumference` decimal(10,2) NOT NULL,
  `waistCircumferenceUnit` enum('cm','inch') NOT NULL,
  `measurementDate` date NOT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementWaistCircumferenceNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementWaistCircumferenceNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementWaistCircumferenceNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementWaistCircumferenceID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementWaistCircumference_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementWaistCircumference_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementWaistCircumference_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `measurementValue` decimal(10,2) DEFAULT NULL,
  `waistCircumferenceUnit` enum('cm','inches') NOT NULL DEFAULT 'cm',
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientID` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementWeight`
--

DROP TABLE IF EXISTS `bodyMeasurementWeight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementWeight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `weightUnit` enum('lbs','kgs') NOT NULL,
  `measurementDate` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `notes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8616 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementWeightNotes`
--

DROP TABLE IF EXISTS `bodyMeasurementWeightNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementWeightNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bodyMeasurementWeightID` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `notes` text NOT NULL,
  `dateForNotes` datetime DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) NOT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedTimeZone` varchar(10) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodyMeasurementWeight_bk`
--

DROP TABLE IF EXISTS `bodyMeasurementWeight_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyMeasurementWeight_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `measurementValue` decimal(10,2) DEFAULT NULL,
  `weightUnit` enum('lbs','kgs') NOT NULL DEFAULT 'lbs',
  `measurementDate` datetime DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(10) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientID` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=4189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sonkaUnassignedData`
--

DROP TABLE IF EXISTS `sonkaUnassignedData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sonkaUnassignedData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `details` text CHARACTER SET utf8,
  `fileName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `dataRecordedAt` datetime DEFAULT NULL,
  `dataRecordedAtTimeZone` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(100) DEFAULT NULL,
  `updatedBy` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1=Matched 0=Not Matching 2=Added into BM',
  `isDeleted` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5864 DEFAULT CHARSET=latin1;
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
