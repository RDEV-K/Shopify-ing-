-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 06, 2022 at 12:53 AM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infy_invoices`
--
CREATE DATABASE IF NOT EXISTS `infy_invoices` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `infy_invoices`;
--
-- Database: `invoice`
--
CREATE DATABASE IF NOT EXISTS `invoice` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `invoice`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Database: `invoices`
--
CREATE DATABASE IF NOT EXISTS `invoices` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `invoices`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Database: `kleanaf`
--
CREATE DATABASE IF NOT EXISTS `kleanaf` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kleanaf`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_budgets`
--

DROP TABLE IF EXISTS `tbl_budgets`;
CREATE TABLE IF NOT EXISTS `tbl_budgets` (
  `budgets_id` int(11) NOT NULL AUTO_INCREMENT,
  `budgets_date` date NOT NULL,
  `budgets_quarter` varchar(250) NOT NULL,
  `budgets_year` int(11) NOT NULL,
  `budgets_total` int(11) NOT NULL,
  `budgets_rd` int(11) NOT NULL,
  `budgets_mf` int(11) NOT NULL,
  `budgets_sm` int(11) NOT NULL,
  `budgets_cp` int(11) NOT NULL,
  PRIMARY KEY (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equipment`
--

DROP TABLE IF EXISTS `tbl_equipment`;
CREATE TABLE IF NOT EXISTS `tbl_equipment` (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_purchased` varchar(250) NOT NULL,
  `equipment_item` varchar(250) NOT NULL,
  `equipment_description` varchar(250) NOT NULL,
  `equipment_qty` varchar(250) NOT NULL,
  `equipment_price` varchar(250) NOT NULL,
  `equipment_supplier` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_equipment`
--

INSERT INTO `tbl_equipment` (`equipment_id`, `equipment_purchased`, `equipment_item`, `equipment_description`, `equipment_qty`, `equipment_price`, `equipment_supplier`, `invoice_file`) VALUES
(1, '2022-05-28', 'Stove', 'Stove ', '2', '25', '6', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

DROP TABLE IF EXISTS `tbl_expenses`;
CREATE TABLE IF NOT EXISTS `tbl_expenses` (
  `expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `expenses_date` date NOT NULL,
  `expenses_category` varchar(250) NOT NULL,
  `expenses_description` varchar(250) NOT NULL,
  `expenses_price` varchar(250) NOT NULL,
  `expenses_supplier` varchar(250) NOT NULL,
  `expenses_staff` varchar(250) NOT NULL,
  `expenses_status` varchar(250) NOT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_expenses`
--

INSERT INTO `tbl_expenses` (`expenses_id`, `expenses_date`, `expenses_category`, `expenses_description`, `expenses_price`, `expenses_supplier`, `expenses_staff`, `expenses_status`) VALUES
(1, '2021-09-22', 'Ingredients', 'Agua', '11.81', '4', '', ''),
(2, '2021-09-25', 'Ingredients', 'Mentha Piperita', '7.29', '13', '', ''),
(3, '2021-09-25', 'Ingredients', 'Melaleuca Alternifolia', '17.99', '13', '', ''),
(4, '2021-09-25', 'Ingredients', 'Cananga Odorata', '9.89', '13', '', ''),
(5, '2021-09-25', 'Ingredients', 'Zingiber Officinalis', '24.09', '13', '', ''),
(6, '0000-00-00', 'Ingredients', 'Lavandula Angustifolia', '16.99', '13', '', ''),
(7, '2021-09-25', 'Ingredients', 'Cedarus Atlantica', '13.49', '13', '', ''),
(8, '2022-05-28', 'Media', 'Labelling', '250', 'User Name', '', ''),
(9, '2022-05-28', 'Media', 'Advertising', '1', '8', '', ''),
(10, '2022-05-28', 'Equipment', 'Stove', '25', '6', '', ''),
(12, '2022-05-29', 'Media', 'Advertising', '100', '9', '', ''),
(13, '2022-05-29', 'Media', 'Advertising', '100', '9', '', ''),
(14, '2022-05-29', 'Media', 'Advertising', 'N/A', '9', '', ''),
(15, '2022-05-29', 'Bank Charges', 'Travel', '100', '20', '9', 'New'),
(16, '2022-06-02', 'Ingredient', 'Cedarus Atlantica', '300', '8', '', ''),
(17, '2022-06-02', 'Equipment', 'Stove', '599', '8', '', ''),
(18, '2022-06-02', 'Ingredient', 'Cedarus Atlantica', '352', '4', '', ''),
(19, '2022-06-02', 'Ingredient', 'Cedarus Atlantica', '750', '4', '', ''),
(20, '2022-06-02', 'Ingredient', 'Cedarus Atlantica', '50', '4', '', ''),
(21, '2022-06-02', 'Ingredient', '1', '1', '8', '', ''),
(22, '2022-06-02', 'Media', 'Advertising', '11', '12', '', ''),
(23, '2022-06-02', 'Media', 'Advertising', '111', '12', '', ''),
(24, '2022-06-02', 'Ingredients', 'tt', '100', '1', '', ''),
(25, '2022-06-10', 'Equipment', 'ttt', 'tt', '1', '', ''),
(26, '2022-06-03', 'Ingredient', '1', '11', '8', '', ''),
(27, '2022-06-03', 'Equipment', '1', '11', '8', '', ''),
(28, '2022-06-03', 'Ingredient', '1', '100', '8', '', ''),
(29, '2022-06-03', 'Equipment', '1', '190', '8', '', ''),
(30, '2022-06-04', 'Accountacy Fee', 'test', '100', '3', '12', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formula`
--

DROP TABLE IF EXISTS `tbl_formula`;
CREATE TABLE IF NOT EXISTS `tbl_formula` (
  `formula_id` int(11) NOT NULL AUTO_INCREMENT,
  `formula_date` varchar(250) NOT NULL,
  `formula_version` varchar(250) NOT NULL,
  `formula_creator` varchar(250) NOT NULL,
  `formula_comments` varchar(250) NOT NULL,
  `formula_rdplan` varchar(250) NOT NULL,
  `formula_status` varchar(250) NOT NULL,
  `formula_qa_1` varchar(250) NOT NULL,
  `formula_qa_2` varchar(250) NOT NULL,
  PRIMARY KEY (`formula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula`
--

INSERT INTO `tbl_formula` (`formula_id`, `formula_date`, `formula_version`, `formula_creator`, `formula_comments`, `formula_rdplan`, `formula_status`, `formula_qa_1`, `formula_qa_2`) VALUES
(1, '2022-05-15', 'Tea Tree', 'Test', 'Tea Tree Edititon of shower gel', '1', 'Approved', '', ''),
(3, '2022-05-28', 'Lust', '8', 'Lust is the sensual version of the body wash', '4', 'Approved', '', ''),
(4, '2022-05-28', 'Boost', '8', 'New citrus version for the bodywash', '4', 'Pending', '', ''),
(6, '2022-06-02', 'Body', '12', '1111', '5', 'Approved', '1654336391_5dcb92573f75d6949563.svg', '1654336391_1c81dd2cc4873cdef003.svg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formula_ingredients`
--

DROP TABLE IF EXISTS `tbl_formula_ingredients`;
CREATE TABLE IF NOT EXISTS `tbl_formula_ingredients` (
  `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_ingredients_formula` varchar(250) NOT NULL,
  `f_ingredients_ingredients` varchar(250) NOT NULL,
  `f_ingredients_qty` varchar(250) NOT NULL,
  `f_ingredients_phase` varchar(250) NOT NULL,
  `f_ingredients_instructions` varchar(250) NOT NULL,
  PRIMARY KEY (`f_ingredients_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula_ingredients`
--

INSERT INTO `tbl_formula_ingredients` (`f_ingredients_id`, `f_ingredients_formula`, `f_ingredients_ingredients`, `f_ingredients_qty`, `f_ingredients_phase`, `f_ingredients_instructions`) VALUES
(1, '1', '3', '50', 'Phase A', 'Add to beaker'),
(2, '1', '1', '50', 'Phase B', 'Add to Phase A beaker'),
(3, '3', '1', '55', 'Phase A', 'Add to beaker'),
(4, '3', '3', '10', 'Phase B', 'Add to Beaker'),
(5, '3', '5', '30', 'Phase C', 'Add to Beaker'),
(6, '3', '7', '5', 'Phase A', 'Add to Beaker'),
(7, '4', '1', '500', 'Phase A', 'add to beaker a'),
(8, '5', '1', '50', 'Phase A', '111112'),
(10, '6', '1', '100', 'Phase A', '100');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredients`
--

DROP TABLE IF EXISTS `tbl_ingredients`;
CREATE TABLE IF NOT EXISTS `tbl_ingredients` (
  `ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_date` date NOT NULL,
  `ingredient_name` varchar(250) NOT NULL,
  `ingredient_inci` varchar(250) NOT NULL,
  `ingredient_category` varchar(250) NOT NULL,
  `ingredient_qty` varchar(250) NOT NULL,
  `ingredient_price` varchar(250) NOT NULL,
  `ingredient_supplier` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `ingredient_price`, `ingredient_supplier`, `invoice_file`) VALUES
(1, '2021-09-22', 'Distilled Water', 'Agua', 'Base', '2', '11.81', '4', ''),
(2, '2021-09-25', 'Peppermint Essential Oil', 'Mentha Piperita', 'Essential Oil', '2', '7.29', '13', ''),
(3, '2021-09-25', 'Tea Tree Essential Oil', 'Melaleuca Alternifolia', 'Essential Oil', '3', '17.99', '13', ''),
(4, '2021-09-25', 'Ylang Ylang Essential Oil', 'Cananga Odorata', 'Essential Oil', '4', '9.89', '13', ''),
(5, '2021-09-25', 'Ginger Essential Oil', 'Zingiber Officinalis', 'Essential Oil', '5', '24.09', '13', ''),
(6, '0000-00-00', 'Lavender Essential Oil', 'Lavandula Angustifolia', 'Essential Oil', '2', '16.99', '13', ''),
(7, '2021-09-25', 'Cedarwood Essential Oil', 'Cedarus Atlantica', 'Essential Oil', '5', '13.49', '13', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production`
--

DROP TABLE IF EXISTS `tbl_manuf_production`;
CREATE TABLE IF NOT EXISTS `tbl_manuf_production` (
  `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `manuf_product_date` varchar(250) NOT NULL,
  `manuf_product_formula` varchar(250) NOT NULL,
  `manuf_product_creator` varchar(250) NOT NULL,
  `manuf_product_qty` varchar(250) NOT NULL,
  `manuf_product_batch` varchar(250) NOT NULL,
  `manuf_product_status` varchar(250) NOT NULL,
  PRIMARY KEY (`manuf_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production`
--

INSERT INTO `tbl_manuf_production` (`manuf_product_id`, `manuf_product_date`, `manuf_product_formula`, `manuf_product_creator`, `manuf_product_qty`, `manuf_product_batch`, `manuf_product_status`) VALUES
(1, '2022-05-15', '1', 'Nathan', '1000', '1-2022-05-15-Nathan', 'Produced'),
(2, '2022-05-28', '3', '8', '1500', '2-2022-05-28-8', 'Produced'),
(3, '2022-06-02', '3', '12', '500', 'TBC', 'In Progress'),
(5, '2022-06-02', '6', '12', '1000', '5-2022-06-02-12', 'Produced');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production_batch`
--

DROP TABLE IF EXISTS `tbl_manuf_production_batch`;
CREATE TABLE IF NOT EXISTS `tbl_manuf_production_batch` (
  `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `manuf_production_batch_production` varchar(250) NOT NULL,
  `manuf_production_batch_ingredients` varchar(250) NOT NULL,
  `manuf_production_batch_qty` varchar(250) NOT NULL,
  PRIMARY KEY (`manuf_production_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production_batch`
--

INSERT INTO `tbl_manuf_production_batch` (`manuf_production_batch_id`, `manuf_production_batch_production`, `manuf_production_batch_ingredients`, `manuf_production_batch_qty`) VALUES
(1, '1', '3', '505'),
(2, '1', '1', '500'),
(3, '2', '1', '825'),
(4, '2', '7', '75'),
(5, '2', '3', '150'),
(6, '2', '5', '450'),
(7, '5', '1', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marketing`
--

DROP TABLE IF EXISTS `tbl_marketing`;
CREATE TABLE IF NOT EXISTS `tbl_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_date` varchar(250) NOT NULL,
  `marketing_platform` varchar(250) NOT NULL,
  `marketing_budget` varchar(250) NOT NULL,
  `marketing_start` varchar(250) NOT NULL,
  `marketing_end` varchar(250) NOT NULL,
  `marketing_duration` varchar(250) NOT NULL,
  `marketing_outcome` varchar(250) NOT NULL,
  `marketing_target` varchar(250) NOT NULL,
  `marketing_details` varchar(250) NOT NULL,
  `marketing_status` varchar(250) NOT NULL,
  `marketing_result` varchar(250) NOT NULL,
  `marketing_creator` varchar(250) NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_marketing`
--

INSERT INTO `tbl_marketing` (`marketing_id`, `marketing_date`, `marketing_platform`, `marketing_budget`, `marketing_start`, `marketing_end`, `marketing_duration`, `marketing_outcome`, `marketing_target`, `marketing_details`, `marketing_status`, `marketing_result`, `marketing_creator`) VALUES
(1, '28/05/2022', 'Facebook', '150', '2022-05-02', '2022-05-28', '27', 'Conversions', '500', 'Roas 3', 'New', 'TBC', ''),
(2, '28/05/2022', 'Facebook', '100', '2022-05-07', '2022-06-04', '29', 'Conversions', '300', 'Target a roas of 3', 'New', 'TBC', 'New'),
(3, '28/05/2022', 'Facebook', '100', '2022-05-01', '2022-05-30', '30', 'Conversions', '300', 'Target roas of 3', 'New', 'TBC', 'New'),
(4, '28/05/2022', 'Facebook', '100', '2022-05-01', '2022-05-30', '30', 'Conversions', '300', 'Target a roas of 3', 'New', 'TBC', '8');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_policies`
--

DROP TABLE IF EXISTS `tbl_policies`;
CREATE TABLE IF NOT EXISTS `tbl_policies` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_title` varchar(255) NOT NULL,
  `policy_effective_date` date NOT NULL,
  `policy_creator` varchar(255) NOT NULL,
  PRIMARY KEY (`policy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_policies`
--

INSERT INTO `tbl_policies` (`policy_id`, `policy_title`, `policy_effective_date`, `policy_creator`) VALUES
(8, 'Safety Policies&nbsp;  ', '2022-06-05', '12'),
(7, 'PersonnelPolicies ', '2022-06-05', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_processes`
--

DROP TABLE IF EXISTS `tbl_processes`;
CREATE TABLE IF NOT EXISTS `tbl_processes` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_title` varchar(255) NOT NULL,
  `process_effective_date` date NOT NULL,
  `process_creator` varchar(255) NOT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_processes`
--

INSERT INTO `tbl_processes` (`process_id`, `process_title`, `process_effective_date`, `process_creator`) VALUES
(2, 'Research &amp; Development Proceed&nbsp;', '2022-06-05', '12'),
(3, 'Corporate Process', '2022-06-05', '12'),
(5, 'Manufacturing Process', '2022-06-05', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_log`
--

DROP TABLE IF EXISTS `tbl_rd_log`;
CREATE TABLE IF NOT EXISTS `tbl_rd_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` date NOT NULL,
  `log_product` varchar(250) NOT NULL,
  `log_outcome` varchar(250) NOT NULL,
  `log_comments` varchar(250) NOT NULL,
  `log_method` varchar(250) NOT NULL,
  `log_ratios` varchar(250) NOT NULL,
  `log_user` varchar(250) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_log`
--

INSERT INTO `tbl_rd_log` (`log_id`, `log_date`, `log_product`, `log_outcome`, `log_comments`, `log_method`, `log_ratios`, `log_user`) VALUES
(1, '2022-05-28', '3', 'Success', 'Success', 'N/A', 'N/A', '8'),
(2, '2022-05-29', '3', 'Fail', 'Test', 'N/A', 'N/A', '9'),
(5, '2022-06-02', '7', 'Success', 'N/A', 'N/A', 'N/A', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_media`
--

DROP TABLE IF EXISTS `tbl_rd_media`;
CREATE TABLE IF NOT EXISTS `tbl_rd_media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_date` date NOT NULL,
  `media_category` varchar(250) NOT NULL,
  `media_creator` varchar(250) NOT NULL,
  `media_product` varchar(250) NOT NULL,
  `media_comments` varchar(250) NOT NULL,
  `media_cost` varchar(250) NOT NULL,
  `media_status` varchar(250) NOT NULL,
  `media_file` varchar(250) NOT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_media`
--

INSERT INTO `tbl_rd_media` (`media_id`, `media_date`, `media_category`, `media_creator`, `media_product`, `media_comments`, `media_cost`, `media_status`, `media_file`) VALUES
(2, '2022-05-28', 'Advertising', 'User Name', '3', 'New label', '1', 'New', 'coa_-_btms_225_-_27263.pdf'),
(3, '2022-05-29', 'Advertising', 'User Name', '3', 'Test', '100', 'Pending', 'coa_-_btms_225_-_27264.pdf'),
(4, '2022-05-29', 'Advertising', 'User Name', '3', 'N/A', '100', 'Approved', 'coa_-_btms_225_-_27265.pdf'),
(5, '2022-05-29', 'Advertising', '9', '3', 'N/A', 'N/A', 'Pending', 'WhatsApp Image 2022-05-28 at 11.31.51 AM.jpeg'),
(7, '2022-06-02', 'Advertising', '12', '6', 'N/A', '111', 'New', 'CoA - LHM02112020.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_plan`
--

DROP TABLE IF EXISTS `tbl_rd_plan`;
CREATE TABLE IF NOT EXISTS `tbl_rd_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_date` varchar(250) NOT NULL,
  `plan_user` varchar(250) NOT NULL,
  `plan_title` varchar(250) NOT NULL,
  `plan_description` varchar(250) NOT NULL,
  `plan_status` varchar(250) NOT NULL,
  `plan_file` varchar(250) NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_plan`
--

INSERT INTO `tbl_rd_plan` (`plan_id`, `plan_date`, `plan_user`, `plan_title`, `plan_description`, `plan_status`, `plan_file`) VALUES
(5, '2022-06-02', '12', 'test', 'ttt', 'Approved', '1654336739_4e2be3c4606ce99c0bb7.pdf'),
(6, '2022-06-03', '12', 'this', 'si', 'New', '1654336648_ff791275168d648d7380.png'),
(7, '2022-06-03', '12', 'Not', 'this', 'New', '1654336610_51796cdb4cc5aab3e692.svg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production`
--

DROP TABLE IF EXISTS `tbl_rd_production`;
CREATE TABLE IF NOT EXISTS `tbl_rd_production` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_date` varchar(250) NOT NULL,
  `product_formula` varchar(250) NOT NULL,
  `product_creator` varchar(250) NOT NULL,
  `product_qty` varchar(250) NOT NULL,
  `product_batch` varchar(250) NOT NULL,
  `product_status` varchar(250) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production`
--

INSERT INTO `tbl_rd_production` (`product_id`, `product_date`, `product_formula`, `product_creator`, `product_qty`, `product_batch`, `product_status`) VALUES
(1, '2022-05-15', '1', 'Test', '1000', '1-2022-05-15-Test', 'Produced'),
(2, '2022-05-15', '1', 'Test', '1000', '2-2022-05-15-Test', 'Produced'),
(3, '2022-05-28', '3', '8', '5000', '3-2022-05-28-8', 'Produced'),
(4, '2022-05-28', '3', '8', '7500', 'TBC', 'In Progress'),
(5, '2022-06-02', '3', '12', '11', 'TBC', 'In Progress'),
(7, '2022-06-02', '6', '12', '400', '7-2022-06-02-12', 'Produced'),
(8, '2022-06-02', '6', '12', '100', '8-2022-06-02-12', 'Produced');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production_batch`
--

DROP TABLE IF EXISTS `tbl_rd_production_batch`;
CREATE TABLE IF NOT EXISTS `tbl_rd_production_batch` (
  `production_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `production_batch_production` varchar(250) NOT NULL,
  `production_batch_ingredients` varchar(250) NOT NULL,
  `production_batch_qty` varchar(250) NOT NULL,
  PRIMARY KEY (`production_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production_batch`
--

INSERT INTO `tbl_rd_production_batch` (`production_batch_id`, `production_batch_production`, `production_batch_ingredients`, `production_batch_qty`) VALUES
(1, '1', '3', '500'),
(2, '1', '1', '500'),
(3, '2', '3', '550'),
(4, '2', '1', '500'),
(5, '3', '1', '2750'),
(6, '3', '7', '250'),
(7, '3', '3', '500'),
(8, '3', '5', '1500'),
(9, '7', '1', '400'),
(10, '8', '1', '100');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck`
--

DROP TABLE IF EXISTS `tbl_stockcheck`;
CREATE TABLE IF NOT EXISTS `tbl_stockcheck` (
  `stockcheck_id` int(11) NOT NULL AUTO_INCREMENT,
  `stockcheck_date` varchar(250) NOT NULL,
  `stockcheck_checker` varchar(250) NOT NULL,
  `stockcheck_status` varchar(250) NOT NULL,
  PRIMARY KEY (`stockcheck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck`
--

INSERT INTO `tbl_stockcheck` (`stockcheck_id`, `stockcheck_date`, `stockcheck_checker`, `stockcheck_status`) VALUES
(1, '2022-05-28', '8', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery`
--

DROP TABLE IF EXISTS `tbl_stockcheck_delivery`;
CREATE TABLE IF NOT EXISTS `tbl_stockcheck_delivery` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_date` varchar(250) NOT NULL,
  `delivery_supplier` varchar(250) NOT NULL,
  `delivery_logger` varchar(250) NOT NULL,
  `delivery_price` varchar(250) NOT NULL,
  `delivery_fee` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery`
--

INSERT INTO `tbl_stockcheck_delivery` (`delivery_id`, `delivery_date`, `delivery_supplier`, `delivery_logger`, `delivery_price`, `delivery_fee`, `invoice_file`) VALUES
(2, '2022-06-02', '8', '12', '45', '15', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery_items`
--

DROP TABLE IF EXISTS `tbl_stockcheck_delivery_items`;
CREATE TABLE IF NOT EXISTS `tbl_stockcheck_delivery_items` (
  `delivery_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` varchar(250) NOT NULL,
  `delivery_item_qty` varchar(250) NOT NULL,
  `delivery_item_category` varchar(250) NOT NULL,
  `delivery_equipment_item` varchar(250) NOT NULL,
  `delivery_ingredient_item` varchar(250) NOT NULL,
  `delivery_item_date` datetime NOT NULL,
  `delivery_item_price` varchar(250) NOT NULL,
  PRIMARY KEY (`delivery_items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery_items`
--

INSERT INTO `tbl_stockcheck_delivery_items` (`delivery_items_id`, `delivery_id`, `delivery_item_qty`, `delivery_item_category`, `delivery_equipment_item`, `delivery_ingredient_item`, `delivery_item_date`, `delivery_item_price`) VALUES
(1, '1', '9598', 'Ingredient', '', '1', '2022-05-28 08:06:07', ''),
(2, '1', '5', 'Equipment', '1', '', '2022-05-28 08:07:09', ''),
(3, '1', '100', 'Ingredient', '', '6', '2022-06-02 12:54:09', ''),
(13, '2', '10', 'Equipment', '1', '', '2022-06-02 19:56:16', '599'),
(14, '1', '999999', 'Ingredient', '', '1', '2022-06-02 19:57:58', '352'),
(15, '1', '321', 'Ingredient', '', '1', '2022-06-02 19:58:42', '750'),
(16, '1', '7', 'Ingredient', '', '1', '2022-06-02 19:59:22', '50'),
(19, '2', '11', 'Ingredient', '', '1', '2022-06-03 01:22:10', '11'),
(20, '2', '11', 'Equipment', '1', '', '2022-06-03 01:22:15', '11'),
(21, '2', '100', 'Ingredient', '', '1', '2022-06-03 01:26:58', '100'),
(22, '2', '100', 'Equipment', '1', '', '2022-06-03 01:27:05', '190');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_policies`
--

DROP TABLE IF EXISTS `tbl_sub_policies`;
CREATE TABLE IF NOT EXISTS `tbl_sub_policies` (
  `p_sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `policy_id` int(11) NOT NULL,
  `p_sub_title` varchar(45) NOT NULL,
  `p_sub_date` varchar(45) NOT NULL,
  `p_sub_file` varchar(5000) NOT NULL,
  `delete_at` datetime NOT NULL,
  PRIMARY KEY (`p_sub_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sub_policies`
--

INSERT INTO `tbl_sub_policies` (`p_sub_id`, `policy_id`, `p_sub_title`, `p_sub_date`, `p_sub_file`, `delete_at`) VALUES
(4, 7, 'Disciplinary Action', '2022-06-05', '', '0000-00-00 00:00:00'),
(5, 7, 'Employee Complaints', '2022-06-05', '', '0000-00-00 00:00:00'),
(7, 7, 'Recruitment', '2022-06-05', '', '0000-00-00 00:00:00'),
(8, 7, 'Equality & Diversity', '2022-06-05', '', '0000-00-00 00:00:00'),
(9, 8, 'Workplace Health & Safety', '2022-06-05', '', '0000-00-00 00:00:00'),
(10, 8, 'Manufacturing Health & Safety', '2022-06-05', '1654447927_0829e1bb459679566d92.pdf', '0000-00-00 00:00:00'),
(11, 8, 'Home Working', '2022-06-05', '', '0000-00-00 00:00:00'),
(12, 9, 'Find the value of x? in the equation', '2022-06-05', '1654461333_ccf9ff63f7104b446943.pdf', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_processes`
--

DROP TABLE IF EXISTS `tbl_sub_processes`;
CREATE TABLE IF NOT EXISTS `tbl_sub_processes` (
  `pr_sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` varchar(255) NOT NULL,
  `pr_sub_title` varchar(255) NOT NULL,
  `pr_sub_file` varchar(5000) NOT NULL,
  `delete_at` datetime NOT NULL,
  `pr_sub_date` varchar(45) NOT NULL,
  PRIMARY KEY (`pr_sub_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sub_processes`
--

INSERT INTO `tbl_sub_processes` (`pr_sub_id`, `process_id`, `pr_sub_title`, `pr_sub_file`, `delete_at`, `pr_sub_date`) VALUES
(1, '2', 'Create Research & Development Plan', '1654468841_14acf20d9d46d188da42.pdf', '0000-00-00 00:00:00', '2022-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

DROP TABLE IF EXISTS `tbl_suppliers`;
CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(250) NOT NULL,
  `supplier_location` varchar(250) NOT NULL,
  `supplier_category` varchar(250) NOT NULL,
  `supplier_eco` varchar(250) NOT NULL,
  `supplier_products` varchar(250) NOT NULL,
  `supplier_pricing` varchar(250) NOT NULL,
  `supplier_documents` varchar(250) NOT NULL,
  `supplier_delivery` varchar(250) NOT NULL,
  `supplier_service` varchar(250) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`supplier_id`, `supplier_name`, `supplier_location`, `supplier_category`, `supplier_eco`, `supplier_products`, `supplier_pricing`, `supplier_documents`, `supplier_delivery`, `supplier_service`) VALUES
(1, 'Ionos', 'ionos.co.uk', 'Other', '1', '5', '5', '5', '5', '4'),
(2, 'Envato', 'envato.com', 'Other', '1', '1', '3', '5', '5', '5'),
(3, 'Fiverr', 'fiverr.com', 'Other', '1', '4', '5', '5', '5', '4'),
(4, 'APC', 'apcpure.com', 'Ingredients', '1', '3', '5', '5', '3', '5'),
(5, 'Mystic Moments', 'mysticmomentsuk.com', 'Ingredients', '2', '3', '3', '5', '5', '3'),
(6, 'eBay', 'ebay.co.uk', 'Other', '1', '4', '5', '1', '3', '3'),
(7, 'The Soapery', 'thesoapery.co.uk', 'Ingredients', '5', '4', '5', '2', '5', '5'),
(8, 'Naturally Thinking', 'naturallythinking.com', 'Ingredients', '5', '5', '4', '4', '4', '5'),
(9, 'The Soap Kitchen', 'thesoapkitchen.co.uk', 'Ingredients', '2', '2', '3', '5', '1', '5'),
(10, 'Makers Ingredients', 'www.makersingredients.com', 'Ingredients', '2', '2', '1', '5', '1', '5'),
(11, 'Gracefruit', 'www.gracefruit.com', 'Ingredients', '1', '1', '3', '4', '2', '5'),
(12, 'Wilko', 'wilko.com', 'Equipment', '1', '3', '4', '5', '5', '5'),
(13, 'Freshskin', 'freshskin.co.uk', 'Ingredients', '3', '5', '5', '5', '5', '5'),
(14, 'Ampulla', 'ampulla.co.uk', 'Other', '1', '2', '4', '5', '1', '5'),
(15, 'Hobbycraft', 'hobbycraft.co.uk', 'Equipment', '1', '2', '3', '5', '5', '5'),
(16, 'Amazon', 'amazon.co.uk', 'Equipment', '2', '3', '3', '2', '5', '5'),
(17, 'Poundland', 'poundland.co.uk', 'Equipment', '1', '2', '5', '1', '5', '5'),
(18, 'iBottles', 'ibottles.co.uk', 'Other', '1', '4', '4', '4', '2', '5'),
(19, 'Home Bargins', 'homebargins.co.uk', 'Other', '1', '1', '4', '1', '5', '5'),
(20, 'Aldi', 'aldi.co.uk', 'Other', '1', '1', '3', '1', '5', '5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_first_name` varchar(50) NOT NULL,
  `staff_last_name` varchar(50) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_password` varchar(50) NOT NULL,
  `staff_role` varchar(50) NOT NULL,
  `staff_department` varchar(250) NOT NULL,
  `staff_level` varchar(250) NOT NULL,
  `staff_phone` varchar(250) NOT NULL,
  `staff_bio` varchar(250) NOT NULL,
  `staff_image` varchar(250) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`staff_id`, `staff_first_name`, `staff_last_name`, `staff_email`, `staff_password`, `staff_role`, `staff_department`, `staff_level`, `staff_phone`, `staff_bio`, `staff_image`) VALUES
(5, 'Nathan', 'Reid', 'nathan.reid@kleanaf.com', '123456', 'CEO', 'All Access', 'Authorisor', '', '', ''),
(8, 'Test', 'User', 'test@kleanaf.com', '123456', 'Accountant', 'Corporate', 'Editor', '', '', ''),
(9, 'Rochelle', 'Saunders', 'rsaunders@kleanaf.com', '123456', 'Administrator', 'Research & Development', 'Contributor', '', '', ''),
(10, 'Authorisor', 'Test', 'auth@kleanaf.com', '', 'Manager', 'All Access', 'Authorisor', '', '', ''),
(11, 'Test1', 'User', 'test1@kleanaf.com', '123456', 'Accountant', 'Corporate', 'Authorisor', '', '', 'image1.jpeg'),
(12, 'Nathan', 'Reid', 'nathanr@kleanaf.com', '000000', 'CEO', 'All Access', 'Authorisor', '', '', 'Nathan.jpg');
--
-- Database: `kleanaf1`
--
CREATE DATABASE IF NOT EXISTS `kleanaf1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kleanaf1`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_budgets`
--

DROP TABLE IF EXISTS `tbl_budgets`;
CREATE TABLE IF NOT EXISTS `tbl_budgets` (
  `budgets_id` int(11) NOT NULL AUTO_INCREMENT,
  `budgets_date` date NOT NULL,
  `budgets_quarter` varchar(250) NOT NULL,
  `budgets_year` int(11) NOT NULL,
  `budgets_total` int(11) NOT NULL,
  `budgets_rd` int(11) NOT NULL,
  `budgets_mf` int(11) NOT NULL,
  `budgets_sm` int(11) NOT NULL,
  `budgets_cp` int(11) NOT NULL,
  PRIMARY KEY (`budgets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_budgets`
--

INSERT INTO `tbl_budgets` (`budgets_id`, `budgets_date`, `budgets_quarter`, `budgets_year`, `budgets_total`, `budgets_rd`, `budgets_mf`, `budgets_sm`, `budgets_cp`) VALUES
(2, '2022-04-12', 'Q1', 2022, 950, 200, 500, 150, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equipment`
--

DROP TABLE IF EXISTS `tbl_equipment`;
CREATE TABLE IF NOT EXISTS `tbl_equipment` (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_purchased` varchar(250) NOT NULL,
  `equipment_item` varchar(250) NOT NULL,
  `equipment_description` varchar(250) NOT NULL,
  `equipment_qty` varchar(250) NOT NULL,
  `equipment_price` varchar(250) NOT NULL,
  `equipment_supplier` varchar(250) NOT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_equipment`
--

INSERT INTO `tbl_equipment` (`equipment_id`, `equipment_purchased`, `equipment_item`, `equipment_description`, `equipment_qty`, `equipment_price`, `equipment_supplier`) VALUES
(4, '2022-05-11', 'Citric', 'Adding to Orange Cyrup', '527', '20', '3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

DROP TABLE IF EXISTS `tbl_expenses`;
CREATE TABLE IF NOT EXISTS `tbl_expenses` (
  `expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `expenses_date` date NOT NULL,
  `expenses_category` varchar(250) NOT NULL,
  `expenses_description` varchar(250) NOT NULL,
  `expenses_price` varchar(250) NOT NULL,
  `expenses_supplier` varchar(250) NOT NULL,
  `expenses_staff` varchar(250) NOT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_expenses`
--

INSERT INTO `tbl_expenses` (`expenses_id`, `expenses_date`, `expenses_category`, `expenses_description`, `expenses_price`, `expenses_supplier`, `expenses_staff`) VALUES
(3, '2022-04-23', 'Entertainment', 'Manicure x 3', '20', '1', ''),
(4, '2022-04-13', 'Accountacy Fee', 'Yearly Accountant Fee', '100', '1', ''),
(5, '0000-00-00', 'Ingredients', 'Antioxidant', '17.99', '1', ''),
(6, '0000-00-00', 'Ingredients', 'Kokum Butter', '40', '2', ''),
(7, '2022-04-29', 'Ingredients', 'Printer', '40', '2', ''),
(8, '2022-05-07', 'Ingredients', 'Cetyl Alcohol', '30', '1', ''),
(9, '2022-05-13', 'Ingredients', 'Kokum', '20', '1', ''),
(10, '0000-00-00', 'Media', 'Advertising', '75', 'User Name', ''),
(11, '0000-00-00', 'Media', 'Advertising', '75', 'User Name', ''),
(12, '0000-00-00', 'Media', 'Mock Up', '12', 'User Name', ''),
(13, '2022-05-07', 'Media', 'Advertising', '12', 'User Name', ''),
(14, '2022-05-08', 'Media', 'Advertising', '10', 'User Name', ''),
(15, '2022-05-11', 'Equipment', 'Citric', '20', '3', ''),
(16, '2022-05-14', 'Media', 'Social Media', '', 'User Name', ''),
(17, '2022-05-14', 'Media', 'Mock Up', '90', 'User Name', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formula`
--

DROP TABLE IF EXISTS `tbl_formula`;
CREATE TABLE IF NOT EXISTS `tbl_formula` (
  `formula_id` int(11) NOT NULL AUTO_INCREMENT,
  `formula_date` varchar(250) NOT NULL,
  `formula_version` varchar(250) NOT NULL,
  `formula_creator` varchar(250) NOT NULL,
  `formula_comments` varchar(250) NOT NULL,
  `formula_rdplan` varchar(250) NOT NULL,
  `formula_status` varchar(250) NOT NULL,
  PRIMARY KEY (`formula_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula`
--

INSERT INTO `tbl_formula` (`formula_id`, `formula_date`, `formula_version`, `formula_creator`, `formula_comments`, `formula_rdplan`, `formula_status`) VALUES
(6, '27/04/2022', 'Chocolate Vanilla', 'Nathan', 'Testing for lip balm ', '4', 'New'),
(7, '28/04/2022', '24-Hour Fresh', 'Nathan', 'Trial formula for a 24-hour fresh deodrant', '6', 'New'),
(8, '28/04/2022', 'Wild Citrus and Waterlily', 'Nathan', 'New formula for hand wash', '7', 'New'),
(9, '2022-05-07', 'Sweet Orange', 'Nathan', 'New Formula for Orange', '3', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_formula_ingredients`
--

DROP TABLE IF EXISTS `tbl_formula_ingredients`;
CREATE TABLE IF NOT EXISTS `tbl_formula_ingredients` (
  `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_ingredients_formula` varchar(250) NOT NULL,
  `f_ingredients_ingredients` varchar(250) NOT NULL,
  `f_ingredients_qty` varchar(250) NOT NULL,
  `f_ingredients_phase` varchar(250) NOT NULL,
  `f_ingredients_instructions` varchar(250) NOT NULL,
  PRIMARY KEY (`f_ingredients_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula_ingredients`
--

INSERT INTO `tbl_formula_ingredients` (`f_ingredients_id`, `f_ingredients_formula`, `f_ingredients_ingredients`, `f_ingredients_qty`, `f_ingredients_phase`, `f_ingredients_instructions`) VALUES
(8, '3', '1', '10', 'Phase C', 'Add in and heat'),
(9, '3', '1', '50', 'Phase A', '123456'),
(12, '6', '1', '55', 'Phase A', 'Add to beaker and set aside'),
(13, '5', '1', '50', 'Phase A', '23'),
(14, '5', '1', '50', 'Phase A', 'Add to beaker'),
(18, '7', '1', '50', 'Phase A', 'Measure and add to beaker'),
(19, '7', '1', '50', 'Phase B', 'Measure and add to Phase A Beaker'),
(20, '7', '5', '5', 'Phase A', 'Add to water in beaker and mix until fully dissolved'),
(21, '7', '4', '25', 'Phase B', 'Add to agua in Phase B and mix slowly until fully incorporated'),
(22, '8', '1', '50', 'Phase A', 'add water to beaker'),
(23, '8', '4', '25', 'Phase B', 'measure and add to phase a beaker'),
(24, '8', '1', '20', 'Phase C', 'add to a new beaker'),
(25, '8', '3', '5', 'Phase C', 'add to phase c beaker. then once dissolved add phase c beaker to phase a'),
(26, '9', '2', '39', 'Phase A', 'Weigh and add to beaker'),
(27, '9', '4', '800', 'Phase B', 'Fulunani');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredients`
--

DROP TABLE IF EXISTS `tbl_ingredients`;
CREATE TABLE IF NOT EXISTS `tbl_ingredients` (
  `ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_date` date NOT NULL,
  `ingredient_name` varchar(250) NOT NULL,
  `ingredient_inci` varchar(250) NOT NULL,
  `ingredient_category` varchar(250) NOT NULL,
  `ingredient_qty` varchar(250) NOT NULL,
  `ingredient_price` varchar(250) NOT NULL,
  `ingredient_supplier` varchar(250) NOT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `ingredient_price`, `ingredient_supplier`) VALUES
(2, '0000-00-00', 'BTMS-25', 'BTMS-25', 'Emulsifier', '299', '25', '2'),
(3, '0000-00-00', 'Panthenol', 'Panthenol B5', 'Moisturiser', '206', '25', '2'),
(4, '0000-00-00', 'Capryl Glucoside', 'Capryl Glucoside', 'Surfactant', '267', '35', '1'),
(5, '0000-00-00', 'Xanthan Gum', 'Xanthan Gum', 'Thickener', '160', '15', '1'),
(6, '0000-00-00', 'Vitamin E', 'Tocopherol', 'Antioxidant', '42', '17.99', '1'),
(7, '0000-00-00', 'Vitamin E', 'Tocopherol', 'Antioxidant', '55', '17.99', '1'),
(9, '2022-05-07', 'Cetyl Alcohol', 'Cetyl Alcohol', 'Thickener', '99', '30', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production`
--

DROP TABLE IF EXISTS `tbl_manuf_production`;
CREATE TABLE IF NOT EXISTS `tbl_manuf_production` (
  `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `manuf_product_date` varchar(250) NOT NULL,
  `manuf_product_formula` varchar(250) NOT NULL,
  `manuf_product_creator` varchar(250) NOT NULL,
  `manuf_product_qty` varchar(250) NOT NULL,
  `manuf_product_batch` varchar(250) NOT NULL,
  `manuf_product_status` varchar(250) NOT NULL,
  PRIMARY KEY (`manuf_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production`
--

INSERT INTO `tbl_manuf_production` (`manuf_product_id`, `manuf_product_date`, `manuf_product_formula`, `manuf_product_creator`, `manuf_product_qty`, `manuf_product_batch`, `manuf_product_status`) VALUES
(2, '2022-05-07', '6', 'Nathan', '1000', 'TBC', 'In Progress'),
(3, '2022-05-07', '9', 'Akeem', '180', '3-2022-05-07-Akeem', 'Produced');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production_batch`
--

DROP TABLE IF EXISTS `tbl_manuf_production_batch`;
CREATE TABLE IF NOT EXISTS `tbl_manuf_production_batch` (
  `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `manuf_production_batch_production` varchar(250) NOT NULL,
  `manuf_production_batch_ingredients` varchar(250) NOT NULL,
  `manuf_production_batch_qty` varchar(250) NOT NULL,
  PRIMARY KEY (`manuf_production_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production_batch`
--

INSERT INTO `tbl_manuf_production_batch` (`manuf_production_batch_id`, `manuf_production_batch_production`, `manuf_production_batch_ingredients`, `manuf_production_batch_qty`) VALUES
(1, '3', '2', '78'),
(2, '3', '4', '38'),
(3, '3', '2', '80'),
(4, '3', '4', '12'),
(5, '3', '2', '20'),
(6, '3', '4', '10'),
(7, '3', '2', '65'),
(8, '3', '4', '75'),
(9, '3', '2', '80'),
(10, '3', '4', '100'),
(11, '3', '2', '80'),
(12, '3', '4', '100'),
(13, '3', '2', '70.2'),
(14, '3', '4', '14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marketing`
--

DROP TABLE IF EXISTS `tbl_marketing`;
CREATE TABLE IF NOT EXISTS `tbl_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_date` varchar(250) NOT NULL,
  `marketing_platform` varchar(250) NOT NULL,
  `marketing_budget` varchar(250) NOT NULL,
  `marketing_start` varchar(250) NOT NULL,
  `marketing_end` varchar(250) NOT NULL,
  `marketing_duration` varchar(250) NOT NULL,
  `marketing_outcome` varchar(250) NOT NULL,
  `marketing_target` varchar(250) NOT NULL,
  `marketing_details` varchar(250) NOT NULL,
  `marketing_status` varchar(250) NOT NULL,
  `marketing_result` varchar(250) NOT NULL,
  `marketing_creator` varchar(45) NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_marketing`
--

INSERT INTO `tbl_marketing` (`marketing_id`, `marketing_date`, `marketing_platform`, `marketing_budget`, `marketing_start`, `marketing_end`, `marketing_duration`, `marketing_outcome`, `marketing_target`, `marketing_details`, `marketing_status`, `marketing_result`, `marketing_creator`) VALUES
(2, '06/05/2022', 'Facebook', '100', '2022-05-06', '2022-05-12', '7', 'Conversions', '1000', 'Targeting 1000 Sales', 'New', 'Pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_log`
--

DROP TABLE IF EXISTS `tbl_rd_log`;
CREATE TABLE IF NOT EXISTS `tbl_rd_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` date NOT NULL,
  `log_product` varchar(250) NOT NULL,
  `log_outcome` varchar(250) NOT NULL,
  `log_comments` varchar(250) NOT NULL,
  `log_method` varchar(250) NOT NULL,
  `log_ratios` varchar(250) NOT NULL,
  `log_user` varchar(250) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_log`
--

INSERT INTO `tbl_rd_log` (`log_id`, `log_date`, `log_product`, `log_outcome`, `log_comments`, `log_method`, `log_ratios`, `log_user`) VALUES
(3, '2022-04-20', 'Wash', 'Success', 'Good Wash', 'N/A', 'N/A', ''),
(4, '2022-04-25', 'Wash', 'Success', 'n/a', 'n/a', 'n/a', ''),
(5, '2022-04-29', 'Wash', 'Success', 'dsdsdsdss', 'dsdsddsds', 'dsdsddsds', ''),
(7, '2022-05-07', '9', 'Success', 'dsdsds', 'dsds', 'dsds', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_media`
--

DROP TABLE IF EXISTS `tbl_rd_media`;
CREATE TABLE IF NOT EXISTS `tbl_rd_media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_date` date NOT NULL,
  `media_category` varchar(250) NOT NULL,
  `media_creator` varchar(250) NOT NULL,
  `media_product` varchar(250) NOT NULL,
  `media_comments` varchar(250) NOT NULL,
  `media_cost` varchar(250) NOT NULL,
  `media_status` varchar(250) NOT NULL,
  `media_file` varchar(250) NOT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_media`
--

INSERT INTO `tbl_rd_media` (`media_id`, `media_date`, `media_category`, `media_creator`, `media_product`, `media_comments`, `media_cost`, `media_status`, `media_file`) VALUES
(4, '2022-05-07', 'Advertising', 'User Name', '9', 'errere', '12', 'Approved', ''),
(5, '2022-05-08', 'Advertising', 'User Name', '6', 'xx', '10', 'New', 'Klean AF - Business Plan - V1.2.pdf'),
(6, '2022-05-14', 'Social Media', 'User Name', '6', 'This is social media Ads', '', 'New', ''),
(7, '2022-05-14', 'Mock Up', 'User Name', '9', 'This is a Bars Sweet Orange', '90', 'New', '1. How to Get Help_1.srt');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_plan`
--

DROP TABLE IF EXISTS `tbl_rd_plan`;
CREATE TABLE IF NOT EXISTS `tbl_rd_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_date` varchar(250) NOT NULL,
  `plan_title` varchar(250) NOT NULL,
  `plan_description` varchar(250) NOT NULL,
  `plan_status` varchar(250) NOT NULL,
  `plan_file` varchar(250) NOT NULL,
  `plan_user` varchar(45) NOT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_plan`
--

INSERT INTO `tbl_rd_plan` (`plan_id`, `plan_date`, `plan_title`, `plan_description`, `plan_status`, `plan_file`, `plan_user`) VALUES
(3, '', 'Shampoo Bars', 'New Research Plan for adding shampoo Bars to the current ranges', 'New', '', ''),
(4, '25/04/2022', 'Lip Balm', 'New Reseach Plan for adding Lip Balms to the range', 'New', '', ''),
(8, '2022-05-07', 'Soap Bars', 'New Plan for soap bars', 'New', '', ''),
(18, '2022-05-08', 'test', 'test', 'New', 'Klean AF - Business Plan - V1.2_1.pdf', ''),
(19, '2022-05-08', 'ee', 'ee', 'New', 'MyVodafoneBill_2022-04-15_1.pdf', ''),
(20, '2022-05-08', 'ee', 'ee', 'New', '2300 PLAG.pdf', ''),
(21, '2022-05-12', 'Timing', 'Theory', 'New', 'osiofit login page 1.PNG', ''),
(22, '2022-05-12', 'Testing', 'Testing', 'New', 'androArtboard 1hdpi.png', ''),
(23, '2022-05-12', 'hi', 'ks', 'New', 'WhatsApp Image 2021-05-18 at 11.04.33 PM.jpeg', ''),
(24, '2022-05-14', 'Success', 'This is the success for loading files(img,txt,pdf,html) in iFrame', 'New', 'Document1.odt', ''),
(25, '2022-05-14', 'Success1', 'This is the success for loading files(img,txt,pdf,html) in iFrame', 'Approved', 'startup.txt', ''),
(26, '2022-05-14', 'Rek', 'kd', 'New', 'Sale.html', ''),
(27, '2022-05-14', 'htl', 'thmls', 'New', '7. Using iOS and Android Simulators.html', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production`
--

DROP TABLE IF EXISTS `tbl_rd_production`;
CREATE TABLE IF NOT EXISTS `tbl_rd_production` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_date` varchar(250) NOT NULL,
  `product_formula` varchar(250) NOT NULL,
  `product_creator` varchar(250) NOT NULL,
  `product_qty` varchar(250) NOT NULL,
  `product_batch` varchar(250) NOT NULL,
  `product_status` varchar(250) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production`
--

INSERT INTO `tbl_rd_production` (`product_id`, `product_date`, `product_formula`, `product_creator`, `product_qty`, `product_batch`, `product_status`) VALUES
(1, '25/04/2022', '5', '01', '500', 'TBC', 'In Progress'),
(2, '27/04/2022', '5', 'Nathan', '1000', 'TBC', 'In Progress'),
(3, '27/04/2022', '5', 'Nathan', '750', 'TBC', 'In Progress'),
(5, '28/04/2022', '7', 'Nathan', '500', 'TBC', 'In Progress'),
(9, '2022-05-07', '6', 'nathan', '34', 'TBC', 'Produced'),
(10, '2022-05-12', '6', 'Akeem', '12', 'TBC', 'Produced');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production_batch`
--

DROP TABLE IF EXISTS `tbl_rd_production_batch`;
CREATE TABLE IF NOT EXISTS `tbl_rd_production_batch` (
  `production_batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `production_batch_production` varchar(250) NOT NULL,
  `production_batch_ingredients` varchar(250) NOT NULL,
  `production_batch_qty` varchar(250) NOT NULL,
  `production_batch_confirm` varchar(1) NOT NULL,
  PRIMARY KEY (`production_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production_batch`
--

INSERT INTO `tbl_rd_production_batch` (`production_batch_id`, `production_batch_production`, `production_batch_ingredients`, `production_batch_qty`, `production_batch_confirm`) VALUES
(11, '6', '3', '250', ''),
(12, '6', '3', '250', ''),
(13, '10', '4', '40', ''),
(14, '10', '5', '20', ''),
(15, '10', '6', '30', ''),
(16, '10', '7', '43', ''),
(17, '10', '9', '12', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck`
--

DROP TABLE IF EXISTS `tbl_stockcheck`;
CREATE TABLE IF NOT EXISTS `tbl_stockcheck` (
  `stockcheck_id` int(11) NOT NULL AUTO_INCREMENT,
  `stockcheck_date` varchar(250) NOT NULL,
  `stockcheck_checker` varchar(250) NOT NULL,
  `stockcheck_status` varchar(250) NOT NULL,
  PRIMARY KEY (`stockcheck_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck`
--

INSERT INTO `tbl_stockcheck` (`stockcheck_id`, `stockcheck_date`, `stockcheck_checker`, `stockcheck_status`) VALUES
(2, '2022-05-07', 'Nathan', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery`
--

DROP TABLE IF EXISTS `tbl_stockcheck_delivery`;
CREATE TABLE IF NOT EXISTS `tbl_stockcheck_delivery` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_date` varchar(250) NOT NULL,
  `delivery_supplier` varchar(250) NOT NULL,
  `delivery_logger` varchar(250) NOT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery`
--

INSERT INTO `tbl_stockcheck_delivery` (`delivery_id`, `delivery_date`, `delivery_supplier`, `delivery_logger`) VALUES
(2, '2022-05-05', '1', 'User Name'),
(3, '2022-05-07', '2', 'User Name'),
(4, '2022-05-19', '1', 'User Name'),
(5, '2022-05-14', '3', 'User Name');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery_items`
--

DROP TABLE IF EXISTS `tbl_stockcheck_delivery_items`;
CREATE TABLE IF NOT EXISTS `tbl_stockcheck_delivery_items` (
  `delivery_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` varchar(250) NOT NULL,
  `delivery_item_date` datetime NOT NULL,
  `delivery_item_qty` varchar(250) NOT NULL,
  `delivery_item_category` varchar(250) NOT NULL,
  `delivery_equipment_item` varchar(250) NOT NULL,
  `delivery_ingredient_item` varchar(250) NOT NULL,
  PRIMARY KEY (`delivery_items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery_items`
--

INSERT INTO `tbl_stockcheck_delivery_items` (`delivery_items_id`, `delivery_id`, `delivery_item_date`, `delivery_item_qty`, `delivery_item_category`, `delivery_equipment_item`, `delivery_ingredient_item`) VALUES
(37, '5', '2022-05-12 08:24:39', '34', 'Ingredient', '', '3'),
(38, '5', '2022-05-12 08:33:01', '40', 'Equipment', '4', ''),
(39, '5', '2022-05-12 08:45:12', '88', 'Equipment', '4', ''),
(40, '2', '2022-06-02 11:57:45', '900', 'Ingredient', '', '2'),
(41, '2', '2022-06-02 11:58:01', '30', 'Equipment', '4', ''),
(42, '5', '2022-06-02 12:10:09', '10', 'Equipment', '4', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

DROP TABLE IF EXISTS `tbl_suppliers`;
CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(250) NOT NULL,
  `supplier_location` varchar(250) NOT NULL,
  `supplier_category` varchar(250) NOT NULL,
  `supplier_eco` varchar(250) NOT NULL,
  `supplier_products` varchar(250) NOT NULL,
  `supplier_pricing` varchar(250) NOT NULL,
  `supplier_documents` varchar(250) NOT NULL,
  `supplier_delivery` varchar(250) NOT NULL,
  `supplier_service` varchar(250) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`supplier_id`, `supplier_name`, `supplier_location`, `supplier_category`, `supplier_eco`, `supplier_products`, `supplier_pricing`, `supplier_documents`, `supplier_delivery`, `supplier_service`) VALUES
(1, 'Naturally Thinking', 'Croydon, CR0 4AA', 'Ingredients', '5', '4', '4', '4', '5', '5'),
(2, 'Makers Ingredients', 'Ripon, HG4 5BF', 'Ingredients', '5', '5', '2', '2', '2', '5'),
(3, 'hameed', 'ibadan', 'Equipment', '5', '5', '4', '3', '5', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_first_name` varchar(50) NOT NULL,
  `staff_last_name` varchar(50) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_password` varchar(269) NOT NULL,
  `staff_role` varchar(50) NOT NULL,
  `staff_department` varchar(250) NOT NULL,
  `staff_level` varchar(45) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`staff_id`, `staff_first_name`, `staff_last_name`, `staff_email`, `staff_password`, `staff_role`, `staff_department`, `staff_level`) VALUES
(5, 'Nathan', 'Reid', 'nathan.reid@kleanaf.com', 'password', 'CEO', 'Manufacturing', ''),
(6, 'Rochelle', 'Saunders', 'rochelle.saunders@kleanaf.com', '123456', 'Administrator', 'Corporate', ''),
(8, 'Test', 'User', 'test@kleanaf.com', '123456', 'Accountant', 'Corporate', '');
--
-- Database: `membership`
--
CREATE DATABASE IF NOT EXISTS `membership` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `membership`;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\User', 'created', 1, NULL, NULL, '{\"attributes\": {\"id\": 1, \"email\": \"demo@demo.com\", \"password\": \"$2y$10$dUSnT2L.4CFlsNULzWZUy.mzbUDxPhxN8gz6n.sRpWTOZDBM/hRXK\", \"api_token\": null, \"last_name\": \"Kling\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Matteo\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": null, \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(2, 'default', 'created', 'App\\Models\\UserInfo', 'created', 1, NULL, NULL, '{\"attributes\": {\"id\": 1, \"phone\": \"1-541-341-7739\", \"avatar\": null, \"company\": \"Padberg-Koch\", \"country\": \"CG\", \"user_id\": 1, \"website\": \"http://www.christiansen.biz/\", \"currency\": null, \"language\": \"lt\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(3, 'default', 'created', 'App\\Models\\User', 'created', 2, NULL, NULL, '{\"attributes\": {\"id\": 2, \"email\": \"admin@demo.com\", \"password\": \"$2y$10$GvjKGXoXz9BhPc.Z1oFhleqYYM8eQp1j/kZHQDrS/DPm195iovymG\", \"api_token\": null, \"last_name\": \"O\'Conner\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Weston\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": null, \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(4, 'default', 'created', 'App\\Models\\UserInfo', 'created', 2, NULL, NULL, '{\"attributes\": {\"id\": 2, \"phone\": \"(949) 574-2185\", \"avatar\": null, \"company\": \"Schinner Inc\", \"country\": \"GU\", \"user_id\": 2, \"website\": \"http://www.corkery.biz/hic-ipsam-impedit-aspernatur-unde-eius-dolores-vero-ut\", \"currency\": null, \"language\": \"hr\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(5, 'default', 'created', 'App\\Models\\User', 'created', 3, NULL, NULL, '{\"attributes\": {\"id\": 3, \"email\": \"gutmann.ephraim@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Lowe\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Vance\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"McVGUmg46W\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(6, 'default', 'created', 'App\\Models\\User', 'created', 4, NULL, NULL, '{\"attributes\": {\"id\": 4, \"email\": \"meaghan.herman@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Rempel\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Madilyn\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"28C28TgX1j\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(7, 'default', 'created', 'App\\Models\\User', 'created', 5, NULL, NULL, '{\"attributes\": {\"id\": 5, \"email\": \"gislason.sydnie@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Runolfsson\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Malinda\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"Qonlbzjs1y\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(8, 'default', 'created', 'App\\Models\\User', 'created', 6, NULL, NULL, '{\"attributes\": {\"id\": 6, \"email\": \"greyson.lebsack@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Kihn\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Leon\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"ymtHR8EQyG\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(9, 'default', 'created', 'App\\Models\\User', 'created', 7, NULL, NULL, '{\"attributes\": {\"id\": 7, \"email\": \"reynolds.cali@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Baumbach\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Johnathon\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"8mNaBcsBtn\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(10, 'default', 'created', 'App\\Models\\User', 'created', 8, NULL, NULL, '{\"attributes\": {\"id\": 8, \"email\": \"kariane.kunde@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Dibbert\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Gavin\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"DooDnVc0S0\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(11, 'default', 'created', 'App\\Models\\User', 'created', 9, NULL, NULL, '{\"attributes\": {\"id\": 9, \"email\": \"grant47@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Adams\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Catalina\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"oGqgAT0SD8\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(12, 'default', 'created', 'App\\Models\\User', 'created', 10, NULL, NULL, '{\"attributes\": {\"id\": 10, \"email\": \"alexandrine66@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Klocko\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Jennifer\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"ZTt4IeNiHE\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(13, 'default', 'created', 'App\\Models\\User', 'created', 11, NULL, NULL, '{\"attributes\": {\"id\": 11, \"email\": \"imoore@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Jacobson\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Eryn\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"h3PHFjohU9\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(14, 'default', 'created', 'App\\Models\\User', 'created', 12, NULL, NULL, '{\"attributes\": {\"id\": 12, \"email\": \"isabella.dooley@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Ward\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Louie\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"gUUQtZUZXG\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(15, 'default', 'created', 'App\\Models\\User', 'created', 13, NULL, NULL, '{\"attributes\": {\"id\": 13, \"email\": \"roob.luciano@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Gerhold\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Rahul\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"vRvWVUXYqJ\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(16, 'default', 'created', 'App\\Models\\User', 'created', 14, NULL, NULL, '{\"attributes\": {\"id\": 14, \"email\": \"mprice@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Haag\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Raegan\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"3S8jSwJgGK\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(17, 'default', 'created', 'App\\Models\\User', 'created', 15, NULL, NULL, '{\"attributes\": {\"id\": 15, \"email\": \"dortha.gutkowski@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Willms\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Natasha\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"MEyF4nF9CE\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(18, 'default', 'created', 'App\\Models\\User', 'created', 16, NULL, NULL, '{\"attributes\": {\"id\": 16, \"email\": \"sporer.gina@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Ziemann\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Valerie\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"qnj4IH4VJM\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(19, 'default', 'created', 'App\\Models\\User', 'created', 17, NULL, NULL, '{\"attributes\": {\"id\": 17, \"email\": \"kassulke.renee@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Doyle\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Christiana\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"uYlYnMsjd2\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(20, 'default', 'created', 'App\\Models\\User', 'created', 18, NULL, NULL, '{\"attributes\": {\"id\": 18, \"email\": \"arnaldo.klocko@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Wisozk\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Marquis\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"yDR3AqhE2J\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(21, 'default', 'created', 'App\\Models\\User', 'created', 19, NULL, NULL, '{\"attributes\": {\"id\": 19, \"email\": \"swyman@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Breitenberg\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Haley\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"00Dvmdodwq\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(22, 'default', 'created', 'App\\Models\\User', 'created', 20, NULL, NULL, '{\"attributes\": {\"id\": 20, \"email\": \"emerald58@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Schulist\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Linnea\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"KRH8CZsNY9\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(23, 'default', 'created', 'App\\Models\\User', 'created', 21, NULL, NULL, '{\"attributes\": {\"id\": 21, \"email\": \"harris.mateo@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Herzog\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Kurt\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"Jdc1nY4b11\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(24, 'default', 'created', 'App\\Models\\User', 'created', 22, NULL, NULL, '{\"attributes\": {\"id\": 22, \"email\": \"holly49@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Waters\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Peyton\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"nicHhDR0WH\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(25, 'default', 'created', 'App\\Models\\User', 'created', 23, NULL, NULL, '{\"attributes\": {\"id\": 23, \"email\": \"jhermiston@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Reilly\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Herbert\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"6Fh5X6ZTGw\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(26, 'default', 'created', 'App\\Models\\User', 'created', 24, NULL, NULL, '{\"attributes\": {\"id\": 24, \"email\": \"jklocko@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Thompson\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Dina\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"c0kYj1PmF5\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(27, 'default', 'created', 'App\\Models\\User', 'created', 25, NULL, NULL, '{\"attributes\": {\"id\": 25, \"email\": \"pouros.pearl@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Swaniawski\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Lelia\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"ZMDxfnWunX\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(28, 'default', 'created', 'App\\Models\\User', 'created', 26, NULL, NULL, '{\"attributes\": {\"id\": 26, \"email\": \"angelo32@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Gaylord\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Delphine\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"SLw5qwCe9z\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(29, 'default', 'created', 'App\\Models\\User', 'created', 27, NULL, NULL, '{\"attributes\": {\"id\": 27, \"email\": \"maci.maggio@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Lesch\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Silas\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"aSVEapZlVH\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(30, 'default', 'created', 'App\\Models\\User', 'created', 28, NULL, NULL, '{\"attributes\": {\"id\": 28, \"email\": \"rkunde@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"DuBuque\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Giovanni\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"ohGg2erI0L\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(31, 'default', 'created', 'App\\Models\\User', 'created', 29, NULL, NULL, '{\"attributes\": {\"id\": 29, \"email\": \"llewellyn.zemlak@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Okuneva\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Adeline\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"hdIEGhyK8K\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(32, 'default', 'created', 'App\\Models\\User', 'created', 30, NULL, NULL, '{\"attributes\": {\"id\": 30, \"email\": \"dare.vita@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Schinner\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Jazlyn\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"PSJT7cb3pO\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(33, 'default', 'created', 'App\\Models\\User', 'created', 31, NULL, NULL, '{\"attributes\": {\"id\": 31, \"email\": \"chelsea.wiegand@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Reynolds\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Marjory\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"zThCQaGuWD\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(34, 'default', 'created', 'App\\Models\\User', 'created', 32, NULL, NULL, '{\"attributes\": {\"id\": 32, \"email\": \"aiyana.king@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Moore\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Ryley\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"H5SHyocqDs\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(35, 'default', 'created', 'App\\Models\\User', 'created', 33, NULL, NULL, '{\"attributes\": {\"id\": 33, \"email\": \"aylin38@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Bergnaum\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Arvel\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"eOjxBTxWC3\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(36, 'default', 'created', 'App\\Models\\User', 'created', 34, NULL, NULL, '{\"attributes\": {\"id\": 34, \"email\": \"rlueilwitz@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Fadel\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Sabina\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"ekIqxjeHVp\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(37, 'default', 'created', 'App\\Models\\User', 'created', 35, NULL, NULL, '{\"attributes\": {\"id\": 35, \"email\": \"dstiedemann@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Kunze\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Rosemarie\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"D3OUNxsMst\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(38, 'default', 'created', 'App\\Models\\User', 'created', 36, NULL, NULL, '{\"attributes\": {\"id\": 36, \"email\": \"weissnat.chris@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Welch\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Akeem\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"D9A4hyxoxO\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(39, 'default', 'created', 'App\\Models\\User', 'created', 37, NULL, NULL, '{\"attributes\": {\"id\": 37, \"email\": \"dariana55@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Botsford\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Adalberto\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"IN5Gqq0NM9\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(40, 'default', 'created', 'App\\Models\\User', 'created', 38, NULL, NULL, '{\"attributes\": {\"id\": 38, \"email\": \"smuller@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Keeling\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Lonzo\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"11YacQV7q6\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(41, 'default', 'created', 'App\\Models\\User', 'created', 39, NULL, NULL, '{\"attributes\": {\"id\": 39, \"email\": \"jodie06@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Sawayn\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Fanny\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"0DOMJNWPoO\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(42, 'default', 'created', 'App\\Models\\User', 'created', 40, NULL, NULL, '{\"attributes\": {\"id\": 40, \"email\": \"wisozk.thad@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Homenick\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Kattie\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"TCOOx6nDdQ\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(43, 'default', 'created', 'App\\Models\\User', 'created', 41, NULL, NULL, '{\"attributes\": {\"id\": 41, \"email\": \"aric09@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Hill\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Mary\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"fXGGngdmnL\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(44, 'default', 'created', 'App\\Models\\User', 'created', 42, NULL, NULL, '{\"attributes\": {\"id\": 42, \"email\": \"nathanial64@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Douglas\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Elisha\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"wFOhuP4Y1u\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(45, 'default', 'created', 'App\\Models\\User', 'created', 43, NULL, NULL, '{\"attributes\": {\"id\": 43, \"email\": \"prosacco.cara@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Wisoky\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Orpha\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"DsZTZhbC8T\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(46, 'default', 'created', 'App\\Models\\User', 'created', 44, NULL, NULL, '{\"attributes\": {\"id\": 44, \"email\": \"weissnat.lurline@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Goldner\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Kenton\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"e5bhwocElm\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(47, 'default', 'created', 'App\\Models\\User', 'created', 45, NULL, NULL, '{\"attributes\": {\"id\": 45, \"email\": \"ddavis@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Dickens\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Vickie\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"5gpOuHiSgs\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(48, 'default', 'created', 'App\\Models\\User', 'created', 46, NULL, NULL, '{\"attributes\": {\"id\": 46, \"email\": \"efunk@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Bins\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Hillard\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"2l09sdEcqR\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(49, 'default', 'created', 'App\\Models\\User', 'created', 47, NULL, NULL, '{\"attributes\": {\"id\": 47, \"email\": \"wintheiser.salma@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Graham\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Constantin\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"3kzxENGh7W\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(50, 'default', 'created', 'App\\Models\\User', 'created', 48, NULL, NULL, '{\"attributes\": {\"id\": 48, \"email\": \"sidney01@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Runolfsson\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Casimer\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"Rgq70HPOb3\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(51, 'default', 'created', 'App\\Models\\User', 'created', 49, NULL, NULL, '{\"attributes\": {\"id\": 49, \"email\": \"alexane84@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Sawayn\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Jimmie\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"qKOlbkaYqP\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(52, 'default', 'created', 'App\\Models\\User', 'created', 50, NULL, NULL, '{\"attributes\": {\"id\": 50, \"email\": \"chegmann@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Nolan\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Ophelia\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"sMVXp8Yq0P\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(53, 'default', 'created', 'App\\Models\\User', 'created', 51, NULL, NULL, '{\"attributes\": {\"id\": 51, \"email\": \"walter.lindsay@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"McClure\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Merritt\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"OwEA3A4St4\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(54, 'default', 'created', 'App\\Models\\User', 'created', 52, NULL, NULL, '{\"attributes\": {\"id\": 52, \"email\": \"stephany.brakus@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Torphy\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Christiana\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"Uc1H7QyXIn\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(55, 'default', 'created', 'App\\Models\\User', 'created', 53, NULL, NULL, '{\"attributes\": {\"id\": 53, \"email\": \"brandi.schulist@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Nicolas\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Cassandre\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"wVoIAlKASo\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(56, 'default', 'created', 'App\\Models\\User', 'created', 54, NULL, NULL, '{\"attributes\": {\"id\": 54, \"email\": \"murl41@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Kessler\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Fermin\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"NMspIS1SEP\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(57, 'default', 'created', 'App\\Models\\User', 'created', 55, NULL, NULL, '{\"attributes\": {\"id\": 55, \"email\": \"fmedhurst@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Bednar\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Laurine\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"0Zk1JiHngN\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(58, 'default', 'created', 'App\\Models\\User', 'created', 56, NULL, NULL, '{\"attributes\": {\"id\": 56, \"email\": \"wyman.oswald@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Bergnaum\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Makenna\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"5xTcfpYxd6\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(59, 'default', 'created', 'App\\Models\\User', 'created', 57, NULL, NULL, '{\"attributes\": {\"id\": 57, \"email\": \"burdette19@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Johnston\", \"created_at\": \"2022-05-10T19:48:34.000000Z\", \"first_name\": \"Roslyn\", \"updated_at\": \"2022-05-10T19:48:34.000000Z\", \"remember_token\": \"Fxiryql7jw\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:34', '2022-05-10 23:48:34'),
(60, 'default', 'created', 'App\\Models\\User', 'created', 58, NULL, NULL, '{\"attributes\": {\"id\": 58, \"email\": \"lubowitz.andre@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Batz\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Derek\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"CSPwx8F6GF\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(61, 'default', 'created', 'App\\Models\\User', 'created', 59, NULL, NULL, '{\"attributes\": {\"id\": 59, \"email\": \"adam.jast@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Kunze\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Alta\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"6q6yZtrI3B\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(62, 'default', 'created', 'App\\Models\\User', 'created', 60, NULL, NULL, '{\"attributes\": {\"id\": 60, \"email\": \"kris.irma@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Rippin\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Floyd\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"NMIWT8nQ03\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(63, 'default', 'created', 'App\\Models\\User', 'created', 61, NULL, NULL, '{\"attributes\": {\"id\": 61, \"email\": \"alanis.schimmel@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Roob\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Sadye\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"xJdKsNchFP\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(65, 'default', 'created', 'App\\Models\\User', 'created', 63, NULL, NULL, '{\"attributes\": {\"id\": 63, \"email\": \"violette40@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Jenkins\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Torrey\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"CdIBIk251h\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(66, 'default', 'created', 'App\\Models\\User', 'created', 64, NULL, NULL, '{\"attributes\": {\"id\": 64, \"email\": \"katelin87@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Casper\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Oliver\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"DAqUAJ8Q3A\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(67, 'default', 'created', 'App\\Models\\User', 'created', 65, NULL, NULL, '{\"attributes\": {\"id\": 65, \"email\": \"lreinger@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Larson\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Frederick\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"qN5MdPVCHR\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(68, 'default', 'created', 'App\\Models\\User', 'created', 66, NULL, NULL, '{\"attributes\": {\"id\": 66, \"email\": \"olson.cara@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Goyette\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Heather\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"PyPKZmY6WA\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(69, 'default', 'created', 'App\\Models\\User', 'created', 67, NULL, NULL, '{\"attributes\": {\"id\": 67, \"email\": \"zoie.funk@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Ratke\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Judge\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"b8CtwEdqNO\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(70, 'default', 'created', 'App\\Models\\User', 'created', 68, NULL, NULL, '{\"attributes\": {\"id\": 68, \"email\": \"emilio78@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"McCullough\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Aaron\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"2SMsGabGKc\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(71, 'default', 'created', 'App\\Models\\User', 'created', 69, NULL, NULL, '{\"attributes\": {\"id\": 69, \"email\": \"meta.dooley@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Gibson\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Dina\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"ujxcsXy6ZP\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(72, 'default', 'created', 'App\\Models\\User', 'created', 70, NULL, NULL, '{\"attributes\": {\"id\": 70, \"email\": \"kovacek.karson@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Moore\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Emmanuelle\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"xrYc2A349h\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(73, 'default', 'created', 'App\\Models\\User', 'created', 71, NULL, NULL, '{\"attributes\": {\"id\": 71, \"email\": \"eldridge19@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Erdman\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"German\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"WDPd9aPjXV\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(74, 'default', 'created', 'App\\Models\\User', 'created', 72, NULL, NULL, '{\"attributes\": {\"id\": 72, \"email\": \"msporer@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Zemlak\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Jeanne\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"hM6VsQQo6X\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(75, 'default', 'created', 'App\\Models\\User', 'created', 73, NULL, NULL, '{\"attributes\": {\"id\": 73, \"email\": \"fconroy@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Satterfield\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Austen\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"dUZgxuK5qF\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(76, 'default', 'created', 'App\\Models\\User', 'created', 74, NULL, NULL, '{\"attributes\": {\"id\": 74, \"email\": \"ronaldo.kirlin@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Sporer\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Natalie\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"TYPTuTcjBI\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(77, 'default', 'created', 'App\\Models\\User', 'created', 75, NULL, NULL, '{\"attributes\": {\"id\": 75, \"email\": \"twilderman@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Prohaska\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Marlene\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"Aq3LGf5ZKk\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(78, 'default', 'created', 'App\\Models\\User', 'created', 76, NULL, NULL, '{\"attributes\": {\"id\": 76, \"email\": \"fcartwright@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Pagac\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Nadia\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"FXjiheXwHP\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(79, 'default', 'created', 'App\\Models\\User', 'created', 77, NULL, NULL, '{\"attributes\": {\"id\": 77, \"email\": \"marlen32@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Wuckert\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Daisha\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"7SXHY8GAER\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(80, 'default', 'created', 'App\\Models\\User', 'created', 78, NULL, NULL, '{\"attributes\": {\"id\": 78, \"email\": \"lilla17@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Wyman\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Amaya\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"m8NhVxuGqh\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(81, 'default', 'created', 'App\\Models\\User', 'created', 79, NULL, NULL, '{\"attributes\": {\"id\": 79, \"email\": \"carrie.champlin@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Jast\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Connor\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"em4YGyMSlc\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(82, 'default', 'created', 'App\\Models\\User', 'created', 80, NULL, NULL, '{\"attributes\": {\"id\": 80, \"email\": \"oratke@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Kunze\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Arjun\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"O61JCjr82F\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(83, 'default', 'created', 'App\\Models\\User', 'created', 81, NULL, NULL, '{\"attributes\": {\"id\": 81, \"email\": \"juanita24@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Abernathy\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Lelah\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"6iGBncR8Bw\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(84, 'default', 'created', 'App\\Models\\User', 'created', 82, NULL, NULL, '{\"attributes\": {\"id\": 82, \"email\": \"lchamplin@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Maggio\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Lauren\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"WpSgoZAFuI\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(85, 'default', 'created', 'App\\Models\\User', 'created', 83, NULL, NULL, '{\"attributes\": {\"id\": 83, \"email\": \"macy99@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Nader\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Ocie\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"olWmFzS9YP\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(86, 'default', 'created', 'App\\Models\\User', 'created', 84, NULL, NULL, '{\"attributes\": {\"id\": 84, \"email\": \"obie.yost@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Stracke\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Freida\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"BmHpXZkKJG\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(87, 'default', 'created', 'App\\Models\\User', 'created', 85, NULL, NULL, '{\"attributes\": {\"id\": 85, \"email\": \"maggio.neoma@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Johnson\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Archibald\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"ykcEk4bh5S\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(88, 'default', 'created', 'App\\Models\\User', 'created', 86, NULL, NULL, '{\"attributes\": {\"id\": 86, \"email\": \"howell.destiny@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Douglas\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Myles\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"uAlUyCes3U\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(89, 'default', 'created', 'App\\Models\\User', 'created', 87, NULL, NULL, '{\"attributes\": {\"id\": 87, \"email\": \"brook.mills@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Yost\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Laurie\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"tk6AVFLROT\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(90, 'default', 'created', 'App\\Models\\User', 'created', 88, NULL, NULL, '{\"attributes\": {\"id\": 88, \"email\": \"johnson.megane@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"O\'Connell\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Nicole\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"Jj3AfWjCML\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(91, 'default', 'created', 'App\\Models\\User', 'created', 89, NULL, NULL, '{\"attributes\": {\"id\": 89, \"email\": \"klein.isai@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Wuckert\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Demarco\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"F03qhhYr4p\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(92, 'default', 'created', 'App\\Models\\User', 'created', 90, NULL, NULL, '{\"attributes\": {\"id\": 90, \"email\": \"christopher77@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Cummings\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Angela\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"NlJHayy5EO\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(93, 'default', 'created', 'App\\Models\\User', 'created', 91, NULL, NULL, '{\"attributes\": {\"id\": 91, \"email\": \"martina.jacobi@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Grant\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Travis\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"jlENNHCIbB\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(94, 'default', 'created', 'App\\Models\\User', 'created', 92, NULL, NULL, '{\"attributes\": {\"id\": 92, \"email\": \"oliver24@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Boyer\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Tyrel\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"gE8on2uNaG\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(95, 'default', 'created', 'App\\Models\\User', 'created', 93, NULL, NULL, '{\"attributes\": {\"id\": 93, \"email\": \"ischuster@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Vandervort\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Vance\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"Flk4mJ1L69\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(96, 'default', 'created', 'App\\Models\\User', 'created', 94, NULL, NULL, '{\"attributes\": {\"id\": 94, \"email\": \"pspencer@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Dickens\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Bryce\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"gWMnNtzBiK\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(97, 'default', 'created', 'App\\Models\\User', 'created', 95, NULL, NULL, '{\"attributes\": {\"id\": 95, \"email\": \"hill.kyla@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Franecki\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Mattie\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"S43vQpbueC\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(98, 'default', 'created', 'App\\Models\\User', 'created', 96, NULL, NULL, '{\"attributes\": {\"id\": 96, \"email\": \"ryann.crooks@example.com\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Parisian\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Jedidiah\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"t294rAimp1\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(99, 'default', 'created', 'App\\Models\\User', 'created', 97, NULL, NULL, '{\"attributes\": {\"id\": 97, \"email\": \"florian.runte@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Orn\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Mozell\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"Jvs6GeQOBa\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(100, 'default', 'created', 'App\\Models\\User', 'created', 98, NULL, NULL, '{\"attributes\": {\"id\": 98, \"email\": \"romaine.abernathy@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Treutel\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Larry\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"VWRNKnnIqH\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(101, 'default', 'created', 'App\\Models\\User', 'created', 99, NULL, NULL, '{\"attributes\": {\"id\": 99, \"email\": \"rernser@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Metz\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Jayson\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"DLINJf1ba2\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(102, 'default', 'created', 'App\\Models\\User', 'created', 100, NULL, NULL, '{\"attributes\": {\"id\": 100, \"email\": \"prodriguez@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Leuschke\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Sandy\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"4SZNIfzWdU\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(103, 'default', 'created', 'App\\Models\\User', 'created', 101, NULL, NULL, '{\"attributes\": {\"id\": 101, \"email\": \"runte.andreanne@example.net\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"O\'Connell\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Nestor\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"z6EZb7LoWh\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(104, 'default', 'created', 'App\\Models\\User', 'created', 102, NULL, NULL, '{\"attributes\": {\"id\": 102, \"email\": \"ebert.claire@example.org\", \"password\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"api_token\": null, \"last_name\": \"Yost\", \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"first_name\": \"Chanelle\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"remember_token\": \"j9i2XbFO8q\", \"email_verified_at\": \"2022-05-10T19:48:34.000000Z\"}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(105, 'default', 'created', 'App\\Models\\UserInfo', 'created', 3, NULL, NULL, '{\"attributes\": {\"id\": 3, \"phone\": \"+1-407-877-6454\", \"avatar\": null, \"company\": \"Robel, Jakubowski and Parisian\", \"country\": \"NL\", \"user_id\": 3, \"website\": \"http://sauer.biz/aut-autem-reprehenderit-ipsam-ullam-est.html\", \"currency\": null, \"language\": \"gl\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(106, 'default', 'created', 'App\\Models\\UserInfo', 'created', 4, NULL, NULL, '{\"attributes\": {\"id\": 4, \"phone\": \"1-507-813-5734\", \"avatar\": null, \"company\": \"Kertzmann Group\", \"country\": \"BR\", \"user_id\": 4, \"website\": \"http://keebler.org/deleniti-est-aut-nostrum-quos-sit-nobis.html\", \"currency\": null, \"language\": \"bh\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(107, 'default', 'created', 'App\\Models\\UserInfo', 'created', 5, NULL, NULL, '{\"attributes\": {\"id\": 5, \"phone\": \"+1 (862) 944-3679\", \"avatar\": null, \"company\": \"Harber and Sons\", \"country\": \"SH\", \"user_id\": 5, \"website\": \"http://ryan.info/sunt-qui-aspernatur-officia-velit-facere-rerum\", \"currency\": null, \"language\": \"kk\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(108, 'default', 'created', 'App\\Models\\UserInfo', 'created', 6, NULL, NULL, '{\"attributes\": {\"id\": 6, \"phone\": \"1-248-271-8833\", \"avatar\": null, \"company\": \"Herzog LLC\", \"country\": \"UM\", \"user_id\": 6, \"website\": \"http://www.sporer.net/eligendi-praesentium-odio-eos-modi\", \"currency\": null, \"language\": \"ks\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(109, 'default', 'created', 'App\\Models\\UserInfo', 'created', 7, NULL, NULL, '{\"attributes\": {\"id\": 7, \"phone\": \"731-462-4245\", \"avatar\": null, \"company\": \"Hackett and Sons\", \"country\": \"SZ\", \"user_id\": 7, \"website\": \"https://paucek.net/quasi-voluptatum-est-suscipit-doloremque-accusantium.html\", \"currency\": null, \"language\": \"hi\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(110, 'default', 'created', 'App\\Models\\UserInfo', 'created', 8, NULL, NULL, '{\"attributes\": {\"id\": 8, \"phone\": \"267-415-6443\", \"avatar\": null, \"company\": \"Monahan-Jaskolski\", \"country\": \"MP\", \"user_id\": 8, \"website\": \"http://lowe.info/dolores-laborum-velit-minima-maxime-et-est.html\", \"currency\": null, \"language\": \"hu\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(111, 'default', 'created', 'App\\Models\\UserInfo', 'created', 9, NULL, NULL, '{\"attributes\": {\"id\": 9, \"phone\": \"254.532.2226\", \"avatar\": null, \"company\": \"Beier-Bayer\", \"country\": \"NG\", \"user_id\": 9, \"website\": \"http://www.wolff.com/sed-omnis-aut-sit-qui-aperiam-occaecati-deleniti\", \"currency\": null, \"language\": \"io\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(112, 'default', 'created', 'App\\Models\\UserInfo', 'created', 10, NULL, NULL, '{\"attributes\": {\"id\": 10, \"phone\": \"+1.283.221.8062\", \"avatar\": null, \"company\": \"Hyatt, Ullrich and Bartoletti\", \"country\": \"JP\", \"user_id\": 10, \"website\": \"https://nienow.com/aut-exercitationem-voluptas-eos-magni-blanditiis-iusto-blanditiis.html\", \"currency\": null, \"language\": \"mn\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(113, 'default', 'created', 'App\\Models\\UserInfo', 'created', 11, NULL, NULL, '{\"attributes\": {\"id\": 11, \"phone\": \"(907) 829-1405\", \"avatar\": null, \"company\": \"Volkman-DuBuque\", \"country\": \"SN\", \"user_id\": 11, \"website\": \"http://www.marquardt.com/molestias-sit-omnis-enim-earum-consequuntur-omnis-doloremque-perferendis\", \"currency\": null, \"language\": \"xh\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(114, 'default', 'created', 'App\\Models\\UserInfo', 'created', 12, NULL, NULL, '{\"attributes\": {\"id\": 12, \"phone\": \"1-346-941-6794\", \"avatar\": null, \"company\": \"Marquardt Inc\", \"country\": \"SB\", \"user_id\": 12, \"website\": \"http://stanton.com/blanditiis-nihil-neque-rem-consequatur-sed-officia-nostrum\", \"currency\": null, \"language\": \"ka\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(115, 'default', 'created', 'App\\Models\\UserInfo', 'created', 13, NULL, NULL, '{\"attributes\": {\"id\": 13, \"phone\": \"+1-218-848-7690\", \"avatar\": null, \"company\": \"Metz, Harvey and Weber\", \"country\": \"YT\", \"user_id\": 13, \"website\": \"http://www.kunde.info/tempore-autem-expedita-qui-rerum-consequatur-earum\", \"currency\": null, \"language\": \"gu\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(116, 'default', 'created', 'App\\Models\\UserInfo', 'created', 14, NULL, NULL, '{\"attributes\": {\"id\": 14, \"phone\": \"+1 (651) 634-2381\", \"avatar\": null, \"company\": \"Langworth Inc\", \"country\": \"NA\", \"user_id\": 14, \"website\": \"http://funk.com/eos-dicta-cumque-enim-distinctio.html\", \"currency\": null, \"language\": \"hi\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(117, 'default', 'created', 'App\\Models\\UserInfo', 'created', 15, NULL, NULL, '{\"attributes\": {\"id\": 15, \"phone\": \"1-302-443-7346\", \"avatar\": null, \"company\": \"Sauer-Hane\", \"country\": \"DE\", \"user_id\": 15, \"website\": \"http://schultz.com/doloremque-minima-pariatur-ratione-necessitatibus-ad-vitae-officiis\", \"currency\": null, \"language\": \"ur\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(118, 'default', 'created', 'App\\Models\\UserInfo', 'created', 16, NULL, NULL, '{\"attributes\": {\"id\": 16, \"phone\": \"(316) 538-0618\", \"avatar\": null, \"company\": \"Marvin PLC\", \"country\": \"CF\", \"user_id\": 16, \"website\": \"http://www.bednar.net/\", \"currency\": null, \"language\": \"mg\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(119, 'default', 'created', 'App\\Models\\UserInfo', 'created', 17, NULL, NULL, '{\"attributes\": {\"id\": 17, \"phone\": \"1-351-339-9159\", \"avatar\": null, \"company\": \"Flatley-Rempel\", \"country\": \"MR\", \"user_id\": 17, \"website\": \"http://www.wintheiser.com/ut-sed-aut-a-et\", \"currency\": null, \"language\": \"cs\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(120, 'default', 'created', 'App\\Models\\UserInfo', 'created', 18, NULL, NULL, '{\"attributes\": {\"id\": 18, \"phone\": \"+1-419-941-1122\", \"avatar\": null, \"company\": \"Graham, Emard and Wolff\", \"country\": \"CM\", \"user_id\": 18, \"website\": \"http://kautzer.org/et-et-voluptatem-mollitia-facere-dignissimos-qui.html\", \"currency\": null, \"language\": \"no\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(121, 'default', 'created', 'App\\Models\\UserInfo', 'created', 19, NULL, NULL, '{\"attributes\": {\"id\": 19, \"phone\": \"+1-612-452-9726\", \"avatar\": null, \"company\": \"Hudson, Shields and Torp\", \"country\": \"MR\", \"user_id\": 19, \"website\": \"http://breitenberg.com/odio-beatae-et-reprehenderit-pariatur-ea-voluptatem.html\", \"currency\": null, \"language\": \"li\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(123, 'default', 'created', 'App\\Models\\UserInfo', 'created', 21, NULL, NULL, '{\"attributes\": {\"id\": 21, \"phone\": \"364-848-4592\", \"avatar\": null, \"company\": \"Rodriguez-Ondricka\", \"country\": \"DO\", \"user_id\": 21, \"website\": \"https://braun.biz/cumque-ipsum-doloremque-hic-repudiandae-a-soluta.html\", \"currency\": null, \"language\": \"it\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(124, 'default', 'created', 'App\\Models\\UserInfo', 'created', 22, NULL, NULL, '{\"attributes\": {\"id\": 22, \"phone\": \"551-561-4363\", \"avatar\": null, \"company\": \"Gleason, Stracke and Kiehn\", \"country\": \"BB\", \"user_id\": 22, \"website\": \"http://flatley.biz/dolores-et-repellat-laudantium-harum-ut-quaerat\", \"currency\": null, \"language\": \"oc\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(125, 'default', 'created', 'App\\Models\\UserInfo', 'created', 23, NULL, NULL, '{\"attributes\": {\"id\": 23, \"phone\": \"240.201.9021\", \"avatar\": null, \"company\": \"Tremblay Inc\", \"country\": \"CX\", \"user_id\": 23, \"website\": \"http://gerhold.biz/nam-quia-eaque-sed-sapiente-suscipit\", \"currency\": null, \"language\": \"my\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(126, 'default', 'created', 'App\\Models\\UserInfo', 'created', 24, NULL, NULL, '{\"attributes\": {\"id\": 24, \"phone\": \"+1-801-385-4788\", \"avatar\": null, \"company\": \"Hilpert Inc\", \"country\": \"BH\", \"user_id\": 24, \"website\": \"http://www.schultz.com/ut-quasi-necessitatibus-quos-sint\", \"currency\": null, \"language\": \"hy\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(127, 'default', 'created', 'App\\Models\\UserInfo', 'created', 25, NULL, NULL, '{\"attributes\": {\"id\": 25, \"phone\": \"1-669-793-9816\", \"avatar\": null, \"company\": \"Bogisich-Moore\", \"country\": \"UZ\", \"user_id\": 25, \"website\": \"http://armstrong.com/cum-nam-corrupti-veritatis-necessitatibus-placeat-quia-voluptate-consectetur\", \"currency\": null, \"language\": \"rn\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:35', '2022-05-10 23:48:35'),
(128, 'default', 'created', 'App\\Models\\UserInfo', 'created', 26, NULL, NULL, '{\"attributes\": {\"id\": 26, \"phone\": \"(321) 910-7879\", \"avatar\": null, \"company\": \"Marvin LLC\", \"country\": \"KW\", \"user_id\": 26, \"website\": \"https://www.nicolas.net/hic-qui-perspiciatis-ab-ex-vitae\", \"currency\": null, \"language\": \"mk\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:35.000000Z\", \"updated_at\": \"2022-05-10T19:48:35.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:36', '2022-05-10 23:48:36'),
(129, 'default', 'created', 'App\\Models\\UserInfo', 'created', 27, NULL, NULL, '{\"attributes\": {\"id\": 27, \"phone\": \"+1 (214) 795-0054\", \"avatar\": null, \"company\": \"Brakus-Mayer\", \"country\": \"GD\", \"user_id\": 27, \"website\": \"http://www.jerde.info/architecto-nihil-corrupti-harum-aut-sunt\", \"currency\": null, \"language\": \"aa\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:36.000000Z\", \"updated_at\": \"2022-05-10T19:48:36.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:36', '2022-05-10 23:48:36'),
(130, 'default', 'created', 'App\\Models\\UserInfo', 'created', 28, NULL, NULL, '{\"attributes\": {\"id\": 28, \"phone\": \"+1-678-620-1793\", \"avatar\": null, \"company\": \"Pfannerstill and Sons\", \"country\": \"JO\", \"user_id\": 28, \"website\": \"http://www.rau.info/voluptas-rerum-iusto-qui-praesentium-quidem.html\", \"currency\": null, \"language\": \"nb\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:36.000000Z\", \"updated_at\": \"2022-05-10T19:48:36.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:36', '2022-05-10 23:48:36'),
(131, 'default', 'created', 'App\\Models\\UserInfo', 'created', 29, NULL, NULL, '{\"attributes\": {\"id\": 29, \"phone\": \"+12239169725\", \"avatar\": null, \"company\": \"Schneider-Heathcote\", \"country\": \"NL\", \"user_id\": 29, \"website\": \"https://www.powlowski.com/illum-velit-ex-tempore-id-delectus-non-quia\", \"currency\": null, \"language\": \"is\", \"timezone\": null, \"marketing\": null, \"created_at\": \"2022-05-10T19:48:36.000000Z\", \"updated_at\": \"2022-05-10T19:48:36.000000Z\", \"communication\": null}}', NULL, '2022-05-10 23:48:36', '2022-05-10 23:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_22_144618_create_permission_tables', 1),
(5, '2021_04_14_044507_create_settings_table', 1),
(6, '2021_06_15_022916_create_user_infos_table', 1),
(7, '2021_06_23_041411_create_activity_log_table', 1),
(8, '2021_06_23_041412_add_event_column_to_activity_log_table', 1),
(9, '2021_06_23_041413_add_batch_uuid_column_to_activity_log_table', 1),
(10, '2021_11_04_200820_add_api_token_column', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Akeem', 'Oladimeji', 'akeem@gmail.com', '2022-02-24 08:08:54', '$2y$10$AYM.RquQv5C03FgarDAGxuWT38ErsDgQ5.E20matRmahTcuFRArSS', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
CREATE TABLE IF NOT EXISTS `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marketing` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
--
-- Database: `revofluid`
--
CREATE DATABASE IF NOT EXISTS `revofluid` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `revofluid`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
