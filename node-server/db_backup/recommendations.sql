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
-- Database: `sc_recommendation`
--

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL,
  `recommendationID` varchar(255) DEFAULT NULL,
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
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`id`, `recommendationID`, `description`, `discontinue`, `patientId`, `createdByUserId`, `discontinuedByUserId`, `createdAt`, `updatedAt`, `discontinueAt`) VALUES
(1, '1ka5wgja4', 'recommendation 1', NULL, '1', '1', NULL, '2020-05-13 16:00:00', '2020-05-13 22:12:37', NULL),
(2, '1ka5wgnfz', 'recommendation 2', NULL, '1', '1', NULL, '2020-05-01 16:00:00', '2020-05-13 22:12:41', NULL),
(3, '1ka5wgr4r', 'r3', NULL, '1', '1', NULL, '2020-05-05 16:00:00', '2020-05-13 22:12:47', NULL),
(4, '1ka5wgsql', 'r4', NULL, '1', '1', NULL, '2020-04-10 16:00:00', '2020-05-13 22:12:48', NULL),
(5, '1ka5wgtvb', 'r5', NULL, '1', '1', NULL, '2020-04-15 16:00:00', '2020-05-13 22:12:50', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
