use DB_SC_Medical_ReviewOfSystems
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Medical_ReviewOfSystems
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
-- Table structure for table `userSubmittedMaster`
--

DROP TABLE IF EXISTS `userSubmittedMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSubmittedMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` enum('progression','success') NOT NULL,
  `masterCreatedIdForSubmitted` int(11) DEFAULT NULL,
  `masterCreatedId` int(11) DEFAULT NULL,
  `masterDeletedId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userSubmittedMaster`
--

LOCK TABLES `userSubmittedMaster` WRITE;
/*!40000 ALTER TABLE `userSubmittedMaster` DISABLE KEYS */;
INSERT INTO `userSubmittedMaster` VALUES (38,636,'success',174,172,NULL),(39,636,'success',175,175,NULL),(40,4715,'success',356,176,NULL),(48,7,'success',224,193,NULL),(52,13579,'success',268,252,NULL),(53,978,'success',285,269,NULL),(54,4396,'progression',NULL,286,NULL),(55,7,'success',313,313,NULL),(56,14581,'success',330,314,NULL),(57,14326,'success',348,331,NULL),(58,538,'success',349,349,NULL),(59,538,'success',350,350,NULL),(60,538,'success',351,351,NULL),(61,538,'success',352,352,NULL),(62,538,'success',353,353,NULL),(63,538,'success',354,354,NULL),(64,538,'success',355,355,NULL),(65,4715,'success',357,357,NULL),(66,4715,'success',358,358,NULL),(67,538,'success',359,359,NULL),(68,4715,'success',360,360,NULL),(69,4715,'success',361,361,NULL),(70,12660,'success',378,362,NULL),(71,14486,'success',394,379,NULL),(72,4991,'success',419,395,NULL),(73,14942,'success',436,420,NULL),(74,12395,'progression',NULL,437,NULL),(75,14800,'progression',NULL,445,NULL),(76,14902,'success',467,447,NULL),(77,13325,'progression',NULL,468,NULL),(78,10921,'progression',NULL,483,NULL),(79,12562,'success',503,488,NULL),(80,15064,'success',520,504,NULL),(81,10581,'success',538,521,NULL),(82,12055,'success',554,539,NULL),(83,12055,'success',555,555,NULL),(84,13833,'success',578,556,NULL),(85,13710,'success',594,579,NULL),(86,15155,'success',615,595,NULL),(87,4598,'success',634,616,NULL),(88,11884,'success',655,635,NULL),(89,13579,'success',660,656,NULL),(90,1528,'success',678,661,NULL),(91,13520,'success',695,679,NULL),(92,14581,'success',696,696,NULL),(93,4715,'success',697,697,NULL),(94,4715,'success',707,698,NULL),(95,11649,'success',725,708,NULL),(96,14089,'success',751,726,NULL),(97,15521,'success',769,752,NULL),(98,4715,'success',770,770,NULL),(99,14997,'success',788,771,NULL),(100,11674,'success',804,789,NULL),(101,15274,'success',821,805,NULL),(102,4991,'success',823,822,NULL),(103,4715,'success',824,824,NULL),(104,12122,'success',842,825,NULL),(105,13703,'success',860,843,NULL),(106,14910,'success',876,861,NULL),(107,15425,'success',899,877,NULL),(108,9844,'success',921,900,NULL),(109,13493,'success',922,922,NULL),(110,2551,'success',923,923,NULL),(111,14112,'success',924,924,NULL),(112,15341,'success',925,925,NULL),(113,933,'success',927,926,NULL),(114,15394,'success',928,928,NULL),(115,15864,'success',929,929,NULL),(116,14263,'success',930,930,NULL),(117,15347,'success',931,931,NULL),(118,15314,'success',932,932,NULL),(119,1040,'success',933,933,NULL),(120,4991,'success',934,934,NULL),(121,14629,'success',935,935,NULL),(122,14326,'success',936,936,NULL),(123,15889,'success',937,937,NULL),(124,12591,'success',938,938,NULL),(125,14355,'success',939,939,NULL),(126,306,'success',940,940,NULL),(127,15849,'success',941,941,NULL),(128,11813,'success',942,942,NULL),(129,13579,'success',943,943,NULL),(130,15155,'success',944,944,NULL),(131,15155,'success',945,945,NULL),(132,218,'success',946,946,NULL),(133,5825,'success',947,947,NULL),(134,4991,'success',948,948,NULL),(135,14581,'success',949,949,NULL),(136,10519,'success',950,950,NULL),(137,15778,'success',951,951,NULL),(138,15732,'success',952,952,NULL),(139,5866,'success',953,953,NULL),(140,4598,'success',954,954,NULL),(141,9189,'success',955,955,NULL),(142,15656,'success',956,956,NULL),(143,65,'progression',NULL,957,NULL),(144,1714,'progression',NULL,962,NULL),(145,72,'success',968,968,NULL),(146,10394,'success',969,969,NULL),(147,11310,'success',970,970,NULL),(148,16518,'success',971,971,NULL),(149,9125,'success',972,972,NULL),(150,2291,'success',973,973,NULL),(151,857,'success',985,974,NULL),(152,126,'success',999,986,NULL),(153,16587,'success',1000,1000,NULL),(154,15894,'success',1001,1001,NULL),(155,9317,'success',1002,1002,NULL),(156,4715,'success',1003,1003,NULL),(157,15911,'success',1004,1004,NULL),(158,15269,'success',1005,1005,NULL),(159,15865,'success',1006,1006,NULL),(160,14326,'success',1007,1007,NULL),(161,16152,'success',1008,1008,NULL),(162,16005,'success',1009,1009,NULL),(163,15909,'success',1010,1010,NULL),(164,14692,'success',1011,1011,NULL),(165,4613,'success',1012,1012,NULL),(166,16815,'success',1013,1013,NULL),(167,16815,'success',1014,1014,NULL),(168,16780,'success',1015,1015,NULL),(169,16382,'success',1016,1016,NULL),(170,16029,'success',1017,1017,NULL),(171,7084,'success',1018,1018,NULL),(172,16363,'success',1019,1019,NULL),(173,15424,'success',1020,1020,NULL),(174,16105,'success',1021,1021,NULL),(175,4991,'success',1022,1022,NULL),(176,14674,'success',1023,1023,NULL),(177,16840,'success',1024,1024,NULL),(178,16328,'success',1025,1025,NULL),(179,16233,'success',1026,1026,NULL),(180,1861,'success',1027,1027,NULL),(181,12660,'success',1028,1028,NULL),(182,16280,'success',1029,1029,NULL),(183,2391,'success',1030,1030,NULL),(184,16897,'success',1031,1031,NULL),(185,14692,'success',1032,1032,NULL),(186,15530,'success',1033,1033,NULL),(187,16377,'success',1034,1034,NULL),(188,16094,'success',1035,1035,NULL),(189,616,'success',1036,1036,NULL),(190,13667,'success',1037,1037,NULL),(191,16126,'success',1038,1038,NULL),(192,11660,'success',1039,1039,NULL),(193,1040,'success',1040,1040,NULL),(194,16139,'success',1041,1041,NULL),(195,1007,'success',1042,1042,NULL),(196,5842,'success',1047,1043,NULL),(197,1812,'success',1044,1044,NULL),(198,5842,'progression',NULL,1048,1051),(199,5842,'success',1049,1049,NULL),(200,5842,'progression',NULL,1050,1051),(201,5842,'success',1051,1051,NULL),(202,15301,'success',1052,1052,NULL),(203,16740,'success',1053,1053,NULL),(204,5842,'progression',NULL,1054,NULL),(205,14570,'success',1055,1055,NULL),(206,16382,'success',1056,1056,NULL),(207,16029,'success',1057,1057,NULL),(208,16003,'success',1058,1058,NULL),(209,16585,'success',1059,1059,NULL),(210,16822,'success',1060,1060,NULL),(211,16479,'success',1061,1061,NULL),(212,17089,'success',1062,1062,NULL),(213,16826,'success',1063,1063,NULL),(214,16029,'success',1064,1064,NULL),(215,15929,'success',1065,1065,NULL),(216,7103,'success',1066,1066,NULL),(217,16834,'success',1067,1067,NULL),(218,17082,'success',1068,1068,NULL),(219,16394,'success',1069,1069,NULL),(220,16029,'success',1070,1070,NULL),(221,16423,'success',1071,1071,NULL),(222,6314,'success',1072,1072,NULL),(223,15830,'success',1073,1073,NULL),(224,15909,'success',1074,1074,NULL),(225,15394,'success',1075,1075,NULL),(226,1969,'success',1076,1076,NULL),(227,17282,'success',1077,1077,NULL),(228,16395,'success',1078,1078,NULL),(229,14157,'success',1080,1080,NULL),(230,7161,'success',1081,1081,NULL),(231,4991,'success',1082,1082,NULL),(232,4715,'success',1083,1083,NULL),(233,2245,'success',1084,1084,NULL),(234,15314,'success',1085,1085,NULL),(235,13990,'success',1086,1086,NULL),(236,16639,'success',1087,1087,NULL),(237,14941,'success',1088,1088,NULL),(238,7580,'success',1089,1089,NULL),(239,14787,'success',1090,1090,NULL),(240,16780,'success',1091,1091,NULL),(241,16237,'success',1092,1092,NULL),(242,16026,'success',1093,1093,NULL),(243,16280,'success',1094,1094,NULL),(244,16782,'success',1095,1095,NULL),(245,5632,'success',1096,1096,NULL),(246,15274,'success',1097,1097,NULL),(247,15075,'success',1098,1098,NULL),(248,15394,'success',1099,1099,NULL),(249,16518,'success',1100,1100,NULL),(250,13849,'success',1101,1101,NULL),(251,2107,'success',1102,1102,NULL),(252,7084,'success',1103,1103,NULL),(253,7084,'success',1104,1104,NULL),(254,17143,'success',1122,1105,NULL),(255,17202,'success',1160,1123,NULL),(256,2853,'progression',NULL,1143,NULL),(257,17273,'progression',NULL,1161,NULL),(258,16688,'success',1193,1176,NULL),(259,5985,'success',1196,1194,NULL),(260,5985,'progression',NULL,1197,NULL),(261,19724,'success',1207,1201,NULL),(262,19724,'progression',NULL,1208,NULL),(263,15448,'success',1224,1223,NULL),(264,15448,'progression',NULL,1225,1226),(265,15448,'success',1226,1226,NULL),(266,19750,'progression',NULL,1227,NULL);
/*!40000 ALTER TABLE `userSubmittedMaster` ENABLE KEYS */;
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
