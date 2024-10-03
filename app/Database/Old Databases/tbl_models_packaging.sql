-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 11:52 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
-- Table structure for table `tbl_models_packaging`
--

CREATE TABLE `tbl_models_packaging` (
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
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  ADD PRIMARY KEY (`models_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_models_packaging`
--
ALTER TABLE `tbl_models_packaging`
  MODIFY `models_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
