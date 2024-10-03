-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2022 at 08:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_packaging`
--
ALTER TABLE `tbl_packaging`
  ADD PRIMARY KEY (`packaging_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_packaging`
--
ALTER TABLE `tbl_packaging`
  MODIFY `packaging_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
