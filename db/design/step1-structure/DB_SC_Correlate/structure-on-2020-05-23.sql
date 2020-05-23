-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Correlate
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
-- Current Database: `DB_SC_Correlate`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Correlate` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Correlate`;

--
-- Table structure for table `correlatedMeasurementOfPatient`
--

DROP TABLE IF EXISTS `correlatedMeasurementOfPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlatedMeasurementOfPatient` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeID` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `value` float(6,2) NOT NULL,
  `measurementDate` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  KEY `userID` (`uid`),
  KEY `patientID` (`uidOfPatient`),
  KEY `uidOfPatient` (`uidOfPatient`),
  CONSTRAINT `correlatedMeasurementOfPatient_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `dataSeriesMasterNames` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataSeriesMasterGroupNames`
--

DROP TABLE IF EXISTS `dataSeriesMasterGroupNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSeriesMasterGroupNames` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `correlatedTypeName` varchar(100) NOT NULL,
  `createdAtTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataSeriesMasterNames`
--

DROP TABLE IF EXISTS `dataSeriesMasterNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSeriesMasterNames` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `typeID` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  CONSTRAINT `dataSeriesMasterNames_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `dataSeriesMasterGroupNames` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
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
