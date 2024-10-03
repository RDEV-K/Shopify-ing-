-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2022 at 09:03 PM
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
-- Table structure for table `tbl_ingredients_batch`
--

CREATE TABLE `tbl_ingredients_batch` (
  `ingredient_batch_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `ingredient_batch_no` varchar(255) NOT NULL,
  `ingredient_batch_expiry` varchar(255) NOT NULL,
  `ingredient_batch_supplier_id` int(11) NOT NULL,
  `ingredient_batch_qty` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  ADD PRIMARY KEY (`ingredient_batch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  MODIFY `ingredient_batch_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
