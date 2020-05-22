use DB_SC_SystemHealth
-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_SystemHealth
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
-- Table structure for table `extensionMaster`
--

DROP TABLE IF EXISTS `extensionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensionMaster` (
  `id` int(11) NOT NULL,
  `extensionId` varchar(255) DEFAULT NULL,
  `extensionName` varchar(255) DEFAULT NULL,
  `extensionXML` varchar(255) DEFAULT NULL,
  `currentVersion` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensionMaster`
--

LOCK TABLES `extensionMaster` WRITE;
/*!40000 ALTER TABLE `extensionMaster` DISABLE KEYS */;
INSERT INTO `extensionMaster` VALUES (1,'hehkbecoaieccbjgfcompobmfidocmgp','Note alert','SCNoteAlertApp.xml','2019.01.30','2019-07-01 00:00:00','2019-07-11 01:20:33'),(4,'moenigakdboiaajmbnplkippbpkphkho','Education tracker','SCEducationTracker.xml','2019.01.29','2019-07-01 00:00:00','2019-07-10 03:10:39'),(5,'jofebpabpobmbakkconhoodnkibmphal','HDR','SCHelpdeskNotifier.xml','2019.12.19','2019-07-01 00:00:00','2019-12-20 00:08:07'),(7,'oklboepianicnenhiaidmalkgilnbeck','Co sign','SCCoSignApp.xml','2019.09.24','2019-07-01 00:00:00','2019-11-15 00:03:29'),(8,'kbnljikoafeihlodeahninmljnbakhjh','Profile','SCProfileApp.xml','2019.11.14','2019-07-01 00:00:00','2019-11-15 00:03:29'),(10,'jhiboimgoaknpehkkimnalbipoilmokn','Task','SCTaskdeskNotifier.xml','2018.08.23','2019-07-01 00:00:00','2019-07-10 03:10:39'),(11,'iikacioplimgeoocggghcmhepkdffppo','Search','SCSearch.xml','2020.01.25','2019-07-01 00:00:00','2020-01-25 00:12:20'),(12,'jlkhbmbodahnbfafbnjabgllgljfncnc','Clear cache\r\n','SCCleanCache.xml','2020.01.14','2019-07-01 00:00:00','2020-01-15 00:13:03'),(16,'mgibjojhiamolffenagdkmjlbjjckaoc','Red flag','red-flag-emergency-notifier.xml','2019.09.29','2019-07-01 00:00:00','2019-11-07 02:56:31'),(17,'hlgjmmneojonfpbegkgloblkjpkoooid','Custom new tab','custom-new-tab.xml','2019.09.21','2019-07-01 00:00:00','2019-09-27 00:00:56'),(18,'mifiabhchghmmldpoakpdhjahhlaiaci','Scbrain skill video helper','scbrain-skill-video-helper.xml','2019.08.28','2019-07-01 00:00:00','2019-09-04 00:01:30'),(19,'lflbmkjdoipajakpiidocnlcpnelpcpj','Smartbar\r\n','smartbar.xml','2019.08.28','2019-07-01 00:00:00','2019-09-04 00:01:30'),(20,'ckmhfdplfmbmbokodnlphjoeakgpbgjk','Yellow flag','yellow-flag-emergency-notifier.xml','2019.01.29','2019-07-01 00:00:00','2019-07-10 03:10:39'),(21,'ijiiglnpfinibkoifebijhpbhnfhnaha','Activity log','activity-log.xml','2019.07.15','2019-07-01 00:00:00','2019-07-15 04:56:41'),(22,'egfflfljddledilmhlffhomgffainode','Career highlights','career-highlights.xml','2020.01.20','2019-07-01 00:00:00','2020-01-21 00:12:37'),(23,'dpdhbbcnfeljoijaaocehlgogngpobhf','Checking note requirements','checkingnotes.xml','2019.09.16','2019-07-01 00:00:00','2019-09-14 00:01:27'),(24,'pphpiponimipdfjhppmokooonfcoajfa','Two factor authentication (TFA)','tfa.xml','2019.10.17','2019-07-01 00:00:00','2019-11-07 02:56:31'),(25,'piadodjppefiadmginjhknejmehkbkfn','User preferences','user-preferences.xml','2019.11.12','2019-07-01 00:00:00','2019-11-13 00:03:13'),(26,'nldnbcocobamoekjlaeehijjpmigaekn','Care team','careteam.xml','2019.08.28','2019-07-01 00:00:00','2019-09-04 00:01:30'),(27,'hebdmbleogfkepbdeijjhkkeaebhjbnb','Correlate','correlate.xml','2020.01.16','2019-07-01 00:00:00','2020-01-18 00:13:00'),(28,'mnbjfpkjaofhfofajohnihdmlndlmmfl','Onebox','onebox.xml','2019.08.01','2019-07-01 00:00:00','2019-08-07 00:01:37'),(29,'glnbmihngfjkanokieohbnjdgjjmfbic','Screen Recording','screen-recording.xml','2020.01.21','2019-07-01 00:00:00','2020-01-22 00:12:52'),(32,'hbkbpjaakpdcionfbdnlmgpmbbiidffc','System health diagnosis','SystemDiagnosis.xml','2019.11.19','2020-01-20 22:02:33','2020-01-20 22:02:33'),(33,'kdgdcbgbeccdddabdlicdbifohmbclli','Practice patient for doctor','practice-patient.xml','2020.01.20','2020-01-20 22:02:33','2020-01-20 22:02:33'),(35,'iogdnbaoffblgkgnomeblohekpdjemcp','SC pinned tab','SCPinnedTab.xml','2020.01.17','2020-01-20 22:06:10','2020-01-21 00:12:37');
/*!40000 ALTER TABLE `extensionMaster` ENABLE KEYS */;
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
