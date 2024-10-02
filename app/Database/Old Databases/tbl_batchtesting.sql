-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2022 at 08:35 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

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
-- Table structure for table `tbl_batchtesting`
--

CREATE TABLE `tbl_batchtesting` (
  `batchtest_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `test_date` varchar(255) NOT NULL,
  `test_type` varchar(255) NOT NULL,
  `test_result` varchar(255) NOT NULL,
  `test_user` int(11) NOT NULL,
  `test_comments` longtext NOT NULL,
  `invoice_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_batchtesting`
--

INSERT INTO `tbl_batchtesting` (`batchtest_id`, `batch_id`, `test_date`, `test_type`, `test_result`, `test_user`, `test_comments`, `invoice_file`) VALUES
(3, 4, '2022-10-16', 'PH', 'In Progress', 12, 'Testing this', '1665945337_f5d7eaba65a32f90eb87.pdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_batchtesting`
--
ALTER TABLE `tbl_batchtesting`
  ADD PRIMARY KEY (`batchtest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_batchtesting`
--
ALTER TABLE `tbl_batchtesting`
  MODIFY `batchtest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
