use DB_SC_HR_V4;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_HR_V4
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
-- Table structure for table `ohrm_selected_group_field`
--

DROP TABLE IF EXISTS `ohrm_selected_group_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ohrm_selected_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `summary_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_field_id`,`summary_display_field_id`,`report_id`),
  KEY `group_field_id` (`group_field_id`),
  KEY `summary_display_field_id` (`summary_display_field_id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `ohrm_selected_group_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  CONSTRAINT `ohrm_selected_group_field_ibfk_2` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`) ON DELETE CASCADE,
  CONSTRAINT `ohrm_selected_group_field_ibfk_3` FOREIGN KEY (`summary_display_field_id`) REFERENCES `ohrm_summary_display_field` (`summary_display_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
