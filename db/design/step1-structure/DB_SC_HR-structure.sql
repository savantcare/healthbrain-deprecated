-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_HR
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
-- Current Database: `DB_SC_HR`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB_SC_HR` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `DB_SC_HR`;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `sub_category` int(11) DEFAULT NULL,
  `company_asset_code` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(15) NOT NULL,
  `allocated_to` int(11) DEFAULT NULL,
  `responsible_technician` int(11) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `asset_classification` varchar(50) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `key_number` varchar(11) NOT NULL,
  `warenty_status` enum('Yes','No') NOT NULL,
  `warenty_end_date` date DEFAULT NULL,
  `is_working` enum('No','Yes') NOT NULL,
  `notes` text,
  `image` text,
  `imagencrpname` text NOT NULL,
  `qr_image` text NOT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_categories`
--

DROP TABLE IF EXISTS `assets_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` varchar(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_history`
--

DROP TABLE IF EXISTS `assets_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `history` varchar(500) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_advacne_summary`
--

DROP TABLE IF EXISTS `expense_advacne_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_advacne_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `utilized` float(10,2) DEFAULT NULL,
  `returned` float(10,2) DEFAULT NULL,
  `balance` float(10,2) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUEEMP` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_advance`
--

DROP TABLE IF EXISTS `expense_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('advance','return') DEFAULT 'advance',
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `payment_ref_number` varchar(200) DEFAULT NULL,
  `payment_mode_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `application_currency_id` int(11) DEFAULT NULL,
  `application_amount` float(10,2) DEFAULT NULL,
  `advance_conversion_rate` float(10,2) DEFAULT NULL,
  `description` text,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_name` varchar(100) DEFAULT NULL,
  `unit_price` varchar(50) DEFAULT NULL,
  `unit_name` varchar(50) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_forward`
--

DROP TABLE IF EXISTS `expense_forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_forward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_history`
--

DROP TABLE IF EXISTS `expense_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `history` varchar(500) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_notifications`
--

DROP TABLE IF EXISTS `expense_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `notification` varchar(500) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_payment_methods`
--

DROP TABLE IF EXISTS `expense_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(100) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_receipts`
--

DROP TABLE IF EXISTS `expense_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_name` varchar(100) DEFAULT NULL COMMENT 'orginal file name',
  `receipt_filename` varchar(100) DEFAULT NULL COMMENT 'auto generated file name',
  `receipt_file_type` varchar(5) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_return_advance`
--

DROP TABLE IF EXISTS `expense_return_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_return_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `returned_amount` float(10,2) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_trip_history`
--

DROP TABLE IF EXISTS `expense_trip_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_trip_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `expense_id` int(11) DEFAULT NULL,
  `history` varchar(500) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense_trips`
--

DROP TABLE IF EXISTS `expense_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) DEFAULT NULL,
  `trip_name` varchar(100) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `description` text,
  `status` enum('NS','S','A','R') DEFAULT 'NS' COMMENT 'NS-Notsubmitted,S-submitted,R-Rejected,A-Approved',
  `rejected_note` text,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_name` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `expense_currency_id` int(11) DEFAULT NULL,
  `expense_amount` float(10,2) DEFAULT NULL,
  `expense_conversion_rate` float(5,2) DEFAULT NULL,
  `application_currency_id` int(11) DEFAULT NULL,
  `application_amount` float(10,2) DEFAULT NULL,
  `advance_amount` float(10,2) DEFAULT NULL,
  `is_reimbursable` tinyint(1) DEFAULT NULL,
  `is_from_advance` tinyint(1) DEFAULT '0',
  `expense_payment_id` int(11) DEFAULT NULL,
  `expense_payment_ref_no` varchar(200) DEFAULT NULL,
  `description` text,
  `status` enum('saved','submitted','approved','rejected') DEFAULT 'saved',
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_accountclasstype`
--

DROP TABLE IF EXISTS `main_accountclasstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_accountclasstype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountclasstype` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_allottedleaveslog`
--

DROP TABLE IF EXISTS `main_allottedleaveslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_allottedleaveslog` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(11) unsigned DEFAULT NULL,
  `assignedleaves` int(5) DEFAULT NULL,
  `totalleaves` int(5) DEFAULT NULL,
  `year` int(5) DEFAULT NULL,
  `createdby` bigint(11) unsigned DEFAULT NULL,
  `modifiedby` bigint(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_announcements`
--

DROP TABLE IF EXISTS `main_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_announcements` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessunit_id` text,
  `department_id` text,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `attachments` text,
  `status` tinyint(1) DEFAULT NULL COMMENT '1-Save as draft, 2-Posted',
  `isactive` tinyint(1) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `createdby_role` bigint(20) DEFAULT NULL,
  `createdby_group` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `modifiedby_role` bigint(20) DEFAULT NULL,
  `modifiedby_group` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_assignmententryreasoncode`
--

DROP TABLE IF EXISTS `main_assignmententryreasoncode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_assignmententryreasoncode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `assignmententryreasoncode` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_attendancestatuscode`
--

DROP TABLE IF EXISTS `main_attendancestatuscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_attendancestatuscode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attendancestatuscode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_bankaccounttype`
--

DROP TABLE IF EXISTS `main_bankaccounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bankaccounttype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bankaccounttype` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_bgagencylist`
--

DROP TABLE IF EXISTS `main_bgagencylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgagencylist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `agencyname` varchar(255) NOT NULL,
  `primaryphone` varchar(100) NOT NULL,
  `secondaryphone` varchar(100) DEFAULT NULL,
  `address` text,
  `bg_checktype` varchar(255) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '1',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_agencylist_aft_upd` AFTER UPDATE ON `main_bgagencylist` FOR EACH ROW BEGIN
					if(old.agencyname != new.agencyname) then
					update main_bgchecks_summary set agencyname = new.agencyname,modifieddate = utc_timestamp() where agencyid = new.id and isactive = 1;
					end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_bgcheckcomments`
--

DROP TABLE IF EXISTS `main_bgcheckcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgcheckcomments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bgdet_id` int(11) unsigned DEFAULT NULL,
  `comment` text,
  `from_id` int(11) unsigned DEFAULT NULL,
  `to_id` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_bgcheckdetails`
--

DROP TABLE IF EXISTS `main_bgcheckdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgcheckdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `specimen_id` int(11) unsigned DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '1' COMMENT '1 - employee, 2- candidate',
  `process_status` enum('In process','On hold','Complete') DEFAULT 'In process',
  `bgagency_id` int(11) unsigned DEFAULT NULL,
  `bgcheck_type` varchar(100) DEFAULT NULL,
  `bgagency_pocid` int(11) unsigned DEFAULT NULL,
  `bgcheck_status` enum('Yet to start','In process','On hold','Complete') DEFAULT 'In process',
  `explanation` text,
  `feedback_file` varchar(50) DEFAULT NULL,
  `feedback_deletedby` int(11) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1' COMMENT '0 - Process deleted, 1 - Active, 2 - Agency deleted',
  `recentlycommentedby` int(11) unsigned DEFAULT NULL,
  `recentlycommenteddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_bgchecks_summary` AFTER INSERT ON `main_bgcheckdetails` FOR EACH ROW BEGIN
					declare detailid,specimen_id, specimen_name, emp_id, specimen_flag_name, agency_name, 
						screening_type, created_name, modified_name,createdbyname,
						modifiedbyname varchar(250);
					declare	specimen_flag_id,agency_id,screeningtype_id int(11);
					select id,flag,if(flag=1,'Employee','Candidate')
						into detailid,specimen_flag_id,specimen_flag_name
						from main_bgcheckdetails where id = new.id;
					if(specimen_flag_id = 1)then
						select userfullname,id, employeeId into specimen_name,specimen_id,emp_id from main_users where id = new.specimen_id;
					end if;
					if(specimen_flag_id = 2) then
						select candidate_name,id into specimen_name,specimen_id from main_candidatedetails where id = new.specimen_id;
					end if;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select userfullname into modifiedbyname from main_users where id = new.modifiedby;
					select id,agencyname into agency_id,agency_name from main_bgagencylist where id = new.bgagency_id;
					select id,type into screeningtype_id,screening_type from main_bgchecktype where id = new.bgcheck_type;
					
					insert into main_bgchecks_summary 
					(detail_id,specimen_name,specimen_id, specimen_flag,specimen_flag_name,employee_id,screeningtypeid,screeningtype_name,
						agencyid,agencyname,process_status,month_name,year_year,createddate,modifieddate,createdby,createdname,modifiedby,modifiedname,
						isactive,isactive_text)
					values
					(detailid,specimen_name,specimen_id,specimen_flag_id,specimen_flag_name,emp_id,screeningtype_id,screening_type, 
					agency_id,agency_name,new.process_status,month(new.createddate),year(new.createddate),new.createddate,new.modifieddate,new.createdby,createdbyname,new.modifiedby,modifiedbyname,
					new.isactive,
					if(new.isactive = 0,'Process deleted',if(new.isactive = 1,'Active',if(new.isactive = 2,'Agency deleted',if(new.isactive = 3,'Agency User deleted',if(new.isactive = 4,'POC deleted','Active'))))));
					
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_bgchecks_aft_update` AFTER UPDATE ON `main_bgcheckdetails` FOR EACH ROW BEGIN
					declare detailid,specimen_id, specimen_name, emp_id, specimen_flag_name, agency_name, 
						screening_type, created_name, modified_name,createdbyname,
						modifiedbyname varchar(250);
					declare	specimen_flag_id,agency_id,screeningtype_id int(11);
					select id,flag,if(flag=1,'Employee','Candidate')
						into detailid,specimen_flag_id,specimen_flag_name
						from main_bgcheckdetails where id = new.id;
					if(specimen_flag_id = 1)then
						select userfullname,id, employeeId into specimen_name,specimen_id,emp_id from main_users where id = new.specimen_id;
					end if;
					if(specimen_flag_id = 2) then
						select candidate_name,id into specimen_name,specimen_id from main_candidatedetails where id = new.specimen_id;
					end if;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select userfullname into modifiedbyname from main_users where id = new.modifiedby;
					select id,agencyname into agency_id,agency_name from main_bgagencylist where id = new.bgagency_id;
					select id,type into screeningtype_id,screening_type from main_bgchecktype where id = new.bgcheck_type;
					UPDATE  main_bgchecks_summary set	
					detail_id = new.id , 
					specimen_name = specimen_name , 
					specimen_id = specimen_id , 
					specimen_flag = specimen_flag_id , 
					specimen_flag_name = specimen_flag_name , 
					employee_id = emp_id , 
					screeningtypeid = screeningtype_id , 
					screeningtype_name = screening_type , 
					agencyid = agency_id , 
					agencyname = agency_name , 
					process_status = new.process_status , 
					modifieddate = new.modifieddate, 
					modifiedby = new.modifiedby , 
					modifiedname = modifiedbyname , 
					isactive = new.isactive , 
					isactive_text = if(new.isactive = 0,'Process deleted',if(new.isactive = 1,'Active',if(new.isactive = 2,'Agency deleted',if(new.isactive = 3,'Agency User deleted',if(new.isactive = 4,'POC deleted','Active')))))
					where
					detail_id = new.id ;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_bgchecks_summary`
--

DROP TABLE IF EXISTS `main_bgchecks_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgchecks_summary` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `detail_id` bigint(11) unsigned DEFAULT NULL,
  `specimen_name` varchar(200) DEFAULT NULL,
  `specimen_id` bigint(11) unsigned DEFAULT NULL,
  `specimen_flag` tinyint(1) DEFAULT '1',
  `specimen_flag_name` enum('Employee','Candidate') DEFAULT 'Employee',
  `employee_id` varchar(200) DEFAULT NULL,
  `screeningtypeid` bigint(11) unsigned DEFAULT NULL,
  `screeningtype_name` varchar(200) DEFAULT NULL,
  `agencyid` bigint(11) unsigned DEFAULT NULL,
  `agencyname` varchar(200) DEFAULT NULL,
  `process_status` enum('In process','On hold','Complete') DEFAULT 'In process',
  `month_name` varchar(200) DEFAULT NULL,
  `year_year` varchar(200) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` bigint(11) unsigned DEFAULT NULL,
  `createdname` varchar(200) DEFAULT NULL,
  `modifiedby` bigint(11) unsigned DEFAULT NULL,
  `modifiedname` varchar(200) DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `isactive_text` varchar(50) DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_bgchecktype`
--

DROP TABLE IF EXISTS `main_bgchecktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgchecktype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(150) NOT NULL,
  `description` text,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_screeningtype_aft_upd` AFTER UPDATE ON `main_bgchecktype` FOR EACH ROW BEGIN
					if(old.type != new.type) then
					update main_bgchecks_summary set screeningtype_name = new.type,modifieddate = utc_timestamp() where screeningtypeid = new.id and isactive = 1;
					end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_bgpocdetails`
--

DROP TABLE IF EXISTS `main_bgpocdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgpocdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bg_agencyid` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `contact_type` tinyint(1) DEFAULT '1' COMMENT '1-primary, 2- secondary',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_businessunits`
--

DROP TABLE IF EXISTS `main_businessunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_businessunits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unitname` varchar(255) NOT NULL,
  `unitcode` varchar(50) DEFAULT NULL,
  `description` text,
  `startdate` date DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `address1` text,
  `address2` text,
  `address3` text,
  `timezone` int(11) DEFAULT NULL,
  `unithead` varchar(255) DEFAULT NULL,
  `service_desk_flag` tinyint(1) unsigned DEFAULT '1' COMMENT '1=buwise,0=deptwise',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_businessunits_main_requisition_summary` AFTER UPDATE ON `main_businessunits` FOR EACH ROW BEGIN
					UPDATE main_requisition_summary rs SET rs.businessunit_name = NEW.unitname, rs.modifiedon = utc_timestamp() WHERE (rs.businessunit_id = NEW.id 
					AND rs.businessunit_name != NEW.unitname);
				        UPDATE main_leaverequest_summary ls SET ls.buss_unit_name = if(NEW.unitcode != "000",concat(NEW.unitcode,"","-"),""), ls.modifieddate = utc_timestamp() 
				        WHERE (ls.bunit_id = NEW.id AND ls.isactive=1);
				        
				        update main_leavemanagement_summary lm set lm.businessunit_name = if(NEW.unitcode != "000",concat(NEW.unitcode,"","-"),""),lm.modifieddate = utc_timestamp() 
				        where lm.businessunit_id = new.id and lm.isactive = 1;
					#start of main_employees_summary
					update main_employees_summary set businessunit_name = new.unitname,modifieddate = utc_timestamp() where businessunit_id = new.id and isactive = 1;
					#end of main_employees_summary
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_candidatedetails`
--

DROP TABLE IF EXISTS `main_candidatedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_candidatedetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` int(11) DEFAULT NULL,
  `candidate_firstname` varchar(50) DEFAULT NULL,
  `candidate_lastname` varchar(50) DEFAULT NULL,
  `candidate_name` varchar(100) NOT NULL,
  `emailid` varchar(70) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `profileimg` varchar(100) DEFAULT NULL,
  `cand_resume` varchar(100) DEFAULT NULL COMMENT 'resume file location',
  `cand_resume_deletedby` int(11) DEFAULT NULL,
  `qualification` varchar(100) NOT NULL,
  `experience` float DEFAULT NULL,
  `skillset` text,
  `education_summary` text,
  `summary` text COMMENT 'instead of resume',
  `cand_status` enum('Shortlisted','Selected','Rejected','On hold','Disqualified','Scheduled','Not Scheduled','Recruited','Requisition Closed/Completed') NOT NULL,
  `backgroundchk_status` enum('In process','Completed','Not Applicable','Yet to start','On hold') DEFAULT 'Yet to start',
  `cand_location` varchar(150) DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `source` enum('Vendor','Website','Referal') DEFAULT NULL,
  `source_val` varchar(150) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_candidates_aft_upd` AFTER UPDATE ON `main_candidatedetails` FOR EACH ROW BEGIN
					if(old.candidate_name != new.candidate_name) then
					begin
					update main_bgchecks_summary set specimen_name = new.candidate_name,modifieddate = utc_timestamp() where specimen_id = new.id and specimen_flag = 2 and isactive = 1;
					update main_interviewrounds_summary set candidate_name = new.candidate_name,modified_date = utc_timestamp() where candidate_id = new.id and isactive = 1;
				        end;
					end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_candworkdetails`
--

DROP TABLE IF EXISTS `main_candworkdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_candworkdetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cand_id` bigint(20) unsigned DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `company_address` varchar(500) DEFAULT NULL,
  `company_website` varchar(100) DEFAULT NULL,
  `cand_designation` varchar(60) DEFAULT NULL,
  `cand_fromdate` date DEFAULT NULL,
  `cand_todate` date DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`cand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_cities`
--

DROP TABLE IF EXISTS `main_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `countryid` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `city_org_id` int(11) unsigned DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_city` (`state`,`city_org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_cities_aft_upd` AFTER UPDATE ON `main_cities` FOR EACH ROW BEGIN
					if old.city != new.city then 
				        begin 
				           update main_interviewrounds_summary set interview_city_name = new.city,modified_date = utc_timestamp() where interview_city_id = new.city_org_id and isactive = 1;
				        end;
				        end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_competencylevel`
--

DROP TABLE IF EXISTS `main_competencylevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_competencylevel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `competencylevel` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_countries`
--

DROP TABLE IF EXISTS `main_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL,
  `countrycode` varchar(255) DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  `country_id_org` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_countries_aft_upd` AFTER UPDATE ON `main_countries` FOR EACH ROW BEGIN
					if old.country != new.country then 
					begin 
					update main_interviewrounds_summary set interview_country_name = new.country,modified_date = utc_timestamp() where interview_country_id = new.country_id_org and isactive = 1;
					end;
					end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_cronstatus`
--

DROP TABLE IF EXISTS `main_cronstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_cronstatus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cron_type` enum('General','Employee expiry','Requisition expiry','Approve leave','Inactive users','Emp docs expiry') DEFAULT 'General',
  `cron_status` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_currency`
--

DROP TABLE IF EXISTS `main_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `currencyname` varchar(255) NOT NULL,
  `currencycode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_currencyconverter`
--

DROP TABLE IF EXISTS `main_currencyconverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_currencyconverter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `basecurrency` int(11) DEFAULT NULL,
  `targetcurrency` int(11) DEFAULT NULL,
  `basecurrtext` varchar(255) DEFAULT NULL,
  `targetcurrtext` varchar(255) DEFAULT NULL,
  `exchangerate` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_dateformat`
--

DROP TABLE IF EXISTS `main_dateformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_dateformat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mysql_dateformat` varchar(50) DEFAULT NULL COMMENT 'format for mysql',
  `js_dateformat` varchar(50) DEFAULT NULL COMMENT 'format for javascript',
  `dateformat` varchar(50) NOT NULL COMMENT 'for php',
  `example` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_departments`
--

DROP TABLE IF EXISTS `main_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deptname` varchar(150) NOT NULL,
  `deptcode` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text,
  `address3` text,
  `timezone` int(11) DEFAULT NULL,
  `depthead` int(11) unsigned DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_departments_main_requisition_summary` AFTER UPDATE ON `main_departments` FOR EACH ROW BEGIN
			        declare unit_code varchar(200);
				UPDATE main_requisition_summary rs SET rs.department_name = CASE WHEN NEW.isactive=1 then NEW.deptname ELSE NULL END, rs.modifiedon = utc_timestamp() 
	WHERE (rs.department_id = NEW.id);
			        update main_leaverequest_summary ls set ls.department_name = concat(new.deptname," (",new.deptcode,")"),ls.modifieddate = utc_timestamp() 
			        where ls.department_id = new.id and ls.isactive = 1;
			        update main_leavemanagement_summary lm set lm.department_name = concat(new.deptname," (",new.deptcode,")"),lm.modifieddate = utc_timestamp() 
			        where lm.department_id = new.id and lm.isactive = 1;
				
				#start of main_employees_summary
				update main_employees_summary es set es.department_name = new.deptname,es.modifieddate = utc_timestamp() 
			        where es.department_id = new.id and es.isactive = 1;
				#end of main_employees_summary
			        
			        # Start Updating BusinessUnit Id and Name if business unit is 0  
			        if new.unitid = 0 then 
				begin 
				       update main_leavemanagement_summary lm set lm.businessunit_id = 0,lm.businessunit_name = NULL,
			                 lm.modifieddate = utc_timestamp() where lm.department_id = new.id and lm.isactive = 1;
			               update main_leaverequest_summary ls set ls.bunit_id = 0,ls.buss_unit_name = NULL,
			               ls.modifieddate = utc_timestamp() where ls.department_id = new.id and ls.isactive = 1;
				end;
				end if; 
			        # End
			        
			        # Start Updating BusinessUnit Id and Name if business unit is not 0
			        if new.unitid != 0 then 
				begin 
			               select unitcode into unit_code from main_businessunits where id = new.unitid;
				       update main_leavemanagement_summary lm set lm.businessunit_id = new.unitid,
			                lm.businessunit_name = concat(unit_code,"","-"),lm.modifieddate = utc_timestamp() 
			                where lm.department_id = new.id and lm.isactive = 1;
			               update main_leaverequest_summary ls set ls.bunit_id = new.unitid,
			               ls.buss_unit_name = concat(unit_code,"","-"),ls.modifieddate = utc_timestamp() 
			               where ls.department_id = new.id and ls.isactive = 1;
				end;
				end if;
			        # End
			    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_disciplinary_history`
--

DROP TABLE IF EXISTS `main_disciplinary_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_disciplinary_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `action_emp_id` bigint(20) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_disciplinary_incident`
--

DROP TABLE IF EXISTS `main_disciplinary_incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_disciplinary_incident` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `incident_raised_by` bigint(20) unsigned DEFAULT NULL,
  `employee_bu_id` bigint(20) unsigned DEFAULT NULL,
  `employee_dept_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_rep_mang_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_occurrence` date DEFAULT NULL,
  `violation_id` bigint(20) unsigned DEFAULT NULL,
  `violation_expiry` date DEFAULT NULL,
  `employee_job_title_id` bigint(20) unsigned DEFAULT NULL,
  `employer_statement` text,
  `employee_appeal` tinyint(1) DEFAULT '1' COMMENT '1=Yes,2=No',
  `employee_statement` text,
  `cao_verdict` tinyint(1) DEFAULT '1' COMMENT '1=guilty,2=not guilty',
  `corrective_action` enum('Suspension With Pay','Suspension W/O Pay','Termination','Other') DEFAULT 'Suspension With Pay',
  `corrective_action_text` varchar(255) DEFAULT NULL,
  `incident_status` enum('Initiated','Appealed','Closed') DEFAULT 'Initiated',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_disciplinary_violation_types`
--

DROP TABLE IF EXISTS `main_disciplinary_violation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_disciplinary_violation_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `violationname` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_educationlevelcode`
--

DROP TABLE IF EXISTS `main_educationlevelcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_educationlevelcode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `educationlevelcode` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_eeoccategory`
--

DROP TABLE IF EXISTS `main_eeoccategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_eeoccategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eeoccategory` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_emailcontacts`
--

DROP TABLE IF EXISTS `main_emailcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_emailcontacts` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `business_unit_id` int(11) DEFAULT NULL,
  `groupEmail` varchar(50) NOT NULL,
  `isactive` tinyint(4) unsigned DEFAULT '1',
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_emailgroups`
--

DROP TABLE IF EXISTS `main_emailgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_emailgroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `group_code` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_emaillogs`
--

DROP TABLE IF EXISTS `main_emaillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_emaillogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fromEmail` varchar(200) DEFAULT NULL,
  `toEmail` varchar(200) DEFAULT NULL,
  `toName` varchar(200) DEFAULT NULL,
  `cc` text,
  `bcc` text,
  `emailsubject` varchar(255) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `message` text,
  `is_sent` tinyint(1) unsigned DEFAULT '0' COMMENT '1=sent,0= not sent',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `key1` varchar(50) DEFAULT NULL,
  `key2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_emp_reporting`
--

DROP TABLE IF EXISTS `main_emp_reporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_emp_reporting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` bigint(20) DEFAULT NULL,
  `reporting_manager_id` bigint(20) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empadditionaldetails`
--

DROP TABLE IF EXISTS `main_empadditionaldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empadditionaldetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `military_status` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `countries_served` int(11) unsigned DEFAULT NULL,
  `branch_service` varchar(100) DEFAULT NULL,
  `rank_achieved` varchar(100) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `special_training` text,
  `awards` text,
  `discharge_status` tinyint(1) DEFAULT NULL COMMENT '1-Honorable,2-Medical',
  `service_number` varchar(100) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `verification_report` varchar(100) DEFAULT NULL,
  `military_servicetype` int(11) unsigned DEFAULT NULL,
  `veteran_status` int(11) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empcertificationdetails`
--

DROP TABLE IF EXISTS `main_empcertificationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empcertificationdetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `description` text,
  `course_level` varchar(100) DEFAULT NULL,
  `course_offered_by` varchar(100) DEFAULT NULL,
  `certification_name` varchar(100) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empcommunicationdetails`
--

DROP TABLE IF EXISTS `main_empcommunicationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empcommunicationdetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `personalemail` varchar(100) DEFAULT NULL,
  `perm_streetaddress` varchar(200) DEFAULT NULL,
  `perm_country` bigint(20) DEFAULT NULL,
  `perm_state` bigint(20) DEFAULT NULL,
  `perm_city` bigint(20) DEFAULT NULL,
  `perm_pincode` varchar(15) DEFAULT NULL,
  `current_streetaddress` varchar(200) DEFAULT NULL,
  `current_country` bigint(20) DEFAULT NULL,
  `current_state` bigint(20) DEFAULT NULL,
  `current_city` bigint(20) DEFAULT NULL,
  `current_pincode` varchar(15) DEFAULT NULL,
  `emergency_number` varchar(100) DEFAULT NULL,
  `emergency_name` varchar(50) DEFAULT NULL,
  `emergency_email` varchar(100) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empcreditcarddetails`
--

DROP TABLE IF EXISTS `main_empcreditcarddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empcreditcarddetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `card_type` varchar(100) DEFAULT NULL,
  `card_number` bigint(20) unsigned DEFAULT NULL,
  `nameoncard` varchar(100) DEFAULT NULL,
  `card_expiration` date DEFAULT NULL,
  `card_issued_comp` varchar(255) DEFAULT NULL,
  `card_code` varchar(100) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empdependencydetails`
--

DROP TABLE IF EXISTS `main_empdependencydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empdependencydetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `dependent_name` varchar(100) DEFAULT NULL,
  `dependent_relation` varchar(100) DEFAULT NULL,
  `dependent_custody` varchar(100) DEFAULT NULL,
  `dependent_dob` date DEFAULT NULL,
  `dependent_age` int(11) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empdisabilitydetails`
--

DROP TABLE IF EXISTS `main_empdisabilitydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empdisabilitydetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `disability_name` varchar(50) DEFAULT NULL,
  `disability_type` varchar(100) DEFAULT NULL,
  `other_disability_type` varchar(100) DEFAULT NULL,
  `disability_description` text,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empeducationdetails`
--

DROP TABLE IF EXISTS `main_empeducationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empeducationdetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `educationlevel` int(11) unsigned DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `percentage` int(11) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empexperiancedetails`
--

DROP TABLE IF EXISTS `main_empexperiancedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empexperiancedetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `comp_name` varchar(100) DEFAULT NULL,
  `comp_website` varchar(255) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `reason_for_leaving` text,
  `reference_name` varchar(100) DEFAULT NULL,
  `reference_contact` varchar(100) DEFAULT NULL COMMENT 'referrer contact data type is changed from bigint(20) to varchar',
  `reference_email` varchar(100) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empholidays`
--

DROP TABLE IF EXISTS `main_empholidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empholidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `holiday_group_id` int(10) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empjobhistory`
--

DROP TABLE IF EXISTS `main_empjobhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empjobhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `positionheld` int(11) unsigned DEFAULT NULL,
  `department` int(11) unsigned DEFAULT NULL,
  `jobtitleid` int(11) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active_company` tinyint(1) DEFAULT NULL COMMENT '1-yes,2-No',
  `client_id` int(11) DEFAULT NULL,
  `vendor` varchar(200) DEFAULT NULL,
  `paid_amount` decimal(25,2) DEFAULT NULL,
  `received_amount` decimal(25,2) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_employeedocuments`
--

DROP TABLE IF EXISTS `main_employeedocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employeedocuments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attachments` text,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_employeeleaves`
--

DROP TABLE IF EXISTS `main_employeeleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employeeleaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `emp_leave_limit` float DEFAULT NULL,
  `used_leaves` float DEFAULT NULL,
  `alloted_year` year(4) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `isleavetrasnferset` tinyint(1) DEFAULT '0' COMMENT '0-Notset,1-set',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_year` (`user_id`,`alloted_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_employeeleavetypes`
--

DROP TABLE IF EXISTS `main_employeeleavetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employeeleavetypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leavetype` varchar(255) DEFAULT NULL,
  `numberofdays` int(11) DEFAULT NULL,
  `leavecode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `leavepreallocated` tinyint(4) DEFAULT NULL COMMENT '1-yes,2-No',
  `leavepredeductable` tinyint(4) DEFAULT NULL COMMENT '1-yes,2-No',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_employeeleavetypes_aft_upd` AFTER UPDATE ON `main_employeeleavetypes` FOR EACH ROW BEGIN
				     update main_leaverequest_summary ls set ls.leavetype_name = new.leavetype,ls.modifieddate = utc_timestamp() 
				     where ls.leavetypeid = new.id and ls.isactive = 1;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_employees`
--

DROP TABLE IF EXISTS `main_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `date_of_joining` date DEFAULT '0000-00-00',
  `date_of_leaving` date DEFAULT '0000-00-00',
  `reporting_manager` bigint(20) unsigned DEFAULT NULL,
  `emp_status_id` int(11) unsigned DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `jobtitle_id` int(11) unsigned DEFAULT NULL,
  `position_id` int(11) unsigned DEFAULT NULL,
  `years_exp` varchar(20) DEFAULT NULL COMMENT 'for numbers we are using varchar datatype',
  `holiday_group` int(11) unsigned DEFAULT NULL,
  `prefix_id` int(11) unsigned DEFAULT NULL,
  `extension_number` varchar(20) DEFAULT NULL COMMENT 'for numbers we are using varchar datatype',
  `office_number` varchar(100) DEFAULT NULL,
  `office_faxnumber` varchar(100) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1-active,5-deleted',
  `is_orghead` tinyint(1) unsigned DEFAULT '0' COMMENT '1=organisation head,0=normal employee',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_employees_aft_ins` AFTER INSERT ON `main_employees` 
				    FOR EACH ROW BEGIN
					declare user_id,fname,lname,username,role_name,rep_name,emp_status,bunit_name,dept_name,job_name,pos_name,prefix_name,
						createdbyname,holidaygrp,modifiedbyname,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,
				                ref_by_name,img_src
						varchar(250);
					declare ref_by_id,role_id int(11);
					select firstname,lastname,userfullname,emailaddress,contactnumber,backgroundchk_status,employeeId,modeofentry,other_modeofentry,selecteddate,candidatereferredby,
				               profileimg,emprole  
						into fname,lname,username,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,ref_by_id,img_src,role_id 
					from main_users where id = new.user_id;
					select userfullname into rep_name from main_users where id = new.reporting_manager;
				/*
					select employemnt_status into emp_status from tbl_employmentstatus where id = (select workcodename 
					from main_employmentstatus where id = new.emp_status_id);*/
					select employemnt_status into emp_status from tbl_employmentstatus where id = new.emp_status_id	;
					set user_id = new.user_id;
					set bunit_name = null;
					if new.businessunit_id is not null then
						select unitname into bunit_name from main_businessunits where id = new.businessunit_id;
					end if;
					set holidaygrp = null;
					if new.holiday_group is not null then
						select groupname into holidaygrp from main_holidaygroups where id = new.holiday_group;
					end if;
					select deptname into dept_name from main_departments where id = new.department_id;
					select jobtitlename into job_name from main_jobtitles where id = new.jobtitle_id;
					select positionname into pos_name from main_positions where id = new.position_id;
					select prefix into prefix_name from main_prefix where id = new.prefix_id;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select rolename into role_name from main_roles where id = role_id;
					if (ref_by_id != '' and ref_by_id > 0) then 
				        begin 
					    select userfullname into ref_by_name from main_users where id = ref_by_id;
				        end;
				        end if;
				insert into main_employees_summary ( 
					user_id, date_of_joining, date_of_leaving, reporting_manager, reporting_manager_name, emp_status_id, 
					emp_status_name, businessunit_id, businessunit_name, department_id, department_name, jobtitle_id, 
					jobtitle_name, position_id, position_name, years_exp, holiday_group, holiday_group_name, 
					prefix_id, prefix_name, extension_number, office_number, office_faxnumber, emprole, 
					emprole_name, firstname,lastname,userfullname, emailaddress, contactnumber, backgroundchk_status, 	employeeId, 
					modeofentry, other_modeofentry, selecteddate, candidatereferredby, referer_name, profileimg, 
					createdby, createdby_name, modifiedby, createddate, modifieddate, isactive)
					values	(	
					new.user_id, new.date_of_joining, new.date_of_leaving,new.reporting_manager,rep_name,new.emp_status_id, 
					emp_status,new.businessunit_id,	bunit_name,new.department_id,dept_name,new.jobtitle_id, 
					job_name, new.position_id, pos_name,new.years_exp, new.holiday_group, holidaygrp, 
					new.prefix_id, 	prefix_name, new.extension_number, new.office_number, new.office_faxnumber,role_id, 
					role_name,fname,lname,username, emailid,cnumber,bgstatus,empid, 
					mode_entry,omode_entry,	sel_date, ref_by_id, ref_by_name,img_src, 
					new.createdby, 	createdbyname, new.modifiedby,new.createddate, new.modifieddate, new.isactive
					);
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_employees_aft_upd` AFTER UPDATE ON `main_employees` 
				    FOR EACH ROW BEGIN
					declare fname,lname,username,role_name,rep_name,emp_status,bunit_name,dept_name,job_name,pos_name,prefixname,
						createdbyname,holidaygrp,modifiedbyname,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,
				                ref_by_name,img_src
						varchar(250);
					declare ref_by_id,role_id int(11);
					select firstname,lastname,userfullname,emailaddress,contactnumber,backgroundchk_status,employeeId,modeofentry,other_modeofentry,selecteddate,candidatereferredby,
				               profileimg,emprole  
						into fname,lname,username,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,ref_by_id,img_src,role_id 
					from main_users where id = new.user_id;
					select userfullname into rep_name from main_users where id = new.reporting_manager;
					/*select employemnt_status into emp_status from tbl_employmentstatus where id = (select workcodename 
					from main_employmentstatus where id = new.emp_status_id);*/
					select employemnt_status into emp_status from tbl_employmentstatus where id = new.emp_status_id	;
					set bunit_name = null;
					if new.businessunit_id is not null then
						select unitname into bunit_name from main_businessunits where id = new.businessunit_id;
					end if;
					set holidaygrp = null;
					if new.holiday_group is not null then
						select groupname into holidaygrp from main_holidaygroups where id = new.holiday_group;
					end if;
					select deptname into dept_name from main_departments where id = new.department_id;
					select jobtitlename into job_name from main_jobtitles where id = new.jobtitle_id;
					select positionname into pos_name from main_positions where id = new.position_id;
					select prefix into prefixname from main_prefix where id = new.prefix_id;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select rolename into role_name from main_roles where id = role_id;
					if (ref_by_id != '' and ref_by_id > 0) then 
				        begin 
					    select userfullname into ref_by_name from main_users where id = ref_by_id;
				        end;
				        end if;
				        update main_employees_summary set  
					 date_of_joining = new.date_of_joining, date_of_leaving = new.date_of_leaving, reporting_manager = new.reporting_manager, 
				         reporting_manager_name = rep_name, emp_status_id = new.emp_status_id, 	emp_status_name = emp_status, 
					businessunit_id = new.businessunit_id, businessunit_name = bunit_name, department_id = new.department_id, 
				        department_name = dept_name, jobtitle_id = new.jobtitle_id,jobtitle_name = job_name, position_id = new.position_id, 
				        position_name = pos_name, years_exp = new.years_exp, holiday_group = new.holiday_group, holiday_group_name = holidaygrp, 
					prefix_id = new.prefix_id, prefix_name = prefixname, extension_number = new.extension_number, office_number = new.office_number, 
					office_faxnumber = new.office_faxnumber, emprole = role_id, emprole_name = role_name, firstname=fname, lastname=lname,userfullname = username, 
					emailaddress = emailid, contactnumber = cnumber, backgroundchk_status = bgstatus,employeeId = empid, 
					modeofentry = mode_entry, other_modeofentry = omode_entry, selecteddate = sel_date, candidatereferredby = ref_by_id,
					referer_name = ref_by_name, profileimg = img_src,  modifiedby = new.modifiedby, modifieddate = new.modifieddate, isactive = new.isactive
					
					 where user_id = new.user_id;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_employees_summary`
--

DROP TABLE IF EXISTS `main_employees_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employees_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `reporting_manager` int(11) unsigned DEFAULT NULL,
  `reporting_manager_name` varchar(250) DEFAULT NULL,
  `emp_status_id` int(11) unsigned DEFAULT NULL,
  `emp_status_name` varchar(250) DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `businessunit_name` varchar(250) DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `department_name` varchar(250) DEFAULT NULL,
  `jobtitle_id` int(11) unsigned DEFAULT NULL,
  `jobtitle_name` varchar(250) DEFAULT NULL,
  `position_id` int(11) unsigned DEFAULT NULL,
  `position_name` varchar(250) DEFAULT NULL,
  `years_exp` varchar(10) DEFAULT NULL,
  `holiday_group` int(11) unsigned DEFAULT NULL,
  `holiday_group_name` varchar(250) DEFAULT NULL,
  `prefix_id` int(11) unsigned DEFAULT NULL,
  `prefix_name` varchar(250) DEFAULT NULL,
  `extension_number` varchar(20) DEFAULT NULL,
  `office_number` varchar(20) DEFAULT NULL,
  `office_faxnumber` varchar(20) DEFAULT NULL,
  `emprole` int(11) unsigned DEFAULT NULL,
  `emprole_name` varchar(250) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `userfullname` varchar(250) DEFAULT NULL,
  `emailaddress` varchar(100) DEFAULT NULL,
  `contactnumber` varchar(20) DEFAULT NULL,
  `backgroundchk_status` enum('In process','Completed','Not Applicable','Yet to start','On hold') DEFAULT NULL,
  `employeeId` varchar(20) DEFAULT NULL,
  `modeofentry` varchar(100) DEFAULT NULL,
  `other_modeofentry` varchar(100) DEFAULT NULL,
  `selecteddate` date DEFAULT NULL,
  `candidatereferredby` int(11) unsigned DEFAULT NULL,
  `referer_name` varchar(250) DEFAULT NULL,
  `profileimg` varchar(250) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `createdby_name` varchar(250) DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(2) unsigned DEFAULT NULL COMMENT '0=inactive,1-Active,2-resigned,3-left,4-suspended,5-deleted,',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un1` (`user_id`),
  KEY `NewIndex1` (`user_id`),
  KEY `NewIndex2` (`reporting_manager`),
  KEY `NewIndex3` (`emp_status_id`),
  KEY `NewIndex4` (`businessunit_id`),
  KEY `NewIndex5` (`department_id`),
  KEY `NewIndex6` (`jobtitle_id`),
  KEY `NewIndex7` (`position_id`),
  KEY `NewIndex8` (`holiday_group`),
  KEY `NewIndex9` (`prefix_id`),
  KEY `NewIndex10` (`emprole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_employmentstatus`
--

DROP TABLE IF EXISTS `main_employmentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employmentstatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workcode` varchar(255) DEFAULT NULL,
  `workcodename` int(11) unsigned DEFAULT NULL,
  `default_leaves` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_employmentstatus_main_requisition_summary` AFTER UPDATE ON `main_employmentstatus` FOR EACH ROW BEGIN
					declare empt_name varchar(250);
					UPDATE main_requisition_summary rs 
					LEFT JOIN main_employmentstatus mes ON mes.workcodename = rs.emp_type
					LEFT JOIN tbl_employmentstatus tes ON tes.id = mes.workcodename
					SET rs.emp_type_name = tes.employemnt_status, rs.modifiedon = utc_timestamp()
					WHERE (rs.emp_type_name != tes.employemnt_status);
					select te.employemnt_status into empt_name from main_employmentstatus em 
				       inner join tbl_employmentstatus te on te.id = em.workcodename where em.id = new.id;
					#start of main_employees_summary
					update main_employees_summary set emp_status_name = empt_name,modifieddate = utc_timestamp() where emp_status_id = new.id and isactive = 1;
					#end of main_employees_summary
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_empmedicalclaims`
--

DROP TABLE IF EXISTS `main_empmedicalclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empmedicalclaims` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `injury_type` tinyint(1) DEFAULT NULL COMMENT '1-injury,2-maternity,3-paternity,4-disablity',
  `injury_description` text,
  `injury_indicator` tinyint(1) DEFAULT NULL COMMENT '1-yes,2-no',
  `injured_date` date DEFAULT NULL,
  `injury_name` varchar(100) DEFAULT NULL,
  `injury_severity` tinyint(1) DEFAULT NULL COMMENT '1-Major,2-Minor',
  `disability_type` varchar(100) DEFAULT NULL,
  `other_disability_type` varchar(100) DEFAULT NULL,
  `disablity_approved` tinyint(1) DEFAULT '1' COMMENT '1-yes,2-no',
  `medical_insurer_name` varchar(100) DEFAULT NULL COMMENT 'Medical insurer name',
  `expected_date_join` date DEFAULT NULL,
  `leavebyemployeer_to_date` date DEFAULT NULL,
  `leavebyemployeer_from_date` date DEFAULT NULL,
  `leavebyemployeer_days` bigint(20) DEFAULT NULL,
  `leaveappliedbyemployee_to_date` date DEFAULT NULL,
  `leaveappliedbyemployee_from_date` date DEFAULT NULL,
  `leaveappliedbyemployee_days` bigint(20) DEFAULT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `hospital_address` text,
  `room_number` varchar(50) DEFAULT NULL,
  `concerned_physician_name` varchar(100) DEFAULT NULL,
  `treatment_details` text,
  `total_cost` bigint(20) DEFAULT NULL,
  `amount_claimed_for` bigint(20) DEFAULT NULL,
  `amount_approved` bigint(20) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_emppersonaldetails`
--

DROP TABLE IF EXISTS `main_emppersonaldetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_emppersonaldetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `genderid` int(11) unsigned DEFAULT NULL,
  `maritalstatusid` int(11) unsigned DEFAULT NULL,
  `nationalityid` int(11) unsigned DEFAULT NULL,
  `ethniccodeid` int(11) unsigned DEFAULT NULL,
  `racecodeid` int(11) unsigned DEFAULT NULL,
  `languageid` int(11) unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `celebrated_dob` date DEFAULT NULL,
  `bloodgroup` varchar(100) DEFAULT NULL,
  `identity_documents` longtext,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empsalarydetails`
--

DROP TABLE IF EXISTS `main_empsalarydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empsalarydetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `currencyid` int(11) unsigned DEFAULT NULL,
  `salarytype` int(11) unsigned DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `accountholder_name` varchar(100) DEFAULT NULL,
  `accountholding` date DEFAULT NULL,
  `accountclasstypeid` int(11) unsigned DEFAULT NULL,
  `bankaccountid` int(11) unsigned DEFAULT NULL,
  `accountnumber` varchar(100) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empskills`
--

DROP TABLE IF EXISTS `main_empskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empskills` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `skillname` varchar(100) DEFAULT NULL,
  `yearsofexp` varchar(20) DEFAULT NULL,
  `competencylevelid` int(11) DEFAULT NULL,
  `year_skill_last_used` date DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empvisadetails`
--

DROP TABLE IF EXISTS `main_empvisadetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empvisadetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `passport_number` varchar(100) DEFAULT NULL,
  `passport_issue_date` date DEFAULT NULL,
  `passport_expiry_date` date DEFAULT NULL,
  `visa_number` varchar(100) DEFAULT NULL,
  `visa_type` varchar(100) DEFAULT NULL,
  `visa_issue_date` date DEFAULT NULL,
  `visa_expiry_date` date DEFAULT NULL,
  `inine_status` varchar(100) DEFAULT NULL,
  `inine_review_date` date DEFAULT NULL,
  `issuing_authority` varchar(100) DEFAULT NULL,
  `ininetyfour_status` varchar(100) DEFAULT NULL,
  `ininetyfour_expiry_date` date DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empworkdetails`
--

DROP TABLE IF EXISTS `main_empworkdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empworkdetails` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `company_address` text,
  `company_website` varchar(200) DEFAULT NULL,
  `emp_designation` varchar(100) DEFAULT NULL,
  `emp_fromdate` datetime DEFAULT NULL,
  `emp_todate` datetime DEFAULT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_empworkeligibility`
--

DROP TABLE IF EXISTS `main_empworkeligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_empworkeligibility` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `documenttype_id` int(11) unsigned DEFAULT NULL,
  `doc_issue_date` date DEFAULT NULL,
  `doc_expiry_date` date DEFAULT NULL,
  `issuingauth_name` varchar(100) DEFAULT NULL,
  `issuingauth_country` int(11) unsigned DEFAULT NULL,
  `issuingauth_state` int(11) unsigned DEFAULT NULL,
  `issuingauth_city` int(11) unsigned DEFAULT NULL,
  `issuingauth_postalcode` varchar(15) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_ethniccode`
--

DROP TABLE IF EXISTS `main_ethniccode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_ethniccode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ethniccode` varchar(255) NOT NULL,
  `ethnicname` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_gender`
--

DROP TABLE IF EXISTS `main_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_gender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gendercode` varchar(255) NOT NULL,
  `gendername` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_geographygroup`
--

DROP TABLE IF EXISTS `main_geographygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_geographygroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `currency` int(11) DEFAULT NULL,
  `geographygroupname` varchar(255) DEFAULT NULL,
  `geographycode` varchar(255) NOT NULL,
  `geographyregion` varchar(255) DEFAULT NULL,
  `geographycityname` varchar(255) DEFAULT NULL,
  `defaultGeographyGroup` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_groups`
--

DROP TABLE IF EXISTS `main_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(60) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_hierarchylevels`
--

DROP TABLE IF EXISTS `main_hierarchylevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_hierarchylevels` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `level_number` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `createdby` bigint(11) DEFAULT NULL,
  `modifiedby` bigint(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_unique` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_holidaydates`
--

DROP TABLE IF EXISTS `main_holidaydates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_holidaydates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `holidayname` varchar(255) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `holidaydate` date DEFAULT NULL,
  `holidayyear` year(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_holidaygroups`
--

DROP TABLE IF EXISTS `main_holidaygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_holidaygroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_holidaygroups_aft_ins` AFTER UPDATE ON `main_holidaygroups` FOR EACH ROW BEGIN
				    if old.groupname != new.groupname then 
				    begin 
					update main_employees_summary set holiday_group_name = new.groupname,modifieddate = utc_timestamp() where isactive = 1 and holiday_group = new.id;
				    end;
				    end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_hr_wizard`
--

DROP TABLE IF EXISTS `main_hr_wizard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_hr_wizard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leavetypes` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `holidays` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `perf_appraisal` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `iscomplete` tinyint(1) DEFAULT '1' COMMENT '0=later,1=No,2=Yes',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_identitycodes`
--

DROP TABLE IF EXISTS `main_identitycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_identitycodes` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(100) DEFAULT NULL,
  `backgroundagency_code` varchar(100) DEFAULT NULL,
  `vendors_code` varchar(100) DEFAULT NULL,
  `staffing_code` varchar(100) DEFAULT NULL,
  `users_code` varchar(10) DEFAULT NULL COMMENT 'for users',
  `requisition_code` varchar(10) DEFAULT NULL COMMENT 'for requisition',
  `createdBy` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_identitycodes_aft_upd` AFTER UPDATE ON `main_identitycodes` 
				    FOR EACH ROW BEGIN
				    if old.employee_code != new.employee_code then 
				    begin
					update main_users set employeeId = replace(employeeId,SUBSTRING(employeeId,1,CHAR_LENGTH(old.employee_code)),new.employee_code),modifieddate = utc_timestamp() where SUBSTRING(employeeId,1,CHAR_LENGTH(old.employee_code)) = old.employee_code;
				    end;
				    end if;
				    if old.backgroundagency_code != new.backgroundagency_code then 
				    begin
					update main_users set employeeId = replace(employeeId,SUBSTRING(employeeId,1,CHAR_LENGTH(old.backgroundagency_code)),new.backgroundagency_code),modifieddate = utc_timestamp() where SUBSTRING(employeeId,1,CHAR_LENGTH(old.backgroundagency_code)) = old.backgroundagency_code;
				    end;
				    end if;
				    if old.users_code != new.users_code then 
				    begin
					update main_users set employeeId = replace(employeeId,SUBSTRING(employeeId,1,CHAR_LENGTH(old.users_code)),new.users_code),modifieddate = utc_timestamp() where SUBSTRING(employeeId,1,CHAR_LENGTH(old.users_code)) = old.users_code;
				    end;
				    end if;	
				    if old.requisition_code != new.requisition_code then 
				    begin
					update main_requisition r set r.requisition_code = replace(r.requisition_code,left(r.requisition_code,LOCATE('/',r.requisition_code)),CONCAT(new.requisition_code,'/')),r.modifiedon = utc_timestamp() where left(r.requisition_code,LOCATE('/',r.requisition_code)) = CONCAT(old.requisition_code,'/');
				    end;
				    end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_identitydocuments`
--

DROP TABLE IF EXISTS `main_identitydocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_identitydocuments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `document_name` varchar(500) DEFAULT NULL COMMENT '1-Yes,2-No',
  `mandatory` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `expiry` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `description` varchar(500) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_interviewdetails`
--

DROP TABLE IF EXISTS `main_interviewdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_interviewdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(11) unsigned DEFAULT NULL,
  `candidate_id` int(11) unsigned DEFAULT NULL,
  `interview_status` enum('In process','Completed','On hold','Requisition Closed/Completed') DEFAULT 'In process',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_interviewdetails_aft_upd` AFTER UPDATE ON `main_interviewdetails` FOR EACH ROW BEGIN
					if old.interview_status != new.interview_status then 
				        begin 
					update main_interviewrounds_summary set interview_status = new.interview_status,modified_date = utc_timestamp() where interview_id = new.id and isactive = 1;
					end;
				        end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_interviewrounddetails`
--

DROP TABLE IF EXISTS `main_interviewrounddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_interviewrounddetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `interview_id` int(11) unsigned DEFAULT NULL,
  `req_id` int(11) unsigned DEFAULT NULL,
  `candidate_id` int(11) unsigned DEFAULT NULL,
  `interviewer_id` int(11) unsigned DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_mode` enum('In person','Phone','Video conference') DEFAULT 'Phone',
  `interview_round_number` int(11) DEFAULT NULL,
  `interview_round` varchar(50) DEFAULT NULL,
  `interview_feedback` text,
  `interview_comments` text,
  `round_status` enum('Schedule for next round','Qualified','Selected','Disqualified','Decision pending','On hold','Incompetent','Ineligible','Candidate no show','Requisition Closed/Completed') DEFAULT NULL,
  `int_location` varchar(200) DEFAULT NULL,
  `int_city` int(11) unsigned DEFAULT NULL,
  `int_state` int(11) unsigned DEFAULT NULL,
  `int_country` int(11) unsigned DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_interviewrounddetails_aft_ins` AFTER INSERT ON `main_interviewrounddetails` FOR EACH ROW BEGIN
					declare cand_name,cstatus,istatus,int_name,cityname,statename,countryname,created_name varchar(255);
					select candidate_name,cand_status into cand_name,cstatus from main_candidatedetails where id = new.candidate_id and isactive =1;
					select userfullname into int_name from main_users where id = new.interviewer_id and isactive =1;
					select userfullname into created_name from main_users where id = new.createdby and isactive =1;
					select interview_status into istatus from main_interviewdetails where id = new.interview_id and isactive =1;
					select city into cityname from main_cities where city_org_id = new.int_city and isactive =1;
					select state into statename from main_states where state_id_org = new.int_state and isactive =1;
					select country into countryname from main_countries where country_id_org = new.int_country and isactive =1;
					insert into main_interviewrounds_summary 
					(requisition_id, candidate_id, candidate_name,candidate_status, interview_status, interview_id, interviewround_id, 
					interviewer_id, interviewer_name, interview_time, interview_date, interview_mode, interview_round_number, 
					interview_round_name, interview_location, interview_city_id, interview_state_id, interview_city_name, 
					interview_state_name, interview_country_id, interview_country_name, created_by, created_by_name, 
					interview_feedback, interview_comments, round_status, modified_by, created_date, modified_date, 
					isactive)
					values
					( new.req_id, new.candidate_id,	cand_name,cstatus,istatus,new.interview_id,new.id, 	
					new.interviewer_id,int_name,new.interview_time,new.interview_date,new.interview_mode,new.interview_round_number, 
					new.interview_round,new.int_location, 	new.int_city,new.int_state,cityname, 
					statename,new.int_country,countryname,new.createdby,created_name, 
					new.interview_feedback, new.interview_comments,	new.round_status,new.modifiedby, new.createddate, new.modifieddate, 
					new.isactive
					);
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_interviewrounddetails_aft_upd` AFTER UPDATE ON `main_interviewrounddetails` FOR EACH ROW BEGIN
					declare cand_name,cstatus,istatus,int_name,cityname,statename,countryname varchar(255);
					select candidate_name,cand_status into cand_name,cstatus from main_candidatedetails where id = new.candidate_id and isactive =1;
					select userfullname into int_name from main_users where id = new.interviewer_id and isactive =1;
					
					select interview_status into istatus from main_interviewdetails where id = new.interview_id and isactive =1;
					select city into cityname from main_cities where city_org_id = new.int_city and isactive =1;
					select state into statename from main_states where state_id_org = new.int_state and isactive =1;
					select country into countryname from main_countries where country_id_org = new.int_country and isactive =1;
					update main_interviewrounds_summary set
					 candidate_name = cand_name,candidate_status = cstatus, interview_status = istatus,  
					interviewer_id = new.interviewer_id, interviewer_name = int_name, interview_time = new.interview_time,
					interview_date = new.interview_date, interview_mode = new.interview_mode, interview_round_number = new.interview_round_number, 
					interview_round_name = new.interview_round, interview_location = new.int_location, interview_city_id = new.int_city,
					interview_state_id = new.int_state, interview_city_name = cityname,interview_state_name = statename,
					interview_country_id = new.int_country, interview_country_name = countryname, interview_feedback = new.interview_feedback, 
					interview_comments = new.interview_comments, round_status = new.round_status, modified_by = new.modifiedby, 
					modified_date = new.modifieddate,isactive = new.isactive
					
					 where interviewround_id = new.id;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_interviewrounds_summary`
--

DROP TABLE IF EXISTS `main_interviewrounds_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_interviewrounds_summary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` int(11) unsigned DEFAULT NULL,
  `candidate_id` bigint(20) unsigned DEFAULT NULL,
  `candidate_name` varchar(200) DEFAULT NULL,
  `candidate_status` enum('Shortlisted','Selected','Rejected','On hold','Disqualified','Scheduled','Not Scheduled','Recruited','Requisition Closed/Completed') DEFAULT NULL,
  `interview_status` enum('In process','Completed','On hold','Requisition Closed/Completed') DEFAULT NULL,
  `interview_id` int(11) unsigned DEFAULT NULL,
  `interviewround_id` int(11) unsigned DEFAULT NULL,
  `interviewer_id` bigint(20) unsigned DEFAULT NULL,
  `interviewer_name` varchar(255) DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_mode` enum('In person','Phone','Video conference') DEFAULT NULL,
  `interview_round_number` int(11) unsigned DEFAULT NULL,
  `interview_round_name` varchar(200) DEFAULT NULL,
  `interview_location` varchar(200) DEFAULT NULL,
  `interview_city_id` int(11) unsigned DEFAULT NULL,
  `interview_state_id` int(11) unsigned DEFAULT NULL,
  `interview_city_name` varchar(255) DEFAULT NULL,
  `interview_state_name` varchar(255) DEFAULT NULL,
  `interview_country_id` int(11) unsigned DEFAULT NULL,
  `interview_country_name` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL,
  `interview_feedback` text,
  `interview_comments` text,
  `round_status` enum('Schedule for next round','Qualified','Selected','Disqualified','Decision pending','On hold','Incompetent','Ineligible','Candidate no show','Requisition Closed/Completed') DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_jobtitles`
--

DROP TABLE IF EXISTS `main_jobtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_jobtitles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jobtitlecode` varchar(255) DEFAULT NULL,
  `jobtitlename` varchar(255) DEFAULT NULL,
  `jobdescription` varchar(255) DEFAULT NULL,
  `minexperiencerequired` float DEFAULT NULL,
  `jobpaygradecode` varchar(255) DEFAULT NULL,
  `jobpayfrequency` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_jobtitles_aft_upd` AFTER UPDATE ON `main_jobtitles` FOR EACH ROW BEGIN
				    if old.jobtitlename != new.jobtitlename then 
				    begin 
					update main_requisition_summary set jobtitle_name = new.jobtitlename,modifiedon = utc_timestamp() where isactive = 1 and jobtitle = new.id;
					update main_employees_summary set jobtitle_name = new.jobtitlename,modifieddate = utc_timestamp() where isactive = 1 and jobtitle_id = new.id;
				    end;
				    end if;
				    
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_language`
--

DROP TABLE IF EXISTS `main_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `languagename` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_leavemanagement`
--

DROP TABLE IF EXISTS `main_leavemanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leavemanagement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cal_startmonth` int(11) unsigned DEFAULT NULL,
  `weekend_startday` int(11) unsigned DEFAULT NULL,
  `weekend_endday` int(11) unsigned DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT '0',
  `hr_id` int(11) DEFAULT NULL,
  `hours_day` int(11) DEFAULT NULL,
  `is_satholiday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_halfday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_leavetransfer` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_skipholidays` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_leavemanagement_aft_ins` AFTER INSERT ON `main_leavemanagement` FOR EACH ROW BEGIN
				    declare calmonth_name,weekend_name1,weekend_name2,dept_name,buss_unit_name varchar(200);
				    declare dept_id,bunit_id bigint(20);
				    select month_name into calmonth_name from tbl_months where monthid = new.cal_startmonth;
				    select week_name into weekend_name1 from tbl_weeks where week_id = new.weekend_startday;
				    select week_name into weekend_name2 from tbl_weeks where week_id = new.weekend_endday;
				    #select department_id into dept_id from main_employees where user_id = new.user_id;
				    select b.id,concat(d.deptname," (",d.deptcode,")") ,
				    if(b.unitcode != "000",concat(b.unitcode,"","-"),"") into bunit_id,dept_name,buss_unit_name 
				    FROM `main_departments` AS `d` LEFT JOIN `main_businessunits` AS `b` ON b.id=d.unitid 
				    WHERE (d.isactive = 1 and d.id = new.department_id);
				    insert into main_leavemanagement_summary (leavemgmt_id, cal_startmonth, cal_startmonthname, 
				    weekend_startday, weekend_startdayname, weekend_endday,weekend_enddayname, businessunit_id, 
				    businessunit_name, department_id, department_name, hours_day, is_satholiday, is_halfday, 
				    is_leavetransfer, is_skipholidays, description, createdby, modifiedby, createddate, 
				    modifieddate, isactive)
				    values(new.id,new.cal_startmonth, calmonth_name, new.weekend_startday, weekend_name1,
				    new.weekend_endday,weekend_name2,bunit_id, buss_unit_name, new.department_id, 
				    dept_name, new.hours_day, new.is_satholiday, new.is_halfday, new.is_leavetransfer, 
				    new.is_skipholidays, new.description,  new.createdby, new.modifiedby, new.createddate, 
				    new.modifieddate, new.isactive);
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_leavemanagement_aft_upd` AFTER UPDATE ON `main_leavemanagement` FOR EACH ROW BEGIN
				    declare calmonth_name,weekend_name1,weekend_name2,dept_name,buss_unit_name varchar(200);
				    declare bunit_id bigint(20);
				    select month_name into calmonth_name from tbl_months where monthid = new.cal_startmonth;
				    select week_name into weekend_name1 from tbl_weeks where week_id = new.weekend_startday;
				    select week_name into weekend_name2 from tbl_weeks where week_id = new.weekend_endday;
				    select b.id,concat(d.deptname," (",d.deptcode,")") ,
				    if(b.unitcode != "000",concat(b.unitcode,"","-"),"") into bunit_id,dept_name,buss_unit_name 
				    FROM `main_departments` AS `d` LEFT JOIN `main_businessunits` AS `b` ON b.id=d.unitid 
				    WHERE (d.isactive = 1 and d.id = new.department_id);
				    UPDATE  main_leavemanagement_summary set
				    cal_startmonth = new.cal_startmonth, 
				    cal_startmonthname = calmonth_name, 
				    weekend_startday = new.weekend_startday, 
				    weekend_startdayname = weekend_name1,
				    weekend_endday = new.weekend_endday, 
				    weekend_enddayname = weekend_name2, 
				    businessunit_id = bunit_id, 
				    businessunit_name = buss_unit_name, 
				    department_id = new.department_id, 
				    department_name = dept_name, 
				    hours_day = new.hours_day, 
				    is_satholiday = new.is_satholiday, 
				    is_halfday = new.is_halfday, 
				    is_leavetransfer = new.is_leavetransfer, 
				    is_skipholidays = new.is_skipholidays, 
				    description = new.description, 
				    createdby = new.createdby, 
				    modifiedby = new.modifiedby, 
				    createddate = new.createddate, 
				    modifieddate = new.modifieddate, 
				    isactive = new.isactive where leavemgmt_id = new.id;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_leavemanagement_summary`
--

DROP TABLE IF EXISTS `main_leavemanagement_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leavemanagement_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leavemgmt_id` bigint(20) unsigned DEFAULT NULL,
  `cal_startmonth` int(11) unsigned DEFAULT NULL,
  `cal_startmonthname` varchar(100) DEFAULT NULL,
  `weekend_startday` int(11) unsigned DEFAULT NULL,
  `weekend_startdayname` varchar(100) DEFAULT NULL,
  `weekend_endday` int(11) unsigned DEFAULT NULL,
  `weekend_enddayname` varchar(100) DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `businessunit_name` varchar(100) DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `hours_day` int(11) DEFAULT NULL,
  `is_satholiday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_halfday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_leavetransfer` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_skipholidays` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_leaverequest`
--

DROP TABLE IF EXISTS `main_leaverequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leaverequest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `reason` text,
  `approver_comments` text,
  `leavetypeid` int(11) unsigned DEFAULT NULL,
  `leaveday` tinyint(1) DEFAULT NULL COMMENT '1-full day,2-half day',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `leavestatus` enum('Pending for approval','Approved','Rejected','Cancel') DEFAULT 'Pending for approval',
  `rep_mang_id` int(11) unsigned DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `no_of_days` float unsigned DEFAULT NULL,
  `appliedleavescount` float(4,1) unsigned DEFAULT NULL,
  `is_sat_holiday` tinyint(1) DEFAULT NULL COMMENT '1-yes,2-no',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_leaverequest_aft_ins` AFTER INSERT ON `main_leaverequest` 
					FOR EACH ROW BEGIN
					DECLARE user_name,repmanager_name,dept_hr_name,leave_type_name,dept_name,buss_unit_name VARCHAR(200);
					DECLARE dept_id,bunit_id BIGINT(20);
					SELECT userfullname INTO user_name FROM main_users WHERE id = new.user_id;
					SELECT userfullname INTO repmanager_name FROM main_users WHERE id = new.rep_mang_id;
					SELECT userfullname INTO dept_hr_name FROM main_users WHERE id = new.hr_id;
					SELECT leavetype INTO leave_type_name FROM main_employeeleavetypes WHERE id = new.leavetypeid;
					SELECT department_id INTO dept_id FROM main_employees WHERE user_id = new.user_id;
					SELECT b.id,CONCAT(d.deptname," (",d.deptcode,")") ,
					IF(b.unitcode != "000",CONCAT(b.unitcode,"","-"),"") INTO bunit_id,dept_name,buss_unit_name 
					FROM `main_departments` AS `d` LEFT JOIN `main_businessunits` AS `b` ON b.id=d.unitid 
					WHERE (d.isactive = 1 AND d.id = dept_id);
					INSERT INTO main_leaverequest_summary (leave_req_id, user_id, user_name, department_id, 
					department_name, bunit_id,buss_unit_name, reason, approver_comments, leavetypeid, leavetype_name, leaveday, from_date, to_date, leavestatus, 
					rep_mang_id, rep_manager_name, hr_id,hr_name,no_of_days, appliedleavescount, is_sat_holiday, createdby, 
					modifiedby, createddate, modifieddate, isactive)
					VALUES(new.id,new.user_id, user_name, dept_id, dept_name,bunit_id,buss_unit_name,new.reason,new.approver_comments, 
					new.leavetypeid, leave_type_name, new.leaveday, new.from_date, new.to_date, new.leavestatus, 
					new.rep_mang_id, repmanager_name,new.hr_id,dept_hr_name, new.no_of_days, new.appliedleavescount, new.is_sat_holiday, 
					new.createdby, new.modifiedby, new.createddate, new.modifieddate, new.isactive);
					END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_leaverequest_aft_upd` AFTER UPDATE ON `main_leaverequest` FOR EACH ROW BEGIN
				    declare user_name,repmanager_name,leave_type_name,dept_name,buss_unit_name varchar(200);
				    declare dept_id,bunit_id bigint(20);
				    #select userfullname into user_name from main_users where id = new.user_id;
				    #select userfullname into repmanager_name from main_users where id = new.rep_mang_id;
				    #select leavetype into leave_type_name from main_employeeleavetypes where id = new.leavetypeid;
				    select department_id into dept_id from main_employees where user_id = new.user_id;
				    select b.id,concat(d.deptname," (",d.deptcode,")") ,
				    if(b.unitcode != "000",concat(b.unitcode,"","-"),"") into bunit_id,dept_name,buss_unit_name 
				    FROM `main_departments` AS `d` LEFT JOIN `main_businessunits` AS `b` ON b.id=d.unitid 
				    WHERE (d.isactive = 1 and d.id = dept_id);
				    UPDATE  main_leaverequest_summary set
				    user_id = new.user_id, 
				    department_id = dept_id, 
				    department_name = dept_name, 
				    bunit_id = bunit_id,
				    buss_unit_name = buss_unit_name,
				    approver_comments = new.approver_comments, 
				    leavestatus = new.leavestatus, 
				    modifieddate = new.modifieddate, 
				    isactive = new.isactive where leave_req_id = new.id;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_leaverequest_history`
--

DROP TABLE IF EXISTS `main_leaverequest_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leaverequest_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leaverequest_id` int(20) DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_leaverequest_summary`
--

DROP TABLE IF EXISTS `main_leaverequest_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leaverequest_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leave_req_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `bunit_id` bigint(20) unsigned DEFAULT NULL,
  `buss_unit_name` varchar(255) DEFAULT NULL,
  `reason` text,
  `approver_comments` text,
  `leavetypeid` int(11) unsigned DEFAULT NULL,
  `leavetype_name` varchar(255) DEFAULT NULL,
  `leaveday` tinyint(1) DEFAULT NULL COMMENT '1-full day,2-half day',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `leavestatus` enum('Pending for approval','Approved','Rejected','Cancel') DEFAULT 'Pending for approval',
  `rep_mang_id` int(11) unsigned DEFAULT NULL,
  `rep_manager_name` varchar(255) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `hr_name` varchar(255) DEFAULT NULL,
  `no_of_days` float unsigned DEFAULT NULL,
  `appliedleavescount` float(4,1) unsigned DEFAULT NULL,
  `is_sat_holiday` tinyint(1) DEFAULT NULL COMMENT '1-yes,2-no',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_licensetype`
--

DROP TABLE IF EXISTS `main_licensetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_licensetype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `licensetype` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_logmanager`
--

DROP TABLE IF EXISTS `main_logmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_logmanager` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menuId` bigint(20) DEFAULT NULL,
  `user_action` tinyint(4) unsigned DEFAULT NULL COMMENT '1-add,2-edit,3-delete,4-active/inactive,5-cancel',
  `log_details` text,
  `last_modifiedby` int(11) unsigned DEFAULT NULL,
  `last_modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `key_flag` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `obj_action` (`menuId`,`user_action`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_logmanagercron`
--

DROP TABLE IF EXISTS `main_logmanagercron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_logmanagercron` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menuId` bigint(20) DEFAULT NULL,
  `user_action` tinyint(4) unsigned DEFAULT NULL COMMENT '1-add,2-edit,3-delete,4-active/inactive',
  `log_details` text,
  `last_modifiedby` int(11) unsigned DEFAULT NULL,
  `last_modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `key_flag` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_mail_settings`
--

DROP TABLE IF EXISTS `main_mail_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_mail_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tls` varchar(100) NOT NULL,
  `auth` varchar(100) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_maritalstatus`
--

DROP TABLE IF EXISTS `main_maritalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_maritalstatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `maritalcode` varchar(255) NOT NULL,
  `maritalstatusname` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_menu`
--

DROP TABLE IF EXISTS `main_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menuName` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `helpText` varchar(255) DEFAULT NULL,
  `toolTip` varchar(255) DEFAULT NULL,
  `iconPath` varchar(255) DEFAULT NULL,
  `parent` int(11) unsigned DEFAULT NULL,
  `menuOrder` int(11) unsigned DEFAULT NULL,
  `nav_ids` text,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  `modulename` varchar(50) DEFAULT NULL,
  `segment_flag` tinyint(1) DEFAULT '2',
  `org_menuid` int(11) unsigned DEFAULT NULL,
  `menufields` text COMMENT 'select,insert,update references',
  `menuQuery` text,
  `hasJoins` tinyint(4) DEFAULT NULL,
  `modelName` varchar(255) DEFAULT NULL,
  `functionName` varchar(255) DEFAULT NULL,
  `defaultOrderBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_militaryservice`
--

DROP TABLE IF EXISTS `main_militaryservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_militaryservice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `militaryservicetype` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_monthslist`
--

DROP TABLE IF EXISTS `main_monthslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_monthslist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `month_id` bigint(20) unsigned DEFAULT NULL,
  `monthcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_monthlist_aftr_upd` AFTER UPDATE ON `main_monthslist` FOR EACH ROW BEGIN
			        declare calmonth_name varchar(200);
			        select month_name into calmonth_name from tbl_months where monthid = new.month_id;
			        UPDATE main_leavemanagement_summary lm SET lm.cal_startmonthname = calmonth_name, lm.modifieddate = utc_timestamp() 
			        WHERE (lm.cal_startmonth = new.month_id AND lm.isactive=1);
			    	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_nationality`
--

DROP TABLE IF EXISTS `main_nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_nationality` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nationalitycode` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_nationalitycontextcode`
--

DROP TABLE IF EXISTS `main_nationalitycontextcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_nationalitycontextcode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nationalitycontextcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_numberformats`
--

DROP TABLE IF EXISTS `main_numberformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_numberformats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numberformattype` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_organisationinfo`
--

DROP TABLE IF EXISTS `main_organisationinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_organisationinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organisationname` varchar(255) DEFAULT NULL,
  `org_image` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `orgdescription` text,
  `totalemployees` int(11) unsigned DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `org_startdate` date DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `secondaryphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `secondaryemail` varchar(255) DEFAULT NULL,
  `faxnumber` varchar(255) DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `address1` text,
  `address2` text,
  `address3` text,
  `description` text,
  `orghead` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_appraisalhistory`
--

DROP TABLE IF EXISTS `main_pa_appraisalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_appraisalhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `desc_emp_id` bigint(20) unsigned DEFAULT NULL,
  `desc_emp_name` varchar(100) DEFAULT NULL,
  `desc_emp_profileimg` varchar(150) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`employee_id`),
  KEY `NewIndex2` (`pa_initialization_id`),
  KEY `NewIndex3` (`desc_emp_id`),
  KEY `NewIndex4` (`createdby`),
  KEY `NewIndex5` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='gives history of each employee''s appraisal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_category`
--

DROP TABLE IF EXISTS `main_pa_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `isused` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`createdby`),
  KEY `NewIndex2` (`modifiedby`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='This table is used to add questions category(Questionaire)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_employee_ratings`
--

DROP TABLE IF EXISTS `main_pa_employee_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_employee_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_response` text COMMENT '{''Q1'':{''Comment'':''good'',''Rating'':''rating_id''},''Q2'':{''Comment'':''excellent'',''Rating'':''rating_id''}}',
  `manager_response` text COMMENT '{''Q1'':{''Comment'':''good'',''Rating'':''rating_id''},''Q2'':{''Comment'':''excellent'',''Rating'':''rating_id''}}',
  `skill_response` text COMMENT '{''skill_id'':''rating_id''}',
  `line_manager_1` bigint(20) DEFAULT NULL,
  `line_manager_2` bigint(20) DEFAULT NULL,
  `line_manager_3` bigint(20) DEFAULT NULL,
  `line_manager_4` bigint(20) DEFAULT NULL,
  `line_manager_5` bigint(20) DEFAULT NULL,
  `line_comment_1` text COMMENT '{''rating_id'':''comment''}',
  `line_comment_2` text COMMENT '{''rating_id'':''comment''}',
  `line_comment_3` text COMMENT '{''rating_id'':''comment''}',
  `line_comment_4` text,
  `line_comment_5` text,
  `line_rating_1` int(11) unsigned DEFAULT NULL,
  `line_rating_2` int(11) unsigned DEFAULT NULL,
  `line_rating_3` int(11) unsigned DEFAULT NULL,
  `line_rating_4` int(11) DEFAULT NULL,
  `line_rating_5` int(11) DEFAULT NULL,
  `consolidated_rating` float(10,2) DEFAULT NULL COMMENT 'Consolidated rating.Need to be updated after each manager rating.',
  `appraisal_status` enum('Pending employee ratings','Pending L1 ratings','Pending L2 ratings','Pending L3 ratings','Pending L4 ratings','Pending L5 ratings','Completed') DEFAULT 'Pending employee ratings' COMMENT '1=Pending employee ratings,2=Pending L1 ratings,3=Pending L2 ratings,4=Pending L3 ratings,5=Pending L4 ratings,6=Pending L5 ratings,7=Completed,',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`pa_initialization_id`),
  KEY `NewIndex2` (`employee_id`),
  CONSTRAINT `FK_main_pa_employee_ratings` FOREIGN KEY (`pa_initialization_id`) REFERENCES `main_pa_initialization` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Employee appraisal response is stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_ff_employee_ratings`
--

DROP TABLE IF EXISTS `main_pa_ff_employee_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_ff_employee_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ff_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `question_ids` text,
  `employee_response` text COMMENT '{''Q1'':{''Comment'':''good'',''Rating'':''rating_id''},''Q2'':{''Comment'':''excellent'',''Rating'':''rating_id''}}',
  `ff_status` enum('Pending employee ratings','Completed') DEFAULT NULL,
  `consolidated_rating` float(10,2) DEFAULT NULL,
  `additional_comments` text,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_ff_history`
--

DROP TABLE IF EXISTS `main_pa_ff_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_ff_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `pa_ff_initialization_id` bigint(20) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `desc_emp_id` bigint(20) unsigned DEFAULT NULL,
  `desc_emp_name` varchar(100) DEFAULT NULL,
  `desc_emp_profileimg` varchar(150) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='gives step by step history of feedforward';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_ff_initialization`
--

DROP TABLE IF EXISTS `main_pa_ff_initialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_ff_initialization` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_configured_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Management configuration with module_flag=2',
  `businessunit_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `ff_mode` enum('Quarterly','Half-yearly','Yearly') DEFAULT NULL,
  `ff_period` tinyint(1) unsigned DEFAULT NULL COMMENT '1,2,3,4 for quaterly, 1.2 for half-yearly , 1 for yearly',
  `ff_from_year` int(11) DEFAULT NULL,
  `ff_to_year` int(11) DEFAULT NULL,
  `ff_due_date` date DEFAULT NULL,
  `appraisal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Latest appraisal Id',
  `employee_name_view` tinyint(1) unsigned DEFAULT NULL COMMENT '0=Hide,1=Show',
  `enable_to` tinyint(1) DEFAULT NULL COMMENT '0=Appraisal Employees,1=All Employees',
  `initialize_status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=initlaize,2=initialize later',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=open, 2= close ,Appraisal staus for the particular period',
  `questions` text,
  `qs_privileges` text,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1=active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='initialize feedforward by management';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_groups`
--

DROP TABLE IF EXISTS `main_pa_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `group_name` varchar(250) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1=active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='divide all employees into groups for easy identification for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_groups_employees`
--

DROP TABLE IF EXISTS `main_pa_groups_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_groups_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `employee_ids` text COMMENT 'comma separated employee ids',
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1=active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_groups_employees_temp`
--

DROP TABLE IF EXISTS `main_pa_groups_employees_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_groups_employees_temp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `employee_ids` text COMMENT 'comma separated employee ids',
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1=active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_implementation`
--

DROP TABLE IF EXISTS `main_pa_implementation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_implementation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `businessunit_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `performance_app_flag` tinyint(1) unsigned DEFAULT NULL COMMENT '1=bu wise,0=dept wise',
  `appraisal_mode` enum('Quarterly','Half-yearly','Yearly') DEFAULT NULL,
  `approval_selection` tinyint(1) unsigned DEFAULT NULL COMMENT '1=HR,2=Manager',
  `appraisal_ratings` tinyint(1) unsigned DEFAULT NULL COMMENT '1=1-5,2=1-10',
  `module_flag` tinyint(1) unsigned DEFAULT NULL COMMENT '1=Performance appraisals,2=Feedforward',
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '0=inactive,1=active,2=delete',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='stores configuration of appraisal process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_initialization`
--

DROP TABLE IF EXISTS `main_pa_initialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_initialization` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `pa_configured_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of main_pa_implementation',
  `businessunit_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of business unit',
  `department_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of department else null',
  `enable_step` tinyint(1) unsigned DEFAULT NULL COMMENT '0=No,1=Managers,2=Employees',
  `appraisal_mode` enum('Yearly','Half-yearly','Quarterly') DEFAULT NULL COMMENT 'mode of appraisal',
  `appraisal_period` tinyint(1) unsigned DEFAULT NULL COMMENT '1,2,3,4 for quaterly, 1.2 for half yearly , 1 for yearly',
  `eligibility` varchar(40) DEFAULT NULL COMMENT 'comma separated employment status ids',
  `from_year` int(11) unsigned DEFAULT NULL COMMENT 'financial year -start',
  `to_year` int(11) unsigned DEFAULT NULL COMMENT 'financial year-end',
  `managers_due_date` date DEFAULT NULL COMMENT 'due date for enable to managers',
  `employees_due_date` date DEFAULT NULL COMMENT 'due date for enable to employees',
  `category_id` varchar(250) DEFAULT NULL COMMENT 'comma separated question category ids',
  `initialize_status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=initlaize,2=initialize later',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=open, 2= close , 3= Force Close.Appraisal staus for the particular period',
  `pa_group_ids` text COMMENT 'Comma separated group ids',
  `manager_ids` text COMMENT 'Comma separated manager ids,Whenever manager completes initalization his id has to be appended',
  `manager_level_type` tinyint(1) unsigned DEFAULT NULL COMMENT '1=configure l1,2=use reporting mangers',
  `comments` text COMMENT 'To capture hr comments if forceful close of initialization',
  `group_settings` tinyint(1) DEFAULT '0' COMMENT '0=default screen,1= all, 2=groupwise',
  `employee_response` tinyint(1) DEFAULT '1' COMMENT '1-No response,2-Response',
  `appraisal_ratings` tinyint(1) unsigned DEFAULT NULL COMMENT 'same value as from implementation',
  `management_appraisal` tinyint(1) unsigned DEFAULT '0' COMMENT '1=management included,0=no management',
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '0=inactive,1=active',
  `performance_app_flag` tinyint(4) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL COMMENT 'id of created user',
  `createdby_role` bigint(20) unsigned DEFAULT NULL COMMENT 'role of created user',
  `createdby_group` bigint(20) unsigned DEFAULT NULL COMMENT 'group of created user',
  `modifiedby` bigint(20) unsigned DEFAULT NULL COMMENT 'id of user modified by',
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL COMMENT 'role of user modified by',
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL COMMENT 'group of user modified by',
  `createddate` datetime DEFAULT NULL COMMENT 'created date',
  `modifieddate` datetime DEFAULT NULL COMMENT 'modified date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='initialize appriasal process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_manager_initialization`
--

DROP TABLE IF EXISTS `main_pa_manager_initialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_manager_initialization` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `selected_employee_ids` text COMMENT 'Comma separated employee ids selected during initialization',
  `approver_level` bigint(20) unsigned DEFAULT NULL,
  `approver_1_id` bigint(20) unsigned DEFAULT NULL,
  `approver_2_id` bigint(20) unsigned DEFAULT NULL,
  `approver_3_id` bigint(20) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Manager initialized data is stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_questions`
--

DROP TABLE IF EXISTS `main_pa_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_category_id` bigint(20) unsigned DEFAULT NULL,
  `question` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `module_flag` tinyint(1) unsigned DEFAULT NULL COMMENT '1=Performance appraisals,2=Feedforward',
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '0=inactive,1=active',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isused` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='stores questions for appraisal and feedforward';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_questions_privileges`
--

DROP TABLE IF EXISTS `main_pa_questions_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_questions_privileges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Appraisal initialization id for appraisal else feedforward initialization id for feedforward',
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Null for feedforward else employee id',
  `hr_qs` text COMMENT 'Comma separated question ids created by hr',
  `hr_group_qs_privileges` text COMMENT '{''Q1'':{''Manager Comments'':1,''Employee Comments'':1,''Manager Ratings'':1,''Employee Ratings'':1}}',
  `manager_group_id` bigint(20) unsigned DEFAULT NULL COMMENT 'group id of employees created by manager',
  `manager_qs` text COMMENT 'Comma separeated question ids created by manager',
  `manager_qs_privileges` text COMMENT '{''Q1'':{''Manager Comments'':1,''Employee Comments'':1,''Manager Ratings'':1,''Employee Ratings'':1}}',
  `ff_qs` text COMMENT 'Comma separeated question ids created by management',
  `ff_qs_privileges` text COMMENT '{''Q1'':{''Employee Comments'':1,''Employee Ratings'':1}}',
  `module_flag` tinyint(1) DEFAULT NULL COMMENT '1=Performance appraisals,2=Feedforward',
  `line_manager_1` bigint(20) DEFAULT NULL COMMENT 'Line 1 manager id',
  `line_manager_2` bigint(20) DEFAULT NULL COMMENT 'Line 2 manager id',
  `line_manager_3` bigint(20) DEFAULT NULL COMMENT 'Line 3 manager id',
  `line_manager_4` bigint(20) DEFAULT NULL COMMENT 'Line 4 manager id',
  `line_manager_5` bigint(20) DEFAULT NULL COMMENT 'Line 5 manager id',
  `manager_levels` tinyint(1) unsigned DEFAULT NULL COMMENT 'no.of levels of appraisal',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Stores the privileges of questions for each employee in json';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_questions_privileges_temp`
--

DROP TABLE IF EXISTS `main_pa_questions_privileges_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_questions_privileges_temp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Appraisal initialization id for appraisal else feedforward initialization id for feedforward',
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of the employee',
  `hr_qs` text COMMENT 'Comma separated question ids created by hr',
  `hr_group_qs_privileges` text COMMENT '{''groupid:''{''Q1'':{''Manager Comments'':1,''Employee Comments'':1,''Manager Ratings'':1,''Employee Ratings'':1}}}',
  `line_manager_1` bigint(20) DEFAULT NULL COMMENT 'Line 1 reporting manager',
  `line_manager_2` bigint(20) DEFAULT NULL COMMENT 'Line 2 reporting manager',
  `line_manager_3` bigint(20) DEFAULT NULL COMMENT 'Line 3 reporting manager',
  `line_manager_4` bigint(20) DEFAULT NULL COMMENT 'Line 4 reporting manager',
  `line_manager_5` bigint(20) DEFAULT NULL COMMENT 'Line 5 reporting manager',
  `manager_levels` tinyint(1) unsigned DEFAULT NULL COMMENT 'no.of levels of appraisal',
  `module_flag` tinyint(1) unsigned DEFAULT NULL COMMENT '1=performance appraisal,2=feedforward',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Stores the questions, privileges and groups when initialized';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_ratings`
--

DROP TABLE IF EXISTS `main_pa_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_configured_id` bigint(20) unsigned DEFAULT NULL,
  `pa_initialization_id` bigint(20) DEFAULT NULL,
  `rating_type` tinyint(1) DEFAULT '1' COMMENT '1=(1-5),2=(1-10)',
  `rating_value` int(11) unsigned DEFAULT NULL COMMENT 'Rating value',
  `rating_text` varchar(100) DEFAULT NULL COMMENT 'Rating text',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='This table is used to add ratings text in json format.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pa_skills`
--

DROP TABLE IF EXISTS `main_pa_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  `isused` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='This table is used to add skills.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_patches_version`
--

DROP TABLE IF EXISTS `main_patches_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_patches_version` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1' COMMENT '1=latest versions,0=old versions',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_payfrequency`
--

DROP TABLE IF EXISTS `main_payfrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_payfrequency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `freqtype` varchar(255) NOT NULL,
  `freqcode` varchar(100) DEFAULT NULL,
  `freqdescription` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pd_categories`
--

DROP TABLE IF EXISTS `main_pd_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pd_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL,
  `description` text,
  `isused` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_pd_documents`
--

DROP TABLE IF EXISTS `main_pd_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pd_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `subcategory_id` bigint(20) unsigned DEFAULT NULL COMMENT 'not used ',
  `document_name` varchar(500) NOT NULL,
  `document_version` varchar(100) DEFAULT NULL,
  `description` text,
  `file_name` text,
  `isactive` tinyint(4) DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `flag1` varchar(100) DEFAULT NULL,
  `flag2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_positions`
--

DROP TABLE IF EXISTS `main_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_positions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `positionname` varchar(100) DEFAULT NULL,
  `jobtitleid` int(11) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_positions_main_requisition_summary` AFTER UPDATE ON `main_positions` FOR EACH ROW BEGIN
					UPDATE main_requisition_summary rs SET rs.position_name = NEW.positionname, rs.modifiedon = utc_timestamp() WHERE (rs.position_id = NEW.id 
					AND rs.position_name != NEW.positionname);
					update main_employees_summary set position_name = new.positionname,modifieddate = utc_timestamp() where position_id = new.id and isactive = 1;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_prefix`
--

DROP TABLE IF EXISTS `main_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_prefix` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_prefix_aft_upd` AFTER UPDATE ON `main_prefix` FOR EACH ROW BEGIN
				    if old.prefix != new.prefix then 
				    begin 
				      update main_employees_summary set prefix_name = new.prefix,modifieddate = utc_timestamp() where isactive = 1 and prefix_id = new.id;
				    end;
				    end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_privileges`
--

DROP TABLE IF EXISTS `main_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_privileges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` int(11) unsigned DEFAULT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  `object` int(11) unsigned DEFAULT NULL,
  `addpermission` varchar(10) DEFAULT NULL,
  `editpermission` varchar(10) DEFAULT NULL,
  `deletepermission` varchar(10) DEFAULT NULL,
  `viewpermission` varchar(10) DEFAULT NULL,
  `uploadattachments` varchar(10) DEFAULT NULL,
  `viewattachments` varchar(10) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1230 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_racecode`
--

DROP TABLE IF EXISTS `main_racecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_racecode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `racecode` varchar(255) NOT NULL,
  `racename` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_remunerationbasis`
--

DROP TABLE IF EXISTS `main_remunerationbasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_remunerationbasis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `remtype` varchar(255) DEFAULT NULL,
  `remdesc` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_request_history`
--

DROP TABLE IF EXISTS `main_request_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_request_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `emp_id` bigint(20) unsigned DEFAULT NULL,
  `emp_name` varchar(100) DEFAULT NULL,
  `emp_profileimg` varchar(150) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  `comments` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='for request history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_requisition`
--

DROP TABLE IF EXISTS `main_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_requisition` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_code` varchar(20) DEFAULT NULL,
  `onboard_date` date DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `reporting_id` bigint(20) unsigned DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `jobtitle` int(11) unsigned DEFAULT NULL,
  `req_no_positions` int(11) unsigned DEFAULT NULL,
  `selected_members` int(11) unsigned DEFAULT '0' COMMENT 'count of selected members',
  `filled_positions` int(11) unsigned DEFAULT '0',
  `jobdescription` text,
  `req_skills` text NOT NULL,
  `req_qualification` varchar(150) DEFAULT NULL,
  `req_exp_years` varchar(10) NOT NULL,
  `emp_type` int(11) unsigned DEFAULT NULL,
  `req_priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1- High, 2- Medium,3- Low',
  `additional_info` text,
  `req_status` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `approver1` bigint(20) unsigned DEFAULT NULL,
  `approver2` bigint(20) unsigned DEFAULT NULL,
  `approver3` bigint(20) unsigned DEFAULT NULL,
  `appstatus1` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus2` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus3` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `recruiters` varchar(150) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un1` (`requisition_code`),
  KEY `NewIndex1` (`position_id`),
  KEY `reporting` (`reporting_id`),
  KEY `emptype` (`emp_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_requisition_aft_ins` AFTER INSERT ON `main_requisition` 
					FOR EACH ROW BEGIN
						DECLARE pos_name,rep_name,bunit_name,dept_name,job_name,empt_name,app1_name,app2_name,app3_name,createdbyname VARCHAR(200);
						SELECT positionname INTO pos_name FROM main_positions WHERE id = new.position_id;
						SELECT userfullname INTO rep_name FROM main_users WHERE id = new.reporting_id;
						SELECT userfullname INTO app1_name FROM main_users WHERE id = new.approver1;
						SELECT userfullname INTO createdbyname FROM main_users WHERE id = new.createdby;
						SET app2_name = NULL;
						SET app3_name = NULL;
						IF new.approver2 IS NOT NULL THEN 
						SELECT userfullname INTO app2_name FROM main_users WHERE id = new.approver2;
						END IF;
						
						IF new.approver3 IS NOT NULL THEN 
						SELECT userfullname INTO app3_name FROM main_users WHERE id = new.approver3;
						END IF;
						SELECT unitname INTO bunit_name FROM main_businessunits WHERE id = new.businessunit_id;
						SELECT deptname INTO dept_name FROM main_departments WHERE id = new.department_id;
						SELECT jobtitlename INTO job_name FROM main_jobtitles WHERE id = new.jobtitle;
						SELECT te.employemnt_status INTO empt_name FROM main_employmentstatus em 
					   INNER JOIN tbl_employmentstatus te ON te.id = em.workcodename WHERE em.id = new.emp_type;
						INSERT INTO main_requisition_summary 
						(req_id, requisition_code, onboard_date, position_id, position_name, reporting_id, reporting_manager_name,businessunit_id, businessunit_name, department_id, department_name, jobtitle, jobtitle_name,req_no_positions, selected_members, filled_positions, jobdescription, req_skills, req_qualification,req_exp_years,emp_type, emp_type_name, req_priority, additional_info, req_status, approver1, approver1_name,approver2, approver2_name, approver3, approver3_name, appstatus1, appstatus2, appstatus3,recruiters,client_id, isactive,createdby, modifiedby,createdon, modifiedon,createdby_name
						)
						VALUES
						(new.id, 
						 
						new.requisition_code, 
						new.onboard_date, 
						new.position_id, 
						pos_name, 
						new.reporting_id, 
						rep_name, 
						new.businessunit_id, 
						bunit_name, 
						new.department_id, 
						dept_name, 
						new.jobtitle, 
						job_name, 
						new.req_no_positions, 
						new.selected_members, 
						new.filled_positions, 
						new.jobdescription, 
						new.req_skills, 
						new.req_qualification, 
						new.req_exp_years, 
						new.emp_type, 
						empt_name, 
						new.req_priority, 
						new.additional_info, 
						new.req_status, 
						new.approver1, 
						app1_name, 
						new.approver2, 
						app2_name, 
						new.approver3, 
						app3_name, 
						new.appstatus1, 
						new.appstatus2, 
						new.appstatus3, 
						new.recruiters,
						new.client_id,
						new.isactive, 
						new.createdby, 
						new.modifiedby, 
						new.createdon, 
						new.modifiedon,createdbyname
						);
					END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_requisition_aft_upd` AFTER UPDATE ON `main_requisition` 
					FOR EACH ROW BEGIN
					DECLARE pos_name,rep_name,bunit_name,dept_name,job_name,empt_name,app1_name,app2_name,app3_name VARCHAR(200);
					SELECT positionname INTO pos_name FROM main_positions WHERE id = new.position_id;
					SELECT userfullname INTO rep_name FROM main_users WHERE id = new.reporting_id;
					SELECT userfullname INTO app1_name FROM main_users WHERE id = new.approver1;
					SET app2_name = NULL;
					SET app3_name = NULL;
					IF new.approver2 IS NOT NULL THEN 
						SELECT userfullname INTO app2_name FROM main_users WHERE id = new.approver2;
						END IF;
					
					IF new.approver3 IS NOT NULL THEN 
						SELECT userfullname INTO app3_name FROM main_users WHERE id = new.approver3;
						END IF;
					SELECT unitname INTO bunit_name FROM main_businessunits WHERE id = new.businessunit_id;
					SELECT deptname INTO dept_name FROM main_departments WHERE id = new.department_id;
					SELECT jobtitlename INTO job_name FROM main_jobtitles WHERE id = new.jobtitle;
					SELECT te.employemnt_status INTO empt_name FROM main_employmentstatus em 
					   INNER JOIN tbl_employmentstatus te ON te.id = em.workcodename WHERE em.id = new.emp_type;
					UPDATE main_requisition_summary SET
					 requisition_code = new.requisition_code,onboard_date = new.onboard_date, position_id = new.position_id, position_name = pos_name, 
					 reporting_id = new.reporting_id, reporting_manager_name = rep_name , 
					businessunit_id = new.businessunit_id, businessunit_name = bunit_name, 
					department_id = new.department_id, department_name = dept_name, 
					jobtitle = new.jobtitle, jobtitle_name = job_name,	req_no_positions = new.req_no_positions, 
					selected_members = new.selected_members, filled_positions = new.filled_positions, 
					jobdescription = new.jobdescription, req_skills = new.req_skills, req_qualification = new.req_qualification, 
					req_exp_years = new.req_exp_years, 	emp_type = new.emp_type, emp_type_name = empt_name, 
					req_priority = new.req_priority, additional_info = new.additional_info, req_status = new.req_status,
					 approver1 = new.approver1, approver1_name = app1_name,	approver2 = new.approver2, 
					 approver2_name = app2_name, approver3 = new.approver3, approver3_name = app3_name, 
					 appstatus1 = new.appstatus1, appstatus2 = new.appstatus2, appstatus3 = new.appstatus3,recruiters=new.recruiters,client_id=new.client_id, 
					 modifiedby = new.modifiedby, 	modifiedon = new.modifiedon,isactive = new.isactive WHERE req_id = new.id ;
					 
					END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_requisition_history`
--

DROP TABLE IF EXISTS `main_requisition_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_requisition_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requisition_id` int(20) DEFAULT NULL,
  `candidate_id` int(20) DEFAULT NULL,
  `candidate_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interview_id` int(20) DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_requisition_summary`
--

DROP TABLE IF EXISTS `main_requisition_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_requisition_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(11) DEFAULT NULL,
  `requisition_code` varchar(20) DEFAULT NULL,
  `onboard_date` date DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `position_name` varchar(200) DEFAULT NULL,
  `reporting_id` bigint(20) unsigned DEFAULT NULL,
  `reporting_manager_name` varchar(200) DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `businessunit_name` varchar(200) DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `department_name` varchar(200) DEFAULT NULL,
  `jobtitle` int(11) unsigned DEFAULT NULL,
  `jobtitle_name` varchar(200) DEFAULT NULL,
  `req_no_positions` int(11) unsigned DEFAULT NULL,
  `selected_members` int(11) unsigned DEFAULT '0' COMMENT 'count of selected members',
  `filled_positions` int(11) unsigned DEFAULT '0',
  `jobdescription` text,
  `req_skills` text NOT NULL,
  `req_qualification` varchar(150) DEFAULT NULL,
  `req_exp_years` varchar(10) NOT NULL,
  `emp_type` int(11) unsigned DEFAULT NULL,
  `emp_type_name` varchar(200) DEFAULT NULL,
  `req_priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1- High, 2- Medium,3- Low',
  `additional_info` text,
  `req_status` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `approver1` bigint(20) unsigned DEFAULT NULL,
  `approver1_name` varchar(200) DEFAULT NULL,
  `approver2` bigint(20) unsigned DEFAULT NULL,
  `approver2_name` varchar(200) DEFAULT NULL,
  `approver3` bigint(20) unsigned DEFAULT NULL,
  `approver3_name` varchar(200) DEFAULT NULL,
  `appstatus1` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus2` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus3` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `recruiters` varchar(150) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  `createdby_name` varchar(200) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un1` (`requisition_code`),
  KEY `NewIndex1` (`position_id`),
  KEY `reporting` (`reporting_id`),
  KEY `emptype` (`emp_type`),
  KEY `NewIndex2` (`req_id`),
  KEY `NewIndex3` (`businessunit_id`),
  KEY `NewIndex4` (`department_id`),
  KEY `NewIndex5` (`jobtitle`),
  KEY `NewIndex6` (`approver1`),
  KEY `NewIndex7` (`approver2`),
  KEY `NewIndex8` (`approver3`),
  KEY `NewIndex9` (`createdby`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_roles`
--

DROP TABLE IF EXISTS `main_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(100) NOT NULL,
  `roletype` varchar(100) DEFAULT NULL,
  `roledescription` varchar(100) DEFAULT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  `levelid` int(11) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_roles_aft_upd` AFTER UPDATE ON `main_roles` FOR EACH ROW BEGIN
				    if old.rolename != new.rolename then 
				    begin 
					update main_employees_summary set emprole_name = new.rolename,modifieddate = utc_timestamp() where isactive = 1 and emprole = new.id;
				    end;
				    end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_sd_configurations`
--

DROP TABLE IF EXISTS `main_sd_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_configurations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `businessunit_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `service_desk_flag` tinyint(1) DEFAULT '1' COMMENT '1=businessunitwise,0=departmentwise',
  `request_for` tinyint(1) DEFAULT '1' COMMENT '1=service request,2=asset request',
  `service_desk_id` bigint(20) DEFAULT NULL,
  `request_recievers` text,
  `cc_mail_recievers` text,
  `approver_1` bigint(20) unsigned DEFAULT NULL,
  `approver_2` bigint(20) unsigned DEFAULT NULL,
  `approver_3` bigint(20) unsigned DEFAULT NULL,
  `attachment` tinyint(1) DEFAULT '0' COMMENT '1=yes,0=no',
  `description` varchar(255) DEFAULT NULL,
  `sd_category` varchar(255) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_sd_depts`
--

DROP TABLE IF EXISTS `main_sd_depts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_depts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `service_desk_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_sd_depts_aft_upd` AFTER UPDATE ON `main_sd_depts` FOR EACH ROW BEGIN
					if old.service_desk_name != new.service_desk_name then 
        			begin 
           				update main_sd_requests_summary set service_desk_name = new.service_desk_name,modifieddate = utc_timestamp() where service_desk_id = new.id;
        			end;
        			end if;
    				END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_sd_reqtypes`
--

DROP TABLE IF EXISTS `main_sd_reqtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_reqtypes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `service_desk_id` bigint(20) DEFAULT NULL,
  `service_request_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` bigint(20) DEFAULT NULL,
  `modifiedby` bigint(20) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_sd_reqtypes_aft_upd` AFTER UPDATE ON `main_sd_reqtypes` FOR EACH ROW BEGIN
					if old.service_request_name != new.service_request_name then 
				        begin 
				           update main_sd_requests_summary set service_request_name = new.service_request_name,modifieddate = utc_timestamp() where service_request_id = new.id;
				        end;
				        end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_sd_requests`
--

DROP TABLE IF EXISTS `main_sd_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_for` tinyint(1) DEFAULT '1' COMMENT '1=service request, 2= asset request',
  `service_desk_id` bigint(20) unsigned DEFAULT NULL COMMENT 'if request_for is equal to 2 then dump id from asset table',
  `service_desk_conf_id` bigint(20) unsigned DEFAULT NULL,
  `service_request_id` bigint(20) unsigned DEFAULT NULL COMMENT 'If request_for is equal to 2 then dump category from asset table',
  `priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1=low,2=medium,3=high',
  `description` varchar(250) DEFAULT NULL,
  `attachment` text,
  `status` enum('Open','Cancelled','Management approved','Management rejected','To management approve','Manager approved','Closed','Rejected','Manager rejected','To manager approve') DEFAULT NULL,
  `raised_by` bigint(20) unsigned DEFAULT NULL,
  `ticket_number` varchar(20) DEFAULT NULL,
  `executor_id` bigint(20) unsigned DEFAULT NULL,
  `executor_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_id` bigint(20) unsigned DEFAULT NULL,
  `approver_status_1` enum('Approve','Reject','No answer') DEFAULT NULL,
  `approver_status_2` enum('Approve','Reject','No answer') DEFAULT NULL,
  `approver_status_3` enum('Approve','Reject','No answer') DEFAULT NULL,
  `reporting_manager_status` enum('Approve','Reject','No answer') DEFAULT NULL,
  `approver_1` bigint(20) unsigned DEFAULT NULL,
  `approver_2` bigint(20) unsigned DEFAULT NULL,
  `approver_3` bigint(20) unsigned DEFAULT NULL,
  `approver_1_comments` varchar(250) DEFAULT NULL,
  `approver_2_comments` varchar(250) DEFAULT NULL,
  `approver_3_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_comments` varchar(250) DEFAULT NULL,
  `to_mgmt_comments` varchar(250) DEFAULT NULL,
  `to_manager_comments` varchar(250) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1= active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_sd_request_aft_ins` AFTER INSERT ON `main_sd_requests` 
					FOR EACH ROW BEGIN
					DECLARE x_service_desk_name,x_service_request_name,x_raised_by_name,x_executor_name,
						x_reporting_manager_name,x_approver_1_name,x_approver_2_name,x_approver_3_name,raised_empid,raised_img
						VARCHAR(250);
					
					IF(new.request_for=1) THEN
					SELECT service_desk_name INTO x_service_desk_name FROM main_sd_depts WHERE id = new.service_desk_id;
					SELECT service_request_name INTO x_service_request_name FROM main_sd_reqtypes WHERE id = new.service_request_id;
					ELSE
					SELECT NAME INTO x_service_desk_name FROM assets WHERE id = new.service_desk_id;
					SELECT NAME INTO x_service_request_name FROM assets_categories WHERE id = new.service_request_id AND parent=0;
					END IF;
					SELECT userfullname,employeeId,profileimg INTO x_raised_by_name,raised_empid,raised_img FROM main_employees_summary WHERE user_id = new.raised_by;
					SELECT userfullname INTO x_executor_name FROM main_employees_summary WHERE user_id = new.executor_id;
					SELECT userfullname INTO x_reporting_manager_name FROM main_employees_summary WHERE user_id = new.reporting_manager_id;
					SELECT userfullname INTO x_approver_1_name FROM main_employees_summary WHERE user_id = new.approver_1;
					SELECT userfullname INTO x_approver_2_name FROM main_employees_summary WHERE user_id = new.approver_2;
					SELECT userfullname INTO x_approver_3_name FROM main_employees_summary WHERE user_id = new.approver_3;
					
					INSERT INTO main_sd_requests_summary (
					request_for,sd_requests_id, service_desk_id, service_desk_name, service_desk_conf_id, service_request_name, service_request_id,
					priority, description, attachment, STATUS, raised_by, raised_by_name, ticket_number, executor_id, executor_name, executor_comments,
					reporting_manager_id, reporting_manager_name, approver_status_1, approver_status_2, approver_status_3, reporting_manager_status,
					approver_1, approver_1_name, approver_2, approver_2_name, approver_3, approver_3_name, isactive, createdby, modifiedby,
					createddate, modifieddate,raised_by_empid,approver_1_comments,approver_2_comments,approver_3_comments,reporting_manager_comments,
					to_mgmt_comments,to_manager_comments
					)
					VALUES	(	
					new.request_for,new.id, new.service_desk_id, x_service_desk_name, new.service_desk_conf_id, x_service_request_name, new.service_request_id,
					new.priority, new.description, new.attachment, new.status, new.raised_by, x_raised_by_name, new.ticket_number, new.executor_id,
					x_executor_name, new.executor_comments,	new.reporting_manager_id, x_reporting_manager_name, new.approver_status_1,
					new.approver_status_2, new.approver_status_3, new.reporting_manager_status, new.approver_1, x_approver_1_name, new.approver_2,
					x_approver_2_name, new.approver_3, x_approver_3_name, new.isactive, new.createdby, new.modifiedby, new.createddate, new.modifieddate,
						raised_empid,new.approver_1_comments,new.approver_2_comments,new.approver_3_comments,new.reporting_manager_comments,
					new.to_mgmt_comments,new.to_manager_comments
					);
					INSERT INTO main_request_history(request_id,description,emp_id,emp_name,createdby,modifiedby,createddate,modifieddate,isactive,emp_profileimg)
					VALUE (new.id,CONCAT(CONCAT(UCASE(LEFT(x_service_desk_name, 1)), SUBSTRING(x_service_desk_name, 2)) ,' Request has been raised by '),new.raised_by,CONCAT(UCASE(LEFT(x_raised_by_name, 1)), SUBSTRING(x_raised_by_name, 2)),new.createdby,new.createdby,new.createddate,new.modifieddate,new.isactive,raised_img);
					END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_sd_request_aft_upd` AFTER UPDATE ON `main_sd_requests` 
					FOR EACH ROW BEGIN
					DECLARE x_service_desk_name,x_service_request_name,x_raised_by_name,x_executor_name,
						x_reporting_manager_name,x_approver_1_name,x_approver_2_name,x_approver_3_name
						VARCHAR(250);
					
					IF(new.request_for=1) THEN
					SELECT service_desk_name INTO x_service_desk_name FROM main_sd_depts WHERE id = new.service_desk_id;
					SELECT service_request_name INTO x_service_request_name FROM main_sd_reqtypes WHERE id = new.service_request_id;
					ELSE
					SELECT NAME INTO x_service_desk_name FROM assets WHERE id = new.service_desk_id;
					SELECT NAME INTO x_service_request_name FROM assets_categories WHERE id = new.service_request_id AND parent=0;
					END IF;
					SELECT userfullname INTO x_raised_by_name FROM main_employees_summary WHERE user_id = new.raised_by;
					SELECT userfullname INTO x_executor_name FROM main_employees_summary WHERE user_id = new.executor_id;
					SELECT userfullname INTO x_reporting_manager_name FROM main_employees_summary WHERE user_id = new.reporting_manager_id;
					SELECT userfullname INTO x_approver_1_name FROM main_employees_summary WHERE user_id = new.approver_1;
					SELECT userfullname INTO x_approver_2_name FROM main_employees_summary WHERE user_id = new.approver_2;
					SELECT userfullname INTO x_approver_3_name FROM main_employees_summary WHERE user_id = new.approver_3;
					
					UPDATE main_sd_requests_summary SET
					request_for=new.request_for,service_desk_id = new.service_desk_id, service_desk_name = x_service_desk_name, service_desk_conf_id = new.service_desk_conf_id,
					service_request_name = x_service_request_name, service_request_id = new.service_request_id, priority = new.priority,
					description = new.description, attachment = new.attachment, STATUS = new.status, raised_by = new.raised_by,
					raised_by_name = x_raised_by_name, ticket_number = new.ticket_number, executor_id = new.executor_id, executor_name = x_executor_name,
					executor_comments = new.executor_comments, reporting_manager_id = new.reporting_manager_id, reporting_manager_name = x_reporting_manager_name,
					approver_status_1 = new.approver_status_1, approver_status_2 = new.approver_status_2, approver_status_3 = new.approver_status_3,
					reporting_manager_status = new.reporting_manager_status, approver_1 = new.approver_1, approver_1_name = x_approver_1_name,
					approver_2 = new.approver_2, approver_2_name = x_approver_2_name, approver_3 = new.approver_3, approver_3_name = x_approver_3_name,
					isactive = new.isactive, createdby = new.createdby, modifiedby = new.modifiedby, createddate = new.createddate, modifieddate = new.modifieddate
					,approver_1_comments = new.approver_1_comments,approver_2_comments = new.approver_2_comments,approver_3_comments = new.approver_3_comments,reporting_manager_comments = new.reporting_manager_comments,
					to_mgmt_comments = new.to_mgmt_comments,to_manager_comments = new.to_manager_comments
					WHERE sd_requests_id = new.id;
					END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_sd_requests_summary`
--

DROP TABLE IF EXISTS `main_sd_requests_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_requests_summary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_for` tinyint(1) DEFAULT '1' COMMENT '1=service request,2=asset request',
  `sd_requests_id` bigint(20) DEFAULT NULL,
  `service_desk_id` bigint(20) unsigned DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset id from asset table',
  `service_desk_name` varchar(250) DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset name from asset table',
  `service_desk_conf_id` bigint(20) unsigned DEFAULT NULL,
  `service_request_name` varchar(250) DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset category from asset table',
  `service_request_id` bigint(20) unsigned DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset name from asset_categories table',
  `priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1=low,2=medium,3=high',
  `description` varchar(250) DEFAULT NULL,
  `attachment` text,
  `status` varchar(35) DEFAULT NULL,
  `raised_by` bigint(20) unsigned DEFAULT NULL,
  `raised_by_name` varchar(250) DEFAULT NULL,
  `raised_by_empid` varchar(20) DEFAULT NULL,
  `ticket_number` varchar(20) DEFAULT NULL,
  `executor_id` bigint(20) unsigned DEFAULT NULL,
  `executor_name` varchar(250) DEFAULT NULL,
  `executor_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_id` bigint(20) unsigned DEFAULT NULL,
  `reporting_manager_name` varchar(250) DEFAULT NULL,
  `approver_status_1` varchar(30) DEFAULT NULL,
  `approver_status_2` varchar(30) DEFAULT NULL,
  `approver_status_3` varchar(30) DEFAULT NULL,
  `reporting_manager_status` varchar(30) DEFAULT NULL,
  `approver_1` bigint(20) unsigned DEFAULT NULL,
  `approver_1_name` varchar(250) DEFAULT NULL,
  `approver_2` bigint(20) unsigned DEFAULT NULL,
  `approver_2_name` varchar(250) DEFAULT NULL,
  `approver_3` bigint(20) unsigned DEFAULT NULL,
  `approver_1_comments` varchar(250) DEFAULT NULL,
  `approver_2_comments` varchar(250) DEFAULT NULL,
  `approver_3_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_comments` varchar(250) DEFAULT NULL,
  `to_mgmt_comments` varchar(250) DEFAULT NULL,
  `to_manager_comments` varchar(250) DEFAULT NULL,
  `approver_3_name` varchar(250) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1= active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_settings`
--

DROP TABLE IF EXISTS `main_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menuid` varchar(100) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_userid_flag` (`userid`,`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_sitepreference`
--

DROP TABLE IF EXISTS `main_sitepreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sitepreference` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nationalityid` int(11) unsigned DEFAULT NULL,
  `dateformatid` int(11) unsigned DEFAULT NULL,
  `timeformatid` int(11) unsigned DEFAULT NULL,
  `timezoneid` int(11) unsigned DEFAULT NULL,
  `currencyid` int(11) unsigned DEFAULT NULL,
  `passwordid` int(11) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_states`
--

DROP TABLE IF EXISTS `main_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_states` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `countryid` int(11) unsigned DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `statecode` varchar(255) DEFAULT NULL,
  `state_id_org` int(10) unsigned DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`countryid`,`state_id_org`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_states_aft_upd` AFTER UPDATE ON `main_states` FOR EACH ROW BEGIN
					if old.state != new.state then 
					begin 
					   update main_interviewrounds_summary set interview_state_name = new.state,modified_date = utc_timestamp() where interview_state_id = new.state_id_org and isactive = 1;
					end;
					end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_timeformat`
--

DROP TABLE IF EXISTS `main_timeformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_timeformat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timeformat` varchar(60) NOT NULL,
  `mysql_timeformat` varchar(60) DEFAULT NULL,
  `js_timeformat` varchar(60) DEFAULT NULL,
  `example` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_timezone`
--

DROP TABLE IF EXISTS `main_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actual_id` int(11) unsigned DEFAULT NULL,
  `timezone` varchar(255) NOT NULL,
  `timezone_abbr` varchar(10) DEFAULT NULL,
  `offet_value` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_userloginlog`
--

DROP TABLE IF EXISTS `main_userloginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_userloginlog` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(11) unsigned DEFAULT NULL,
  `emprole` int(11) unsigned DEFAULT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  `employeeId` varchar(100) DEFAULT NULL,
  `emailaddress` varchar(200) DEFAULT NULL,
  `userfullname` varchar(100) DEFAULT NULL,
  `logindatetime` datetime DEFAULT NULL,
  `empipaddress` varchar(255) DEFAULT NULL,
  `profileimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_users`
--

DROP TABLE IF EXISTS `main_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emprole` int(11) unsigned DEFAULT NULL,
  `userstatus` enum('new','old') DEFAULT 'new',
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `userfullname` varchar(255) DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  `contactnumber` varchar(15) DEFAULT NULL,
  `empipaddress` varchar(255) DEFAULT NULL,
  `backgroundchk_status` enum('In process','Completed','Not Applicable','Yet to start','On hold') DEFAULT 'Yet to start',
  `emptemplock` tinyint(1) unsigned DEFAULT '0',
  `empreasonlocked` varchar(255) DEFAULT NULL,
  `emplockeddate` date DEFAULT NULL,
  `emppassword` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` smallint(6) unsigned DEFAULT '1' COMMENT '0=inactive,1-Active,2-resigned,3-left,4-suspended,5-deleted,',
  `employeeId` varchar(255) DEFAULT NULL,
  `modeofentry` varchar(255) DEFAULT NULL,
  `other_modeofentry` varchar(255) DEFAULT NULL,
  `entrycomments` varchar(255) DEFAULT NULL,
  `rccandidatename` int(11) unsigned DEFAULT NULL,
  `selecteddate` date DEFAULT NULL,
  `candidatereferredby` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `profileimg` varchar(255) DEFAULT NULL,
  `jobtitle_id` bigint(11) unsigned DEFAULT NULL,
  `tourflag` tinyint(1) unsigned DEFAULT '0' COMMENT '0=not seen,1=seen',
  `themes` enum('default','brown','gray','peacock','skyblue','green','orange') DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`employeeId`),
  KEY `IDX_4632B9B67F771501` (`emprole`),
  KEY `IDX_4632B9B6647385F4` (`rccandidatename`),
  KEY `IDX_4632B9B662E3F462` (`candidatereferredby`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_users_aft_upd` AFTER UPDATE ON `main_users` 
				    FOR EACH ROW BEGIN
				    declare groupid int(11);
				    
				    select group_id into groupid from main_roles where id = old.emprole;
				    if old.userfullname != new.userfullname then
				    begin 
				    
				    if (groupid != 5 or groupid is null) then 
				    begin
					#start of main_leaverequest_summary
				        update main_leaverequest_summary set rep_manager_name = new.userfullname,modifieddate = utc_timestamp() where rep_mang_id = new.id and isactive = 1;
				        update main_leaverequest_summary set user_name = new.userfullname,modifieddate = utc_timestamp() where user_id = new.id and isactive = 1; 
					#end of main_leaverequest_summary
					#start of main_requisition_summary
					update main_requisition_summary set reporting_manager_name = new.userfullname,modifiedon = utc_timestamp() where reporting_id = new.id and isactive = 1;
					update main_requisition_summary set approver1_name = new.userfullname,modifiedon = utc_timestamp() where approver1 = new.id and isactive = 1;
					update main_requisition_summary set approver2_name = new.userfullname,modifiedon = utc_timestamp() where approver2 = new.id and isactive = 1;
					update main_requisition_summary set approver3_name = new.userfullname,modifiedon = utc_timestamp() where approver3 = new.id and isactive = 1;
					update main_requisition_summary set createdby_name = new.userfullname,modifiedon = utc_timestamp() where createdby = new.id and isactive = 1;
					#end of main_requisition_summary
					#start of main_employees_summary
					update main_employees_summary set reporting_manager_name = new.userfullname,modifieddate = utc_timestamp() where reporting_manager = new.id and isactive = 1;
					update main_employees_summary set referer_name = new.userfullname,modifieddate = utc_timestamp() where candidatereferredby = new.id and isactive = 1;
					update main_employees_summary set createdby_name = new.userfullname,modifieddate = utc_timestamp() where createdby = new.id and isactive = 1;
				        update main_employees_summary set userfullname = new.userfullname,modifieddate = utc_timestamp() where user_id = new.id and isactive = 1;
					#end of main_employees_summary
					#start of main_bgchecks_summary
					update main_bgchecks_summary set specimen_name = new.userfullname,modifieddate = utc_timestamp() where specimen_id = new.id and specimen_flag = 1 and isactive = 1;
					update main_bgchecks_summary set createdname = new.userfullname,modifieddate = utc_timestamp() where createdby = new.id and isactive = 1;
					update main_bgchecks_summary set modifiedname = new.userfullname,modifieddate = utc_timestamp() where modifiedby = new.id and isactive = 1;
					#end of main_bgchecks_summary
					# start of main_interviewrounddetails_summary
					update main_interviewrounds_summary set interviewer_name = new.userfullname,modified_date = utc_timestamp() where interviewer_id = new.id and isactive = 1;
					update main_interviewrounds_summary set created_by_name = new.userfullname,modified_date = utc_timestamp() where created_by = new.id and isactive = 1;
					# end of main_interviewrounddetails_summary
					# start of main_userloginlog
					update main_userloginlog set userfullname = new.userfullname where userid = new.id;
					# end of main_userloginlog
					#start of main_sdrequests_summary
					update main_sd_requests_summary set raised_by_name = new.userfullname,modifieddate = utc_timestamp() where raised_by = new.id;
					update main_sd_requests_summary set executor_name = new.userfullname,modifieddate = utc_timestamp() where executor_id = new.id;
					update main_sd_requests_summary set reporting_manager_name = new.userfullname,modifieddate = utc_timestamp() where reporting_manager_id = new.id;
					update main_sd_requests_summary set approver_1_name = new.userfullname,modifieddate = utc_timestamp() where approver_1 = new.id;	
					update main_sd_requests_summary set approver_2_name = new.userfullname,modifieddate = utc_timestamp() where approver_2 = new.id;
					update main_sd_requests_summary set approver_3_name = new.userfullname,modifieddate = utc_timestamp() where approver_3 = new.id;
					# end of main_sdrequests_summary	
				    end;
				    end if;
				    end;
				    end if;#end of if of user full name
				    if old.employeeId != new.employeeId then 
				    begin 
				        if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set employeeId = new.employeeId,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if;#end of if of employeeId
				    if old.isactive != new.isactive then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set isactive = new.isactive,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if; #end of if of isactive
				    if old.profileimg != new.profileimg then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set profileimg = new.profileimg,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
					    #start of main_request_history
				            update main_request_history set emp_profileimg = new.profileimg,modifieddate = utc_timestamp() where emp_id = new.id; 
				            #end of main_request_history
				        end;
				        end if;
				    end;
				    end if; #end of if of isactive
				    if old.backgroundchk_status != new.backgroundchk_status then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set backgroundchk_status = new.backgroundchk_status,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if;#end of if of background check status
				if (old.contactnumber != new.contactnumber || new.contactnumber IS NOT NULL) then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set contactnumber = new.contactnumber,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if;#end of if of contact number
				    
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_vendors`
--

DROP TABLE IF EXISTS `main_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_vendors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL,
  `state` bigint(20) DEFAULT NULL,
  `city` bigint(20) DEFAULT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `primary_phone` varchar(15) DEFAULT NULL,
  `secondary_phone` varchar(15) DEFAULT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_veteranstatus`
--

DROP TABLE IF EXISTS `main_veteranstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_veteranstatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `veteranstatus` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_weekdays`
--

DROP TABLE IF EXISTS `main_weekdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_weekdays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `day_name` bigint(20) DEFAULT NULL,
  `dayshortcode` varchar(255) DEFAULT NULL,
  `daylongcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_weekdays_aftr_upd` AFTER UPDATE ON `main_weekdays` FOR EACH ROW BEGIN
			        declare weekend_name varchar(200);
			        select week_name into weekend_name from tbl_weeks where week_id = new.day_name;
			        UPDATE main_leavemanagement_summary lm SET lm.weekend_startdayname = weekend_name, lm.modifieddate = utc_timestamp() 
			        WHERE (lm.weekend_startday = new.day_name AND lm.isactive=1);
			        UPDATE main_leavemanagement_summary lm SET lm.weekend_enddayname = weekend_name, lm.modifieddate = utc_timestamp() 
			        WHERE (lm.weekend_endday = new.day_name AND lm.isactive=1);
			    	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `main_wizard`
--

DROP TABLE IF EXISTS `main_wizard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_wizard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `manage_modules` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `site_config` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `org_details` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `departments` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `servicerequest` tinyint(1) DEFAULT '1' COMMENT '1=No,2=Yes',
  `country` bigint(20) unsigned DEFAULT NULL,
  `state` bigint(20) unsigned DEFAULT NULL,
  `city` bigint(20) unsigned DEFAULT NULL,
  `iscomplete` tinyint(1) DEFAULT '1' COMMENT '0=later,1=No,2=Yes',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_workeligibilitydoctypes`
--

DROP TABLE IF EXISTS `main_workeligibilitydoctypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_workeligibilitydoctypes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `documenttype` varchar(255) DEFAULT NULL,
  `issuingauthority` tinyint(1) DEFAULT '1' COMMENT '1-country,2-state,3-city',
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `n` int(11) NOT NULL,
  PRIMARY KEY (`n`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_cities`
--

DROP TABLE IF EXISTS `tbl_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `state_id` bigint(20) unsigned NOT NULL,
  `city_name` varchar(30) NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tbl_cities_states` (`state_id`),
  CONSTRAINT `FK_tbl_cities_states` FOREIGN KEY (`state_id`) REFERENCES `tbl_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_countries`
--

DROP TABLE IF EXISTS `tbl_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL,
  `country_code` char(10) NOT NULL,
  `country_code2` char(2) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_employmentstatus`
--

DROP TABLE IF EXISTS `tbl_employmentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_employmentstatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employemnt_status` varchar(100) DEFAULT NULL,
  `createdby` int(20) unsigned DEFAULT NULL,
  `modifiedby` int(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_months`
--

DROP TABLE IF EXISTS `tbl_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_months` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `monthid` bigint(20) unsigned DEFAULT NULL,
  `month_name` varchar(50) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_password`
--

DROP TABLE IF EXISTS `tbl_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `passwordtype` varchar(255) DEFAULT NULL,
  `description` text,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_states`
--

DROP TABLE IF EXISTS `tbl_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `state_name` varchar(50) NOT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `map_point_x` int(3) DEFAULT NULL,
  `map_point_y` int(3) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tbl_states` (`country_id`),
  CONSTRAINT `FK_tbl_states_countries` FOREIGN KEY (`country_id`) REFERENCES `tbl_countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1413 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_timezones`
--

DROP TABLE IF EXISTS `tbl_timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_timezones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(200) CHARACTER SET latin1 NOT NULL,
  `timezone_abbr` varchar(10) DEFAULT NULL,
  `offset_value` varchar(100) NOT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_weeks`
--

DROP TABLE IF EXISTS `tbl_weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_weeks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `week_id` int(11) unsigned DEFAULT NULL,
  `week_name` varchar(255) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_clients`
--

DROP TABLE IF EXISTS `tm_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `poc` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `state_id` bigint(20) unsigned DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_client_country` (`country_id`),
  KEY `FK_client_state` (`state_id`),
  CONSTRAINT `FK_client_country` FOREIGN KEY (`country_id`) REFERENCES `tbl_countries` (`id`),
  CONSTRAINT `FK_client_state` FOREIGN KEY (`state_id`) REFERENCES `tbl_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_configuration`
--

DROP TABLE IF EXISTS `tm_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_configuration` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ts_weekly_reminder_day` enum('sun','mon','tue','wed','thu','fri','sat') NOT NULL,
  `ts_block_dates_range` varchar(100) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_cronjob_status`
--

DROP TABLE IF EXISTS `tm_cronjob_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_cronjob_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cronjob_status` enum('running','stopped') DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_emp_timesheets`
--

DROP TABLE IF EXISTS `tm_emp_timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_emp_timesheets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) unsigned NOT NULL,
  `project_task_id` bigint(20) unsigned DEFAULT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `ts_year` smallint(4) unsigned NOT NULL,
  `ts_month` tinyint(2) unsigned DEFAULT NULL,
  `ts_week` tinyint(1) unsigned DEFAULT NULL,
  `cal_week` tinyint(4) DEFAULT NULL,
  `sun_date` date DEFAULT NULL,
  `sun_duration` varchar(6) DEFAULT NULL,
  `mon_date` date DEFAULT NULL,
  `mon_duration` varchar(6) DEFAULT NULL,
  `tue_date` date DEFAULT NULL,
  `tue_duration` varchar(6) DEFAULT NULL,
  `wed_date` date DEFAULT NULL,
  `wed_duration` varchar(6) DEFAULT NULL,
  `thu_date` date DEFAULT NULL,
  `thu_duration` varchar(6) DEFAULT NULL,
  `fri_date` date DEFAULT NULL,
  `fri_duration` varchar(6) DEFAULT NULL,
  `sat_date` date DEFAULT NULL,
  `sat_duration` varchar(6) DEFAULT NULL,
  `week_duration` varchar(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_emp_task_time` (`emp_id`,`project_task_id`,`ts_year`,`ts_month`,`ts_week`,`cal_week`),
  KEY `FK_tm_emp_timesheets_proj_task` (`project_task_id`),
  KEY `FK_tm_emp_timesheets_project` (`project_id`),
  CONSTRAINT `FK_tm_emp_timesheets_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_emp_timesheets_proj_task` FOREIGN KEY (`project_task_id`) REFERENCES `tm_project_tasks` (`id`),
  CONSTRAINT `FK_tm_emp_timesheets_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_emp_ts_notes`
--

DROP TABLE IF EXISTS `tm_emp_ts_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_emp_ts_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) unsigned NOT NULL,
  `ts_year` smallint(4) NOT NULL,
  `ts_month` tinyint(2) DEFAULT NULL,
  `ts_week` tinyint(1) DEFAULT NULL,
  `cal_week` tinyint(4) DEFAULT NULL,
  `sun_date` date DEFAULT NULL,
  `sun_note` varchar(200) DEFAULT NULL,
  `sun_reject_note` varchar(200) DEFAULT NULL,
  `mon_date` date DEFAULT NULL,
  `mon_note` varchar(200) DEFAULT NULL,
  `mon_reject_note` varchar(200) DEFAULT NULL,
  `tue_date` date DEFAULT NULL,
  `tue_note` varchar(200) DEFAULT NULL,
  `tue_reject_note` varchar(200) DEFAULT NULL,
  `wed_date` date DEFAULT NULL,
  `wed_note` varchar(200) DEFAULT NULL,
  `wed_reject_note` varchar(200) DEFAULT NULL,
  `thu_date` date DEFAULT NULL,
  `thu_note` varchar(200) DEFAULT NULL,
  `thu_reject_note` varchar(200) DEFAULT NULL,
  `fri_date` date DEFAULT NULL,
  `fri_note` varchar(200) DEFAULT NULL,
  `fri_reject_note` varchar(200) DEFAULT NULL,
  `sat_date` date DEFAULT NULL,
  `sat_note` varchar(200) DEFAULT NULL,
  `sat_reject_note` varchar(200) DEFAULT NULL,
  `week_note` varchar(200) DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_emp_ts_notes` (`emp_id`,`ts_year`,`ts_month`,`ts_week`,`cal_week`),
  CONSTRAINT `FK_tm_emp_ts_notes_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_mailing_list`
--

DROP TABLE IF EXISTS `tm_mailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_mailing_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) unsigned DEFAULT NULL,
  `emp_full_name` varchar(150) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mail_type` enum('submit_pending','reminder','block') DEFAULT NULL,
  `ts_dates` text,
  `ts_start_date` date DEFAULT NULL,
  `ts_end_date` date DEFAULT NULL,
  `mail_content` text,
  `is_mail_sent` tinyint(1) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_mailing_list_employee` (`emp_id`),
  CONSTRAINT `FK_tm_mailing_list_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_process_updates`
--

DROP TABLE IF EXISTS `tm_process_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_process_updates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) unsigned NOT NULL,
  `ts_dates` text NOT NULL,
  `action_type` enum('edited','rejected','approved','enabled') NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `alert` enum('open','closed') DEFAULT NULL,
  `action_by` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_process_updates_employee` (`emp_id`),
  CONSTRAINT `FK_tm_process_updates_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_project_employees`
--

DROP TABLE IF EXISTS `tm_project_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_project_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `emp_id` int(10) unsigned NOT NULL,
  `cost_rate` decimal(8,2) unsigned DEFAULT NULL,
  `billable_rate` decimal(7,2) unsigned DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_project_employees_project` (`project_id`),
  KEY `FK_tm_project_employees_employee` (`emp_id`),
  CONSTRAINT `FK_tm_project_employees_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_project_employees_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_project_task_employees`
--

DROP TABLE IF EXISTS `tm_project_task_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_project_task_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `project_task_id` bigint(20) unsigned NOT NULL,
  `emp_id` int(10) unsigned NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_project_task_employees_project` (`project_id`),
  KEY `FK_tm_project_task_employees_task` (`task_id`),
  KEY `FK_tm_project_task_employees_proj_task` (`project_task_id`),
  KEY `FK_tm_project_task_employees_employee` (`emp_id`),
  CONSTRAINT `FK_tm_project_task_employees_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_project_task_employees_proj_task` FOREIGN KEY (`project_task_id`) REFERENCES `tm_project_tasks` (`id`),
  CONSTRAINT `FK_tm_project_task_employees_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`),
  CONSTRAINT `FK_tm_project_task_employees_task` FOREIGN KEY (`task_id`) REFERENCES `tm_tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_project_tasks`
--

DROP TABLE IF EXISTS `tm_project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_project_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `estimated_hrs` mediumint(5) unsigned DEFAULT NULL,
  `is_billable` tinyint(1) DEFAULT '0',
  `billable_rate` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tm_project_tasks_project` (`project_id`),
  KEY `FK_tm_project_tasks_task` (`task_id`),
  CONSTRAINT `FK_tm_project_tasks_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`),
  CONSTRAINT `FK_tm_project_tasks_task` FOREIGN KEY (`task_id`) REFERENCES `tm_tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

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

--
-- Table structure for table `tm_tasks`
--

DROP TABLE IF EXISTS `tm_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task` varchar(200) NOT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tm_ts_status`
--

DROP TABLE IF EXISTS `tm_ts_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_ts_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `ts_year` smallint(4) unsigned NOT NULL,
  `ts_month` tinyint(2) unsigned DEFAULT NULL,
  `ts_week` tinyint(1) unsigned DEFAULT NULL,
  `cal_week` tinyint(2) DEFAULT NULL,
  `sun_date` date DEFAULT NULL,
  `sun_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sun_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sun_status_date` timestamp NULL DEFAULT NULL,
  `sun_reject_note` varchar(200) DEFAULT NULL,
  `mon_date` date DEFAULT NULL,
  `mon_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `mon_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `mon_status_date` timestamp NULL DEFAULT NULL,
  `mon_reject_note` varchar(200) DEFAULT NULL,
  `tue_date` date DEFAULT NULL,
  `tue_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `tue_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `tue_status_date` timestamp NULL DEFAULT NULL,
  `tue_reject_note` varchar(200) DEFAULT NULL,
  `wed_date` date DEFAULT NULL,
  `wed_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `wed_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `wed_status_date` timestamp NULL DEFAULT NULL,
  `wed_reject_note` varchar(200) DEFAULT NULL,
  `thu_date` date DEFAULT NULL,
  `thu_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `thu_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `thu_status_date` timestamp NULL DEFAULT NULL,
  `thu_reject_note` varchar(200) DEFAULT NULL,
  `fri_date` date DEFAULT NULL,
  `fri_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `fri_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `fri_status_date` timestamp NULL DEFAULT NULL,
  `fri_reject_note` varchar(200) DEFAULT NULL,
  `sat_date` date DEFAULT NULL,
  `sat_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sat_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sat_status_date` timestamp NULL DEFAULT NULL,
  `sat_reject_note` varchar(200) DEFAULT NULL,
  `week_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_emp_ts_project_status` (`emp_id`,`project_id`,`ts_year`,`ts_month`,`ts_week`,`cal_week`),
  KEY `FK_tm_ts_status_project` (`project_id`),
  CONSTRAINT `FK_tm_ts_status_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_ts_status_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
