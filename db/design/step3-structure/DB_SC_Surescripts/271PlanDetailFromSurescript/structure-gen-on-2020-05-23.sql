use DB_SC_Surescripts
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Surescripts
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1-log

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
-- Table structure for table `271PlanDetailFromSurescript`
--

DROP TABLE IF EXISTS `271PlanDetailFromSurescript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271PlanDetailFromSurescript` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `271MessagesFromSurescriptId` int(11) unsigned NOT NULL,
  `271CoverageDetailFromSurescriptId` int(11) unsigned NOT NULL,
  `planCoverageDescription` varchar(255) DEFAULT NULL,
  `planDate` varchar(255) DEFAULT NULL,
  `planId` varchar(11) DEFAULT NULL,
  `groupId` varchar(255) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `cardHolderId` varchar(255) DEFAULT NULL,
  `personCode` varchar(255) DEFAULT NULL,
  `FSLFile` varchar(255) DEFAULT NULL,
  `ALTFile` varchar(255) DEFAULT NULL,
  `COVFile` varchar(255) DEFAULT NULL,
  `copayFile` varchar(255) DEFAULT NULL,
  `bin` varchar(255) DEFAULT NULL,
  `PCNNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271MessagesFromSurescriptId` (`271MessagesFromSurescriptId`),
  KEY `271CoverageDetailFromSurescriptId` (`271CoverageDetailFromSurescriptId`)
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
