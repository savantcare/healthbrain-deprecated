use DB_SC_HR
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_HR
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
-- Table structure for table `tm_projects`
--

DROP TABLE IF EXISTS `tm_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL,
  `project_status` enum('initiated','draft','in-progress','hold','completed') NOT NULL,
  `base_project` bigint(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `project_type` enum('billable','non_billable','revenue') NOT NULL,
  `lead_approve_ts` tinyint(4) DEFAULT NULL,
  `estimated_hrs` mediumint(5) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `initiated_date` timestamp NULL DEFAULT NULL,
  `hold_date` timestamp NULL DEFAULT NULL,
  `completed_date` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_projects_client` (`client_id`),
  KEY `FK_tm_projects_currency` (`currency_id`),
  CONSTRAINT `FK_tm_projects_client` FOREIGN KEY (`client_id`) REFERENCES `tm_clients` (`id`),
  CONSTRAINT `FK_tm_projects_currency` FOREIGN KEY (`currency_id`) REFERENCES `main_currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
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
