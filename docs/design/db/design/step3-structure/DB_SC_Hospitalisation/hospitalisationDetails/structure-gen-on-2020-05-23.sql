use DB_SC_Hospitalisation;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Hospitalisation
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
-- Table structure for table `hospitalisationDetails`
--

DROP TABLE IF EXISTS `hospitalisationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitalisationDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createdByUid` int(11) NOT NULL,
  `firstParentId` int(11) NOT NULL,
  `description` text NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `comments` text,
  `created_at` datetime NOT NULL,
  `createdAtTimeZone` varchar(255) NOT NULL,
  `createdAtIpAddress` varchar(255) NOT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  `discontinueNotes` text,
  `typeOfSection` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4762 DEFAULT CHARSET=latin1;
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
