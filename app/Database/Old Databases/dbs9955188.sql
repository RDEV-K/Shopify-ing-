-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2023 at 09:28 PM
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
-- Database: `dbs9955188`
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
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  MODIFY `corporate_formula_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  MODIFY `corporate_ingredient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  MODIFY `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  MODIFY `ingredient_batch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  MODIFY `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  MODIFY `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models`
--
ALTER TABLE `tbl_models`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  MODIFY `model_manufacturing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models_marketing`
--
ALTER TABLE `tbl_models_marketing`
  MODIFY `model_marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models_overheads`
--
ALTER TABLE `tbl_models_overheads`
  MODIFY `models_overheads_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  MODIFY `model_package_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
