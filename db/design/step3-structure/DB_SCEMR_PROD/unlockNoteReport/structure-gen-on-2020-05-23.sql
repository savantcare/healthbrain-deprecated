use DB_SCEMR_PROD;
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
-- Temporary table structure for view `unlockNoteReport`
--

DROP TABLE IF EXISTS `unlockNoteReport`;

-- failed on view `unlockNoteReport`: CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `unlockNoteReport` AS (select `t1`.`scEmployeeUID` AS `scEmployeeUID`,`t1`.`totalAppointment` AS `totalAppointment`,round(((`t2`.`days14To27` / `t1`.`totalAppointment`) * 100),2) AS `days14To27`,round(((`t2`.`days28To44` / `t1`.`totalAppointment`) * 100),2) AS `days28To44`,round(((`t2`.`days45To59` / `t1`.`totalAppointment`) * 100),2) AS `days45To59`,round(((`t2`.`daysAfter60` / `t1`.`totalAppointment`) * 100),2) AS `daysAfter60` from (((select `table1`.`scEmployeeUID` AS `scEmployeeUID`,`table1`.`eventStartDateTime` AS `eventStartDateTime`,`table1`.`totalUnlockedNote` AS `totalUnlockedNote`,`getTotalAppointmentSinceFirstUnlockedNote`(`table1`.`scEmployeeUID`,`table1`.`eventStartDateTime`) AS `totalAppointment` from (select `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`scEmployeeUID` AS `scEmployeeUID`,min(`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStartDateTime`) AS `eventStartDateTime`,count(0) AS `totalUnlockedNote` from `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport` where ((`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventTypeName` = 'Appointment') and (`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStatusName` = 'Step 4: Approved by doc') and (`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventLockStatus` = 'No')) group by `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`scEmployeeUID`) `table1` group by `table1`.`scEmployeeUID`)) `t1` join (select `table2`.`scEmployeeUID` AS `scEmployeeUID`,count(if((`table2`.`days14To27` = 1),1,NULL)) AS `days14To27`,count(if((`table2`.`days28To44` = 1),1,NULL)) AS `days28To44`,count(if((`table2`.`days45To59` = 1),1,NULL)) AS `days45To59`,count(if((`table2`.`daysAfter60` = 1),1,NULL)) AS `daysAfter60` from (select `table1`.`scEmployeeUID` AS `scEmployeeUID`,`table1`.`dateDifference` AS `dateDifference`,(case when (`table1`.`dateDifference` between 14 and 27) then 1 end) AS `days14To27`,(case when (`table1`.`dateDifference` between 28 and 44) then 1 end) AS `days28To44`,(case when (`table1`.`dateDifference` between 45 and 59) then 1 end) AS `days45To59`,(case when (`table1`.`dateDifference` >= 60) then 1 end) AS `daysAfter60` from (select `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`scEmployeeUID` AS `scEmployeeUID`,`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStartDateTime` AS `eventStartDateTime`,(to_days(curdate()) - to_days(`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStartDateTime`)) AS `dateDifference` from `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport` where ((`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventTypeName` = 'Appointment') and (`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStatusName` = 'Step 4: Approved by doc') and (`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventLockStatus` = 'No')) order by `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`scEmployeeFullName`) `table1`) `table2` group by `table2`.`scEmployeeUID`) `t2` on((`t1`.`scEmployeeUID` = `t2`.`scEmployeeUID`))))

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
