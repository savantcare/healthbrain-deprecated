-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_ProviderPaymentPlans
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
-- Current Database: `DB_SC_ProviderPaymentPlans`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_ProviderPaymentPlans` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_ProviderPaymentPlans`;

--
-- Table structure for table `packageMaster`
--

DROP TABLE IF EXISTS `packageMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packageMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(255) DEFAULT NULL,
  `packageDesc` text,
  `isItLocked` enum('No','Yes') NOT NULL DEFAULT 'No',
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packagePaymentPlanLinkDetails`
--

DROP TABLE IF EXISTS `packagePaymentPlanLinkDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagePaymentPlanLinkDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageID` int(11) DEFAULT NULL,
  `paymentPlanVersionID` int(11) DEFAULT NULL,
  `parameter1Value` float(10,2) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `isItLocked` enum('No','Yes') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentPlanVersionsMaster`
--

DROP TABLE IF EXISTS `paymentPlanVersionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentPlanVersionsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Phase 1: Being developed by the programmer','Phase 2: Waiting for approval by finance team','Phase 3: Used to pay the providers') NOT NULL,
  `notes` text,
  `parameter1DefaultValue` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planColumnNamesAndVisibleStatusForProvider`
--

DROP TABLE IF EXISTS `planColumnNamesAndVisibleStatusForProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planColumnNamesAndVisibleStatusForProvider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planID` int(11) NOT NULL,
  `columnName` varchar(255) NOT NULL,
  `isVisibleToProvider` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `displayTableName` varchar(500) DEFAULT NULL,
  `uniqueColumnIDForThisPlan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `planID` (`planID`),
  CONSTRAINT `plancolumnnamesandvisiblestatusforprovider_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `paymentPlanVersionsMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerPackageLinkDetails`
--

DROP TABLE IF EXISTS `providerPackageLinkDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerPackageLinkDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerID` int(255) NOT NULL,
  `packageID` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedOnTimeZone` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
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
