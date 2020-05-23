use DB_SC_Drive
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Drive
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
-- Table structure for table `driveFilesViewer`
--

DROP TABLE IF EXISTS `driveFilesViewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driveFilesViewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driveFilesMasterId` int(11) DEFAULT NULL,
  `videoId` int(11) NOT NULL,
  `uidOfViewedBy` int(11) unsigned NOT NULL,
  `createdOnTimezone` varchar(10) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `viewedTimeInSecond` int(11) DEFAULT NULL,
  `totalTimeInSecond` int(11) DEFAULT NULL,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `driveFilesMasterId` (`videoId`),
  KEY `usersIdx` (`uidOfViewedBy`),
  CONSTRAINT `driveFilesViewer_ibfk_2` FOREIGN KEY (`videoId`) REFERENCES `driveFilesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1149 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
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
