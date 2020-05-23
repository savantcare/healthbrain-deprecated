-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_EndToEndTests_Robot
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
-- Current Database: `DB_SC_EndToEndTests_Robot`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_EndToEndTests_Robot` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_EndToEndTests_Robot`;

--
-- Table structure for table `commitDetails`
--

DROP TABLE IF EXISTS `commitDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commitDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committedId` varchar(200) NOT NULL,
  `committedRepo` varchar(100) DEFAULT NULL,
  `committedMessage` varchar(255) DEFAULT NULL,
  `committedByUserName` varchar(100) DEFAULT NULL,
  `committedByUserEmail` varchar(100) DEFAULT NULL,
  `committedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `committedId` (`committedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masterForRobot`
--

DROP TABLE IF EXISTS `masterForRobot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterForRobot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `isStatus` enum('off','on','running') NOT NULL DEFAULT 'off',
  `runForId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robotLog`
--

DROP TABLE IF EXISTS `robotLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robotLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterId` int(11) NOT NULL,
  `runForId` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `startTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterId` (`masterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testRunFor`
--

DROP TABLE IF EXISTS `testRunFor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testRunFor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testStatus` enum('passed','failed') DEFAULT NULL,
  `committedId` varchar(100) DEFAULT NULL,
  `srcFile` varchar(255) DEFAULT NULL,
  `insertOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testRunQueue`
--

DROP TABLE IF EXISTS `testRunQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testRunQueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committedId` varchar(100) DEFAULT NULL,
  `srcFile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `updateServerDetails`
--

DROP TABLE IF EXISTS `updateServerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateServerDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `runForId` int(11) NOT NULL,
  `insertedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `testRunDetailsByCommitted` (`runForId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
