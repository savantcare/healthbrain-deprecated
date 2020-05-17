-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 17, 2020 at 12:50 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1-log
-- PHP Version: 7.4.3

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
  `id` int(11) NOT NULL,
  `reminderID` varchar(255) DEFAULT NULL,
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

INSERT INTO `reminders` (`id`, `reminderID`, `description`, `discontinue`, `patientId`, `createdByUserId`, `discontinuedByUserId`, `createdAt`, `updatedAt`, `discontinueAt`) VALUES
(1, '1ka5wjeh4', 'r1', 1, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 06:40:29', '2020-05-16 06:40:29'),
(2, '1ka5wjflf', 'r2', 1, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 07:21:59', '2020-05-16 07:21:59'),
(3, '1ka5wjgn9', 'r3', 1, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 06:40:38', '2020-05-16 06:40:38'),
(4, '1ka9b2pmt', 'r10', NULL, '1', NULL, NULL, '2020-05-16 00:00:00', '2020-05-16 07:25:05', NULL),
(5, '406z02uka99he9j', 'r2', NULL, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 06:40:29', NULL),
(6, '406z02uka99hllh', 'r4', 1, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 08:35:01', '2020-05-16 08:35:01'),
(7, '406z02uka9crgct', 'r5', NULL, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 08:12:17', NULL),
(8, '406z02uka9dkoxp', 'r500', NULL, '1', NULL, NULL, '2020-05-13 16:00:00', '2020-05-16 08:35:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);
COMMIT;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
