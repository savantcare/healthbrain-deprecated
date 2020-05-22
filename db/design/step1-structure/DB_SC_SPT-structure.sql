-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_SPT
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
-- Current Database: `DB_SC_SPT`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_SPT` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_SPT`;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `template_id` int(10) NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `education_id` int(10) NOT NULL,
  `education_timing` int(10) NOT NULL,
  `date_sent` varchar(255) NOT NULL,
  `date_ended` varchar(255) DEFAULT NULL,
  `message_delay` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `spt_path` varchar(255) NOT NULL,
  `encrypt` int(1) DEFAULT NULL,
  `shorten` varchar(255) DEFAULT NULL,
  `cron_id` varchar(255) DEFAULT NULL,
  `check_java` int(1) NOT NULL,
  `check_flash` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaigns_and_groups`
--

DROP TABLE IF EXISTS `campaigns_and_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_and_groups` (
  `campaign_id` int(10) NOT NULL,
  `group_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaigns_responses`
--

DROP TABLE IF EXISTS `campaigns_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_responses` (
  `target_id` int(10) NOT NULL,
  `campaign_id` int(10) NOT NULL,
  `response_id` varchar(40) DEFAULT NULL,
  `relay_host` varchar(255) NOT NULL,
  `link` int(1) NOT NULL DEFAULT '0',
  `post` varchar(255) DEFAULT NULL,
  `link_time` datetime DEFAULT NULL,
  `post_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `browser_version` varchar(255) DEFAULT NULL,
  `sent` int(1) NOT NULL,
  `sent_time` datetime DEFAULT NULL,
  `response_log` longtext,
  `trained` int(1) DEFAULT NULL,
  `trained_time` datetime DEFAULT NULL,
  `url` longtext,
  `java` varchar(255) DEFAULT NULL,
  `flash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaigns_shorten`
--

DROP TABLE IF EXISTS `campaigns_shorten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_shorten` (
  `service` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_ldap`
--

DROP TABLE IF EXISTS `settings_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_ldap` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `ssl_enc` varchar(1) NOT NULL,
  `ldaptype` varchar(255) NOT NULL,
  `bindaccount` varchar(255) NOT NULL,
  `password` blob NOT NULL,
  `basedn` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_modules`
--

DROP TABLE IF EXISTS `settings_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_modules` (
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'module name',
  `directory_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'name of the directory',
  `description` longtext NOT NULL,
  `module_date` date NOT NULL,
  `core` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_modules_dependencies`
--

DROP TABLE IF EXISTS `settings_modules_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_modules_dependencies` (
  `module` varchar(50) NOT NULL,
  `depends_on` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings_smtp`
--

DROP TABLE IF EXISTS `settings_smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_smtp` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `ssl_enc` varchar(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` blob NOT NULL,
  `sys_default` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targets` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `targets_metrics`
--

DROP TABLE IF EXISTS `targets_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targets_metrics` (
  `field_name` varchar(155) NOT NULL,
  `shown` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(40) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `disabled` int(1) NOT NULL DEFAULT '0' COMMENT '0-enabled; 1-disabled',
  `fname` varchar(50) DEFAULT NULL COMMENT 'first name',
  `lname` varchar(50) DEFAULT NULL COMMENT 'last name',
  `admin` int(1) NOT NULL DEFAULT '0' COMMENT '0-standard; 1-admin',
  `preset_day` date NOT NULL DEFAULT '0001-01-01',
  `preset_key` varchar(40) DEFAULT NULL,
  `preset_enabled` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_ldap`
--

DROP TABLE IF EXISTS `users_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_ldap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `disabled` int(1) NOT NULL DEFAULT '0' COMMENT '0-enabled; 1-disabled',
  `admin` int(1) NOT NULL DEFAULT '0' COMMENT '0-standard; 1-admin',
  `ldap_host` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_ldap_groups`
--

DROP TABLE IF EXISTS `users_ldap_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_ldap_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ldap_group` varchar(255) NOT NULL DEFAULT '',
  `disabled` int(1) NOT NULL DEFAULT '0' COMMENT '0-enabled; 1-disabled',
  `admin` int(1) NOT NULL DEFAULT '0' COMMENT '0-standard; 1-admin',
  `ldap_host` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group` (`ldap_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
