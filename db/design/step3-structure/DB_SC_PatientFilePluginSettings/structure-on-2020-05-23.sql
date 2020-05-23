-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_PatientFilePluginSettings
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
-- Current Database: `DB_SC_PatientFilePluginSettings`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_PatientFilePluginSettings` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_PatientFilePluginSettings`;

--
-- Table structure for table `panelLoadingImageMaster`
--

DROP TABLE IF EXISTS `panelLoadingImageMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelLoadingImageMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageName` varchar(255) NOT NULL,
  `isEnabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panelSettingsCommonToUserRoleForAllUserDetailEmrTabs`
--

DROP TABLE IF EXISTS `panelSettingsCommonToUserRoleForAllUserDetailEmrTabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelSettingsCommonToUserRoleForAllUserDetailEmrTabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleID` int(11) unsigned DEFAULT NULL,
  `pluginID` tinyint(4) unsigned DEFAULT NULL,
  `pluginWeight` int(11) unsigned DEFAULT '0',
  `isThePanelMovable` enum('Yes','No') NOT NULL,
  `pluginState` enum('open','close') NOT NULL DEFAULT 'open',
  `panelColor` varchar(55) DEFAULT 'info',
  PRIMARY KEY (`id`),
  KEY `sectionID` (`pluginID`),
  KEY `uid` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginMaster`
--

DROP TABLE IF EXISTS `pluginMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMaster` (
  `pluginID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pluginTitle` varchar(255) DEFAULT NULL,
  `hotkey` varchar(50) DEFAULT NULL,
  `pluginCategoryMasterId` tinyint(3) unsigned DEFAULT NULL,
  `isEnable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `isMovable` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 4/8';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginMasterCategories`
--

DROP TABLE IF EXISTS `pluginMasterCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMasterCategories` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginsSelectedByDefaultForUserRole`
--

DROP TABLE IF EXISTS `pluginsSelectedByDefaultForUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsSelectedByDefaultForUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` tinyint(4) unsigned NOT NULL,
  `pluginId` tinyint(4) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `displayOrderNumber` int(11) DEFAULT NULL,
  `pluginDisplayState` enum('open','close') NOT NULL DEFAULT 'open',
  `panelColor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `pluginId` (`pluginId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginsSelectedByUserForUserRole`
--

DROP TABLE IF EXISTS `pluginsSelectedByUserForUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsSelectedByUserForUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `roleId` tinyint(4) unsigned NOT NULL,
  `pluginId` tinyint(4) unsigned NOT NULL,
  `pluginWeight` tinyint(3) unsigned NOT NULL,
  `pluginState` enum('open','close') NOT NULL DEFAULT 'close',
  `panelColor` varchar(55) DEFAULT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `roleId` (`roleId`),
  KEY `pluginId` (`pluginId`)
) ENGINE=InnoDB AUTO_INCREMENT=13952 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pluginsSelectedByUserRole`
--

DROP TABLE IF EXISTS `pluginsSelectedByUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginsSelectedByUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` tinyint(4) unsigned NOT NULL,
  `pluginId` tinyint(4) unsigned NOT NULL,
  `pluginWeight` tinyint(3) unsigned NOT NULL,
  `pluginState` enum('open','close') NOT NULL DEFAULT 'close',
  `isChecked` enum('true','false') NOT NULL DEFAULT 'true',
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `pluginId` (`pluginId`)
) ENGINE=InnoDB AUTO_INCREMENT=16090 DEFAULT CHARSET=latin1;
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
