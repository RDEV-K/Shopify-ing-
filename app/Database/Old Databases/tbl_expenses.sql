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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`expenses_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
