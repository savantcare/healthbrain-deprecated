-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_OfficialLetter
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
-- Current Database: `DB_SC_OfficialLetter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_OfficialLetter` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_OfficialLetter`;

--
-- Table structure for table `actionMaster`
--

DROP TABLE IF EXISTS `actionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actionMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `savedLetterTemplate`
--

DROP TABLE IF EXISTS `savedLetterTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savedLetterTemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdByUID` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  `templateName` varchar(255) NOT NULL,
  `letterSubject` text,
  `letterText` text,
  `letterClosingText` text,
  `isDeleted` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Not deleted, 1= deleted',
  `deletedBy` int(11) DEFAULT NULL,
  `deletedOn` datetime DEFAULT NULL,
  `deletedOnTimeZone` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `savedOrSentLetterDetails`
--

DROP TABLE IF EXISTS `savedOrSentLetterDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savedOrSentLetterDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `letterJsonObject` text NOT NULL,
  `letterDate` date NOT NULL,
  `letterClosingText` text NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedOnTimeZone` char(3) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `actionID` int(11) DEFAULT NULL,
  `fullJsonObject` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4601 DEFAULT CHARSET=latin1;
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
