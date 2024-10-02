-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2022 at 07:27 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kleanaf`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_budgets`
--

CREATE TABLE `tbl_budgets` (
  `budgets_id` int(11) NOT NULL,
  `budgets_date` date NOT NULL,
  `budgets_quarter` varchar(250) NOT NULL,
  `budgets_year` int(11) NOT NULL,
  `budgets_total` int(11) NOT NULL,
  `budgets_rd` int(11) NOT NULL,
  `budgets_mf` int(11) NOT NULL,
  `budgets_sm` int(11) NOT NULL,
  `budgets_cp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_budgets`
--

INSERT INTO `tbl_budgets` (`budgets_id`, `budgets_date`, `budgets_quarter`, `budgets_year`, `budgets_total`, `budgets_rd`, `budgets_mf`, `budgets_sm`, `budgets_cp`) VALUES
(2, '2022-04-12', 'Q1', 2022, 950, 200, 500, 150, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equipment`
--

CREATE TABLE `tbl_equipment` (
  `equipment_id` int(11) NOT NULL,
  `equipment_purchased` varchar(250) NOT NULL,
  `equipment_item` varchar(250) NOT NULL,
  `equipment_description` varchar(250) NOT NULL,
  `equipment_qty` varchar(250) NOT NULL,
  `equipment_price` varchar(250) NOT NULL,
  `equipment_supplier` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_equipment`
--

INSERT INTO `tbl_equipment` (`equipment_id`, `equipment_purchased`, `equipment_item`, `equipment_description`, `equipment_qty`, `equipment_price`, `equipment_supplier`) VALUES
(2, '2022-04-20', 'Hot Stove', '1 Burner - White', '1', '15', '1'),
(3, '2022-04-29', 'Printer', 'Cannon Printer', '1', '40', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `expenses_id` int(11) NOT NULL,
  `expenses_date` date NOT NULL,
  `expenses_category` varchar(250) NOT NULL,
  `expenses_description` varchar(250) NOT NULL,
  `expenses_price` varchar(250) NOT NULL,
  `expenses_supplier` varchar(250) NOT NULL,
  `expenses_staff` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(14, '2022-05-08', 'Media', 'Advertising', '10', 'User Name', '');

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
  `formula_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tbl_formula_ingredients` (
  `f_ingredients_id` int(11) NOT NULL,
  `f_ingredients_formula` varchar(250) NOT NULL,
  `f_ingredients_ingredients` varchar(250) NOT NULL,
  `f_ingredients_qty` varchar(250) NOT NULL,
  `f_ingredients_phase` varchar(250) NOT NULL,
  `f_ingredients_instructions` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(26, '9', '2', '5', 'Phase A', 'Weigh and add to beaker');

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
  `ingredient_price` varchar(250) NOT NULL,
  `ingredient_supplier` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `ingredient_price`, `ingredient_supplier`) VALUES
(2, '0000-00-00', 'BTMS-25', 'BTMS-25', 'Emulsifier', '1000', '25', '2'),
(3, '0000-00-00', 'Panthenol', 'Panthenol B5', 'Moisturiser', '1000', '25', '2'),
(4, '0000-00-00', 'Capryl Glucoside', 'Capryl Glucoside', 'Surfactant', '1000', '35', '1'),
(5, '0000-00-00', 'Xanthan Gum', 'Xanthan Gum', 'Thickener', '1000', '15', '1'),
(6, '0000-00-00', 'Vitamin E', 'Tocopherol', 'Antioxidant', '250', '17.99', '1'),
(7, '0000-00-00', 'Vitamin E', 'Tocopherol', 'Antioxidant', '250', '17.99', '1'),
(8, '0000-00-00', 'Kokum Butter', 'Kokum Butter', 'Oil', '1000', '40', '2'),
(9, '2022-05-07', 'Cetyl Alcohol', 'Cetyl Alcohol', 'Thickener', '1000', '30', '1');

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
  `manuf_product_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production`
--

INSERT INTO `tbl_manuf_production` (`manuf_product_id`, `manuf_product_date`, `manuf_product_formula`, `manuf_product_creator`, `manuf_product_qty`, `manuf_product_batch`, `manuf_product_status`) VALUES
(2, '2022-05-07', '6', 'Nathan', '1000', 'TBC', 'In Progress'),
(3, '2022-05-07', '9', '1', '1000', 'TBC', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production_batch`
--

CREATE TABLE `tbl_manuf_production_batch` (
  `manuf_production_batch_id` int(11) NOT NULL,
  `manuf_production_batch_production` varchar(250) NOT NULL,
  `manuf_production_batch_ingredients` varchar(250) NOT NULL,
  `manuf_production_batch_qty` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marketing`
--

CREATE TABLE `tbl_marketing` (
  `marketing_id` int(11) NOT NULL,
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
  `marketing_result` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_marketing`
--

INSERT INTO `tbl_marketing` (`marketing_id`, `marketing_date`, `marketing_platform`, `marketing_budget`, `marketing_start`, `marketing_end`, `marketing_duration`, `marketing_outcome`, `marketing_target`, `marketing_details`, `marketing_status`, `marketing_result`) VALUES
(2, '06/05/2022', 'Facebook', '100', '2022-05-06', '2022-05-12', '7', 'Conversions', '1000', 'Targeting 1000 Sales', 'New', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_log`
--

CREATE TABLE `tbl_rd_log` (
  `log_id` int(11) NOT NULL,
  `log_date` date NOT NULL,
  `log_product` varchar(250) NOT NULL,
  `log_outcome` varchar(250) NOT NULL,
  `log_comments` varchar(250) NOT NULL,
  `log_method` varchar(250) NOT NULL,
  `log_ratios` varchar(250) NOT NULL,
  `log_user` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `tbl_rd_media` (
  `media_id` int(11) NOT NULL,
  `media_date` date NOT NULL,
  `media_category` varchar(250) NOT NULL,
  `media_creator` varchar(250) NOT NULL,
  `media_product` varchar(250) NOT NULL,
  `media_comments` varchar(250) NOT NULL,
  `media_cost` varchar(250) NOT NULL,
  `media_status` varchar(250) NOT NULL,
  `media_file` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_media`
--

INSERT INTO `tbl_rd_media` (`media_id`, `media_date`, `media_category`, `media_creator`, `media_product`, `media_comments`, `media_cost`, `media_status`, `media_file`) VALUES
(4, '2022-05-07', 'Advertising', 'User Name', '9', 'errere', '12', 'Approved', ''),
(5, '2022-05-08', 'Advertising', 'User Name', '6', 'xx', '10', 'New', 'Klean AF - Business Plan - V1.2.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_plan`
--

CREATE TABLE `tbl_rd_plan` (
  `plan_id` int(11) NOT NULL,
  `plan_date` varchar(250) NOT NULL,
  `plan_title` varchar(250) NOT NULL,
  `plan_description` varchar(250) NOT NULL,
  `plan_status` varchar(250) NOT NULL,
  `plan_file` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_plan`
--

INSERT INTO `tbl_rd_plan` (`plan_id`, `plan_date`, `plan_title`, `plan_description`, `plan_status`, `plan_file`) VALUES
(3, '', 'Shampoo Bars', 'New Research Plan for adding shampoo Bars to the current ranges', 'New', ''),
(4, '25/04/2022', 'Lip Balm', 'New Reseach Plan for adding Lip Balms to the range', 'New', ''),
(8, '2022-05-07', 'Soap Bars', 'New Plan for soap bars', 'New', ''),
(18, '2022-05-08', 'test', 'test', 'New', 'Klean AF - Business Plan - V1.2_1.pdf'),
(19, '2022-05-08', 'ee', 'ee', 'New', 'MyVodafoneBill_2022-04-15_1.pdf'),
(20, '2022-05-08', 'ee', 'ee', 'New', '2300 PLAG.pdf');

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
  `product_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production`
--

INSERT INTO `tbl_rd_production` (`product_id`, `product_date`, `product_formula`, `product_creator`, `product_qty`, `product_batch`, `product_status`) VALUES
(1, '25/04/2022', '5', '01', '500', 'TBC', 'In Progress'),
(2, '27/04/2022', '5', 'Nathan', '1000', 'TBC', 'In Progress'),
(3, '27/04/2022', '5', 'Nathan', '750', 'TBC', 'In Progress'),
(5, '28/04/2022', '7', 'Nathan', '500', 'TBC', 'In Progress'),
(9, '2022-05-07', '6', 'nathan', '500', 'TBC', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_production_batch`
--

CREATE TABLE `tbl_rd_production_batch` (
  `production_batch_id` int(11) NOT NULL,
  `production_batch_production` varchar(250) NOT NULL,
  `production_batch_ingredients` varchar(250) NOT NULL,
  `production_batch_qty` varchar(250) NOT NULL,
  `production_batch_confirm` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production_batch`
--

INSERT INTO `tbl_rd_production_batch` (`production_batch_id`, `production_batch_production`, `production_batch_ingredients`, `production_batch_qty`, `production_batch_confirm`) VALUES
(11, '6', '3', '250', ''),
(12, '6', '3', '250', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck`
--

CREATE TABLE `tbl_stockcheck` (
  `stockcheck_id` int(11) NOT NULL,
  `stockcheck_date` varchar(250) NOT NULL,
  `stockcheck_checker` varchar(250) NOT NULL,
  `stockcheck_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck`
--

INSERT INTO `tbl_stockcheck` (`stockcheck_id`, `stockcheck_date`, `stockcheck_checker`, `stockcheck_status`) VALUES
(2, '2022-05-07', 'Nathan', 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery`
--

CREATE TABLE `tbl_stockcheck_delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_date` varchar(250) NOT NULL,
  `delivery_supplier` varchar(250) NOT NULL,
  `delivery_logger` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery`
--

INSERT INTO `tbl_stockcheck_delivery` (`delivery_id`, `delivery_date`, `delivery_supplier`, `delivery_logger`) VALUES
(2, '2022-05-05', '1', 'User Name'),
(3, '2022-05-07', '2', 'User Name');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery_items`
--

CREATE TABLE `tbl_stockcheck_delivery_items` (
  `delivery_items_id` int(11) NOT NULL,
  `delivery_id` varchar(250) NOT NULL,
  `delivery_item_qty` varchar(250) NOT NULL,
  `delivery_item_category` varchar(250) NOT NULL,
  `delivery_equipment_item` varchar(250) NOT NULL,
  `delivery_ingredient_item` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery_items`
--

INSERT INTO `tbl_stockcheck_delivery_items` (`delivery_items_id`, `delivery_id`, `delivery_item_qty`, `delivery_item_category`, `delivery_equipment_item`, `delivery_ingredient_item`) VALUES
(10, '3', '500', 'Ingredient', '', '3'),
(12, '3', '55', 'Ingredient', '', '4'),
(14, '3', '12', 'Equipment', '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(250) NOT NULL,
  `supplier_location` varchar(250) NOT NULL,
  `supplier_category` varchar(250) NOT NULL,
  `supplier_eco` varchar(250) NOT NULL,
  `supplier_products` varchar(250) NOT NULL,
  `supplier_pricing` varchar(250) NOT NULL,
  `supplier_documents` varchar(250) NOT NULL,
  `supplier_delivery` varchar(250) NOT NULL,
  `supplier_service` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`supplier_id`, `supplier_name`, `supplier_location`, `supplier_category`, `supplier_eco`, `supplier_products`, `supplier_pricing`, `supplier_documents`, `supplier_delivery`, `supplier_service`) VALUES
(1, 'Naturally Thinking', 'Croydon, CR0 4AA', 'Ingredients', '5', '4', '4', '4', '5', '5'),
(2, 'Makers Ingredients', 'Ripon, HG4 5BF', 'Ingredients', '5', '5', '2', '2', '2', '5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `staff_id` int(11) NOT NULL,
  `staff_first_name` varchar(50) NOT NULL,
  `staff_last_name` varchar(50) NOT NULL,
  `staff_email` varchar(100) NOT NULL,
  `staff_password` varchar(50) NOT NULL,
  `staff_role` varchar(50) NOT NULL,
  `staff_department` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`staff_id`, `staff_first_name`, `staff_last_name`, `staff_email`, `staff_password`, `staff_role`, `staff_department`) VALUES
(5, 'Nathan', 'Reid', 'nathan.reid@kleanaf.com', 'password', 'CEO', 'Manufacturing'),
(6, 'Rochelle', 'Saunders', 'rochelle.saunders@kleanaf.com', '123456', 'Administrator', 'Corporate'),
(8, 'Test', 'User', 'test@kleanaf.com', '123456', 'Accountant', 'Corporate');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_budgets`
--
ALTER TABLE `tbl_budgets`
  ADD PRIMARY KEY (`budgets_id`);

--
-- Indexes for table `tbl_equipment`
--
ALTER TABLE `tbl_equipment`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexes for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`expenses_id`);

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
-- Indexes for table `tbl_marketing`
--
ALTER TABLE `tbl_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `tbl_rd_log`
--
ALTER TABLE `tbl_rd_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_rd_media`
--
ALTER TABLE `tbl_rd_media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indexes for table `tbl_rd_plan`
--
ALTER TABLE `tbl_rd_plan`
  ADD PRIMARY KEY (`plan_id`);

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
-- Indexes for table `tbl_stockcheck`
--
ALTER TABLE `tbl_stockcheck`
  ADD PRIMARY KEY (`stockcheck_id`);

--
-- Indexes for table `tbl_stockcheck_delivery`
--
ALTER TABLE `tbl_stockcheck_delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `tbl_stockcheck_delivery_items`
--
ALTER TABLE `tbl_stockcheck_delivery_items`
  ADD PRIMARY KEY (`delivery_items_id`);

--
-- Indexes for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`staff_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_budgets`
--
ALTER TABLE `tbl_budgets`
  MODIFY `budgets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_equipment`
--
ALTER TABLE `tbl_equipment`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  MODIFY `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  MODIFY `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  MODIFY `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_marketing`
--
ALTER TABLE `tbl_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_rd_log`
--
ALTER TABLE `tbl_rd_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_rd_media`
--
ALTER TABLE `tbl_rd_media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_rd_plan`
--
ALTER TABLE `tbl_rd_plan`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_rd_production`
--
ALTER TABLE `tbl_rd_production`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_rd_production_batch`
--
ALTER TABLE `tbl_rd_production_batch`
  MODIFY `production_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_stockcheck`
--
ALTER TABLE `tbl_stockcheck`
  MODIFY `stockcheck_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_stockcheck_delivery`
--
ALTER TABLE `tbl_stockcheck_delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_stockcheck_delivery_items`
--
ALTER TABLE `tbl_stockcheck_delivery_items`
  MODIFY `delivery_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
