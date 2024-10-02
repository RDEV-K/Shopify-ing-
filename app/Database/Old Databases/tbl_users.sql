-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 07, 2023 at 03:28 PM
-- Server version: 10.6.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u362910151_cosman`
--

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
  `stripe_product_id` varchar(255) NOT NULL,
  `stripe_product_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_password`, `stripe_customer_id`, `stripe_subscription_id`, `stripe_subscription_status`, `stripe_product_id`, `stripe_product_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nathaniel', 'Reid', 'nl.rd@outlook.com', '$2y$10$vwmo485mWPnLDDo1YqawSuBuLkKLmCYvhZ8PMPhLcQQO8Ugyc6Baa', 'cus_NIfS5W9ZkobqPq', 'sub_1MY47DFcWMpKvcw6t14c4QyP', 'active', '', '', '2023-02-05 10:17:44', '2023-02-27 18:35:29', NULL),
(2, 'Nathaniel', 'Reid', 'nathanielreid@hotmail.co.uk', '$2y$10$sJ.kc9gLlQtFkAgpB9YyvutGEqiN3jiH8z7B.AGCWBldwjDhqg5oS', 'cus_NKWFy2wn7Pw3ox', 'sub_1MZrCcFcWMpKvcw6yj7RGkhb', 'trialing', '', '', '2023-02-10 07:42:45', '2023-08-10 10:53:30', NULL),
(4, 'Nathaniel', 'Reid', 'hello@cosmeticmanager.com', '$2y$10$C7hRB60e6.GN43ulHXdhSOIaZ4kQuurLS0bMZsCEMfzKgip0VfQL2', 'cus_NSs5IAyTU2Z1pA', 'sub_1MhwLRFcWMpKvcw6YiNqQKMI', 'active', '', '', '2023-03-04 14:46:50', '2023-08-10 10:54:12', NULL),
(5, 'Nathaniel', 'Reid', 'contact@kleanaf.com', '$2y$10$SEWMA4ixdbzUFIv80XbM2eGpjEvEQba91PnNRmwhRKmiTD3JUeeD2', 'cus_OGdvW7rGiyoYHL', 'sub_1NU6e8He9x5IZmTsJRuMMXdb', 'canceled', 'ppress_prod_683pp8r7ac60', 'Pro', '2023-06-11 20:02:06', '2023-08-11 06:56:28', NULL),
(14, 'Akeem', 'Ola', 'akanni.olas.6767@gmail.com', '$2y$10$qC4mIUssf5DO4NbLWWwJP.vQG5H6smVyEvkGNN/rBSu67LFvPaCcW', 'cus_OF6GRTPHr0Z3tJ', 'sub_1NSc48He9x5IZmTs5JI59ufX', 'trialing', 'ppress_prod_683pp8r7ac60', 'Pro', '2023-07-11 09:28:04', '2023-08-10 10:53:58', NULL),
(16, 'Node', 'Pop', 'nodepops.olas@gmail.com', '$2y$10$rvnGUPdpI7yG.c6DPKpZUOCgZizM9RpJlwItIyDTWM.1BqSrP3nkO', 'cus_ORaFVwSeaJCQQu', 'sub_1Neh4sFcWMpKvcw6Q1BDq5zq', 'trialing', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-07-11 11:22:28', '2023-08-16 04:25:44', NULL),
(17, 'Tester1', 'Somebody', 'paxas67893@mahmul.com', '$2y$10$MDdbymm1a54AzqoEnBtGEufIO7WKZn/tkUNRQeThlpUtRuhrYeXg6', '', '', 'active', '', 'Free', '2023-07-12 07:12:28', '2023-08-10 10:54:32', NULL),
(18, 'Tester2', 'Somebody', 'dixiro3491@mahmul.com', '$2y$10$SBY.2Ae5206J.mBjtcygaeGPIAIXHNgi6F0oBoxfhlbA.HKlS1s5m', '', 'sub_1NSwLyHe9x5IZmTsAJW8ormw', 'trialling', '', 'Pro', '2023-07-12 07:18:50', '2023-08-10 10:54:38', NULL),
(19, 'Nathan', 'Reid', 'pisas55366@kameili.com', '$2y$10$UQs7qis7xJI2ddMKv8ErseKlK0jBtciRrOxUTUHJxYtBLXVN5EICe', 'cus_OGb18VYy9FYC4U', 'sub_1NU3pqHe9x5IZmTsrX2qCeih', 'active', 'ppress_prod_683pp8r7ac60', 'Pro', '2023-07-15 09:30:25', '2023-08-10 10:54:42', NULL),
(22, 'Abdulakeem', 'Akanni', 'akanni.olas@gmail.com', '$2y$10$1Ngcup5jUzJ17lnGdkYCGuBSI82HXjDcxl/nPNNBes5U2XwRtRDpq', 'cus_OQMAgritGmtgng', 'sub_1NdVSFHe9x5IZmTsceMCqE5S', 'active', 'ppress_prod_683pp8r7ac60', 'Pro', '2023-08-11 07:39:16', '2023-08-11 07:39:16', NULL),
(23, 'Keem', 'Akanni', 'keem@gmail.com', '$2y$10$yJoFL9bVYP76qkQRPY5Z4OwpR2KbXZ7cRaSpxPJfBsKuAuiq4pY4m', 'cus_ORaFVwSeaJCQQu', 'sub_1Neh4sFcWMpKvcw6Q1BDq5zq', 'trialing', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-08-13 18:54:28', '2023-08-13 18:54:28', NULL),
(24, 'Teff', 'Jiff', 'tebojif649@avidapro.com', '$2y$10$SiXuamS12HG7M2.bHZh1JOMgQDK41d.nVLWsmxsMLbT90gdmpey/e', 'cus_OSk9DUjyXnV09q', 'sub_1NfofYFcWMpKvcw6WQDyPLjm', 'active', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-08-16 19:43:29', '2023-08-16 18:43:51', NULL),
(25, 'Tee', 'Boj', 'gegesev904@chodyi.com', '$2y$10$FYQuT/0UnIq7KlP2GLuzW.wkLWWc3UriQkl8KjrW8jg6VFYsqdWxm', 'cus_OSkEDZu4QL6N32', 'sub_1NfojuFcWMpKvcw6sTiwfddi', 'active', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-08-16 19:48:33', '2023-08-16 18:56:22', NULL),
(26, 'Abdulakeem', 'Mukaila', 'softdephjs@gmail.com', '$2y$10$0kyIXfBeLDYZFlmYIYXEmez6q5QCD8A1NuZBD62T39OVwg3mI6kQi', 'cus_OeaFY13rFt2mid', 'sub_1NrH5FFcWMpKvcw6KL9elczc', 'active', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-09-17 10:20:42', '2023-09-17 20:26:30', NULL),
(27, 'John', 'Smith', 'vedofoc956@twugg.com', '$2y$10$amCX7G9ZEnng0tj3SMKfDOIqe7fqhyH3It3AmpsQv8q2pTyxg0TPK', 'cus_OehJ9czgDVi2yb', 'sub_1NrNv7FcWMpKvcw6E1tsDmOg', 'active', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-09-17 17:26:06', '2023-10-01 15:44:07', NULL),
(28, 'Abdulakeem', 'Mukaila', 'soft@gmail.com', '$2y$10$LqZDmVE8tkhthAgL0vDyRu4724VZkJQ82MkRERlB1K8PC4ueIAJka', 'cus_OhhSroW0mQLoPA', 'sub_1NuI41FcWMpKvcw6I6WMReAv', 'active', 'ppress_prod_683pp8r7ac60', 'Professional', '2023-09-25 17:56:46', '2023-09-25 17:04:27', NULL),
(29, 'Fran', 'Willis', 'tester@ingrevo.com', '$2y$10$O9ZiBPGrPWsLv.l.gWNEwOiFcDs5oJHTzWAovwpWTR0A9.GC9UoTC', '', 'sub_1NwS4aFcWMpKvcw6AzeQmt64', 'active', '', 'Professional', '2023-10-01 17:01:29', '2023-10-01 17:01:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
