-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 11:24 PM
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
-- Table structure for table `tbl_corporate_formula`
--

CREATE TABLE `tbl_corporate_formula` (
  `corporate_formula_id` int(11) NOT NULL,
  `batch_qty` float NOT NULL,
  `unit_qty` float NOT NULL,
  `formula_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formula_id`)),
  `models_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_formula`
--

INSERT INTO `tbl_corporate_formula` (`corporate_formula_id`, `batch_qty`, `unit_qty`, `formula_id`, `models_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 100, 1, '[\"1\"]', 1, '2023-01-14 09:31:10', '2023-01-14 09:32:51', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_ingredients`
--

INSERT INTO `tbl_corporate_ingredients` (`corporate_ingredient_id`, `formula_ids`, `suppliers`, `order_qty`, `prices`, `models_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '[1]', '[\"CP Chemicals\"]', '[\"1\"]', '[\"100\"]', 1, '2023-01-14 09:34:03', '2023-01-14 09:34:03', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cpn`
--

INSERT INTO `tbl_cpn` (`cpn_id`, `cpn_date`, `cpn_formula`, `cpn_rp`, `cpn_reporta`, `cpn_reportb`, `cpn_stability`, `cpn_challenge`, `cpn_pif`, `cpn_notification`, `cpn_status`, `cpn_user`, `invoice_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 1, 'Nathan Reid', 'Yes', 'Passed', 'Yes', 'Yes', 'No', 'In Progress', '', 12, 'CPN-1_2023-01-14', '2023-01-14 10:31:45', '2023-01-14 10:45:32', '2023-01-14 10:45:32'),
(2, '2023-01-14', 1, 'Nathan Reid', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', 12, 'PIF-1-2023-01-14', '2023-01-14 10:42:01', '2023-01-14 10:45:30', '2023-01-14 10:45:30'),
(3, '2023-01-14', 1, 'Nathan Reid', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', '', 12, 'PIF-1-2023-01-14', '2023-01-14 10:45:57', '2023-01-14 10:45:57', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula`
--

INSERT INTO `tbl_formula` (`formula_id`, `formula_date`, `formula_version`, `formula_creator`, `formula_comments`, `formula_rdplan`, `formula_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 'Water', '12', 'N/A', 'Demo Formula', 'Approved', '2023-01-14 09:31:32', '2023-01-14 09:49:58', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula_ingredients`
--

INSERT INTO `tbl_formula_ingredients` (`f_ingredients_id`, `f_ingredients_formula`, `f_ingredients_ingredients`, `f_ingredients_qty`, `f_ingredients_phase`, `f_ingredients_instructions`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '100', 'Phase A', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure do', '2023-01-14 09:31:42', '2023-01-14 09:51:31', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 'Water', 'Agua', 'Water', '800', '2023-01-14 08:26:36', '2023-01-14 10:03:52', NULL);

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
(1, 1, '2150', '2023-01-14', 'CP Chemicals', '100', 12, 'Batch-_2023-01-14', '2023-01-14', '2023-01-14 08:27:14', '2023-01-14 09:40:18', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production`
--

INSERT INTO `tbl_manuf_production` (`manuf_product_id`, `manuf_product_date`, `manuf_product_formula`, `manuf_product_creator`, `manuf_product_qty`, `manuf_product_batch`, `manuf_product_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', '1', '12', '100', '1-2023-01-14-12', 'Produced', '2023-01-14 09:50:09', '2023-01-14 10:02:00', '2023-01-14 10:02:00'),
(2, '2023-01-14', '1', '12', '100', '2-2023-01-14', 'Produced', '2023-01-14 10:02:05', '2023-01-14 10:03:41', '2023-01-14 10:03:41'),
(3, '2023-01-14', '1', '12', '100', '3-2023-01-14', 'Produced', '2023-01-14 10:03:45', '2023-01-14 10:03:52', NULL);

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production_batch`
--

INSERT INTO `tbl_manuf_production_batch` (`manuf_production_batch_id`, `manuf_production_batch_production`, `manuf_production_batch_ingredients`, `manuf_production_batch_qty`, `production_batch_ingredient_batch`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '1', '100.2', '1', '2023-01-14 09:54:30', '2023-01-14 09:54:30', NULL),
(2, '2', '1', '100', '', '2023-01-14 10:02:34', '2023-01-14 10:02:34', NULL),
(3, '3', '1', '100', '1', '2023-01-14 10:03:52', '2023-01-14 10:03:52', NULL);

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
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_models`
--

INSERT INTO `tbl_models` (`models_id`, `models_date`, `models_name`, `models_qty`, `models_spend`, `models_revenue`, `models_profit`, `models_user`, `models_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-14', 'Product A', 'TBC', 'TBC', 'TBC', 'TBC', 12, 'Completed', '2023-01-14 09:30:07', '2023-01-14 09:30:37', NULL);

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
  `model_ptp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 100, 5, '[\"13\"]', '[1]', 5);

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
  `models_overheads_daily` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_models_overheads`
--

INSERT INTO `tbl_models_overheads` (`models_overheads_id`, `models_id`, `models_overheads_insurance`, `models_overheads_domain`, `models_overheads_hosting`, `models_overheads_gdpr`, `models_overheads_phone`, `models_overheads_mail`, `models_overheads_banking`, `models_overheads_tech`, `models_overheads_software`, `models_overheads_filing`, `models_overheads_ops_rate`, `models_overheads_ops_hours`, `models_overheads_ops_yearly`, `models_overheads_acc_rate`, `models_overheads_acc_hours`, `models_overheads_acc_yearly`, `models_overheads_coms_rate`, `models_overheads_coms_hours`, `models_overheads_coms_yearly`, `models_overheads_pub_rate`, `models_overheads_pub_hours`, `models_overheads_pub_yearly`, `models_overheads_yearly`, `models_overheads_quartely`, `models_overheads_monthly`, `models_overheads_daily`) VALUES
(1, 1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
  `models_packaging_delivery_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_models_packaging`
--

INSERT INTO `tbl_models_packaging` (`model_package_id`, `models_id`, `models_packaging_container_size`, `models_packaging_container_qty`, `models_packaging_container_supplier`, `models_packaging_container_order`, `models_packaging_container_price`, `models_packaging_label_size`, `models_packaging_label_qty`, `models_packaging_label_supplier`, `models_packaging_label_order`, `models_packaging_label_price`, `models_packaging_shipping_size`, `models_packaging_shipping_qty`, `models_packaging_shipping_supplier`, `models_packaging_shipping_order`, `models_packaging_shipping_price`, `models_packaging_bags_size`, `models_packaging_bags_qty`, `models_packaging_bags_supplier`, `models_packaging_bags_order`, `models_packaging_bags_price`, `models_packaging_notes_size`, `models_packaging_notes_qty`, `models_packaging_notes_supplier`, `models_packaging_notes_order`, `models_packaging_notes_price`, `models_packaging_delivery_size`, `models_packaging_delivery_qty`, `models_packaging_delivery_supplier`, `models_packaging_delivery_order`, `models_packaging_delivery_price`) VALUES
(1, 1, '1', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1, '0', 100, '0', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production`
--

CREATE TABLE `tbl_rd_production` (
  `product_id` int(11) NOT NULL,
  `product_date` varchar(250) NOT NULL,
  `product_formula` varchar(250) NOT NULL,
  `product_creator` varchar(250) NOT NULL,
  `product_qty` varchar(250) NOT NULL,
  `product_batch` varchar(250) NOT NULL,
  `product_status` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production_batch`
--

CREATE TABLE `tbl_rd_production_batch` (
  `production_batch_id` int(11) NOT NULL,
  `production_batch_production` varchar(250) NOT NULL,
  `date_added` varchar(255) NOT NULL,
  `production_batch_ingredients` varchar(250) NOT NULL,
  `production_batch_qty` varchar(250) NOT NULL,
  `production_batch_ingredient_batch` varchar(250) NOT NULL,
  `invoice_file` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `staff_id` int(11) NOT NULL,
  `staff_first_name` varchar(50) NOT NULL,
  `staff_last_name` varchar(50) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_password` varchar(255) NOT NULL,
  `staff_role` varchar(50) NOT NULL,
  `staff_department` varchar(250) NOT NULL,
  `staff_level` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`staff_id`, `staff_first_name`, `staff_last_name`, `staff_email`, `staff_password`, `staff_role`, `staff_department`, `staff_level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Developer', 'Admin', 'Developer', '$2y$10$hbMq3Fqk67D9bo25AfdGoungz4etHSFaljh11dS9yR3Bvf.YPy1um', 'Developer', 'Corporate', 'Contributor', '2023-01-08 15:23:29', '2023-01-08 15:23:29', NULL),
(12, 'Nathan', 'Reid', 'nathanr', '$2y$10$PYbxbYpaaTR4BJujf2BPXuXA/A65ZWCfqcMqoh549kHtOE.Ra025a', 'MD', 'All Access', 'All Access', '2023-01-08 15:23:29', '2023-01-08 15:23:29', NULL),
(13, 'Rochelle', 'Saunders', 'rochs', '$2y$10$gBIWkiLLG7Euw04/TATyLOmq.BJ1rIlBKa7JiQYrT9yY.IfKSqAAe', 'Administrator', 'All Access', 'Authorisor', '2023-01-08 15:23:29', '2023-01-08 15:23:29', NULL),
(14, 'Renzo', 'Vigliotti', 'renzov', '$2y$10$uoBSorRtaBxzdH3TNv5uZeDfZReiurE4dwW543AUlz97T/aZtI/fe', 'Director', 'All Access', 'Authorisor', '2023-01-08 15:23:29', '2023-01-08 15:23:29', NULL),
(15, 'Ben', 'Wilkin', 'benw', '$2y$10$19b1QX6QaDKlzvHPq2eirOUMmX1glvoxb0upokstSlj429DJDN1xO', 'Accountant', 'Corporate', 'Contributor', '2023-01-08 15:23:29', '2023-01-08 15:23:29', NULL);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `tbl_rd_production`
--
ALTER TABLE `tbl_rd_production`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_rd_production_batch`
--
ALTER TABLE `tbl_rd_production_batch`
  ADD PRIMARY KEY (`production_batch_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  MODIFY `corporate_formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  MODIFY `corporate_ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  MODIFY `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  MODIFY `ingredient_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  MODIFY `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  MODIFY `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_models`
--
ALTER TABLE `tbl_models`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  MODIFY `model_manufacturing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  MODIFY `model_marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_models_overheads`
--
ALTER TABLE `tbl_models_overheads`
  MODIFY `models_overheads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  MODIFY `model_package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_rd_production`
--
ALTER TABLE `tbl_rd_production`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rd_production_batch`
--
ALTER TABLE `tbl_rd_production_batch`
  MODIFY `production_batch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
