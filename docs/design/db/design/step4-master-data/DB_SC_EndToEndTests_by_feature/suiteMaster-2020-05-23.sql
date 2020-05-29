use DB_SC_EndToEndTests_by_feature
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_EndToEndTests_by_feature
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
-- Table structure for table `suiteMaster`
--

DROP TABLE IF EXISTS `suiteMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suiteMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `featureId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `urlToTestFileOnGitlab` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suiteMaster`
--

LOCK TABLES `suiteMaster` WRITE;
/*!40000 ALTER TABLE `suiteMaster` DISABLE KEYS */;
INSERT INTO `suiteMaster` VALUES (1,1,'Logging into the EMR','https://gitlab.com/savantcare/login-from-web-app-v1/blob/master/tests-before-sync-to-prod/login.js'),(2,2,'Diagnosis panel','https://gitlab.com/savantcare/v3-cui-diagnosis/blob/master/var-www-html/v3/cui/diagnosis/diagnosis/protractor-test-for-panel.js'),(3,2,'Diagnosis skill','https://gitlab.com/savantcare/v3-cui-diagnosis/blob/master/var-www-html/v3/cui/diagnosis/diagnosis/protractor-test-for-skill.js'),(4,225,'Diagnosis Management','https://gitlab.com/savantcare/v3-cui-diagnosis/blob/master/var-www-html/v3/cui/diagnosis/diagnosis/protractor-test-for-DSM.js'),(5,99,'Suggest skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/suggest/protractor-test.js'),(6,13,'Appointment Skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/appointments/protractor-test.js'),(7,56,'Mental status exam panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/mental status exam/protractor-test.js'),(8,74,'Process note panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/process note/protractor-test.js'),(9,57,'Miscellaneous note panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/miscellaneous note/protractor-test.js'),(10,103,'Task panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/task/protractor-test.js'),(11,43,'SC Brain help','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/help/protractor-test.js'),(12,14,'SC Brain billing','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/billing/protractor-test.js'),(13,102,'Symptoms skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/symptoms/protractor-test.js'),(14,65,'Oxygen saturation skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/oxygen saturation/protractor-test.js'),(15,97,'SC Brain subscription','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/subscription/protractor-test.js'),(16,18,'BMI skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/bmi/protractor-test.js'),(17,85,'Screening panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/screening/protractor-test.js'),(18,80,'SC Brain referral','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/referral/protractor-test.js'),(19,46,'Hospitalization skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/hospitalization/protractor-test.js'),(20,42,'Height skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/height/protractor-test.js'),(21,41,'SC Brain health insurance coverage','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/health insurance coverage/protractor-test.js'),(22,51,'Major life event skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/major life event/protractor-test.js'),(23,70,'Pharmacy skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/pharmacy/protractor-test.js'),(24,81,'SC Brain release of information','https://gitlab.com/savantcare/v3-cui-others/tree/master/var-www-html/v3/cui/others/release of information'),(25,110,'Recommendation skill','https://gitlab.com/savantcare/v3-cui-recommendations/blob/master/var-www-html/v3/cui/recommendations/recommendations/protractor-test.js'),(26,38,'Gender panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/gender/protractor-test.js'),(27,60,'Name panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/name/protractor-test.js'),(28,52,'Marital history skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/marital history/protractor-test.js'),(29,72,'Plan comments skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/plan comments/protractor-test.js'),(30,30,'Employment status skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/current employment status/protractor-test.js'),(31,32,'Documents panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/documents/protractor-test.js'),(32,62,'Official letters panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/official letters/protractor-test.js'),(33,53,'Marital status skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/marital status/protractor-test.js'),(34,33,'Education history skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/education history/protractor-test.js'),(35,224,'Address skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/address/protractor-test.js'),(36,34,'Email skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/email/protractor-test.js'),(37,10,'Age skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/age/protractor-test.js'),(38,61,'Living children status skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/number of living children/protractor-test.js'),(39,35,'Employment history skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/employment history/protractor-test.js'),(40,88,'Self harm skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/self harm/protractor-test.js'),(41,49,'Lives in skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/lives in/protractor-test.js'),(42,50,'Lives with skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/lives with/protractor-test.js'),(43,39,'Goal panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/goal/protractor-test.js'),(44,91,'SMTP for meds','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/show me the plan for/protractor-test-meds.js'),(45,91,'SMTP for plan comments','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/show me the plan for/protractor-test-plncm.js'),(46,91,'SMTP for rem','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/show me the plan for/protractor-test-rem.js'),(47,91,'SMTP for rex','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/show me the plan for/protractor-test-rex.js'),(48,91,'SMTP for ss','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/show me the plan for/protractor-test-ss.js'),(49,71,'Phone skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/phone/protractor-test.js'),(50,11,'Allergies skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/allergies/protractor-test.js'),(51,90,'SMTA Skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/show me the assessment for/protractor-test.js'),(52,84,'Rule out diagnosis skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/rule out/protractor-test.js'),(53,17,'Blood sugar skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/blood sugar/protractor-test.js'),(54,16,'Blood pressure skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/blood pressure/protractor-test.js'),(55,20,'Care team skill',NULL),(56,6,'Order Skill','https://gitlab.com/savantcare/v3-cui-medications/blob/master/var-www-html/v3/cui/medications/order/protractor-test.js'),(58,4,'Medication Panel','https://gitlab.com/savantcare/v3-cui-medications/blob/master/var-www-html/v3/cui/medications/medication/protractor-test-panel.js'),(59,4,'Medication Skill','https://gitlab.com/savantcare/v3-cui-medications/blob/master/var-www-html/v3/cui/medications/medication/protractor-test-skill.js'),(60,58,'Monitoring panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/monitoring panel/protractor-test.js'),(61,59,'MSE History','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/mse history/protractor-test.js'),(62,67,'Past psychiatric history skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/past psychiatric history/protractor-test.js'),(63,89,'Service statement skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/service statements/protractor-test.js'),(64,108,'Waist circumference skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/waist circumference/protractor-test.js'),(65,76,'Pulse skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/pulse/protractor-test.js'),(66,75,'Profile panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/profile/protractor-test.js'),(67,94,'Social history','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/social history/protractor-test.js'),(68,95,'Social history free text skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/social history free text/protractor-test.js'),(69,109,'Weight skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/weight/protractor-test.js'),(70,101,'Supports','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/supports/protractor-test.js'),(71,45,'Education Status skills','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/highest education/protractor-test.js'),(72,36,'Family history skill',NULL),(73,23,'Child history skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/child history/protractor-test.js'),(74,104,'Temperature skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/temperature/protractor-test.js'),(75,111,'Reminders skill','https://gitlab.com/savantcare/v3-cui-reminders/blob/master/var-www-html/v3/cui/reminders/reminders/protractor-test.js'),(76,28,'SC Brain Contacts','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/contacts/protractor-test.js'),(77,66,'Past medical history skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/past medical history/protractor-test.js'),(78,73,'Policies panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/policies/protractor-test.js'),(79,31,'Date of birth skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/date of birth/protractor-test.js'),(80,68,'Payer panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/payer/protractor-test.js'),(81,100,'Suicide skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/suicide/protractor-test.js'),(82,79,'Red flag panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/red flag/protractor-test.js'),(83,40,'Guidelines','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/guidelines/protractor-test.js'),(85,12,'App skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/app/protractor-test.js'),(86,48,'Intake Summary','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/intake summary/protractor-test.js'),(87,87,'See skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/see/protractor-test.js'),(88,106,'SC Brain user preferences','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/user preferences/protractor-test.js'),(89,19,'Body measurement skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/body measurement/protractor-test.js'),(90,21,'Career highlight panel','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/career highlights/protractor-test.js'),(91,64,'Open chart skill','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/open chart/protractor-test.js'),(92,98,'Substance use skills','https://gitlab.com/savantcare/v3-cui-others/blob/master/var-www-html/v3/cui/others/substance use/protractor-test.js');
/*!40000 ALTER TABLE `suiteMaster` ENABLE KEYS */;
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