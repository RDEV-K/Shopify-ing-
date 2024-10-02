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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`schedule_id`, `scheduled_Id`, `schedule_description`, `schedule_endtime`, `schedule_endtimezone`, `schedule_following_id`, `schedule_isallday`, `schedule_location`, `schedule_recurrenceEx`, `schedule_recID`, `schedule_recRule`, `schedule_startTime`, `schedule_startTimezone`, `schedule_subject`, `schedule_generate_date`, `schedule_guid`, `schedule_assigned`, `created_at`, `deleted_at`) VALUES
(15, 'd80b5db7-92da-865b-e8e9-77b2df49978b', '', '1969-12-31 18:00:00', '', '', 'true', '', '', '', '', '1969-12-31 18:00:00', '', 'Test', '', '', 12, NULL, NULL),
(2, '2', '', '2022-08-03 09:30:00', '', '', 'false', '', '', '', '', '2022-08-03 09:00:00', '', 'HIeil', '', '', NULL, NULL, NULL),
(3, '3', '', '2022-08-02 00:00:00', '', '', 'true', '', '', '', 'FREQ=WEEKLY;BYDAY=MO,TH,SA;INTERVAL=5;UNTIL=20220929T230000Z;', '2022-08-01 00:00:00', '', 'Nwe 1', '', '', NULL, NULL, NULL),
(6, '0b86e38a-c68a-949c-8b12-2aade7699e5a', 'this is descript', '2022-08-02 00:00:00', '', '', 'true', 'Location updated', '', '', '', '2022-08-01 00:00:00', '', 'this is title updated', '', '6bb6a5a0-c539-8af7-28d8-70bcd6188c68', NULL, NULL, NULL),
(8, '080cb390-45da-81da-bb08-92b9ff4a9c02', 'This is for children day entertainment, So you have to be there', '2022-08-17 23:00:00', 'Europe/Madrid', '', 'false', 'Ayedaade Grammar School', '', '', 'FREQ=YEARLY;BYMONTHDAY=27;BYMONTH=5;INTERVAL=1;COUNT=2;', '2022-08-17 00:00:00', 'Africa/Lagos', 'Children Day', '', '8b3380a1-9918-bd5c-3ab8-6292ae59868a', 12, NULL, NULL),
(13, '2a855498-2b1b-8a36-1b61-eca687788f04', '', '2022-08-09 00:00:00', '', '', 'true', '', '', '', '', '2022-07-09 00:00:00', '', 'Q1 - VAT Return', '', '', 12, NULL, NULL),
(12, 'd81f71a6-ca88-a39c-2842-b6868b3ab081', '', '2022-08-09 00:00:00', '', '', 'true', 'XERO', '', '', '', '2022-07-09 00:00:00', '', 'VAt Return', '', '', 12, NULL, NULL),
(14, 'e8b7db9a-2e0a-a0ec-da28-e5ad990a920c', '', '1969-12-31 18:00:00', '', '', 'true', 'XERO', '', '', '', '1969-12-31 18:00:00', '', 'Q1- VAT', '', '', 12, NULL, NULL),
(16, '395b3088-67ab-904c-daf9-cfb70cd8ac99', '', '1969-12-31 18:00:00', '', '', 'true', '', '', '', '', '1969-12-31 18:00:00', '', 'Test Save Item', '', '', 12, NULL, NULL),
(22, '591b3f8c-f9b8-b82b-5a04-b3b19b39959f', '', '2022-09-04 01:00:00', '', '', 'true', '', '', '', '', '2022-09-03 01:00:00', '', 'Third', '', '', 5, NULL, NULL),
(21, '1', '', '2022-09-02 01:00:00', '', '', 'true', '', '', '', '', '2022-09-01 01:00:00', '', 'First Day', '', '', 5, NULL, NULL),
(23, '7b385991-1f78-adea-6ab7-b7a70f68b7c7', '', '2022-09-10 01:00:00', '', '', 'true', '', '', '', '', '2022-09-09 01:00:00', '', 'Nineth', '', '', 5, NULL, NULL),
(24, '99b60da8-2f7b-be61-aba3-30874edaafde', '', '2022-09-16 01:00:00', '', '', 'true', '', '', '', '', '2022-09-15 01:00:00', '', 'Fifteen', '', '', 5, NULL, NULL),
(25, 'ba690aa4-0f98-8600-f954-b78190a89981', '', '2022-09-20 01:00:00', '', '', 'true', '', '', '', '', '2022-09-19 01:00:00', '', 'One and Nine', '', '', 5, NULL, NULL),
(26, '3b478480-08fa-aeee-a973-7982011abb5d', 'This is just for testing', '2022-09-07 01:00:00', 'UTC', '', 'false', 'From Nigeria', '20220907T230000Z', '', 'FREQ=WEEKLY;BYDAY=TU,TH;INTERVAL=1;UNTIL=20220914T080000Z;', '2022-09-06 01:00:00', 'UTC', 'Today', '', '78fd7d9d-7d2b-a01a-daeb-9baded589375', 5, NULL, NULL),
(27, '68e00786-cdf9-b716-397f-cba746a8b7f0', '', '2022-09-22 01:00:00', '', '', 'true', '', '', '', '', '2022-09-21 01:00:00', '', 'Hello', '', '', 5, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
