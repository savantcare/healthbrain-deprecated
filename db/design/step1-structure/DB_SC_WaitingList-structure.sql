-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_WaitingList
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
-- Current Database: `DB_SC_WaitingList`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_WaitingList` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_WaitingList`;

--
-- Table structure for table `cardCloseOrTransferDetails`
--

DROP TABLE IF EXISTS `cardCloseOrTransferDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardCloseOrTransferDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardID` int(11) NOT NULL,
  `notesID` int(11) NOT NULL,
  `type` enum('Transfer','Remove') DEFAULT NULL,
  `fromProviderID` int(11) NOT NULL,
  `toProviderID` int(11) DEFAULT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3932 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cardNotes`
--

DROP TABLE IF EXISTS `cardNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardNotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardID` int(11) NOT NULL,
  `notes` text NOT NULL,
  `type` enum('Normal','Transfer','Remove') NOT NULL DEFAULT 'Normal',
  `createdByUID` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cardQueue`
--

DROP TABLE IF EXISTS `cardQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardQueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardID` int(11) NOT NULL,
  `queueTypeID` int(11) NOT NULL,
  `updatedOnDateTime` datetime NOT NULL,
  `updatedOnTimeZone` char(3) NOT NULL,
  `updatedByUID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cardStages`
--

DROP TABLE IF EXISTS `cardStages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardStages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardID` int(11) NOT NULL,
  `stageID` int(11) NOT NULL,
  `stageActivatedOnDateTime` datetime NOT NULL,
  `stageActivatedOnTimeZone` char(3) NOT NULL,
  `stageActivatedByUID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cardUrgency`
--

DROP TABLE IF EXISTS `cardUrgency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardUrgency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardID` int(11) NOT NULL,
  `urgencyID` int(11) NOT NULL,
  `urgencyActivatedOnDateTime` datetime NOT NULL,
  `urgencyActivatedOnTimeZone` char(3) NOT NULL,
  `urgencyActivatedByUID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterCardStages`
--

DROP TABLE IF EXISTS `masterCardStages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterCardStages` (
  `cardStageID` int(11) NOT NULL AUTO_INCREMENT,
  `cardStageDesc` varchar(255) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  PRIMARY KEY (`cardStageID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterCardUrgencies`
--

DROP TABLE IF EXISTS `masterCardUrgencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterCardUrgencies` (
  `cardUrgencyID` int(11) NOT NULL AUTO_INCREMENT,
  `cardUrgencyDesc` varchar(255) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` char(3) NOT NULL,
  PRIMARY KEY (`cardUrgencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerWaitingListCards`
--

DROP TABLE IF EXISTS `providerWaitingListCards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerWaitingListCards` (
  `cardID` int(11) NOT NULL AUTO_INCREMENT,
  `providerUID` int(11) NOT NULL,
  `patientUID` int(11) NOT NULL,
  `queueTypeID` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_at_time_zone` char(3) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_at_time_zone` char(3) DEFAULT NULL,
  `created_by_UID` int(11) NOT NULL,
  `updated_by_UID` int(11) DEFAULT NULL,
  `isRemoved` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`cardID`)
) ENGINE=InnoDB AUTO_INCREMENT=3132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queueMaster`
--

DROP TABLE IF EXISTS `queueMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queueMaster` (
  `queueID` int(11) NOT NULL AUTO_INCREMENT,
  `queueName` varchar(20) NOT NULL,
  `displayChar` char(1) NOT NULL,
  PRIMARY KEY (`queueID`)
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
