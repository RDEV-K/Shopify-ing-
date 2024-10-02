-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 04:44 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs7331329`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `department_id` int(11) NOT NULL,
  `pages` longtext NOT NULL,
  `pages_title` longtext DEFAULT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`department_id`, `pages`, `pages_title`, `department`) VALUES
(1, '[\"News\",\"Meetings\",\"Tasks\",\"Policies\",\"Processes\"]', '[\"\",\"\",\"\",\"\",\"\",\"\"]', 'Dashboard'),
(3, '[\"R&D Plan\",\"Formulas\",\"Test Production\",\"Test Log\",\"Media\",\"Production Compliance\"]', '[\"PR1-1\",\"PR1-2\",\"PR1-3\",\"PR1-4\",\"PR1-5\",\"PR1-6\"]', 'R&D'),
(4, '[\"Inventory\",\"Deliveries\",\"Suppliers\",\"Ingredients\",\"Ingredient Batches\",\"Equipment\",\"Packaging\",\"Production\",\"Batch Certificates\",\"Batch Testing\"]', '[\"PR2-1\",\"PR2-2\",\"PR2-3\",\"PR2-4\",\"PR2-5\",\"PR2-6\",\"PR2-7\",\"PR2-8\",\"PR2-9\",\"PR2-10\"]', 'Manufacturing'),
(5, '[\"Marketing\",\"Sales\",\"Purchases\"]', '[\"PR3-1\",\"PR3-2\"]', 'Sales'),
(6, '[\"Budgets\",\"GDPR\",\"Staff\",\"Purchases\",\"Models\"]', '[\"PR4-1\",\"PR4-2\",\"PR4-3\",\"PR4-4\",\"PR4-5\"]', 'Corporate');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_auth`
--

CREATE TABLE `tbl_staff_auth` (
  `id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `buttons` longtext NOT NULL,
  `pages` longtext NOT NULL,
  `staff_roles` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_staff_auth`
--

INSERT INTO `tbl_staff_auth` (`id`, `department`, `buttons`, `pages`, `staff_roles`) VALUES
(1, 1, '[[\"Edit\",\"Delete\",\"Add\",\"View\"],[\"View\",\"Add\",\"Delete\",\"Edit\"],[\"View\",\"Add\",\"Delete\",\"Edit\"],[\"Edit\",\"Delete\",\"View\",\"Add\"],[\"View\",\"Add\",\"Delete\",\"Edit\"]]', '[\"News\",\"Meetings\",\"Tasks\",\"Policies\",\"Processes\"]', '[[\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5,6,7,8,9,10\"],[\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\"],[\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"]]'),
(4, 4, '[[\"View\",\"Edit\",\"Add\",\"Delete\"],[\"View\",\"Delete\",\"Add\",\"Edit\"],[\"View\",\"Edit\",\"Add\",\"Delete\"],[\"Delete\",\"Add\",\"Edit\",\"View\"],[\"Delete\",\"Edit\",\"View\"],[\"View\",\"Add\",\"Delete\",\"Edit\"],[\"View\",\"Add\",\"Delete\",\"Edit\"],[\"View\",\"Delete\",\"Add\",\"Edit\"],[\"Delete\",\"Add\",\"Edit\",\"View\"],[\"View\"]]', '[\"Inventory\",\"Deliveries\",\"Suppliers\",\"Ingredients\",\"Ingredient Batches\",\"Equipment\",\"Packaging\",\"Production\",\"Batch Testing\",\"Batch Certificates\"]', '[[\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\",\"1,3,4,5,6\",\"1,3,4,5\"],[\"1,3,4,5,9\",\"1,3,4,5\",\"1,3,4,5,6\",\"1,3,4,5,6\"],[\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,3,4,5\",\"1,3,4,5,6,8\",\"1,3,4,5,6,8\",\"1,3,4,5,6,8\"],[\"1,3,4,5\",\"1,3,4,5,6\",\"1,3,4,5,6\"],[\"1,3,4,5,6,9\",\"1,3,4,5,6\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,3,4,5,6,7,9\",\"1,3,4,5,6\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,3,4,5,6\",\"1,5\",\"1,5,6\",\"1,5,6\"],[\"1,3,4,5\",\"1,3,4,5,6\",\"1,3,4,5,6\",\"1,3,4,5,6\"],[\"1,3,4,5\"]]'),
(5, 3, '[[\"View\",\"Add\",\"Delete\",\"Edit\"],[\"Delete\",\"Add\",\"Edit\",\"View\"],[\"Delete\",\"Add\",\"Edit\",\"View\"],[\"View\",\"Delete\",\"Add\",\"Edit\"],[\"View\",\"Add\",\"Edit\",\"Delete\"],[\"View\",\"Delete\",\"Add\",\"Edit\"]]', '[\"R&D Plan\",\"Formulas\",\"Test Production\",\"Test Log\",\"Media\",\"Production Compliance\"]', '[[\"1,3,4,5,6,7,8,9,10\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,4,5\",\"1,4,5,8\",\"1,4,5,8\",\"1,4,5,8\"],[\"1,4,5\",\"1,4,5,6\",\"1,4,5,6\",\"1,4,5,6\"],[\"1,3,4,5,6\",\"1,4,5\",\"1,4,5,6\",\"1,4,5,6\"],[\"1,3,4,5,10\",\"1,4,5,10\",\"1,4,5,10\",\"1,5\"],[\"1,3,4,5\",\"1,5\",\"1,4,5\",\"1,4,5\"]]'),
(6, 5, '[[\"Add\",\"Delete\",\"View\"],[\"Add\",\"Delete\",\"Edit\",\"View\"]]', '[\"Sales\",\"Marketing\"]', '[[\"5\",\"5\",\"5\"],[\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"]]'),
(7, 6, '[[\"Edit\",\"Add\",\"Delete\",\"View\"],[\"Add\",\"Delete\",\"Edit\",\"View\"],[\"Add\",\"Delete\",\"Edit\",\"View\"],[\"Delete\",\"Add\",\"Edit\",\"View\"],[\"View\",\"Delete\",\"Edit\",\"Add\"]]', '[\"Budgets\",\"GDPR\",\"Staff\",\"Purchases\",\"Models\"]', '[[\"1\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5,6,7,8,9,10\"],[\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5,6,7,8,9,10\"],[\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\",\"1,3,4,5\"],[\"1,3,4,5\",\"1,3,4,5,6,9,10\",\"1,3,4,5,6,9,10\",\"1,3,4,5,6,9,10\"],[\"1,3,4,5\",\"1,3,5\",\"1,3,4,5\",\"1\"]]');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_role`
--

CREATE TABLE `tbl_staff_role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_staff_role`
--

INSERT INTO `tbl_staff_role` (`id`, `role`) VALUES
(1, 'Developer'),
(3, 'Director'),
(4, 'Administrator'),
(5, 'MD'),
(6, 'Batcher'),
(7, 'Designer'),
(8, 'Formulator'),
(9, 'Accountant'),
(10, 'Marketing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tbl_staff_auth`
--
ALTER TABLE `tbl_staff_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_staff_role`
--
ALTER TABLE `tbl_staff_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_staff_auth`
--
ALTER TABLE `tbl_staff_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_staff_role`
--
ALTER TABLE `tbl_staff_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
