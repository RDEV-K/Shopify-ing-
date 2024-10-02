-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2023 at 03:40 PM
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
-- Database: `dbs9676241`
--

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_coupons`
--

CREATE TABLE `ougvp_ppress_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `coupon_application` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_onetime_use` enum('true','false') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `amount` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `plan_ids` mediumtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `usage_limit` mediumint(8) UNSIGNED DEFAULT NULL,
  `status` enum('true','false') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'true',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_coupons`
--

INSERT INTO `ougvp_ppress_coupons` (`id`, `code`, `description`, `coupon_application`, `coupon_type`, `is_onetime_use`, `amount`, `unit`, `plan_ids`, `usage_limit`, `status`, `start_date`, `end_date`) VALUES
(1, 'FreeForever', '', 'any', 'recurring', 'false', '100', 'percent', '[\"2\"]', 0, 'true', '0000-00-00', '0000-00-00'),
(2, '14DT', 'Free 14 Day Trial Period', 'acquisition', 'one_time', 'false', '50', 'percent', '[\"2\"]', 0, 'true', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_customers`
--

CREATE TABLE `ougvp_ppress_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `private_note` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `total_spend` decimal(18,9) NOT NULL DEFAULT 0.000000000,
  `purchase_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_customers`
--

INSERT INTO `ougvp_ppress_customers` (`id`, `user_id`, `private_note`, `total_spend`, `purchase_count`, `last_login`, `date_created`) VALUES
(1, 8, '', 10.000000000, 2, '2023-08-20 19:15:10', '2023-07-15 11:28:18'),
(2, 10, '', 0.000000000, 1, NULL, '2023-07-22 12:12:04'),
(3, 5, '', 0.000000000, 1, '2023-07-27 19:58:36', '2023-07-24 18:35:59'),
(6, 11, '', 5.000000000, 1, NULL, '2023-07-27 21:45:00'),
(7, 12, '', 5.000000000, 1, NULL, '2023-08-08 14:15:33'),
(8, 13, '', 5.000000000, 2, '2023-08-10 09:24:00', '2023-08-09 11:06:14'),
(9, 14, '', 5.000000000, 1, NULL, '2023-08-10 09:46:53'),
(10, 16, '', 0.000000000, 1, NULL, '2023-08-11 18:45:19'),
(11, 17, '', 0.000000000, 1, NULL, '2023-08-11 18:51:27'),
(12, 18, '', 0.000000000, 1, NULL, '2023-08-11 18:55:55'),
(13, 19, '', 0.000000000, 1, NULL, '2023-08-11 18:56:26'),
(14, 20, '', 0.000000000, 1, NULL, '2023-08-13 08:17:47'),
(15, 21, '', 0.000000000, 1, NULL, '2023-08-13 08:26:26'),
(16, 22, '', 0.000000000, 0, NULL, '2023-08-13 08:27:47'),
(17, 23, '', 0.000000000, 0, NULL, '2023-08-13 08:30:50'),
(18, 24, '', 0.000000000, 0, NULL, '2023-08-13 08:33:13'),
(19, 25, '', 0.000000000, 0, NULL, '2023-08-13 08:45:48'),
(22, 28, '', 5.000000000, 1, NULL, '2023-08-13 16:18:13'),
(23, 29, '', 0.000000000, 1, NULL, '2023-08-13 16:23:40'),
(24, 31, '', 0.000000000, 1, NULL, '2023-08-15 05:33:31'),
(25, 32, '', 0.000000000, 1, NULL, '2023-08-15 17:42:36'),
(26, 33, '', 5.000000000, 1, NULL, '2023-08-15 17:44:03'),
(27, 34, '', 0.000000000, 1, NULL, '2023-08-15 17:49:20'),
(28, 35, '', 5.000000000, 1, NULL, '2023-08-15 17:50:49'),
(29, 36, '', 5.000000000, 1, NULL, '2023-08-16 18:42:10'),
(30, 37, '', 5.000000000, 1, NULL, '2023-08-16 18:46:40'),
(31, 38, '', 0.000000000, 1, NULL, '2023-08-20 19:40:54'),
(32, 39, '', 0.000000000, 1, NULL, '2023-08-20 19:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_forms`
--

CREATE TABLE `ougvp_ppress_forms` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `form_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `builder_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_forms`
--

INSERT INTO `ougvp_ppress_forms` (`id`, `name`, `form_id`, `form_type`, `builder_type`, `date`) VALUES
(1, 'Default Registration', 1, 'registration', 'dragdrop', '2023-08-01 19:13:55'),
(2, 'Login', 1, 'login', 'dragdrop', '2023-08-01 19:13:55'),
(3, 'Default Password Reset', 1, 'password-reset', 'dragdrop', '2023-08-01 19:13:55'),
(4, 'Default Edit Profile', 1, 'edit-profile', 'dragdrop', '2023-08-01 19:13:55'),
(5, 'Default User Profile', 1, 'user-profile', 'dragdrop', '2023-08-01 19:13:56'),
(6, 'Default Member Directory', 1, 'member-directory', 'dragdrop', '2023-08-01 19:13:56'),
(7, 'Lucid Tab Widget', 1, 'melange', 'shortcode', '2023-08-01 19:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_formsmeta`
--

CREATE TABLE `ougvp_ppress_formsmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `form_type` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_formsmeta`
--

INSERT INTO `ougvp_ppress_formsmeta` (`meta_id`, `form_id`, `form_type`, `meta_key`, `meta_value`) VALUES
(1, 1, 'registration', 'form_class', 's:5:\"Tulip\";'),
(2, 1, 'registration', 'form_builder_fields_settings', 's:849:\"[{\"placeholder\":\"First Name\",\"fieldType\":\"reg-first-name\",\"fieldTitle\":\"First Name\",\"fieldBarTitle\":\"First Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"icon\":\"perm_identity\",\"sortID\":1},{\"placeholder\":\"Last Name\",\"fieldType\":\"reg-last-name\",\"fieldTitle\":\"Last Name\",\"fieldBarTitle\":\"Last Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"icon\":\"perm_identity\",\"sortID\":2},{\"placeholder\":\"Email Address\",\"fieldType\":\"reg-email\",\"fieldTitle\":\"Email Address\",\"fieldBarTitle\":\"Email Address\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-email\\\"></span>\",\"icon\":\"email\",\"sortID\":3},{\"placeholder\":\"Password\",\"fieldType\":\"reg-password\",\"fieldTitle\":\"Password\",\"fieldBarTitle\":\"Password\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-lock\\\"></span>\",\"password_visibility_icon\":true,\"sortID\":4}]\";'),
(3, 1, 'registration', 'submit_button_text', 's:8:\"Register\";'),
(4, 1, 'registration', 'submit_button_processing_label', 's:10:\"Processing\";'),
(5, 1, 'registration', 'success_message', 's:24:\"Registration successful.\";'),
(6, 1, 'registration', 'registration_user_role', 's:10:\"subscriber\";'),
(7, 1, 'registration', 'buildscratch_form_width', 's:5:\"400px\";'),
(8, 1, 'registration', 'buildscratch_form_font_family', 's:12:\"Merriweather\";'),
(9, 1, 'registration', 'buildscratch_remove_form_frame', 's:5:\"false\";'),
(10, 1, 'registration', 'buildscratch_hide_required_asterisk', 's:5:\"false\";'),
(11, 1, 'registration', 'buildscratch_form_bg_color', 's:7:\"#ffffff\";'),
(12, 1, 'registration', 'buildscratch_form_social_buttons', 'a:3:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:6:\"google\";}'),
(13, 1, 'registration', 'buildscratch_form_headline', 's:17:\"Create an Account\";'),
(14, 1, 'registration', 'buildscratch_forgot_password_label', 's:19:\"Lost your password?\";'),
(15, 1, 'registration', 'buildscratch_signup_label', 's:8:\"Register\";'),
(16, 1, 'registration', 'buildscratch_login_label', 's:22:\"Have an account? Login\";'),
(17, 1, 'registration', 'buildscratch_field_layout', 's:4:\"pill\";'),
(18, 1, 'registration', 'buildscratch_label_field_size', 's:6:\"medium\";'),
(19, 1, 'registration', 'buildscratch_label_field_icon_alignment', 's:5:\"right\";'),
(20, 1, 'registration', 'buildscratch_field_icon_color', 's:7:\"#666666\";'),
(21, 1, 'registration', 'buildscratch_field_border_color', 's:7:\"#dbdbdb\";'),
(22, 1, 'registration', 'buildscratch_field_border_focus_color', 's:7:\"#999999\";'),
(23, 1, 'registration', 'buildscratch_field_bg_color', 's:7:\"#ffffff\";'),
(24, 1, 'registration', 'buildscratch_field_bg_focus_color', 's:7:\"#ffffff\";'),
(25, 1, 'registration', 'buildscratch_label_color', 's:7:\"#444444\";'),
(26, 1, 'registration', 'buildscratch_label_font_size', 's:2:\"14\";'),
(27, 1, 'registration', 'buildscratch_label_font_weight', 's:4:\"bold\";'),
(28, 1, 'registration', 'buildscratch_description_color', 's:7:\"#666666\";'),
(29, 1, 'registration', 'buildscratch_description_alignment', 's:4:\"left\";'),
(30, 1, 'registration', 'buildscratch_field_value_font_size', 's:2:\"14\";'),
(31, 1, 'registration', 'buildscratch_field_value_color', 's:7:\"#69717a\";'),
(32, 1, 'registration', 'buildscratch_field_placeholder_color', 's:7:\"#999999\";'),
(33, 1, 'registration', 'buildscratch_submit_button_layout', 's:4:\"pill\";'),
(34, 1, 'registration', 'buildscratch_submit_button_width', 's:10:\"full-width\";'),
(35, 1, 'registration', 'buildscratch_submit_button_font_size', 's:2:\"16\";'),
(36, 1, 'registration', 'buildscratch_submit_button_font_weight', 's:4:\"bold\";'),
(37, 1, 'registration', 'buildscratch_submit_button_bg_color', 's:7:\"#000000\";'),
(38, 1, 'registration', 'buildscratch_submit_button_text_color', 's:7:\"#ffffff\";'),
(39, 1, 'registration', 'buildscratch_submit_button_bg_focus_color', 's:7:\"#dbdbdb\";'),
(40, 1, 'registration', 'buildscratch_submit_button_text_focus_color', 's:7:\"#000000\";'),
(41, 1, 'login', 'form_class', 's:5:\"Tulip\";'),
(42, 1, 'login', 'form_builder_fields_settings', 's:822:\"[{\"placeholder\":\"Username or Email\",\"fieldType\":\"login-username\",\"fieldTitle\":\"User Login\",\"fieldBarTitle\":\"\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"icon\":\"verified_user\",\"label\":\"\",\"description\":\"\",\"field_width\":\"full\",\"label_display\":\"above\",\"description_appearance\":\"standard\",\"class\":\"\"},{\"placeholder\":\"Password\",\"fieldType\":\"login-password\",\"fieldTitle\":\"Password\",\"fieldBarTitle\":\"Password\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-lock\\\"></span>\",\"password_visibility_icon\":true},{\"label\":\"Remember Me\",\"fieldType\":\"login-remember\",\"fieldTitle\":\"Remember Login\",\"fieldBarTitle\":\"Remember Me\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-clock\\\"></span>\",\"description\":\"\",\"field_width\":\"full\",\"icon\":\"\",\"label_display\":\"above\",\"description_appearance\":\"standard\",\"class\":\"\"}]\";'),
(43, 1, 'login', 'submit_button_text', 's:6:\"Log In\";'),
(44, 1, 'login', 'submit_button_processing_label', 's:10:\"Processing\";'),
(45, 1, 'login', 'success_message', 's:0:\"\";'),
(46, 1, 'login', 'registration_user_role', 's:10:\"subscriber\";'),
(47, 1, 'login', 'buildscratch_form_width', 's:5:\"400px\";'),
(48, 1, 'login', 'buildscratch_form_font_family', 's:12:\"Merriweather\";'),
(49, 1, 'login', 'buildscratch_remove_form_frame', 's:5:\"false\";'),
(50, 1, 'login', 'buildscratch_hide_required_asterisk', 's:5:\"false\";'),
(51, 1, 'login', 'buildscratch_form_bg_color', 's:7:\"#ffffff\";'),
(52, 1, 'login', 'buildscratch_form_social_buttons', 'a:3:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:6:\"google\";}'),
(53, 1, 'login', 'buildscratch_form_headline', 's:23:\"Sign in to Your Account\";'),
(54, 1, 'login', 'buildscratch_forgot_password_label', 's:19:\"Lost your password?\";'),
(55, 1, 'login', 'buildscratch_signup_label', 's:8:\"Register\";'),
(56, 1, 'login', 'buildscratch_login_label', 's:5:\"Login\";'),
(57, 1, 'login', 'buildscratch_field_layout', 's:4:\"pill\";'),
(58, 1, 'login', 'buildscratch_label_field_size', 's:6:\"medium\";'),
(59, 1, 'login', 'buildscratch_label_field_icon_alignment', 's:5:\"right\";'),
(60, 1, 'login', 'buildscratch_field_icon_color', 's:7:\"#666666\";'),
(61, 1, 'login', 'buildscratch_field_border_color', 's:7:\"#dbdbdb\";'),
(62, 1, 'login', 'buildscratch_field_border_focus_color', 's:7:\"#999999\";'),
(63, 1, 'login', 'buildscratch_field_bg_color', 's:7:\"#ffffff\";'),
(64, 1, 'login', 'buildscratch_field_bg_focus_color', 's:7:\"#ffffff\";'),
(65, 1, 'login', 'buildscratch_label_color', 's:7:\"#444444\";'),
(66, 1, 'login', 'buildscratch_label_font_size', 's:2:\"14\";'),
(67, 1, 'login', 'buildscratch_label_font_weight', 's:4:\"bold\";'),
(68, 1, 'login', 'buildscratch_description_color', 's:7:\"#666666\";'),
(69, 1, 'login', 'buildscratch_description_alignment', 's:4:\"left\";'),
(70, 1, 'login', 'buildscratch_field_value_font_size', 's:2:\"14\";'),
(71, 1, 'login', 'buildscratch_field_value_color', 's:7:\"#69717a\";'),
(72, 1, 'login', 'buildscratch_field_placeholder_color', 's:7:\"#999999\";'),
(73, 1, 'login', 'buildscratch_submit_button_layout', 's:4:\"pill\";'),
(74, 1, 'login', 'buildscratch_submit_button_width', 's:10:\"full-width\";'),
(75, 1, 'login', 'buildscratch_submit_button_font_size', 's:2:\"16\";'),
(76, 1, 'login', 'buildscratch_submit_button_font_weight', 's:4:\"bold\";'),
(77, 1, 'login', 'buildscratch_submit_button_bg_color', 's:7:\"#000000\";'),
(78, 1, 'login', 'buildscratch_submit_button_text_color', 's:7:\"#ffffff\";'),
(79, 1, 'login', 'buildscratch_submit_button_bg_focus_color', 's:7:\"#dbdbdb\";'),
(80, 1, 'login', 'buildscratch_submit_button_text_focus_color', 's:7:\"#000000\";'),
(81, 1, 'password-reset', 'form_class', 's:5:\"Tulip\";'),
(82, 1, 'password-reset', 'form_builder_fields_settings', 's:208:\"[{\"placeholder\":\"Username or Email\",\"fieldType\":\"user-login\",\"fieldTitle\":\"User Login\",\"fieldBarTitle\":\"Username or Email\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"icon\":\"face\"}]\";'),
(83, 1, 'password-reset', 'submit_button_text', 's:14:\"Reset Password\";'),
(84, 1, 'password-reset', 'submit_button_processing_label', 's:10:\"Processing\";'),
(85, 1, 'password-reset', 'success_message', 's:42:\"Check your email for further instructions.\";'),
(86, 1, 'password-reset', 'registration_user_role', 's:10:\"subscriber\";'),
(87, 1, 'password-reset', 'buildscratch_form_width', 's:5:\"400px\";'),
(88, 1, 'password-reset', 'buildscratch_form_font_family', 's:12:\"Merriweather\";'),
(89, 1, 'password-reset', 'buildscratch_remove_form_frame', 's:5:\"false\";'),
(90, 1, 'password-reset', 'buildscratch_hide_required_asterisk', 's:5:\"false\";'),
(91, 1, 'password-reset', 'buildscratch_form_bg_color', 's:7:\"#ffffff\";'),
(92, 1, 'password-reset', 'buildscratch_form_social_buttons', 'a:3:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:6:\"google\";}'),
(93, 1, 'password-reset', 'buildscratch_form_headline', 's:19:\"Reset Your Password\";'),
(94, 1, 'password-reset', 'buildscratch_forgot_password_label', 's:19:\"Lost your password?\";'),
(95, 1, 'password-reset', 'buildscratch_signup_label', 's:8:\"Register\";'),
(96, 1, 'password-reset', 'buildscratch_login_label', 's:15:\"Return to Login\";'),
(97, 1, 'password-reset', 'buildscratch_field_layout', 's:4:\"pill\";'),
(98, 1, 'password-reset', 'buildscratch_label_field_size', 's:6:\"medium\";'),
(99, 1, 'password-reset', 'buildscratch_label_field_icon_alignment', 's:5:\"right\";'),
(100, 1, 'password-reset', 'buildscratch_field_icon_color', 's:7:\"#666666\";'),
(101, 1, 'password-reset', 'buildscratch_field_border_color', 's:7:\"#dbdbdb\";'),
(102, 1, 'password-reset', 'buildscratch_field_border_focus_color', 's:7:\"#999999\";'),
(103, 1, 'password-reset', 'buildscratch_field_bg_color', 's:7:\"#ffffff\";'),
(104, 1, 'password-reset', 'buildscratch_field_bg_focus_color', 's:7:\"#ffffff\";'),
(105, 1, 'password-reset', 'buildscratch_label_color', 's:7:\"#444444\";'),
(106, 1, 'password-reset', 'buildscratch_label_font_size', 's:2:\"14\";'),
(107, 1, 'password-reset', 'buildscratch_label_font_weight', 's:4:\"bold\";'),
(108, 1, 'password-reset', 'buildscratch_description_color', 's:7:\"#666666\";'),
(109, 1, 'password-reset', 'buildscratch_description_alignment', 's:4:\"left\";'),
(110, 1, 'password-reset', 'buildscratch_field_value_font_size', 's:2:\"14\";'),
(111, 1, 'password-reset', 'buildscratch_field_value_color', 's:7:\"#69717a\";'),
(112, 1, 'password-reset', 'buildscratch_field_placeholder_color', 's:7:\"#999999\";'),
(113, 1, 'password-reset', 'buildscratch_submit_button_layout', 's:4:\"pill\";'),
(114, 1, 'password-reset', 'buildscratch_submit_button_width', 's:10:\"full-width\";'),
(115, 1, 'password-reset', 'buildscratch_submit_button_font_size', 's:2:\"16\";'),
(116, 1, 'password-reset', 'buildscratch_submit_button_font_weight', 's:4:\"bold\";'),
(117, 1, 'password-reset', 'buildscratch_submit_button_bg_color', 's:7:\"#000000\";'),
(118, 1, 'password-reset', 'buildscratch_submit_button_text_color', 's:7:\"#ffffff\";'),
(119, 1, 'password-reset', 'buildscratch_submit_button_bg_focus_color', 's:7:\"#dbdbdb\";'),
(120, 1, 'password-reset', 'buildscratch_submit_button_text_focus_color', 's:7:\"#000000\";'),
(121, 1, 'edit-profile', 'form_class', 's:5:\"Tulip\";'),
(122, 1, 'edit-profile', 'form_builder_fields_settings', 's:885:\"[{\"placeholder\":\"First Name\",\"fieldType\":\"edit-profile-first-name\",\"fieldTitle\":\"First Name\",\"fieldBarTitle\":\"First Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"icon\":\"perm_identity\",\"sortID\":1},{\"placeholder\":\"Last Name\",\"fieldType\":\"edit-profile-last-name\",\"fieldTitle\":\"Last Name\",\"fieldBarTitle\":\"Last Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"icon\":\"perm_identity\",\"sortID\":2},{\"placeholder\":\"Email Address\",\"fieldType\":\"edit-profile-email\",\"fieldTitle\":\"Email Address\",\"fieldBarTitle\":\"Email Address\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-email\\\"></span>\",\"icon\":\"email\",\"sortID\":3},{\"placeholder\":\"Password\",\"fieldType\":\"edit-profile-password\",\"fieldTitle\":\"Password\",\"fieldBarTitle\":\"Password\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-lock\\\"></span>\",\"password_visibility_icon\":true,\"sortID\":4}]\";'),
(123, 1, 'edit-profile', 'submit_button_text', 's:14:\"Update Profile\";'),
(124, 1, 'edit-profile', 'submit_button_processing_label', 's:10:\"Processing\";'),
(125, 1, 'edit-profile', 'success_message', 's:14:\"Changes saved.\";'),
(126, 1, 'edit-profile', 'registration_user_role', 's:10:\"subscriber\";'),
(127, 1, 'edit-profile', 'buildscratch_form_width', 's:5:\"400px\";'),
(128, 1, 'edit-profile', 'buildscratch_form_font_family', 's:12:\"Merriweather\";'),
(129, 1, 'edit-profile', 'buildscratch_remove_form_frame', 's:5:\"false\";'),
(130, 1, 'edit-profile', 'buildscratch_hide_required_asterisk', 's:5:\"false\";'),
(131, 1, 'edit-profile', 'buildscratch_form_bg_color', 's:7:\"#ffffff\";'),
(132, 1, 'edit-profile', 'buildscratch_form_social_buttons', 'a:3:{i:0;s:8:\"facebook\";i:1;s:7:\"twitter\";i:2;s:6:\"google\";}'),
(133, 1, 'edit-profile', 'buildscratch_form_headline', 's:17:\"Edit Your Profile\";'),
(134, 1, 'edit-profile', 'buildscratch_forgot_password_label', 's:19:\"Lost your password?\";'),
(135, 1, 'edit-profile', 'buildscratch_signup_label', 's:8:\"Register\";'),
(136, 1, 'edit-profile', 'buildscratch_login_label', 's:5:\"Login\";'),
(137, 1, 'edit-profile', 'buildscratch_field_layout', 's:4:\"pill\";'),
(138, 1, 'edit-profile', 'buildscratch_label_field_size', 's:6:\"medium\";'),
(139, 1, 'edit-profile', 'buildscratch_label_field_icon_alignment', 's:5:\"right\";'),
(140, 1, 'edit-profile', 'buildscratch_field_icon_color', 's:7:\"#666666\";'),
(141, 1, 'edit-profile', 'buildscratch_field_border_color', 's:7:\"#dbdbdb\";'),
(142, 1, 'edit-profile', 'buildscratch_field_border_focus_color', 's:7:\"#999999\";'),
(143, 1, 'edit-profile', 'buildscratch_field_bg_color', 's:7:\"#ffffff\";'),
(144, 1, 'edit-profile', 'buildscratch_field_bg_focus_color', 's:7:\"#ffffff\";'),
(145, 1, 'edit-profile', 'buildscratch_label_color', 's:7:\"#444444\";'),
(146, 1, 'edit-profile', 'buildscratch_label_font_size', 's:2:\"14\";'),
(147, 1, 'edit-profile', 'buildscratch_label_font_weight', 's:4:\"bold\";'),
(148, 1, 'edit-profile', 'buildscratch_description_color', 's:7:\"#666666\";'),
(149, 1, 'edit-profile', 'buildscratch_description_alignment', 's:4:\"left\";'),
(150, 1, 'edit-profile', 'buildscratch_field_value_font_size', 's:2:\"14\";'),
(151, 1, 'edit-profile', 'buildscratch_field_value_color', 's:7:\"#69717a\";'),
(152, 1, 'edit-profile', 'buildscratch_field_placeholder_color', 's:7:\"#999999\";'),
(153, 1, 'edit-profile', 'buildscratch_submit_button_layout', 's:4:\"pill\";'),
(154, 1, 'edit-profile', 'buildscratch_submit_button_width', 's:10:\"full-width\";'),
(155, 1, 'edit-profile', 'buildscratch_submit_button_font_size', 's:2:\"16\";'),
(156, 1, 'edit-profile', 'buildscratch_submit_button_font_weight', 's:4:\"bold\";'),
(157, 1, 'edit-profile', 'buildscratch_submit_button_bg_color', 's:7:\"#000000\";'),
(158, 1, 'edit-profile', 'buildscratch_submit_button_text_color', 's:7:\"#ffffff\";'),
(159, 1, 'edit-profile', 'buildscratch_submit_button_bg_focus_color', 's:7:\"#dbdbdb\";'),
(160, 1, 'edit-profile', 'buildscratch_submit_button_text_focus_color', 's:7:\"#000000\";'),
(161, 1, 'user-profile', 'form_class', 's:15:\"DefaultTemplate\";'),
(162, 1, 'user-profile', 'form_builder_fields_settings', 's:571:\"[{\"label\":\"First Name\",\"fieldType\":\"profile-first-name\",\"fieldTitle\":\"First Name\",\"fieldBarTitle\":\"First Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"sortID\":1},{\"label\":\"Last Name\",\"fieldType\":\"profile-last-name\",\"fieldTitle\":\"Last Name\",\"fieldBarTitle\":\"Last Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"></span>\",\"sortID\":2},{\"label\":\"Email Address\",\"fieldType\":\"profile-email\",\"fieldTitle\":\"Email Address\",\"fieldBarTitle\":\"Email Address\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-email\\\"></span>\",\"sortID\":3}]\";'),
(163, 1, 'user-profile', 'submit_button_text', 's:6:\"Log In\";'),
(164, 1, 'user-profile', 'submit_button_processing_label', 's:10:\"Processing\";'),
(165, 1, 'user-profile', 'success_message', 's:0:\"\";'),
(166, 1, 'user-profile', 'registration_user_role', 's:10:\"subscriber\";'),
(167, 1, 'user-profile', 'ppress_dpf_max_width', 's:6:\"1000px\";'),
(168, 1, 'user-profile', 'ppress_dpf_area_max_width', 's:5:\"600px\";'),
(169, 1, 'user-profile', 'ppress_dpf_profile_cover_enabled', 's:4:\"true\";'),
(170, 1, 'user-profile', 'ppress_dpf_profile_show_bio', 's:4:\"true\";'),
(171, 1, 'user-profile', 'ppress_dpf_profile_cover_ratio', 's:3:\"2.7\";'),
(172, 1, 'user-profile', 'ppress_dpf_profile_header_display_name', 's:16:\"first_last_names\";'),
(173, 1, 'user-profile', 'ppress_dpf_profile_user_meta', 'a:0:{}'),
(174, 1, 'user-profile', 'ppress_dpf_profile_menu_tabs', 'a:3:{i:0;s:4:\"main\";i:1;s:5:\"posts\";i:2;s:8:\"comments\";}'),
(175, 1, 'user-profile', 'ppress_dpf_profile_header_name_color', 's:7:\"#555555\";'),
(176, 1, 'user-profile', 'ppress_dpf_profile_body_text_color', 's:7:\"#666666\";'),
(177, 1, 'user-profile', 'ppress_dpf_profile_menu_background_color', 's:7:\"#444444\";'),
(178, 1, 'user-profile', 'ppress_dpf_profile_menu_tab_text_color', 's:7:\"#ffffff\";'),
(179, 1, 'user-profile', 'ppress_dpf_profile_active_menu_tab_bg_color', 's:7:\"#007bff\";'),
(180, 1, 'member-directory', 'form_class', 's:15:\"DefaultTemplate\";'),
(181, 1, 'member-directory', 'form_builder_fields_settings', 's:318:\"[{\"fieldType\":\"profile-display-name\",\"fieldTitle\":\"Display Name\",\"fieldBarTitle\":\"Display Name\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-admin-users\\\"><\\/span>\"},{\"fieldType\":\"profile-bio\",\"fieldTitle\":\"Biography\",\"fieldBarTitle\":\"Biography\",\"fieldIcon\":\"<span class=\\\"dashicons dashicons-text-page\\\"><\\/span>\"}]\";'),
(182, 1, 'member-directory', 'submit_button_text', 's:6:\"Log In\";'),
(183, 1, 'member-directory', 'submit_button_processing_label', 's:10:\"Processing\";'),
(184, 1, 'member-directory', 'success_message', 's:0:\"\";'),
(185, 1, 'member-directory', 'registration_user_role', 's:10:\"subscriber\";'),
(186, 1, 'member-directory', 'ppress_md_user_roles', 'a:0:{}'),
(187, 1, 'member-directory', 'ppress_md_specific_users', 's:0:\"\";'),
(188, 1, 'member-directory', 'ppress_md_exclude_users', 's:0:\"\";'),
(189, 1, 'member-directory', 'ppress_md_sort_default', 's:6:\"newest\";'),
(190, 1, 'member-directory', 'ppress_md_enable_custom_sort', 's:5:\"false\";'),
(191, 1, 'member-directory', 'ppress_md_sort_method_fields', 'a:0:{}'),
(192, 1, 'member-directory', 'ppress_md_enable_search', 's:4:\"true\";'),
(193, 1, 'member-directory', 'ppress_md_search_fields', 'a:5:{i:0;s:16:\"pp_email_address\";i:1;s:14:\"pp_website_url\";i:2;s:15:\"pp_display_name\";i:3;s:10:\"first_name\";i:4;s:9:\"last_name\";}'),
(194, 1, 'member-directory', 'ppress_md_enable_filters', 's:5:\"false\";'),
(195, 1, 'member-directory', 'ppress_md_filter_fields', 'a:0:{}'),
(196, 1, 'member-directory', 'ppress_md_enable_result_after_search', 's:5:\"false\";'),
(197, 1, 'member-directory', 'ppress_md_result_number_per_page', 's:1:\"9\";'),
(198, 1, 'member-directory', 'ppress_md_results_text', 's:21:\"{total_users} Members\";'),
(199, 1, 'member-directory', 'ppress_md_single_result_text', 's:20:\"{total_users} Member\";'),
(200, 1, 'member-directory', 'ppress_md_no_result_text', 's:60:\"We could not find any user that matches your search criteria\";'),
(201, 1, 'member-directory', 'ppress_md_search_filter_field_text_color', 's:7:\"#666666\";'),
(202, 1, 'member-directory', 'ppress_md_search_filter_field_border_color', 's:7:\"#dddddd\";'),
(203, 1, 'member-directory', 'ppress_md_pagination_link_color', 's:7:\"#666666\";'),
(204, 1, 'member-directory', 'ppress_md_pagination_active_link_color', 's:7:\"#ffffff\";'),
(205, 1, 'member-directory', 'ppress_md_pagination_active_background_color', 's:7:\"#007bff\";'),
(206, 1, 'member-directory', 'ppress_md_default_profile_picture', 's:4:\"true\";'),
(207, 1, 'member-directory', 'ppress_md_default_cover_image', 's:4:\"true\";'),
(208, 1, 'member-directory', 'ppress_md_default_social_icons', 's:4:\"true\";'),
(209, 1, 'member-directory', 'ppress_md_default_text_color', 's:7:\"#999999\";'),
(210, 1, 'member-directory', 'ppress_md_default_display_name_color', 's:7:\"#444444\";'),
(211, 1, 'member-directory', 'ppress_md_default_avatar_border_color', 's:7:\"#ffffff\";'),
(212, 1, 'member-directory', 'ppress_md_default_background_color', 's:7:\"#ffffff\";'),
(213, 1, 'member-directory', 'ppress_md_default_border_color', 's:7:\"#dddddd\";'),
(214, 1, 'melange', 'form_class', 's:5:\"Lucid\";'),
(215, 1, 'melange', 'form_structure', 's:1938:\"<div class=\"lucidContainer\">\n	<div class=\"multitab-section\">\n		<ul class=\"multitab-widget multitab-widget-content-tabs-id\">\n			<li class=\"multitab-tab\"><a href=\"#lucidLogin\">Log In</a></li>\n			<li class=\"multitab-tab\"><a href=\"#lucidRegistration\">Register</a></li>\n			<li class=\"multitab-tab\"><a href=\"#lucidReset\">Reset</a></li>\n		</ul>\n		<div class=\"multitab-widget-content multitab-widget-content-widget-id\" id=\"lucidLogin\">\n      <span id=\"sidebartab1\">\n        [pp-login-form]\n		[login-username placeholder=\"Username\"]\n		[login-password placeholder=\"Password\"]\n		[login-submit value=\"Log In\"]\n		[/pp-login-form]\n      </span>\n		</div>\n		<div class=\"multitab-widget-content multitab-widget-content-widget-id\" id=\"lucidRegistration\">\n      <span id=\"sidebartab2\">\n		[pp-registration-form]\n		[reg-username placeholder=\"Username\"]\n		[reg-email placeholder=\"Email Address\"]\n		[reg-password placeholder=\"Password\"]\n		[reg-submit value=\"Register\"]\n		[/pp-registration-form]\n      </span>\n		</div>\n		<div class=\"multitab-widget-content multitab-widget-content-widget-id\" id=\"lucidReset\">\n      <span id=\"sidebartab3\">\n        [pp-password-reset-form]\n		[user-login value=\"Username or Email\"]\n		[reset-submit value=\"Get New Password\"]\n		[/pp-password-reset-form]\n      </span>\n		</div>\n	</div>\n</div>\n\n<script type=\"text/javascript\">\n	jQuery(document).ready(function ($) {\n		$(\".multitab-widget-content-widget-id\").hide();\n		$(\"ul.multitab-widget-content-tabs-id li:first a\").addClass(\"multitab-widget-current\").show();\n		$(\".multitab-widget-content-widget-id:first\").show();\n		$(\"ul.multitab-widget-content-tabs-id li a\").on(\'click\', function () {\n			$(\"ul.multitab-widget-content-tabs-id li a\").removeClass(\"multitab-widget-current a\");\n			$(this).addClass(\"multitab-widget-current\");\n			$(\".multitab-widget-content-widget-id\").hide();\n			var activeTab = $(this).attr(\"href\");\n			$(activeTab).fadeIn();\n			return false;\n		});\n	});\n</script>\";'),
(216, 1, 'melange', 'form_css', 's:3865:\"@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap);\n\n/* css class for login form generated errors */\n.profilepress-login-status {\n  border-radius: 5px;\n    max-width: 350px;\n    font-size: 15px;\n    line-height: 1.471;\n    padding: 10px;\n    background-color: #e74c3c;\n    color: #ffffff;\n    font-weight: normal;\n    display: block;\n    vertical-align: middle;\n    margin: 5px 0;\n}\n\n.profilepress-login-status a {\n    color: #fff;\n    text-decoration: underline;\n}\n\n/* css class for registration form generated errors */\n.profilepress-reg-status {\n  border-radius: 5px;\n    max-width: 350px;\n    font-size: 15px;\n    line-height: 1.471;\n    padding: 10px;\n    background-color: #e74c3c;\n    color: #ffffff;\n    font-weight: normal;\n    display: block;\n    vertical-align: middle;\n    margin: 5px 0;\n}\n\n.profilepress-reset-status a {\n    color: #fff;\n    text-decoration: underline;\n}\n\n/* css class for password reset form generated errors */\n.profilepress-reset-status {\n  border-radius: 5px;\n    max-width: 350px;\n    font-size: 15px;\n    line-height: 1.471;\n    padding: 10px;\n    background-color: #e74c3c;\n    color: #ffffff;\n    font-weight: normal;\n    display: block;\n    vertical-align: middle;\n    margin: 5px 0;\n}\n\n.profilepress-reset-status a {\n    color: #fff;\n    text-decoration: underline;\n}\n\n.lucidSuccess {\n  border-radius: 5px;\n  max-width: 350px;\n  font-size: 15px;\n  line-height: 1.471;\n  padding: 10px;\n  background-color: #2ecc71;\n  color: #ffffff;\n  font-weight: normal;\n  display: block;\n  margin-top: 5px;\n  margin-bottom: 5px;\n}\n\n.lucidContainer {\n  max-width: 350px;\n  margin: 30px 0;\n  padding: 0;\n  box-shadow: 0 10px 5px -5px rgba(0, 0, 0, 0.1);\n  font-family: \'Open Sans\', sans-serif;\n}\n\n/* Multi Tab Sidebar */\n\n.multitab-section {\n  display: inline-block;\n  text-transform: uppercase;\n  width: 100%;\n}\n\n.multitab-section p {\n  display: inline-block;\n  background: #fff;\n  text-transform: lowercase;\n  font-size: 14px;\n  padding: 20px;\n  margin: 0;\n}\n\n.multitab-widget {\n  list-style: none;\n  margin: 0 0 10px;\n  padding: 0\n}\n\n.multitab-widget li {\n  list-style: none;\n  padding: 0;\n  margin: 0;\n  float: left\n}\n\n.multitab-widget li a {\n  background: #22a1c4;\n  color: #fff;\n  display: block;\n  padding: 15px;\n  font-size: 13px;\n  text-decoration: none\n}\n\n.multitab-tab {\n  width: 33.3%;\n  text-align: center\n}\n\n.multitab-section h2,\n.multitab-section h3,\n.multitab-section h4,\n.multitab-section h5,\n.multitab-section h6 {\n  display: none;\n}\n\n.multitab-widget li a.multitab-widget-current {\n  padding-bottom: 20px;\n  margin-top: -10px;\n  background: #fff;\n  color: #444;\n  text-decoration: none;\n  border-top: 5px solid #22a1c4;\n  font-size: 14px;\n  text-transform: capitalize\n}\n\n.multitab-widget-content {\n  padding: 0 20px;\n  border-bottom: 1px solid #efefef;\n  border-left: 1px solid #efefef;\n  border-right: 1px solid #efefef;\n}\n\n\ndiv.lucidContainer input[type=\"email\"],\ndiv.lucidContainer input[type=\"text\"],\ndiv.lucidContainer input[type=\"password\"], div.lucidContainer select, div.lucidContainer textarea {\n  width: 100%;\n  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.125);\n  box-sizing: border-box;\n  -webkit-box-sizing: border-box;\n  -moz-box-sizing: border-box;\n  background: #fff;\n  margin: 10px auto;\n  border: 1px solid #ccc;\n  padding: 10px;\n  font-family: \'Open Sans\', sans-serif;\n  font-size: 95%;\n  color: #555;\n}\n\n\ndiv.lucidContainer input[type=\"submit\"] {\n  width: 100%;\n  box-sizing: border-box;\n  -webkit-box-sizing: border-box;\n  -moz-box-sizing: border-box;\n  margin: 10px auto;\n  background: #3399cc;\n  border: 0;\n  padding: 4%;\n  font-family: \'Open Sans\', sans-serif;\n  font-size: 100%;\n  color: #fff;\n  cursor: pointer;\n  transition: background .3s;\n  -webkit-transition: background .3s;\n}\n\ndiv.lucidContainer input[type=\"submit\"]:hover {\n  background: #2288bb;\n}\n\n\";'),
(217, 1, 'melange', 'melange_edit_profile_success_msg', 's:61:\"<div class=\"lucidSuccess\">Profile successfully updated.</div>\";'),
(218, 1, 'melange', 'melange_password_reset_success_msg', 's:74:\"<div class=\"lucidSuccess\">Check your email for further instructions.</div>\";'),
(219, 1, 'melange', 'melange_registration_success_msg', 's:56:\"<div class=\"lucidSuccess\">Registration Successful.</div>\";'),
(220, 1, 'login', 'form_builder_settings', 'a:34:{s:23:\"buildscratch_form_width\";s:5:\"600px\";s:26:\"buildscratch_form_bg_color\";s:7:\"#ffffff\";s:29:\"buildscratch_form_font_family\";s:4:\"Lato\";s:26:\"buildscratch_form_headline\";s:7:\"Sign In\";s:34:\"buildscratch_forgot_password_label\";s:19:\"Lost your password?\";s:25:\"buildscratch_signup_label\";s:8:\"Register\";s:30:\"buildscratch_remove_form_frame\";s:4:\"true\";s:35:\"buildscratch_hide_required_asterisk\";s:5:\"false\";s:25:\"buildscratch_field_layout\";s:4:\"flat\";s:29:\"buildscratch_label_field_size\";s:6:\"medium\";s:29:\"buildscratch_field_icon_color\";s:7:\"#161c2d\";s:39:\"buildscratch_label_field_icon_alignment\";s:5:\"right\";s:31:\"buildscratch_field_border_color\";s:7:\"#dbdbdb\";s:37:\"buildscratch_field_border_focus_color\";s:7:\"#999999\";s:27:\"buildscratch_field_bg_color\";s:7:\"#ffffff\";s:33:\"buildscratch_field_bg_focus_color\";s:7:\"#ffffff\";s:24:\"buildscratch_label_color\";s:7:\"#161c2d\";s:28:\"buildscratch_label_font_size\";s:2:\"14\";s:30:\"buildscratch_label_font_weight\";s:4:\"bold\";s:30:\"buildscratch_description_color\";s:7:\"#666666\";s:34:\"buildscratch_description_alignment\";s:6:\"center\";s:34:\"buildscratch_field_value_font_size\";s:2:\"14\";s:30:\"buildscratch_field_value_color\";s:7:\"#69717a\";s:36:\"buildscratch_field_placeholder_color\";s:7:\"#999999\";s:18:\"submit_button_text\";s:6:\"Log In\";s:30:\"submit_button_processing_label\";s:10:\"Processing\";s:33:\"buildscratch_submit_button_layout\";s:5:\"round\";s:32:\"buildscratch_submit_button_width\";s:4:\"wide\";s:36:\"buildscratch_submit_button_font_size\";s:2:\"16\";s:38:\"buildscratch_submit_button_font_weight\";s:4:\"bold\";s:35:\"buildscratch_submit_button_bg_color\";s:7:\"#161c2d\";s:41:\"buildscratch_submit_button_bg_focus_color\";s:7:\"#161c2d\";s:37:\"buildscratch_submit_button_text_color\";s:7:\"#ffffff\";s:43:\"buildscratch_submit_button_text_focus_color\";s:7:\"#ffffff\";}'),
(221, 1, 'registration', 'disable_username_requirement', 's:5:\"false\";'),
(222, 1, 'registration', 'form_builder_settings', 'a:33:{s:23:\"buildscratch_form_width\";s:5:\"400px\";s:26:\"buildscratch_form_bg_color\";s:7:\"#ffffff\";s:29:\"buildscratch_form_font_family\";s:4:\"Lato\";s:26:\"buildscratch_form_headline\";s:17:\"Create an Account\";s:24:\"buildscratch_login_label\";s:22:\"Have an account? Login\";s:30:\"buildscratch_remove_form_frame\";s:4:\"true\";s:35:\"buildscratch_hide_required_asterisk\";s:5:\"false\";s:25:\"buildscratch_field_layout\";s:5:\"round\";s:29:\"buildscratch_label_field_size\";s:6:\"medium\";s:29:\"buildscratch_field_icon_color\";s:7:\"#161c2d\";s:39:\"buildscratch_label_field_icon_alignment\";s:5:\"right\";s:31:\"buildscratch_field_border_color\";s:7:\"#dbdbdb\";s:37:\"buildscratch_field_border_focus_color\";s:7:\"#999999\";s:27:\"buildscratch_field_bg_color\";s:7:\"#ffffff\";s:33:\"buildscratch_field_bg_focus_color\";s:7:\"#ffffff\";s:24:\"buildscratch_label_color\";s:7:\"#161c2d\";s:28:\"buildscratch_label_font_size\";s:2:\"14\";s:30:\"buildscratch_label_font_weight\";s:4:\"bold\";s:30:\"buildscratch_description_color\";s:7:\"#666666\";s:34:\"buildscratch_description_alignment\";s:4:\"left\";s:34:\"buildscratch_field_value_font_size\";s:2:\"14\";s:30:\"buildscratch_field_value_color\";s:7:\"#69717a\";s:36:\"buildscratch_field_placeholder_color\";s:7:\"#999999\";s:18:\"submit_button_text\";s:8:\"Register\";s:30:\"submit_button_processing_label\";s:10:\"Processing\";s:33:\"buildscratch_submit_button_layout\";s:5:\"round\";s:32:\"buildscratch_submit_button_width\";s:10:\"full-width\";s:36:\"buildscratch_submit_button_font_size\";s:2:\"16\";s:38:\"buildscratch_submit_button_font_weight\";s:4:\"bold\";s:35:\"buildscratch_submit_button_bg_color\";s:7:\"#161c2d\";s:41:\"buildscratch_submit_button_bg_focus_color\";s:7:\"#161c2d\";s:37:\"buildscratch_submit_button_text_color\";s:7:\"#ffffff\";s:43:\"buildscratch_submit_button_text_focus_color\";s:7:\"#ffffff\";}'),
(223, 1, 'password-reset', 'form_builder_settings', 'a:33:{s:23:\"buildscratch_form_width\";s:5:\"400px\";s:26:\"buildscratch_form_bg_color\";s:7:\"#ffffff\";s:29:\"buildscratch_form_font_family\";s:4:\"Lato\";s:26:\"buildscratch_form_headline\";s:19:\"Reset Your Password\";s:24:\"buildscratch_login_label\";s:15:\"Return to Login\";s:30:\"buildscratch_remove_form_frame\";s:4:\"true\";s:35:\"buildscratch_hide_required_asterisk\";s:5:\"false\";s:25:\"buildscratch_field_layout\";s:5:\"round\";s:29:\"buildscratch_label_field_size\";s:6:\"medium\";s:29:\"buildscratch_field_icon_color\";s:7:\"#161c2d\";s:39:\"buildscratch_label_field_icon_alignment\";s:5:\"right\";s:31:\"buildscratch_field_border_color\";s:7:\"#dbdbdb\";s:37:\"buildscratch_field_border_focus_color\";s:7:\"#999999\";s:27:\"buildscratch_field_bg_color\";s:7:\"#ffffff\";s:33:\"buildscratch_field_bg_focus_color\";s:7:\"#ffffff\";s:24:\"buildscratch_label_color\";s:7:\"#161c2d\";s:28:\"buildscratch_label_font_size\";s:2:\"14\";s:30:\"buildscratch_label_font_weight\";s:4:\"bold\";s:30:\"buildscratch_description_color\";s:7:\"#666666\";s:34:\"buildscratch_description_alignment\";s:4:\"left\";s:34:\"buildscratch_field_value_font_size\";s:2:\"14\";s:30:\"buildscratch_field_value_color\";s:7:\"#69717a\";s:36:\"buildscratch_field_placeholder_color\";s:7:\"#999999\";s:18:\"submit_button_text\";s:14:\"Reset Password\";s:30:\"submit_button_processing_label\";s:10:\"Processing\";s:33:\"buildscratch_submit_button_layout\";s:5:\"round\";s:32:\"buildscratch_submit_button_width\";s:10:\"full-width\";s:36:\"buildscratch_submit_button_font_size\";s:2:\"16\";s:38:\"buildscratch_submit_button_font_weight\";s:4:\"bold\";s:35:\"buildscratch_submit_button_bg_color\";s:7:\"#161c2d\";s:41:\"buildscratch_submit_button_bg_focus_color\";s:7:\"#161c2d\";s:37:\"buildscratch_submit_button_text_color\";s:7:\"#ffffff\";s:43:\"buildscratch_submit_button_text_focus_color\";s:7:\"#ffffff\";}'),
(224, 1, 'edit-profile', 'form_builder_settings', 'a:32:{s:23:\"buildscratch_form_width\";s:5:\"400px\";s:26:\"buildscratch_form_bg_color\";s:7:\"#ffffff\";s:29:\"buildscratch_form_font_family\";s:4:\"Lato\";s:26:\"buildscratch_form_headline\";s:17:\"Edit Your Profile\";s:30:\"buildscratch_remove_form_frame\";s:4:\"true\";s:35:\"buildscratch_hide_required_asterisk\";s:5:\"false\";s:25:\"buildscratch_field_layout\";s:5:\"round\";s:29:\"buildscratch_label_field_size\";s:6:\"medium\";s:29:\"buildscratch_field_icon_color\";s:7:\"#161c2d\";s:39:\"buildscratch_label_field_icon_alignment\";s:5:\"right\";s:31:\"buildscratch_field_border_color\";s:7:\"#dbdbdb\";s:37:\"buildscratch_field_border_focus_color\";s:7:\"#999999\";s:27:\"buildscratch_field_bg_color\";s:7:\"#ffffff\";s:33:\"buildscratch_field_bg_focus_color\";s:7:\"#ffffff\";s:24:\"buildscratch_label_color\";s:7:\"#161c2d\";s:28:\"buildscratch_label_font_size\";s:2:\"14\";s:30:\"buildscratch_label_font_weight\";s:4:\"bold\";s:30:\"buildscratch_description_color\";s:7:\"#666666\";s:34:\"buildscratch_description_alignment\";s:4:\"left\";s:34:\"buildscratch_field_value_font_size\";s:2:\"14\";s:30:\"buildscratch_field_value_color\";s:7:\"#69717a\";s:36:\"buildscratch_field_placeholder_color\";s:7:\"#999999\";s:18:\"submit_button_text\";s:14:\"Update Profile\";s:30:\"submit_button_processing_label\";s:10:\"Processing\";s:33:\"buildscratch_submit_button_layout\";s:5:\"round\";s:32:\"buildscratch_submit_button_width\";s:10:\"full-width\";s:36:\"buildscratch_submit_button_font_size\";s:2:\"16\";s:38:\"buildscratch_submit_button_font_weight\";s:4:\"bold\";s:35:\"buildscratch_submit_button_bg_color\";s:7:\"#161c2d\";s:41:\"buildscratch_submit_button_bg_focus_color\";s:7:\"#161c2d\";s:37:\"buildscratch_submit_button_text_color\";s:7:\"#ffffff\";s:43:\"buildscratch_submit_button_text_focus_color\";s:7:\"#ffffff\";}'),
(225, 1, 'user-profile', 'form_builder_settings', 'a:13:{s:20:\"ppress_dpf_max_width\";s:6:\"1000px\";s:25:\"ppress_dpf_area_max_width\";s:5:\"600px\";s:32:\"ppress_dpf_profile_cover_enabled\";s:5:\"false\";s:30:\"ppress_dpf_profile_cover_ratio\";s:3:\"2.7\";s:38:\"ppress_dpf_profile_header_display_name\";s:16:\"first_last_names\";s:27:\"ppress_dpf_profile_show_bio\";s:5:\"false\";s:28:\"ppress_dpf_profile_user_meta\";a:1:{i:0;s:0:\"\";}s:28:\"ppress_dpf_profile_menu_tabs\";a:1:{i:0;s:0:\"\";}s:36:\"ppress_dpf_profile_header_name_color\";s:7:\"#161c2d\";s:34:\"ppress_dpf_profile_body_text_color\";s:7:\"#666666\";s:40:\"ppress_dpf_profile_menu_background_color\";s:7:\"#444444\";s:38:\"ppress_dpf_profile_menu_tab_text_color\";s:7:\"#ffffff\";s:43:\"ppress_dpf_profile_active_menu_tab_bg_color\";s:7:\"#161c2d\";}');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_meta_data`
--

CREATE TABLE `ougvp_ppress_meta_data` (
  `id` bigint(20) NOT NULL,
  `meta_key` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `flag` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_meta_data`
--

INSERT INTO `ougvp_ppress_meta_data` (`id`, `meta_key`, `meta_value`, `flag`) VALUES
(1, 'subscription_cancellation_requested_6', 's:4:\"true\";', ''),
(2, 'subscription_cancellation_requested_1', 's:4:\"true\";', ''),
(3, 'subscription_cancellation_requested_17', 's:4:\"true\";', ''),
(4, 'subscription_cancellation_requested_18', 's:4:\"true\";', ''),
(5, 'subscription_cancellation_requested_19', 's:4:\"true\";', ''),
(6, 'subscription_cancellation_requested_20', 's:4:\"true\";', ''),
(7, 'subscription_cancellation_requested_25', 's:4:\"true\";', '');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_ordermeta`
--

CREATE TABLE `ougvp_ppress_ordermeta` (
  `meta_id` bigint(20) NOT NULL,
  `ppress_order_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_orders`
--

CREATE TABLE `ougvp_ppress_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_key` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `subtotal` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `tax` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `tax_rate` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `discount` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `total` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `billing_address` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_postcode` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_country` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `billing_phone` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mode` enum('live','test') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL,
  `date_completed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_orders`
--

INSERT INTO `ougvp_ppress_orders` (`id`, `order_key`, `plan_id`, `customer_id`, `subscription_id`, `order_type`, `transaction_id`, `payment_method`, `status`, `coupon_code`, `subtotal`, `tax`, `tax_rate`, `discount`, `total`, `billing_address`, `billing_city`, `billing_state`, `billing_postcode`, `billing_country`, `billing_phone`, `mode`, `currency`, `ip_address`, `date_created`, `date_completed`) VALUES
(1, '4fb41983dc32661926e3efe62c85f3e6', 2, 1, 1, 'new', 'pi_3NU6e8He9x5IZmTs0qJgT74u', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, '5 Brayford Square', 'London', 'London', 'E1 0SG', 'GB', '', 'test', 'GBP', '92.9.98.96', '2023-07-15 11:28:18', '2023-07-15 11:28:24'),
(2, 'af114416d8836d0da10e0c78b2c51e8a', 1, 2, 2, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '92.9.98.96', '2023-07-22 12:12:05', '2023-07-22 12:12:05'),
(3, '900ca5092634dc9667245494b21e20aa', 1, 3, 3, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '202.47.49.130', '2023-07-24 18:35:59', '2023-07-24 18:35:59'),
(6, '2675c069d83464ea653e5fa2db84b314', 2, 6, 6, 'new', 'pi_3NYbzXHe9x5IZmTs1DMZ8XHQ', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'House D-18, Block D, Yaaroo Khan Gooth', 'Karachi', 'SD', '75850', 'PK', '', 'test', 'GBP', '202.47.49.130', '2023-07-27 21:45:00', '2023-07-27 21:45:08'),
(7, 'c4fe95558d7d94a457f9a92285e55dcc', 2, 7, 7, 'new', 'pi_3Ncqh9He9x5IZmTs08rHNKfP', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'Texas Road', 'South Bristol', 'DC', '04568', 'US', '09065436263', 'test', 'GBP', '102.89.32.42', '2023-08-08 14:15:33', '2023-08-08 14:15:40'),
(8, 'ac32aeb4055d0b7aeb1424702c1443ab', 1, 8, 8, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '102.89.32.48', '2023-08-09 11:06:15', '2023-08-09 11:06:15'),
(9, '61f7ebe5ed597a76911e6e2642ba0e5d', 2, 8, 9, 'new', 'pi_3NdV7JHe9x5IZmTs1ElhpSvC', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'Sango, Ikire', 'Ikire', 'OS', '200124', 'NG', '09089292288', 'test', 'GBP', '102.89.34.202', '2023-08-10 09:25:15', '2023-08-10 09:25:21'),
(10, '229afbb6e91e103c80b0ed45813b6618', 2, 9, 10, 'new', 'pi_3NdVSFHe9x5IZmTs1joXaZM1', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'Ako Ikire', 'Ikire', 'IM', '200124', 'NG', '09089292288', 'test', 'GBP', '102.89.34.202', '2023-08-10 09:46:53', '2023-08-10 09:47:00'),
(11, '366f9d090ebe2c8b6e6d712999a05606', 1, 10, 11, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '185.145.201.31', '2023-08-11 18:45:19', '2023-08-11 18:45:19'),
(12, '7934dae0a7972a1b1faaa514b9631698', 1, 11, 12, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '185.145.201.31', '2023-08-11 18:51:27', '2023-08-11 18:51:27'),
(13, '6d55e38e51c7bed9b1f21919aaede368', 1, 12, 13, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '185.145.201.31', '2023-08-11 18:55:55', '2023-08-11 18:55:55'),
(14, 'b03479eaa1db7cbd1a4dd597a8581297', 1, 13, 14, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '185.145.201.31', '2023-08-11 18:56:26', '2023-08-11 18:56:26'),
(15, 'de06c58ee23ee36dd44a28d0ee40461d', 1, 14, 15, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '202.47.49.130', '2023-08-13 08:17:48', '2023-08-13 08:17:48'),
(16, '0bd77af74feab6c613760394280bfa49', 1, 15, 16, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '202.47.49.130', '2023-08-13 08:26:26', '2023-08-13 08:26:26'),
(17, '24fb927645de7e25401297749460241e', 2, 16, 17, 'new', '', 'stripe', 'pending', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, 'House D-18, Block D, Yaaroo Khan Gooth', 'Karachi', 'SD', '75850', 'PK', '03122399274', 'test', 'GBP', '202.47.49.130', '2023-08-13 08:27:48', '0000-00-00 00:00:00'),
(18, 'f8fbb21a54fc2e935bebb61d03151ca5', 2, 17, 18, 'new', '', 'stripe', 'pending', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, 'House D-18, Block D, Yaaroo Khan Gooth', 'Karachi', 'SD', '75850', 'PK', '03122399274', 'test', 'GBP', '202.47.49.130', '2023-08-13 08:30:50', '0000-00-00 00:00:00'),
(19, '4408280fe56640e7cdba145bd6a01123', 2, 18, 19, 'new', '', 'stripe', 'pending', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, 'House D-18, Block dD, Yaaroo Khan Gooth', 'Karacdhi', 'PB', '75850', 'PK', '03122399274', 'test', 'GBP', '202.47.49.130', '2023-08-13 08:33:13', '0000-00-00 00:00:00'),
(20, '9d89c68b77aceffed8c8ac2e28606a06', 2, 19, 20, 'new', '', 'stripe', 'pending', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, 'House D-18, Block D, Yaaroo Khan Gooth', 'Karachi', 'SD', '75850', 'PK', '03122399274', 'test', 'GBP', '202.47.49.130', '2023-08-13 08:45:48', '0000-00-00 00:00:00'),
(21, 'b8ca389314d0849c1a042bf01f1c485c', 2, 20, 21, 'new', '', 'stripe', 'pending', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, 'Ako', 'Ikire', 'IM', '299320', 'NG', '09089292288', 'test', 'GBP', '102.89.33.185', '2023-08-13 15:58:30', '0000-00-00 00:00:00'),
(22, '4b5c7da1bdbf4021e7de5045a14cc995', 2, 21, 22, 'new', '', 'stripe', 'pending', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'Kia', 'Ikire', 'EK', '299320', 'NG', '28392903920', 'test', 'GBP', '102.89.33.185', '2023-08-13 16:01:29', '0000-00-00 00:00:00'),
(23, '4e47be2740fd48bd4bf29054d4429254', 2, 22, 23, 'new', 'pi_3NegzcFcWMpKvcw60PNf7vmE', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'Ako', 'Ibadan', 'BE', '299320', 'NG', '09076886566', 'test', 'GBP', '102.89.34.202', '2023-08-13 16:18:14', '2023-08-13 16:18:21'),
(24, '40c7efde25cfde3b4e869d7bb5d62ab5', 2, 23, 24, 'new', '', 'stripe', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, 'Ako Ikire', 'Ibadan', 'EB', '299320', 'NG', '0909876545', 'test', 'GBP', '102.89.33.117', '2023-08-13 16:23:40', '2023-08-13 16:23:44'),
(25, 'd52c2cc15c8571a4dbad38f37749acde', 2, 24, 25, 'new', '', 'manual', 'completed', 'FreeForever', 5.00000000, 0.00000000, '0', 5.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '92.40.189.20', '2023-08-15 05:33:32', '2023-08-15 05:33:32'),
(26, '0d8be49366f4b438ee6fab3db772f884', 1, 25, 26, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '202.47.49.130', '2023-08-15 17:42:37', '2023-08-15 17:42:37'),
(27, 'aa0694bcabe6c68f2f784543009f768d', 2, 26, 27, 'new', 'pi_3NfRHmFcWMpKvcw61jobOF4q', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'House D-18, Block D, Yaaroo Khan Gooth', 'Karachi', 'SD', '75850', 'PK', '03122399274', 'test', 'GBP', '202.47.49.130', '2023-08-15 17:44:04', '2023-08-15 17:44:10'),
(28, '9a62ad7f6ca417d754fa0c06717ab9ce', 1, 27, 28, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '202.47.49.130', '2023-08-15 17:49:21', '2023-08-15 17:49:21'),
(29, '15bf64bdab7e739625af32693f237d9e', 2, 28, 29, 'new', 'pi_3NfROJFcWMpKvcw60oJbhDG9', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, 'House D-18, Block D, Yaaroo Khan Gooth', 'Karachi', 'SD', '75850', 'PK', '03122399274', 'test', 'GBP', '202.47.49.130', '2023-08-15 17:50:49', '2023-08-15 17:50:56'),
(30, 'dacff152baeeff8ea3c4c61e2ab64cdb', 2, 29, 30, 'new', 'pi_3NfofZFcWMpKvcw60uJDnPuH', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, '101 Happy', 'Nottingham', 'Nottinghamshire', 'NG21 4FD', 'GB', '077859547851', 'test', 'GBP', '92.9.98.96', '2023-08-16 18:42:11', '2023-08-16 18:42:18'),
(31, '0be383aab3b4d84353558d2a27943014', 2, 30, 31, 'new', 'pi_3NfojuFcWMpKvcw611pajpCH', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, '3434', '4343', 'NOtbha', '4343', 'AM', '343', 'test', 'GBP', '92.9.98.96', '2023-08-16 18:46:40', '2023-08-16 18:46:47'),
(32, '5cced471e3b82dfc4b33d79f8af0cfd6', 2, 1, 32, 'new', 'pi_3Ngv9vFcWMpKvcw61z2ZN0YU', 'stripe', 'completed', '', 5.00000000, 0.00000000, '0', 0.00000000, 5.00000000, '17 Royston Close', 'Nottingham', 'NG2 1PL', 'NG2 1PL', 'GB', '07891478502', 'test', 'GBP', '92.9.98.96', '2023-08-19 19:50:05', '2023-08-19 19:50:13'),
(33, 'd3db945dbf9ad5d0965507b409224acc', 1, 31, 33, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '92.9.98.96', '2023-08-20 19:40:55', '2023-08-20 19:40:55'),
(34, 'd293eb156e987d2242a22d2c99c7eda8', 1, 32, 34, 'new', '', 'manual', 'completed', '', 0.00000000, 0.00000000, '0', 0.00000000, 0.00000000, '', '', '', '', '', '', 'test', 'GBP', '92.9.98.96', '2023-08-20 19:43:14', '2023-08-20 19:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_plans`
--

CREATE TABLE `ougvp_ppress_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `user_role` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `price` decimal(26,8) NOT NULL DEFAULT 0.00000000,
  `billing_frequency` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subscription_length` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `total_payments` int(11) DEFAULT NULL,
  `signup_fee` decimal(26,8) DEFAULT 0.00000000,
  `free_trial` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` enum('true','false') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'true',
  `meta_data` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_plans`
--

INSERT INTO `ougvp_ppress_plans` (`id`, `name`, `description`, `user_role`, `order_note`, `price`, `billing_frequency`, `subscription_length`, `total_payments`, `signup_fee`, `free_trial`, `status`, `meta_data`) VALUES
(1, 'Starter', '<p>Limited access</p>\n', 'ppress_plan_1', 'Starter subscription plan', 0.00000000, 'monthly', 'renew_indefinitely', 0, 0.00000000, 'disabled', 'true', '{\"plan_extras\":{\"df_names\":[\"\"],\"df_urls\":[\"\"],\"df_download_limit\":\"\",\"df_download_expiry\":\"\"}}'),
(2, 'Professional', '<p>Access all features</p>\n', 'ppress_plan_2', 'Professional Subscription', 5.00000000, 'monthly', 'renew_indefinitely', 0, 0.00000000, 'disabled', 'true', '{\"plan_extras\":{\"df_names\":[\"\"],\"df_urls\":[\"\"],\"df_download_limit\":\"\",\"df_download_expiry\":\"\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_sessions`
--

CREATE TABLE `ougvp_ppress_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_sessions`
--

INSERT INTO `ougvp_ppress_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(24, '0685ea29ac8c05effed8cb298f1c9e7f', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692561525),
(8, '07f5875e877f5349f05c9db17cde7579', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691608930),
(17, '12ceab272a09e041f3fa9873756ebe60', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692044463),
(9, '1f2dcc4fe09ce9fe279ba5979ce519e6', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691662613),
(4, '1f9d4f54f63bd4c22b6a8c439ddb5df0', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691499870),
(14, '4667b49000c5aa19fba8deaba8c3f947', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691918064),
(21, '606060f54196e7484816256fa31a9105', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692307987),
(16, '6899df09b8985f4ec89e248a805e1a9a', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692000107),
(2, '6d6ffb7272a97bf9e36bb20676855e40', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691432565),
(7, '72bf20835eeb773caf4833a6660863b1', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691604184),
(11, '7ccdd034fb60fd83ac144b1db83f49d4', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691781171),
(13, '7f33e86ad485313b19a23fb02ecbf5e4', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691917074),
(1, '85905a473174ce171fb538f82b3dffa7', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691364994),
(5, '86003aa79dce169ff4c0005cceb3ab75', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691506840),
(12, '8aba36f91f8a273caedb324269a7b8e9', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691786543),
(19, '94c79f77555d847e96b5a57174628a26', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692123103),
(23, '950a8d8e6e6eb27bdbc78e65d77e55f0', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692647024),
(6, '97822ec131d0433124f10653f5af292b', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":1,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691580940),
(3, 'a1b6bd4643b16c5db28a466744dc572c', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691475284),
(20, 'a5ecac7e01b913dce79b3e8addaa6951', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692212047),
(22, 'a98c3df5e59d8b7cf6dedcb2bd083b6f', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:59:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"GB\",\"state\":\"NG2 1PL\"}\";}', 1692476364),
(25, 'c1c55bbcb9acac960b921c079b8e2803', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1692783513),
(18, 'c3fb1120288b37ac6aa8cdcaa3fcac6c', 'a:2:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";s:27:\"ppress_checkout_coupon_code\";s:41:\"{\"plan_id\":2,\"coupon_code\":\"FreeForever\"}\";}', 1692079373),
(10, 'd19256826e7e655aeafde4ea25a596f6', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691738347),
(15, 'df0f1bcbcc4432993149454842980e12', 'a:1:{s:24:\"ppress_checkout_tax_rate\";s:50:\"{\"plan_id\":2,\"tax_rate\":0,\"country\":\"\",\"state\":\"\"}\";}', 1691945176);

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_ppress_subscriptions`
--

CREATE TABLE `ougvp_ppress_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_order_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `billing_frequency` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `initial_amount` decimal(26,8) NOT NULL,
  `initial_tax_rate` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `initial_tax` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `recurring_amount` decimal(26,8) NOT NULL,
  `recurring_tax_rate` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `recurring_tax` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `total_payments` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `trial_period` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `profile_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_ppress_subscriptions`
--

INSERT INTO `ougvp_ppress_subscriptions` (`id`, `parent_order_id`, `plan_id`, `customer_id`, `billing_frequency`, `initial_amount`, `initial_tax_rate`, `initial_tax`, `recurring_amount`, `recurring_tax_rate`, `recurring_tax`, `total_payments`, `trial_period`, `profile_id`, `status`, `notes`, `created_date`, `expiration_date`) VALUES
(1, 1, 2, 1, 'monthly', 5.00000000, '0', '0.00', 5.00000000, '0', '0.00', 0, 'disabled', 'sub_1Neh4sFcWMpKvcw6Q1BDq5zq', 'expired', '[\"8 August 2023 13:31|Subscription changed from active to cancelled by payment method\",\"16 August 2023 20:25|Subscription changed from active to expired by payment method\"]', '2023-07-14 23:00:00', '2023-08-15 08:27:01'),
(2, 2, 1, 2, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-07-22 12:12:05', '0000-00-00 00:00:00'),
(3, 3, 1, 3, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-07-24 18:35:59', '0000-00-00 00:00:00'),
(6, 6, 2, 6, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NYbzXHe9x5IZmTseEbRpd98', 'cancelled', '[\"8 August 2023 13:31|Subscription changed from active to cancelled by payment method\"]', '2023-07-27 21:45:00', '2023-08-27 21:45:03'),
(7, 7, 2, 7, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1Ncqh9He9x5IZmTscxM3swiq', 'active', NULL, '2023-08-08 14:15:33', '2023-09-08 14:15:35'),
(8, 8, 1, 8, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-09 11:06:15', '0000-00-00 00:00:00'),
(9, 9, 2, 8, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1Neh4sFcWMpKvcw6Q1BDq5zq', 'active', NULL, '2023-08-10 09:25:15', '2023-09-10 09:25:17'),
(10, 10, 2, 9, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NdVSFHe9x5IZmTsceMCqE5S', 'active', NULL, '2023-08-10 09:46:53', '2023-09-10 09:46:55'),
(11, 11, 1, 10, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-11 18:45:19', '0000-00-00 00:00:00'),
(12, 12, 1, 11, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-11 18:51:27', '0000-00-00 00:00:00'),
(13, 13, 1, 12, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-11 18:55:55', '0000-00-00 00:00:00'),
(14, 14, 1, 13, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-11 18:56:26', '0000-00-00 00:00:00'),
(15, 15, 1, 14, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-13 08:17:48', '0000-00-00 00:00:00'),
(16, 16, 1, 15, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-13 08:26:26', '0000-00-00 00:00:00'),
(17, 17, 2, 16, 'monthly', 0.00000000, '0', '0', 5.00000000, '0', '0', 0, '1_week', 'sub_1NeZeMFcWMpKvcw6bIY5yIMv', 'cancelled', '[\"20 August 2023 10:39|Stripe payment failed (payment is past due)\",\"4 September 2023 10:55|Subscription changed from active to cancelled by payment method\"]', '2023-08-13 08:27:48', '2023-09-20 08:27:50'),
(18, 18, 2, 17, 'monthly', 0.00000000, '0', '0', 5.00000000, '0', '0', 0, '1_week', 'sub_1NeZhIFcWMpKvcw6zrIhynW4', 'cancelled', '[\"20 August 2023 10:39|Stripe payment failed (payment is past due)\",\"4 September 2023 10:55|Subscription changed from active to cancelled by payment method\"]', '2023-08-13 08:30:50', '2023-09-20 08:30:52'),
(19, 19, 2, 18, 'monthly', 0.00000000, '0', '0', 5.00000000, '0', '0', 0, '1_week', 'sub_1NeZjaFcWMpKvcw6le0QtJrR', 'cancelled', '[\"20 August 2023 10:39|Stripe payment failed (payment is past due)\",\"4 September 2023 10:55|Subscription changed from active to cancelled by payment method\"]', '2023-08-13 08:33:13', '2023-09-20 08:33:14'),
(20, 20, 2, 19, 'monthly', 0.00000000, '0', '0', 5.00000000, '0', '0', 0, '1_week', 'sub_1NeZvlFcWMpKvcw6BZEPiHQ9', 'cancelled', '[\"20 August 2023 10:56|Stripe payment failed (payment is past due)\",\"4 September 2023 11:12|Subscription changed from active to cancelled by payment method\"]', '2023-08-13 08:45:48', '2023-09-20 08:45:49'),
(23, 23, 2, 22, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NegzbFcWMpKvcw6V6poOKYF', 'active', NULL, '2023-08-13 16:18:14', '2023-09-13 16:18:15'),
(24, 24, 2, 23, 'monthly', 0.00000000, '0', '0', 5.00000000, '0', '0', 0, '1_week', 'sub_1Neh4sFcWMpKvcw6Q1BDq5zq', 'expired', '[\"21 August 2023 20:14|Subscription changed from trialling to expired by payment method\"]', '2023-08-13 16:23:40', '2023-08-20 16:23:42'),
(25, 25, 2, 24, 'monthly', 0.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1Neh4sFcWMpKvcw6Q1BDq5zq', 'cancelled', '[\"20 August 2023 17:30|Recurring amount changed from 0.00 to 5.00 in Stripe.\",\"20 August 2023 18:44|Stripe payment failed (payment is past due)\",\"4 September 2023 19:01|Subscription changed from active to cancelled by payment method\"]', '2023-08-15 05:33:32', '2023-09-20 16:23:42'),
(26, 26, 1, 25, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-15 17:42:37', '0000-00-00 00:00:00'),
(27, 27, 2, 26, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NfRHlFcWMpKvcw61ZkbXUz7', 'active', NULL, '2023-08-15 17:44:04', '2023-09-15 17:44:05'),
(28, 28, 1, 27, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-15 17:49:21', '0000-00-00 00:00:00'),
(29, 29, 2, 28, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NfROJFcWMpKvcw64OiIC4B5', 'active', NULL, '2023-08-15 17:50:49', '2023-09-15 17:50:51'),
(30, 30, 2, 29, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NfofYFcWMpKvcw6WQDyPLjm', 'active', NULL, '2023-08-16 18:42:11', '2023-09-16 18:42:12'),
(31, 31, 2, 30, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1NfojuFcWMpKvcw6sTiwfddi', 'active', NULL, '2023-08-16 18:46:40', '2023-09-16 18:46:42'),
(32, 32, 2, 1, 'monthly', 5.00000000, '0', '0', 5.00000000, '0', '0', 0, 'disabled', 'sub_1Ngv9vFcWMpKvcw68QuYCeiv', 'active', NULL, '2023-08-19 19:50:05', '2023-09-19 19:50:07'),
(33, 33, 1, 31, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-20 19:40:55', '0000-00-00 00:00:00'),
(34, 34, 1, 32, 'monthly', 0.00000000, '0', '0', 0.00000000, '0', '0', 0, 'disabled', '', 'active', NULL, '2023-08-20 19:43:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ougvp_users`
--

CREATE TABLE `ougvp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `ougvp_users`
--

INSERT INTO `ougvp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'cosmeticmanager.co.uk', '$P$BXe1yTV0NqB3DE1dvGzce.UeYfvi231', 'cosmeticmanager-co-uk', 'nr.91@outlook.com', 'https://cosmeticmanager.co.uk', '2023-07-30 19:11:22', '', 0, 'Dev1_Nathan'),
(2, 'Dev2_Akeem', '$P$BxDoiR1c00fgdbmmphyCwamVBDHdxO/', 'dev2_akeem', 'akanni.olas.6767@gmail.com', '', '2023-08-05 09:32:08', '1691227929:$P$B.dwg.1jZPFN0Z5wIkaM2PutdB4JO7.', 0, 'Dev2_Akeem'),
(3, 'Dev1_Nathan', '$P$B0uYELcLJXhUi4R5dHlPe6UXgWaBO40', 'dev1_nathan', 'nr.91@outlook.com', 'https://cosmeticmanager.com', '2023-01-08 15:36:27', '', 0, 'Dev1_Nathan'),
(4, 'Customer Support', '$P$B0XIeaTXkHbI1gZe92JfbQtrMhxa4p/', 'customer-support', 'hello@cosmeticmanager.com', '', '2023-02-15 19:41:56', '', 0, 'Cosmetic Manager Support'),
(6, 'Dev3_Akeem', '$P$BK0pVFDcpkBhcF8P0v8vguHVyaFEu50', 'dev3_akeem', 'support@cosmeticmanager.com', '', '2023-06-12 05:20:59', '', 0, 'Akeem Mukaila'),
(8, 'contact@kleanaf.com', '$P$Bi2HccWzwMmN1tkwuEKc5nHpYxdEEY1', 'contactkleanaf-com', 'contact@kleanaf.com', '', '2023-07-15 11:28:17', '1689420498:$P$BCcVKhG7EdMzmqF3h2Z7/rzVd3uQmQ0', 0, 'Klean AF LTD'),
(10, 'contact@cosmeticmanager.com', '$P$B5/ElHG/WnAnsn3f9jCUfrv95x/Ici.', 'contactcosmeticmanager-com', 'contact@cosmeticmanager.com', '', '2023-07-22 12:12:04', '1690027924:$P$BGt3Ir9ZPFLGcnqAQH1YHaumIln8hu0', 0, 'Cosmetic Manager'),
(14, 'akanni.olas@gmail.com', '$P$BQolC0uCRVqlazIH3pvhk/QzZtnLsw/', 'akanni-olasgmail-com', 'akanni.olas@gmail.com', '', '2023-08-10 09:46:53', '1691660813:$P$BjDAFqXX2jwJUsnv0HMTmD6LfYxy/81', 0, 'Abdulakeem Akanni'),
(15, 'Dev2_Hamza', '$P$BXOX.ETynbqUjD4dLp1Rf3/W/BMQ8C.', 'dev2_hamza', 'minhashamza057@gmail.com', '', '2023-08-11 18:32:15', '', 0, 'Hamza'),
(30, 'Dev4_Haroon', '$P$BotFXcwFpx0waMRcjW1EawMTVuV.3c1', 'dev4_haroon', 'nl.rd@outlook.com', '', '2023-08-13 16:41:18', '', 0, 'Haroon Mukhtiar'),
(31, 'nathanr@revolimited.co.uk', '$P$BkijHepraeUXoyns9gRhVolenTYxl41', 'nathanrrevolimited-co-uk', 'nathanr@revolimited.co.uk', '', '2023-08-15 05:33:31', '1692077611:$P$BF1vG1bNRbn38PyYFSmTwjjO/6WUT21', 0, 'Nathan Reid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ougvp_ppress_coupons`
--
ALTER TABLE `ougvp_ppress_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `type` (`coupon_type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `ougvp_ppress_customers`
--
ALTER TABLE `ougvp_ppress_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `ougvp_ppress_forms`
--
ALTER TABLE `ougvp_ppress_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `form_id` (`form_id`);

--
-- Indexes for table `ougvp_ppress_formsmeta`
--
ALTER TABLE `ougvp_ppress_formsmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `form_id` (`form_id`),
  ADD KEY `form_type` (`form_type`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `ougvp_ppress_meta_data`
--
ALTER TABLE `ougvp_ppress_meta_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_key` (`meta_key`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ougvp_ppress_ordermeta`
--
ALTER TABLE `ougvp_ppress_ordermeta`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `ougvp_ppress_orders`
--
ALTER TABLE `ougvp_ppress_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_key` (`order_key`),
  ADD KEY `status` (`status`),
  ADD KEY `mode` (`mode`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `date` (`date_created`),
  ADD KEY `coupon_code` (`coupon_code`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ougvp_ppress_plans`
--
ALTER TABLE `ougvp_ppress_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ougvp_ppress_sessions`
--
ALTER TABLE `ougvp_ppress_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `ougvp_ppress_subscriptions`
--
ALTER TABLE `ougvp_ppress_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`),
  ADD KEY `parent_order_id` (`parent_order_id`),
  ADD KEY `customer_and_status` (`customer_id`,`status`),
  ADD KEY `profile_id` (`profile_id`(191));

--
-- Indexes for table `ougvp_users`
--
ALTER TABLE `ougvp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ougvp_ppress_coupons`
--
ALTER TABLE `ougvp_ppress_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ougvp_ppress_customers`
--
ALTER TABLE `ougvp_ppress_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ougvp_ppress_forms`
--
ALTER TABLE `ougvp_ppress_forms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ougvp_ppress_formsmeta`
--
ALTER TABLE `ougvp_ppress_formsmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `ougvp_ppress_meta_data`
--
ALTER TABLE `ougvp_ppress_meta_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ougvp_ppress_ordermeta`
--
ALTER TABLE `ougvp_ppress_ordermeta`
  MODIFY `meta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ougvp_ppress_orders`
--
ALTER TABLE `ougvp_ppress_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ougvp_ppress_plans`
--
ALTER TABLE `ougvp_ppress_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ougvp_ppress_sessions`
--
ALTER TABLE `ougvp_ppress_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ougvp_ppress_subscriptions`
--
ALTER TABLE `ougvp_ppress_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ougvp_users`
--
ALTER TABLE `ougvp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
