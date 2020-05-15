-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2020 at 07:45 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sc_reminder`
--

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discontinue` tinyint(1) DEFAULT NULL,
  `patientId` decimal(10,0) DEFAULT NULL,
  `createdByUserId` decimal(10,0) DEFAULT NULL,
  `discontinuedByUserId` decimal(10,0) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `discontinueAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `description`, `discontinue`, `patientId`, `createdByUserId`, `discontinuedByUserId`, `createdAt`, `updatedAt`, `discontinueAt`) VALUES
('1ka5wjeh4', 'r1', NULL, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-13 22:14:51', NULL),
('1ka5wjflf', 'r2', NULL, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-13 22:14:51', NULL),
('1ka5wjgn9', 'r3', NULL, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-13 22:14:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
