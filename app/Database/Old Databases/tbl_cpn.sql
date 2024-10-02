-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2022 at 08:47 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
-- Table structure for table `tbl_cpn`
--

CREATE TABLE `tbl_cpn` (
  `cpn_id` int(11) NOT NULL,
  `cpn_date` varchar(255) NOT NULL,
  `cpn_formula` int(11) NOT NULL,
  `cpn_rp` varchar(255) NOT NULL,
  `cpn_reporta` varchar(255) NOT NULL,
  `cpn_reportb` varchar(255) NOT NULL,
  `cpn_stability` varchar(255) NOT NULL,
  `cpn_challenge` varchar(255) NOT NULL,
  `cpn_pif` varchar(255) NOT NULL,
  `cpn_status` varchar(255) NOT NULL,
  `cpn_user` int(11) NOT NULL,
  `invoice_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cpn`
--

INSERT INTO `tbl_cpn` (`cpn_id`, `cpn_date`, `cpn_formula`, `cpn_rp`, `cpn_reporta`, `cpn_reportb`, `cpn_stability`, `cpn_challenge`, `cpn_pif`, `cpn_status`, `cpn_user`, `invoice_file`) VALUES
(1, '2022-10-05', 1, '12', 'In Progress', 'In Progress', 'Passed', 'In Progress', 'In Progress', 'New', 12, '1664995569_7a05c4592b39aecff032.pdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  ADD PRIMARY KEY (`cpn_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
