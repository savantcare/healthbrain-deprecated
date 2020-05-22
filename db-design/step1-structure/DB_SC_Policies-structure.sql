-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Policies
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
-- Current Database: `DB_SC_Policies`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Policies` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Policies`;

--
-- Table structure for table `policies`
--

DROP TABLE IF EXISTS `policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfPatientWhoSignedThePolicy` int(11) unsigned DEFAULT NULL,
  `policyMasterID` tinyint(4) unsigned DEFAULT NULL,
  `uploadID` int(11) DEFAULT NULL,
  `status` enum('Not signed','Draft','Signed') NOT NULL DEFAULT 'Not signed',
  `fillableValuesFromPolicy` text NOT NULL,
  `signature` blob NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policyForWhichPatient` (`uidOfPatientWhoSignedThePolicy`),
  KEY `policyType` (`policyMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=31424 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policiesMaster`
--

DROP TABLE IF EXISTS `policiesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policiesMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `content` text,
  `versionNumberOfPolicy` tinyint(3) unsigned NOT NULL,
  `createdAtDateTime` varchar(128) DEFAULT NULL,
  `createdTimeZone` varchar(100) DEFAULT NULL,
  `createdBy` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policiesUploadedDocuments`
--

DROP TABLE IF EXISTS `policiesUploadedDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policiesUploadedDocuments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uploadID` int(11) unsigned NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL,
  `fileType` varchar(128) NOT NULL,
  `uploadedAtDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uploadID` (`uploadID`)
) ENGINE=InnoDB AUTO_INCREMENT=1503 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policiesUploadedDocumentsTemp`
--

DROP TABLE IF EXISTS `policiesUploadedDocumentsTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policiesUploadedDocumentsTemp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tempID` varchar(128) NOT NULL DEFAULT '0',
  `fileContent` longblob,
  `fileName` varchar(128) NOT NULL,
  `fileType` varchar(128) NOT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uidOfPatient` (`uidOfPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=1311 DEFAULT CHARSET=latin1;
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
