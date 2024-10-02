-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 09:34 PM
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
-- Table structure for table `tbl_gdpr`
--

CREATE TABLE `tbl_gdpr` (
  `gdpr_id` int(11) NOT NULL,
  `gdpr_department` varchar(250) NOT NULL,
  `gdpr_purpose` varchar(250) NOT NULL,
  `gdpr_individuals` varchar(250) NOT NULL,
  `gdpr_data` varchar(250) NOT NULL,
  `gdpr_recipient` varchar(250) NOT NULL,
  `gdpr_recipient_secure` varchar(250) NOT NULL,
  `gdpr_source` varchar(250) NOT NULL,
  `gdpr_location` varchar(250) NOT NULL,
  `gdpr_legal` varchar(250) NOT NULL,
  `gdpr_retention` varchar(250) NOT NULL,
  `gdpr_storage` varchar(250) NOT NULL,
  `gdpr_rights` varchar(250) NOT NULL,
  `gdpr_consent` varchar(250) NOT NULL,
  `gdpr_breach` varchar(250) NOT NULL,
  `gdpr_breach_link` varchar(250) NOT NULL,
  `gdpr_rp` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_gdpr`
--

INSERT INTO `tbl_gdpr` (`gdpr_id`, `gdpr_department`, `gdpr_purpose`, `gdpr_individuals`, `gdpr_data`, `gdpr_recipient`, `gdpr_recipient_secure`, `gdpr_source`, `gdpr_location`, `gdpr_legal`, `gdpr_retention`, `gdpr_storage`, `gdpr_rights`, `gdpr_consent`, `gdpr_breach`, `gdpr_breach_link`, `gdpr_rp`) VALUES
(2, 'Manufacturing', 'Test', 'Test', 'Name', 'Test', 'Test', 'Individual', 'Test', '(a) Consent', '24 Months', 'Test', 'Multiple Choice...', 'Test', 'No', 'test', '12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_gdpr`
--
ALTER TABLE `tbl_gdpr`
  ADD PRIMARY KEY (`gdpr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_gdpr`
--
ALTER TABLE `tbl_gdpr`
  MODIFY `gdpr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
