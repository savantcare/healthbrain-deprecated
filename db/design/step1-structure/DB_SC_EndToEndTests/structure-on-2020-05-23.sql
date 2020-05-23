-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_EndToEndTests
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
-- Current Database: `DB_SC_EndToEndTests`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_EndToEndTests` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_EndToEndTests`;

--
-- Table structure for table `specMaster`
--

DROP TABLE IF EXISTS `specMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specName` varchar(255) DEFAULT NULL COMMENT 'The size is set 80 by VK since test names have to be succint. Since others will be referring to them',
  `testCaseCreatedByUID` int(11) DEFAULT NULL,
  `created_on` varchar(255) DEFAULT NULL,
  `status` enum('written','planned') DEFAULT 'planned',
  `urlToTestFileOnGitlab` text,
  `endToEndTestCreatedByUID` int(11) DEFAULT NULL,
  `codeEnv` set('staging','prod') NOT NULL DEFAULT 'staging',
  `notes` varchar(255) DEFAULT NULL,
  `suiteID` int(10) NOT NULL COMMENT 'In the dashboard this is shown as category',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specResults`
--

DROP TABLE IF EXISTS `specResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specResults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterTestID` int(11) NOT NULL,
  `ranOn` varchar(255) NOT NULL,
  `ranOnTimeZone` varchar(255) DEFAULT NULL,
  `result` enum('passed','failed') NOT NULL DEFAULT 'failed',
  `testBaseURL` varchar(255) NOT NULL,
  `failedExpectationsMessage` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14312 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `suiteMaster`
--

DROP TABLE IF EXISTS `suiteMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suiteMaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `suiteName` varchar(255) NOT NULL,
  `parentSuiteId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `syncSummary`
--

DROP TABLE IF EXISTS `syncSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syncSummary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('DBFromProdToStaging','CodeFromStagingToProd') NOT NULL,
  `doneOn` datetime NOT NULL,
  `commitIDForTypeCodeFromStagingToProd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totalTimeTakenBySpecInSeconds`
--

DROP TABLE IF EXISTS `totalTimeTakenBySpecInSeconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totalTimeTakenBySpecInSeconds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specMasterId` int(11) unsigned NOT NULL,
  `totalTimeTakenBySpecInSeconds` int(11) NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13944 DEFAULT CHARSET=latin1;
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
