-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2022 at 07:04 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

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
(1, '2022-10-16', 'Q1', 2023, 2600, 300, 200, 100, 2000);

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
  `created_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_corporate_formula`
--

INSERT INTO `tbl_corporate_formula` (`corporate_formula_id`, `batch_qty`, `unit_qty`, `formula_id`, `models_id`, `created_at`) VALUES
(1, 10, 0.1, '[\"1\",\"3\"]', 1, NULL),
(2, 10, 1, '[\"6\",\"8\"]', 2, NULL);

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
(3, '[1,6,7,8,9,11,12,13,14,15]', '[\"dkl\",\"98\",\"9\",\"098\",\"9\",\"0\",\"9\",\"9\",\"0\",\"8\"]', '[\"32\",\"9\",\"89\",\"98\",\"9\",\"0\",\"0\",\"9\",\"\",\"\"]', '[\"98\",\"98\",\"66\",\"09\",\"\",\"99\",\"0\",\"0\",\"\",\"67\"]', 1),
(4, '[32,2,4,12]', '[\"\",\"\",\"\",\"\"]', '[\"\",\"\",\"\",\"\"]', '[\"7.5\",\"5\",\"2.5\",\"5\"]', 2);

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
  `cpn_status` varchar(255) NOT NULL,
  `cpn_user` int(11) NOT NULL,
  `invoice_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cpn`
--

INSERT INTO `tbl_cpn` (`cpn_id`, `cpn_date`, `cpn_formula`, `cpn_rp`, `cpn_reporta`, `cpn_reportb`, `cpn_stability`, `cpn_challenge`, `cpn_pif`, `cpn_status`, `cpn_user`, `invoice_file`) VALUES
(1, '2022-10-05', 1, '12', 'In Progress', 'In Progress', 'Passed', 'In Progress', 'In Progress', 'New', 12, '1664995569_7a05c4592b39aecff032.pdf');

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
  `equipment_delivery` int(11) NOT NULL,
  `equipment_vat` int(11) NOT NULL,
  `equipment_supplier` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_equipment`
--

INSERT INTO `tbl_equipment` (`equipment_id`, `equipment_purchased`, `equipment_item`, `equipment_description`, `equipment_qty`, `equipment_price`, `equipment_delivery`, `equipment_vat`, `equipment_supplier`, `invoice_file`) VALUES
(2, '2022-01-22', 'Hand Blender', 'Bosch CleverMixx MSM2623GGB', '2', '54.99', 0, 0, '16', '1660677893_e23ddf2a2fc65cb5f60c.pdf'),
(3, '2022-01-31', 'Disposable Gloves', 'EcoBag 100 Disposable Gloves', '100', '5.95', 0, 0, '16', '1660678035_50375baec7724422987d.pdf'),
(4, '2022-01-31', 'Stirring Rod', '10Pcs Glass Stirring Rod', '10', '5.89', 0, 0, '16', '1660678099_f4a9da84a7323cc72cea.pdf'),
(5, '2022-11-02', 'Thermometer', 'Infrared Digital Thermometer', '121', '6.15', 0, 0, '16', '1660678163_8132e407a57592f2fe47.pdf'),
(6, '2022-11-27', 'Electric Whisk', 'Electric Milk Frother Whisk', '1', '4.75', 0, 0, '16', '1660678366_fc6b5ecb2a2b0cba4dfd.pdf'),
(7, '2022-10-23', 'Steel Hotplate', 'Single Stainless Steel Hotplate', '2', '14.99', 0, 0, '16', '1660678431_325574244f033caba051.pdf'),
(8, '2022-10-28', 'Scales', 'Digital Weighing Scales Pocket ', '1', '4.91', 0, 0, '4', '1660678519_65e26255d643246b315e.pdf'),
(9, '2022-10-04', 'Spatula Large', ' Silicone Spatula Large', '1', '3.69', 0, 0, '4', '1660678627_3e091518a02a362a3a3f.pdf'),
(10, '2022-10-04', ' Spatula Small', ' Silicone Spatula Small', '1', '2.69', 0, 0, '4', '1660678669_8249fe1499521adb0568.pdf'),
(11, '2021-09-18', 'Syringe 50ml', 'Plastic Large Reusable Syringes 50ml', '3', '8.94', 0, 0, '4', '1660678995_243f56ea3433ab39e6db.pdf'),
(12, '2022-01-31', 'Pipettes', '100 x 3.0ml pasteur pipettes ', '100', '4.49', 0, 0, '4', '1660749718_45cfd29ca7efe863489c.pdf'),
(13, '2022-01-31', 'Cleaning Brushes', '3 X Soft Tip Bottle Cleaning Brushes', '3', '2.99', 0, 0, '4', '1660749760_bda4294258c9dd7d2850.pdf'),
(14, '2021-09-18', 'Plastic Bucket 25l', 'Plastic Storage Buckets with Lids', '1', '6.89', 0, 0, '4', '1660749885_edcd0688df0f2cf1e99f.pdf'),
(15, '2021-09-18', 'Hand Blender', '4in1 Electric Hand Blender', '1', '20.83', 0, 0, '4', '1660749934_f8a382f25f8673d32b4a.pdf'),
(16, '2021-09-18', 'Weighing Scales', 'Electronic Digital Kitchen Diet Food Cooking Baking Weighing Scales', '1', '20.97', 0, 0, '4', '1660749977_55460a4371ac1d8773a4.pdf'),
(17, '2021-10-28', 'Water Test Kit', 'LCD Digital Electric Tester Pen Hydroponics Water Test Kit', '1', '3.96', 0, 0, '4', '1660750065_019d13ba7ab4c46675c1.pdf'),
(18, '2021-10-28', 'Scales', '5pcs precision chrome scale weight set kit', '5', '3.95', 0, 0, '4', '1660750139_561912d779e78a260a3e.pdf'),
(19, '2022-04-12', 'Plastic Bottles', 'Plastic White Pet Boston Bottles (Tall)', '12', '6.12', 0, 0, '21', '1660750273_3d1792ebf81f3f11962e.pdf'),
(20, '2022-04-12', 'Pump Dispenser ', '24mm White Pump Dispenser', '12', '3.60', 0, 0, '21', '1660750351_02fe5d9fb4e24a531f4d.pdf'),
(21, '2021-10-04', 'Natural Shive', 'Natural Shive 54mm', '12', '5.25', 0, 0, '14', '1660750595_cc053d25eb6f9f34dddf.jpg'),
(22, '2021-10-04', 'White Disc Top Cap', '20mm Disc-top cap-white', '20', '5.25', 0, 0, '14', '1660750665_9ce727cf91019cd86e0e.jpg'),
(23, '2021-10-04', 'Cosmetic Jar', '50ml white cosmetic jar', '12', '5.25', 0, 0, '14', '1660750748_f04413a2ef538de5025c.jpg'),
(24, '2021-10-04', 'Plastic Bottle ', '50ml white glossy plastic bottle (20mm neck)', '20', '5.25', 0, 0, '14', '1660750809_e74befe95c304b93c95c.jpg'),
(25, '2021-10-04', 'White Cap', 'White Cap 54mm (50ml)', '12', '5.25', 0, 0, '14', '1660750842_8ceb4593f4c8701ef0fe.jpg'),
(26, '2021-11-01', 'Measuring cup ', 'Measuring cup set ', '2', '2.00', 0, 0, '17', '1660750942_b2e02e20ff7fc53869f7.jpg'),
(27, '2021-11-01', 'Spatula ', 'Flexi Spatula 2pck', '1', '1.00', 0, 0, '17', '1660750994_bee50ac2124131866a67.jpg'),
(28, '2022-04-03', 'Bottles', 'White refill Bottle ', '4', '3.96', 0, 0, '19', '1660751115_e012f9dff607b8885ed5.jpg'),
(29, '2022-04-04', 'Drawer', 'Tower 4 drawer', '1', '14.99', 0, 0, '20', '1660751222_766940c3d7febcd920e6.jpg'),
(30, '2022-04-04', 'Bleach', 'Thick Bleach', '1', '0.49', 0, 0, '20', '1660751258_f3460d9780c3304bef45.jpg'),
(31, '2022-04-04', 'Scourer', 'Scourer Fingergrip', '1', '0.65', 0, 0, '20', '1660751294_b8b3d20dba55cbc91338.jpg'),
(32, '2021-10-15', 'Pipettes', 'Pebeo Pipettes', '1', '2.00', 0, 0, '15', '1660751364_0fb23b12e17c08e7fb1b.jpg'),
(33, '2021-09-26', 'Rubber Gloves', 'WFL Rubber Gloves', '1', '0.80', 0, 0, '11', '1660751459_467ac1b124036baa2fa9.jpg'),
(34, '2021-09-26', 'Funnel Set', 'Funnel set 3pcs', '3', '1.25', 0, 0, '11', '1660751512_f47c2997be18a0751a90.jpg'),
(35, '2021-09-26', 'Mixing Bowl', 'Mixing Bowl 28cm', '3', '7.50', 0, 0, '11', '1660751558_7ad4243395f6d3509716.jpg'),
(36, '2021-09-26', 'Mixing Bowl', 'Mixing Bowl', '2', '4.00', 0, 0, '11', '1660751591_9cd3228afb945d706926.jpg'),
(37, '2022-12-17', 'Homogenizer', 'Homogenizer high speed 1000ml', '1', '117.99', 0, 0, '18', '1660751693_c48b56b40ec8e4f6a7be.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `expenses_id` int(11) NOT NULL,
  `expenses_date` date NOT NULL,
  `expenses_category` varchar(250) NOT NULL,
  `expenses_type` varchar(250) NOT NULL,
  `expenses_description` varchar(250) NOT NULL,
  `expenses_department` varchar(250) NOT NULL,
  `expenses_price` varchar(250) NOT NULL,
  `expenses_vat` varchar(11) NOT NULL,
  `expenses_delivery` varchar(11) NOT NULL,
  `expenses_supplier` varchar(250) NOT NULL,
  `expenses_staff` varchar(250) NOT NULL,
  `expenses_status` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_expenses`
--

INSERT INTO `tbl_expenses` (`expenses_id`, `expenses_date`, `expenses_category`, `expenses_type`, `expenses_description`, `expenses_department`, `expenses_price`, `expenses_vat`, `expenses_delivery`, `expenses_supplier`, `expenses_staff`, `expenses_status`, `invoice_file`) VALUES
(2, '2021-06-20', 'Hosting & IT', 'Business', 'Envato Website Theme', '', '10.35', '0', '0', '3', '12', 'Paid', '1657476595_4b8bd696ead2403a5a7a.pdf'),
(3, '2021-06-20', 'Computer Software', 'Business', 'Envato Handling Fee', '', '1.72', '0', '0', '3', '12', 'Paid', '1657270768_d9093784fc03693c4e5b.pdf'),
(4, '2021-06-20', 'Hosting & IT', 'Business', 'Envato Website Theme', 'Corporate', '6.04', '0', '0', '3', '12', 'Paid', '1657212445_9643a1df0cb5c9723966.pdf'),
(5, '2021-08-04', 'Consultancy Fees', 'Business', 'Formula Creation', '', '164.6', '27.43', '0', '2', '12', 'Paid', '1657475067_d9f9da74cf3f49817be1.pdf'),
(6, '2021-08-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657474561_873c4a691e61d698aaeb.pdf'),
(7, '2021-08-31', 'Consultancy Fees', 'Business', 'Formula Creation', '', '166.36', '27.73', '0', '2', '12', 'Paid', '1657474101_89b68e480df14eaa8074.pdf'),
(8, '2021-09-18', 'Manufacturing Equipment', 'Business', 'Ebay - Syringe Order', '', '8.94', '0', '0', '4', '12', 'Paid', '1657474021_69cd30e4525feb4fc003.pdf'),
(9, '2021-09-18', 'Manufacturing Equipment', 'Business', 'Ebay - Plastic Bucket Order', '', '6.89', '1.15', '0', '4', '12', 'Paid', '1657473962_195a53e8ab7631746781.pdf'),
(10, '2021-09-18', 'Manufacturing Equipment', 'Business', 'Ebay - Hand Blender Order', '', '20.83', '3.47', '0', '4', '12', 'Paid', '1657562315_cf9c8d128c573f8baa43.pdf'),
(11, '2021-09-18', 'Manufacturing Equipment', 'Business', 'Ebay - Thermometer Order', '', '2.97', '0.5', '0', '4', '12', 'Paid', '1657476805_b28eeb3e9f135c092d30.pdf'),
(12, '2021-09-18', 'Manufacturing Equipment', 'Business', 'Ebay - Scales Order', '', '20.97', '3.5', '0', '4', '12', 'Paid', '1657473894_cbc2dc17cf1953f5411d.pdf'),
(13, '2021-09-22', 'Manufacturing Materials', 'Business', 'APC - Water Order', '', '11.81', '1.97', '0', '5', '12', 'Paid', '1657472751_0c014716aa3ee4841202.pdf'),
(14, '2021-09-23', 'Manufacturing Materials', 'Business', 'Makers - Ingredients Order', '', '111.91', '18.65', '11.94', '6', '12', 'Paid', '1657475891_9065d30b9ff826c34c71.pdf'),
(15, '2021-09-23', 'Manufacturing Materials', 'Business', 'Mystic Moments - Ingredients Order', '', '37.64', '6.27', '0', '7', '12', 'Paid', '1657475947_7bbcbceb75023aa8d6da.pdf'),
(16, '2021-09-23', 'Manufacturing Materials', 'Business', 'Natural Thinking - Ingredients Order', '', '118.5', '19.75', '0', '8', '12', 'Paid', '1657475998_8747051383beb35309d3.pdf'),
(17, '2021-09-23', 'Manufacturing Materials', 'Business', 'Soapery - Ingredients Order', '', '38.94', '6.49', '0', '9', '12', 'Paid', '1657476272_1cf6278abf98e81dada5.pdf'),
(18, '2021-09-25', 'Manufacturing Materials', 'Business', 'Fresh Skin - Ingregients Order', '', '89.74', '14.96', '0', '10', '12', 'Paid', '1657476433_b6b710de3defab9c67f3.pdf'),
(19, '2021-09-26', 'Manufacturing Equipment', 'Business', 'Wilko - Equipment Order', '', '13.55', '2.26', '0', '11', '12', 'Paid', '1657476166_fbab174a9d6ef6631fc9.jpg'),
(20, '2021-09-26', 'Manufacturing Materials', 'Business', 'Gracefruit - Ingredients Order', '', '62.53', '10.42', '5.99', '12', '12', 'Paid', '1657476235_7d9b745b4fa8a26150a0.pdf'),
(21, '2021-09-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657562359_2d2d6ee001d88471d343.pdf'),
(22, '2021-09-30', 'Manufacturing Materials', 'Business', 'Soap Kitchen - Ingredients Order', '', '67.11', '11.19', '5.99', '9', '12', 'Paid', '1657476327_52bf6d94b6c5444713fa.pdf'),
(23, '2021-10-04', 'Manufacturing Equipment', 'Business', 'Ebay - Equipment Order', '', '6.38', '1.06', '0', '4', '12', 'Paid', '1657562268_efa2fc30125eda7bb014.pdf'),
(24, '2021-10-04', 'Packaging', 'Business', 'Ampulla - Packaging Order', '', '21.02', '3.5', '4.95', '14', '12', 'Paid', '1657476084_9beda2337f5c5b3b50e7.jpg'),
(25, '2021-10-15', 'Manufacturing Equipment', 'Business', 'Hobby Craft - Equipment Order', '', '2', '0.33', '0', '15', '12', 'Paid', '1657562714_46e3e9991170f70476d7.jpg'),
(26, '2021-10-23', 'Manufacturing Equipment', 'Business', 'Amazon - Equipment Order', '', '14.99', '2.5', '0', '16', '12', 'Paid', '1657473700_fba084c64056d7ab9451.pdf'),
(27, '2021-10-28', 'Manufacturing Equipment', 'Business', 'Ebay - Equipment Order', '', '4.91', '0.82', '0', '4', '12', 'Paid', '1657562114_b5927f1a606b23989f69.pdf'),
(28, '2021-10-28', 'Manufacturing Equipment', 'Business', 'Ebay - Equipment Order', '', '8.7', '1.45', '0', '4', '12', 'Paid', '1657562030_20b506bb295847d7fad3.pdf'),
(29, '2021-10-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657561874_27b8211db2fdb012d449.pdf'),
(30, '2021-11-01', 'Manufacturing Equipment', 'Business', 'Poundland - Equipment Order', '', '3', '0.5', '0', '17', '12', 'Paid', '1657476131_73265580a065321623c0.jpg'),
(31, '2021-11-02', 'Manufacturing Equipment', 'Business', 'Amazon - Equipment Order', '', '6.15', '1.03', '0', '16', '12', 'Paid', '1657473572_91d29c5982fc7979d0ea.pdf'),
(32, '2021-11-27', 'Manufacturing Equipment', 'Business', 'Amazon - Equipment Order', '', '4.75', '0.79', '0', '16', '12', 'Paid', '1657473677_7627b4a061629e7c9707.pdf'),
(33, '2021-11-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657561749_25b518a4199de9229d56.pdf'),
(34, '2021-12-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657561709_3d36aa67f33fe03f9813.pdf'),
(35, '2022-01-14', 'Manufacturing Materials', 'Business', 'Amazon - Ingredient Order', '', '11.95', '1.99', '0', '16', '12', 'Paid', '1657473612_63006255cddf78f8bf58.pdf'),
(36, '2022-01-15', 'Manufacturing Materials', 'Business', 'Amazon - Ingredient Order', '', '6.95', '1.16', '0', '16', '12', 'Paid', '1657473647_69fc772871f11321b7b2.pdf'),
(37, '2022-01-17', 'Manufacturing Equipment', 'Business', 'Vevor - Equipment Order', '', '117.99', '19.67', '0', '18', '12', 'Paid', '1657476197_aebdc5aab19d670feec8.pdf'),
(38, '2022-01-22', 'Manufacturing Materials', 'Business', 'Amazon - Equipment Order', '', '54.99', '9.17', '0', '16', '12', 'Paid', '1657473449_4b5365d3283061779382.pdf'),
(39, '2022-01-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657561670_d311526f42d7102c5da7.pdf'),
(40, '2022-01-31', 'Manufacturing Equipment', 'Business', 'Amazon - Equipment Order', '', '17.73', '2.96', '0', '16', '12', 'Paid', '1657473534_e5b228fdc2f15d306e4c.pdf'),
(41, '2022-01-31', 'Manufacturing Equipment', 'Business', 'Ebay - Equipment Order', '', '7.48', '1.25', '0', '4', '12', 'Paid', '1657561497_ba97ed1cb0780f2ed30a.pdf'),
(42, '2022-01-31', 'Manufacturing Materials', 'Business', 'Fresh Skin - Ingredients Order', '', '64.94', '10.82', '0', '10', '12', 'Paid', '1657475835_5d555d753c76743cfffd.pdf'),
(43, '2022-02-03', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '38.4', '6.4', '0', '1', '12', 'Paid', '1657475615_7845780674882b8576bf.pdf'),
(44, '2022-03-08', 'Consultancy Fees', 'Business', 'Usman - Web Developer', '', '13.6', '0', '0', '2', '12', 'Paid', '1657562672_a02a3a5c8d94151b2d06.pdf'),
(45, '2022-03-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '38.4', '6.4', '0', '1', '12', 'Paid', '1657475514_63daa2a2d010ec8f7dd2.pdf'),
(46, '2022-03-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '-30', '-5', '0', '1', '12', 'Paid', '1657475479_19cef508c3a6b9bac6f6.pdf'),
(47, '2022-04-03', 'Packaging', 'Business', 'Home Bargins - Packaging Order', '', '4.95', '0.83', '0', '19', '12', 'Paid', '1657475318_ff9fa541ee7258ace24d.jpg'),
(48, '2022-04-04', 'Manufacturing Equipment', 'Business', 'Aldi - Equipment Order', '', '16.13', '2.69', '0', '20', '12', 'Paid', '1657475264_19fe068fa5e83b2beb37.jpg'),
(49, '2022-04-12', 'Packaging', 'Business', 'iBottles - Packaging Order', '', '17.36', '2.89', '4.75', '21', '12', 'Paid', '1657475135_952e7933a4118f681172.pdf'),
(50, '2022-04-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.4', '1.4', '0', '1', '12', 'Paid', '1657475005_0a7ed878d294703f356e.pdf'),
(51, '2022-05-15', 'Consultancy Fees', 'Business', 'Web Development Services', '', '43', '7.17', '0', '22', '12', 'Paid', '1657473233_05e00aedaef77075ac5f.pdf'),
(52, '2022-06-14', 'Consultancy Fees', 'Business', 'Web Development Services', '', '63', '10.5', '0', '22', '12', 'Paid', '1657472991_1797f567af42880828cb.pdf'),
(53, '2022-06-06', 'Postage', 'Business', 'Samples Test For Testing', '', '15.90', '3.18', '0', '23', '12', 'Paid', '1657476059_022ce0d3ae83acdbee52.pdf'),
(54, '2022-06-15', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.40', '1.40', '0', '1', '12', 'Paid', '1657474879_4f26133de1fa7806d100.pdf'),
(56, '2022-06-17', 'Formation Costs', 'Business', 'Annual Company Filing', '', '13', '2.6', '0', '24', '12', 'Paid', '1657000336_07bcbb63bf3d27743b70.pdf'),
(57, '2022-06-26', 'Bank Charges', 'Business', 'Monthly Monzo Fee', '', '5', '1', '0', '25', '12', 'Paid', '1657474696_2b441df8fa64a12869b5.pdf'),
(58, '2022-05-25', 'Formation Costs', 'Business', 'CPRS & MSDS', '', '440.84', '88.17', '0', '2', '12', 'Paid', '1657001022_17c1de3237adc6d37466.pdf'),
(59, '2022-05-25', 'Office Expenses', 'Business', 'Yearly Ghost Mail', '', '26.40', '4.40', '0', '26', '12', 'Paid', '1657001170_afe0b57add38341a99c3.pdf'),
(61, '2022-05-21', 'Miscellaneous', 'Business', 'Directors Loan', '', '-3000', '0', '0', '3', '12', 'Paid', '1657474293_0b8078eea26556ede56e.pdf'),
(62, '2022-06-20', 'Bank Charges', 'Business', 'Tide Banking Fee', '', '-2.21', '0', '0', '25', '12', 'Paid', '1657474251_df2c03653fdefa0b4d0d.pdf'),
(64, '2022-05-30', 'Hosting & IT', 'Business', 'Ionos Web Hosting Fee', '', '8.40', '1.40', '0', '1', '12', 'Paid', '1657219232_2cb4b5ee504c9a0c7cb9.pdf'),
(66, '2021-10-21', 'Manufacturing Materials', 'Business', 'Xantham Gun', '', '20.95', '3.50', '4.95', '8', '12', 'Paid', '1657461231_991366a787c9d4772481.pdf'),
(67, '2021-11-07', 'Manufacturing Materials', 'Business', 'Essential Ooil', '', '35.03', '5.84', '0', '10', '12', 'Paid', '1657464604_1e7bc5541bccead25c24.pdf'),
(68, '2022-07-12', 'Manufacturing Materials', 'Business', 'Aloe Vera Powder', '', '34.96', '5.83', '0', '7', '12', 'New', '1657692797_b6a4e03b7a24d55183e6.pdf'),
(69, '2022-07-12', 'Manufacturing Materials', 'Business', 'Caprlyl Glucoside', '', '42.95', '7.16', '4.95', '8', '12', 'New', '1657692838_88d91b5cd8f969c6ca71.pdf'),
(70, '2022-07-12', 'Manufacturing Materials', 'Business', 'Colourants', '', '28.21', '4.04', '3.99', '13', '12', 'New', '1657692894_5889e70e97840fec6210.pdf'),
(71, '2022-07-19', 'Manufacturing Materials', 'Business', 'Isopropyl Alcohol', '', '12.99', '0', '0', '4', '12', 'New', '1658343232_0dd4ae86d3c9aa29c98e.pdf'),
(72, '2022-07-17', 'Manufacturing Equipment', 'Business', 'Protective Clothing', '', '13.88', '0', '0', '4', '12', 'New', '1658389640_b92e790373e49fb589b9.pdf'),
(73, '2022-10-15', 'Manufacturing Materials', 'Business', 'Demo Delivery', '', '90', '20', '10', '6', '12', 'New', '1665830291_ad0e1e3e909645ac7913.pdf');

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
  `formula_qa_1` varchar(250) NOT NULL,
  `formula_qa_2` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_formula`
--

INSERT INTO `tbl_formula` (`formula_id`, `formula_date`, `formula_version`, `formula_creator`, `formula_comments`, `formula_rdplan`, `formula_status`, `formula_qa_1`, `formula_qa_2`) VALUES
(1, '2022-07-10', 'Boost', '12', 'Citrus All Natural Body Wash', '1', 'Pending', '', ''),
(3, '2022-07-11', 'Lust', '13', 'Sweet All Natural Body Wash', '1', 'Pending', '', ''),
(4, '2022-07-12', 'Lust', '13', 'Sweet All Natural Body Cream', '2', 'Pending', '', ''),
(5, '2022-07-12', 'Boost', '13', 'Citrus All Natural Body Cream', '2', 'Pending', '', ''),
(6, '2022-10-15', 'Test Product 1', '12', 'This is test product 1', '9', 'Approved', '', ''),
(8, '2022-10-15', 'Demo Product 2', '12', 'Demo product 2', '9', 'Approved', '', '');

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
(1, '1', '32', '55.55', 'Phase A', 'Measure and add to Beaker A'),
(6, '1', '4', '1', 'Phase A', 'Measure and add to Beaker A'),
(7, '1', '26', '2', 'Phase A', 'Measure and to Beaker A. \r\nMix thoroughly until completely dissolved. Then set aside.'),
(8, '1', '29', '0.75', 'Phase B', 'Measure and add to Beaker B'),
(9, '1', '15', '6', 'Phase B', 'Measure and add to Beaker B. Mix thoroughly until Xanthan Gum has dissolved and the mixture is smooth.'),
(10, '1', '45', '0.1', 'Phase B', 'Measure and add to Beaker B. Mix thoroughly until completely disolved. Then add to Beaker B to Beaker A, incorporating slowly to limit air bubble until the mixture has thickened and is smooth.'),
(11, '1', '6', '5', 'Phase C', 'Measure and add to Beaker C'),
(12, '1', '12', '25', 'Phase C', 'Measure and add to Beaker C. Mix slowly to limit air bubbles. Then add Beaker C to Beaker A/B'),
(13, '1', '9', '0.5', 'Phase D', 'Measure and add to Beaker D'),
(14, '1', '11', '1', 'Phase D', 'Measure and add to Beaker D'),
(15, '1', '28', '1', 'Phase D', 'Measure and add to Beaker D'),
(16, '1', '43', '0.10', 'Phase D', 'Measure and add to Beaker D'),
(17, '1', '5', '0.2', 'Phase D', 'Measure and add to Beaker D'),
(18, '1', '21', '0.8', 'Phase D', 'Measure and add to Beaker D'),
(19, '1', '23', '0.5', 'Phase D', 'Measure and add to Beaker D'),
(21, '3', '32', '55.55', 'Phase A', 'Measure and add to Beaker A'),
(22, '3', '4', '1.00', 'Phase A', 'Measure and add to Beaker A'),
(23, '3', '26', '2.00', 'Phase A', 'Measure and to Beaker A. Mix thoroughly until completely dissolved. Then set aside.'),
(24, '3', '29', '0.75', 'Phase B', 'Measure and add to beaker B'),
(25, '3', '15', '6.00', 'Phase B', 'Measure and add to beaker B. Mix thoroughly until completely dissolved. Then add to Beaker A.\r\n'),
(26, '3', '46', '0.10', 'Phase B', 'Measure and add all Phase B ingredients to Beaker B and\r\nmix thoroughly until Xanthan Gum is completely dissolved\r\nand slurry is completely smooth. Add Beaker B to Beaker A\r\nand incorporate slowly to limit the amount of air bubbles\r\nuntil the mixture'),
(27, '3', '6', '5.00', 'Phase C', 'Measure and add to beaker C'),
(28, '3', '12', '25.00', 'Phase C', 'Measure and add all Phase C ingredients to Beaker C and mix slowly to limit the amount of air bubbles until completely incorporated. Once mixed, add to beaker A & B.'),
(29, '3', '9', '0.50', 'Phase D', 'Add and mix all ingredients to beaker D'),
(30, '3', '11', '1.00', 'Phase D', 'Add and mix all ingredients to beaker D'),
(31, '3', '28', '1.00', 'Phase D', 'Add and mix all ingredients to beaker D'),
(32, '3', '43', '0.10', 'Phase D', 'Add and mix all ingredients to beaker D'),
(33, '3', '24', '0.80', 'Phase D', 'Add and mix all ingredients to beaker D'),
(34, '3', '38', '0.40', 'Phase D', 'Add and mix all ingredients to beaker D'),
(35, '3', '25', '0.40', 'Phase D', 'Add and mix all ingredients to beaker D'),
(37, '4', '32', '60.00', 'Phase A', 'Measure and add to beaker A'),
(38, '4', '4', '0.50', 'Phase A', 'Measure and add to Beaker A and mix thoroughly until completely dissolved and incorporated.'),
(39, '4', '26', '1.00', 'Phase A', 'Measure and add to Beaker A and mix thoroughly until completely dissolved and incorporated.'),
(40, '4', '15', '3.50', 'Phase A', 'Measure and add to Beaker A and mix thoroughly until completely dissolved and incorporated. Then set aside to be heated to a minimum of 65c.\r\n'),
(41, '4', '2', '5.00', 'Phase B', 'Measure and add to beaker B'),
(42, '4', '7', '1.00', 'Phase B', 'Measure and add to beaker B'),
(43, '4', '3', '9.00', 'Phase B', 'Measure and add to beaker B'),
(44, '4', '27', '17.00', 'Phase B', 'Measure and add to Beaker B. Heat Beaker A and Beaker B separately to a minimum of 65c and where all ingredients are melted. Once at a minimum 65c add Beaker A to Beaker B. Mix mechanically every 5 mins until Temperature is max 25c.'),
(45, '4', '9', '0.50', 'Phase C', 'Measure and add to beaker C'),
(46, '4', '11', '0.50', 'Phase C', 'Measure and add to beaker C'),
(48, '4', '24', '0.70', 'Phase C', 'Measure and add to beaker C'),
(49, '4', '38', '0.40', 'Phase C', 'Measure and add to beaker C'),
(50, '4', '25', '0.40', 'Phase C', 'Add and mix to beaker C'),
(51, '4', '35', '0.40', 'Phase C', 'Measure and add to Beaker C. Mix until completely incorporated then add to the cooled mixture for Beaker A & B.'),
(52, '5', '32', '60', 'Phase A', 'Measure and add to beaker  A'),
(53, '5', '4', '0.50', 'Phase A', 'Measure and add to Beaker A and\r\nmix thoroughly until completely dissolved and incorporated.'),
(54, '5', '26', '1.00', 'Phase A', 'Measure and add to Beaker A and\r\nmix thoroughly until completely dissolved and incorporated.'),
(55, '5', '15', '3.50', 'Phase A', 'Measure and add to Beaker A and\r\nmix thoroughly until completely dissolved and incorporated. Then set aside to be heated to a minimum of 65c.\r\n'),
(56, '5', '2', '5.00', 'Phase B', 'Measure and add to beaker B'),
(57, '5', '7', '1.00', 'Phase B', 'Measure and add to beaker B'),
(58, '5', '3', '9.00', 'Phase B', 'Measure and add to beaker B'),
(59, '5', '27', '17.00', 'Phase B', 'Measure and add to Beaker B. Heat Beaker A and Beaker B separately to a minimum of 65c and where all ingredients are melted. Once at a minimum 65c add Beaker A to Beaker B. Mix mechanically every 5 mins until Temperature is max 25c.'),
(60, '5', '9', '0.50', 'Phase C', 'Measure and add to beaker C'),
(61, '5', '11', '0.50', 'Phase C', 'Measure and add to beaker C'),
(63, '5', '5', '0.20', 'Phase C', 'Measure and add to beaker C'),
(64, '5', '21', '0.70', 'Phase C', 'Measure and add to beaker C'),
(65, '5', '23', '0.50', 'Phase C', 'Measure and add to beaker C'),
(66, '5', '22', '0.50', 'Phase C', 'Measure and add to Beaker C. Mix until completely incorporated then add to the\r\ncooled mixture for Beaker A & B.\r\n'),
(67, '5', '43', '0.10', 'Phase C', 'Test the PH - Add Citric Acid to the final mixture until PH is\r\nbetween 5.5 +/- 0.2.\r\n'),
(68, '4', '43', '0.10', 'Phase C', 'Test the PH - Add Citric Acid to the final mixture until PH is\r\nbetween 5.5 +/- 0.2.\r\n'),
(71, '3', '48', '0.10', 'Phase D', 'Add and mix all ingredients to beaker D'),
(72, '3', '35', '0.40', 'Phase D', 'Add and mix all Phase D ingredients in Beaker D - minus Citric Acid. Mix until completely incorporated then add to Beaker A, B & C. Test the PH - Add Citric Acid to the final mixture until PH is between 5.5 +/- 0.2.'),
(73, '1', '47', '0.10', 'Phase D', 'Measure and add to Beaker D'),
(74, '1', '22', '0.50', 'Phase D', 'Add and mix all Phase D ingredients in Beaker D - minus Citric Acid. Mix until completely incorporated then add to Beaker A, B & C. Test the PH - Add Citric Acid to the final mixture until PH is between 5.5 +/- 0.2.'),
(75, '6', '32', '25', 'Phase A', 'Measure and add'),
(76, '6', '2', '50', 'Phase B', 'Measure and add'),
(77, '6', '4', '25', 'Phase C', 'Measure and add'),
(80, '7', '32', '5', 'Phase A', 'Measure and add'),
(81, '7', '12', '5', 'Phase B', 'Measure and add'),
(84, '8', '12', '5', 'Phase A', 'add'),
(85, '8', '32', '5', 'Phase A', 'add');

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
  `ingredient_vat` int(11) NOT NULL,
  `ingredient_price` varchar(250) NOT NULL,
  `ingredient_supplier` varchar(250) NOT NULL,
  `ingredient_delivery` int(11) NOT NULL,
  `invoice_file` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`ingredient_id`, `ingredient_date`, `ingredient_name`, `ingredient_inci`, `ingredient_category`, `ingredient_qty`, `ingredient_vat`, `ingredient_price`, `ingredient_supplier`, `ingredient_delivery`, `invoice_file`) VALUES
(2, '2021-09-23', 'BTMS-25', 'BTMS-25', 'Emulsifier', '753', 0, '15.99', '9', 0, '1657274393_9fe2263a4bcdc1729b7c.pdf'),
(3, '2021-09-23', 'Kokum Butter', 'Kokum Butter', 'Moisturiser', '651', 0, '22.95', '9', 0, '1657274461_937c6952eabf9e272ed1.pdf'),
(4, '2021-09-26', 'Aloe Vera Powder 200:1', 'Aloe Barbadensis Leaf Powder', 'Moisturiser', '308', 0, '27.17', '12', 0, '1657274574_1e533071cd9eca8bdd89.pdf'),
(5, '2021-09-23', 'Lemon Myrtle Oil', 'Backhousia Citriodora Leaf Oil', 'Essential Oil', '273', 0, '28.18', '12', 0, '1657274770_59d6d8487d7ed5fbb909.pdf'),
(6, '2021-09-23', 'Cocamidopropyl Betaine', 'Cocamidopropyl Betaine', 'Surfactant', '650', 0, '5.89', '8', 0, '1657274854_aab06633639931e205a9.pdf'),
(7, '2021-09-23', 'Cetyl Alcohol', 'Cetyl Alcohol', 'Emulsifier', '910', 0, '5.42', '8', 0, '1657274908_fe332a48075497bda22c.pdf'),
(8, '2021-09-23', 'Vetivert Oil', 'Vertiveria Zizanoides Root Oil', 'Essential Oil', '100', 0, '33.33', '8', 0, '1657275056_039ea082762bf6bc4ef8.pdf'),
(9, '2021-09-23', 'Vitamin E', 'Tocopherol', 'Antioxidant', '290', 0, '18.33', '8', 0, '1657275292_5ec580b079a22719410c.pdf'),
(10, '2021-09-23', 'Sesame Oil', 'Sesamum Indicum Seed Oil', 'Oil', '5000', 0, '24.00', '8', 0, '1657275350_015fbb2ce715f41670d6.pdf'),
(11, '2021-09-23', 'Pheno Ethyl', 'Phenoxyethanol & Ethylhexylglycerin', 'Preservative', '260', 0, '6.67', '8', 0, '1657275409_57c604858daae51c3d99.pdf'),
(12, '2021-09-23', 'Caprylyl/Capryl Glucoside', 'Caprylyl/Capryl Glucoside', 'Surfactant', '4840', 0, '9.17', '8', 0, '1657275442_128a42373d7fe7e44884.pdf'),
(13, '2021-09-23', 'Cupuacu Butter', 'Theobroma Grandiflorum', 'Moisturiser', '950', 0, '22.46', '7', 0, '1657458271_0d47f4a5cc8d48d7f5ec.pdf'),
(14, '2021-09-23', 'Frankincense Oil', 'Boswellia Serrata', 'Essential Oil', '90', 0, '11.63', '7', 0, '1657458325_31909f5a86cc10ae6b75.pdf'),
(15, '2021-09-23', 'Vegetable Glycerine', 'Glycerin', 'Oil', '455', 0, '4.97', '6', 0, '1657458441_5a0d6aaae698227d2c9e.pdf'),
(16, '2021-09-23', 'Mugworth Oil', 'Artemisia Vulgarisn Oil', 'Essential Oil', '80', 0, '25.95', '6', 0, '1657458703_fd75bff795508568430a.pdf'),
(17, '2021-09-23', 'Copaiba Balsam', 'Copaifera Officinalis Resin', 'Essential Oil', '80', 0, '19.35', '6', 0, '1657458807_aca4a53c7c1b41c4fb24.pdf'),
(18, '2021-09-23', 'Rose Absolute', 'Rosa Damascena Flower Extract', 'Essential Oil', '235', 0, '31.05', '6', 0, '1657458927_f12f53c8bbd87f96fd31.pdf'),
(19, '2022-01-31', 'Juniper Berry Oil', 'Juniperus Communis', 'Essential Oil', '50', 0, '9.39', '10', 0, '1657459132_0c823e41c485dae1244c.pdf'),
(20, '2022-01-31', 'Patchouli Oil', 'Pogostemon Cablin', 'Essential Oil', '100', 0, '9.89', '10', 0, '1657459238_9cddc948a63e5ec8b279.pdf'),
(21, '2022-01-31', 'Sweet Orange Oil', 'Citrus Sinensis', 'Essential Oil', '262', 0, '5.89', '10', 0, '1657459337_db34c361c4969279f6b3.pdf'),
(22, '2022-01-31', 'Cinnamon Oil', 'Cinnamomum Zeylancium', 'Essential Oil', '280', 0, '7.40', '10', 0, '1657459417_39c96fd5151a7dc967b4.pdf'),
(23, '2022-01-31', 'Black Pepper Oil', 'Piper Nigrum', 'Essential Oil', '165', 0, '14.49', '10', 0, '1657459577_6c78fa3f10254e1cfebf.pdf'),
(24, '2022-01-31', 'Benzoin Oil', 'Styrax Benzoin', 'Essential Oil', '63', 0, '5.99', '10', 0, '1657460253_59fa6f6e74636f34e18c.pdf'),
(25, '2022-01-31', 'Sandalwood Amyris Oil', 'Amyris Balsmifera', 'Essential Oil', '71', 0, '11.89', '10', 0, '1657460364_88b0425a4738c343939c.pdf'),
(26, '2021-09-23', 'Panthenol B5', 'Panthenol', 'Moisturiser', '503', 0, '20.87', '13', 0, '1657460671_7c06b160f81071de2f80.pdf'),
(27, '2021-09-23', 'Grapeseed Oil', 'Vitis Vinifera', 'Oil', '280', 0, '5.89', '13', 0, '1657460781_e9c930a75e8d2caa54f2.pdf'),
(28, '2021-09-23', 'Wheat Protein', 'Kelyamin Liquid', 'Moisturiser', '540', 0, '30.11', '13', 0, '1657460857_640b93fd9d87884ba7c8.pdf'),
(29, '2021-09-23', 'Xanthan Gum', 'Xanthan Gum', 'Thickener', '903', 0, '9.71', '13', 0, '1657460940_c31690222efa49f7a841.pdf'),
(30, '2022-01-14', 'Polysorbate 80', 'Polysorbate 80', 'Emulsifier', '800', 0, '11.95', '7', 0, '1657461576_08d23400f5b3e24b4066.pdf'),
(31, '2022-01-15', 'Carnauba Wax', 'Copernicia Cerifera Cera', 'Moisturiser', '84', 0, '6.95', '7', 0, '1657461670_bb74152fc9fb5e3542cc.pdf'),
(32, '2021-09-22', 'Distilled Water', 'Agua', 'Base', '12875', 0, '11.81', '5', 0, '1657461741_3db62468b20eb21d871b.pdf'),
(33, '2021-09-25', 'Peppermint Oil', 'Mentha Piperita', 'Essential Oil', '100', 0, '7.29', '10', 0, '1657461859_54dc1c00ac2da4dc9c98.pdf'),
(34, '2021-09-25', 'Tea Tree Oil', 'Melaleuca Alternifolia', 'Essential Oil', '235', 0, '17.99', '10', 0, '1657461921_1489828634b78555c7f1.pdf'),
(35, '2021-09-25', 'Ylang Ylang Oil', 'Cananga Odorata', 'Essential Oil', '81', 0, '9.89', '10', 0, '1657461979_c85c1259663d0018d07e.pdf'),
(36, '2021-09-25', 'Ginger Oil', 'Zingiber Officinalis', 'Essential Oil', '235', 0, '24.09', '10', 0, '1657462070_0d1cfe00a6087cabbc79.pdf'),
(37, '2021-09-25', 'Lavender Oil', 'Lavandula Angustifolia', 'Essential Oil', '235', 0, '16.99', '10', 0, '1657462131_3eaacad545de7606f703.pdf'),
(38, '2021-09-25', 'Cedarwood Oil', 'Cedarus Atlantica', 'Essential Oil', '196', 0, '13.49', '10', 0, '1657462188_92ce4befe8570773f454.pdf'),
(39, '2021-11-07', 'Vanilla Oil (Fragrance)', 'Vanilla Fragrance Oil', 'Essential Oil', '45', 0, '4.99', '10', 0, '1657464940_c30b0229b479be876cc3.pdf'),
(40, '2021-11-07', 'Mango Fragrance Oil', 'Mango Fragrance Oil', 'Essential Oil', '85', 0, '19.96', '10', 0, '1657465072_348dc75dd52f75e934e8.pdf'),
(41, '2021-11-07', 'Cinnamon Apple Fragrance Oil', 'Cinnamon Apple Fragrance Oil', 'Essential Oil', '45', 0, '4.99', '10', 0, '1657465161_e255bbf25d986f0cd13d.pdf'),
(42, '2021-11-07', 'Coconut Fragrance Oil', 'Coconut Fragrance Oil', 'Essential Oil', '45', 0, '4.99', '10', 0, '1657465407_b997f7452a6033397926.pdf'),
(43, '2021-11-07', 'Citric Acid', 'Citric Aid', 'Preservative', '998', 0, '5.09', '10', 0, '1657465647_ae448e36c2fdd6aa90c4.pdf'),
(44, '2021-11-07', 'Bubblegum Fragrance Oil', 'Bubblegum Fragrance Oil', 'Essential Oil', '45', 0, '4.99', '10', 0, '1657465735_89bea479215dbbac5413.pdf'),
(47, '2022-07-12', 'Yellow Colourant', 'Beta-Carotene Extract (Ci75130)', 'Colourant', '149', 0, '8.51', '13', 0, '1658390630_b69cebaf9b9a2d4875d0.pdf'),
(48, '2022-07-12', 'Red Colourant', 'Beetroot Extract (Ci75840)', 'Colourant', '50', 0, '15.71', '13', 0, '1658390738_0b3ca54369271cc581db.pdf'),
(49, '2022-07-19', 'Isopropryl Alcohol', 'Propan-2-ol', 'Base', '2000', 0, '12.99', '4', 0, '1658473916_68fc20b8fdae22453fe4.pdf');

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
  `delivery_id` varchar(255) NOT NULL,
  `ingredient_batch_qty` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_file` varchar(255) NOT NULL,
  `date_added` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_ingredients_batch`
--

INSERT INTO `tbl_ingredients_batch` (`ingredient_batch_id`, `ingredient_id`, `ingredient_batch_no`, `ingredient_batch_expiry`, `ingredient_batch_supplier_id`, `delivery_id`, `ingredient_batch_qty`, `user_id`, `invoice_file`, `date_added`) VALUES
(1, 2, 'AABTMS25', '2022-10-15', 6, '11', '100', 12, '1665830464_ecf570d607965e85d764.pdf', '2022-10-15 11:41:04'),
(2, 6, 'AACOCOC', '2022-10-15', 6, '11', '100', 12, '1665830604_3b7f9f77be383106d494.pdf', '2022-10-15 11:43:24'),
(3, 4, 'CCALOE1', '2022-10-15', 6, '11', '100', 12, '1665830632_38c0d177c5af4708ba4d.pdf', '2022-10-15 11:43:52'),
(4, 32, 'SSWATER21', '2022-10-15', 6, '11', '100', 12, '1665830661_36b31bc0cdbb9f804eb0.pdf', '2022-10-15 11:44:21'),
(5, 12, 'SSCAPR', '2022-10-15', 6, '12', '10', 12, '1665830981_70cf3b001acc06d99452.pdf', '2022-10-15 11:49:41');

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
(1, '2022-10-15', '6', '12', '10', '1-2022-10-15-12', 'Produced'),
(2, '2022-10-15', '7', '12', '10', '2-2022-10-15-12', 'Produced');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manuf_production_batch`
--

CREATE TABLE `tbl_manuf_production_batch` (
  `manuf_production_batch_id` int(11) NOT NULL,
  `manuf_production_batch_production` varchar(250) NOT NULL,
  `manuf_production_batch_ingredients` varchar(250) NOT NULL,
  `manuf_production_batch_qty` varchar(250) NOT NULL,
  `production_batch_ingredient_batch` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_manuf_production_batch`
--

INSERT INTO `tbl_manuf_production_batch` (`manuf_production_batch_id`, `manuf_production_batch_production`, `manuf_production_batch_ingredients`, `manuf_production_batch_qty`, `production_batch_ingredient_batch`) VALUES
(1, '1', '32', '2.5', '4'),
(2, '1', '2', '5', '1'),
(3, '1', '4', '2.5', '3'),
(4, '2', '32', '5', '4'),
(5, '2', '12', '5', '5');

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
  `marketing_result` varchar(250) NOT NULL,
  `marketing_creator` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meetings`
--

CREATE TABLE `tbl_meetings` (
  `meeting_id` int(11) NOT NULL,
  `meeting_date` varchar(255) NOT NULL,
  `meeting_title` varchar(255) NOT NULL,
  `meeting_description` varchar(255) NOT NULL,
  `meeting_status` varchar(255) NOT NULL,
  `meeting_creator` int(11) NOT NULL
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
  `models_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_models`
--

INSERT INTO `tbl_models` (`models_id`, `models_date`, `models_name`, `models_qty`, `models_spend`, `models_revenue`, `models_profit`, `models_user`, `models_status`) VALUES
(1, '2022-08-18', 'Test Model', 'TBC', 'TBC', 'TBC', 'TBC', 12, 'Completed'),
(2, '2022-10-15', 'Demo Product Model', 'TBC', 'TBC', 'TBC', 'TBC', 12, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_models_manufacturing`
--

CREATE TABLE `tbl_models_manufacturing` (
  `models_id` int(11) NOT NULL,
  `model_manufacturing_productionfee` int(11) NOT NULL,
  `model_manufacturing_deliveryfee` int(11) NOT NULL,
  `model_manufacturing_bottlingfee` int(11) NOT NULL,
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
(1, 1, 120, 100, 100, 100, 100, 100, 100, 100, 100, 100, 10, 10, 0, 10, 10, 5200, 10, 10, 0, 10, 10, 0, 0, 0, 0, 0),
(2, 2, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 10, 1, 0, 10, 1, 520, 10, 1, 0, 10, 1, 0, 0, 0, 0, 0);

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
(1, 2, '1', 20, 'Supplier', 20, 100, '200x100mm', 20, 'Supplier', 20, 100, '1 pack', 20, 'Supplier', 20, 100, '1 bag', 20, 'Supplier', 20, 100, '1 note', 20, 'Supplier', 20, 100, 'Carbon Neutral Delivery', 20, 'Supplier', 20, 100);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `news_date` varchar(255) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_author` int(11) NOT NULL,
  `news_category` varchar(25) NOT NULL,
  `news_summary` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `news_date`, `news_title`, `news_author`, `news_category`, `news_summary`) VALUES
(2, '2022-10-16', 'Nearly webapp completion', 12, 'Business Update', 'We are nearly complete for the webapp');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_packaging`
--

CREATE TABLE `tbl_packaging` (
  `packaging_id` int(11) NOT NULL,
  `packaging_purchased` varchar(250) NOT NULL,
  `packaging_item` varchar(250) NOT NULL,
  `packaging_description` varchar(250) NOT NULL,
  `packaging_qty` int(11) NOT NULL,
  `packaging_price` int(11) NOT NULL,
  `packaging_delivery` varchar(250) NOT NULL,
  `packaging_vat` varchar(250) NOT NULL,
  `packaging_supplier` varchar(250) NOT NULL,
  `staff_name` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL,
  `packaging_category` varchar(250) NOT NULL,
  `packaging_size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_packaging`
--

INSERT INTO `tbl_packaging` (`packaging_id`, `packaging_purchased`, `packaging_item`, `packaging_description`, `packaging_qty`, `packaging_price`, `packaging_delivery`, `packaging_vat`, `packaging_supplier`, `staff_name`, `invoice_file`, `packaging_category`, `packaging_size`) VALUES
(3, '2022-09-01', 'Test Item', 'Tall Boston', 12, 25, '5', '5', '18', 'Nathan', '1662018389_121b03c59f5f91a9210d.pdf', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_policies`
--

CREATE TABLE `tbl_policies` (
  `policy_id` int(11) NOT NULL,
  `policy_title` varchar(255) NOT NULL,
  `policy_effective_date` date NOT NULL,
  `policy_creator` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_policies`
--

INSERT INTO `tbl_policies` (`policy_id`, `policy_title`, `policy_effective_date`, `policy_creator`) VALUES
(1, 'Health & Safety', '2022-10-16', '12'),
(2, 'Good Manufacturing Practices', '2022-10-16', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_processes`
--

CREATE TABLE `tbl_processes` (
  `process_id` int(11) NOT NULL,
  `process_title` varchar(255) NOT NULL,
  `process_effective_date` date NOT NULL,
  `process_creator` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_processes`
--

INSERT INTO `tbl_processes` (`process_id`, `process_title`, `process_effective_date`, `process_creator`) VALUES
(1, 'Research & Development', '2022-08-18', '12'),
(2, 'Manufacturing', '2022-08-18', '12'),
(3, 'Sales', '2022-08-18', '12'),
(5, 'Corporate', '2022-08-18', '12');

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
(1, '2022-07-19', '10', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(2, '2022-07-19', '4', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(3, '2022-07-19', '5', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(4, '2022-07-19', '6', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(5, '2022-07-19', '7', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(6, '2022-07-19', '8', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(7, '2022-07-19', '9', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(8, '2022-07-19', '10', 'Success', 'Works perfectly. Happy with smell and texture. ', 'N/A', 'N/A', '12'),
(9, '2022-08-06', '3', 'Fail', 'During phase B, colorant had an adverse reaction to the mixture. When Phase B was added to Phase A, curdling and foaming occured', 'Add colorant in last phase.', 'Use food coloring for colorant.', '12'),
(10, '2022-08-06', '4', 'Fail', 'Colorant was rejected from Phase B.', 'Add colorant in last', 'Use food coloring', '12'),
(11, '2022-08-11', '14', 'Success', 'Happy with the outcome. Process took alot along and was split over a few days due to time constraints.', 'Updated Method to improve accuracy.', 'N/A', '12'),
(12, '2022-08-11', '16', 'Success', 'Happy with the outcome. Process took alot along and was split over a few days due to time constraints.', 'Updated method to improve accuracy.', 'N/A', '12');

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
  `media_vat` int(11) NOT NULL,
  `media_status` varchar(250) NOT NULL,
  `media_file` varchar(250) NOT NULL,
  `media_invoice` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rd_plan`
--

CREATE TABLE `tbl_rd_plan` (
  `plan_id` int(11) NOT NULL,
  `plan_date` varchar(250) NOT NULL,
  `plan_user` varchar(250) NOT NULL,
  `plan_title` varchar(250) NOT NULL,
  `plan_description` varchar(250) NOT NULL,
  `plan_status` varchar(250) NOT NULL,
  `plan_file` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_plan`
--

INSERT INTO `tbl_rd_plan` (`plan_id`, `plan_date`, `plan_user`, `plan_title`, `plan_description`, `plan_status`, `plan_file`) VALUES
(1, '2022-06-30', '12', 'Body Wash', 'All Natural Body Wash', 'Approved', '1657469473_c0c9116bd4cf127dbf82.pdf'),
(2, '2022-07-11', '12', 'Body Cream', 'All Natural Body Cream', 'Approved', '1657564692_927dfef5a2e560a40969.pdf'),
(3, '2022-07-12', '12', 'Body Oil', 'TBC', 'New', '1657662901_4dbbc84a9f2d07a863d3.pdf'),
(4, '2022-07-12', '12', 'Lubricant', 'TBC', 'New', '1657662925_713324bbc671b17ef1c2.pdf'),
(5, '2022-07-12', '12', 'Deodorant ', 'TBC', 'New', '1657662942_e4baa8ce0908b25a9520.pdf'),
(6, '2022-07-12', '12', 'Lip Balm', 'TBC', 'New', '1657662960_68ddcb4d341bae307721.pdf'),
(7, '2022-08-11', '12', 'Sun Screen', 'TBC', 'New', '1660239859_c119cd8bee0892bc2a36.pdf'),
(8, '2022-08-11', '12', 'Insect Repellent', 'TBC', 'New', '1660239884_9f4eb2f63e1ccb842e01.pdf'),
(9, '2022-10-15', '12', 'Demo Product', 'This is a demo product', 'Approved', '1665829876_a8b43efafc15a966d6c3.pdf');

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
(1, '2022-10-15', '6', '12', '10', '1-2022-10-15-12', 'Produced'),
(5, '2022-10-15', '7', '12', '10', 'TBC', 'In Progress'),
(7, '2022-10-15', '8', '12', '10', '7-2022-10-15-12', 'Produced');

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
  `invoice_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_rd_production_batch`
--

INSERT INTO `tbl_rd_production_batch` (`production_batch_id`, `production_batch_production`, `date_added`, `production_batch_ingredients`, `production_batch_qty`, `production_batch_ingredient_batch`, `invoice_file`) VALUES
(1, '1', '', '32', '2.5', '4', ''),
(2, '1', '', '2', '5', '1', ''),
(3, '1', '', '4', '2.5', '3', ''),
(4, '4', '', '32', '5', '4', ''),
(5, '4', '', '12', '5', '5', ''),
(6, '6', '', '32', '5', '4', ''),
(7, '6', '', '12', '5', '5', ''),
(8, '7', '', '12', '5', '5', ''),
(9, '7', '', '32', '5', '4', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `schedule_id` int(11) NOT NULL,
  `scheduled_Id` varchar(250) NOT NULL,
  `schedule_description` varchar(5000) DEFAULT NULL,
  `schedule_endtime` datetime DEFAULT NULL,
  `schedule_endtimezone` varchar(250) DEFAULT NULL,
  `schedule_following_id` varchar(45) DEFAULT NULL,
  `schedule_isallday` varchar(5) DEFAULT NULL,
  `schedule_location` varchar(500) DEFAULT NULL,
  `schedule_recurrenceEx` varchar(1000) DEFAULT NULL,
  `schedule_recID` varchar(45) DEFAULT NULL,
  `schedule_recRule` varchar(1000) DEFAULT NULL,
  `schedule_startTime` datetime DEFAULT NULL,
  `schedule_startTimezone` varchar(250) DEFAULT NULL,
  `schedule_subject` varchar(5000) DEFAULT NULL,
  `schedule_generate_date` varchar(500) DEFAULT NULL,
  `schedule_guid` varchar(45) DEFAULT NULL,
  `schedule_assigned` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`schedule_id`, `scheduled_Id`, `schedule_description`, `schedule_endtime`, `schedule_endtimezone`, `schedule_following_id`, `schedule_isallday`, `schedule_location`, `schedule_recurrenceEx`, `schedule_recID`, `schedule_recRule`, `schedule_startTime`, `schedule_startTimezone`, `schedule_subject`, `schedule_generate_date`, `schedule_guid`, `schedule_assigned`, `created_at`, `deleted_at`) VALUES
(3, '1', 'Quartely submission of VAT through Xero', '2022-12-02 00:00:00', '', '', 'true', 'Xero.com', '', '', 'FREQ=MONTHLY;BYMONTHDAY=1;INTERVAL=3;', '2022-12-01 00:00:00', '', 'VAT Return', '', '', 12, NULL, NULL),
(4, 'faab6283-a2a9-b132-bad9-178471098051', '', '2022-10-18 20:00:00', '', '', 'false', '', '', '', 'FREQ=WEEKLY;BYDAY=TU;INTERVAL=2;', '2022-10-18 19:00:00', '', 'Bi-weekly Progress Meeting', '', '', 12, NULL, NULL),
(5, '296b0faa-bada-a344-e870-75855c8a975b', 'Monthly Invoice Recon on Xero.com', '2022-12-30 00:00:00', '', '', 'true', '', '', '', 'FREQ=MONTHLY;BYDAY=TH;BYSETPOS=-1;INTERVAL=1;', '2022-12-29 00:00:00', '', 'Monthly Financial Recon', '', '', 12, NULL, NULL);

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
(2, '2022-07-10', '12', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_delivery`
--

CREATE TABLE `tbl_stockcheck_delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_date` varchar(250) NOT NULL,
  `delivery_po` varchar(250) NOT NULL,
  `delivery_logger` varchar(250) NOT NULL,
  `invoice_file` varchar(250) NOT NULL,
  `delivery_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery`
--

INSERT INTO `tbl_stockcheck_delivery` (`delivery_id`, `delivery_date`, `delivery_po`, `delivery_logger`, `invoice_file`, `delivery_status`) VALUES
(1, '2021-10-25', '8', '12', '1657462527_e2c51f8d9f7453554343.pdf', 'Completed'),
(3, '2022-07-17', '13', '12', '1658473480_a7f2a2abbdabf6774651.pdf', 'Completed'),
(4, '2022-07-17', '7', '12', '1658473580_99bf9b6fff856ba486cf.pdf', 'Completed'),
(5, '2022-07-17', '8', '12', '1658473664_3db7f29c80f28080833b.pdf', 'Completed'),
(7, '2022-09-21', '69', '12', '1663784740_ab6decaa473ca81feb38.pdf', 'Completed'),
(8, '2022-09-07', '69', '12', '1663785725_7308ff54e797fd2b5195.pdf', 'Started'),
(9, '2022-10-05', '68', '12', '1664991312_b2e43f89f53833ac7b91.pdf', 'Completed'),
(10, '2022-10-09', '31', '12', '1665320745_236d03299d3ddc2f2f91.pdf', 'Started'),
(11, '2022-10-15', '73', '12', '1665830309_27d69d4d4f46943eb9e5.pdf', 'Completed'),
(12, '2022-10-15', '73', '12', '1665830960_31cee0fd8b5c418625b8.pdf', 'Completed');

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
  `delivery_ingredient_item` varchar(250) NOT NULL,
  `delivery_packaging_item` varchar(255) NOT NULL,
  `delivery_item_date` datetime NOT NULL,
  `delivery_item_price` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_stockcheck_delivery_items`
--

INSERT INTO `tbl_stockcheck_delivery_items` (`delivery_items_id`, `delivery_id`, `delivery_item_qty`, `delivery_item_category`, `delivery_equipment_item`, `delivery_ingredient_item`, `delivery_packaging_item`, `delivery_item_date`, `delivery_item_price`) VALUES
(1, '11', '100', 'Ingredient', '', '2', '', '2022-10-15 11:41:04', ''),
(3, '11', '100', 'Ingredient', '', '6', '', '2022-10-15 11:43:24', ''),
(4, '11', '100', 'Ingredient', '', '4', '', '2022-10-15 11:43:52', ''),
(5, '11', '100', 'Ingredient', '', '32', '', '2022-10-15 11:44:21', ''),
(6, '12', '10', 'Ingredient', '', '12', '', '2022-10-15 11:49:41', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockcheck_items`
--

CREATE TABLE `tbl_stockcheck_items` (
  `stockcheck_items_id` int(11) NOT NULL,
  `stockcheck_id` int(11) NOT NULL,
  `stockcheck_item_category` varchar(250) NOT NULL,
  `stockcheck_item_expected` int(11) NOT NULL,
  `stockcheck_item_actual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stockcheck_items`
--

INSERT INTO `tbl_stockcheck_items` (`stockcheck_items_id`, `stockcheck_id`, `stockcheck_item_category`, `stockcheck_item_expected`, `stockcheck_item_actual`) VALUES
(4, 2, 'ingredient', 100, 23),
(24, 2, 'ingredient', 50, 70),
(23, 2, 'ingredient', 100, 70),
(2, 2, 'ingredient', 500, 313),
(44, 2, 'ingredient', 50, 45),
(12, 2, 'ingredient', 1000, 185),
(31, 2, 'ingredient', 100, 84),
(38, 2, 'ingredient', 250, 200),
(7, 2, 'ingredient', 1000, 920),
(41, 2, 'ingredient', 50, 45),
(22, 2, 'ingredient', 200, 185),
(43, 2, 'ingredient', 1000, 900),
(6, 2, 'ingredient', 1000, 50),
(42, 2, 'ingredient', 50, 45),
(17, 2, 'ingredient', 100, 80),
(13, 2, 'ingredient', 1000, 950),
(32, 2, 'ingredient', 20000, 13750),
(14, 2, 'ingredient', 100, 90),
(36, 2, 'ingredient', 250, 235),
(27, 2, 'ingredient', 1000, 450),
(19, 2, 'ingredient', 50, 50),
(3, 2, 'ingredient', 1000, 681),
(37, 2, 'ingredient', 250, 235),
(5, 2, 'ingredient', 200, 175),
(40, 2, 'ingredient', 100, 85),
(16, 2, 'ingredient', 100, 80),
(26, 2, 'ingredient', 500, 433),
(20, 2, 'ingredient', 100, 100),
(33, 2, 'ingredient', 100, 100),
(11, 2, 'ingredient', 250, 175),
(30, 2, 'ingredient', 1000, 800),
(18, 2, 'ingredient', 250, 235),
(25, 2, 'ingredient', 100, 75),
(10, 2, 'ingredient', 5000, 5000),
(21, 2, 'ingredient', 200, 170),
(34, 2, 'ingredient', 250, 235),
(39, 2, 'ingredient', 50, 45),
(15, 2, 'ingredient', 1000, 450),
(8, 2, 'ingredient', 100, 100),
(9, 2, 'ingredient', 250, 200),
(28, 2, 'ingredient', 500, 450),
(29, 2, 'ingredient', 1000, 803),
(35, 2, 'ingredient', 100, 85);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_policies`
--

CREATE TABLE `tbl_sub_policies` (
  `p_sub_id` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL,
  `p_sub_title` varchar(45) NOT NULL,
  `p_sub_date` varchar(45) NOT NULL,
  `p_sub_file` varchar(5000) NOT NULL,
  `delete_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_processes`
--

CREATE TABLE `tbl_sub_processes` (
  `pr_sub_id` int(11) NOT NULL,
  `process_id` varchar(255) NOT NULL,
  `pr_sub_title` varchar(255) NOT NULL,
  `pr_sub_file` varchar(5000) NOT NULL,
  `delete_at` datetime NOT NULL,
  `pr_sub_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_sub_processes`
--

INSERT INTO `tbl_sub_processes` (`pr_sub_id`, `process_id`, `pr_sub_title`, `pr_sub_file`, `delete_at`, `pr_sub_date`) VALUES
(1, '4', 'Budgets', '1660850955_d2d7a68be33292e1c4dc.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(2, '4', 'Cash Flow', '1660850982_2a7c56da0e1da5adc62b.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(3, '4', 'Reports', '1660850996_aea13579e557eb6f175b.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(4, '4', 'Staff', '1660851009_bf9e99e3d1e982703cb8.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(5, '4', 'PR4-4A - Purchases - Business Purchases', '1660851072_ecc765ea7b5b9db00d21.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(6, '4', 'PR4-4B - Purchase Reconciliation', '1660851267_97a731c0b4ec8c5f8666.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(7, '5', 'PR-4A - Business Purchases', '1660851756_807f170739071c934a13.pdf', '0000-00-00 00:00:00', '2022-08-18'),
(8, '5', 'PR4-4B - Purchase Reconcilation', '1660892141_d5ee3991b376f1b99523.pdf', '0000-00-00 00:00:00', '2022-08-18');

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
(1, 'Ionos', 'ionos.co.uk', 'Services', '2', '4', '3', '5', '5', '5'),
(2, 'Fiverr', 'fiverr.com', 'Services', '3', '4', '4', '4', '5', '5'),
(3, 'Envato', 'envato.com', 'Services', '3', '2', '2', '3', '5', '4'),
(4, 'Ebay', 'ebay.co.uk', 'Equipment', '2', '4', '4', '2', '4', '4'),
(5, 'APC Pure', 'apcpure.com', 'Ingredients', '2', '2', '5', '5', '3', '5'),
(6, 'Makers Ingredients', 'makersingredients.com', 'Ingredients', '3', '3', '2', '1', '3', '5'),
(7, 'Mystic Moments', 'mysticmomentsuk.com', 'Ingredients', '2', '2', '3', '4', '5', '4'),
(8, 'Naturally Thinking', 'naturallythinking.com', 'Ingredients', '5', '4', '4', '4', '4', '4'),
(9, 'The Soapery', 'thesoapery.co.uk', 'Ingredients', '4', '4', '5', '3', '5', '5'),
(10, 'Fresh Skin', 'freshskin.co.uk', 'Ingredients', '3', '4', '5', '5', '5', '3'),
(11, 'Wilko', 'wilko.com', 'Equipment', '2', '2', '4', '2', '5', '5'),
(12, 'Grace Fruit', 'gracefruit.com', 'Ingredients', '2', '1', '3', '1', '3', '5'),
(13, 'The Soap Kitchen', 'thesoapkitchen.co.uk', 'Ingredients', '2', '4', '3', '5', '3', '3'),
(14, 'Ampulla', 'ampulla.co.uk', 'Packaging', '2', '3', '3', '3', '3', '5'),
(15, 'Hobby Craft', 'hobbycraft.co.uk', 'Equipment', '2', '2', '2', '2', '5', '5'),
(16, 'Amazon', 'amazon.co.uk', 'Other', '2', '3', '3', '3', '5', '5'),
(17, 'Poundland', 'poundland.co.uk', 'Equipment', '1', '1', '5', '1', '5', '5'),
(18, 'Vevor', 'vevor.co.uk', 'Equipment', '1', '1', '3', '1', '5', '1'),
(19, 'Home Bargins', 'homebargins.co.uk', 'Packaging', '1', '2', '2', '2', '5', '5'),
(20, 'Aldi', 'aldi.co.uk', 'Other', '1', '2', '4', '1', '5', '5'),
(21, 'iBottles', 'ibottles.co.uk', 'Packaging', '3', '3', '3', '4', '3', '5'),
(22, 'Akanni - Web Developer', 'N/A', 'Services', '5', '5', '5', '5', '5', '5'),
(23, 'Royal Mail', 'royalmail.com', 'Services', '3', '3', '5', '1', '1', '1'),
(24, 'Companies House', 'ewf.companieshouse.gov.uk', 'Services', '1', '5', '1', '5', '5', '5'),
(25, 'Monzo', 'monzo.com', 'Services', '1', '5', '3', '5', '5', '3'),
(26, 'GhostMail', 'ghostmail.co.uk', 'Services', '5', '5', '5', '5', '5', '4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tasks`
--

CREATE TABLE `tbl_tasks` (
  `task_id` int(11) NOT NULL,
  `task_duedate` varchar(255) NOT NULL,
  `task_title` varchar(255) NOT NULL,
  `task_department` varchar(255) NOT NULL,
  `task_category` varchar(255) NOT NULL,
  `task_assignee` int(11) NOT NULL,
  `task_summary` varchar(255) NOT NULL,
  `task_issuedate` varchar(255) NOT NULL,
  `task_creator` int(11) NOT NULL,
  `task_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tasks`
--

INSERT INTO `tbl_tasks` (`task_id`, `task_duedate`, `task_title`, `task_department`, `task_category`, `task_assignee`, `task_summary`, `task_issuedate`, `task_creator`, `task_status`) VALUES
(2, '2022-10-16', 'Test', 'Research & Development', 'Document', 13, 'Test', '2022-10-16', 12, 'In Progress');

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
  `staff_level` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`staff_id`, `staff_first_name`, `staff_last_name`, `staff_email`, `staff_password`, `staff_role`, `staff_department`, `staff_level`) VALUES
(8, 'Developer', 'Admin', 'Developer', '$2y$10$naxkQtoRW9gTwfhCM1WIiOENgXXJblYKp5GAml7fFv72JCV5dPZb6', 'Administrator', 'All Access', 'All Access'),
(12, 'Nathan', 'Reid', 'nathanr', '$2y$10$QiKIXXC9y20.OG4ZiHrTgenwp8Q3u5YQQE1QOez0FrjE6EjA7cjze', 'Director', 'All Access', 'All Access'),
(13, 'Rochelle', 'Saunders', 'rochs', '$2y$10$gBIWkiLLG7Euw04/TATyLOmq.BJ1rIlBKa7JiQYrT9yY.IfKSqAAe', 'Administrator', 'All Access', 'Authorisor'),
(14, 'Renzo', 'Vigliotti', 'renzov', '$2y$10$uoBSorRtaBxzdH3TNv5uZeDfZReiurE4dwW543AUlz97T/aZtI/fe', 'Director', 'All Access', 'Authorisor'),
(15, 'Ben', 'Wilkin', 'benw', '$2y$10$SPzjWG2jFvC.38rDp41/OOcZHezcGG15up46COXagTjbF38kgeQju', 'Accountant', 'Corporate', 'Contributor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_budgets`
--
ALTER TABLE `tbl_budgets`
  ADD PRIMARY KEY (`budgets_id`);

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
-- Indexes for table `tbl_marketing`
--
ALTER TABLE `tbl_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `tbl_meetings`
--
ALTER TABLE `tbl_meetings`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `tbl_models`
--
ALTER TABLE `tbl_models`
  ADD PRIMARY KEY (`models_id`);

--
-- Indexes for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  ADD PRIMARY KEY (`models_id`);

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
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tbl_packaging`
--
ALTER TABLE `tbl_packaging`
  ADD PRIMARY KEY (`packaging_id`);

--
-- Indexes for table `tbl_policies`
--
ALTER TABLE `tbl_policies`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `tbl_processes`
--
ALTER TABLE `tbl_processes`
  ADD PRIMARY KEY (`process_id`);

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
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`schedule_id`);

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
-- Indexes for table `tbl_sub_policies`
--
ALTER TABLE `tbl_sub_policies`
  ADD PRIMARY KEY (`p_sub_id`);

--
-- Indexes for table `tbl_sub_processes`
--
ALTER TABLE `tbl_sub_processes`
  ADD PRIMARY KEY (`pr_sub_id`);

--
-- Indexes for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  ADD PRIMARY KEY (`task_id`);

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
  MODIFY `budgets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_corporate_formula`
--
ALTER TABLE `tbl_corporate_formula`
  MODIFY `corporate_formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_corporate_ingredients`
--
ALTER TABLE `tbl_corporate_ingredients`
  MODIFY `corporate_ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_cpn`
--
ALTER TABLE `tbl_cpn`
  MODIFY `cpn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_equipment`
--
ALTER TABLE `tbl_equipment`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tbl_formula`
--
ALTER TABLE `tbl_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_formula_ingredients`
--
ALTER TABLE `tbl_formula_ingredients`
  MODIFY `f_ingredients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_ingredients_batch`
--
ALTER TABLE `tbl_ingredients_batch`
  MODIFY `ingredient_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_manuf_production`
--
ALTER TABLE `tbl_manuf_production`
  MODIFY `manuf_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_manuf_production_batch`
--
ALTER TABLE `tbl_manuf_production_batch`
  MODIFY `manuf_production_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_marketing`
--
ALTER TABLE `tbl_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_meetings`
--
ALTER TABLE `tbl_meetings`
  MODIFY `meeting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models`
--
ALTER TABLE `tbl_models`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_manufacturing`
--
ALTER TABLE `tbl_models_manufacturing`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_models_overheads`
--
ALTER TABLE `tbl_models_overheads`
  MODIFY `models_overheads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  MODIFY `model_package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_packaging`
--
ALTER TABLE `tbl_packaging`
  MODIFY `packaging_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_policies`
--
ALTER TABLE `tbl_policies`
  MODIFY `policy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_processes`
--
ALTER TABLE `tbl_processes`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_rd_log`
--
ALTER TABLE `tbl_rd_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_rd_media`
--
ALTER TABLE `tbl_rd_media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rd_plan`
--
ALTER TABLE `tbl_rd_plan`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_rd_production`
--
ALTER TABLE `tbl_rd_production`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_rd_production_batch`
--
ALTER TABLE `tbl_rd_production_batch`
  MODIFY `production_batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_stockcheck`
--
ALTER TABLE `tbl_stockcheck`
  MODIFY `stockcheck_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_stockcheck_delivery`
--
ALTER TABLE `tbl_stockcheck_delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_stockcheck_delivery_items`
--
ALTER TABLE `tbl_stockcheck_delivery_items`
  MODIFY `delivery_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_sub_policies`
--
ALTER TABLE `tbl_sub_policies`
  MODIFY `p_sub_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sub_processes`
--
ALTER TABLE `tbl_sub_processes`
  MODIFY `pr_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
