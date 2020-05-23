-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Seo
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
-- Current Database: `DB_SC_Seo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Seo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Seo`;

--
-- Table structure for table `externalReviewData`
--

DROP TABLE IF EXISTS `externalReviewData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalReviewData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorId` int(11) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL,
  `reviewProviderId` int(11) NOT NULL,
  `reviewByUserName` varchar(150) DEFAULT NULL,
  `reviewContent` text NOT NULL,
  `reviewUrl` text NOT NULL,
  `reviewRating` int(11) DEFAULT NULL,
  `reviewDate` date NOT NULL,
  `reviewCreatedBy` int(11) NOT NULL,
  `reviewCreatedOn` datetime NOT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2958 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metaTypeMaster`
--

DROP TABLE IF EXISTS `metaTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metaTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metaType` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerMasterMetaContent`
--

DROP TABLE IF EXISTS `providerMasterMetaContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerMasterMetaContent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterMetaType` int(11) NOT NULL,
  `masterMetaContent` text NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `deletedByUid` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedAtTimeZone` varchar(100) DEFAULT NULL,
  `deletedFromIPAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providerMetaContent`
--

DROP TABLE IF EXISTS `providerMetaContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providerMetaContent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerId` int(11) NOT NULL,
  `metaTypeId` int(11) NOT NULL,
  `metaContents` text NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtIpAddress` varchar(100) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(100) DEFAULT NULL,
  `deletedFromIPAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reviewMasterType`
--

DROP TABLE IF EXISTS `reviewMasterType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewMasterType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewProviderType` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
