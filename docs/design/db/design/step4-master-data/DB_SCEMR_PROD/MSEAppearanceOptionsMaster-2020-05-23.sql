use DB_SCEMR_PROD
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
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
-- Table structure for table `MSEAppearanceOptionsMaster`
--

DROP TABLE IF EXISTS `MSEAppearanceOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEAppearanceOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSEAppearanceOptionsMaster`
--

LOCK TABLES `MSEAppearanceOptionsMaster` WRITE;
/*!40000 ALTER TABLE `MSEAppearanceOptionsMaster` DISABLE KEYS */;
INSERT INTO `MSEAppearanceOptionsMaster` VALUES (1,'Good grooming and hygiene','2015-05-01 08:20:16',1),(2,'No apparent distress','2015-05-01 08:20:16',1),(3,'Well-developed, well-nourished','2015-05-01 08:20:16',1),(4,'Appears stated age','2015-05-01 08:20:16',1),(5,'Appears younger than stated age','2015-05-01 08:20:16',0),(6,'Appears older than stated age','2015-05-01 08:20:16',0),(7,'Obese','2015-05-01 08:20:16',0),(8,'Thin or cachectic','2015-05-01 08:20:16',0),(9,'Disheveled, unkempt','2015-05-01 08:20:16',0),(10,'Malodorous','2015-05-01 08:20:16',0),(11,'Other','2015-05-01 08:20:16',0);
/*!40000 ALTER TABLE `MSEAppearanceOptionsMaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
