-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 08:14 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.26

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
-- Table structure for table `tbl_models_marketing`
--

CREATE TABLE `tbl_models_marketing` (
  `model_marketing_id` int(11) NOT NULL,
  `models_id` int(11) NOT NULL,
  `models_sales_pp` float NOT NULL,
  `models_sales_tr` float NOT NULL,
  `models_rrp` longtext NOT NULL,
  `formu_id` longtext NOT NULL,
  `models_li` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_models_marketing`
--

INSERT INTO `tbl_models_marketing` (`model_marketing_id`, `models_id`, `models_sales_pp`, `models_sales_tr`, `models_rrp`, `formu_id`, `models_li`) VALUES
(1, 2, 23, 6, '[\"10\",\"17\",\"5\"]', '[10,6,9]', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  ADD PRIMARY KEY (`model_marketing_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  MODIFY `model_marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
