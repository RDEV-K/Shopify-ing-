-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2023 at 01:05 PM
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
(11, 'PIF Files', '2_2023-01-2931081124.png', 'PIF Files', 4, 19, 0, '2023-01-31 08:11:24', '2023-01-31 08:11:24', NULL),
(12, 'PIF Files', '15_2023-01-2901065006.pdf', 'PIF Files', 7, 18, 0, '2023-02-01 18:50:06', '2023-02-01 18:50:06', NULL),
(13, 'PR2-5 - Ingredient Batches', 'IBN-16-2023-01-29.pdf', 'Ingredient Batches', 11, 18, 0, '2023-02-01 18:50:30', '2023-02-01 18:50:30', NULL),
(14, 'PR2-5 - Ingredient Batches', 'IBN-16-2023-03-23.pdf', 'Ingredient Batches', 12, 18, 0, '2023-02-01 18:54:19', '2023-02-01 18:54:19', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_formula`
--

INSERT INTO `tbl_corporate_formula` (`corporate_formula_id`, `batch_qty`, `unit_qty`, `formula_id`, `models_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 100, 1, '[\"1\"]', 1, 12, '2023-01-14 09:31:10', '2023-01-29 16:55:05', NULL),
(2, 100, 0.1, '[\"15\"]', 2, 18, '2023-01-29 13:17:25', '2023-02-02 18:23:06', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_ingredients`
--

INSERT INTO `tbl_corporate_ingredients` (`corporate_ingredient_id`, `formula_ids`, `suppliers`, `order_qty`, `prices`, `models_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '[1]', '[\"CP Chemicals\"]', '[\"1\"]', '[\"100\"]', 1, 12, '2023-01-14 09:34:03', '2023-01-29 16:55:17', NULL),
(2, '[16]', '[\"Water Co\"]', '[\"800\"]', '[\"100\"]', 2, 18, '2023-02-01 19:14:33', '2023-02-02 18:23:28', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cpn`
--

INSERT INTO `tbl_cpn` (`cpn_id`, `cpn_date`, `cpn_formula`, `cpn_rp`, `cpn_reporta`, `cpn_reportb`, `cpn_stability`, `cpn_challenge`, `cpn_pif`, `cpn_notification`, `cpn_status`, `cpn_user`, `invoice_file`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 1, 'Nathan Reid', 'Yes', 'Passed', 'Yes', 'Yes', 'No', 'In Progress', '', 12, 'CPN-1_2023-01-14', 12, '2023-01-14 10:31:45', '2023-01-29 16:55:51', '2023-01-14 10:45:32'),
(2, '2023-01-14', 1, 'Nathan Reid', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', 12, 'PIF-1-2023-01-14', 12, '2023-01-14 10:42:01', '2023-01-29 16:55:51', '2023-01-14 10:45:30'),
(3, '2023-01-14', 1, 'Nathan Reid', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', 12, 'PIF-1-2023-01-14', 12, '2023-01-14 10:45:57', '2023-01-29 16:55:51', '2023-01-19 19:55:50'),
(4, '2023-01-19', 2, 'John Doe', 'Yes', 'Yes', 'Yes', 'Yes', 'N/A', 'In Progress', '', 12, 'PIF-2-2023-01-19', 12, '2023-01-19 19:57:07', '2023-01-29 16:55:51', NULL),
(5, '2023-01-19', 7, 'Paul Smith', 'In Progress', 'In Progress', 'Yes', 'N/A', 'N/A', 'No', '', 12, 'PIF-7-2023-01-19', 12, '2023-01-19 19:57:38', '2023-01-29 16:55:51', NULL),
(6, '2023-01-19', 9, 'Julie Brown', 'In Progress', 'Passed', 'In Progress', 'In Progress', 'No', 'No', '', 12, 'PIF-9-2023-01-19', 12, '2023-01-19 19:58:42', '2023-01-29 16:55:51', NULL),
(7, '2023-01-29', 15, 'Nathan Reid', 'In Progress', 'Failed', 'Yes', 'Yes', 'Yes', 'In Progress', '', 18, 'PIF-15-2023-01-29', 18, '2023-01-29 12:50:27', '2023-01-29 13:11:03', NULL);

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
  `formula_status` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula`
--

INSERT INTO `tbl_formula` (`formula_id`, `formula_date`, `formula_version`, `formula_creator`, `formula_comments`, `formula_rdplan`, `formula_status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 'Water', '12', 'N/A', 'Demo Formula', 'Approved', 12, '2023-01-14 09:31:32', '2023-01-29 16:56:40', '2023-01-19 19:01:58'),
(2, '2022-06-21', 'Mango Melon', '12', 'Bright, happy, colourful bath bombs', 'Bath Bomb', 'Rejected', 12, '2023-01-19 19:05:13', '2023-01-29 16:56:40', NULL),
(3, '2022-12-05', 'Anti-Acne', '12', 'Spray to combat acne to use on body and face', 'Body Spray', 'Rejected', 12, '2023-01-19 19:06:20', '2023-01-29 16:56:40', NULL),
(4, '2022-12-10', 'Watermelon', '12', 'Foaming, thick lather hand wash', 'Hand Wash', 'Pending', 12, '2023-01-19 19:07:02', '2023-01-29 16:56:40', NULL),
(5, '2022-10-04', 'Macadamia Nut & Vanilla', '12', 'Rich, non-greasy with a warm vanilla base', 'Body Butter', 'Approved', 12, '2023-01-19 19:07:46', '2023-01-29 16:56:40', NULL),
(6, '2022-08-08', 'White Hot Chocolate', '12', 'Natural formula creating a silky decadent body butter', 'Body Butter', 'Pending', 12, '2023-01-19 19:08:28', '2023-01-29 16:56:40', NULL),
(7, '2022-09-06', 'Unscented Natural', '12', 'Simple ingredients to add texture and volume', 'Dry Shampoo', 'Approved', 12, '2023-01-19 19:09:19', '2023-01-29 16:56:40', NULL),
(8, '2023-01-19', 'Morning Coffee', '12', 'Relief for dry and itchy beards', 'Beard Oil', 'New', 12, '2023-01-19 19:10:45', '2023-01-29 16:56:40', '2023-01-19 19:52:54'),
(9, '2022-07-23', 'Cinamon Spice', '12', 'Alternative to liquid conditioner', 'Conditioner Bar', 'Approved', 12, '2023-01-19 19:12:10', '2023-01-29 16:56:40', NULL),
(10, '2022-12-05', 'Toffee Nut Swirl', '12', 'Super lathery, luxurious shampoo', 'Shampoo', 'Pending', 12, '2023-01-19 19:12:57', '2023-01-29 16:56:40', '2023-01-19 19:52:50'),
(11, '2022-10-11', 'Champagne', '12', 'Ultra sudsy solid bars', 'Soap Bar', 'Pending', 12, '2023-01-19 19:13:36', '2023-01-29 16:56:40', NULL),
(12, '2023-01-19', 'Goji & Acai Superfood', '12', 'High antioxidant content', 'Face Cream', 'New', 12, '2023-01-19 19:14:06', '2023-01-29 16:56:40', NULL),
(13, '2023-01-27', 'Cherry Vanilla', '18', 'Just testing', 'Soap', 'Pending', 18, '2023-01-29 12:39:38', '2023-01-29 12:43:57', '2023-01-29 12:43:57'),
(14, '2023-01-29', 'Vanilla', '18', 'Testing', 'Soap', 'New', 18, '2023-01-29 12:44:07', '2023-01-29 12:44:07', NULL),
(15, '2023-01-29', 'Testing', '18', 'Testing', 'Testing', 'New', 18, '2023-01-29 12:45:05', '2023-01-29 12:45:05', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula_ingredients`
--

INSERT INTO `tbl_formula_ingredients` (`f_ingredients_id`, `f_ingredients_formula`, `f_ingredients_ingredients`, `f_ingredients_qty`, `f_ingredients_phase`, `f_ingredients_instructions`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '100', 'Phase A', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do', 12, '2023-01-14 09:31:42', '2023-01-29 16:57:16', NULL),
(2, '5', '1', '2850', 'Phase A', 'Prepare a water bath over a medium heat. Measure and add water to a phase a heat resistant beaker. ', 12, '2023-01-19 19:29:45', '2023-01-29 16:57:16', NULL),
(3, '5', '12', '500', 'Phase A', 'Measure and add to phase a beaker. Place the beaker in the water bath to melt, and stir to incorporate.', 12, '2023-01-19 19:29:57', '2023-01-29 16:57:16', NULL),
(4, '5', '2', '200', 'Phase B', 'Measure and add ingredient to a phase b heat resistant beaker.', 12, '2023-01-19 19:30:09', '2023-01-29 16:57:16', NULL),
(5, '5', '13', '1000', 'Phase B', 'Measure and add to phase b beaker.', 12, '2023-01-19 19:30:21', '2023-01-29 16:57:16', NULL),
(6, '5', '5', '0', 'Phase C', 'Once the mixture has cooled down, measure and add ingredient to phase c beaker.', 12, '2023-01-19 19:30:34', '2023-01-29 16:57:16', NULL),
(7, '5', '14', '0.5', 'Phase C', 'Measure and add ingredient to phase c beaker.', 12, '2023-01-19 19:30:53', '2023-01-29 16:57:16', NULL),
(8, '5', '10', '350', 'Phase B', 'Measure and add to phase b beaker. Place the beaker in the water bath to melt, stirring to incorporate. Once both phase a and b beakers are at the same temperature, use an immersion blender to combine.', 12, '2023-01-19 19:31:16', '2023-01-29 16:57:16', NULL),
(9, '5', '6', '0.5', 'Phase C', 'Measure and add to phase b beaker. Then combine with mixture, stiring to incorporate.', 12, '2023-01-19 19:31:37', '2023-01-29 16:57:16', NULL),
(10, '7', '1', '100', 'Phase A', 'TBC', 12, '2023-01-19 19:44:39', '2023-01-29 16:57:16', NULL),
(11, '9', '1', '100', 'Phase A', 'TBC', 12, '2023-01-19 19:45:04', '2023-01-29 16:57:16', NULL),
(12, '13', 'Choose...', '100', 'Setup', 'N/A', 18, '2023-01-29 12:42:29', '2023-01-29 12:42:29', NULL),
(13, '13', 'Choose...', '', 'Preparation', 'Clean down the surface and put on an apron', 18, '2023-01-29 12:43:26', '2023-01-29 12:43:26', NULL),
(14, '15', '16', '0', 'Phase A', 'Test', 18, '2023-02-01 18:45:59', '2023-02-01 18:45:59', NULL),
(15, '15', '16', '800', 'Heating', 'Testing the instructions', 18, '2023-02-01 18:49:39', '2023-02-01 19:12:53', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 'Water', 'Agua', 'Water', '0', 12, '2023-01-14 08:26:36', '2023-01-29 16:53:43', NULL),
(2, '2023-01-19', 'Glyceryl Stearate & PEG-100 Stearate', 'Glyceryl Stearate & PEG-100 Stearate', 'Emulsifier', '4348', 12, '2023-01-19 18:56:33', '2023-01-29 16:54:31', NULL),
(3, '2023-01-19', 'Citric Acid', 'Citric Acid', 'Additives', '4870', 12, '2023-01-19 18:56:55', '2023-01-29 16:54:31', '2023-01-19 19:51:22'),
(4, '2023-01-19', 'Linalool', 'Linalool', 'Fragrance Oil', '215', 12, '2023-01-19 18:57:18', '2023-01-29 16:54:31', '2023-01-19 19:50:53'),
(5, '2023-01-19', 'Phenoxyethanol', 'Phenoxyethanol', 'Preservative', '1423', 12, '2023-01-19 18:57:38', '2023-01-29 16:54:31', NULL),
(6, '2023-01-19', 'Vitamin E', 'Tocopherol', 'Antioxidant', '117', 12, '2023-01-19 18:57:58', '2023-01-29 16:54:31', NULL),
(7, '2023-01-19', 'Limonene', 'Limonene', 'Fragrance Oil', '7310', 12, '2023-01-19 18:58:16', '2023-01-29 16:54:31', '2023-01-19 19:50:59'),
(8, '2023-01-19', 'Sodium Benzoate', 'Sodium Benzoate', 'Preservative', '630', 12, '2023-01-19 18:58:49', '2023-01-29 16:54:31', NULL),
(9, '2023-01-19', 'Potassium Sorbate', 'Potassium Sorbate', 'Preservative', '653', 12, '2023-01-19 18:59:52', '2023-01-29 16:54:31', '2023-01-19 19:50:50'),
(10, '2023-01-19', 'Cetearyl Alcohol', 'Cetearyl Alcohol', 'Thickener', '1330', 12, '2023-01-19 19:00:26', '2023-01-29 16:54:31', NULL),
(11, '2023-01-19', 'Propylene Glycol', 'Propylene Glycol', 'Moisturiser', '612', 12, '2023-01-19 19:01:36', '2023-01-29 16:54:31', '2023-01-19 19:50:48'),
(12, '2023-01-19', 'Vegetable Glycerin', 'Glycerine', 'Moisturiser', '224', 12, '2023-01-19 19:24:54', '2023-01-29 16:54:31', NULL),
(13, '2023-01-19', 'Macadamia Nut Oil', 'Macadamia Ternifolia Seed Oil', 'Carrier Oils', '0', 12, '2023-01-19 19:27:19', '2023-01-29 16:54:31', NULL),
(14, '2023-01-19', 'Benzoin Oil', 'Styrax Benzoin', 'Essential Oil', '485', 12, '2023-01-19 19:28:19', '2023-01-29 16:54:31', NULL),
(15, '2023-01-29', 'Water', 'Agua', 'Water', '1500', 18, '2023-01-29 12:21:18', '2023-01-29 12:39:02', '2023-01-29 12:39:02'),
(16, '2023-01-29', 'Water', 'Agua', 'Water', '0', 18, '2023-01-29 12:43:50', '2023-02-01 19:12:53', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients_batch`
--

INSERT INTO `tbl_ingredients_batch` (`ingredient_batch_id`, `ingredient_id`, `ingredient_batch_no`, `ingredient_batch_expiry`, `ingredient_batch_supplier_id`, `ingredient_batch_qty`, `user_id`, `invoice_file`, `date_added`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2150', '2023-03-15', 'CP Chemicals', '100', 12, 'Batch-_2023-01-14', '2023-01-14', '2023-01-14 08:27:14', '2023-01-21 18:15:43', NULL),
(2, 14, 'DSX723', '2023-03-16', 'Ingredient Store', '150', 12, 'Batch-_2023-03-16', '2023-01-21', '2023-01-21 18:15:35', '2023-01-21 18:15:35', NULL),
(3, 1, 'SPD-1242', '2023-01-04', 'Naturally Springs', '2500', 12, 'Batch-_2023-01-04', '2023-01-21', '2023-01-21 18:18:00', '2023-01-21 18:18:00', NULL),
(4, 10, 'JOIS9845', '2023-04-19', 'Cosmetic Superstore', '500', 12, 'Batch-_2023-04-19', '2023-01-21', '2023-01-21 18:18:48', '2023-01-21 18:18:48', NULL),
(5, 2, '884720', '2023-11-09', 'Makers Kitchen', '600', 12, 'Batch-_2023-11-09', '2023-01-21', '2023-01-21 18:19:24', '2023-01-21 18:19:24', NULL),
(6, 13, 'AC92863', '2023-06-30', 'Soap Makers', '1000', 12, 'Batch-_2023-06-30', '2023-01-21', '2023-01-21 18:20:04', '2023-01-21 18:20:04', NULL),
(7, 5, 'JHSWS', '2023-03-01', 'Natural Preservatives', '800', 12, 'Batch-_2023-03-01', '2023-01-21', '2023-01-21 18:20:33', '2023-01-21 18:20:33', NULL),
(8, 8, '75WD87662', '2023-05-24', 'CP Chemicals', '750', 12, 'Batch-_2023-05-24', '2023-01-21', '2023-01-21 18:21:19', '2023-01-21 18:21:19', NULL),
(9, 12, 'VGTQ121', '2023-06-23', 'Makers Kitchen', '500', 12, 'Batch-_2023-06-23', '2023-01-21', '2023-01-21 18:21:50', '2023-01-21 18:21:50', NULL),
(10, 6, '22457881', '2023-05-09', 'CP Chemicals', '1500', 12, 'Batch-_2023-05-09', '2023-01-21', '2023-01-21 18:22:30', '2023-01-21 18:22:30', NULL),
(11, 16, '1000', '2023-01-29', 'Ingredients', '10000', 18, 'Batch-_2023-01-29', '2023-01-29', '2023-01-29 13:04:41', '2023-01-29 13:04:41', NULL),
(12, 16, '2324', '2023-03-23', 'Water Co.', '1500', 18, 'IBN-16-2023-03-23', '2023-01-29', '2023-01-29 13:09:55', '2023-01-29 13:09:55', NULL);

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
  `manuf_product_status` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production`
--

INSERT INTO `tbl_manuf_production` (`manuf_product_id`, `manuf_product_date`, `manuf_product_formula`, `manuf_product_creator`, `manuf_product_qty`, `manuf_product_batch`, `manuf_product_status`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', '1', '12', '100', '1-2023-01-14-12', 'Produced', 12, '2023-01-14 09:50:09', '2023-01-29 16:57:46', '2023-01-14 10:02:00'),
(2, '2023-01-14', '1', '12', '100', '2-2023-01-14', 'Produced', 12, '2023-01-14 10:02:05', '2023-01-29 16:57:46', '2023-01-14 10:03:41'),
(3, '2023-01-14', '1', '12', '100', '3-2023-01-14', 'Produced', 12, '2023-01-14 10:03:45', '2023-01-29 16:57:46', '2023-01-19 19:16:30'),
(4, '2023-01-19', '5', '12', '5000', '4-2023-01-19', 'Produced', 12, '2023-01-19 19:16:38', '2023-01-29 16:57:46', NULL),
(5, '2023-01-19', '7', '12', '10000', '5-2023-01-19', 'Produced', 12, '2023-01-19 19:16:44', '2023-01-29 16:57:46', NULL),
(6, '2023-01-19', '9', '12', '4500', '6-2023-01-19', 'Produced', 12, '2023-01-19 19:16:55', '2023-01-29 16:57:46', NULL),
(7, '2023-01-29', '14', '18', '1000', 'TBC', 'In Progress', 18, '2023-01-29 12:49:23', '2023-02-01 19:00:24', '2023-02-01 19:00:24'),
(8, '2023-02-01', '15', '18', '100', '8-2023-02-01', 'Produced', 18, '2023-02-01 18:55:07', '2023-02-01 18:55:20', NULL),
(9, '2023-02-01', '14', '18', '100', 'X6AWS', 'In Progress', 18, '2023-02-01 19:00:09', '2023-02-01 19:00:23', '2023-02-01 19:00:23'),
(10, '2023-02-01', 'Choose...', '18', '1000', 'XTEST', 'In Progress', 18, '2023-02-01 19:00:30', '2023-02-01 19:00:30', NULL),
(11, '2023-02-01', '15', '18', '1000', '11-2023-02-01', 'Produced', 18, '2023-02-01 19:00:42', '2023-02-01 19:02:57', NULL),
(12, '2023-02-01', '15', '18', '1000', 'TESTINGTHIS', 'Produced', 18, '2023-02-01 19:12:43', '2023-02-01 19:12:53', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production_batch`
--

INSERT INTO `tbl_manuf_production_batch` (`manuf_production_batch_id`, `manuf_production_batch_production`, `manuf_production_batch_ingredients`, `manuf_production_batch_qty`, `production_batch_ingredient_batch`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '100.2', '1', 12, '2023-01-14 09:54:30', '2023-01-29 16:58:24', NULL),
(2, '2', '1', '100', '', 12, '2023-01-14 10:02:34', '2023-01-29 16:58:24', NULL),
(3, '3', '1', '100', '1', 12, '2023-01-14 10:03:52', '2023-01-29 16:58:24', NULL),
(4, '6', '1', '100', '1', 12, '2023-01-19 19:45:21', '2023-01-29 16:58:24', NULL),
(5, '5', '1', '100', '1', 12, '2023-01-19 19:45:36', '2023-01-29 16:58:24', NULL),
(6, '4', '1', '2850', '1', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:24', NULL),
(7, '4', '12', '500', '9', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:24', NULL),
(8, '4', '2', '200', '5', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:24', NULL),
(9, '4', '13', '1000', '6', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:24', NULL),
(10, '4', '10', '350', '4', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:25', NULL),
(11, '4', '5', '50', '7', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:25', NULL),
(12, '4', '14', '25', '2', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:25', NULL),
(13, '4', '6', '25', '10', 12, '2023-01-21 18:25:39', '2023-01-29 16:58:25', NULL),
(14, '8', '16', '8', '11', 18, '2023-02-01 18:55:20', '2023-02-01 18:55:20', NULL),
(15, '8', '16', '0', '11', 18, '2023-02-01 18:55:20', '2023-02-01 18:55:20', NULL),
(16, '11', '16', '80', '', 18, '2023-02-01 19:02:57', '2023-02-01 19:02:57', NULL),
(17, '11', '16', '0', '', 18, '2023-02-01 19:02:57', '2023-02-01 19:02:57', NULL),
(18, '12', '16', '800', '12', 18, '2023-02-01 19:12:53', '2023-02-01 19:12:53', NULL),
(19, '12', '16', '0', '11', 18, '2023-02-01 19:12:53', '2023-02-01 19:12:53', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_models`
--

INSERT INTO `tbl_models` (`models_id`, `models_date`, `models_name`, `models_qty`, `models_spend`, `models_revenue`, `models_profit`, `models_user`, `models_status`, `created_at`, `user_id`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 'Product A', 'TBC', 'TBC', 'TBC', 'TBC', 12, 'Completed', '2023-01-14 09:30:07', 12, '2023-01-29 16:58:34', NULL),
(2, '2023-01-29', 'Test Plan', 'TBC', 'TBC', 'TBC', 'TBC', 0, 'Completed', '2023-01-29 13:12:43', 18, '2023-01-29 13:16:46', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_models_manufacturing`
--

INSERT INTO `tbl_models_manufacturing` (`model_manufacturing_id`, `models_id`, `model_manufacturing_productionfee`, `model_manufacturing_deliveryfee`, `model_manufacturing_bottlingfee`, `models_igtp`, `models_pktp`, `models_pdtp`, `models_igkp`, `models_pkkp`, `models_pdkp`, `models_igup`, `models_pkup`, `models_pdup`, `model_ptp`, `user_id`) VALUES
(1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_models_marketing`
--

INSERT INTO `tbl_models_marketing` (`model_marketing_id`, `models_id`, `models_sales_pp`, `models_sales_tr`, `models_rrp`, `formu_id`, `models_li`, `user_id`) VALUES
(1, 1, 100, 5, '[\"13\"]', '[1]', 5, 12);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_models_overheads`
--

INSERT INTO `tbl_models_overheads` (`models_overheads_id`, `models_id`, `models_overheads_insurance`, `models_overheads_domain`, `models_overheads_hosting`, `models_overheads_gdpr`, `models_overheads_phone`, `models_overheads_mail`, `models_overheads_banking`, `models_overheads_tech`, `models_overheads_software`, `models_overheads_filing`, `models_overheads_ops_rate`, `models_overheads_ops_hours`, `models_overheads_ops_yearly`, `models_overheads_acc_rate`, `models_overheads_acc_hours`, `models_overheads_acc_yearly`, `models_overheads_coms_rate`, `models_overheads_coms_hours`, `models_overheads_coms_yearly`, `models_overheads_pub_rate`, `models_overheads_pub_hours`, `models_overheads_pub_yearly`, `models_overheads_yearly`, `models_overheads_quartely`, `models_overheads_monthly`, `models_overheads_daily`, `user_id`) VALUES
(1, 1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12),
(2, 2, 0, 0, 0, 0, 0, 0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_models_packaging`
--

INSERT INTO `tbl_models_packaging` (`model_package_id`, `models_id`, `models_packaging_container_size`, `models_packaging_container_qty`, `models_packaging_container_supplier`, `models_packaging_container_order`, `models_packaging_container_price`, `models_packaging_label_size`, `models_packaging_label_qty`, `models_packaging_label_supplier`, `models_packaging_label_order`, `models_packaging_label_price`, `models_packaging_shipping_size`, `models_packaging_shipping_qty`, `models_packaging_shipping_supplier`, `models_packaging_shipping_order`, `models_packaging_shipping_price`, `models_packaging_bags_size`, `models_packaging_bags_qty`, `models_packaging_bags_supplier`, `models_packaging_bags_order`, `models_packaging_bags_price`, `models_packaging_notes_size`, `models_packaging_notes_qty`, `models_packaging_notes_supplier`, `models_packaging_notes_order`, `models_packaging_notes_price`, `models_packaging_delivery_size`, `models_packaging_delivery_qty`, `models_packaging_delivery_supplier`, `models_packaging_delivery_order`, `models_packaging_delivery_price`, `user_id`) VALUES
(1, 1, '1', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, 12),
(2, 2, '100', 10, '0', 0, 1, 'Testing', 10, '0', 0, 1, 'Test', 10, '0', 0, 1, 'Test', 10, '0', 0, 1, 'Test', 10, '0', 0, 1, 'Test', 10, '0', 0, 1, 18);

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
  `stripe_subscription_id` varchar(250) NOT NULL,
  `stripe_subscription_status` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_password`, `stripe_customer_id`, `stripe_subscription_id`, `stripe_subscription_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Developer', 'Admin', 'Developer', '$2y$10$hbMq3Fqk67D9bo25AfdGoungz4etHSFaljh11dS9yR3Bvf.YPy1um', 'Developer', '0', 'Corporate', '2023-01-08 15:23:29', '2023-01-08 15:23:29', NULL),
(12, 'Nathan', 'Reid', 'nathanr', '$2y$10$PYbxbYpaaTR4BJujf2BPXuXA/A65ZWCfqcMqoh549kHtOE.Ra025a', 'cus_NG4YOoSbEzxOZG', 'sub_1MVYPBFcWMpKvcw6BAoQwFry', 'active', '2023-01-08 15:23:29', '2023-02-03 19:11:47', NULL),
(16, 'Mukaila Abdulakeem', 'Oladimeji', 'softdephjs@gmail.com', '$2y$10$I9ewfDa7xtdk2arLR1jLvuPLeQWp30w8KH4QRI7BtN16NEsZbPmoq', 'cus_NEa7D92STgp4pg', 'sub_1MU6xdFcWMpKvcw6Ka2hw1Kg', 'trialing', '2023-01-29 10:10:27', '2023-01-29 10:10:27', NULL),
(18, 'Nathan', 'Reid', 'contact@kleanaf.com', '$2y$10$JHg5dln0ONJchQwy9cKYKuhUkh41kp7RvUWSZWjI8dMHiW8Yo8mcq', 'cus_NG4YOoSbEzxOZG', 'sub_1MVYPBFcWMpKvcw6BAoQwFry', 'active', '2023-01-29 11:46:50', '2023-02-04 08:05:13', NULL),
(19, 'Nathaniel', 'Reid', 'nl.rd@outlook.com', '$2y$10$JPY2X.FtB7jcA9vuwi3Ypu.XVgQQ1FMUdPVv4jovBhlB9A5uUiM4K', 'cus_NG4OAnpTFN5Kwf', 'sub_1MVYG7FcWMpKvcw6KCQbMOSd', 'active', '2023-02-03 19:11:48', '2023-02-03 19:11:48', NULL),
(20, 'Nathaniel', 'Reid', 'nr.91@outlook.com', '$2y$10$AiwgrmGW7I23Z7cqiVnol.gXIpelD.fQwWT0OVA1dLkSBYuqRfy2.', 'cus_NI50wQ1XGacLZo', 'sub_1MXUqhFcWMpKvcw6BMkdVQ3n', 'trialing', '2023-02-03 20:12:03', '2023-02-03 20:12:03', NULL);

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
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  MODIFY `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  MODIFY `ingredient_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  MODIFY `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  MODIFY `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_models`
--
ALTER TABLE `tbl_models`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  MODIFY `model_manufacturing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  MODIFY `model_marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
