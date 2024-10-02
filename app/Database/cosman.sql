-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2024 at 04:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_all_files`
--

INSERT INTO `tbl_all_files` (`file_id`, `file_directory`, `file_upload`, `file_page_name`, `page_id`, `user_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PIF Files', '1_2024-05-1818124001.pdf', 'PIF Files', 1, 18, 0, '2024-05-18 12:40:01', '2024-05-18 12:40:01', NULL),
(2, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-09-25.pdf', 'Ingredient Batches', 1, 18, 0, '2024-06-27 21:37:13', '2024-06-27 21:37:13', NULL),
(3, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-07-27.pdf', 'Ingredient Batches', 2, 18, 0, '2024-07-06 08:37:03', '2024-07-06 08:37:03', NULL),
(4, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-07-27.pdf', 'Ingredient Batches', 3, 18, 0, '2024-07-06 08:40:49', '2024-07-06 08:40:49', NULL),
(5, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-07-27.pdf', 'Ingredient Batches', 4, 18, 0, '2024-07-06 08:41:06', '2024-07-06 08:41:06', NULL),
(6, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-07-12.pdf', 'Ingredient Batches', 5, 18, 0, '2024-07-06 08:42:02', '2024-07-06 08:42:02', NULL),
(7, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-08-03.pdf', 'Ingredient Batches', 6, 18, 0, '2024-07-27 19:20:47', '2024-07-27 19:20:47', NULL),
(8, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-08-03.pdf', 'Ingredient Batches', 6, 18, 0, '2024-07-27 19:21:07', '2024-07-27 19:21:07', NULL),
(9, 'PR2-5 - Ingredient Batches', 'IBN-2-2024-07-19.pdf', 'Ingredient Batches', 7, 18, 0, '2024-07-27 19:21:20', '2024-07-27 19:21:20', NULL),
(10, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-08-15.pdf', 'Ingredient Batches', 8, 18, 0, '2024-08-11 19:07:26', '2024-08-11 19:07:26', NULL),
(11, 'PR2-5 - Ingredient Batches', 'IBN-1-2024-08-15.pdf', 'Ingredient Batches', 8, 18, 0, '2024-08-11 19:09:13', '2024-08-11 19:09:13', NULL);

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
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_corporate_formula`
--

INSERT INTO `tbl_corporate_formula` (`corporate_formula_id`, `batch_qty`, `unit_qty`, `formula_id`, `models_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 0.1, '[\"1\",\"5\",\"8\"]', 1, 18, '2024-05-18 12:55:26', '2024-07-06 09:39:52', NULL),
(2, 100, 0.1, '[\"1\",\"5\",\"8\",\"9\"]', 2, 18, '2024-07-06 09:44:37', '2024-07-06 10:04:26', NULL);

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
  `models_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_corporate_ingredients`
--

INSERT INTO `tbl_corporate_ingredients` (`corporate_ingredient_id`, `formula_ids`, `suppliers`, `order_qty`, `prices`, `models_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '[1,2]', '[\"xx\",\"xx\"]', '[\"10\",\"10\"]', '[\"100\",\"100\"]', 1, 18, '2024-06-27 21:23:57', '2024-07-15 10:06:07', NULL),
(2, '[1,2]', '[\"0\",\"0\"]', '[\"325\",\"500\"]', '[\"100\",\"100\"]', 2, 18, '2024-07-06 09:55:51', '2024-07-06 10:02:32', NULL);

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
  `cpn_notification` varchar(255) NOT NULL,
  `cpn_status` varchar(255) NOT NULL,
  `cpn_user` int(11) NOT NULL,
  `invoice_file` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cpn`
--

INSERT INTO `tbl_cpn` (`cpn_id`, `cpn_date`, `cpn_formula`, `cpn_rp`, `cpn_reporta`, `cpn_reportb`, `cpn_stability`, `cpn_challenge`, `cpn_pif`, `cpn_notification`, `cpn_status`, `cpn_user`, `invoice_file`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-05-18', 1, 'Joe Bloggs (Quality) PIF', '', '', '', '', '', '', '', 18, '', 18, '2024-05-18 12:40:01', '2024-07-21 17:50:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formula`
--

CREATE TABLE `tbl_formula` (
  `formula_id` int(11) NOT NULL,
  `formula_date` varchar(250) NOT NULL,
  `formula_version` varchar(250) NOT NULL,
  `formula_creator` varchar(250) NOT NULL,
  `formula_comments` varchar(250) NOT NULL,
  `formula_rdplan` varchar(250) NOT NULL,
  `dependency_id` int(11) NOT NULL,
  `formula_status` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_formula`
--

INSERT INTO `tbl_formula` (`formula_id`, `formula_date`, `formula_version`, `formula_creator`, `formula_comments`, `formula_rdplan`, `dependency_id`, `formula_status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-04-06', 'Formula - 500%', '18', 'Doloremque corporis ut ducimus tenetur. Ullam rerum ducimus odit saepe minima laudantium.', 'Test', 0, 'New', 18, '2024-04-06 23:47:52', '2024-06-21 11:44:51', NULL),
(2, '2024-04-06', 'Formula', '18', 'N/A', 'Test', 1, 'New', 18, '2024-04-08 23:09:17', '2024-04-08 23:09:29', '2024-04-08 23:09:29'),
(3, '2024-04-06', 'Formula', '18', 'N/A', 'Test', 1, 'New', 18, '2024-04-08 23:10:44', '2024-04-08 23:11:42', '2024-04-08 23:11:42'),
(4, '2024-04-06', 'Formula', '18', 'N/A', 'Test', 1, 'New', 18, '2024-04-08 23:11:52', '2024-04-09 19:17:45', '2024-04-09 19:17:45'),
(5, '2024-04-06', 'Formula', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test', 1, 'New', 18, '2024-04-09 19:17:50', '2024-06-21 09:20:40', NULL),
(6, '2024-04-06', 'Formula', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test', 5, 'New', 18, '2024-06-21 11:34:40', '2024-06-21 11:43:48', '2024-06-21 11:43:48'),
(7, '2024-04-06', 'Formula', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test', 5, 'New', 18, '2024-06-21 11:43:53', '2024-06-21 11:44:23', '2024-06-21 11:44:23'),
(8, '2024-04-06', 'Formula - Copy', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test', 5, 'New', 18, '2024-06-21 11:44:57', '2024-06-21 11:45:50', NULL),
(9, '2024-04-06', 'Formula', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 5, 'New', 18, '2024-06-21 11:45:56', '2024-07-06 09:05:20', NULL),
(10, '2024-04-06', 'Formula - copy', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 9, 'New', 18, '2024-07-16 08:11:16', '2024-07-16 08:12:18', '2024-07-16 08:12:18'),
(11, '2024-04-06', 'Formula - copy', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 10, 'New', 18, '2024-07-16 08:11:39', '2024-07-16 08:12:16', '2024-07-16 08:12:16'),
(12, '2024-04-06', 'Formula - copy', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 11, 'New', 18, '2024-07-16 08:12:04', '2024-07-16 08:12:14', '2024-07-16 08:12:14'),
(13, '2024-07-16', 'Formula - copy', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test', 8, 'New', 18, '2024-07-16 10:50:42', '2024-07-16 10:50:42', NULL),
(14, '2024-07-27', 'Formula - Test for Order', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 9, 'New', 18, '2024-07-27 17:30:32', '2024-07-27 18:08:07', NULL),
(15, '2024-08-15', 'With Zero', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 14, 'Rejected', 18, '2024-08-15 08:18:17', '2024-08-15 08:19:19', NULL),
(16, '2024-08-15', 'Formula - 500% - copy', '18', 'Doloremque corporis ut ducimus tenetur. Ullam rerum ducimus odit saepe minima laudantium.', 'Test', 1, 'New', 18, '2024-08-15 08:18:47', '2024-08-15 08:18:47', NULL),
(17, '2024-08-15', 'With Zero - copy', '18', 'This formula did not work as expected. The ratio needed to be changed. This was a copy of another formula, so we did not expect to the outcome to be the same as what it was.', 'Test 11', 15, 'Rejected', 18, '2024-08-15 08:19:22', '2024-08-15 08:19:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formula_ingredients`
--

CREATE TABLE `tbl_formula_ingredients` (
  `f_ingredients_id` int(11) NOT NULL,
  `f_ingredients_formula` varchar(250) NOT NULL,
  `f_ingredients_ingredients` varchar(250) NOT NULL,
  `f_ingredients_qty` varchar(250) NOT NULL,
  `f_ingredients_phase` varchar(250) NOT NULL,
  `f_ingredients_instructions` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_formula_ingredients`
--

INSERT INTO `tbl_formula_ingredients` (`f_ingredients_id`, `f_ingredients_formula`, `f_ingredients_ingredients`, `f_ingredients_qty`, `f_ingredients_phase`, `f_ingredients_instructions`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '175', 'A', 'Add to exxx', 18, '2024-04-08 23:10:29', '2024-05-20 18:43:43', NULL),
(2, '1', '2', '350', 'B', 'Add xxxxxx', 18, '2024-04-08 23:10:40', '2024-05-20 18:43:43', NULL),
(3, '5', '1', '50', 'A', 'Add to exxx', 18, '2024-04-09 19:17:50', '2024-06-21 11:44:33', NULL),
(4, '5', '2', '50', 'B', 'Add xxxxxx', 18, '2024-04-09 19:17:50', '2024-06-21 11:44:38', NULL),
(5, '6', '1', '250', 'A', 'Add to exxx', 18, '2024-06-21 11:34:40', '2024-06-21 11:43:48', '2024-06-21 11:43:48'),
(6, '6', '2', '250', 'B', 'Add xxxxxx', 18, '2024-06-21 11:34:40', '2024-06-21 11:43:48', '2024-06-21 11:43:48'),
(7, '7', '1', '250', 'A', 'Add to exxx', 18, '2024-06-21 11:43:53', '2024-06-21 11:44:23', '2024-06-21 11:44:23'),
(8, '7', '2', '250', 'B', 'Add xxxxxx', 18, '2024-06-21 11:43:53', '2024-06-21 11:44:23', '2024-06-21 11:44:23'),
(9, '8', '1', '50', 'A', 'Add to exxx', 18, '2024-06-21 11:44:57', '2024-06-21 11:44:57', NULL),
(10, '8', '2', '50', 'B', 'Add xxxxxx', 18, '2024-06-21 11:44:57', '2024-06-21 11:44:57', NULL),
(11, '9', '1', '50', 'A', 'Add to exxx', 18, '2024-06-21 11:45:56', '2024-06-21 11:45:56', NULL),
(12, '9', '2', '50', 'B', 'Add xxxxxx', 18, '2024-06-21 11:45:56', '2024-06-21 11:45:56', NULL),
(13, '10', '1', '50', 'A', 'Add to exxx', 18, '2024-07-16 08:11:16', '2024-07-16 08:12:18', '2024-07-16 08:12:18'),
(14, '10', '2', '50', 'B', 'Add xxxxxx', 18, '2024-07-16 08:11:16', '2024-07-16 08:12:18', '2024-07-16 08:12:18'),
(15, '11', '1', '50', 'A', 'Add to exxx', 18, '2024-07-16 08:11:39', '2024-07-16 08:12:16', '2024-07-16 08:12:16'),
(16, '11', '2', '50', 'B', 'Add xxxxxx', 18, '2024-07-16 08:11:39', '2024-07-16 08:12:16', '2024-07-16 08:12:16'),
(17, '12', '1', '50', 'A', 'Add to exxx', 18, '2024-07-16 08:12:04', '2024-07-16 08:12:14', '2024-07-16 08:12:14'),
(18, '12', '2', '50', 'B', 'Add xxxxxx', 18, '2024-07-16 08:12:04', '2024-07-16 08:12:14', '2024-07-16 08:12:14'),
(19, '13', '1', '50', 'A', 'Add to exxx', 18, '2024-07-16 10:50:42', '2024-07-16 10:50:42', NULL),
(20, '13', '2', '50', 'B', 'Add xxxxxx', 18, '2024-07-16 10:50:42', '2024-07-16 10:50:42', NULL),
(21, '14', '1', '50', 'A', 'Add to exxx', 18, '2024-07-27 17:30:32', '2024-07-27 17:30:32', NULL),
(22, '14', '2', '50', 'B', 'Add xxxxxx', 18, '2024-07-27 17:30:32', '2024-07-27 17:30:32', NULL),
(23, '14', '1', '100', 'A', 'XX', 18, '2024-07-27 18:07:43', '2024-07-27 18:07:43', NULL),
(24, '15', '1', '50', 'A', 'Add to exxx', 18, '2024-08-15 08:18:17', '2024-08-15 08:18:17', NULL),
(25, '15', '2', '50', 'B', 'Add xxxxxx', 18, '2024-08-15 08:18:17', '2024-08-15 08:18:17', NULL),
(26, '15', '1', '0', 'A', 'XX', 18, '2024-08-15 08:18:17', '2024-08-15 08:19:01', NULL),
(27, '16', '1', '175', 'A', 'Add to exxx', 18, '2024-08-15 08:18:47', '2024-08-15 08:18:47', NULL),
(28, '16', '2', '350', 'B', 'Add xxxxxx', 18, '2024-08-15 08:18:47', '2024-08-15 08:18:47', NULL),
(29, '17', '1', '50', 'A', 'Add to exxx', 18, '2024-08-15 08:19:22', '2024-08-15 08:19:22', NULL),
(30, '17', '2', '50', 'B', 'Add xxxxxx', 18, '2024-08-15 08:19:22', '2024-08-15 08:19:22', NULL),
(31, '17', '1', '0%', 'A', 'XX', 18, '2024-08-15 08:19:22', '2024-08-15 08:19:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredients`
--

CREATE TABLE `tbl_ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_date` date NOT NULL,
  `ingredient_name` varchar(250) NOT NULL,
  `ingredient_inci` varchar(250) NOT NULL,
  `ingredient_category` varchar(250) NOT NULL,
  `ingredient_qty` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-04-08', 'Water', 'Agua', 'Water', '99375', 18, '2024-04-08 23:09:53', '2024-05-20 18:43:43', NULL),
(2, '2024-04-08', 'Xanthan Gum', 'Xanthan Gum', 'Thickener', '0', 18, '2024-04-08 23:10:10', '2024-05-20 18:43:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredients_batch`
--

CREATE TABLE `tbl_ingredients_batch` (
  `ingredient_batch_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `ingredient_batch_no` varchar(255) NOT NULL,
  `ingredient_batch_expiry` varchar(255) NOT NULL,
  `ingredient_batch_supplier_id` varchar(250) NOT NULL,
  `ingredient_batch_qty` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_file` varchar(255) NOT NULL,
  `date_added` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ingredients_batch`
--

INSERT INTO `tbl_ingredients_batch` (`ingredient_batch_id`, `ingredient_id`, `ingredient_batch_no`, `ingredient_batch_expiry`, `ingredient_batch_supplier_id`, `ingredient_batch_qty`, `user_id`, `invoice_file`, `date_added`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '6927', '2024-09-25', 'Happy', '250', 18, '', '2024-06-27', '2024-06-27 21:37:13', '2024-06-27 21:37:13', NULL),
(2, 1, '81783', '2024-07-27', 'Happy', '100', 18, '', '2024-07-06', '2024-07-06 08:37:03', '2024-07-06 08:37:03', NULL),
(3, 1, '81783', '2024-07-27', 'Happy', '100', 18, '', '2024-07-06', '2024-07-06 08:40:49', '2024-07-06 08:40:49', NULL),
(4, 1, '81783', '2024-07-27', 'Happy', '100', 18, '', '2024-07-06', '2024-07-06 08:41:06', '2024-07-06 08:41:12', '2024-07-06 08:41:12'),
(5, 1, 'Test', '2024-07-12', 'Test', '100', 18, '', '2024-07-06', '2024-07-06 08:42:02', '2024-07-06 08:42:02', NULL),
(6, 1, 'XX', '2024-08-03', 'XX', '222', 18, '', '2024-07-27', '2024-07-27 19:20:47', '2024-07-27 19:20:47', NULL),
(7, 2, '22', '2024-07-19', '22', '222', 18, '', '2024-07-27', '2024-07-27 19:21:20', '2024-07-27 19:21:20', NULL),
(8, 1, 'XX', '2024-08-15', 'XX', '222', 18, '', '2024-08-11', '2024-08-11 19:07:26', '2024-08-11 19:07:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_journal`
--

CREATE TABLE `tbl_journal` (
  `journal_id` int(11) NOT NULL,
  `journal_content` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_journal`
--

INSERT INTO `tbl_journal` (`journal_id`, `journal_content`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '&lt;p&gt;Welcome to my journal. Here I can just write and type and add what ever I like. You dont have to worry about saving your work as I save automatically.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;I can add different&amp;nbsp;&lt;/strong&gt;​&lt;i&gt;styles of text and&amp;nbsp;&lt;span style=&quot;text-decoration: underline;&quot;&gt;this helps to make thing stand out.&lt;/span&gt;&lt;/i&gt;&lt;/p&gt;&lt;h1&gt;﻿I can have different headers.&amp;nbsp;&lt;/h1&gt;&lt;p&gt;&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;I can have lists and bullet points and &lt;a class=&quot;e-rte-anchor&quot; href=&quot;http://google.com&quot; title=&quot;http://google.com&quot; target=&quot;_blank&quot;&gt;links&lt;/a&gt;.&lt;/li&gt;&lt;li style=&quot;cursor: auto;&quot;&gt;I can also add in in photos.&lt;/li&gt;&lt;/ol&gt;&lt;p&gt;&lt;img src=&quot;https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg&quot; class=&quot;e-rte-image e-imginline e-resize e-rte-drag-image&quot; alt=&quot;close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg&quot; width=&quot;354&quot; height=&quot;auto&quot; style=&quot;min-width: 20px; max-width: 1744px; min-height: 0px;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;blob:http://localhost/08d2cef3-d8d4-491d-be48-e6ca57bbff8a&quot; class=&quot;e-rte-image e-imginline&quot; alt=&quot;IMG-20211209-WA0000.jpg&quot; width=&quot;auto&quot; height=&quot;auto&quot; style=&quot;min-width: 0px; max-width: 1744px; min-height: 0px;&quot;&gt; &lt;/p&gt;', 18, '2024-04-11 19:03:24', '2024-08-15 08:25:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production`
--

CREATE TABLE `tbl_manuf_production` (
  `manuf_product_id` int(11) NOT NULL,
  `manuf_product_date` varchar(250) NOT NULL,
  `manuf_product_formula` varchar(250) NOT NULL,
  `manuf_product_creator` varchar(250) NOT NULL,
  `manuf_product_qty` varchar(250) NOT NULL,
  `manuf_product_batch` varchar(250) NOT NULL,
  `manuf_comments` longtext NOT NULL,
  `manuf_product_status` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_manuf_production`
--

INSERT INTO `tbl_manuf_production` (`manuf_product_id`, `manuf_product_date`, `manuf_product_formula`, `manuf_product_creator`, `manuf_product_qty`, `manuf_product_batch`, `manuf_comments`, `manuf_product_status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2024-05-18', '1', '18', '100', '100', '', 'Produced', 18, '2024-05-18 12:03:07', '2024-05-18 12:03:27', NULL),
(2, '2024-05-18', '1', '18', '100', '1535', '', 'Produced', 18, '2024-05-18 15:03:42', '2024-05-18 15:04:03', NULL),
(3, '2024-05-18', '5', '18', '500', '5478', '', 'Produced', 18, '2024-05-18 15:06:23', '2024-05-18 15:06:41', NULL),
(4, '2024-05-20', '1', '18', '175', '373656', '', 'Produced', 18, '2024-05-20 18:43:12', '2024-05-20 18:43:43', NULL),
(5, '2024-06-21', '1', '18', '100', 'XXCSUD542', 'Trial number X this should be good.', 'In Progress', 18, '2024-06-21 09:27:00', '2024-07-06 09:16:36', NULL),
(6, '2024-07-06', '9', '18', '100', '100', 'Lets try this one', 'In Progress', 18, '2024-07-06 09:05:36', '2024-07-06 09:05:36', NULL),
(7, '2024-07-27', '13', '18', '100', '54656', 'rtr', 'In Progress', 18, '2024-07-27 17:35:57', '2024-07-27 18:16:04', '2024-07-27 18:16:04'),
(8, '2024-07-27', '14', '18', '100', 'XX', 'XX', 'In Progress', 18, '2024-07-27 18:08:32', '2024-07-27 18:08:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production_batch`
--

CREATE TABLE `tbl_manuf_production_batch` (
  `manuf_production_batch_id` int(11) NOT NULL,
  `manuf_production_batch_production` varchar(250) NOT NULL,
  `manuf_production_batch_ingredients` varchar(250) NOT NULL,
  `manuf_production_batch_qty` varchar(250) NOT NULL,
  `production_batch_ingredient_batch` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_manuf_production_batch`
--

INSERT INTO `tbl_manuf_production_batch` (`manuf_production_batch_id`, `manuf_production_batch_production`, `manuf_production_batch_ingredients`, `manuf_production_batch_qty`, `production_batch_ingredient_batch`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '', '', 18, '2024-05-18 12:03:27', '2024-05-18 12:03:27', NULL),
(2, '1', '1', '100', '', 18, '2024-05-18 12:03:27', '2024-05-18 12:03:27', NULL),
(3, '1', '2', '', '', 18, '2024-05-18 12:03:27', '2024-05-18 12:03:27', NULL),
(4, '1', '2', '200', '', 18, '2024-05-18 12:03:27', '2024-05-18 12:03:27', NULL),
(5, '2', '1', '', '', 18, '2024-05-18 15:04:03', '2024-05-18 15:04:03', NULL),
(6, '2', '1', '100', '', 18, '2024-05-18 15:04:03', '2024-05-18 15:04:03', NULL),
(7, '2', '2', '', '', 18, '2024-05-18 15:04:03', '2024-05-18 15:04:03', NULL),
(8, '2', '2', '200', '', 18, '2024-05-18 15:04:03', '2024-05-18 15:04:03', NULL),
(9, '3', '1', '', '', 18, '2024-05-18 15:06:41', '2024-05-18 15:06:41', NULL),
(10, '3', '1', '250', '', 18, '2024-05-18 15:06:41', '2024-05-18 15:06:41', NULL),
(11, '3', '2', '', '', 18, '2024-05-18 15:06:41', '2024-05-18 15:06:41', NULL),
(12, '3', '2', '250', '', 18, '2024-05-18 15:06:41', '2024-05-18 15:06:41', NULL),
(13, '4', '1', '175', '', 18, '2024-05-20 18:43:43', '2024-05-20 18:43:43', NULL),
(14, '4', '2', '350', '', 18, '2024-05-20 18:43:43', '2024-05-20 18:43:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_models`
--

CREATE TABLE `tbl_models` (
  `models_id` int(11) NOT NULL,
  `models_date` date NOT NULL,
  `models_name` varchar(255) NOT NULL,
  `models_qty` varchar(255) NOT NULL,
  `models_spend` varchar(255) NOT NULL,
  `models_revenue` varchar(255) NOT NULL,
  `models_profit` varchar(255) NOT NULL,
  `models_user` int(11) NOT NULL,
  `models_status` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_models`
--

INSERT INTO `tbl_models` (`models_id`, `models_date`, `models_name`, `models_qty`, `models_spend`, `models_revenue`, `models_profit`, `models_user`, `models_status`, `created_at`, `user_id`, `updated_at`, `deleted_at`) VALUES
(1, '2024-05-18', 'Business Plan A', 'TBC', 'TBC', 'TBC', 'TBC', 0, 'Completed', '2024-05-18 12:46:14', 18, '2024-07-03 18:52:02', NULL),
(2, '2024-07-06', 'Tester 2', 'TBC', 'TBC', 'TBC', 'TBC', 0, 'Completed', '2024-07-06 09:44:19', 18, '2024-07-06 09:58:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_models_manufacturing`
--

CREATE TABLE `tbl_models_manufacturing` (
  `model_manufacturing_id` int(11) NOT NULL,
  `models_id` int(11) NOT NULL,
  `model_manufacturing_productionfee` float NOT NULL,
  `model_manufacturing_deliveryfee` float NOT NULL,
  `model_manufacturing_bottlingfee` float NOT NULL,
  `models_igtp` int(11) NOT NULL,
  `models_pktp` int(11) NOT NULL,
  `models_pdtp` int(11) NOT NULL,
  `models_igkp` int(11) NOT NULL,
  `models_pkkp` int(11) NOT NULL,
  `models_pdkp` int(11) NOT NULL,
  `models_igup` int(11) NOT NULL,
  `models_pkup` int(11) NOT NULL,
  `models_pdup` int(11) NOT NULL,
  `model_ptp` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_models_manufacturing`
--

INSERT INTO `tbl_models_manufacturing` (`model_manufacturing_id`, `models_id`, `model_manufacturing_productionfee`, `model_manufacturing_deliveryfee`, `model_manufacturing_bottlingfee`, `models_igtp`, `models_pktp`, `models_pdtp`, `models_igkp`, `models_pkkp`, `models_pdkp`, `models_igup`, `models_pkup`, `models_pdup`, `model_ptp`, `user_id`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18),
(2, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18);

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
  `models_li` float NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_models_marketing`
--

INSERT INTO `tbl_models_marketing` (`model_marketing_id`, `models_id`, `models_sales_pp`, `models_sales_tr`, `models_rrp`, `formu_id`, `models_li`, `user_id`) VALUES
(1, 2, 100, 5, '[\"4\",\"3\",\"3\",\"3\"]', '[1,5,8,9]', 10, 18),
(2, 1, 10, 4, '[\"2.50\",\"1.10\",\"1.10\"]', '[1,5,8]', 5, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_models_overheads`
--

CREATE TABLE `tbl_models_overheads` (
  `models_overheads_id` int(11) NOT NULL,
  `models_id` int(11) NOT NULL,
  `models_overheads_insurance` int(11) NOT NULL,
  `models_overheads_domain` int(11) NOT NULL,
  `models_overheads_hosting` int(11) NOT NULL,
  `models_overheads_gdpr` int(11) NOT NULL,
  `models_overheads_phone` int(11) NOT NULL,
  `models_overheads_mail` int(11) NOT NULL,
  `models_overheads_banking` int(11) NOT NULL,
  `models_overheads_tech` int(11) NOT NULL,
  `models_overheads_software` int(11) NOT NULL,
  `models_overheads_filing` int(11) NOT NULL,
  `models_overheads_ops_rate` int(11) NOT NULL,
  `models_overheads_ops_hours` int(11) NOT NULL,
  `models_overheads_ops_yearly` int(11) NOT NULL,
  `models_overheads_acc_rate` int(11) NOT NULL,
  `models_overheads_acc_hours` int(11) NOT NULL,
  `models_overheads_acc_yearly` int(11) NOT NULL,
  `models_overheads_coms_rate` int(11) NOT NULL,
  `models_overheads_coms_hours` int(11) NOT NULL,
  `models_overheads_coms_yearly` int(11) NOT NULL,
  `models_overheads_pub_rate` int(11) NOT NULL,
  `models_overheads_pub_hours` int(11) NOT NULL,
  `models_overheads_pub_yearly` int(11) NOT NULL,
  `models_overheads_yearly` int(11) NOT NULL,
  `models_overheads_quartely` int(11) NOT NULL,
  `models_overheads_monthly` int(11) NOT NULL,
  `models_overheads_daily` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_models_overheads`
--

INSERT INTO `tbl_models_overheads` (`models_overheads_id`, `models_id`, `models_overheads_insurance`, `models_overheads_domain`, `models_overheads_hosting`, `models_overheads_gdpr`, `models_overheads_phone`, `models_overheads_mail`, `models_overheads_banking`, `models_overheads_tech`, `models_overheads_software`, `models_overheads_filing`, `models_overheads_ops_rate`, `models_overheads_ops_hours`, `models_overheads_ops_yearly`, `models_overheads_acc_rate`, `models_overheads_acc_hours`, `models_overheads_acc_yearly`, `models_overheads_coms_rate`, `models_overheads_coms_hours`, `models_overheads_coms_yearly`, `models_overheads_pub_rate`, `models_overheads_pub_hours`, `models_overheads_pub_yearly`, `models_overheads_yearly`, `models_overheads_quartely`, `models_overheads_monthly`, `models_overheads_daily`, `user_id`) VALUES
(1, 1, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18),
(2, 2, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_models_packaging`
--

CREATE TABLE `tbl_models_packaging` (
  `model_package_id` int(11) NOT NULL,
  `models_id` int(11) NOT NULL,
  `models_packaging_container_size` varchar(255) NOT NULL,
  `models_packaging_container_qty` int(11) NOT NULL,
  `models_packaging_container_supplier` varchar(255) NOT NULL,
  `models_packaging_container_order` int(11) NOT NULL,
  `models_packaging_container_price` int(11) NOT NULL,
  `models_packaging_label_size` varchar(255) NOT NULL,
  `models_packaging_label_qty` int(11) NOT NULL,
  `models_packaging_label_supplier` varchar(255) NOT NULL,
  `models_packaging_label_order` int(11) NOT NULL,
  `models_packaging_label_price` int(11) NOT NULL,
  `models_packaging_shipping_size` varchar(255) NOT NULL,
  `models_packaging_shipping_qty` int(11) NOT NULL,
  `models_packaging_shipping_supplier` varchar(255) NOT NULL,
  `models_packaging_shipping_order` int(11) NOT NULL,
  `models_packaging_shipping_price` int(11) NOT NULL,
  `models_packaging_bags_size` varchar(255) NOT NULL,
  `models_packaging_bags_qty` int(11) NOT NULL,
  `models_packaging_bags_supplier` varchar(255) NOT NULL,
  `models_packaging_bags_order` int(11) NOT NULL,
  `models_packaging_bags_price` int(11) NOT NULL,
  `models_packaging_notes_size` varchar(255) NOT NULL,
  `models_packaging_notes_qty` int(11) NOT NULL,
  `models_packaging_notes_supplier` varchar(255) NOT NULL,
  `models_packaging_notes_order` int(11) NOT NULL,
  `models_packaging_notes_price` int(11) NOT NULL,
  `models_packaging_delivery_size` varchar(255) NOT NULL,
  `models_packaging_delivery_qty` int(11) NOT NULL,
  `models_packaging_delivery_supplier` varchar(255) NOT NULL,
  `models_packaging_delivery_order` int(11) NOT NULL,
  `models_packaging_delivery_price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_models_packaging`
--

INSERT INTO `tbl_models_packaging` (`model_package_id`, `models_id`, `models_packaging_container_size`, `models_packaging_container_qty`, `models_packaging_container_supplier`, `models_packaging_container_order`, `models_packaging_container_price`, `models_packaging_label_size`, `models_packaging_label_qty`, `models_packaging_label_supplier`, `models_packaging_label_order`, `models_packaging_label_price`, `models_packaging_shipping_size`, `models_packaging_shipping_qty`, `models_packaging_shipping_supplier`, `models_packaging_shipping_order`, `models_packaging_shipping_price`, `models_packaging_bags_size`, `models_packaging_bags_qty`, `models_packaging_bags_supplier`, `models_packaging_bags_order`, `models_packaging_bags_price`, `models_packaging_notes_size`, `models_packaging_notes_qty`, `models_packaging_notes_supplier`, `models_packaging_notes_order`, `models_packaging_notes_price`, `models_packaging_delivery_size`, `models_packaging_delivery_qty`, `models_packaging_delivery_supplier`, `models_packaging_delivery_order`, `models_packaging_delivery_price`, `user_id`) VALUES
(1, 1, '100', 0, '00', 10, 10, '10', 0, '00', 0, 0, '10', 0, '00', 0, 0, '10', 0, '00', 0, 0, '10', 0, '00', 0, 0, '10', 0, '00', 0, 0, 18),
(2, 2, '1', 400, '0', 400, 100, '0', 400, '0', 400, 0, '0', 400, '0', 400, 0, '0', 400, '0', 400, 0, '0', 400, '0', 400, 0, '0', 400, '0', 400, 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `stripe_customer_id` varchar(250) NOT NULL,
  `stripe_product_id` varchar(255) NOT NULL,
  `stripe_product_name` varchar(255) NOT NULL,
  `stripe_subscription_id` varchar(250) NOT NULL,
  `stripe_subscription_status` varchar(250) NOT NULL,
  `user_business_name` varchar(255) NOT NULL,
  `user_business_type` varchar(255) NOT NULL,
  `user_business_overview` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_password`, `stripe_customer_id`, `stripe_product_id`, `stripe_product_name`, `stripe_subscription_id`, `stripe_subscription_status`, `user_business_name`, `user_business_type`, `user_business_overview`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Developer', 'Admin', 'Developer', '$2y$10$H4YQxmBiqpGYbkcu5f/94eZS9xoG743XtSJoizIkQsGRnKxXQx3Pu', 'cus_NEa7D92STgp4pg', '', 'Pro', 'sub_1MU6xdFcWMpKvcw6Ka2hw1Kg', 'Corporate', '', '', '', '2023-01-08 15:23:29', '2023-07-14 07:45:10', NULL),
(12, 'Nathan', 'Reid', 'nathanr', '$2y$10$l81EcCIBK7QT4wdgAO2Wo.UejRLllp.../awGW/99qVo1qFC408kK', 'cus_NG4YOoSbEzxOZG', '', '', 'sub_1MVYPBFcWMpKvcw6BAoQwFry', 'active', '', '', '', '2023-01-08 15:23:29', '2024-04-06 23:10:21', NULL),
(18, 'Test', 'Account', 'hello@ingrevo.com', '$2y$10$IJ2vZ/BXxTrbo4z56JIYyefCvPdR4CfoHIOpzzwVClPDbc/TNQCqy', 'cus_NG4YOoSbEzxOZG', '', 'Professional', 'sub_1Ngv9vFcWMpKvcw68QuYCeiv', 'active', 'Test Account', 'Skin Care', 'The business was built in 2019 and focused on making vegan skin care products.', '2023-01-29 11:46:50', '2024-08-30 15:45:17', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_all_files`
--
ALTER TABLE `tbl_all_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  ADD PRIMARY KEY (`corporate_formula_id`);

--
-- Indexes for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  ADD PRIMARY KEY (`corporate_ingredient_id`);

--
-- Indexes for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  ADD PRIMARY KEY (`cpn_id`);

--
-- Indexes for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  ADD PRIMARY KEY (`formula_id`);

--
-- Indexes for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  ADD PRIMARY KEY (`f_ingredients_id`);

--
-- Indexes for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  ADD PRIMARY KEY (`ingredient_batch_id`);

--
-- Indexes for table `tbl_journal`
--
ALTER TABLE `tbl_journal`
  ADD PRIMARY KEY (`journal_id`);

--
-- Indexes for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  ADD PRIMARY KEY (`manuf_product_id`);

--
-- Indexes for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  ADD PRIMARY KEY (`manuf_production_batch_id`);

--
-- Indexes for table `tbl_models`
--
ALTER TABLE `tbl_models`
  ADD PRIMARY KEY (`models_id`);

--
-- Indexes for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  ADD PRIMARY KEY (`model_manufacturing_id`);

--
-- Indexes for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  ADD PRIMARY KEY (`model_marketing_id`);

--
-- Indexes for table `tbl_models_overheads`
--
ALTER TABLE `tbl_models_overheads`
  ADD PRIMARY KEY (`models_overheads_id`);

--
-- Indexes for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  ADD PRIMARY KEY (`model_package_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_all_files`
--
ALTER TABLE `tbl_all_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  MODIFY `corporate_formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  MODIFY `corporate_ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  MODIFY `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  MODIFY `ingredient_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_journal`
--
ALTER TABLE `tbl_journal`
  MODIFY `journal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  MODIFY `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  MODIFY `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_models`
--
ALTER TABLE `tbl_models`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  MODIFY `model_manufacturing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  MODIFY `model_marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_overheads`
--
ALTER TABLE `tbl_models_overheads`
  MODIFY `models_overheads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  MODIFY `model_package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
