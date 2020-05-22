-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Allergies
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
-- Current Database: `DB_SC_Allergies`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_Allergies` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_Allergies`;

--
-- Table structure for table `allergies`
--

DROP TABLE IF EXISTS `allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUId` int(11) DEFAULT NULL,
  `firstParentId` int(11) DEFAULT NULL,
  `allergen` varchar(255) DEFAULT NULL,
  `reactions` varchar(255) DEFAULT NULL,
  `onset` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAtTimeZone` varchar(50) DEFAULT NULL,
  `createdAtIpAddress` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(5) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(50) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UID` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1568 DEFAULT CHARSET=latin1 COMMENT='1. spelling for severity is incorrect added by VK on 27/7';
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
