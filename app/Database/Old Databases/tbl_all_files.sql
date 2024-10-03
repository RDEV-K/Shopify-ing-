-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 09:16 AM
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
-- Database: `cosman`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_all_files`
--

CREATE TABLE `tbl_all_files` (
  `file_id` int(11) NOT NULL,
  `file_directory` longtext NOT NULL,
  `file_upload` longtext NOT NULL,
  `file_page_name` longtext NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_all_files`
--

INSERT INTO `tbl_all_files` (`file_id`, `file_directory`, `file_upload`, `file_page_name`, `page_id`, `user_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'PR2-5 - Ingredient Batches', 'IBN-2-2023-02-01.png', 'Ingredient Batches', 6, 19, 0, '2023-01-31 07:30:09', '2023-01-31 07:30:09', NULL),
(9, 'PR2-5 - Ingredient Batches', 'IBN--2023-02-01.png', 'Ingredient Batches', 6, 19, 0, '2023-01-31 07:31:21', '2023-01-31 08:46:38', NULL),
(10, 'PR2-5 - Ingredient Batches', 'IBN-2-2023-02-01.png', 'Ingredient Batches', 6, 19, 0, '2023-01-31 08:10:45', '2023-01-31 08:10:45', NULL),
(11, 'PIF Files', '2_2023-01-2931081124.png', 'PIF Files', 4, 19, 0, '2023-01-31 08:11:24', '2023-01-31 08:11:24', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_all_files`
--
ALTER TABLE `tbl_all_files`
  ADD PRIMARY KEY (`file_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_all_files`
--
ALTER TABLE `tbl_all_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
