-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 12:17 PM
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
-- Table structure for table `tbl_models_manufacturing`
--

CREATE TABLE `tbl_models_manufacturing` (
  `models_id` int(11) NOT NULL,
  `model_manufacturing_productionfee` int(11) NOT NULL,
  `model_manufacturing_deliveryfee` int(11) NOT NULL,
  `model_manufacturing_bottlingfee` int(11) NOT NULL,
  `models_igtp` int(11) NOT NULL,
  `models_pktp` int(11) NOT NULL,
  `models_pdtp` int(11) NOT NULL,
  `models_igkp` int(11) NOT NULL,
  `models_pkkp` int(11) NOT NULL,
  `models_pdkp` int(11) NOT NULL,
  `models_igup` int(11) NOT NULL,
  `models_pkup` int(11) NOT NULL,
  `models_pdup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  ADD PRIMARY KEY (`models_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
