-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2022 at 05:17 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

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
-- Table structure for table `tbl_corporate_formula`
--

CREATE TABLE `tbl_corporate_formula` (
  `corporate_formula_id` int(11) NOT NULL,
  `batch_qty` float NOT NULL,
  `unit_qty` float NOT NULL,
  `formula_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formula_id`)),
  `models_id` int(11) NOT NULL,
  `created_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_formula`
--

INSERT INTO `tbl_corporate_formula` (`corporate_formula_id`, `batch_qty`, `unit_qty`, `formula_id`, `models_id`, `created_at`) VALUES
(1, 300, 0.9, '[\"1\",\"3\"]', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  ADD PRIMARY KEY (`corporate_formula_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  MODIFY `corporate_formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
