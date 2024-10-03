-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2022 at 07:31 PM
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
-- Table structure for table `tbl_corporate_ingredients`
--

CREATE TABLE `tbl_corporate_ingredients` (
  `corporate_ingredient_id` int(11) NOT NULL,
  `formula_ids` longtext NOT NULL,
  `suppliers` longtext DEFAULT NULL,
  `order_qty` longtext DEFAULT NULL,
  `prices` longtext DEFAULT NULL,
  `models_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_ingredients`
--

INSERT INTO `tbl_corporate_ingredients` (`corporate_ingredient_id`, `formula_ids`, `suppliers`, `order_qty`, `prices`, `models_id`) VALUES
(1, '[1,6,7,8,9,11,12,13,14,15]', '[\"dkl\",\"98\",\"9\",\"098\",\"9\",\"0\",\"9\",\"9\",\"0\",\"8\"]', '[\"100\",\"93\",\"89\",\"98\",\"9\",\"0\",\"0\",\"9\",\"\",\"\"]', '[\"100\",\"100\",\"50\",\"100\",\"30\",\"100\",\"0\",\"0\",\"\",\"67\"]', 1),
(2, '[1,6,7,8,9,11,12,13,14,15]', '[\"dkl\",\"98\",\"9\",\"098\",\"9\",\"0\",\"9\",\"9\",\"0\",\"8\"]', '[\"34\",\"9\",\"89\",\"98\",\"9\",\"0\",\"0\",\"9\",\"\",\"\"]', '[\"98\",\"98\",\"100\",\"09\",\"\",\"99\",\"0\",\"0\",\"\",\"67\"]', 1),
(3, '[1,6,7,8,9,11,12,13,14,15]', '[\"dkl\",\"98\",\"9\",\"098\",\"9\",\"0\",\"9\",\"9\",\"0\",\"8\"]', '[\"32\",\"9\",\"89\",\"98\",\"9\",\"0\",\"0\",\"9\",\"\",\"\"]', '[\"98\",\"98\",\"66\",\"09\",\"\",\"99\",\"0\",\"0\",\"\",\"67\"]', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  ADD PRIMARY KEY (`corporate_ingredient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  MODIFY `corporate_ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
