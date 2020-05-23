use DB_SCEMR_PROD;
-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `remForEventTypeAppointmentDetails`
--

DROP TABLE IF EXISTS `remForEventTypeAppointmentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remForEventTypeAppointmentDetails` (
  `eventID` int(11) unsigned NOT NULL,
  `patientID` int(10) unsigned NOT NULL,
  `reasonForVisitID` tinyint(3) unsigned DEFAULT NULL,
  `socialHistoryJsonWhenAppointmentSAPNoteIsLocked` text DEFAULT NULL,
  `diagnosisJsonWhenAppointmentSAPNoteIsLocked` text DEFAULT NULL,
  `allergiesJsonWhenAppointmentSAPNoteIsLocked` text DEFAULT NULL,
  `medicationsJsonWhenAppointmentSAPNoteIsLocked` text DEFAULT NULL,
  `hospitalizationHistoryJsonWhenAppointmentSAPNoteIsLocked` text DEFAULT NULL,
  `isSubjectiveAssessmentPlanNoteLocked` enum('Yes','No') DEFAULT NULL,
  `dateTimeSAPNoteLockedAt` datetime DEFAULT NULL,
  `dateTimeSAPNoteLockedAtTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `SAPNoteLockedBy` int(11) DEFAULT NULL,
  `pdfFileContent` longblob DEFAULT NULL,
  `pdfFileContentPasswordProtected` longblob DEFAULT NULL,
  `billingStatusOfThisAppointment` enum('Step1: Appointment note (Plan) not locked not ready for coding','Step2: Appointment note locked ready for coding','Step3: Appointment coding finished.','Step4: Partial payment received. In process for more payments.','Step5: Complete payment received') DEFAULT NULL,
  `mseReportID` int(10) unsigned DEFAULT NULL,
  `prsReportID` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `reasonForVisitDetails` text DEFAULT NULL,
  KEY `remForEventTypeAppointmentDetails_ibfk_1` (`eventID`),
  CONSTRAINT `remForEventTypeAppointmentDetails_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
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
