-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2024 at 10:03 AM
-- Server version: 10.11.6-MariaDB-0+deb12u1
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketsystem`
--
CREATE DATABASE IF NOT EXISTS `ticketsystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ticketsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `summary` text NOT NULL,
  `priority` varchar(255) NOT NULL DEFAULT 'LOW',
  `status` varchar(255) NOT NULL DEFAULT 'CREATED',
  `create_date` timestamp NULL DEFAULT current_timestamp(),
  `update_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `summary`, `priority`, `status`, `create_date`, `update_date`) VALUES
(1, 'Fix login bug on mobile app', 'HIGH', 'COMPLETED', '2024-10-01 11:00:00', '2024-11-05 14:23:00'),
(2, 'Update user profile page design', 'MEDIUM', 'REJECTED', '2024-10-02 07:15:00', '2024-11-05 14:23:00'),
(3, 'Implement new payment gateway', 'HIGH', 'COMPLETED', '2024-10-03 08:20:00', '2024-11-05 14:23:00'),
(4, 'Optimize database queries', 'LOW', 'COMPLETED', '2024-10-04 10:30:00', '2024-11-01 10:00:00'),
(5, 'Create API documentation', 'MEDIUM', 'IN_PROGRESS', '2024-10-05 13:50:00', '2024-11-05 14:23:00'),
(6, 'Fix CSS issues on dashboard', 'LOW', 'CREATED', '2024-10-06 15:05:00', '2024-11-05 14:23:00'),
(7, 'Develop new feature for user reports', 'HIGH', 'CREATED', '2024-10-07 09:10:00', '2024-11-05 14:23:00'),
(8, 'Conduct code review for latest release', 'MEDIUM', 'COMPLETED', '2024-10-08 16:25:00', '2024-10-30 09:45:00'),
(9, 'Implement user authentication improvements', 'HIGH', 'IN_PROGRESS', '2024-10-09 11:00:00', '2024-11-05 14:23:00'),
(10, 'Test performance of new features', 'MEDIUM', 'CREATED', '2024-10-10 14:15:00', '2024-11-05 14:23:00'),
(11, 'Fix pagination bug on search results', 'LOW', 'COMPLETED', '2024-10-11 08:30:00', '2024-10-28 14:05:00'),
(12, 'Update server configuration', 'HIGH', 'IN_PROGRESS', '2024-10-12 10:45:00', '2024-11-05 14:23:00'),
(13, 'Refactor old codebase', 'MEDIUM', 'CREATED', '2024-10-13 13:00:00', '2024-11-05 14:23:00'),
(14, 'Implement localization support', 'HIGH', 'IN_PROGRESS', '2024-10-14 15:20:00', '2024-11-05 14:23:00'),
(15, 'Fix alignment issues on homepage', 'LOW', 'COMPLETED', '2024-10-15 07:35:00', '2024-10-29 11:55:00'),
(16, 'Add new filters to search functionality', 'MEDIUM', 'CREATED', '2024-10-16 09:50:00', '2024-11-05 14:23:00'),
(17, 'Update test cases for new release', 'HIGH', 'IN_PROGRESS', '2024-10-17 12:05:00', '2024-11-05 14:23:00'),
(18, 'Fix memory leak in background process', 'MEDIUM', 'CREATED', '2024-10-18 14:20:00', '2024-11-05 14:23:00'),
(19, 'Improve load time of dashboard', 'HIGH', 'IN_PROGRESS', '2024-10-19 08:35:00', '2024-11-05 14:23:00'),
(20, 'Create script for database backup', 'LOW', 'COMPLETED', '2024-10-20 11:50:00', '2024-11-02 10:15:00'),
(21, 'Update user notifications system', 'MEDIUM', 'IN_PROGRESS', '2024-10-21 13:05:00', '2024-11-05 14:23:00'),
(22, 'Implement caching strategy', 'HIGH', 'CREATED', '2024-10-22 15:20:00', '2024-11-05 14:23:00'),
(23, 'Fix date formatting issues', 'LOW', 'COMPLETED', '2024-10-23 07:35:00', '2024-10-31 09:45:00'),
(24, 'Enhance security measures', 'HIGH', 'IN_PROGRESS', '2024-10-24 09:50:00', '2024-11-05 14:23:00'),
(25, 'Develop admin dashboard features', 'MEDIUM', 'CREATED', '2024-10-25 12:05:00', '2024-11-05 14:23:00'),
(26, 'Fix session management issues', 'HIGH', 'CREATED', '2024-10-26 14:20:00', '2024-11-05 14:23:00'),
(28, 'Update front-end libraries', 'MEDIUM', 'IN_PROGRESS', '2024-10-28 11:50:00', '2024-11-05 14:23:00'),
(29, 'Fix image upload bug', 'HIGH', 'CREATED', '2024-10-29 14:05:00', '2024-11-05 14:23:00'),
(30, 'Implement multi-language support', 'LOW', 'COMPLETED', '2024-10-30 16:20:00', '2024-11-01 15:00:00'),
(31, 'Update API endpoints for new features', 'HIGH', 'IN_PROGRESS', '2024-10-31 08:35:00', '2024-11-05 14:23:00'),
(32, 'Fix broken links on site', 'MEDIUM', 'CREATED', '2024-11-01 10:50:00', '2024-11-05 14:23:00'),
(33, 'Enhance form validation', 'HIGH', 'IN_PROGRESS', '2024-11-02 13:05:00', '2024-11-05 14:23:00'),
(34, 'Improve search engine optimization', 'LOW', 'COMPLETED', '2024-11-03 15:20:00', '2024-11-04 09:00:00'),
(35, 'Fix accessibility issues', 'MEDIUM', 'IN_PROGRESS', '2024-11-04 09:35:00', '2024-11-05 14:23:00'),
(36, 'Develop reporting module', 'HIGH', 'CREATED', '2024-11-05 12:50:00', '2024-11-05 14:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `update_messages`
--

CREATE TABLE `update_messages` (
  `ticket_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `update_messages`
--

INSERT INTO `update_messages` (`ticket_id`, `username`, `date`, `messages`) VALUES
(1, 'josh', '2024-12-09 12:01:34', 'asasaasa'),
(1, 'josh', '2024-12-09 12:01:48', 'Another comment '),
(1, 'josh', '2024-12-09 12:02:16', 'as'),
(1, 'josh', '2024-12-09 12:17:53', 'fgfgfgfgfgfgfg'),
(1, 'josh', '2024-12-09 12:18:40', 'asasas'),
(4, 'josh', '2024-12-16 14:31:54', 'This is my comment');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
