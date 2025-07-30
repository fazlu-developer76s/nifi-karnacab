-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 29, 2025 at 06:40 PM
-- Server version: 8.0.43
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livenerasoft_krna_cab`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_amenties`
--

CREATE TABLE `add_amenties` (
  `id` int NOT NULL,
  `property_id` int NOT NULL COMMENT 'properties.id',
  `amenities_id` int DEFAULT NULL COMMENT 'facilities.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_amenties`
--

INSERT INTO `add_amenties` (`id`, `property_id`, `amenities_id`, `created_at`, `updated_at`, `status`) VALUES
(4, 31, 1, '2024-12-07 06:59:46', '2024-12-07 06:59:46', 1),
(5, 31, 2, '2024-12-07 06:59:46', '2024-12-07 06:59:46', 1),
(6, 1, 1, '2024-12-07 07:18:11', '2024-12-07 07:18:11', 1),
(9, 26, 1, '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(10, 26, 2, '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `add_book_amenties`
--

CREATE TABLE `add_book_amenties` (
  `id` int NOT NULL,
  `flor_id` int NOT NULL COMMENT 'add_book_property.id',
  `amenities_id` int DEFAULT NULL COMMENT 'facilities.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_book_amenties`
--

INSERT INTO `add_book_amenties` (`id`, `flor_id`, `amenities_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 1, '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1),
(2, 3, 2, '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `add_book_facilities`
--

CREATE TABLE `add_book_facilities` (
  `id` int NOT NULL,
  `flor_id` int NOT NULL COMMENT 'add_book_property.id',
  `facilities_id` int DEFAULT NULL COMMENT 'facilities.id',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_book_facilities`
--

INSERT INTO `add_book_facilities` (`id`, `flor_id`, `facilities_id`, `value`, `created_at`, `updated_at`, `status`) VALUES
(1, 2, 1, '10', '2024-12-07 08:26:47', '2024-12-07 08:26:47', 1),
(2, 2, 2, '20', '2024-12-07 08:26:47', '2024-12-07 08:26:47', 1),
(3, 2, 3, '20', '2024-12-07 08:26:47', '2024-12-07 08:26:47', 1),
(4, 2, 4, '30', '2024-12-07 08:26:47', '2024-12-07 08:26:47', 1),
(5, 3, 1, '10', '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1),
(6, 3, 2, '20', '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1),
(7, 3, 3, '20', '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1),
(8, 3, 4, '30', '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `add_book_property`
--

CREATE TABLE `add_book_property` (
  `id` int NOT NULL,
  `property_id` int NOT NULL,
  `flor_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  `bed_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_book_property`
--

INSERT INTO `add_book_property` (`id`, `property_id`, `flor_no`, `room_no`, `bed_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 32, 'first', 10, 1, '2024-12-07 08:26:24', '2024-12-07 08:26:24', 1),
(2, 32, 'first', 10, 1, '2024-12-07 08:26:47', '2024-12-07 08:26:47', 1),
(3, 32, 'first', 10, 1, '2024-12-07 08:27:10', '2024-12-07 08:27:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `add_facilities_propery`
--

CREATE TABLE `add_facilities_propery` (
  `id` int NOT NULL,
  `property_id` int NOT NULL COMMENT 'properties.id',
  `facilities_id` int DEFAULT NULL COMMENT 'facilities.id',
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_facilities_propery`
--

INSERT INTO `add_facilities_propery` (`id`, `property_id`, `facilities_id`, `value`, `created_at`, `updated_at`, `status`) VALUES
(20, 2, 1, '2', '2024-12-04 10:18:46', '2024-12-04 10:18:46', 1),
(21, 2, 2, '3', '2024-12-04 10:18:46', '2024-12-04 10:18:46', 1),
(22, 2, 3, '1', '2024-12-04 10:18:46', '2024-12-04 10:18:46', 1),
(23, 2, 4, '1', '2024-12-04 10:18:46', '2024-12-04 10:18:46', 1),
(24, 3, 1, '3', '2024-12-04 10:28:49', '2024-12-04 10:28:49', 1),
(25, 3, 2, '2', '2024-12-04 10:28:49', '2024-12-04 10:28:49', 1),
(26, 3, 3, '1', '2024-12-04 10:28:49', '2024-12-04 10:28:49', 1),
(27, 3, 6, '2', '2024-12-04 10:28:49', '2024-12-04 10:28:49', 1),
(28, 4, 1, '2', '2024-12-04 10:37:16', '2024-12-04 10:37:16', 1),
(29, 4, 2, '2', '2024-12-04 10:37:16', '2024-12-04 10:37:16', 1),
(30, 4, 3, '1', '2024-12-04 10:37:16', '2024-12-04 10:37:16', 1),
(31, 4, 6, '1', '2024-12-04 10:37:16', '2024-12-04 10:37:16', 1),
(32, 5, 1, '4', '2024-12-04 10:41:34', '2024-12-04 10:41:34', 1),
(33, 5, 2, '2', '2024-12-04 10:41:34', '2024-12-04 10:41:34', 1),
(34, 5, 3, '2', '2024-12-04 10:41:34', '2024-12-04 10:41:34', 1),
(35, 6, 1, '1', '2024-12-04 10:45:49', '2024-12-04 10:45:49', 1),
(36, 6, 2, '3', '2024-12-04 10:45:49', '2024-12-04 10:45:49', 1),
(37, 6, 3, '1', '2024-12-04 10:45:49', '2024-12-04 10:45:49', 1),
(38, 6, 6, '2', '2024-12-04 10:45:49', '2024-12-04 10:45:49', 1),
(39, 7, 1, '2', '2024-12-04 10:48:07', '2024-12-04 10:48:07', 1),
(40, 7, 2, '3', '2024-12-04 10:48:07', '2024-12-04 10:48:07', 1),
(41, 7, 3, '1', '2024-12-04 10:48:07', '2024-12-04 10:48:07', 1),
(42, 7, 6, '2', '2024-12-04 10:48:07', '2024-12-04 10:48:07', 1),
(43, 8, 1, '2', '2024-12-04 10:53:22', '2024-12-04 10:53:22', 1),
(58, 13, 1, '1', '2024-12-04 11:22:32', '2024-12-04 11:22:32', 1),
(59, 13, 2, '1', '2024-12-04 11:22:32', '2024-12-04 11:22:32', 1),
(60, 13, 3, '1', '2024-12-04 11:22:32', '2024-12-04 11:22:32', 1),
(61, 14, 1, '3', '2024-12-04 11:24:00', '2024-12-04 11:24:00', 1),
(62, 14, 2, '1', '2024-12-04 11:24:00', '2024-12-04 11:24:00', 1),
(63, 14, 3, '1', '2024-12-04 11:24:00', '2024-12-04 11:24:00', 1),
(64, 14, 6, '1', '2024-12-04 11:24:00', '2024-12-04 11:24:00', 1),
(65, 15, 1, '1', '2024-12-04 11:47:27', '2024-12-04 11:47:27', 1),
(66, 15, 2, '2', '2024-12-04 11:47:27', '2024-12-04 11:47:27', 1),
(67, 15, 3, '1', '2024-12-04 11:47:27', '2024-12-04 11:47:27', 1),
(68, 15, 6, '1', '2024-12-04 11:47:27', '2024-12-04 11:47:27', 1),
(80, 19, 1, '1', '2024-12-04 12:08:47', '2024-12-04 12:08:47', 1),
(81, 19, 2, '1', '2024-12-04 12:08:47', '2024-12-04 12:08:47', 1),
(82, 19, 6, '1', '2024-12-04 12:08:47', '2024-12-04 12:08:47', 1),
(83, 20, 1, '2', '2024-12-04 12:10:09', '2024-12-04 12:10:09', 1),
(84, 20, 2, '2', '2024-12-04 12:10:09', '2024-12-04 12:10:09', 1),
(85, 20, 6, '2', '2024-12-04 12:10:09', '2024-12-04 12:10:09', 1),
(86, 21, 1, '2', '2024-12-04 12:11:48', '2024-12-04 12:11:48', 1),
(87, 21, 2, '1', '2024-12-04 12:11:48', '2024-12-04 12:11:48', 1),
(88, 21, 6, '1', '2024-12-04 12:11:48', '2024-12-04 12:11:48', 1),
(100, 22, 1, '1', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(101, 22, 2, '1', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(102, 22, 3, '1', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(103, 22, 4, '2', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(104, 22, 5, '2', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(105, 22, 6, '2', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(106, 22, 7, '3', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(107, 22, 8, '3', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(112, 18, 1, '2', '2024-12-05 08:56:28', '2024-12-05 08:56:28', 1),
(113, 18, 2, '1', '2024-12-05 08:56:28', '2024-12-05 08:56:28', 1),
(114, 18, 3, '1', '2024-12-05 08:56:28', '2024-12-05 08:56:28', 1),
(119, 17, 1, '2', '2024-12-05 09:06:35', '2024-12-05 09:06:35', 1),
(120, 17, 2, '1', '2024-12-05 09:06:35', '2024-12-05 09:06:35', 1),
(121, 17, 3, '1', '2024-12-05 09:06:35', '2024-12-05 09:06:35', 1),
(122, 17, 6, '1', '2024-12-05 09:06:35', '2024-12-05 09:06:35', 1),
(130, 16, 1, '1', '2024-12-05 12:36:36', '2024-12-05 12:36:36', 1),
(131, 16, 2, '1', '2024-12-05 12:36:36', '2024-12-05 12:36:36', 1),
(132, 16, 3, '1', '2024-12-05 12:36:36', '2024-12-05 12:36:36', 1),
(133, 16, 6, '1', '2024-12-05 12:36:36', '2024-12-05 12:36:36', 1),
(134, 9, 1, '2', '2024-12-05 12:37:00', '2024-12-05 12:37:00', 1),
(135, 9, 2, '2', '2024-12-05 12:37:00', '2024-12-05 12:37:00', 1),
(136, 9, 3, '1', '2024-12-05 12:37:00', '2024-12-05 12:37:00', 1),
(137, 9, 6, '1', '2024-12-05 12:37:00', '2024-12-05 12:37:00', 1),
(138, 10, 1, '1', '2024-12-05 12:37:11', '2024-12-05 12:37:11', 1),
(139, 10, 2, '1', '2024-12-05 12:37:11', '2024-12-05 12:37:11', 1),
(140, 10, 3, '1', '2024-12-05 12:37:11', '2024-12-05 12:37:11', 1),
(141, 11, 1, '2', '2024-12-05 12:37:31', '2024-12-05 12:37:31', 1),
(142, 11, 2, '2', '2024-12-05 12:37:31', '2024-12-05 12:37:31', 1),
(143, 11, 3, '1', '2024-12-05 12:37:31', '2024-12-05 12:37:31', 1),
(144, 12, 1, '1', '2024-12-05 12:37:50', '2024-12-05 12:37:50', 1),
(145, 12, 2, '1', '2024-12-05 12:37:50', '2024-12-05 12:37:50', 1),
(146, 12, 3, '1', '2024-12-05 12:37:50', '2024-12-05 12:37:50', 1),
(147, 12, 6, '1', '2024-12-05 12:37:50', '2024-12-05 12:37:50', 1),
(148, 24, 1, '945', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(149, 24, 2, '965', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(150, 24, 3, '227', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(151, 24, 4, '625', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(152, 24, 6, '837', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(153, 24, 7, '330', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(154, 24, 8, '371', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(155, 25, 3, '372', '2024-12-06 09:41:31', '2024-12-06 09:41:31', 1),
(156, 25, 5, '603', '2024-12-06 09:41:31', '2024-12-06 09:41:31', 1),
(157, 25, 8, '6', '2024-12-06 09:41:31', '2024-12-06 09:41:31', 1),
(158, 1, 4, '252', '2024-12-07 07:18:11', '2024-12-07 07:18:11', 1),
(159, 1, 5, '204', '2024-12-07 07:18:11', '2024-12-07 07:18:11', 1),
(160, 1, 6, '389', '2024-12-07 07:18:11', '2024-12-07 07:18:11', 1),
(161, 1, 7, '298', '2024-12-07 07:18:11', '2024-12-07 07:18:11', 1),
(162, 1, 8, '593', '2024-12-07 07:18:11', '2024-12-07 07:18:11', 1),
(171, 26, 1, '839', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(172, 26, 2, '98', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(173, 26, 3, '469', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(174, 26, 4, '221', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(175, 26, 5, '774', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(176, 26, 6, '397', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1),
(177, 26, 7, '372', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `add_package_service`
--

CREATE TABLE `add_package_service` (
  `id` int NOT NULL,
  `package_id` int NOT NULL COMMENT 'packages.id',
  `service_id` int NOT NULL COMMENT 'services.id',
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_package_service`
--

INSERT INTO `add_package_service` (`id`, `package_id`, `service_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2024-11-19 09:51:44', '2024-11-19 09:51:44'),
(2, 3, 2, 1, '2024-11-19 09:51:45', '2024-11-19 09:51:45'),
(3, 3, 4, 1, '2024-11-19 09:51:45', '2024-11-19 09:51:45'),
(4, 4, 1, 1, '2024-11-19 09:51:47', '2024-11-19 09:51:47'),
(5, 4, 2, 1, '2024-11-19 09:51:47', '2024-11-19 09:51:47'),
(6, 6, 1, 1, '2024-11-19 09:51:49', '2024-11-19 09:51:49'),
(7, 3, 12, 1, '2024-11-30 07:37:27', '2024-11-30 07:37:27'),
(8, 3, 11, 1, '2024-11-30 07:37:27', '2024-11-30 07:37:27'),
(9, 3, 10, 1, '2024-11-30 07:37:28', '2024-11-30 07:37:28'),
(10, 3, 9, 1, '2024-11-30 07:37:28', '2024-11-30 07:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Parking', 'amenities/l5uqA3zicJ2DAvwf5pODNpGLCAieAlMX8WATdceE.jpg', 1, '2024-12-06 11:59:49', '2024-12-07 07:15:46'),
(2, 'Free Wi-Fi', 'amenities/bLuYwFjxzuBfW19rJJ66VuR6DHla0Zq1XsiiSN6w.png', 1, '2024-12-06 12:00:56', '2024-12-07 07:15:40');

-- --------------------------------------------------------

--
-- Table structure for table `assignroutes`
--

CREATE TABLE `assignroutes` (
  `id` bigint UNSIGNED NOT NULL,
  `route_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Delete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignroutes`
--

INSERT INTO `assignroutes` (`id`, `route_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(6, 1, 2, 1, '2024-10-29 09:35:02', '2024-10-29 09:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `assign_lead`
--

CREATE TABLE `assign_lead` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL COMMENT 'loan_requests.id',
  `current_user_id` int NOT NULL COMMENT 'users.id',
  `assign_user_id` int NOT NULL COMMENT 'users.id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assign_lead`
--

INSERT INTO `assign_lead` (`id`, `lead_id`, `current_user_id`, `assign_user_id`, `created_at`) VALUES
(1, 1, 1, 30, '2024-12-10 12:38:06'),
(2, 1, 30, 31, '2024-12-10 12:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifsc_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upi_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_bank_active` tinyint NOT NULL DEFAULT '2' COMMENT '1-Active,2-Inactive',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Deactive,3-delete,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `account_name`, `account_no`, `ifsc_code`, `bank_name`, `upi_id`, `is_bank_active`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Amit Kumar', '158222817455', 'INDB0000053', 'Indusland', '155295@ybl', 1, 1, '2024-12-27 11:26:34', '2024-12-27 11:39:12'),
(2, 'Fazlu Rehman', '158222817456', 'INDB0000054', 'KOTAK', '78347@ibl', 2, 1, '2024-12-27 11:29:58', '2024-12-27 11:39:12'),
(3, 'HDDFFCC', '1234567890', 'HBHFDSFJSF OJS', 'HDDFFCCBB', 'ITIN@OKHDDFFCCB', 2, 1, '2025-01-16 17:18:53', '2025-01-16 17:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `type`, `image`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'home', 'banner/62LRCVTC1fUG35ddxli4CykKhp6II7LCTY0CV34X.png', 'Home', NULL, 3, '2024-11-27 10:29:48', '2024-12-04 13:50:10'),
(2, 'home', 'banner/mapNGPhAGa7QZBhzr8qUrhkGImVLB1eTxACG8IdT.jpg', 'Home', NULL, 1, '2024-11-27 10:29:48', '2024-12-04 13:50:05'),
(3, 'home', 'banner/tVMHtsBxyYmcfvO5thgquNnsdWEC4WvxMt9r8HR4.jpg', 'Home', NULL, 1, '2024-11-27 10:29:48', '2024-12-04 13:49:56'),
(4, 'project', 'banner/71cDZn0pn1WORpxkNJU9c549BhHyWBWwjzyxl1yn.png', 'Projects', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.', 1, '2024-11-27 10:29:48', '2024-12-04 07:13:10'),
(5, 'about ', 'banner/home_banner.png', 'About Us', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.', 1, '2024-11-27 10:29:48', '2024-11-27 10:29:52'),
(6, 'contact', 'banner/yj0P7naRLdpq1mPhY6XFYRvY4oL2EP5mTd9Bpfgk.png', 'Contact Us', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.', 1, '2024-11-27 10:29:48', '2024-12-04 07:12:56'),
(7, 'testimonial', 'banner/home_banner.png', 'Testimonials', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.', 1, '2024-11-27 10:29:48', '2024-11-27 10:29:52'),
(8, 'blog', 'banner/CgUt9G0yAf5ftHEc4rjto7bV3t2I9l8LM6mvpK3s.jpg', 'Blogs', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.', 1, '2024-11-27 10:29:48', '2024-12-04 07:58:42'),
(10, 'home', 'banner/KIqubBDIG9wPtXdtUecMxBRcqjmE1yIGbL7pgGg1.jpg', 'Home', NULL, 1, '2024-12-06 06:42:01', '2024-12-06 06:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `bedtypes`
--

CREATE TABLE `bedtypes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bedtypes`
--

INSERT INTO `bedtypes` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sdf', 1, '2024-12-06 12:13:58', '2024-12-06 12:13:58'),
(2, 'ssssss sdf', 3, '2024-12-06 12:14:22', '2024-12-06 12:14:32'),
(3, 'asdf', 1, '2024-12-06 13:49:45', '2024-12-06 13:49:45');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_link` text COLLATE utf8mb4_unicode_ci,
  `short_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image`, `posted_at`, `blog_link`, `short_content`, `long_content`, `status`, `created_at`, `updated_at`) VALUES
(1, '20 Way To Sell Your Product Faster', 'blog/GpIU7tAexVrbi5PS7Yhf6eEA1YTUTJA6vVZWOQGM.png', '2024-11-27 08:03:23', NULL, 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that do not yet have content.', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that do not yet have content.', 1, '2024-11-27 08:03:23', '2024-12-04 06:31:14'),
(2, '20 Way To Sell Your Product Fasterrr', 'blog/1k0fDZMpLeOIV8qUxAFP3ujz51Fcl6FdMWu9ARht.png', '2024-11-27 08:03:23', NULL, 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that do not yet have content.', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that do not yet have content.', 1, '2024-11-27 08:03:23', '2024-12-04 06:31:06'),
(3, '20 Way To Sell Your Product Fasterr', 'blog/w8tYCrckvXd2sdysHKbtJauE9zlv7Pvm3tfXLcL2.png', '2024-11-27 08:03:23', 'https://globstay.live.devs-nerasoft.tech/blog', 'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that do not yet have content.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante fermentum sit amet. Pellentesque commodo lacus at sodales sodales.\r\nQuisque sagittis orci ut diam condimentum, vel euismod erat placerat. In iaculis arcu eros, eget tempus orci facilisis id.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante fermentum sit amet.\r\nPellentesque commodo lacus at sodales sodales. Quisque sagittis orci ut diam condimentum, vel euismod erat placerat. In iaculis arcu eros, eget tempus orci facilisis id.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus.', 1, '2024-11-27 08:03:23', '2024-12-06 11:01:42'),
(4, 'First', 'blog/zPo1c9FKUaDvzn2RGCVfH5MIL021OZE3Cjf3WF4Z.jpg', '2024-12-03 10:44:00', NULL, 'first', 'second', 3, '2024-12-01 10:43:05', '2024-12-04 06:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,2-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Book', NULL, 1, '2024-11-27 07:18:02', '2024-12-04 06:36:04'),
(2, 'Sale', NULL, 1, '2024-11-27 07:18:02', '2024-12-04 06:35:53'),
(3, 'Purchase', NULL, 1, '2024-11-27 07:18:02', '2024-12-04 06:35:34'),
(6, 'new', 'categories/M5LfMKFYGTdtOuKqMMT8RaG1iowWyGXkzD5xlSAU.jpg', 3, '2024-12-06 09:51:12', '2024-12-06 14:02:44'),
(7, 'SSSS', NULL, 3, '2024-12-11 07:24:51', '2024-12-11 07:25:00'),
(8, 's', NULL, 3, '2024-12-11 07:24:54', '2024-12-11 07:24:58');

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `gst_no` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `booking_percentage` bigint NOT NULL DEFAULT '0',
  `booking_tax` bigint NOT NULL DEFAULT '0',
  `booking_post_percentage` bigint NOT NULL DEFAULT '0',
  `booking_post_tds` bigint NOT NULL DEFAULT '0',
  `discount` int NOT NULL DEFAULT '10',
  `radius` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `gst_no`, `logo`, `favicon`, `address`, `email`, `mobile`, `booking_percentage`, `booking_tax`, `booking_post_percentage`, `booking_post_tds`, `discount`, `radius`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Karnacab', '7YZPCX9483K2Z7', 'logos/S5QtXrNRYAn3PoTjr1qkzzLmDvNO1mdDV73gsa6A.png', 'favicons/EX8xYzeKv80pSvwAgV8JwW0ldtD8CBcGeUI5mTkO.png', 'Assotech Business Cresterra, Tower-1, Office No-705, 7th Floor, Noida Uttar Pradesh 201304', 'support@driver.com', '9266355084', 15, 400, 5, 20, 20, 5, '2024-10-16 10:32:37', '2025-07-21 16:27:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_url`
--

CREATE TABLE `dynamic_url` (
  `id` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dynamic_url`
--

INSERT INTO `dynamic_url` (`id`, `url`, `name`, `created_at`, `updated_at`, `status`) VALUES
(1, 'lead.create', 'Add Lead', '2024-10-11 12:00:11', '2024-10-11 12:00:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emi_collections`
--

CREATE TABLE `emi_collections` (
  `id` bigint UNSIGNED NOT NULL,
  `loan_id` int NOT NULL COMMENT 'loans.id',
  `agent_id` int NOT NULL COMMENT 'users.id',
  `emi_amount` int NOT NULL,
  `payment_mode` int NOT NULL COMMENT 'payment modes.id',
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emi_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1-Pending,2-Paid',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Deactive,3-delete,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT '1' COMMENT 'users.id',
  `property_id` int DEFAULT NULL COMMENT 'properties.id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_status` tinyint NOT NULL DEFAULT '1' COMMENT '	1-Initial Stage , 2-Team Call , 3-Call Dissconected, 4-Ringing , 5-Pipeline , 6-Visit align , 7-Conversion , 8-rejected , 9-assign lead	',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `user_id`, `property_id`, `name`, `email`, `mobile_no`, `message`, `location`, `budget`, `plan_date`, `loan_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 31, NULL, 'test lead', 'test@gmail.com', '7428059960', 'test message', '', NULL, NULL, 4, 1, '2024-12-10 12:33:47', '2024-12-10 12:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Free Wi-Fi', 'facilities/1fEzCLzTz0M6YnJYPQJsUerblOmkdtHx3imRA982.png', 1, '2024-11-29 06:27:34', '2024-12-02 06:26:55'),
(2, 'Bath', 'facilities/GDZiFQANcKo5L0qCjMI6Sd8nybaKrsGcDs92yEkY.png', 1, '2024-11-29 06:27:34', '2024-12-02 06:33:26'),
(3, 'Resturant', 'facilities/V8SdRovyfb0Apd5AjIYeREiOJeFzMGvJhkBbYQpI.png', 1, '2024-11-29 06:27:41', '2024-12-02 06:27:11'),
(4, 'Airport Transfer', 'facilities/4c8NElzPCpWN7VV1HW3G2hLTDyCZVouN1NYFL87X.png', 1, '2024-11-29 06:27:41', '2024-12-02 06:28:35'),
(5, 'Family Room', 'facilities/7jdvKIVBmJsBsLVK34ulBXlOJ69iVyIJvt3bkLVT.png', 1, '2024-11-29 06:27:42', '2024-12-02 06:27:47'),
(6, 'Kitchen', 'facilities/KiYI9CknkcK8Kgj3o5WV943cR9AxxLlKu0DFJmMJ.png', 1, '2024-11-29 06:27:42', '2024-12-02 06:27:36'),
(7, 'Luggage storage', 'facilities/sjuWn4G8lG5kMnGxKZ1z2LAweLkUZG5RukV8o465.png', 1, '2024-11-29 06:27:42', '2024-12-02 06:31:44'),
(8, 'Breakfast', 'facilities/cZ5N5vNg23M3NOyDaJB0Sz6PEfVXZEXHFsOnDeAz.png', 1, '2024-11-29 06:27:42', '2024-12-04 06:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallaries`
--

CREATE TABLE `gallaries` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-InActive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallaries`
--

INSERT INTO `gallaries` (`id`, `image`, `created_at`, `updated_at`, `status`) VALUES
(1, 'gallary/wZYri1FKCFjqfsqz29tIKDMEEozIcni7DRKmw0Sv.png', '2024-12-02 08:04:32', '2024-12-03 07:08:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kycdatas`
--

CREATE TABLE `kycdatas` (
  `id` int NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `state` varchar(250) DEFAULT NULL,
  `response` longtext,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `loan_request_id` int NOT NULL COMMENT 'loan_request.id',
  `aadhar_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kyc_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Pending,2-InProgress,3-Completed,4-Approved,5-Rejected',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Deactive,3-delete,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_leads`
--

CREATE TABLE `kyc_leads` (
  `id` bigint UNSIGNED NOT NULL,
  `loan_request_id` int NOT NULL COMMENT 'loan_requests.id',
  `user_id` int DEFAULT NULL COMMENT 'user.id',
  `route_id` int DEFAULT NULL COMMENT 'routes.id',
  `agent_id` int DEFAULT NULL COMMENT 'users.id',
  `file_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `son_of` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` text COLLATE utf8mb4_unicode_ci,
  `shop_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_address` text COLLATE utf8mb4_unicode_ci,
  `home_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_1_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_1_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_1_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_2_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_2_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_2_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_fees` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_docs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_docs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elec_bill` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gurn_docs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_verify` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rc_vehicle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-pending,2-submitd,3-approved,4-rejected',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-InActive,3-Deleted,4-Permanent deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_leads_guarantor`
--

CREATE TABLE `kyc_leads_guarantor` (
  `id` int NOT NULL,
  `kyc_id` int NOT NULL COMMENT 'kyc_leads.id',
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `son_of` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `type_of_work` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `shop_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `shop_type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_no_1` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_no_2` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `home_address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `land_load` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_processes`
--

CREATE TABLE `kyc_processes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `aadhar_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_address` text COLLATE utf8mb4_unicode_ci,
  `aadhar_profile_photo` text COLLATE utf8mb4_unicode_ci,
  `aadhar_mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_aadhar_verified` tinyint NOT NULL DEFAULT '2' COMMENT '	1-Verified,2-Non verified',
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pan_verified` tinyint NOT NULL DEFAULT '2' COMMENT 'is_pan_verified',
  `ifsc_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_bank_verified` tinyint NOT NULL DEFAULT '2' COMMENT '1-Verified,2-Non verified	',
  `live_photo` varchar(555) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-submitted,2-pending,3-approved,4-rejected',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyc_reject_reasons`
--

CREATE TABLE `kyc_reject_reasons` (
  `id` int NOT NULL,
  `kyc_id` int NOT NULL COMMENT 'kyc_leads.id',
  `reason` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint UNSIGNED NOT NULL,
  `kyc_id` int NOT NULL COMMENT 'kyc_leads.id',
  `user_id` int DEFAULT NULL COMMENT 'users.id',
  `route_id` int DEFAULT NULL COMMENT 'route.id',
  `loan_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_of_interest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` tinyint NOT NULL DEFAULT '3' COMMENT '1-Day,2-Weekly,3-Monthly,4-Yearly',
  `tenure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `process_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_charges_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_charges_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_charges_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_charges_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_charges_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disbrused_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emi_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Pending,2-Approvad but not disbursed,3-Disbursed,4-Reject,5-Closed',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-InActive,3-Deleted,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `kyc_id`, `user_id`, `route_id`, `loan_number`, `amount`, `rate_of_interest`, `frequency`, `tenure`, `process_charge`, `file_charge`, `other_charges_1`, `other_charges_2`, `other_charges_3`, `other_charges_4`, `other_charges_5`, `disbrused_amount`, `emi_amount`, `loan_start_date`, `pending_amount`, `loan_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '264784850942', '50000', '10', 1, '10', '10', '10', '10', '10', '10', '10', '10', '49940', '5,007.54', '2024-10-14', '50,075.40', 3, 1, '2024-10-14 05:17:35', '2024-10-14 05:17:35'),
(2, 1, 4, 1, '26771052699', '150000', '10', 2, '15', '5000', '1500', '2500', '3500', '1000', '500', '1500', '139500', '10,154.54', '2024-10-18', '152,318.10', 3, 1, '2024-10-15 12:12:07', '2024-10-15 12:12:07'),
(3, 7, 4, 7, '834722863097', '150000', '12', 3, '12', '1000', '100', '100', '100', '100', '100', '100', '149400', '13,327.32', '2024-09-01', '159,927.84', 3, 1, '2024-10-21 10:24:05', '2024-10-21 10:24:05'),
(4, 11, 4, 7, '7139577873', '150000', '12', 3, '12', '200', '200', '200', '200', '200', '200', '200', '148800', '13,327.32', '2024-11-01', '159,927.84', 3, 1, '2024-10-22 06:22:01', '2024-10-22 06:22:01'),
(5, 12, 4, 7, '290078504746', '150000', '12', 3, '12', '200', '200', '200', '200', '200', '200', '200', '148800', '13,327.32', '2024-10-22', '159,927.84', 2, 1, '2024-10-22 06:44:24', '2024-10-22 06:44:24'),
(6, 17, 2, 7, '552379870866', '100000', '12', 3, '12', '100', '100', '100', '100', '100', '100', '100', '99400', '8,884.88', '2024-11-01', '106,618.56', 2, 1, '2024-10-23 11:29:50', '2024-10-23 11:29:50'),
(7, 13, 4, 7, '899065274580', '150000', '12', 3, '12', '100', '100', '100', '100', '100', '100', '100', '149400', '13,327.32', '2024-11-01', '159,927.84', 2, 1, '2024-10-23 13:21:46', '2024-10-23 13:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `loan_disbursements`
--

CREATE TABLE `loan_disbursements` (
  `id` bigint UNSIGNED NOT NULL,
  `loan_id` int NOT NULL,
  `disbursement_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disbursement_mode` int NOT NULL COMMENT 'payment_modes.id',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disbursement_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disbrused_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Pending,2-Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_disbursements`
--

INSERT INTO `loan_disbursements` (`id`, `loan_id`, `disbursement_amount`, `disbursement_mode`, `image`, `disbursement_date`, `remark`, `loan_number`, `reference_no`, `created_at`, `updated_at`, `disbrused_status`) VALUES
(2, 1, '139500', 1, '1728999785_1727348006_offline.jpg', '2024-10-15', 'business loan', '26771052699', NULL, '2024-10-15 13:11:46', '2024-10-15 14:00:01', 2),
(3, 2, '139500', 1, '1729056413_1727348006_offline.jpg', '2024-10-15', 'business loan', '26771052699', NULL, '2024-10-16 05:17:00', '2024-10-16 05:26:53', 2),
(4, 3, '149400', 1, '1729507105_12lDIFbQTiiEFj_KlUvRNg.jpeg', '2024-10-21', 'business loan', '834722863097', NULL, '2024-10-21 10:33:24', '2024-10-21 10:38:29', 2),
(5, 4, '149400', 1, '1729578346_app.jpg', '2024-10-22', 'business loan', '834722863097', NULL, '2024-10-22 06:24:47', '2024-10-22 06:31:54', 2);

-- --------------------------------------------------------

--
-- Table structure for table `loan_requests`
--

CREATE TABLE `loan_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL COMMENT 'user.id',
  `service_no` int DEFAULT NULL COMMENT 'providers.route	',
  `lead_create_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_address` text COLLATE utf8mb4_unicode_ci,
  `cheque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_thiya` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_address` text COLLATE utf8mb4_unicode_ci,
  `file_hai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plus_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_loan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ser_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rn_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountant_sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guarantor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guarantor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_of_loan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referal_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referal_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-pending,2-viewed,3-Under Discussion,4-pending for kyc,5-qualified,6-rejected',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-InActive,3-Deleted,4-Permanent deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_requests`
--

INSERT INTO `loan_requests` (`id`, `user_id`, `service_no`, `lead_create_date`, `name`, `work`, `mobile`, `work_address`, `cheque`, `shop_thiya`, `home_type`, `home_address`, `file_hai`, `loan_amount`, `tut`, `balance`, `plus_day`, `old_loan`, `loan_type`, `file_no`, `ser_no`, `rn_no`, `amount`, `accountant_sign`, `guarantor`, `guarantor_name`, `address`, `zip_code`, `reason_of_loan`, `referal_name`, `referal_mobile`, `token`, `remark`, `loan_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2024-10-29', 'Ayush Gupta', 'test', '7428059960', '9/10 Shyam Nagar  Ambala Cantt', 'Y', 'RENTED', 'OWN', 'Mohali Punjab', 'Y', '50000', '1200', '1400', '120', '500', 'New', '120', '121', '122', '5410', '123456789', 'N', 'Amit', NULL, NULL, NULL, NULL, NULL, NULL, 'first lead', 3, 1, '2024-10-28 06:06:21', '2024-12-10 07:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `longitude` decimal(10,7) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `latitude`, `address`, `longitude`, `created_at`, `updated_at`) VALUES
(20, 28.4926295, 'Sector-168, Taj Expressway Chhaproli Khadar, Dostpur Mangrauli, Sector 168, Noida, Chhaproli Khadar, Uttar Pradesh 201306, India', 77.4120908, '2025-07-23 10:08:19', '2025-07-23 10:08:19'),
(21, 28.5638656, 'HF74+RVV, Khairpur Gurjar, Knowledge Park V, Greater Noida, Bisrakh Jalalpur, Uttar Pradesh 203207, India', 77.4569984, '2025-07-25 12:30:36', '2025-07-25 12:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `sender_id` bigint UNSIGNED NOT NULL,
  `receiver_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `is_read`, `created_at`, `updated_at`, `status`) VALUES
(3, 4, 5, 'Hi', 1, '2024-11-25 06:05:59', '2024-11-25 06:10:54', 1),
(4, 5, 4, 'Hello', 1, '2024-11-25 06:06:13', '2024-11-25 06:09:40', 1),
(5, 4, 5, 'Hello Hy', 1, '2024-11-25 06:06:23', '2024-11-25 06:10:54', 1),
(6, 5, 4, 'Hello By', 1, '2024-11-25 06:06:30', '2024-11-25 06:09:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_10_01_093153_create_role_models_table', 1),
(7, '2024_10_01_093231_create_roles_table', 1),
(8, '2024_10_03_174248_create_loan_requests_table', 2),
(9, '2024_10_07_170956_create_loans_table', 3),
(10, '2024_10_15_133013_create_payment_modes_table', 4),
(11, '2024_10_15_145619_create_banks_table', 5),
(12, '2024_11_13_134153_create_refers_table', 6),
(13, '2024_11_25_110246_create_messages_table', 7),
(14, '2024_11_27_124436_create_categories_modals_table', 8),
(15, '2024_11_27_131734_create_testimonals_table', 9),
(16, '2024_11_27_132653_create_blogs_table', 10),
(17, '2024_11_27_155622_create_banners_table', 11),
(18, '2024_11_27_160527_create_enquiries_table', 12),
(19, '2024_11_29_152408_create_properties_table', 13),
(20, '2024_11_29_165249_create_facilities_table', 14),
(21, '2024_11_29_165929_create_property_reviews_table', 15),
(22, '2024_12_02_115637_create_seos_table', 16),
(23, '2024_12_02_131916_create_gallaries_table', 17),
(24, '2024_12_02_133920_create_pages_table', 18),
(25, '2024_12_18_184801_create_pincodes_table', 19),
(26, '2024_12_18_185243_create_bookings_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int NOT NULL,
  `loan_request_id` int NOT NULL COMMENT 'loan_requests.id',
  `provider_id` int DEFAULT NULL,
  `user_id` int NOT NULL COMMENT 'users.id\r\n',
  `loan_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Initial Stage , 2-Team Call , 3-Call Dissconected, 4-Ringing , 5-Pipeline , 6-Visit align , 7-Conversion , 8-rejected , 9-assign lead',
  `title` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `loan_request_id`, `provider_id`, `user_id`, `loan_status`, `title`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, NULL, 1, 1, 'Initial Stage', '2024-12-10 12:34:28', '2024-12-10 12:34:28', 1),
(2, 1, NULL, 1, 9, 'Lead Assign To first', '2024-12-10 12:38:06', '2024-12-10 12:38:06', 1),
(3, 1, NULL, 1, 5, 'sdfasddf', '2024-12-10 12:38:37', '2024-12-10 12:38:37', 1),
(4, 1, NULL, 30, 5, 'sdfsdf', '2024-12-10 12:38:59', '2024-12-10 12:38:59', 1),
(5, 1, NULL, 30, 5, 'asdfsadf', '2024-12-10 12:39:09', '2024-12-10 12:39:09', 1),
(6, 1, NULL, 30, 5, 'asdfasdf', '2024-12-10 12:39:25', '2024-12-10 12:39:25', 1),
(7, 1, NULL, 30, 5, 'sdfsdf', '2024-12-10 12:39:59', '2024-12-10 12:39:59', 1),
(8, 1, NULL, 30, 5, 'asfdasdf', '2024-12-10 12:41:10', '2024-12-10 12:41:10', 1),
(9, 1, NULL, 30, 5, 'asdfasdf', '2024-12-10 12:41:13', '2024-12-10 12:41:13', 1),
(10, 1, NULL, 30, 5, 'sdfsdfdsf', '2024-12-10 12:41:50', '2024-12-10 12:41:50', 1),
(11, 1, NULL, 30, 9, 'Lead Assign To second', '2024-12-10 12:41:56', '2024-12-10 12:41:56', 1),
(12, 1, NULL, 31, 5, 'ss', '2024-12-10 12:45:46', '2024-12-10 12:45:46', 1),
(13, 1, NULL, 1, 4, 'gdsdf', '2024-12-11 06:24:11', '2024-12-11 06:24:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_charge` int NOT NULL,
  `large_charge` int NOT NULL,
  `gaint_charge` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `small_charge`, `large_charge`, `gaint_charge`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Package 1', 100, 200, 200, 1, '2024-11-11 07:37:20', '2024-11-13 06:51:22'),
(4, 'Package 2', 50000, 0, 0, 1, '2024-11-11 07:44:22', '2024-11-11 07:46:01'),
(5, 'test', 11111111, 0, 0, 3, '2024-11-11 12:31:09', '2024-11-11 12:31:30'),
(6, 'Package 3', 1000, 20000, 30000, 1, '2024-11-13 06:51:33', '2024-11-13 06:51:33'),
(7, 'xxx', 100, 200, 300, 1, '2024-11-29 05:59:28', '2024-11-29 05:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `paragraph` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `title`, `paragraph`, `image`, `created_at`, `updated_at`) VALUES
(1, 'term_and_condition', 'Term & Conditions', '<p><strong>Terms conditions&nbsp;</strong></p>\r\n\r\n<p><strong>The Platform is owned by KARNACAB TRANSPORT SERVICE PRIVATE LIMIT ED, a company incorporated under the Companies Act, 1956 with its registered office at WARD NO 6-41 KAHARA REFUGEE COLONY SAHARSA BIHAR ,Saharsa ,India 852202 (hereinafter referred to as &lsquo;Platform Owner&rsquo;, &#39;we&#39;, &#39;us&#39;, &#39;our&#39;)..<br />\r\nYour use of the Platform and services and tools are governed by the following terms and conditions (&ldquo;Terms of Use&rdquo;) as applicable to the Platform including the applicable policies which are incorporated herein by way of reference. If You transact on the Platform, You shall be subject to the policies that are applicable to the Platform for such transaction. By mere use of the Platform, You shall be contracting with the Platform Owner and these terms and conditions including the policies constitute Your binding obligations, with Platform Owner. These Terms of Use relate to your use of our website, goods (as applicable) or services (as applicable) (collectively, &#39;Services&#39;). Any terms and conditions proposed by You which are in addition to or which conflict with these Terms of Use are expressly rejected by the Platform Owner and shall be of no force or effect. These Terms of Use can be modified at any time without assigning any reason. It is your responsibility to periodically review these Terms of Use to stay informed of updates..<br />\r\nFor the purpose of these Terms of Use, wherever the context so requires &lsquo;you&rsquo;, &#39;your&#39; or &lsquo;user&rsquo; shall mean any natural or legal person who has agreed to become a user/buyer on the Platform..<br />\r\nACCESSING, BROWSING OR OTHERWISE USING THE PLATFORM INDICATES YOUR AGREEMENT TO ALL THE TERMS AND CONDITIONS UNDER THESE TERMS OF USE, SO PLEASE READ THE TERMS OF USE CAREFULLY BEFORE PROCEEDING..<br />\r\nThe use of Platform and/or availing of our Services is subject to the following Terms of Use:<br />\r\nTo access and use the Services, you agree to provide true, accurate and complete information to us during and after registration, and you shall be responsible for all acts done through the use of your registered account on the Platform..<br />\r\nNeither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials offered on this website or through the Services, for any specific purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law..<br />\r\nYour use of our Services and the Platform is solely and entirely at your own risk and discretion for which we shall not be liable to you in any manner. You are required to independently assess and ensure that the Services meet your requirements..<br />\r\nThe contents of the Platform and the Services are proprietary to us and are licensed to us. You will not have any authority to claim any intellectual property rights, title, or interest in its contents. The contents includes and is not limited to the design, layout, look and graphics..<br />\r\nYou acknowledge that unauthorized use of the Platform and/or the Services may lead to action against you as per these Terms of Use and/or applicable laws..<br />\r\nYou agree to pay us the charges associated with availing the Services..<br />\r\nYou agree not to use the Platform and/ or Services for any purpose that is unlawful, illegal or forbidden by these Terms, or Indian or local laws that might apply to you.<br />\r\nYou agree and acknowledge that website and the Services may contain links to other third party websites. On accessing these links, you will be governed by the terms of use, privacy policy and such other policies of such third party websites. These links are provided for your convenience for provide further information..<br />\r\nYou understand that upon initiating a transaction for availing the Services you are entering into a legally binding and enforceable contract with the Platform Owner for the Services..<br />\r\nYou shall indemnify and hold harmless Platform Owner, its affiliates, group companies (as applicable) and their respective officers, directors, agents, and employees, from any claim or demand, or actions including reasonable attorney&#39;s fees, made by any third party or penalty imposed due to or arising out of Your breach of this Terms of Use, privacy Policy and other Policies, or Your violation of any law, rules or regulations or the rights (including infringement of intellectual property rights) of a third party.<br />\r\nNotwithstanding anything contained in these Terms of Use, the parties shall not be liable for any failure to perform an obligation under these Terms if performance is prevented or delayed by a force majeure event..<br />\r\nThese Terms and any dispute or claim relating to it, or its enforceability, shall be governed by and construed in accordance with the laws of India..<br />\r\nAll disputes arising out of or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts in Saharsa and Bihar.<br />\r\nAll concerns or communications relating to these Terms must be communicated to us using the contact information provided on this Application.</strong></p>', 'pages/HFaAgKMPxe8bcnwpsSEjuusltVUzSLnaE1TyJQRU.jpg', '2024-12-02 08:24:31', '2025-07-22 06:35:20'),
(2, 'privacy_policy', 'Privacy Policy', '<p>At <strong>Karnacab</strong>, your privacy&nbsp; is our priority. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and services. Please read this policy carefully to understand what personal data we collect and how we handle it.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1><strong>1. Information We Collect</strong></h1>\r\n\r\n<p>We collect the following types of information to provide and improve our services:</p>\r\n\r\n<h2>a. <strong>Personal Information</strong></h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Name</p>\r\n	</li>\r\n	<li>\r\n	<p>Phone number</p>\r\n	</li>\r\n	<li>\r\n	<p>Email address</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile photo (optional)</p>\r\n	</li>\r\n	<li>\r\n	<p>Government-issued ID (for drivers)</p>\r\n	</li>\r\n	<li>\r\n	<p>Payment information (for processing transactions securely)</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>b. <strong>Location Data</strong></h2>\r\n\r\n<p>We collect <strong>precise location data</strong> from your mobile device to enable critical app features such as:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Matching passengers with nearby drivers</p>\r\n	</li>\r\n	<li>\r\n	<p>Real-time navigation and route optimization</p>\r\n	</li>\r\n	<li>\r\n	<p>Pickup and drop-off tracking</p>\r\n	</li>\r\n	<li>\r\n	<p>Trip history</p>\r\n	</li>\r\n	<li>\r\n	<p>Emergency support and safety features</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Location data is collected:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>When the app is open and actively used</p>\r\n	</li>\r\n	<li>\r\n	<p>Optionally, when the app is in the background (for drivers, during active trips)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>You can manage location permissions in your device settings at any time.</p>\r\n\r\n<h1><strong>2. How We Use Your Information</strong></h1>\r\n\r\n<p>We use the collected data for purposes including:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Providing cab booking and ride management services</p>\r\n	</li>\r\n	<li>\r\n	<p>Navigating routes and ensuring accurate pick-up/drop-off</p>\r\n	</li>\r\n	<li>\r\n	<p>Verifying users and ensuring security</p>\r\n	</li>\r\n	<li>\r\n	<p>Processing payments and invoices</p>\r\n	</li>\r\n	<li>\r\n	<p>Communicating updates, offers, and support</p>\r\n	</li>\r\n	<li>\r\n	<p>Complying with legal obligations and responding to lawful requests</p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h1><strong>3. Sharing of Your Information</strong></h1>\r\n\r\n<p>We do <strong>not sell or rent</strong> your personal data to third parties. We only share your data in the following cases:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>With drivers or passengers:</strong> for completing rides and enabling contact (e.g., name and phone number).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>With third-party service providers:</strong> like payment gateways (e.g., Razorpay), SMS providers, or cloud hosting services.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>With law enforcement or legal authorities:</strong> when required to comply with applicable laws or to protect our legal rights.</p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h1><strong>4. Data Security</strong></h1>\r\n\r\n<p>We implement commercially reasonable physical, technical, and administrative safeguards to protect your personal information from unauthorized access, disclosure, alteration, or destruction.</p>\r\n\r\n<hr />\r\n<h1><strong>5. Your Choices and Rights</strong></h1>\r\n\r\n<p>You may:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Update or correct your profile data from within the app</p>\r\n	</li>\r\n	<li>\r\n	<p>Revoke location access via your device settings</p>\r\n	</li>\r\n	<li>\r\n	<p>Request deletion of your account and personal data by contacting our support team</p>\r\n	</li>\r\n</ul>\r\n\r\n<hr />\r\n<h1><strong>6. Children&#39;s Privacy</strong></h1>\r\n\r\n<p>Our app is not intended for use by children under the age of 13. We do not knowingly collect data from children. If we become aware that we have collected personal data from a child, we will delete it immediately.</p>\r\n\r\n<hr />\r\n<h1><strong>7. Third-Party Links and Services</strong></h1>\r\n\r\n<p>Our app may contain links to third-party websites or services. We are not responsible for their privacy practices. Please review their policies before interacting with them.</p>\r\n\r\n<hr />\r\n<h1><strong>8. Changes to This Privacy Policy</strong></h1>\r\n\r\n<p>We may update this Privacy Policy from time to time. We will notify you of significant changes through in-app notifications or updates. Continued use of the app means you accept the updated policy.</p>', 'pages/dw7wqO5iwSkpSAxIHFtuAENCFDUqPhV3Feu0mvsJ.jpg', '2024-12-02 08:24:41', '2025-07-17 11:10:23'),
(4, 'about_us', 'About Us', '<p>About Us &ndash; KARNACAB TRANSPORT SERVICE PRIVATE LIMITED<br />\r\nKARNACAB TRANSPORT SERVICE PRIVATE LIMITED is a professionally managed transport solutions company dedicated to offering safe, reliable, and affordable cab and logistics services across regions. Incorporated in 2024 and headquartered in Saharsa, Bihar, KARNACAB is committed to redefining daily commuting and intercity travel experiences through technology-driven and customer-focused service.</p>\r\n\r\n<p>We specialize in:</p>\r\n\r\n<p>Cab Booking Services &ndash; On-demand rides for local, outstation, and airport transfers.</p>\r\n\r\n<p>Logistics &amp; Transport Support &ndash; Customized solutions for goods movement and corporate travel.</p>\r\n\r\n<p>Warehousing and Mobility Assistance &ndash; Value-added services for businesses requiring storage and coordinated delivery.</p>\r\n\r\n<p>Tech-enabled Operations &ndash; Seamless booking and tracking through our mobile app with transparent pricing and support.</p>\r\n\r\n<p>At KARNACAB, we prioritize punctuality, driver professionalism, and passenger safety. Whether it&rsquo;s a one-time ride or regular transport needs, we aim to deliver a smooth, dependable, and affordable experience to every customer.</p>', 'pages/1H6nqVBWLmAKQpXkOUB74zlTvkmefCmDx9ptFdDm.jpg', '2024-12-02 08:24:41', '2025-07-19 12:54:32'),
(5, 'return_refund', 'Return & Refund', '<p>Cancellation &amp; Refund Policy<br />\r\nRefund eligibility is determined by the cancellation window above.</p>\r\n\r\n<p>Qualified refunds are processed and credited to your payment source within 2&ndash;3 business days</p>\r\n\r\n<p><br />\r\n**Bookings can be cancelled up to 2 hours before the scheduled pick‑up time with no cancellation charge.</p>\r\n\r\n<p>Within 2 hours of pick‑up, penalties may apply:</p>\r\n\r\n<p>Single‑day trips or airport transfers: free cancellation if done at least 4 hours before pick‑up; full charge if cancelled within 2 hours.</p>\r\n\r\n<p>Multi‑day trips: if cancelled within 2 hours of departure, the first‑day rate is charged.</p>', 'pages/PtT0ZrvzuD5WE7ON8DL9GbkuNwUHOauUMUwUwYTK.jpg', '2024-12-02 08:24:41', '2025-07-19 12:53:56'),
(6, 'software_liesence', 'Software Liesence', '<p>Your privacy is important to us. It is Brainstorming&#39;s policy to respect your privacy regarding any information we may collect from you across our website, and other sites we own and operate.<br />\r\n<br />\r\nWe only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we&rsquo;re collecting it and how it will be used.<br />\r\n<br />\r\nWe only retain collected information for as long as necessary to provide you with your requested service. What data we store, we&rsquo;ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.<br />\r\n<br />\r\nWe don&rsquo;t share any personally identifying information publicly or with third-parties, except when required to by law.</p>', 'pages/Oec1ZnTh4LSzSiqc6WKxSfnjVWlk34Z8ANiP3uTk.jpg', '2024-12-02 08:24:41', '2025-05-01 07:56:11'),
(7, 'contact_us', 'Contact Us', '<h3>📞 <strong>Contact Us</strong></h3>\r\n\r\n<p>We&rsquo;re here to help! Whether you have a question, need support, or want to share feedback, feel free to reach out to us through any of the options below.</p>\r\n\r\n<p><strong>📍 Office Address:</strong><br />\r\n[Ward no 6/41 C/o Baleshwar Prasad Refugee Colony Kahara]<br />\r\n[Saharsa Bihar 852202]</p>\r\n\r\n<p><strong>📞 Phone:</strong><br />\r\n+91-9523707084 (Mon&ndash;Fri, 10:00 AM &ndash; 6:00 PM)</p>\r\n\r\n<p><strong>📧 Email:</strong><br />\r\nKarnacabservice@gmail.com<br />\r\nKarnacab@yahoo.com</p>\r\n\r\n<p><strong>📱 Social Media:</strong><br />\r\nFollow us on:<br />\r\nFacebook | Twitter | Instagram | LinkedIn</p>\r\n\r\n<p><strong>🕒 Working Hours:</strong><br />\r\nMonday &ndash; Friday: 10:00 AM to 6:00 PM<br />\r\nSaturday &ndash; Sunday: Closed</p>', 'pages/Oec1ZnTh4LSzSiqc6WKxSfnjVWlk34Z8ANiP3uTk.jpg', '2024-12-02 08:24:41', '2025-07-22 06:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` int NOT NULL COMMENT 'users.id',
  `user_id` int NOT NULL COMMENT 'tbl_bookings.id',
  `amount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_mode` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `response` text,
  `type` varchar(255) NOT NULL DEFAULT 'karnacab' COMMENT 'karnacab,payu',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `user_id`, `amount`, `status`, `payment_mode`, `payment_type`, `transaction_id`, `response`, `type`, `created_at`, `updated_at`) VALUES
(1, 34, 298, '1403', 'success', 'cash', 'debit', 'TXN2154584811', NULL, 'karnacab', '2025-07-29 09:33:02', '2025-07-29 09:33:02'),
(2, 34, 296, '1403', 'success', 'cash', 'credit', 'TXN1825438872', NULL, 'karnacab', '2025-07-29 09:33:02', '2025-07-29 09:33:02'),
(3, 34, 10, '204.00', 'success', 'CC', 'debit', 'KC341753781643171', '{\"mihpayid\":\"403993715534440572\",\"request_id\":\"\",\"bank_ref_num\":\"527818006907242400\",\"amt\":\"204.00\",\"transaction_amount\":\"204.00\",\"txnid\":\"KC341753781643171\",\"additional_charges\":\"0.00\",\"productinfo\":\"Booking  34\",\"firstname\":\"Customer\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"425276\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-07-29 15:05:16\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":204,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"payment_aggregator\":\"PayU\",\"offerAvailed\":null}', 'payu', '2025-07-29 09:35:42', '2025-07-29 09:35:42'),
(4, 35, 298, '721', 'success', 'card', 'debit', 'TXN9483773301', NULL, 'karnacab', '2025-07-29 09:38:27', '2025-07-29 09:38:27'),
(5, 35, 296, '721', 'success', 'card', 'credit', 'TXN2615186949', NULL, 'karnacab', '2025-07-29 09:38:27', '2025-07-29 09:38:27'),
(6, 35, 10, '105.00', 'success', 'CC', 'debit', 'KC351753782114173', '{\"mihpayid\":\"403993715534440698\",\"request_id\":\"\",\"bank_ref_num\":\"729156483152237400\",\"amt\":\"105.00\",\"transaction_amount\":\"105.00\",\"txnid\":\"KC351753782114173\",\"additional_charges\":\"0.00\",\"productinfo\":\"Booking  35\",\"firstname\":\"Customer\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"351600\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-07-29 15:14:53\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":105,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"payment_aggregator\":\"PayU\",\"offerAvailed\":null}', 'payu', '2025-07-29 09:45:16', '2025-07-29 09:45:16'),
(7, 39, 255, '587', 'success', 'cash', 'debit', 'TXN8731549163', NULL, 'karnacab', '2025-07-29 10:59:37', '2025-07-29 10:59:37'),
(8, 39, 250, '587', 'success', 'cash', 'credit', 'TXN8770465984', NULL, 'karnacab', '2025-07-29 10:59:37', '2025-07-29 10:59:37'),
(9, 39, 255, '85.00', 'success', 'CC', 'debit', 'KC391753786802962', '{\"mihpayid\":\"403993715534441799\",\"request_id\":\"\",\"bank_ref_num\":\"214581122976486240\",\"amt\":\"85.00\",\"transaction_amount\":\"85.00\",\"txnid\":\"KC391753786802962\",\"additional_charges\":\"0.00\",\"productinfo\":\"Booking  39\",\"firstname\":\"Customer\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"624593\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-07-29 16:33:00\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":85,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"payment_aggregator\":\"PayU\",\"offerAvailed\":null}', 'payu', '2025-07-29 11:03:26', '2025-07-29 11:03:26'),
(10, 44, 255, '2340', 'success', 'cash', 'debit', 'TXN9665011805', NULL, 'karnacab', '2025-07-29 11:17:09', '2025-07-29 11:17:09'),
(11, 44, 250, '2340', 'success', 'cash', 'credit', 'TXN3868366176', NULL, 'karnacab', '2025-07-29 11:17:09', '2025-07-29 11:17:09'),
(12, 44, 250, '340.00', 'success', 'CC', 'debit', 'KC441753788181784', '{\"mihpayid\":\"403993715534442018\",\"request_id\":\"\",\"bank_ref_num\":\"714685144044869400\",\"amt\":\"340.00\",\"transaction_amount\":\"340.00\",\"txnid\":\"KC441753788181784\",\"additional_charges\":\"0.00\",\"productinfo\":\"Booking  44\",\"firstname\":\"Customer\",\"bankcode\":\"CC\",\"udf1\":\"\",\"udf2\":\"\",\"udf3\":\"\",\"udf4\":\"\",\"udf5\":\"\",\"field2\":\"764805\",\"field9\":\"Transaction is Successful\",\"error_code\":\"E000\",\"addedon\":\"2025-07-29 16:53:45\",\"payment_source\":\"payu\",\"card_type\":\"MAST\",\"error_Message\":\"NO ERROR\",\"net_amount_debit\":340,\"disc\":\"0.00\",\"mode\":\"CC\",\"PG_TYPE\":\"CC-PG\",\"card_no\":\"XXXXXXXXXXXX2346\",\"status\":\"success\",\"unmappedstatus\":\"captured\",\"Merchant_UTR\":null,\"Settled_At\":\"0000-00-00 00:00:00\",\"name_on_card\":null,\"card_token\":null,\"payment_aggregator\":\"PayU\",\"offerAvailed\":null}', 'payu', '2025-07-29 11:24:08', '2025-07-29 11:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Deactive,3-delete,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, '2024-10-15 08:17:17', '2024-10-15 08:17:17'),
(2, 'UPI', 1, '2024-10-15 08:17:56', '2024-10-15 08:17:56'),
(3, 'Bank Transfer', 1, '2024-10-15 08:18:22', '2024-10-15 08:18:22'),
(4, 'Cheque', 1, '2024-10-15 08:18:31', '2024-10-15 12:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `per_cate_id` int NOT NULL COMMENT 'permission_category.id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `per_cate_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Create Listing', 2, '2024-12-04 11:37:29', '2025-01-21 13:36:12'),
(2, 1, 'Update Listing', 1, '2024-12-04 11:38:06', '2024-12-06 08:05:10'),
(3, 1, 'View Listing', 1, '2024-12-04 11:38:11', '2024-12-06 08:05:26'),
(4, 1, 'Approved Listing', 1, '2024-12-04 11:38:21', '2024-12-06 08:05:32'),
(5, 1, 'Deleted Listing', 1, '2024-12-06 08:00:16', '2024-12-06 08:05:39'),
(6, 2, 'Self Registration', 1, '2024-12-09 13:34:17', '2024-12-09 13:34:17'),
(7, 2, 'Property Listing', 1, '2024-12-09 13:34:24', '2024-12-09 13:34:24'),
(8, 2, 'View Properties', 1, '2024-12-09 13:34:32', '2024-12-09 13:34:32'),
(9, 2, 'Login Enable', 1, '2024-12-09 13:35:02', '2024-12-09 13:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `category_name`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Property Listing', '2024-12-04 11:36:04', '2024-12-06 07:26:56', 1),
(2, 'Seller', '2024-12-09 13:34:06', '2024-12-09 13:34:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pet_category`
--

CREATE TABLE `pet_category` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL COMMENT 'users.id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pet_bred` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pet_category`
--

INSERT INTO `pet_category` (`id`, `user_id`, `title`, `image`, `pet_size`, `pet_bred`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dogs', 'pet_category/z0mWcpbhoCMacGbHUN9G5v5gCxh6ZrZFSUe9mvss.jpg', NULL, NULL, 1, '2024-11-11 06:35:24', '2024-11-11 06:41:14'),
(2, NULL, 'Birds', 'pet_category/dOKkP6VYB81HUk5Dgl1xzwG8ORMsFLZzMXXEbZ5s.jpg', NULL, NULL, 1, '2024-11-11 06:41:31', '2024-11-11 06:41:31'),
(3, NULL, 'Rabbit', 'pet_category/S9bYjljKopPPHyokmGD4kxuTWOFEbeuXOTaFafTT.jpg', NULL, NULL, 2, '2024-11-11 06:42:08', '2024-11-30 07:34:15'),
(4, NULL, 'Cats', 'pet_category/XZwJH4VVef6tUNk9CQd7I80h0NOqKYWgd7f6JmVa.jpg', NULL, NULL, 3, '2024-11-11 06:43:49', '2024-11-21 06:28:35'),
(5, 1, 'lsdfsf\nsssssssss', 'pet_category/s3lUip3FMegai8EDebLi4HJV6nbaZDHO46L62lOn.jpg', 'asdfasdf', 'asfdasfsdf', 3, '2024-11-20 11:16:33', '2024-11-21 06:28:23'),
(6, 1, 'Dogs', 'pet_category/wPjc2iMPzxo9G84DERbfyF7HmBGr35yqdsQhECec.jpg', 'XD', 'SMALL', 1, '2024-11-20 11:18:03', '2024-11-20 12:07:32'),
(7, 1, 'Dogs', 'pet_category/ItbmkF0ha1o1JaZEewMeKb9dRZ0Y7eaHjGnalGg8.jpg', 'XD', 'SMALL', 1, '2024-11-21 06:15:58', '2024-11-21 06:15:58'),
(8, 1, 'Dogss', 'pet_category/7MrSFpM8QJauabEIBncPVU4gv4SxJs8BE0sjl8lW.jpg', 'XD', 'SMALL', 1, '2024-11-21 06:16:31', '2024-11-25 05:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` bigint UNSIGNED NOT NULL,
  `pin_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `pin_code`, `status`, `created_at`, `updated_at`) VALUES
(1, '201304', 1, '2024-12-18 13:19:57', '2024-12-18 13:19:57'),
(2, '201305', 1, '2024-12-18 13:20:45', '2024-12-18 13:20:45'),
(3, '110001', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(4, '110002', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(5, '110003', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(6, '201301', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(7, '201305', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(8, '400001', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(9, '400002', 1, '2024-12-18 13:22:06', '2024-12-20 11:57:00'),
(10, '500001', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(11, '600001', 1, '2024-12-18 13:22:06', '2024-12-18 13:22:06'),
(12, '700000', 3, '2024-12-18 13:22:06', '2024-12-19 07:33:05'),
(13, '700000', 1, '2024-12-19 07:33:06', '2024-12-19 07:33:06'),
(14, '110093', 1, '2024-12-19 07:35:09', '2024-12-19 07:35:32'),
(15, '203207', 1, '2024-12-20 11:56:11', '2024-12-20 11:56:11'),
(16, '201313', 1, '2024-12-20 11:56:23', '2024-12-20 11:56:55'),
(17, '203202', 1, '2024-12-20 11:56:29', '2024-12-20 11:56:50'),
(18, '203203', 1, '2024-12-20 11:56:38', '2024-12-20 11:56:44'),
(19, '110095', 1, '2024-12-20 12:20:27', '2024-12-20 12:20:27'),
(20, '110083', 1, '2024-12-26 14:46:21', '2024-12-26 14:46:23'),
(21, '122001', 1, '2025-01-16 06:53:41', '2025-01-16 06:53:41'),
(22, '122000', 1, '2025-01-16 06:53:45', '2025-01-16 06:53:45'),
(23, '122003', 1, '2025-01-16 06:53:50', '2025-01-16 06:53:50'),
(24, '121006', 1, '2025-01-16 06:53:56', '2025-01-16 06:53:56'),
(25, '121007', 1, '2025-01-16 06:54:00', '2025-01-16 06:54:00'),
(26, '121001', 1, '2025-01-16 07:14:44', '2025-01-16 07:14:44'),
(27, '121002', 1, '2025-01-16 07:14:48', '2025-01-16 07:14:48'),
(28, '121003', 1, '2025-01-16 07:14:51', '2025-01-16 07:14:51'),
(29, '121004', 1, '2025-01-16 07:14:55', '2025-01-16 07:14:55'),
(30, '121005', 1, '2025-01-16 07:14:59', '2025-01-16 07:14:59');

-- --------------------------------------------------------

--
-- Table structure for table `properties_images`
--

CREATE TABLE `properties_images` (
  `id` int NOT NULL,
  `property_id` int NOT NULL COMMENT 'properties.id',
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties_images`
--

INSERT INTO `properties_images` (`id`, `property_id`, `image`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'hotel_images/GEim25wVx0ybwEHgEn2tiWtOuuzbOfXPyMO8pm79.png', '2024-12-04 09:59:35', '2024-12-04 09:59:35', 1),
(2, 1, 'hotel_images/qSOQZ081Cw222W8hmnf8SsRo61U9YthrZ00w9mKo.png', '2024-12-04 09:59:35', '2024-12-04 09:59:35', 1),
(3, 1, 'hotel_images/pGSOBnkMqVMKsvLaWvToe25SZPgm2IJHiPSSmNBk.png', '2024-12-04 09:59:35', '2024-12-04 09:59:35', 1),
(4, 2, 'hotel_images/QsLmaAK2Xe6kkt6ywKNlZbxFYGQk0Ttis3IYKyw7.png', '2024-12-04 10:14:03', '2024-12-04 10:14:03', 1),
(5, 2, 'hotel_images/tFhfXkRlJxmPKN9ZH8CxFuVAcv3BOuSceOz9VFuU.jpg', '2024-12-04 10:14:03', '2024-12-04 10:14:03', 1),
(6, 2, 'hotel_images/1IskOHfDKFqiceJFKhiEPIWZvPIw9ntYm8TSP8iC.jpg', '2024-12-04 10:14:03', '2024-12-04 10:14:03', 1),
(7, 3, 'hotel_images/Yal1QNaegr5oqvmJmY7fH2VxlWPje5DkytNJ4pxA.jpg', '2024-12-04 10:28:49', '2024-12-04 10:28:49', 1),
(8, 3, 'hotel_images/zGbOGRud2TXzycDiNrQsLJSmb4UH0bP48f62OS4p.jpg', '2024-12-04 10:28:49', '2024-12-04 10:28:49', 1),
(9, 4, 'hotel_images/KvME3nL4AyKmWhjMdsxkOeRu0LSZ0P31V4Q13thq.jpg', '2024-12-04 10:37:16', '2024-12-04 10:37:16', 1),
(10, 4, 'hotel_images/WB2N7SPpgE56HMw8mS1AhC9XgP1UZyIeFxx5tSX9.jpg', '2024-12-04 10:37:16', '2024-12-04 10:37:16', 1),
(11, 5, 'hotel_images/NRGwoWQrhuDRL8IKZqrOTyL1sI4p267eM2f9s05c.jpg', '2024-12-04 10:41:34', '2024-12-04 10:41:34', 1),
(12, 5, 'hotel_images/YdNFjErD97LKvuOYTpSe8XBD2YYCdlqRp0Y8TWC4.jpg', '2024-12-04 10:41:34', '2024-12-04 10:41:34', 1),
(13, 6, 'hotel_images/9TNqX3S90hakWZ4xxwSHEyLhf18HOCgXMgdgfEkC.jpg', '2024-12-04 10:45:49', '2024-12-04 10:45:49', 1),
(14, 6, 'hotel_images/Ld14njAWvnLfR7IYAy49fhB11JJakcW1kmNOWofg.jpg', '2024-12-04 10:45:49', '2024-12-04 10:45:49', 1),
(15, 7, 'hotel_images/4VNsBbv7eskq1jTcl0NL8WkOCkdd0Rpenv6O6YfM.jpg', '2024-12-04 10:48:07', '2024-12-04 10:48:07', 1),
(16, 7, 'hotel_images/IvLakucE6DTT7HyL0dThY8ikXi9kEVq4C5I2moTd.jpg', '2024-12-04 10:48:07', '2024-12-04 10:48:07', 1),
(17, 8, 'hotel_images/6lyheDReNAEBUSCjehD5qtQycVZtmJOnlEsRdN2D.jpg', '2024-12-04 10:53:22', '2024-12-04 10:53:22', 1),
(18, 8, 'hotel_images/USNOvtGL23QYbsCW5Bhh1GAi8AQnEGLAK8p3C0YQ.jpg', '2024-12-04 10:53:22', '2024-12-04 10:53:22', 1),
(19, 9, 'hotel_images/tqY4emQiYSILgSKd1gzv0q3kYZd0DXOtQEDMjq7w.jpg', '2024-12-04 10:55:47', '2024-12-04 10:55:47', 1),
(20, 9, 'hotel_images/NlvdbyOAYm5UOe3Q80rokR3WIaDh9fDlrRSTDnth.jpg', '2024-12-04 10:55:47', '2024-12-04 10:55:47', 1),
(21, 10, 'hotel_images/CTNByJR1RTS1ddR4TS7pDZZdjQOYEW7hmtHQQzYA.jpg', '2024-12-04 11:01:22', '2024-12-04 11:01:22', 1),
(22, 10, 'hotel_images/dCxllJUk7i9UeYC9m7KeCUVnqKICjNVut18yiVec.jpg', '2024-12-04 11:01:22', '2024-12-04 11:01:22', 1),
(23, 11, 'hotel_images/lwgmcOZDEEQCHzFtwFj3YmOZDEGtPQcf7q90drYT.jpg', '2024-12-04 11:04:27', '2024-12-04 11:04:27', 1),
(24, 11, 'hotel_images/FyDpGEnW3nyWQxoeeqtnJ47mFbjJbkL6Shdz19ln.jpg', '2024-12-04 11:04:27', '2024-12-04 11:04:27', 1),
(25, 12, 'hotel_images/P4Ak8YLsJbfLARg1dK8Jc6WFX3cyz6ytwYAf4GL7.jpg', '2024-12-04 11:07:39', '2024-12-04 11:07:39', 1),
(26, 12, 'hotel_images/7ZKrM51CCJIFQ7cvf1WO6EFmewFkBFNYS0yGcWD4.jpg', '2024-12-04 11:07:39', '2024-12-04 11:07:39', 1),
(27, 13, 'hotel_images/Mv6tb5z2n0g4djyUpJTSyLXepaFCMYVXmfIOH5od.jpg', '2024-12-04 11:22:32', '2024-12-04 11:22:32', 1),
(28, 13, 'hotel_images/uoEJarFoeBYQWUwMVYQRZHz9t45qo4jZiAQpqpxa.jpg', '2024-12-04 11:22:32', '2024-12-04 11:22:32', 1),
(29, 14, 'hotel_images/vPATgJheUN7048B4P7iRX2Rj3Ex9LGMbLKlk4x3o.jpg', '2024-12-04 11:24:00', '2024-12-04 11:24:00', 1),
(30, 14, 'hotel_images/DWpu3PqXRE455TbQbMF6EmISQvlE93llTo2kkcLN.jpg', '2024-12-04 11:24:00', '2024-12-04 11:24:00', 1),
(31, 15, 'hotel_images/QVl7GAT9Ihkc0QBUAWVqhy5aiVrGqB5mZ2PgIyei.jpg', '2024-12-04 11:47:27', '2024-12-04 11:47:27', 1),
(32, 15, 'hotel_images/uwt9mabKkheKaCsvPuTYhDZNO8WEZRlq8etoPPH3.jpg', '2024-12-04 11:47:27', '2024-12-04 11:47:27', 1),
(33, 16, 'hotel_images/VihC2aA3o7yPxSdTHleTrz7mXjg7ufkTA1KcDtiu.jpg', '2024-12-04 11:58:07', '2024-12-04 11:58:07', 1),
(34, 16, 'hotel_images/lBbcsbZgdmCNxMAk12qkLraAySGfBsDjkiu4IqLD.jpg', '2024-12-04 11:58:07', '2024-12-04 11:58:07', 1),
(35, 17, 'hotel_images/H0L9x9UMtpK7VmzL6bJPzyMrnfuLV63MeQ9J0SFK.jpg', '2024-12-04 12:02:39', '2024-12-04 12:02:39', 1),
(36, 17, 'hotel_images/7cfFbn73s1yqPoIp2bqPDpqiRkOMzBesLX02bQ2Q.jpg', '2024-12-04 12:02:39', '2024-12-04 12:02:39', 1),
(37, 18, 'hotel_images/LaOvoNVCDRDKG1pgNIuhWHxTqeMmGZaBVbaf589r.jpg', '2024-12-04 12:06:41', '2024-12-04 12:06:41', 1),
(38, 18, 'hotel_images/DWamGFa0SRKJpiFFGNQHfpuLV7n38lxXvKOBw4oj.jpg', '2024-12-04 12:06:41', '2024-12-04 12:06:41', 1),
(39, 19, 'hotel_images/xGZj0WAJDyEBd5BtsZjKq7RPTEvZh51c78BCIFem.jpg', '2024-12-04 12:08:47', '2024-12-04 12:08:47', 1),
(40, 19, 'hotel_images/9q89nfTtkg8YgR0KSCuIRuUVrrWqcIJaY6O4G4kM.jpg', '2024-12-04 12:08:47', '2024-12-04 12:08:47', 1),
(41, 20, 'hotel_images/zVZVnoVmbRvJGu5xxlVxaVC8VmtFZOEPV22shFDm.jpg', '2024-12-04 12:10:09', '2024-12-04 12:10:09', 1),
(42, 20, 'hotel_images/81TzCb66thxLvG5vtWutV95kGHugo5tYj8x0Qbpu.jpg', '2024-12-04 12:10:09', '2024-12-04 12:10:09', 1),
(43, 21, 'hotel_images/uLg8fPspDzGf85Jodltoe8YGlpjsL1iNj2gogmpj.jpg', '2024-12-04 12:11:48', '2024-12-04 12:11:48', 1),
(44, 21, 'hotel_images/nOKNo1Oy86DB0jh6kXbJTG4zResld1iP9oWi4N48.jpg', '2024-12-04 12:11:48', '2024-12-04 12:11:48', 1),
(45, 22, 'hotel_images/RIt4GtOtrLsQemkXsKSo7V5qvKHTDth5Nar0Bnbh.jpg', '2024-12-04 12:19:08', '2024-12-04 12:19:08', 1),
(46, 22, 'hotel_images/JhyPfvblt6zosGEUCWxgaaxWxq6uFdPaNMTFVQTB.jpg', '2024-12-04 12:19:08', '2024-12-04 12:19:08', 1),
(47, 23, 'hotel_images/X5HWfXefbNxU1xxsWK07hTfyaxkrwnFm1MMXNkWz.jpg', '2024-12-05 05:36:49', '2024-12-05 05:36:49', 1),
(48, 22, 'hotel_images/Fn7kvSEuAHbba0P7XDi79KB9gtyfEFmevP5eHcvk.webp', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(49, 22, 'hotel_images/w6PqbBTobmEk7KhlAiUBXy6lT5lG2j46IWgfGlq3.webp', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(50, 22, 'hotel_images/SZy9E8sBMUfNCn2Q6di7L3d76MQZnDvOrVfcp1pn.webp', '2024-12-05 05:37:11', '2024-12-05 05:37:11', 1),
(51, 24, 'hotel_images/tMmfW97gqkH996fgsiooctVMAd5s9sHqkGmwA0DN.png', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(52, 24, 'hotel_images/gtUR16O5CJTOFpJFUgGvT5goiEj4SSSd95d1yZnq.png', '2024-12-06 08:43:40', '2024-12-06 08:43:40', 1),
(53, 25, 'hotel_images/aou9gqjTG1CdYnU5XIMtcfKeB2ivathsMZRFPBs6.png', '2024-12-06 09:41:31', '2024-12-06 09:41:31', 1),
(54, 25, 'hotel_images/35neNpsYgd5SIuAGuEP6TnuvDLNucg0dGtw395VX.png', '2024-12-06 09:41:31', '2024-12-06 09:41:31', 1),
(55, 25, 'hotel_images/coOKcdEzZoZVNGPJfRlIgZBN2hCP3aIYBDurrMBn.png', '2024-12-06 09:41:31', '2024-12-06 09:41:31', 1),
(56, 26, 'hotel_images/B5R202ZgvxSb2oLYAKgpzYhQ36xA0u4grGXF8qL0.png', '2024-12-11 07:53:56', '2024-12-11 07:53:56', 3),
(57, 26, 'hotel_images/ubA204A5WWvfMYdA7Nyk6UBAiPzZ77bHZ0Ro9Fgi.png', '2024-12-11 10:46:45', '2024-12-11 10:46:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_reviews`
--

CREATE TABLE `property_reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL COMMENT 'Reference to users.id',
  `booking_id` int DEFAULT NULL COMMENT 'tbl_booking.id',
  `review` text COLLATE utf8mb4_unicode_ci,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Rating out of 5',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1-Active, 2-Inactive, 3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_reviews`
--

INSERT INTO `property_reviews` (`id`, `user_id`, `booking_id`, `review`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 298, 34, NULL, '1', 1, '2025-07-29 09:33:12', '2025-07-29 09:33:12'),
(2, 298, 35, NULL, '5', 1, '2025-07-29 09:38:38', '2025-07-29 09:38:38'),
(3, 255, 39, NULL, '5', 1, '2025-07-29 10:59:54', '2025-07-29 10:59:54'),
(4, 255, 44, NULL, '5', 1, '2025-07-29 11:17:19', '2025-07-29 11:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint UNSIGNED NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_code`
--

CREATE TABLE `referral_code` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `user_type` tinyint NOT NULL COMMENT '1-Groomer,2-Customer',
  `code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referral_code`
--

INSERT INTO `referral_code` (`id`, `user_id`, `user_type`, `code`, `status`, `created_at`) VALUES
(1, 16, 2, '166734A27A163EE', 1, '2024-11-13 12:58:34'),
(2, 16, 2, '1667358F9C817F2', 1, '2024-11-14 05:50:20'),
(3, 19, 2, '196735E63A7D0BE', 1, '2024-11-14 11:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `refers`
--

CREATE TABLE `refers` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_type` tinyint NOT NULL DEFAULT '1' COMMENT '1-Flat,2-Percent',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_coupon_reused` tinyint NOT NULL DEFAULT '2' COMMENT '1-Yes,3-No',
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-InActive,3-Deleted',
  `is_used_coupon` tinyint NOT NULL DEFAULT '2' COMMENT '1-Used,2-Unused',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refers`
--

INSERT INTO `refers` (`id`, `coupon_code`, `code_type`, `value`, `is_coupon_reused`, `expiry_date`, `status`, `is_used_coupon`, `created_at`, `updated_at`) VALUES
(1, '881662', 1, '100', 2, NULL, 1, 2, '2024-11-13 09:51:27', '2024-11-13 10:00:27'),
(2, '9106212746069058', 1, '100', 1, '2024-11-23', 1, 2, '2024-11-13 10:05:42', '2024-11-13 10:05:42'),
(3, '8888038184290259', 1, '100', 2, NULL, 1, 2, '2024-11-13 10:07:34', '2024-11-13 10:07:34'),
(4, '4454917451421989', 1, '100', 2, NULL, 1, 2, '2024-11-21 10:21:09', '2024-11-21 10:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `refer_and_earn`
--

CREATE TABLE `refer_and_earn` (
  `id` int NOT NULL,
  `user_type` int NOT NULL COMMENT '1-Gromer Helper,2-Customer',
  `is_on` tinyint NOT NULL DEFAULT '2' COMMENT '1-Active,2-Inactive',
  `is_profit` tinyint NOT NULL DEFAULT '2' COMMENT '1-Active,2-Inactive',
  `billing_no` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refer_and_earn`
--

INSERT INTO `refer_and_earn` (`id`, `user_type`, `is_on`, `is_profit`, `billing_no`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 10, '2024-11-13 10:28:54', NULL),
(2, 2, 1, 1, 50, '2024-11-13 10:28:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, '2024-12-01 07:08:25', '2024-12-01 07:08:25'),
(2, 'Captain', 1, '2024-12-01 07:09:00', '2025-03-12 07:51:13'),
(3, 'User', 1, '2024-12-01 07:09:00', '2025-03-12 07:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `role_models`
--

CREATE TABLE `role_models` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int NOT NULL,
  `role_id` int NOT NULL COMMENT 'roles.id',
  `permission_id` int DEFAULT NULL COMMENT 'permission.id',
  `permission_status` tinyint NOT NULL DEFAULT '2' COMMENT '1-True,2-False',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `permission_status`, `created_at`, `status`) VALUES
(1, 3, 1, 1, '2024-12-06 08:03:45', 1),
(2, 3, 2, 1, '2024-12-06 08:03:45', 1),
(3, 3, 3, 1, '2024-12-06 08:03:45', 1),
(4, 3, 4, 2, '2024-12-06 08:03:45', 1),
(5, 3, 5, 1, '2024-12-06 08:03:45', 1),
(6, 2, 1, 2, '2024-12-09 13:43:10', 1),
(7, 2, 2, 2, '2024-12-09 13:43:10', 1),
(8, 2, 3, 2, '2024-12-09 13:43:10', 1),
(9, 2, 4, 2, '2024-12-09 13:43:10', 1),
(10, 2, 5, 2, '2024-12-09 13:43:10', 1),
(11, 2, 6, 1, '2024-12-09 13:43:10', 1),
(12, 2, 7, 1, '2024-12-09 13:43:10', 1),
(13, 2, 8, 1, '2024-12-09 13:43:10', 1),
(14, 2, 9, 1, '2024-12-09 13:43:10', 1),
(15, 4, 1, 1, '2024-12-10 07:27:34', 1),
(16, 4, 2, 2, '2024-12-10 07:27:34', 1),
(17, 4, 3, 2, '2024-12-10 07:27:34', 1),
(18, 4, 4, 2, '2024-12-10 07:27:34', 1),
(19, 4, 5, 2, '2024-12-10 07:27:34', 1),
(20, 4, 6, 2, '2024-12-10 07:27:34', 1),
(21, 4, 7, 2, '2024-12-10 07:27:34', 1),
(22, 4, 8, 2, '2024-12-10 07:27:34', 1),
(23, 4, 9, 2, '2024-12-10 07:27:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `route_logs`
--

CREATE TABLE `route_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `route_assign_id` int NOT NULL COMMENT 'assignroutes.id',
  `user_id` int NOT NULL COMMENT 'users.id',
  `route_id` int NOT NULL COMMENT 'routes.id',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Delete,4-Permanent Delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `route_logs`
--

INSERT INTO `route_logs` (`id`, `route_assign_id`, `user_id`, `route_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 2, 1, '2024-10-29 07:07:20', '2024-10-29 12:40:14', 1),
(2, 2, 6, 1, '2024-10-29 07:07:24', '2024-10-29 12:40:10', 1),
(3, 3, 9, 1, '2024-10-29 07:07:27', '2024-10-29 12:38:02', 1),
(4, 4, 9, 1, '2024-10-29 07:08:15', '2024-10-29 12:38:29', 1),
(5, 5, 2, 1, '2024-10-29 07:11:11', '2024-10-29 13:09:23', 1),
(6, 6, 2, 1, '2024-10-29 09:35:02', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` int UNSIGNED NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_robot` text COLLATE utf8mb4_unicode_ci,
  `header_script` text COLLATE utf8mb4_unicode_ci,
  `footer_script` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robot`, `header_script`, `footer_script`, `created_at`, `updated_at`, `status`) VALUES
(1, 'http://127.0.0.1:8000/seo/create', 'Seo title asdf', 'seo description', 'seo keyword', 'no index seo', 'seo header script', 'seo footer script', '2024-12-02 06:47:06', '2024-12-02 12:37:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_charge` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted,4-Permanent Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `service_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(2, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(4, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(5, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(6, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(7, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(8, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(9, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(10, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(11, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(12, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(13, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(14, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(15, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(16, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(17, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04'),
(18, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(19, 'Dosgs Service', 5555, 1, '2024-11-11 07:26:12', '2024-11-19 08:16:42'),
(20, 'Pat Service', 300, 1, '2024-11-11 07:26:12', '2024-11-11 07:26:12'),
(21, 'Dogs Service', 300, 1, '2024-11-11 07:26:12', '2024-11-13 06:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `complete_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `captain_id` int DEFAULT NULL COMMENT 'users.id',
  `vehicle_id` int DEFAULT NULL,
  `vehicle_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_kilo_meter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_extra_charges` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_seater` tinyint DEFAULT NULL,
  `trip_distance_km` decimal(8,2) DEFAULT NULL,
  `rate_per_km` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculated_fare` int DEFAULT NULL,
  `calculated_commision` int DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'unpaid' COMMENT '1-unpaid,2-paid,3-progress',
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `captain_distance_text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `captain_duration_text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_distance_text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_distance_value` int DEFAULT NULL,
  `trip_duration_text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trip_duration_value` int DEFAULT NULL,
  `current_lat` double NOT NULL,
  `current_lng` double NOT NULL,
  `current_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lat` double DEFAULT NULL,
  `drop_lng` double DEFAULT NULL,
  `drop_address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Post Booking,2-Accept Booking,3-Active Booking,4-complete Booking , 5-Cancel Booking',
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`id`, `user_id`, `captain_id`, `vehicle_id`, `vehicle_number`, `vehicle_title`, `vehicle_image`, `vehicle_kilo_meter`, `vehicle_extra_charges`, `vehicle_seater`, `trip_distance_km`, `rate_per_km`, `calculated_fare`, `calculated_commision`, `payment_status`, `discount`, `captain_distance_text`, `captain_duration_text`, `trip_distance_text`, `trip_distance_value`, `trip_duration_text`, `trip_duration_value`, `current_lat`, `current_lng`, `current_address`, `drop_lat`, `drop_lng`, `drop_address`, `booking_status`, `otp`, `created_at`, `updated_at`, `status`) VALUES
(1, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 1.50, '24', 42, 6, 'unpaid', '50.544', NULL, NULL, '1.5 km', NULL, '6 mins', NULL, 25.874922, 86.5913911, 'VHGR+4HX, Dharmashala Rd, Ward Number 22, Shardha Nagar, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '5782', '2025-07-28 07:05:23', '2025-07-28 07:05:23', 1),
(2, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 1.50, '24', 42, 6, 'unpaid', '50.544', NULL, NULL, '1.5 km', NULL, '6 mins', NULL, 25.874922, 86.5913911, 'VHGR+4HX, Dharmashala Rd, Ward Number 22, Shardha Nagar, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '2868', '2025-07-28 07:05:50', '2025-07-28 07:05:50', 1),
(3, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 1.50, '24', 42, 6, 'unpaid', '50.544', NULL, NULL, '1.5 km', NULL, '6 mins', NULL, 25.874922, 86.5913911, 'VHGR+4HX, Dharmashala Rd, Ward Number 22, Shardha Nagar, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '4655', '2025-07-28 07:06:12', '2025-07-28 07:06:12', 1),
(4, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 1.50, '24', 42, 6, 'unpaid', '50.544', NULL, NULL, '1.5 km', NULL, '6 mins', NULL, 25.874922, 86.5913911, 'VHGR+4HX, Dharmashala Rd, Ward Number 22, Shardha Nagar, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '3055', '2025-07-28 07:06:33', '2025-07-28 07:06:33', 1),
(5, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 1.50, '24', 42, 6, 'unpaid', '50.544', NULL, NULL, '1.5 km', NULL, '6 mins', NULL, 25.874922, 86.5913911, 'VHGR+4HX, Dharmashala Rd, Ward Number 22, Shardha Nagar, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '8310', '2025-07-28 07:07:17', '2025-07-28 07:07:17', 1),
(6, 258, 275, 1, '4786578333', 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 49.90, '12', 701, 102, 'unpaid', '840.72', NULL, NULL, '49.9 km', NULL, '1 hour 17 mins', NULL, 28.495801, 77.40205, 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', 28.7040592, 77.1024902, 'Delhi, India', 5, '4837', '2025-07-28 07:11:30', '2025-07-28 07:11:30', 1),
(7, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 3.80, '24', 107, 16, 'unpaid', '128.04', NULL, NULL, '3.8 km', NULL, '13 mins', NULL, 25.8940125, 86.5920156, 'VHVR+JR2, Police Line, Saharsa, Bihar 852202, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '7236', '2025-07-28 07:43:02', '2025-07-28 07:43:02', 1),
(8, 263, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 3.80, '24', 107, 16, 'unpaid', '128.04', NULL, NULL, '3.8 km', NULL, '13 mins', NULL, 25.8940125, 86.5920156, 'VHVR+JR2, Police Line, Saharsa, Bihar 852202, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '7602', '2025-07-28 07:44:42', '2025-07-28 07:44:42', 1),
(9, 263, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 3.80, '22', 98, 14, 'unpaid', '117.372', NULL, NULL, '3.8 km', NULL, '13 mins', NULL, 25.8940125, 86.5920156, 'VHVR+JR2, Police Line, Saharsa, Bihar 852202, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '8389', '2025-07-28 07:45:11', '2025-07-28 07:45:11', 1),
(10, 294, NULL, 1, NULL, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 182.00, '12', 2555, 371, 'unpaid', '3066.336', NULL, NULL, '182 km', NULL, '5 hours 1 min', NULL, 25.8979684, 86.5880148, '415, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 25.5940947, 85.1375645, 'Patna, Bihar, India', 1, '2730', '2025-07-28 17:06:53', '2025-07-28 17:06:53', 1),
(11, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 182.00, '24', 5111, 743, 'unpaid', '6132.672', NULL, NULL, '182 km', NULL, '5 hours 1 min', NULL, 25.8979684, 86.5880148, '415, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 25.5940947, 85.1375645, 'Patna, Bihar, India', 1, '5473', '2025-07-28 17:07:08', '2025-07-28 17:07:08', 1),
(12, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 182.00, '24', 5111, 743, 'unpaid', '6132.672', NULL, NULL, '182 km', NULL, '5 hours 1 min', NULL, 25.8979684, 86.5880148, '415, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 25.5940947, 85.1375645, 'Patna, Bihar, India', 1, '2223', '2025-07-28 17:07:11', '2025-07-28 17:07:11', 1),
(13, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 99.20, '24', 2786, 405, 'unpaid', '3342.648', NULL, NULL, '99.2 km', NULL, '2 hours 28 mins', NULL, 25.8979684, 86.5880148, '377, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 26.3379491, 86.0797199, 'Mangrauni, Bihar, India', 1, '5782', '2025-07-28 17:08:19', '2025-07-28 17:08:19', 1),
(14, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 4.40, '24', 124, 18, 'unpaid', '148.26', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '7480', '2025-07-28 17:08:30', '2025-07-28 17:08:30', 1),
(15, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 99.20, '24', 2786, 405, 'unpaid', '3342.648', NULL, NULL, '99.2 km', NULL, '2 hours 28 mins', NULL, 25.8979684, 86.5880148, '377, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 26.3379491, 86.0797199, 'Mangrauni, Bihar, India', 1, '6998', '2025-07-28 17:09:07', '2025-07-28 17:09:07', 1),
(16, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 4.40, '24', 124, 18, 'unpaid', '148.26', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '1476', '2025-07-28 17:09:15', '2025-07-28 17:09:15', 1),
(17, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 99.20, '24', 2786, 405, 'unpaid', '3342.648', NULL, NULL, '99.2 km', NULL, '2 hours 28 mins', NULL, 25.8979684, 86.5880148, '377, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 26.3379491, 86.0797199, 'Mangrauni, Bihar, India', 1, '4830', '2025-07-28 17:09:34', '2025-07-28 17:09:34', 1),
(18, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 99.50, '24', 2794, 406, 'unpaid', '3352.752', NULL, NULL, '99.5 km', NULL, '2 hours 30 mins', NULL, 25.8979684, 86.5880148, '377, Saraswati Nagar, Police Line, Saharsa, Bihar 852221, India', 26.1947281, 85.9181395, 'Darbhanga Airport, Aerodrome Darbhanga, Ranipur, Darbhanga, Bihar, India', 1, '2195', '2025-07-28 17:10:52', '2025-07-28 17:10:52', 1),
(19, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 101.00, '24', 2836, 412, 'unpaid', '3403.296', NULL, NULL, '101 km', NULL, '2 hours 30 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 26.1947281, 85.9181395, 'Darbhanga Airport, Aerodrome Darbhanga, Ranipur, Darbhanga, Bihar, India', 1, '8502', '2025-07-28 17:11:28', '2025-07-28 17:11:28', 1),
(20, 294, NULL, 1, NULL, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 101.00, '12', 1418, 206, 'unpaid', '1701.648', NULL, NULL, '101 km', NULL, '2 hours 30 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 26.1947281, 85.9181395, 'Darbhanga Airport, Aerodrome Darbhanga, Ranipur, Darbhanga, Bihar, India', 1, '1917', '2025-07-28 17:11:54', '2025-07-28 17:11:54', 1),
(21, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 101.00, '24', 2836, 412, 'unpaid', '3403.296', NULL, NULL, '101 km', NULL, '2 hours 30 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 26.1947281, 85.9181395, 'Darbhanga Airport, Aerodrome Darbhanga, Ranipur, Darbhanga, Bihar, India', 1, '8002', '2025-07-28 17:12:50', '2025-07-28 17:12:50', 1),
(22, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 4.40, '24', 124, 18, 'unpaid', '148.26', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '4343', '2025-07-28 17:17:14', '2025-07-28 17:17:14', 1),
(23, 294, NULL, 1, NULL, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 4.40, '12', 62, 9, 'unpaid', '74.136', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '2309', '2025-07-28 17:19:02', '2025-07-28 17:19:02', 1),
(24, 294, NULL, 1, NULL, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 4.40, '12', 62, 9, 'unpaid', '74.136', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '3858', '2025-07-28 17:20:20', '2025-07-28 17:20:20', 1),
(25, 294, NULL, 1, NULL, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 4.40, '12', 62, 9, 'unpaid', '74.136', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '5571', '2025-07-28 17:20:45', '2025-07-28 17:20:45', 1),
(26, 294, NULL, 1, NULL, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', 1, 4.40, '12', 62, 9, 'unpaid', '74.136', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '4877', '2025-07-28 17:22:21', '2025-07-28 17:22:21', 1),
(27, 294, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 4.40, '24', 124, 18, 'unpaid', '148.26', NULL, NULL, '4.4 km', NULL, '13 mins', NULL, 25.8970696, 86.5810039, 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '2909', '2025-07-28 17:23:39', '2025-07-28 17:23:39', 1),
(28, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 25.80, '24', 724, 105, 'unpaid', '869.352', NULL, NULL, '25.8 km', NULL, '55 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.8481463, 86.4128683, 'Agarwal Darwar Mangrauni, Mangrauni, Bihar, India', 1, '9010', '2025-07-29 09:13:31', '2025-07-29 09:13:31', 1),
(29, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 25.80, '24', 724, 105, 'unpaid', '869.352', NULL, NULL, '25.8 km', NULL, '55 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.8481463, 86.4128683, 'Agarwal Darwar Mangrauni, Mangrauni, Bihar, India', 1, '8485', '2025-07-29 09:13:49', '2025-07-29 09:13:49', 1),
(30, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 25.80, '22', 664, 96, 'unpaid', '796.908', NULL, NULL, '25.8 km', NULL, '55 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.8481463, 86.4128683, 'Agarwal Darwar Mangrauni, Mangrauni, Bihar, India', 1, '4377', '2025-07-29 09:14:58', '2025-07-29 09:14:58', 1),
(31, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 25.80, '24', 724, 105, 'unpaid', '869.352', NULL, NULL, '25.8 km', NULL, '55 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.8481463, 86.4128683, 'Agarwal Darwar Mangrauni, Mangrauni, Bihar, India', 1, '4724', '2025-07-29 09:17:14', '2025-07-29 09:17:14', 1),
(32, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 25.80, '24', 724, 105, 'unpaid', '869.352', NULL, NULL, '25.8 km', NULL, '55 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.8481463, 86.4128683, 'Agarwal Darwar Mangrauni, Mangrauni, Bihar, India', 1, '6865', '2025-07-29 09:17:57', '2025-07-29 09:17:57', 1),
(33, 298, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 54.50, '22', 1403, 204, 'unpaid', '1683.396', NULL, NULL, '54.5 km', NULL, '1 hour 27 mins', NULL, 28.495801, 77.40205, 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', 28.4594965, 77.0266383, 'Gurugram, Haryana, India', 1, '6958', '2025-07-29 09:28:46', '2025-07-29 09:28:46', 1),
(34, 298, 296, 2, 'DL7SCR8481', 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 54.50, '22', 1403, 204, 'success', '1683.396', NULL, NULL, '54.5 km', NULL, '1 hour 27 mins', NULL, 28.495801, 77.40205, 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', 28.4594965, 77.0266383, 'Gurugram, Haryana, India', 4, '5254', '2025-07-29 09:32:09', '2025-07-29 09:32:09', 1),
(35, 298, 296, 2, 'DL7SCR8481', 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 28.00, '22', 721, 105, 'success', '864.864', NULL, NULL, '28.0 km', NULL, '46 mins', NULL, 28.495801, 77.40205, 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', 28.5478897, 77.2031247, 'Hauz Khas, New Delhi, Delhi, India', 4, '8213', '2025-07-29 09:33:50', '2025-07-29 09:33:50', 1),
(36, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 25.80, '24', 724, 105, 'unpaid', '869.352', NULL, NULL, '25.8 km', NULL, '55 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.8481463, 86.4128683, 'Agarwal Darwar Mangrauni, Mangrauni, Bihar, India', 1, '8446', '2025-07-29 09:45:21', '2025-07-29 09:45:21', 1),
(37, 255, NULL, 3, NULL, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', 4, 215.00, '24', 6037, 877, 'unpaid', '7244.64', NULL, NULL, '215 km', NULL, '4 hours 51 mins', NULL, 25.8683155, 86.5829699, '241, Kahar, Shardha Nagar, Saharsa, Kahra, Bihar 852201, India', 25.5940947, 85.1375645, 'Patna, Bihar, India', 1, '5434', '2025-07-29 09:45:52', '2025-07-29 09:45:52', 1),
(38, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 3.30, '22', 85, 12, 'unpaid', '101.928', NULL, NULL, '3.3 km', NULL, '14 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 25.871105, 86.5808638, 'Karnacab Transport Service Office HO, near Shahid Raman Gas Godown, Shardha Nagar, Kahra, Bihar, India', 1, '5854', '2025-07-29 10:54:12', '2025-07-29 10:54:12', 1),
(39, 255, 250, 2, 'BR19T5876', 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 22.80, '22', 587, 85, 'success', '704.244', NULL, NULL, '22.8 km', NULL, '43 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 25.9239677, 86.7946387, 'Madhepura, Bihar, India', 4, '9799', '2025-07-29 10:57:58', '2025-07-29 10:57:58', 1),
(40, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 22.80, '22', 587, 85, 'unpaid', '704.244', NULL, NULL, '22.8 km', NULL, '43 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 25.9239677, 86.7946387, 'Madhepura, Bihar, India', 1, '7620', '2025-07-29 11:10:13', '2025-07-29 11:10:13', 1),
(41, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 22.80, '22', 587, 85, 'unpaid', '704.244', NULL, NULL, '22.8 km', NULL, '43 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 25.9239677, 86.7946387, 'Madhepura, Bihar, India', 1, '9175', '2025-07-29 11:13:19', '2025-07-29 11:13:19', 1),
(42, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 22.80, '22', 587, 85, 'unpaid', '704.244', NULL, NULL, '22.8 km', NULL, '43 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 25.9239677, 86.7946387, 'Madhepura, Bihar, India', 1, '1568', '2025-07-29 11:13:57', '2025-07-29 11:13:57', 1),
(43, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 22.80, '22', 587, 85, 'unpaid', '704.244', NULL, NULL, '22.8 km', NULL, '43 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 25.9239677, 86.7946387, 'Madhepura, Bihar, India', 1, '2028', '2025-07-29 11:14:35', '2025-07-29 11:14:35', 1),
(44, 255, 250, 2, 'BR19T5876', 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 90.90, '22', 2340, 340, 'success', '2807.724', NULL, NULL, '90.9 km', NULL, '2 hours 31 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 26.1542045, 85.8918454, 'Darbhanga, Bihar, India', 4, '2627', '2025-07-29 11:15:07', '2025-07-29 11:15:07', 1),
(45, 255, NULL, 2, NULL, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', 4, 90.90, '22', 2340, 340, 'unpaid', '2807.724', NULL, NULL, '90.9 km', NULL, '2 hours 31 mins', NULL, 25.8859512, 86.5985464, 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', 26.1542045, 85.8918454, 'Darbhanga, Bihar, India', 1, '3469', '2025-07-29 11:17:38', '2025-07-29 11:17:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_log`
--

CREATE TABLE `tbl_booking_log` (
  `id` int NOT NULL,
  `booking_id` int NOT NULL COMMENT 'tbl_booking.id',
  `user_id` int DEFAULT NULL COMMENT 'users.id',
  `captain_id` int DEFAULT NULL COMMENT 'users.id',
  `booking_type` tinyint NOT NULL DEFAULT '1' COMMENT '1-Post Booking,2-Accept Booking,3-Active Booking,4-complete Booking , 5-Cancel Booking',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking_log`
--

INSERT INTO `tbl_booking_log` (`id`, `booking_id`, `user_id`, `captain_id`, `booking_type`, `created_at`, `status`) VALUES
(1, 6, 258, 275, 1, '2025-07-28 07:11:31', 2),
(2, 6, 258, 275, 2, '2025-07-28 07:11:33', 2),
(3, 6, 258, NULL, 5, '2025-07-28 10:21:01', 1),
(4, 34, 298, 296, 1, '2025-07-29 09:32:10', 2),
(5, 34, 298, 296, 2, '2025-07-29 09:32:18', 2),
(6, 34, 298, 296, 3, '2025-07-29 09:32:39', 2),
(7, 34, 298, 296, 4, '2025-07-29 09:33:02', 1),
(8, 35, 298, 296, 1, '2025-07-29 09:33:50', 2),
(9, 35, 298, 296, 2, '2025-07-29 09:37:55', 2),
(10, 35, 298, 296, 3, '2025-07-29 09:38:20', 2),
(11, 35, 298, 296, 4, '2025-07-29 09:38:27', 1),
(12, 39, 255, 250, 1, '2025-07-29 10:57:59', 2),
(13, 39, 255, 250, 2, '2025-07-29 10:58:06', 2),
(14, 39, 255, 250, 3, '2025-07-29 10:58:22', 2),
(15, 39, 255, 250, 4, '2025-07-29 10:59:37', 1),
(16, 40, 255, 250, 1, '2025-07-29 11:10:14', 2),
(17, 41, 255, 250, 1, '2025-07-29 11:13:20', 2),
(18, 44, 255, 250, 1, '2025-07-29 11:15:08', 2),
(19, 44, 255, 250, 2, '2025-07-29 11:15:12', 2),
(20, 44, 255, 250, 3, '2025-07-29 11:15:38', 2),
(21, 44, 255, 250, 4, '2025-07-29 11:17:08', 1),
(22, 45, 255, 250, 1, '2025-07-29 11:17:39', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `id` int UNSIGNED NOT NULL,
  `state_id` int NOT NULL COMMENT 'tbl_state.id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_city`
--

INSERT INTO `tbl_city` (`id`, `state_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ghaziabad', 1, '2025-01-21 13:37:14', '2025-01-21 13:41:56'),
(2, 2, 'Nehru Vihar', 1, '2025-01-21 13:55:30', '2025-01-21 13:55:30'),
(3, 2, 'Gokalpuri', 1, '2025-01-21 14:04:02', '2025-01-21 14:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `id` int NOT NULL,
  `state_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`id`, `state_id`, `title`, `created_at`, `updated_at`, `status`) VALUES
(2, 2, 'Central Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(3, 2, 'East Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(4, 2, 'New Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(5, 2, 'North Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(6, 2, 'North East Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(7, 2, 'North West Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(8, 2, 'South Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(9, 2, 'South East Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(10, 2, 'South West Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(11, 2, 'West Delhi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(12, 1, 'Lucknow', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(13, 1, 'Kanpur Nagar', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(14, 1, 'Agra', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(15, 1, 'Varanasi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(16, 1, 'Ghaziabad', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(17, 1, 'Allahabad (Prayagraj)', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(18, 1, 'Gorakhpur', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(19, 1, 'Meerut', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(20, 4, 'Patna', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(21, 4, 'Gaya', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(22, 4, 'Muzaffarpur', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(23, 4, 'Bhagalpur', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(24, 4, 'Saharsa', '2025-07-15 11:20:09', '2025-07-15 13:37:03', 1),
(25, 5, 'Ranchi', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(26, 5, 'Dhanbad', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(27, 5, 'Jamshedpur (East Singhbhum)', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(28, 5, 'Hazaribagh', '2025-07-15 11:20:09', '2025-07-15 11:20:09', 1),
(29, 7, 'Gurgaon', '2025-07-15 11:20:09', '2025-07-15 14:13:32', 3),
(30, 7, 'Faridabad', '2025-07-15 11:20:09', '2025-07-15 14:13:23', 3),
(31, 7, 'Panipat', '2025-07-15 11:20:09', '2025-07-15 14:13:06', 3),
(32, 7, 'Ambala', '2025-07-15 11:20:09', '2025-07-15 14:12:11', 3),
(33, 7, 'Rohtak', '2025-07-15 11:20:09', '2025-07-15 14:10:43', 3),
(34, 4, 'Madhepura', '2025-07-21 16:21:56', '2025-07-21 16:21:56', 1),
(35, 4, 'Supaul', '2025-07-21 16:22:29', '2025-07-21 16:22:29', 1),
(36, 4, 'Darbhanga', '2025-07-21 16:22:58', '2025-07-21 16:22:58', 1),
(37, 4, 'Khagirya', '2025-07-21 16:23:32', '2025-07-21 16:23:32', 1),
(38, 4, 'Begusarai', '2025-07-21 16:23:41', '2025-07-21 16:23:41', 1),
(39, 4, 'Purnia', '2025-07-21 16:24:22', '2025-07-21 16:24:22', 1),
(40, 4, 'Samastipur', '2025-07-21 16:24:53', '2025-07-21 16:24:53', 1),
(41, 8, 'Sangrur', '2025-07-28 17:58:06', '2025-07-28 17:58:06', 1),
(42, 8, 'Ludhiana', '2025-07-28 17:58:29', '2025-07-28 17:58:29', 1),
(43, 8, 'Patiala', '2025-07-28 17:59:00', '2025-07-28 17:59:00', 1),
(44, 8, 'S.A.S Nagar Mohali', '2025-07-28 17:59:50', '2025-07-28 17:59:50', 1),
(45, 9, 'Chandigarh', '2025-07-28 18:01:31', '2025-07-28 18:01:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL COMMENT 'users.id',
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '1-Active,2-DeActive,3-Deleted,4-Permanent Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_logs`
--

INSERT INTO `tbl_logs` (`id`, `user_id`, `subject`, `data`, `created_at`, `updated_at`, `status`) VALUES
(1, 298, 'Deleted Captain', '{\"id\":298,\"role_id\":3,\"car_id\":null,\"name\":\"Sumit\",\"email\":null,\"image\":null,\"mobile_no\":\"8853887366\",\"gender\":null,\"aadhar_front_image\":null,\"aadhar_back_image\":null,\"aadhar_no\":null,\"pan_front_image\":null,\"pan_back_image\":null,\"pan_no\":null,\"state\":null,\"ride_state\":null,\"district\":null,\"ins_image\":null,\"ins_end_date\":null,\"vehicle_number\":null,\"pollution_image\":null,\"pollution_in_date\":null,\"cab_com_permit_date\":null,\"cab_com_permit\":null,\"is_duty\":2,\"is_booking_active\":2,\"ride_vehicle_type\":null,\"dob\":null,\"city\":null,\"town\":null,\"pincode\":null,\"address\":null,\"permanent_state\":null,\"permanent_city\":null,\"permanent_town\":null,\"permanent_pincode\":null,\"permanent_address\":null,\"vehicle_type\":null,\"vehicle_capicity\":null,\"registration_number\":null,\"service_expiry_date\":null,\"dl_number\":null,\"dl_validity\":null,\"dl_front_image\":null,\"dl_back_image\":null,\"rc_number\":null,\"rc_front_image\":null,\"rc_back_image\":null,\"ins_number\":null,\"police_verification\":null,\"password\":\"$2y$10$XmjWd1fTbD3lbPipZMIP4O0ja4vPgErlsae3hBSxRpUoW7k.wMrVe\",\"account_number\":null,\"ifsc_code\":null,\"bank_name\":null,\"wallet_amount\":0,\"reserve_amount\":0,\"withdraw_amount\":0,\"lat\":\"28.49576\",\"long\":\"77.4021574\",\"current_address\":\"A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India\",\"user_otp\":\"1234\",\"remember_token\":null,\"email_verified_at\":null,\"is_loggedin\":\"0\",\"created_at\":\"2025-07-29 14:51:03\",\"updated_at\":\"2025-07-29 15:08:31\",\"status\":1,\"fcm_token\":null,\"is_user_verified\":\"non-verified\"}', '2025-07-29 09:54:49', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int NOT NULL,
  `booking_id` int NOT NULL COMMENT 'tbl_pet_bookings.id',
  `user_id` int NOT NULL COMMENT 'users.id',
  `subject` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `booking_id`, `user_id`, `subject`, `description`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 158, 'New Booking', 'New Booking Created', '2025-06-13 12:28:53', '2025-06-13 12:28:53', 1),
(2, 1, 157, 'New Booking', 'New booking found ', '2025-06-13 12:28:53', '2025-06-13 12:28:53', 1),
(3, 1, 158, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-06-13 12:29:10', '2025-06-13 12:29:10', 1),
(4, 1, 157, 'Booking Accepted', 'You have accepted the booking of Fazlu Rehman', '2025-06-13 12:29:10', '2025-06-13 12:29:10', 1),
(5, 1, 158, 'Booking Activated', 'Your booking has been activated by Sarthak', '2025-06-13 12:29:24', '2025-06-13 12:29:24', 1),
(6, 1, 157, 'Booking Activated', 'You have activated the booking of Fazlu Rehman', '2025-06-13 12:29:24', '2025-06-13 12:29:24', 1),
(7, 1, 158, 'Booking Completed', 'Your booking has been completed by Sarthak', '2025-06-13 12:29:30', '2025-06-13 12:29:30', 1),
(8, 1, 157, 'Booking Completed', 'You have completed the booking of Fazlu Rehman', '2025-06-13 12:29:30', '2025-06-13 12:29:30', 1),
(9, 2, 160, 'New Booking', 'New Booking Created', '2025-06-13 12:41:49', '2025-06-13 12:41:49', 1),
(10, 2, 159, 'New Booking', 'New booking found ', '2025-06-13 12:41:49', '2025-06-13 12:41:49', 1),
(11, 2, 160, 'Booking Accepted', 'Your booking has been accepted by Sumit', '2025-06-13 12:42:34', '2025-06-13 12:42:34', 1),
(12, 2, 159, 'Booking Accepted', 'You have accepted the booking of Ujjwal', '2025-06-13 12:42:34', '2025-06-13 12:42:34', 1),
(13, 2, 160, 'Booking Activated', 'Your booking has been activated by Sumit', '2025-06-13 12:42:51', '2025-06-13 12:42:51', 1),
(14, 2, 159, 'Booking Activated', 'You have activated the booking of Ujjwal', '2025-06-13 12:42:51', '2025-06-13 12:42:51', 1),
(15, 2, 160, 'Booking Completed', 'Your booking has been completed by Sumit', '2025-06-13 12:43:21', '2025-06-13 12:43:21', 1),
(16, 2, 159, 'Booking Completed', 'You have completed the booking of Ujjwal', '2025-06-13 12:43:21', '2025-06-13 12:43:21', 1),
(17, 3, 160, 'New Booking', 'New Booking Created', '2025-06-13 12:46:16', '2025-06-13 12:46:16', 1),
(18, 3, 157, 'New Booking', 'New booking found ', '2025-06-13 12:46:16', '2025-06-13 12:46:16', 1),
(19, 3, 159, 'New Booking', 'New booking found ', '2025-06-13 12:46:17', '2025-06-13 12:46:17', 1),
(20, 3, 160, 'Booking Accepted', 'Your booking has been accepted by Sumit', '2025-06-13 12:46:30', '2025-06-13 12:46:30', 1),
(21, 3, 159, 'Booking Accepted', 'You have accepted the booking of Ujjwal', '2025-06-13 12:46:30', '2025-06-13 12:46:30', 1),
(22, 3, 160, 'Booking Activated', 'Your booking has been activated by Sumit', '2025-06-13 12:46:38', '2025-06-13 12:46:38', 1),
(23, 3, 159, 'Booking Activated', 'You have activated the booking of Ujjwal', '2025-06-13 12:46:38', '2025-06-13 12:46:38', 1),
(24, 3, 160, 'Booking Completed', 'Your booking has been completed by Sumit', '2025-06-13 12:47:13', '2025-06-13 12:47:13', 1),
(25, 3, 159, 'Booking Completed', 'You have completed the booking of Ujjwal', '2025-06-13 12:47:13', '2025-06-13 12:47:13', 1),
(26, 4, 160, 'New Booking', 'New Booking Created', '2025-06-13 12:50:33', '2025-06-13 12:50:33', 1),
(27, 4, 157, 'New Booking', 'New booking found ', '2025-06-13 12:50:33', '2025-06-13 12:50:33', 1),
(28, 4, 159, 'New Booking', 'New booking found ', '2025-06-13 12:50:33', '2025-06-13 12:50:33', 1),
(29, 5, 158, 'New Booking', 'New Booking Created', '2025-06-13 12:51:43', '2025-06-13 12:51:43', 1),
(30, 5, 157, 'New Booking', 'New booking found ', '2025-06-13 12:51:44', '2025-06-13 12:51:44', 1),
(31, 5, 159, 'New Booking', 'New booking found ', '2025-06-13 12:51:44', '2025-06-13 12:51:44', 1),
(32, 4, 160, 'Booking Accepted', 'Your booking has been accepted by Sumit', '2025-06-13 12:52:35', '2025-06-13 12:52:35', 1),
(33, 4, 159, 'Booking Accepted', 'You have accepted the booking of Ujjwal', '2025-06-13 12:52:35', '2025-06-13 12:52:35', 1),
(34, 4, 160, 'Booking Cancelled', 'Your booking has been cancelled by Sumit', '2025-06-13 12:52:42', '2025-06-13 12:52:42', 1),
(35, 4, 159, 'Booking Cancelled', 'You have cancelled the booking of Ujjwal', '2025-06-13 12:52:42', '2025-06-13 12:52:42', 1),
(36, 5, 158, 'Booking Accepted', 'Your booking has been accepted by Sumit', '2025-06-13 12:52:46', '2025-06-13 12:52:46', 1),
(37, 5, 159, 'Booking Accepted', 'You have accepted the booking of Fazlu Rehman', '2025-06-13 12:52:46', '2025-06-13 12:52:46', 1),
(38, 5, 158, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-06-13 12:53:42', '2025-06-13 12:53:42', 1),
(39, 6, 158, 'New Booking', 'New Booking Created', '2025-06-13 12:54:38', '2025-06-13 12:54:38', 1),
(40, 6, 157, 'New Booking', 'New booking found ', '2025-06-13 12:54:39', '2025-06-13 12:54:39', 1),
(41, 6, 159, 'New Booking', 'New booking found ', '2025-06-13 12:54:39', '2025-06-13 12:54:39', 1),
(42, 6, 158, 'Booking Accepted', 'Your booking has been accepted by Sumit', '2025-06-13 12:54:52', '2025-06-13 12:54:52', 1),
(43, 6, 159, 'Booking Accepted', 'You have accepted the booking of Fazlu Rehman', '2025-06-13 12:54:52', '2025-06-13 12:54:52', 1),
(44, 4, 160, 'Booking Cancelled', 'Your booking has been cancelled by Sarthak', '2025-06-13 12:54:55', '2025-06-13 12:54:55', 1),
(45, 4, 157, 'Booking Cancelled', 'You have cancelled the booking of Ujjwal', '2025-06-13 12:54:55', '2025-06-13 12:54:55', 1),
(46, 3, 160, 'Booking Cancelled', 'Your booking has been cancelled by Sarthak', '2025-06-13 12:54:58', '2025-06-13 12:54:58', 1),
(47, 3, 157, 'Booking Cancelled', 'You have cancelled the booking of Ujjwal', '2025-06-13 12:54:58', '2025-06-13 12:54:58', 1),
(48, 6, 158, 'Booking Cancelled', 'Your booking has been cancelled by Sarthak', '2025-06-13 12:55:09', '2025-06-13 12:55:09', 1),
(49, 6, 157, 'Booking Cancelled', 'You have cancelled the booking of Fazlu Rehman', '2025-06-13 12:55:09', '2025-06-13 12:55:09', 1),
(50, 7, 162, 'New Booking', 'New Booking Created', '2025-06-16 13:51:33', '2025-06-16 13:51:33', 1),
(51, 8, 162, 'New Booking', 'New Booking Created', '2025-06-28 17:00:37', '2025-06-28 17:00:37', 1),
(52, 9, 162, 'New Booking', 'New Booking Created', '2025-06-28 17:00:48', '2025-06-28 17:00:48', 1),
(53, 10, 158, 'New Booking', 'New Booking Created', '2025-07-08 10:28:22', '2025-07-08 10:28:22', 1),
(54, 11, 158, 'New Booking', 'New Booking Created', '2025-07-08 10:29:01', '2025-07-08 10:29:01', 1),
(55, 12, 158, 'New Booking', 'New Booking Created', '2025-07-08 10:31:10', '2025-07-08 10:31:10', 1),
(56, 1, 165, 'New Booking', 'New Booking Created', '2025-07-09 05:36:05', '2025-07-09 05:36:05', 1),
(57, 2, 165, 'New Booking', 'New Booking Created', '2025-07-09 05:59:35', '2025-07-09 05:59:35', 1),
(58, 3, 165, 'New Booking', 'New Booking Created', '2025-07-09 06:10:08', '2025-07-09 06:10:08', 1),
(59, 4, 165, 'New Booking', 'New Booking Created', '2025-07-09 07:01:01', '2025-07-09 07:01:01', 1),
(60, 4, 168, 'New Booking', 'New booking found ', '2025-07-09 07:01:01', '2025-07-09 07:01:01', 1),
(61, 4, 166, 'New Booking', 'New booking found ', '2025-07-09 07:01:02', '2025-07-09 07:01:02', 1),
(62, 4, 165, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-09 07:03:10', '2025-07-09 07:03:10', 1),
(63, 4, 168, 'Booking Accepted', 'You have accepted the booking of Fazlu', '2025-07-09 07:03:10', '2025-07-09 07:03:10', 1),
(64, 4, 165, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-09 07:04:00', '2025-07-09 07:04:00', 1),
(65, 4, 168, 'Booking Cancelled', 'You have cancelled the booking of Fazlu', '2025-07-09 07:04:00', '2025-07-09 07:04:00', 1),
(66, 5, 165, 'New Booking', 'New Booking Created', '2025-07-09 07:04:28', '2025-07-09 07:04:28', 1),
(67, 5, 166, 'New Booking', 'New booking found ', '2025-07-09 07:04:29', '2025-07-09 07:04:29', 1),
(68, 5, 168, 'New Booking', 'New booking found ', '2025-07-09 07:04:29', '2025-07-09 07:04:29', 1),
(69, 5, 165, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-09 07:04:54', '2025-07-09 07:04:54', 1),
(70, 5, 168, 'Booking Accepted', 'You have accepted the booking of Fazlu', '2025-07-09 07:04:54', '2025-07-09 07:04:54', 1),
(71, 5, 165, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-09 07:05:52', '2025-07-09 07:05:52', 1),
(72, 5, 168, 'Booking Activated', 'You have activated the booking of Fazlu', '2025-07-09 07:05:52', '2025-07-09 07:05:52', 1),
(73, 5, 165, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-09 07:06:38', '2025-07-09 07:06:38', 1),
(74, 5, 168, 'Booking Completed', 'You have completed the booking of Fazlu', '2025-07-09 07:06:38', '2025-07-09 07:06:38', 1),
(75, 6, 165, 'New Booking', 'New Booking Created', '2025-07-09 07:07:32', '2025-07-09 07:07:32', 1),
(76, 6, 166, 'New Booking', 'New booking found ', '2025-07-09 07:07:33', '2025-07-09 07:07:33', 1),
(77, 6, 168, 'New Booking', 'New booking found ', '2025-07-09 07:07:33', '2025-07-09 07:07:33', 1),
(78, 7, 165, 'New Booking', 'New Booking Created', '2025-07-09 07:08:25', '2025-07-09 07:08:25', 1),
(79, 7, 166, 'New Booking', 'New booking found ', '2025-07-09 07:08:25', '2025-07-09 07:08:25', 1),
(80, 7, 168, 'New Booking', 'New booking found ', '2025-07-09 07:08:25', '2025-07-09 07:08:25', 1),
(81, 6, 165, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-09 07:08:38', '2025-07-09 07:08:38', 1),
(82, 6, 168, 'Booking Accepted', 'You have accepted the booking of Fazlu', '2025-07-09 07:08:38', '2025-07-09 07:08:38', 1),
(83, 7, 165, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-09 07:09:24', '2025-07-09 07:09:24', 1),
(84, 7, 168, 'Booking Accepted', 'You have accepted the booking of Fazlu', '2025-07-09 07:09:24', '2025-07-09 07:09:24', 1),
(85, 6, 165, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-09 07:10:04', '2025-07-09 07:10:04', 1),
(86, 7, 165, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-09 07:10:07', '2025-07-09 07:10:07', 1),
(87, 7, 168, 'Booking Cancelled', 'You have cancelled the booking of Fazlu', '2025-07-09 07:10:07', '2025-07-09 07:10:07', 1),
(88, 8, 165, 'New Booking', 'New Booking Created', '2025-07-09 07:10:29', '2025-07-09 07:10:29', 1),
(89, 8, 168, 'New Booking', 'New booking found ', '2025-07-09 07:10:29', '2025-07-09 07:10:29', 1),
(90, 8, 166, 'New Booking', 'New booking found ', '2025-07-09 07:10:30', '2025-07-09 07:10:30', 1),
(91, 8, 165, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-09 07:10:43', '2025-07-09 07:10:43', 1),
(92, 8, 168, 'Booking Accepted', 'You have accepted the booking of Fazlu', '2025-07-09 07:10:43', '2025-07-09 07:10:43', 1),
(93, 8, 165, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-09 07:11:26', '2025-07-09 07:11:26', 1),
(94, 8, 168, 'Booking Cancelled', 'You have cancelled the booking of Fazlu', '2025-07-09 07:11:26', '2025-07-09 07:11:26', 1),
(95, 1, 174, 'New Booking', 'New Booking Created', '2025-07-09 11:16:08', '2025-07-09 11:16:08', 1),
(96, 2, 174, 'New Booking', 'New Booking Created', '2025-07-09 11:17:14', '2025-07-09 11:17:14', 1),
(97, 3, 174, 'New Booking', 'New Booking Created', '2025-07-09 11:38:28', '2025-07-09 11:38:28', 1),
(98, 3, 173, 'New Booking', 'New booking found ', '2025-07-09 11:38:28', '2025-07-09 11:38:28', 1),
(99, 3, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-09 11:39:26', '2025-07-09 11:39:26', 1),
(100, 3, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-09 11:39:26', '2025-07-09 11:39:26', 1),
(101, 3, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-09 11:40:48', '2025-07-09 11:40:48', 1),
(102, 3, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-09 11:40:48', '2025-07-09 11:40:48', 1),
(103, 3, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-09 11:42:05', '2025-07-09 11:42:05', 1),
(104, 3, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-09 11:42:05', '2025-07-09 11:42:05', 1),
(105, 4, 174, 'New Booking', 'New Booking Created', '2025-07-09 11:49:30', '2025-07-09 11:49:30', 1),
(106, 4, 173, 'New Booking', 'New booking found ', '2025-07-09 11:49:30', '2025-07-09 11:49:30', 1),
(107, 4, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-09 11:49:45', '2025-07-09 11:49:45', 1),
(108, 4, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-09 11:49:45', '2025-07-09 11:49:45', 1),
(109, 4, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-09 11:50:05', '2025-07-09 11:50:05', 1),
(110, 4, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-09 11:50:05', '2025-07-09 11:50:05', 1),
(111, 4, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-09 11:50:13', '2025-07-09 11:50:13', 1),
(112, 4, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-09 11:50:13', '2025-07-09 11:50:13', 1),
(113, 5, 174, 'New Booking', 'New Booking Created', '2025-07-09 11:52:15', '2025-07-09 11:52:15', 1),
(114, 5, 173, 'New Booking', 'New booking found ', '2025-07-09 11:52:16', '2025-07-09 11:52:16', 1),
(115, 6, 174, 'New Booking', 'New Booking Created', '2025-07-09 11:52:16', '2025-07-09 11:52:16', 1),
(116, 6, 173, 'New Booking', 'New booking found ', '2025-07-09 11:52:17', '2025-07-09 11:52:17', 1),
(117, 5, 174, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-09 11:54:11', '2025-07-09 11:54:11', 1),
(118, 5, 173, 'Booking Cancelled', 'You have cancelled the booking of Sarthak', '2025-07-09 11:54:11', '2025-07-09 11:54:11', 1),
(119, 6, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-09 11:54:22', '2025-07-09 11:54:22', 1),
(120, 6, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-09 11:54:22', '2025-07-09 11:54:22', 1),
(121, 6, 174, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-09 11:54:41', '2025-07-09 11:54:41', 1),
(122, 6, 173, 'Booking Cancelled', 'You have cancelled the booking of Sarthak', '2025-07-09 11:54:41', '2025-07-09 11:54:41', 1),
(123, 7, 174, 'New Booking', 'New Booking Created', '2025-07-09 12:04:19', '2025-07-09 12:04:19', 1),
(124, 7, 173, 'New Booking', 'New booking found ', '2025-07-09 12:04:20', '2025-07-09 12:04:20', 1),
(125, 7, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-09 12:04:26', '2025-07-09 12:04:26', 1),
(126, 7, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-09 12:04:26', '2025-07-09 12:04:26', 1),
(127, 7, 174, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-09 12:46:46', '2025-07-09 12:46:46', 1),
(128, 8, 174, 'New Booking', 'New Booking Created', '2025-07-09 12:47:16', '2025-07-09 12:47:16', 1),
(129, 8, 173, 'New Booking', 'New booking found ', '2025-07-09 12:47:17', '2025-07-09 12:47:17', 1),
(130, 8, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-09 12:47:34', '2025-07-09 12:47:34', 1),
(131, 8, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-09 12:47:34', '2025-07-09 12:47:34', 1),
(132, 8, 174, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-09 13:17:53', '2025-07-09 13:17:53', 1),
(133, 9, 174, 'New Booking', 'New Booking Created', '2025-07-09 13:24:23', '2025-07-09 13:24:23', 1),
(134, 9, 173, 'New Booking', 'New booking found ', '2025-07-09 13:24:23', '2025-07-09 13:24:23', 1),
(135, 9, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-09 13:30:52', '2025-07-09 13:30:52', 1),
(136, 9, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-09 13:30:52', '2025-07-09 13:30:52', 1),
(137, 9, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-09 13:31:44', '2025-07-09 13:31:44', 1),
(138, 9, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-09 13:31:44', '2025-07-09 13:31:44', 1),
(139, 9, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-09 13:32:29', '2025-07-09 13:32:29', 1),
(140, 9, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-09 13:32:29', '2025-07-09 13:32:29', 1),
(141, 10, 174, 'New Booking', 'New Booking Created', '2025-07-10 05:21:24', '2025-07-10 05:21:24', 1),
(142, 11, 174, 'New Booking', 'New Booking Created', '2025-07-10 05:22:19', '2025-07-10 05:22:19', 1),
(143, 12, 174, 'New Booking', 'New Booking Created', '2025-07-10 05:24:05', '2025-07-10 05:24:05', 1),
(144, 13, 174, 'New Booking', 'New Booking Created', '2025-07-10 05:40:28', '2025-07-10 05:40:28', 1),
(145, 14, 174, 'New Booking', 'New Booking Created', '2025-07-10 07:07:04', '2025-07-10 07:07:04', 1),
(146, 15, 174, 'New Booking', 'New Booking Created', '2025-07-10 07:10:15', '2025-07-10 07:10:15', 1),
(147, 16, 174, 'New Booking', 'New Booking Created', '2025-07-10 07:57:28', '2025-07-10 07:57:28', 1),
(148, 17, 174, 'New Booking', 'New Booking Created', '2025-07-10 08:00:17', '2025-07-10 08:00:17', 1),
(149, 18, 174, 'New Booking', 'New Booking Created', '2025-07-10 08:02:10', '2025-07-10 08:02:10', 1),
(150, 18, 173, 'New Booking', 'New booking found ', '2025-07-10 08:02:10', '2025-07-10 08:02:10', 1),
(151, 18, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-10 08:03:31', '2025-07-10 08:03:31', 1),
(152, 18, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-10 08:03:31', '2025-07-10 08:03:31', 1),
(153, 18, 174, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-10 08:03:56', '2025-07-10 08:03:56', 1),
(154, 19, 174, 'New Booking', 'New Booking Created', '2025-07-10 10:52:15', '2025-07-10 10:52:15', 1),
(155, 19, 173, 'New Booking', 'New booking found ', '2025-07-10 10:52:16', '2025-07-10 10:52:16', 1),
(156, 19, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-10 10:52:51', '2025-07-10 10:52:51', 1),
(157, 19, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-10 10:52:51', '2025-07-10 10:52:51', 1),
(158, 19, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-10 12:12:56', '2025-07-10 12:12:56', 1),
(159, 19, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-10 12:12:56', '2025-07-10 12:12:56', 1),
(160, 19, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-10 12:13:15', '2025-07-10 12:13:15', 1),
(161, 19, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-10 12:13:15', '2025-07-10 12:13:15', 1),
(162, 20, 174, 'New Booking', 'New Booking Created', '2025-07-10 12:51:53', '2025-07-10 12:51:53', 1),
(163, 21, 174, 'New Booking', 'New Booking Created', '2025-07-10 13:00:21', '2025-07-10 13:00:21', 1),
(164, 22, 174, 'New Booking', 'New Booking Created', '2025-07-10 13:02:11', '2025-07-10 13:02:11', 1),
(165, 23, 174, 'New Booking', 'New Booking Created', '2025-07-10 13:24:15', '2025-07-10 13:24:15', 1),
(166, 24, 174, 'New Booking', 'New Booking Created', '2025-07-10 13:25:21', '2025-07-10 13:25:21', 1),
(167, 24, 173, 'New Booking', 'New booking found ', '2025-07-10 13:25:21', '2025-07-10 13:25:21', 1),
(168, 24, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-10 13:25:42', '2025-07-10 13:25:42', 1),
(169, 24, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-10 13:25:42', '2025-07-10 13:25:42', 1),
(170, 24, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-10 13:45:28', '2025-07-10 13:45:28', 1),
(171, 24, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-10 13:45:28', '2025-07-10 13:45:28', 1),
(172, 24, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-10 18:36:54', '2025-07-10 18:36:54', 1),
(173, 24, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-10 18:36:54', '2025-07-10 18:36:54', 1),
(174, 25, 175, 'New Booking', 'New Booking Created', '2025-07-10 18:59:57', '2025-07-10 18:59:57', 1),
(175, 26, 175, 'New Booking', 'New Booking Created', '2025-07-10 19:00:25', '2025-07-10 19:00:25', 1),
(176, 26, 173, 'New Booking', 'New booking found ', '2025-07-10 19:00:26', '2025-07-10 19:00:26', 1),
(177, 26, 175, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-10 19:01:41', '2025-07-10 19:01:41', 1),
(178, 26, 173, 'Booking Cancelled', 'You have cancelled the booking of Aman kumar', '2025-07-10 19:01:41', '2025-07-10 19:01:41', 1),
(179, 27, 175, 'New Booking', 'New Booking Created', '2025-07-10 19:04:51', '2025-07-10 19:04:51', 1),
(180, 27, 173, 'New Booking', 'New booking found ', '2025-07-10 19:04:52', '2025-07-10 19:04:52', 1),
(181, 27, 175, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-10 19:05:06', '2025-07-10 19:05:06', 1),
(182, 27, 173, 'Booking Accepted', 'You have accepted the booking of Aman kumar', '2025-07-10 19:05:06', '2025-07-10 19:05:06', 1),
(183, 27, 175, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-10 19:05:20', '2025-07-10 19:05:20', 1),
(184, 27, 173, 'Booking Activated', 'You have activated the booking of Aman kumar', '2025-07-10 19:05:20', '2025-07-10 19:05:20', 1),
(185, 27, 175, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-10 19:06:32', '2025-07-10 19:06:32', 1),
(186, 27, 173, 'Booking Completed', 'You have completed the booking of Aman kumar', '2025-07-10 19:06:32', '2025-07-10 19:06:32', 1),
(187, 28, 176, 'New Booking', 'New Booking Created', '2025-07-11 03:04:53', '2025-07-11 03:04:53', 1),
(188, 28, 173, 'New Booking', 'New booking found ', '2025-07-11 03:04:53', '2025-07-11 03:04:53', 1),
(189, 28, 176, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-11 03:05:07', '2025-07-11 03:05:07', 1),
(190, 28, 173, 'Booking Accepted', 'You have accepted the booking of Pradeep Kumar', '2025-07-11 03:05:07', '2025-07-11 03:05:07', 1),
(191, 28, 176, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-11 03:05:50', '2025-07-11 03:05:50', 1),
(192, 28, 173, 'Booking Activated', 'You have activated the booking of Pradeep Kumar', '2025-07-11 03:05:50', '2025-07-11 03:05:50', 1),
(193, 28, 176, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-11 03:07:34', '2025-07-11 03:07:34', 1),
(194, 28, 173, 'Booking Completed', 'You have completed the booking of Pradeep Kumar', '2025-07-11 03:07:34', '2025-07-11 03:07:34', 1),
(195, 29, 176, 'New Booking', 'New Booking Created', '2025-07-11 03:09:36', '2025-07-11 03:09:36', 1),
(196, 29, 173, 'New Booking', 'New booking found ', '2025-07-11 03:09:36', '2025-07-11 03:09:36', 1),
(197, 29, 176, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-11 03:09:55', '2025-07-11 03:09:55', 1),
(198, 29, 173, 'Booking Accepted', 'You have accepted the booking of Pradeep Kumar', '2025-07-11 03:09:55', '2025-07-11 03:09:55', 1),
(199, 29, 176, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-11 03:11:00', '2025-07-11 03:11:00', 1),
(200, 30, 176, 'New Booking', 'New Booking Created', '2025-07-11 03:14:41', '2025-07-11 03:14:41', 1),
(201, 31, 176, 'New Booking', 'New Booking Created', '2025-07-11 03:15:02', '2025-07-11 03:15:02', 1),
(202, 32, 174, 'New Booking', 'New Booking Created', '2025-07-11 05:18:17', '2025-07-11 05:18:17', 1),
(203, 32, 173, 'New Booking', 'New booking found ', '2025-07-11 05:18:18', '2025-07-11 05:18:18', 1),
(204, 32, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-11 05:29:46', '2025-07-11 05:29:46', 1),
(205, 32, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-11 05:29:46', '2025-07-11 05:29:46', 1),
(206, 32, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-11 05:30:51', '2025-07-11 05:30:51', 1),
(207, 32, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-11 05:30:51', '2025-07-11 05:30:51', 1),
(208, 32, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-11 05:41:19', '2025-07-11 05:41:19', 1),
(209, 32, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-11 05:41:19', '2025-07-11 05:41:19', 1),
(210, 33, 174, 'New Booking', 'New Booking Created', '2025-07-11 05:41:50', '2025-07-11 05:41:50', 1),
(211, 33, 173, 'New Booking', 'New booking found ', '2025-07-11 05:41:51', '2025-07-11 05:41:51', 1),
(212, 33, 174, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-11 05:41:56', '2025-07-11 05:41:56', 1),
(213, 33, 173, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-11 05:41:56', '2025-07-11 05:41:56', 1),
(214, 33, 174, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-11 05:48:07', '2025-07-11 05:48:07', 1),
(215, 33, 173, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-11 05:48:07', '2025-07-11 05:48:07', 1),
(216, 33, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-11 06:55:28', '2025-07-11 06:55:28', 1),
(217, 33, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-11 06:55:28', '2025-07-11 06:55:28', 1),
(218, 33, 174, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-11 07:13:39', '2025-07-11 07:13:39', 1),
(219, 33, 173, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-11 07:13:39', '2025-07-11 07:13:39', 1),
(220, 34, 177, 'New Booking', 'New Booking Created', '2025-07-11 07:32:32', '2025-07-11 07:32:32', 1),
(221, 34, 173, 'New Booking', 'New booking found ', '2025-07-11 07:32:32', '2025-07-11 07:32:32', 1),
(222, 34, 177, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-11 07:33:25', '2025-07-11 07:33:25', 1),
(223, 34, 173, 'Booking Accepted', 'You have accepted the booking of Abhi chadha', '2025-07-11 07:33:25', '2025-07-11 07:33:25', 1),
(224, 34, 177, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-11 07:34:11', '2025-07-11 07:34:11', 1),
(225, 34, 173, 'Booking Activated', 'You have activated the booking of Abhi chadha', '2025-07-11 07:34:11', '2025-07-11 07:34:11', 1),
(226, 34, 177, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-11 07:34:42', '2025-07-11 07:34:42', 1),
(227, 34, 173, 'Booking Completed', 'You have completed the booking of Abhi chadha', '2025-07-11 07:34:42', '2025-07-11 07:34:42', 1),
(228, 35, 177, 'New Booking', 'New Booking Created', '2025-07-11 08:05:11', '2025-07-11 08:05:11', 1),
(229, 35, 178, 'New Booking', 'New booking found ', '2025-07-11 08:05:12', '2025-07-11 08:05:12', 1),
(230, 35, 173, 'New Booking', 'New booking found ', '2025-07-11 08:05:12', '2025-07-11 08:05:12', 1),
(231, 35, 177, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-11 08:05:40', '2025-07-11 08:05:40', 1),
(232, 35, 178, 'Booking Cancelled', 'You have cancelled the booking of Abhi chadha', '2025-07-11 08:05:40', '2025-07-11 08:05:40', 1),
(233, 36, 177, 'New Booking', 'New Booking Created', '2025-07-11 08:07:10', '2025-07-11 08:07:10', 1),
(234, 36, 178, 'New Booking', 'New booking found ', '2025-07-11 08:07:10', '2025-07-11 08:07:10', 1),
(235, 36, 173, 'New Booking', 'New booking found ', '2025-07-11 08:07:10', '2025-07-11 08:07:10', 1),
(236, 36, 177, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-11 08:07:26', '2025-07-11 08:07:26', 1),
(237, 36, 178, 'Booking Accepted', 'You have accepted the booking of Abhi chadha', '2025-07-11 08:07:26', '2025-07-11 08:07:26', 1),
(238, 36, 177, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-11 08:07:41', '2025-07-11 08:07:41', 1),
(239, 36, 178, 'Booking Activated', 'You have activated the booking of Abhi chadha', '2025-07-11 08:07:41', '2025-07-11 08:07:41', 1),
(240, 36, 177, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-11 08:08:03', '2025-07-11 08:08:03', 1),
(241, 36, 178, 'Booking Completed', 'You have completed the booking of Abhi chadha', '2025-07-11 08:08:03', '2025-07-11 08:08:03', 1),
(242, 35, 177, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-11 09:01:40', '2025-07-11 09:01:40', 1),
(243, 35, 173, 'Booking Cancelled', 'You have cancelled the booking of Abhi chadha', '2025-07-11 09:01:40', '2025-07-11 09:01:40', 1),
(244, 36, 177, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-11 09:01:59', '2025-07-11 09:01:59', 1),
(245, 36, 173, 'Booking Cancelled', 'You have cancelled the booking of Abhi chadha', '2025-07-11 09:01:59', '2025-07-11 09:01:59', 1),
(246, 1, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:25:31', '2025-07-11 09:25:31', 1),
(247, 1, 181, 'New Booking', 'New booking found ', '2025-07-11 09:25:31', '2025-07-11 09:25:31', 1),
(248, 1, 180, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-07-11 09:26:17', '2025-07-11 09:26:17', 1),
(249, 1, 181, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-11 09:26:17', '2025-07-11 09:26:17', 1),
(250, 1, 180, 'Booking Activated', 'Your booking has been activated by Sarthak', '2025-07-11 09:26:56', '2025-07-11 09:26:56', 1),
(251, 1, 181, 'Booking Activated', 'You have activated the booking of Sumit', '2025-07-11 09:26:56', '2025-07-11 09:26:56', 1),
(252, 1, 180, 'Booking Completed', 'Your booking has been completed by Sarthak', '2025-07-11 09:28:29', '2025-07-11 09:28:29', 1),
(253, 1, 181, 'Booking Completed', 'You have completed the booking of Sumit', '2025-07-11 09:28:29', '2025-07-11 09:28:29', 1),
(254, 2, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:44:21', '2025-07-11 09:44:21', 1),
(255, 2, 181, 'New Booking', 'New booking found ', '2025-07-11 09:44:21', '2025-07-11 09:44:21', 1),
(256, 2, 180, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-07-11 09:44:57', '2025-07-11 09:44:57', 1),
(257, 2, 181, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-11 09:44:57', '2025-07-11 09:44:57', 1),
(258, 2, 180, 'Booking Activated', 'Your booking has been activated by Sarthak', '2025-07-11 09:45:05', '2025-07-11 09:45:05', 1),
(259, 2, 181, 'Booking Activated', 'You have activated the booking of Sumit', '2025-07-11 09:45:05', '2025-07-11 09:45:05', 1),
(260, 2, 180, 'Booking Completed', 'Your booking has been completed by Sarthak', '2025-07-11 09:45:08', '2025-07-11 09:45:08', 1),
(261, 2, 181, 'Booking Completed', 'You have completed the booking of Sumit', '2025-07-11 09:45:08', '2025-07-11 09:45:08', 1),
(262, 3, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:46:00', '2025-07-11 09:46:00', 1),
(263, 3, 181, 'New Booking', 'New booking found ', '2025-07-11 09:46:00', '2025-07-11 09:46:00', 1),
(264, 3, 180, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-07-11 09:47:08', '2025-07-11 09:47:08', 1),
(265, 3, 181, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-11 09:47:08', '2025-07-11 09:47:08', 1),
(266, 3, 180, 'Booking Activated', 'Your booking has been activated by Sarthak', '2025-07-11 09:48:15', '2025-07-11 09:48:15', 1),
(267, 3, 181, 'Booking Activated', 'You have activated the booking of Sumit', '2025-07-11 09:48:15', '2025-07-11 09:48:15', 1),
(268, 3, 180, 'Booking Completed', 'Your booking has been completed by Sarthak', '2025-07-11 09:49:23', '2025-07-11 09:49:23', 1),
(269, 3, 181, 'Booking Completed', 'You have completed the booking of Sumit', '2025-07-11 09:49:23', '2025-07-11 09:49:23', 1),
(270, 4, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:49:59', '2025-07-11 09:49:59', 1),
(271, 4, 181, 'New Booking', 'New booking found ', '2025-07-11 09:49:59', '2025-07-11 09:49:59', 1),
(272, 4, 180, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-07-11 09:50:05', '2025-07-11 09:50:05', 1),
(273, 4, 181, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-11 09:50:05', '2025-07-11 09:50:05', 1),
(274, 4, 180, 'Booking Activated', 'Your booking has been activated by Sarthak', '2025-07-11 09:50:14', '2025-07-11 09:50:14', 1),
(275, 4, 181, 'Booking Activated', 'You have activated the booking of Sumit', '2025-07-11 09:50:14', '2025-07-11 09:50:14', 1),
(276, 4, 180, 'Booking Completed', 'Your booking has been completed by Sarthak', '2025-07-11 09:50:24', '2025-07-11 09:50:24', 1),
(277, 4, 181, 'Booking Completed', 'You have completed the booking of Sumit', '2025-07-11 09:50:24', '2025-07-11 09:50:24', 1),
(278, 5, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:50:52', '2025-07-11 09:50:52', 1),
(279, 6, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:51:40', '2025-07-11 09:51:40', 1),
(280, 6, 181, 'New Booking', 'New booking found ', '2025-07-11 09:51:40', '2025-07-11 09:51:40', 1),
(281, 6, 180, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-07-11 09:51:48', '2025-07-11 09:51:48', 1),
(282, 6, 181, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-11 09:51:48', '2025-07-11 09:51:48', 1),
(283, 6, 180, 'Booking Cancelled', 'Your booking has been cancelled by Sarthak', '2025-07-11 09:53:11', '2025-07-11 09:53:11', 1),
(284, 6, 181, 'Booking Cancelled', 'You have cancelled the booking of Sumit', '2025-07-11 09:53:11', '2025-07-11 09:53:11', 1),
(285, 7, 180, 'New Booking', 'New Booking Created', '2025-07-11 09:58:04', '2025-07-11 09:58:04', 1),
(286, 1, 182, 'New Booking', 'New Booking Created', '2025-07-11 10:53:45', '2025-07-11 10:53:45', 1),
(287, 1, 184, 'New Booking', 'New booking found ', '2025-07-11 10:53:46', '2025-07-11 10:53:46', 1),
(288, 1, 182, 'Booking Accepted', 'Your booking has been accepted by Aman KUMAR', '2025-07-11 10:54:29', '2025-07-11 10:54:29', 1),
(289, 1, 184, 'Booking Accepted', 'You have accepted the booking of Aman kumar', '2025-07-11 10:54:29', '2025-07-11 10:54:29', 1),
(290, 1, 182, 'Booking Activated', 'Your booking has been activated by Aman KUMAR', '2025-07-11 10:54:51', '2025-07-11 10:54:51', 1),
(291, 1, 184, 'Booking Activated', 'You have activated the booking of Aman kumar', '2025-07-11 10:54:51', '2025-07-11 10:54:51', 1),
(292, 1, 182, 'Booking Completed', 'Your booking has been completed by Aman KUMAR', '2025-07-11 10:57:39', '2025-07-11 10:57:39', 1),
(293, 1, 184, 'Booking Completed', 'You have completed the booking of Aman kumar', '2025-07-11 10:57:39', '2025-07-11 10:57:39', 1),
(294, 2, 182, 'New Booking', 'New Booking Created', '2025-07-11 12:07:25', '2025-07-11 12:07:25', 1),
(295, 2, 184, 'New Booking', 'New booking found ', '2025-07-11 12:07:25', '2025-07-11 12:07:25', 1),
(296, 2, 183, 'New Booking', 'New booking found ', '2025-07-11 12:07:25', '2025-07-11 12:07:25', 1),
(297, 2, 182, 'Booking Accepted', 'Your booking has been accepted by Aman KUMAR', '2025-07-11 12:07:52', '2025-07-11 12:07:52', 1),
(298, 2, 184, 'Booking Accepted', 'You have accepted the booking of Aman kumar', '2025-07-11 12:07:52', '2025-07-11 12:07:52', 1),
(299, 2, 182, 'Booking Activated', 'Your booking has been activated by Aman KUMAR', '2025-07-11 12:08:10', '2025-07-11 12:08:10', 1),
(300, 2, 184, 'Booking Activated', 'You have activated the booking of Aman kumar', '2025-07-11 12:08:10', '2025-07-11 12:08:10', 1),
(301, 2, 182, 'Booking Completed', 'Your booking has been completed by Aman KUMAR', '2025-07-11 12:08:53', '2025-07-11 12:08:53', 1),
(302, 2, 184, 'Booking Completed', 'You have completed the booking of Aman kumar', '2025-07-11 12:08:53', '2025-07-11 12:08:53', 1),
(303, 3, 187, 'New Booking', 'New Booking Created', '2025-07-11 16:55:31', '2025-07-11 16:55:31', 1),
(304, 3, 184, 'New Booking', 'New booking found ', '2025-07-11 16:55:32', '2025-07-11 16:55:32', 1),
(305, 3, 183, 'New Booking', 'New booking found ', '2025-07-11 16:55:32', '2025-07-11 16:55:32', 1),
(306, 4, 187, 'New Booking', 'New Booking Created', '2025-07-11 16:55:49', '2025-07-11 16:55:49', 1),
(307, 4, 184, 'New Booking', 'New booking found ', '2025-07-11 16:55:49', '2025-07-11 16:55:49', 1),
(308, 4, 183, 'New Booking', 'New booking found ', '2025-07-11 16:55:50', '2025-07-11 16:55:50', 1),
(309, 5, 187, 'New Booking', 'New Booking Created', '2025-07-11 16:56:06', '2025-07-11 16:56:06', 1),
(310, 3, 187, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-11 16:56:24', '2025-07-11 16:56:24', 1),
(311, 3, 184, 'Booking Accepted', 'You have accepted the booking of Shivam kumar', '2025-07-11 16:56:24', '2025-07-11 16:56:24', 1),
(312, 3, 187, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-11 16:56:56', '2025-07-11 16:56:56', 1),
(313, 3, 184, 'Booking Activated', 'You have activated the booking of Shivam kumar', '2025-07-11 16:56:56', '2025-07-11 16:56:56', 1),
(314, 3, 187, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-11 16:57:22', '2025-07-11 16:57:22', 1),
(315, 3, 184, 'Booking Completed', 'You have completed the booking of Shivam kumar', '2025-07-11 16:57:22', '2025-07-11 16:57:22', 1),
(316, 3, 187, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-11 16:57:57', '2025-07-11 16:57:57', 1),
(317, 3, 184, 'Booking Completed', 'You have completed the booking of Shivam kumar', '2025-07-11 16:57:57', '2025-07-11 16:57:57', 1),
(318, 6, 188, 'New Booking', 'New Booking Created', '2025-07-12 02:26:50', '2025-07-12 02:26:50', 1),
(319, 6, 184, 'New Booking', 'New booking found ', '2025-07-12 02:26:50', '2025-07-12 02:26:50', 1),
(320, 6, 183, 'New Booking', 'New booking found ', '2025-07-12 02:26:51', '2025-07-12 02:26:51', 1),
(321, 7, 188, 'New Booking', 'New Booking Created', '2025-07-12 02:33:12', '2025-07-12 02:33:12', 1),
(322, 7, 184, 'New Booking', 'New booking found ', '2025-07-12 02:33:12', '2025-07-12 02:33:12', 1),
(323, 7, 183, 'New Booking', 'New booking found ', '2025-07-12 02:33:12', '2025-07-12 02:33:12', 1),
(324, 6, 188, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-12 02:33:37', '2025-07-12 02:33:37', 1),
(325, 6, 184, 'Booking Cancelled', 'You have cancelled the booking of Jay kumar', '2025-07-12 02:33:37', '2025-07-12 02:33:37', 1),
(326, 4, 187, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-12 02:33:41', '2025-07-12 02:33:41', 1),
(327, 4, 184, 'Booking Cancelled', 'You have cancelled the booking of Shivam kumar', '2025-07-12 02:33:41', '2025-07-12 02:33:41', 1),
(328, 7, 188, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-12 02:33:52', '2025-07-12 02:33:52', 1),
(329, 7, 184, 'Booking Accepted', 'You have accepted the booking of Jay kumar', '2025-07-12 02:33:52', '2025-07-12 02:33:52', 1),
(330, 7, 188, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-12 02:34:50', '2025-07-12 02:34:50', 1),
(331, 7, 184, 'Booking Cancelled', 'You have cancelled the booking of Jay kumar', '2025-07-12 02:34:50', '2025-07-12 02:34:50', 1),
(332, 8, 192, 'New Booking', 'New Booking Created', '2025-07-12 17:51:51', '2025-07-12 17:51:51', 1),
(333, 9, 182, 'New Booking', 'New Booking Created', '2025-07-13 07:38:29', '2025-07-13 07:38:29', 1),
(334, 10, 182, 'New Booking', 'New Booking Created', '2025-07-13 07:40:12', '2025-07-13 07:40:12', 1),
(335, 11, 182, 'New Booking', 'New Booking Created', '2025-07-13 15:41:53', '2025-07-13 15:41:53', 1),
(336, 11, 184, 'New Booking', 'New booking found ', '2025-07-13 15:41:54', '2025-07-13 15:41:54', 1),
(337, 11, 183, 'New Booking', 'New booking found ', '2025-07-13 15:41:54', '2025-07-13 15:41:54', 1),
(338, 11, 182, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-13 15:42:31', '2025-07-13 15:42:31', 1),
(339, 11, 184, 'Booking Accepted', 'You have accepted the booking of Aman kumar', '2025-07-13 15:42:31', '2025-07-13 15:42:31', 1),
(340, 11, 182, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-13 15:43:43', '2025-07-13 15:43:43', 1),
(341, 11, 184, 'Booking Activated', 'You have activated the booking of Aman kumar', '2025-07-13 15:43:43', '2025-07-13 15:43:43', 1),
(342, 11, 182, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-13 15:44:55', '2025-07-13 15:44:55', 1),
(343, 11, 184, 'Booking Completed', 'You have completed the booking of Aman kumar', '2025-07-13 15:44:55', '2025-07-13 15:44:55', 1),
(344, 12, 193, 'New Booking', 'New Booking Created', '2025-07-13 16:18:44', '2025-07-13 16:18:44', 1),
(345, 13, 193, 'New Booking', 'New Booking Created', '2025-07-13 16:18:45', '2025-07-13 16:18:45', 1),
(346, 12, 184, 'New Booking', 'New booking found ', '2025-07-13 16:18:45', '2025-07-13 16:18:45', 1),
(347, 13, 184, 'New Booking', 'New booking found ', '2025-07-13 16:18:45', '2025-07-13 16:18:45', 1),
(348, 12, 183, 'New Booking', 'New booking found ', '2025-07-13 16:18:45', '2025-07-13 16:18:45', 1),
(349, 13, 183, 'New Booking', 'New booking found ', '2025-07-13 16:18:46', '2025-07-13 16:18:46', 1),
(350, 14, 193, 'New Booking', 'New Booking Created', '2025-07-13 16:18:50', '2025-07-13 16:18:50', 1),
(351, 14, 184, 'New Booking', 'New booking found ', '2025-07-13 16:18:50', '2025-07-13 16:18:50', 1),
(352, 14, 183, 'New Booking', 'New booking found ', '2025-07-13 16:18:51', '2025-07-13 16:18:51', 1),
(353, 15, 193, 'New Booking', 'New Booking Created', '2025-07-13 16:18:51', '2025-07-13 16:18:51', 1),
(354, 15, 184, 'New Booking', 'New booking found ', '2025-07-13 16:18:52', '2025-07-13 16:18:52', 1),
(355, 15, 183, 'New Booking', 'New booking found ', '2025-07-13 16:18:52', '2025-07-13 16:18:52', 1),
(356, 12, 193, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-13 16:19:08', '2025-07-13 16:19:08', 1),
(357, 12, 184, 'Booking Accepted', 'You have accepted the booking of Pradeep Kumar', '2025-07-13 16:19:08', '2025-07-13 16:19:08', 1),
(358, 13, 193, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-13 16:19:11', '2025-07-13 16:19:11', 1),
(359, 13, 184, 'Booking Accepted', 'You have accepted the booking of Pradeep Kumar', '2025-07-13 16:19:11', '2025-07-13 16:19:11', 1),
(360, 14, 193, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-13 16:19:20', '2025-07-13 16:19:20', 1),
(361, 14, 184, 'Booking Cancelled', 'You have cancelled the booking of Pradeep Kumar', '2025-07-13 16:19:20', '2025-07-13 16:19:20', 1),
(362, 15, 193, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-13 16:19:29', '2025-07-13 16:19:29', 1),
(363, 15, 184, 'Booking Accepted', 'You have accepted the booking of Pradeep Kumar', '2025-07-13 16:19:29', '2025-07-13 16:19:29', 1),
(364, 15, 193, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-13 16:19:42', '2025-07-13 16:19:42', 1),
(365, 15, 184, 'Booking Cancelled', 'You have cancelled the booking of Pradeep Kumar', '2025-07-13 16:19:42', '2025-07-13 16:19:42', 1),
(366, 16, 194, 'New Booking', 'New Booking Created', '2025-07-13 16:43:09', '2025-07-13 16:43:09', 1),
(367, 17, 194, 'New Booking', 'New Booking Created', '2025-07-13 16:43:41', '2025-07-13 16:43:41', 1),
(368, 18, 194, 'New Booking', 'New Booking Created', '2025-07-13 16:45:52', '2025-07-13 16:45:52', 1),
(369, 19, 194, 'New Booking', 'New Booking Created', '2025-07-13 16:46:00', '2025-07-13 16:46:00', 1),
(370, 20, 194, 'New Booking', 'New Booking Created', '2025-07-13 16:47:04', '2025-07-13 16:47:04', 1),
(371, 21, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:00:45', '2025-07-14 10:00:45', 1),
(372, 22, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:00:48', '2025-07-14 10:00:48', 1),
(373, 23, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:00:57', '2025-07-14 10:00:57', 1),
(374, 24, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:00:59', '2025-07-14 10:00:59', 1),
(375, 25, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:01', '2025-07-14 10:01:01', 1),
(376, 26, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:06', '2025-07-14 10:01:06', 1),
(377, 27, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:07', '2025-07-14 10:01:07', 1),
(378, 28, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:08', '2025-07-14 10:01:08', 1),
(379, 29, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:09', '2025-07-14 10:01:09', 1),
(380, 30, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:11', '2025-07-14 10:01:11', 1),
(381, 31, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:11', '2025-07-14 10:01:11', 1),
(382, 32, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:12', '2025-07-14 10:01:12', 1),
(383, 33, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:13', '2025-07-14 10:01:13', 1),
(384, 34, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:23', '2025-07-14 10:01:23', 1),
(385, 35, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:31', '2025-07-14 10:01:31', 1),
(386, 36, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:01:35', '2025-07-14 10:01:35', 1),
(387, 37, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:00', '2025-07-14 10:02:00', 1),
(388, 38, 182, 'New Booking', 'New Booking Created', '2025-07-14 10:02:03', '2025-07-14 10:02:03', 1),
(389, 38, 184, 'New Booking', 'New booking found ', '2025-07-14 10:02:04', '2025-07-14 10:02:04', 1),
(390, 39, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:04', '2025-07-14 10:02:04', 1),
(391, 38, 182, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-14 10:02:18', '2025-07-14 10:02:18', 1),
(392, 38, 184, 'Booking Accepted', 'You have accepted the booking of Aman kumar', '2025-07-14 10:02:18', '2025-07-14 10:02:18', 1),
(393, 40, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:27', '2025-07-14 10:02:27', 1),
(394, 41, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:27', '2025-07-14 10:02:27', 1),
(395, 38, 182, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-14 10:02:28', '2025-07-14 10:02:28', 1),
(396, 38, 184, 'Booking Activated', 'You have activated the booking of Aman kumar', '2025-07-14 10:02:28', '2025-07-14 10:02:28', 1),
(397, 42, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:31', '2025-07-14 10:02:31', 1),
(398, 43, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:35', '2025-07-14 10:02:35', 1),
(399, 44, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:37', '2025-07-14 10:02:37', 1),
(400, 45, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:40', '2025-07-14 10:02:40', 1),
(401, 46, 193, 'New Booking', 'New Booking Created', '2025-07-14 10:02:43', '2025-07-14 10:02:43', 1),
(402, 38, 182, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-14 10:02:54', '2025-07-14 10:02:54', 1),
(403, 38, 184, 'Booking Completed', 'You have completed the booking of Aman kumar', '2025-07-14 10:02:54', '2025-07-14 10:02:54', 1),
(404, 47, 196, 'New Booking', 'New Booking Created', '2025-07-14 10:35:49', '2025-07-14 10:35:49', 1),
(405, 47, 184, 'New Booking', 'New booking found ', '2025-07-14 10:35:50', '2025-07-14 10:35:50', 1),
(406, 47, 196, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-14 10:36:10', '2025-07-14 10:36:10', 1),
(407, 47, 184, 'Booking Accepted', 'You have accepted the booking of Amrit Raj', '2025-07-14 10:36:10', '2025-07-14 10:36:10', 1),
(408, 47, 196, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-14 10:36:28', '2025-07-14 10:36:28', 1),
(409, 47, 184, 'Booking Activated', 'You have activated the booking of Amrit Raj', '2025-07-14 10:36:28', '2025-07-14 10:36:28', 1),
(410, 47, 196, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-14 10:36:47', '2025-07-14 10:36:47', 1),
(411, 47, 184, 'Booking Completed', 'You have completed the booking of Amrit Raj', '2025-07-14 10:36:47', '2025-07-14 10:36:47', 1),
(412, 48, 182, 'New Booking', 'New Booking Created', '2025-07-14 11:20:10', '2025-07-14 11:20:10', 1),
(413, 49, 185, 'New Booking', 'New Booking Created', '2025-07-15 05:45:53', '2025-07-15 05:45:53', 1),
(414, 50, 185, 'New Booking', 'New Booking Created', '2025-07-15 05:46:15', '2025-07-15 05:46:15', 1),
(415, 1, 200, 'New Booking', 'New Booking Created', '2025-07-15 07:39:55', '2025-07-15 07:39:55', 1),
(416, 2, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:04:51', '2025-07-16 05:04:51', 1),
(417, 3, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:11:34', '2025-07-16 05:11:34', 1),
(418, 3, 211, 'New Booking', 'New booking found ', '2025-07-16 05:11:34', '2025-07-16 05:11:34', 1),
(419, 4, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:12:36', '2025-07-16 05:12:36', 1),
(420, 4, 211, 'New Booking', 'New booking found ', '2025-07-16 05:12:37', '2025-07-16 05:12:37', 1),
(421, 3, 210, 'Booking Accepted', 'Your booking has been accepted by Sarthak', '2025-07-16 05:12:42', '2025-07-16 05:12:42', 1),
(422, 3, 211, 'Booking Accepted', 'You have accepted the booking of Ujjwal', '2025-07-16 05:12:42', '2025-07-16 05:12:42', 1),
(423, 3, 210, 'Booking Activated', 'Your booking has been activated by Sarthak', '2025-07-16 05:12:49', '2025-07-16 05:12:49', 1),
(424, 3, 211, 'Booking Activated', 'You have activated the booking of Ujjwal', '2025-07-16 05:12:49', '2025-07-16 05:12:49', 1),
(425, 3, 210, 'Booking Completed', 'Your booking has been completed by Sarthak', '2025-07-16 05:13:16', '2025-07-16 05:13:16', 1),
(426, 3, 211, 'Booking Completed', 'You have completed the booking of Ujjwal', '2025-07-16 05:13:16', '2025-07-16 05:13:16', 1),
(427, 4, 210, 'Booking Cancelled', 'Your booking has been cancelled by Sarthak', '2025-07-16 05:13:22', '2025-07-16 05:13:22', 1);
INSERT INTO `tbl_notification` (`id`, `booking_id`, `user_id`, `subject`, `description`, `created_at`, `updated_at`, `status`) VALUES
(428, 4, 211, 'Booking Cancelled', 'You have cancelled the booking of Ujjwal', '2025-07-16 05:13:22', '2025-07-16 05:13:22', 1),
(429, 5, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:14:44', '2025-07-16 05:14:44', 1),
(430, 6, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:15:06', '2025-07-16 05:15:06', 1),
(431, 7, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:15:20', '2025-07-16 05:15:20', 1),
(432, 8, 210, 'New Booking', 'New Booking Created', '2025-07-16 05:15:36', '2025-07-16 05:15:36', 1),
(433, 9, 209, 'New Booking', 'New Booking Created', '2025-07-16 10:08:31', '2025-07-16 10:08:31', 1),
(434, 10, 213, 'New Booking', 'New Booking Created', '2025-07-16 10:16:09', '2025-07-16 10:16:09', 1),
(435, 11, 213, 'New Booking', 'New Booking Created', '2025-07-16 10:23:49', '2025-07-16 10:23:49', 1),
(436, 12, 213, 'New Booking', 'New Booking Created', '2025-07-16 10:24:46', '2025-07-16 10:24:46', 1),
(437, 13, 213, 'New Booking', 'New Booking Created', '2025-07-16 10:25:02', '2025-07-16 10:25:02', 1),
(438, 14, 214, 'New Booking', 'New Booking Created', '2025-07-16 14:04:55', '2025-07-16 14:04:55', 1),
(439, 15, 214, 'New Booking', 'New Booking Created', '2025-07-16 15:54:33', '2025-07-16 15:54:33', 1),
(440, 16, 214, 'New Booking', 'New Booking Created', '2025-07-16 15:57:12', '2025-07-16 15:57:12', 1),
(441, 17, 215, 'New Booking', 'New Booking Created', '2025-07-17 05:03:32', '2025-07-17 05:03:32', 1),
(442, 18, 215, 'New Booking', 'New Booking Created', '2025-07-17 05:04:17', '2025-07-17 05:04:17', 1),
(443, 19, 215, 'New Booking', 'New Booking Created', '2025-07-17 05:04:44', '2025-07-17 05:04:44', 1),
(444, 19, 212, 'New Booking', 'New booking found ', '2025-07-17 05:04:44', '2025-07-17 05:04:44', 1),
(445, 19, 215, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 05:05:10', '2025-07-17 05:05:10', 1),
(446, 19, 212, 'Booking Accepted', 'You have accepted the booking of Kuldeep choupal', '2025-07-17 05:05:10', '2025-07-17 05:05:10', 1),
(447, 19, 215, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-17 05:05:40', '2025-07-17 05:05:40', 1),
(448, 19, 212, 'Booking Activated', 'You have activated the booking of Kuldeep choupal', '2025-07-17 05:05:40', '2025-07-17 05:05:40', 1),
(449, 19, 215, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-17 05:06:01', '2025-07-17 05:06:01', 1),
(450, 19, 212, 'Booking Completed', 'You have completed the booking of Kuldeep choupal', '2025-07-17 05:06:01', '2025-07-17 05:06:01', 1),
(451, 20, 215, 'New Booking', 'New Booking Created', '2025-07-17 05:07:00', '2025-07-17 05:07:00', 1),
(452, 20, 212, 'New Booking', 'New booking found ', '2025-07-17 05:07:00', '2025-07-17 05:07:00', 1),
(453, 20, 215, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 05:07:28', '2025-07-17 05:07:28', 1),
(454, 20, 212, 'Booking Accepted', 'You have accepted the booking of Kuldeep choupal', '2025-07-17 05:07:28', '2025-07-17 05:07:28', 1),
(455, 20, 215, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-17 05:08:32', '2025-07-17 05:08:32', 1),
(456, 21, 215, 'New Booking', 'New Booking Created', '2025-07-17 05:09:05', '2025-07-17 05:09:05', 1),
(457, 21, 212, 'New Booking', 'New booking found ', '2025-07-17 05:09:06', '2025-07-17 05:09:06', 1),
(458, 21, 215, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 05:09:25', '2025-07-17 05:09:25', 1),
(459, 21, 212, 'Booking Accepted', 'You have accepted the booking of Kuldeep choupal', '2025-07-17 05:09:25', '2025-07-17 05:09:25', 1),
(460, 21, 215, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-17 05:09:59', '2025-07-17 05:09:59', 1),
(461, 21, 212, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 05:09:59', '2025-07-17 05:09:59', 1),
(462, 22, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:09:55', '2025-07-17 06:09:55', 1),
(463, 23, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:12:37', '2025-07-17 06:12:37', 1),
(464, 23, 217, 'New Booking', 'New booking found ', '2025-07-17 06:12:38', '2025-07-17 06:12:38', 1),
(465, 23, 215, 'Booking Cancelled', 'Your booking has been cancelled by VDSVH', '2025-07-17 06:12:53', '2025-07-17 06:12:53', 1),
(466, 23, 217, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 06:12:53', '2025-07-17 06:12:53', 1),
(467, 24, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:14:25', '2025-07-17 06:14:25', 1),
(468, 24, 217, 'New Booking', 'New booking found ', '2025-07-17 06:14:25', '2025-07-17 06:14:25', 1),
(469, 24, 215, 'Booking Cancelled', 'Your booking has been cancelled by VDSVH', '2025-07-17 06:27:05', '2025-07-17 06:27:05', 1),
(470, 24, 217, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 06:27:05', '2025-07-17 06:27:05', 1),
(471, 25, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:27:59', '2025-07-17 06:27:59', 1),
(472, 26, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:33:10', '2025-07-17 06:33:10', 1),
(473, 27, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:36:07', '2025-07-17 06:36:07', 1),
(474, 27, 217, 'New Booking', 'New booking found ', '2025-07-17 06:36:07', '2025-07-17 06:36:07', 1),
(475, 28, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:36:31', '2025-07-17 06:36:31', 1),
(476, 28, 217, 'New Booking', 'New booking found ', '2025-07-17 06:36:31', '2025-07-17 06:36:31', 1),
(477, 27, 215, 'Booking Cancelled', 'Your booking has been cancelled by VDSVH', '2025-07-17 06:36:35', '2025-07-17 06:36:35', 1),
(478, 27, 217, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 06:36:35', '2025-07-17 06:36:35', 1),
(479, 28, 215, 'Booking Cancelled', 'Your booking has been cancelled by VDSVH', '2025-07-17 06:36:41', '2025-07-17 06:36:41', 1),
(480, 28, 217, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 06:36:41', '2025-07-17 06:36:41', 1),
(481, 29, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:37:59', '2025-07-17 06:37:59', 1),
(482, 29, 217, 'New Booking', 'New booking found ', '2025-07-17 06:38:00', '2025-07-17 06:38:00', 1),
(483, 29, 215, 'Booking Cancelled', 'Your booking has been cancelled by VDSVH', '2025-07-17 06:38:14', '2025-07-17 06:38:14', 1),
(484, 29, 217, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 06:38:14', '2025-07-17 06:38:14', 1),
(485, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:51:58', '2025-07-17 06:51:58', 1),
(486, 1, 212, 'New Booking', 'New booking found ', '2025-07-17 06:51:59', '2025-07-17 06:51:59', 1),
(487, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:52:21', '2025-07-17 06:52:21', 1),
(488, 1, 212, 'New Booking', 'New booking found ', '2025-07-17 06:52:22', '2025-07-17 06:52:22', 1),
(489, 1, 217, 'New Booking', 'New booking found ', '2025-07-17 06:52:22', '2025-07-17 06:52:22', 1),
(490, 1, 215, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 06:52:24', '2025-07-17 06:52:24', 1),
(491, 1, 212, 'Booking Accepted', 'You have accepted the booking of Kuldeep choupal', '2025-07-17 06:52:24', '2025-07-17 06:52:24', 1),
(492, 1, 215, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-17 06:52:47', '2025-07-17 06:52:47', 1),
(493, 1, 212, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 06:52:47', '2025-07-17 06:52:47', 1),
(494, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:53:47', '2025-07-17 06:53:47', 1),
(495, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:54:08', '2025-07-17 06:54:08', 1),
(496, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:55:27', '2025-07-17 06:55:27', 1),
(497, 2, 215, 'New Booking', 'New Booking Created', '2025-07-17 06:55:57', '2025-07-17 06:55:57', 1),
(498, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 07:12:29', '2025-07-17 07:12:29', 1),
(499, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 07:13:24', '2025-07-17 07:13:24', 1),
(500, 1, 218, 'New Booking', 'New booking found ', '2025-07-17 07:13:25', '2025-07-17 07:13:25', 1),
(501, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 07:20:27', '2025-07-17 07:20:27', 1),
(502, 1, 208, 'New Booking', 'New booking found ', '2025-07-17 07:20:27', '2025-07-17 07:20:27', 1),
(503, 1, 209, 'New Booking', 'New booking found ', '2025-07-17 07:20:28', '2025-07-17 07:20:28', 1),
(504, 1, 210, 'New Booking', 'New booking found ', '2025-07-17 07:20:28', '2025-07-17 07:20:28', 1),
(505, 1, 212, 'New Booking', 'New booking found ', '2025-07-17 07:20:29', '2025-07-17 07:20:29', 1),
(506, 1, 213, 'New Booking', 'New booking found ', '2025-07-17 07:20:29', '2025-07-17 07:20:29', 1),
(507, 1, 218, 'New Booking', 'New booking found ', '2025-07-17 07:20:29', '2025-07-17 07:20:29', 1),
(508, 1, 215, 'Booking Cancelled', 'Your booking has been cancelled by dvhjs', '2025-07-17 07:20:53', '2025-07-17 07:20:53', 1),
(509, 1, 218, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 07:20:53', '2025-07-17 07:20:53', 1),
(510, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 07:36:11', '2025-07-17 07:36:11', 1),
(511, 1, 208, 'New Booking', 'New booking found ', '2025-07-17 07:36:11', '2025-07-17 07:36:11', 1),
(512, 1, 209, 'New Booking', 'New booking found ', '2025-07-17 07:36:12', '2025-07-17 07:36:12', 1),
(513, 1, 210, 'New Booking', 'New booking found ', '2025-07-17 07:36:12', '2025-07-17 07:36:12', 1),
(514, 1, 212, 'New Booking', 'New booking found ', '2025-07-17 07:36:13', '2025-07-17 07:36:13', 1),
(515, 1, 213, 'New Booking', 'New booking found ', '2025-07-17 07:36:13', '2025-07-17 07:36:13', 1),
(516, 1, 218, 'New Booking', 'New booking found ', '2025-07-17 07:36:14', '2025-07-17 07:36:14', 1),
(517, 1, 215, 'Booking Accepted', 'Your booking has been accepted by dvhjs', '2025-07-17 07:37:27', '2025-07-17 07:37:27', 1),
(518, 1, 218, 'Booking Accepted', 'You have accepted the booking of Kuldeep choupal', '2025-07-17 07:37:27', '2025-07-17 07:37:27', 1),
(519, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 07:39:19', '2025-07-17 07:39:19', 1),
(520, 1, 208, 'New Booking', 'New booking found ', '2025-07-17 07:39:19', '2025-07-17 07:39:19', 1),
(521, 1, 209, 'New Booking', 'New booking found ', '2025-07-17 07:39:20', '2025-07-17 07:39:20', 1),
(522, 1, 210, 'New Booking', 'New booking found ', '2025-07-17 07:39:20', '2025-07-17 07:39:20', 1),
(523, 1, 212, 'New Booking', 'New booking found ', '2025-07-17 07:39:21', '2025-07-17 07:39:21', 1),
(524, 1, 213, 'New Booking', 'New booking found ', '2025-07-17 07:39:21', '2025-07-17 07:39:21', 1),
(525, 1, 215, 'New Booking', 'New Booking Created', '2025-07-17 07:40:41', '2025-07-17 07:40:41', 1),
(526, 1, 208, 'New Booking', 'New booking found ', '2025-07-17 07:40:42', '2025-07-17 07:40:42', 1),
(527, 1, 209, 'New Booking', 'New booking found ', '2025-07-17 07:40:43', '2025-07-17 07:40:43', 1),
(528, 1, 210, 'New Booking', 'New booking found ', '2025-07-17 07:40:43', '2025-07-17 07:40:43', 1),
(529, 1, 212, 'New Booking', 'New booking found ', '2025-07-17 07:40:43', '2025-07-17 07:40:43', 1),
(530, 1, 213, 'New Booking', 'New booking found ', '2025-07-17 07:40:44', '2025-07-17 07:40:44', 1),
(531, 1, 218, 'New Booking', 'New booking found ', '2025-07-17 07:40:44', '2025-07-17 07:40:44', 1),
(532, 1, 215, 'Booking Accepted', 'Your booking has been accepted by Abhi', '2025-07-17 07:46:12', '2025-07-17 07:46:12', 1),
(533, 1, 213, 'Booking Accepted', 'You have accepted the booking of Kuldeep choupal', '2025-07-17 07:46:12', '2025-07-17 07:46:12', 1),
(534, 1, 215, 'Booking Activated', 'Your booking has been activated by Abhi', '2025-07-17 07:46:41', '2025-07-17 07:46:41', 1),
(535, 1, 213, 'Booking Activated', 'You have activated the booking of Kuldeep choupal', '2025-07-17 07:46:41', '2025-07-17 07:46:41', 1),
(536, 1, 215, 'Booking Completed', 'Your booking has been completed by Abhi', '2025-07-17 07:46:51', '2025-07-17 07:46:51', 1),
(537, 1, 213, 'Booking Completed', 'You have completed the booking of Kuldeep choupal', '2025-07-17 07:46:51', '2025-07-17 07:46:51', 1),
(538, 1, 215, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-17 09:49:39', '2025-07-17 09:49:39', 1),
(539, 1, 212, 'Booking Cancelled', 'You have cancelled the booking of Kuldeep choupal', '2025-07-17 09:49:39', '2025-07-17 09:49:39', 1),
(540, 2, 219, 'New Booking', 'New Booking Created', '2025-07-17 11:32:22', '2025-07-17 11:32:22', 1),
(541, 1, 222, 'New Booking', 'New Booking Created', '2025-07-17 12:05:03', '2025-07-17 12:05:03', 1),
(542, 1, 221, 'New Booking', 'New booking found ', '2025-07-17 12:05:04', '2025-07-17 12:05:04', 1),
(543, 1, 222, 'Booking Accepted', 'Your booking has been accepted by sarthak', '2025-07-17 12:05:22', '2025-07-17 12:05:22', 1),
(544, 1, 221, 'Booking Accepted', 'You have accepted the booking of Starthak', '2025-07-17 12:05:22', '2025-07-17 12:05:22', 1),
(545, 2, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:09:22', '2025-07-17 12:09:22', 1),
(546, 2, 221, 'New Booking', 'New booking found ', '2025-07-17 12:09:23', '2025-07-17 12:09:23', 1),
(547, 1, 222, 'Booking Activated', 'Your booking has been activated by sarthak', '2025-07-17 12:13:39', '2025-07-17 12:13:39', 1),
(548, 1, 221, 'Booking Activated', 'You have activated the booking of Starthak', '2025-07-17 12:13:39', '2025-07-17 12:13:39', 1),
(549, 3, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:14:25', '2025-07-17 12:14:25', 1),
(550, 1, 222, 'Booking Completed', 'Your booking has been completed by sarthak', '2025-07-17 12:14:59', '2025-07-17 12:14:59', 1),
(551, 1, 221, 'Booking Completed', 'You have completed the booking of Starthak', '2025-07-17 12:14:59', '2025-07-17 12:14:59', 1),
(552, 2, 223, 'Booking Accepted', 'Your booking has been accepted by sarthak', '2025-07-17 12:15:19', '2025-07-17 12:15:19', 1),
(553, 2, 221, 'Booking Accepted', 'You have accepted the booking of Fazlu Rehman', '2025-07-17 12:15:19', '2025-07-17 12:15:19', 1),
(554, 2, 223, 'Booking Activated', 'Your booking has been activated by sarthak', '2025-07-17 12:23:23', '2025-07-17 12:23:23', 1),
(555, 2, 221, 'Booking Activated', 'You have activated the booking of Fazlu Rehman', '2025-07-17 12:23:23', '2025-07-17 12:23:23', 1),
(556, 2, 223, 'Booking Completed', 'Your booking has been completed by sarthak', '2025-07-17 12:31:22', '2025-07-17 12:31:22', 1),
(557, 2, 221, 'Booking Completed', 'You have completed the booking of Fazlu Rehman', '2025-07-17 12:31:22', '2025-07-17 12:31:22', 1),
(558, 1, 222, 'New Booking', 'New Booking Created', '2025-07-17 12:32:20', '2025-07-17 12:32:20', 1),
(559, 1, 221, 'New Booking', 'New booking found ', '2025-07-17 12:32:21', '2025-07-17 12:32:21', 1),
(560, 1, 222, 'Booking Accepted', 'Your booking has been accepted by sarthak', '2025-07-17 12:32:35', '2025-07-17 12:32:35', 1),
(561, 1, 221, 'Booking Accepted', 'You have accepted the booking of Starthak', '2025-07-17 12:32:35', '2025-07-17 12:32:35', 1),
(562, 1, 222, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-17 12:33:52', '2025-07-17 12:33:52', 1),
(563, 1, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:37:17', '2025-07-17 12:37:17', 1),
(564, 1, 221, 'New Booking', 'New booking found ', '2025-07-17 12:37:18', '2025-07-17 12:37:18', 1),
(565, 1, 223, 'Booking Accepted', 'Your booking has been accepted by sarthak', '2025-07-17 12:37:53', '2025-07-17 12:37:53', 1),
(566, 1, 221, 'Booking Accepted', 'You have accepted the booking of Fazlu Rehman', '2025-07-17 12:37:53', '2025-07-17 12:37:53', 1),
(567, 1, 223, 'Booking Activated', 'Your booking has been activated by sarthak', '2025-07-17 12:38:00', '2025-07-17 12:38:00', 1),
(568, 1, 221, 'Booking Activated', 'You have activated the booking of Fazlu Rehman', '2025-07-17 12:38:00', '2025-07-17 12:38:00', 1),
(569, 1, 223, 'Booking Completed', 'Your booking has been completed by sarthak', '2025-07-17 12:40:42', '2025-07-17 12:40:42', 1),
(570, 1, 221, 'Booking Completed', 'You have completed the booking of Fazlu Rehman', '2025-07-17 12:40:42', '2025-07-17 12:40:42', 1),
(571, 1, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:41:24', '2025-07-17 12:41:24', 1),
(572, 1, 221, 'New Booking', 'New booking found ', '2025-07-17 12:41:25', '2025-07-17 12:41:25', 1),
(573, 1, 223, 'Booking Accepted', 'Your booking has been accepted by sarthak', '2025-07-17 12:42:01', '2025-07-17 12:42:01', 1),
(574, 1, 221, 'Booking Accepted', 'You have accepted the booking of Fazlu Rehman', '2025-07-17 12:42:01', '2025-07-17 12:42:01', 1),
(575, 1, 223, 'Booking Activated', 'Your booking has been activated by sarthak', '2025-07-17 12:42:09', '2025-07-17 12:42:09', 1),
(576, 1, 221, 'Booking Activated', 'You have activated the booking of Fazlu Rehman', '2025-07-17 12:42:09', '2025-07-17 12:42:09', 1),
(577, 1, 223, 'Booking Completed', 'Your booking has been completed by sarthak', '2025-07-17 12:46:33', '2025-07-17 12:46:33', 1),
(578, 1, 221, 'Booking Completed', 'You have completed the booking of Fazlu Rehman', '2025-07-17 12:46:33', '2025-07-17 12:46:33', 1),
(579, 2, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:47:57', '2025-07-17 12:47:57', 1),
(580, 1, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:48:18', '2025-07-17 12:48:18', 1),
(581, 1, 223, 'New Booking', 'New Booking Created', '2025-07-17 12:49:03', '2025-07-17 12:49:03', 1),
(582, 1, 225, 'New Booking', 'New Booking Created', '2025-07-17 15:27:45', '2025-07-17 15:27:45', 1),
(583, 1, 224, 'New Booking', 'New booking found ', '2025-07-17 15:27:45', '2025-07-17 15:27:45', 1),
(584, 1, 225, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 15:28:00', '2025-07-17 15:28:00', 1),
(585, 1, 224, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-17 15:28:00', '2025-07-17 15:28:00', 1),
(586, 1, 225, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-17 15:28:27', '2025-07-17 15:28:27', 1),
(587, 1, 224, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-17 15:28:27', '2025-07-17 15:28:27', 1),
(588, 1, 225, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-17 15:29:55', '2025-07-17 15:29:55', 1),
(589, 1, 224, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-17 15:29:55', '2025-07-17 15:29:55', 1),
(590, 2, 225, 'New Booking', 'New Booking Created', '2025-07-17 15:30:30', '2025-07-17 15:30:30', 1),
(591, 2, 224, 'New Booking', 'New booking found ', '2025-07-17 15:30:31', '2025-07-17 15:30:31', 1),
(592, 3, 225, 'New Booking', 'New Booking Created', '2025-07-17 15:31:07', '2025-07-17 15:31:07', 1),
(593, 2, 225, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 17:30:33', '2025-07-17 17:30:33', 1),
(594, 2, 224, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-17 17:30:33', '2025-07-17 17:30:33', 1),
(595, 2, 225, 'Booking Cancelled', 'Your booking has been cancelled by Aman kumar', '2025-07-17 17:30:59', '2025-07-17 17:30:59', 1),
(596, 2, 224, 'Booking Cancelled', 'You have cancelled the booking of Abhi', '2025-07-17 17:30:59', '2025-07-17 17:30:59', 1),
(597, 4, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:13:25', '2025-07-17 18:13:25', 1),
(598, 4, 224, 'New Booking', 'New booking found ', '2025-07-17 18:13:25', '2025-07-17 18:13:25', 1),
(599, 5, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:13:49', '2025-07-17 18:13:49', 1),
(600, 5, 224, 'New Booking', 'New booking found ', '2025-07-17 18:13:49', '2025-07-17 18:13:49', 1),
(601, 5, 225, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-17 18:14:07', '2025-07-17 18:14:07', 1),
(602, 5, 224, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-17 18:14:07', '2025-07-17 18:14:07', 1),
(603, 5, 225, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-17 18:14:19', '2025-07-17 18:14:19', 1),
(604, 5, 224, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-17 18:14:19', '2025-07-17 18:14:19', 1),
(605, 5, 225, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-17 18:14:51', '2025-07-17 18:14:51', 1),
(606, 5, 224, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-17 18:14:51', '2025-07-17 18:14:51', 1),
(607, 6, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:18:01', '2025-07-17 18:18:01', 1),
(608, 7, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:18:40', '2025-07-17 18:18:40', 1),
(609, 8, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:19:02', '2025-07-17 18:19:02', 1),
(610, 9, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:19:43', '2025-07-17 18:19:43', 1),
(611, 10, 225, 'New Booking', 'New Booking Created', '2025-07-17 18:20:06', '2025-07-17 18:20:06', 1),
(612, 11, 228, 'New Booking', 'New Booking Created', '2025-07-18 05:16:24', '2025-07-18 05:16:24', 1),
(613, 11, 227, 'New Booking', 'New booking found ', '2025-07-18 05:16:24', '2025-07-18 05:16:24', 1),
(614, 11, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 05:17:11', '2025-07-18 05:17:11', 1),
(615, 11, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 05:17:11', '2025-07-18 05:17:11', 1),
(616, 11, 228, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 05:18:22', '2025-07-18 05:18:22', 1),
(617, 11, 227, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 05:18:22', '2025-07-18 05:18:22', 1),
(618, 11, 228, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 05:19:09', '2025-07-18 05:19:09', 1),
(619, 11, 227, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 05:19:09', '2025-07-18 05:19:09', 1),
(620, 12, 228, 'New Booking', 'New Booking Created', '2025-07-18 05:40:01', '2025-07-18 05:40:01', 1),
(621, 12, 227, 'New Booking', 'New booking found ', '2025-07-18 05:40:02', '2025-07-18 05:40:02', 1),
(622, 1, 228, 'New Booking', 'New Booking Created', '2025-07-18 05:58:12', '2025-07-18 05:58:12', 1),
(623, 2, 228, 'New Booking', 'New Booking Created', '2025-07-18 05:59:39', '2025-07-18 05:59:39', 1),
(624, 3, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:01:00', '2025-07-18 06:01:00', 1),
(625, 4, 225, 'New Booking', 'New Booking Created', '2025-07-18 06:04:49', '2025-07-18 06:04:49', 1),
(626, 4, 224, 'New Booking', 'New booking found ', '2025-07-18 06:04:50', '2025-07-18 06:04:50', 1),
(627, 5, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:05:25', '2025-07-18 06:05:25', 1),
(628, 4, 225, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-18 06:05:33', '2025-07-18 06:05:33', 1),
(629, 4, 224, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-18 06:05:33', '2025-07-18 06:05:33', 1),
(630, 4, 225, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-18 06:05:47', '2025-07-18 06:05:47', 1),
(631, 4, 224, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-18 06:05:47', '2025-07-18 06:05:47', 1),
(632, 4, 225, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-18 06:06:58', '2025-07-18 06:06:58', 1),
(633, 4, 224, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-18 06:06:58', '2025-07-18 06:06:58', 1),
(634, 6, 225, 'New Booking', 'New Booking Created', '2025-07-18 06:07:34', '2025-07-18 06:07:34', 1),
(635, 6, 224, 'New Booking', 'New booking found ', '2025-07-18 06:07:35', '2025-07-18 06:07:35', 1),
(636, 6, 225, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-18 06:08:03', '2025-07-18 06:08:03', 1),
(637, 6, 224, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-18 06:08:03', '2025-07-18 06:08:03', 1),
(638, 6, 225, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-18 06:08:19', '2025-07-18 06:08:19', 1),
(639, 7, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:10:28', '2025-07-18 06:10:28', 1),
(640, 8, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:27:54', '2025-07-18 06:27:54', 1),
(641, 8, 227, 'New Booking', 'New booking found ', '2025-07-18 06:27:54', '2025-07-18 06:27:54', 1),
(642, 9, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:28:20', '2025-07-18 06:28:20', 1),
(643, 10, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:28:59', '2025-07-18 06:28:59', 1),
(644, 11, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:30:22', '2025-07-18 06:30:22', 1),
(645, 12, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:31:05', '2025-07-18 06:31:05', 1),
(646, 13, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:32:27', '2025-07-18 06:32:27', 1),
(647, 13, 227, 'New Booking', 'New booking found ', '2025-07-18 06:32:27', '2025-07-18 06:32:27', 1),
(648, 13, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 06:33:01', '2025-07-18 06:33:01', 1),
(649, 13, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 06:33:01', '2025-07-18 06:33:01', 1),
(650, 13, 228, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 06:33:20', '2025-07-18 06:33:20', 1),
(651, 13, 227, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 06:33:20', '2025-07-18 06:33:20', 1),
(652, 13, 228, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 06:33:25', '2025-07-18 06:33:25', 1),
(653, 13, 227, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 06:33:25', '2025-07-18 06:33:25', 1),
(654, 14, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:35:00', '2025-07-18 06:35:00', 1),
(655, 14, 227, 'New Booking', 'New booking found ', '2025-07-18 06:35:01', '2025-07-18 06:35:01', 1),
(656, 14, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 06:35:17', '2025-07-18 06:35:17', 1),
(657, 14, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 06:35:17', '2025-07-18 06:35:17', 1),
(658, 14, 228, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 06:35:27', '2025-07-18 06:35:27', 1),
(659, 14, 227, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 06:35:27', '2025-07-18 06:35:27', 1),
(660, 14, 228, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 06:35:44', '2025-07-18 06:35:44', 1),
(661, 14, 227, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 06:35:44', '2025-07-18 06:35:44', 1),
(662, 15, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:36:36', '2025-07-18 06:36:36', 1),
(663, 15, 227, 'New Booking', 'New booking found ', '2025-07-18 06:36:36', '2025-07-18 06:36:36', 1),
(664, 15, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 06:37:43', '2025-07-18 06:37:43', 1),
(665, 15, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 06:37:43', '2025-07-18 06:37:43', 1),
(666, 15, 228, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 06:39:30', '2025-07-18 06:39:30', 1),
(667, 15, 227, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 06:39:30', '2025-07-18 06:39:30', 1),
(668, 15, 228, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 06:40:03', '2025-07-18 06:40:03', 1),
(669, 15, 227, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 06:40:03', '2025-07-18 06:40:03', 1),
(670, 16, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:55:32', '2025-07-18 06:55:32', 1),
(671, 16, 227, 'New Booking', 'New booking found ', '2025-07-18 06:55:32', '2025-07-18 06:55:32', 1),
(672, 17, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:56:43', '2025-07-18 06:56:43', 1),
(673, 17, 227, 'New Booking', 'New booking found ', '2025-07-18 06:56:43', '2025-07-18 06:56:43', 1),
(674, 18, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:56:58', '2025-07-18 06:56:58', 1),
(675, 18, 227, 'New Booking', 'New booking found ', '2025-07-18 06:56:58', '2025-07-18 06:56:58', 1),
(676, 19, 228, 'New Booking', 'New Booking Created', '2025-07-18 06:57:47', '2025-07-18 06:57:47', 1),
(677, 19, 227, 'New Booking', 'New booking found ', '2025-07-18 06:57:47', '2025-07-18 06:57:47', 1),
(678, 20, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:02:24', '2025-07-18 07:02:24', 1),
(679, 20, 227, 'New Booking', 'New booking found ', '2025-07-18 07:02:25', '2025-07-18 07:02:25', 1),
(680, 21, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:03:10', '2025-07-18 07:03:10', 1),
(681, 21, 227, 'New Booking', 'New booking found ', '2025-07-18 07:03:11', '2025-07-18 07:03:11', 1),
(682, 21, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 07:03:42', '2025-07-18 07:03:42', 1),
(683, 21, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 07:03:42', '2025-07-18 07:03:42', 1),
(684, 21, 228, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 07:04:05', '2025-07-18 07:04:05', 1),
(685, 21, 227, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 07:04:05', '2025-07-18 07:04:05', 1),
(686, 21, 228, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 07:04:15', '2025-07-18 07:04:15', 1),
(687, 21, 227, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 07:04:15', '2025-07-18 07:04:15', 1),
(688, 22, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:04:40', '2025-07-18 07:04:40', 1),
(689, 22, 227, 'New Booking', 'New booking found ', '2025-07-18 07:04:40', '2025-07-18 07:04:40', 1),
(690, 22, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 07:05:05', '2025-07-18 07:05:05', 1),
(691, 22, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 07:05:05', '2025-07-18 07:05:05', 1),
(692, 22, 228, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-18 07:13:03', '2025-07-18 07:13:03', 1),
(693, 22, 227, 'Booking Cancelled', 'You have cancelled the booking of Sarthak', '2025-07-18 07:13:03', '2025-07-18 07:13:03', 1),
(694, 23, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:17:21', '2025-07-18 07:17:21', 1),
(695, 23, 227, 'New Booking', 'New booking found ', '2025-07-18 07:17:22', '2025-07-18 07:17:22', 1),
(696, 24, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:23:30', '2025-07-18 07:23:30', 1),
(697, 24, 227, 'New Booking', 'New booking found ', '2025-07-18 07:23:31', '2025-07-18 07:23:31', 1),
(698, 25, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:23:47', '2025-07-18 07:23:47', 1),
(699, 25, 227, 'New Booking', 'New booking found ', '2025-07-18 07:23:47', '2025-07-18 07:23:47', 1),
(700, 26, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:23:58', '2025-07-18 07:23:58', 1),
(701, 26, 227, 'New Booking', 'New booking found ', '2025-07-18 07:23:58', '2025-07-18 07:23:58', 1),
(702, 27, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:29:18', '2025-07-18 07:29:18', 1),
(703, 27, 227, 'New Booking', 'New booking found ', '2025-07-18 07:29:18', '2025-07-18 07:29:18', 1),
(704, 28, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:29:37', '2025-07-18 07:29:37', 1),
(705, 28, 227, 'New Booking', 'New booking found ', '2025-07-18 07:29:37', '2025-07-18 07:29:37', 1),
(706, 29, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:37:58', '2025-07-18 07:37:58', 1),
(707, 29, 227, 'New Booking', 'New booking found ', '2025-07-18 07:37:58', '2025-07-18 07:37:58', 1),
(708, 30, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:57:48', '2025-07-18 07:57:48', 1),
(709, 30, 227, 'New Booking', 'New booking found ', '2025-07-18 07:57:49', '2025-07-18 07:57:49', 1),
(710, 31, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:58:00', '2025-07-18 07:58:00', 1),
(711, 31, 227, 'New Booking', 'New booking found ', '2025-07-18 07:58:00', '2025-07-18 07:58:00', 1),
(712, 32, 228, 'New Booking', 'New Booking Created', '2025-07-18 07:58:16', '2025-07-18 07:58:16', 1),
(713, 32, 227, 'New Booking', 'New booking found ', '2025-07-18 07:58:16', '2025-07-18 07:58:16', 1),
(714, 33, 228, 'New Booking', 'New Booking Created', '2025-07-18 08:17:24', '2025-07-18 08:17:24', 1),
(715, 33, 227, 'New Booking', 'New booking found ', '2025-07-18 08:17:24', '2025-07-18 08:17:24', 1),
(716, 33, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 08:18:36', '2025-07-18 08:18:36', 1),
(717, 33, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 08:18:36', '2025-07-18 08:18:36', 1),
(718, 34, 228, 'New Booking', 'New Booking Created', '2025-07-18 08:18:39', '2025-07-18 08:18:39', 1),
(719, 34, 227, 'New Booking', 'New booking found ', '2025-07-18 08:18:40', '2025-07-18 08:18:40', 1),
(720, 33, 228, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-18 08:18:45', '2025-07-18 08:18:45', 1),
(721, 35, 228, 'New Booking', 'New Booking Created', '2025-07-18 08:48:26', '2025-07-18 08:48:26', 1),
(722, 35, 227, 'New Booking', 'New booking found ', '2025-07-18 08:48:26', '2025-07-18 08:48:26', 1),
(723, 36, 228, 'New Booking', 'New Booking Created', '2025-07-18 08:58:57', '2025-07-18 08:58:57', 1),
(724, 36, 227, 'New Booking', 'New booking found ', '2025-07-18 08:58:57', '2025-07-18 08:58:57', 1),
(725, 37, 228, 'New Booking', 'New Booking Created', '2025-07-18 08:59:16', '2025-07-18 08:59:16', 1),
(726, 37, 227, 'New Booking', 'New booking found ', '2025-07-18 08:59:17', '2025-07-18 08:59:17', 1),
(727, 38, 228, 'New Booking', 'New Booking Created', '2025-07-18 09:00:42', '2025-07-18 09:00:42', 1),
(728, 38, 227, 'New Booking', 'New booking found ', '2025-07-18 09:00:42', '2025-07-18 09:00:42', 1),
(729, 39, 228, 'New Booking', 'New Booking Created', '2025-07-18 09:01:01', '2025-07-18 09:01:01', 1),
(730, 39, 227, 'New Booking', 'New booking found ', '2025-07-18 09:01:02', '2025-07-18 09:01:02', 1),
(731, 40, 228, 'New Booking', 'New Booking Created', '2025-07-18 09:27:27', '2025-07-18 09:27:27', 1),
(732, 40, 227, 'New Booking', 'New booking found ', '2025-07-18 09:27:28', '2025-07-18 09:27:28', 1),
(733, 41, 228, 'New Booking', 'New Booking Created', '2025-07-18 09:27:43', '2025-07-18 09:27:43', 1),
(734, 41, 227, 'New Booking', 'New booking found ', '2025-07-18 09:27:43', '2025-07-18 09:27:43', 1),
(735, 39, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 09:30:00', '2025-07-18 09:30:00', 1),
(736, 39, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 09:30:00', '2025-07-18 09:30:00', 1),
(737, 39, 228, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 09:43:08', '2025-07-18 09:43:08', 1),
(738, 39, 227, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 09:43:08', '2025-07-18 09:43:08', 1),
(739, 39, 228, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 09:50:16', '2025-07-18 09:50:16', 1),
(740, 39, 227, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 09:50:16', '2025-07-18 09:50:16', 1),
(741, 42, 228, 'New Booking', 'New Booking Created', '2025-07-18 09:52:07', '2025-07-18 09:52:07', 1),
(742, 42, 227, 'New Booking', 'New booking found ', '2025-07-18 09:52:07', '2025-07-18 09:52:07', 1),
(743, 42, 228, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 09:52:28', '2025-07-18 09:52:28', 1),
(744, 42, 227, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 09:52:28', '2025-07-18 09:52:28', 1),
(745, 42, 228, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-18 10:31:12', '2025-07-18 10:31:12', 1),
(746, 42, 227, 'Booking Cancelled', 'You have cancelled the booking of Sarthak', '2025-07-18 10:31:12', '2025-07-18 10:31:12', 1),
(747, 1, 230, 'New Booking', 'New Booking Created', '2025-07-18 10:52:43', '2025-07-18 10:52:43', 1),
(748, 2, 230, 'New Booking', 'New Booking Created', '2025-07-18 10:52:54', '2025-07-18 10:52:54', 1),
(749, 2, 231, 'New Booking', 'New booking found ', '2025-07-18 10:52:54', '2025-07-18 10:52:54', 1),
(750, 2, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 10:53:17', '2025-07-18 10:53:17', 1),
(751, 2, 231, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 10:53:17', '2025-07-18 10:53:17', 1),
(752, 2, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 10:54:53', '2025-07-18 10:54:53', 1),
(753, 2, 231, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 10:54:53', '2025-07-18 10:54:53', 1),
(754, 1, 230, 'New Booking', 'New Booking Created', '2025-07-18 11:45:07', '2025-07-18 11:45:07', 1),
(755, 2, 230, 'New Booking', 'New Booking Created', '2025-07-18 11:45:38', '2025-07-18 11:45:38', 1),
(756, 2, 232, 'New Booking', 'New booking found ', '2025-07-18 11:45:38', '2025-07-18 11:45:38', 1),
(757, 2, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 11:45:43', '2025-07-18 11:45:43', 1),
(758, 2, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 11:45:43', '2025-07-18 11:45:43', 1),
(759, 2, 230, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-18 11:57:04', '2025-07-18 11:57:04', 1),
(760, 3, 230, 'New Booking', 'New Booking Created', '2025-07-18 11:58:43', '2025-07-18 11:58:43', 1),
(761, 3, 232, 'New Booking', 'New booking found ', '2025-07-18 11:58:43', '2025-07-18 11:58:43', 1),
(762, 3, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 11:58:51', '2025-07-18 11:58:51', 1),
(763, 3, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 11:58:51', '2025-07-18 11:58:51', 1),
(764, 3, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 11:59:30', '2025-07-18 11:59:30', 1),
(765, 3, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 11:59:30', '2025-07-18 11:59:30', 1),
(766, 3, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 12:00:27', '2025-07-18 12:00:27', 1),
(767, 3, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 12:00:27', '2025-07-18 12:00:27', 1),
(768, 4, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:01:11', '2025-07-18 12:01:11', 1),
(769, 4, 232, 'New Booking', 'New booking found ', '2025-07-18 12:01:11', '2025-07-18 12:01:11', 1),
(770, 4, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 12:01:18', '2025-07-18 12:01:18', 1),
(771, 4, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 12:01:18', '2025-07-18 12:01:18', 1),
(772, 4, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 12:09:52', '2025-07-18 12:09:52', 1),
(773, 4, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 12:09:52', '2025-07-18 12:09:52', 1),
(774, 4, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 12:30:03', '2025-07-18 12:30:03', 1),
(775, 4, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 12:30:03', '2025-07-18 12:30:03', 1),
(776, 5, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:31:03', '2025-07-18 12:31:03', 1),
(777, 5, 232, 'New Booking', 'New booking found ', '2025-07-18 12:31:04', '2025-07-18 12:31:04', 1),
(778, 5, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 12:31:10', '2025-07-18 12:31:10', 1),
(779, 5, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 12:31:10', '2025-07-18 12:31:10', 1),
(780, 5, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 12:31:57', '2025-07-18 12:31:57', 1),
(781, 5, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 12:31:57', '2025-07-18 12:31:57', 1),
(782, 5, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 12:32:20', '2025-07-18 12:32:20', 1),
(783, 5, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 12:32:20', '2025-07-18 12:32:20', 1),
(784, 6, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:32:59', '2025-07-18 12:32:59', 1),
(785, 6, 232, 'New Booking', 'New booking found ', '2025-07-18 12:32:59', '2025-07-18 12:32:59', 1),
(786, 6, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 12:33:06', '2025-07-18 12:33:06', 1),
(787, 6, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 12:33:06', '2025-07-18 12:33:06', 1),
(788, 6, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 12:33:29', '2025-07-18 12:33:29', 1),
(789, 6, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 12:33:29', '2025-07-18 12:33:29', 1),
(790, 6, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 12:34:01', '2025-07-18 12:34:01', 1),
(791, 6, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 12:34:01', '2025-07-18 12:34:01', 1),
(792, 7, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:35:23', '2025-07-18 12:35:23', 1),
(793, 7, 232, 'New Booking', 'New booking found ', '2025-07-18 12:35:24', '2025-07-18 12:35:24', 1),
(794, 7, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 12:35:31', '2025-07-18 12:35:31', 1),
(795, 7, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 12:35:31', '2025-07-18 12:35:31', 1),
(796, 7, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 12:36:13', '2025-07-18 12:36:13', 1),
(797, 7, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 12:36:13', '2025-07-18 12:36:13', 1),
(798, 7, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 12:37:24', '2025-07-18 12:37:24', 1),
(799, 7, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 12:37:24', '2025-07-18 12:37:24', 1),
(800, 8, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:39:32', '2025-07-18 12:39:32', 1),
(801, 8, 232, 'New Booking', 'New booking found ', '2025-07-18 12:39:33', '2025-07-18 12:39:33', 1),
(802, 8, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 12:39:39', '2025-07-18 12:39:39', 1),
(803, 8, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 12:39:39', '2025-07-18 12:39:39', 1),
(804, 8, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 12:41:29', '2025-07-18 12:41:29', 1),
(805, 8, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 12:41:29', '2025-07-18 12:41:29', 1),
(806, 8, 230, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-18 12:42:26', '2025-07-18 12:42:26', 1),
(807, 9, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:43:01', '2025-07-18 12:43:01', 1),
(808, 1, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:45:09', '2025-07-18 12:45:09', 1),
(809, 1, 230, 'New Booking', 'New Booking Created', '2025-07-18 12:52:03', '2025-07-18 12:52:03', 1),
(810, 1, 232, 'New Booking', 'New booking found ', '2025-07-18 12:52:03', '2025-07-18 12:52:03', 1),
(811, 1, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 12:52:49', '2025-07-18 12:52:49', 1),
(812, 1, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 12:52:49', '2025-07-18 12:52:49', 1),
(813, 1, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 12:53:08', '2025-07-18 12:53:08', 1),
(814, 1, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 12:53:08', '2025-07-18 12:53:08', 1),
(815, 1, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 12:53:36', '2025-07-18 12:53:36', 1),
(816, 1, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 12:53:36', '2025-07-18 12:53:36', 1),
(817, 2, 230, 'New Booking', 'New Booking Created', '2025-07-18 13:06:57', '2025-07-18 13:06:57', 1),
(818, 2, 232, 'New Booking', 'New booking found ', '2025-07-18 13:06:57', '2025-07-18 13:06:57', 1),
(819, 2, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 13:07:17', '2025-07-18 13:07:17', 1),
(820, 2, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 13:07:17', '2025-07-18 13:07:17', 1),
(821, 2, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 13:07:46', '2025-07-18 13:07:46', 1),
(822, 2, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 13:07:46', '2025-07-18 13:07:46', 1),
(823, 2, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 13:08:46', '2025-07-18 13:08:46', 1),
(824, 2, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 13:08:46', '2025-07-18 13:08:46', 1),
(825, 3, 230, 'New Booking', 'New Booking Created', '2025-07-18 13:16:05', '2025-07-18 13:16:05', 1),
(826, 3, 232, 'New Booking', 'New booking found ', '2025-07-18 13:16:05', '2025-07-18 13:16:05', 1),
(827, 3, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 13:16:11', '2025-07-18 13:16:11', 1),
(828, 3, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 13:16:11', '2025-07-18 13:16:11', 1),
(829, 3, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 13:17:25', '2025-07-18 13:17:25', 1),
(830, 3, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 13:17:25', '2025-07-18 13:17:25', 1),
(831, 3, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 13:18:57', '2025-07-18 13:18:57', 1),
(832, 3, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 13:18:57', '2025-07-18 13:18:57', 1),
(833, 4, 230, 'New Booking', 'New Booking Created', '2025-07-18 13:20:38', '2025-07-18 13:20:38', 1),
(834, 4, 232, 'New Booking', 'New booking found ', '2025-07-18 13:20:38', '2025-07-18 13:20:38', 1),
(835, 4, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-18 13:20:57', '2025-07-18 13:20:57', 1),
(836, 4, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-18 13:20:57', '2025-07-18 13:20:57', 1),
(837, 4, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-18 13:21:58', '2025-07-18 13:21:58', 1),
(838, 4, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-18 13:21:58', '2025-07-18 13:21:58', 1),
(839, 4, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-18 13:22:46', '2025-07-18 13:22:46', 1),
(840, 4, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-18 13:22:46', '2025-07-18 13:22:46', 1),
(841, 5, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:13:00', '2025-07-18 16:13:00', 1),
(842, 6, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:14:41', '2025-07-18 16:14:41', 1),
(843, 6, 233, 'New Booking', 'New booking found ', '2025-07-18 16:14:41', '2025-07-18 16:14:41', 1),
(844, 7, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:15:12', '2025-07-18 16:15:12', 1),
(845, 7, 233, 'New Booking', 'New booking found ', '2025-07-18 16:15:12', '2025-07-18 16:15:12', 1),
(846, 7, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-18 16:15:29', '2025-07-18 16:15:29', 1),
(847, 7, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-18 16:15:29', '2025-07-18 16:15:29', 1),
(848, 7, 234, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-18 16:16:09', '2025-07-18 16:16:09', 1),
(849, 7, 233, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-18 16:16:09', '2025-07-18 16:16:09', 1),
(850, 7, 234, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-18 16:16:47', '2025-07-18 16:16:47', 1),
(851, 7, 233, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-18 16:16:47', '2025-07-18 16:16:47', 1),
(852, 8, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:17:22', '2025-07-18 16:17:22', 1),
(853, 8, 233, 'New Booking', 'New booking found ', '2025-07-18 16:17:23', '2025-07-18 16:17:23', 1),
(854, 8, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-18 16:17:34', '2025-07-18 16:17:34', 1),
(855, 8, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-18 16:17:34', '2025-07-18 16:17:34', 1),
(856, 8, 234, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-18 16:17:58', '2025-07-18 16:17:58', 1),
(857, 9, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:23:45', '2025-07-18 16:23:45', 1),
(858, 10, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:24:17', '2025-07-18 16:24:17', 1),
(859, 10, 235, 'New Booking', 'New booking found ', '2025-07-18 16:24:17', '2025-07-18 16:24:17', 1),
(860, 10, 234, 'Booking Accepted', 'Your booking has been accepted by Kennedy', '2025-07-18 16:24:30', '2025-07-18 16:24:30', 1);
INSERT INTO `tbl_notification` (`id`, `booking_id`, `user_id`, `subject`, `description`, `created_at`, `updated_at`, `status`) VALUES
(861, 10, 235, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-18 16:24:30', '2025-07-18 16:24:30', 1),
(862, 10, 234, 'Booking Activated', 'Your booking has been activated by Kennedy', '2025-07-18 16:24:42', '2025-07-18 16:24:42', 1),
(863, 10, 235, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-18 16:24:42', '2025-07-18 16:24:42', 1),
(864, 10, 234, 'Booking Completed', 'Your booking has been completed by Kennedy', '2025-07-18 16:25:13', '2025-07-18 16:25:13', 1),
(865, 10, 235, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-18 16:25:13', '2025-07-18 16:25:13', 1),
(866, 11, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:25:47', '2025-07-18 16:25:47', 1),
(867, 12, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:26:01', '2025-07-18 16:26:01', 1),
(868, 12, 235, 'New Booking', 'New booking found ', '2025-07-18 16:26:02', '2025-07-18 16:26:02', 1),
(869, 12, 234, 'Booking Accepted', 'Your booking has been accepted by Kennedy', '2025-07-18 16:26:12', '2025-07-18 16:26:12', 1),
(870, 12, 235, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-18 16:26:12', '2025-07-18 16:26:12', 1),
(871, 12, 234, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-18 16:26:40', '2025-07-18 16:26:40', 1),
(872, 13, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:27:48', '2025-07-18 16:27:48', 1),
(873, 14, 234, 'New Booking', 'New Booking Created', '2025-07-18 16:28:07', '2025-07-18 16:28:07', 1),
(874, 15, 230, 'New Booking', 'New Booking Created', '2025-07-19 05:02:21', '2025-07-19 05:02:21', 1),
(875, 15, 232, 'New Booking', 'New booking found ', '2025-07-19 05:02:21', '2025-07-19 05:02:21', 1),
(876, 15, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 05:02:59', '2025-07-19 05:02:59', 1),
(877, 15, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 05:02:59', '2025-07-19 05:02:59', 1),
(878, 15, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 05:03:19', '2025-07-19 05:03:19', 1),
(879, 15, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 05:03:19', '2025-07-19 05:03:19', 1),
(880, 15, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 05:08:05', '2025-07-19 05:08:05', 1),
(881, 15, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 05:08:05', '2025-07-19 05:08:05', 1),
(882, 16, 230, 'New Booking', 'New Booking Created', '2025-07-19 05:10:04', '2025-07-19 05:10:04', 1),
(883, 16, 232, 'New Booking', 'New booking found ', '2025-07-19 05:10:04', '2025-07-19 05:10:04', 1),
(884, 16, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 05:10:10', '2025-07-19 05:10:10', 1),
(885, 16, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 05:10:10', '2025-07-19 05:10:10', 1),
(886, 16, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 05:10:52', '2025-07-19 05:10:52', 1),
(887, 16, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 05:10:52', '2025-07-19 05:10:52', 1),
(888, 16, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 05:33:34', '2025-07-19 05:33:34', 1),
(889, 16, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 05:33:34', '2025-07-19 05:33:34', 1),
(890, 17, 230, 'New Booking', 'New Booking Created', '2025-07-19 05:36:03', '2025-07-19 05:36:03', 1),
(891, 17, 232, 'New Booking', 'New booking found ', '2025-07-19 05:36:03', '2025-07-19 05:36:03', 1),
(892, 18, 230, 'New Booking', 'New Booking Created', '2025-07-19 05:36:03', '2025-07-19 05:36:03', 1),
(893, 18, 232, 'New Booking', 'New booking found ', '2025-07-19 05:36:04', '2025-07-19 05:36:04', 1),
(894, 18, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 05:36:18', '2025-07-19 05:36:18', 1),
(895, 18, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 05:36:18', '2025-07-19 05:36:18', 1),
(896, 18, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 05:37:13', '2025-07-19 05:37:13', 1),
(897, 18, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 05:37:13', '2025-07-19 05:37:13', 1),
(898, 18, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 05:37:31', '2025-07-19 05:37:31', 1),
(899, 18, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 05:37:31', '2025-07-19 05:37:31', 1),
(900, 19, 236, 'New Booking', 'New Booking Created', '2025-07-19 05:46:13', '2025-07-19 05:46:13', 1),
(901, 19, 232, 'New Booking', 'New booking found ', '2025-07-19 05:46:14', '2025-07-19 05:46:14', 1),
(902, 19, 236, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 05:46:23', '2025-07-19 05:46:23', 1),
(903, 19, 232, 'Booking Accepted', 'You have accepted the booking of Ujala', '2025-07-19 05:46:23', '2025-07-19 05:46:23', 1),
(904, 19, 236, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 05:46:59', '2025-07-19 05:46:59', 1),
(905, 19, 232, 'Booking Activated', 'You have activated the booking of Ujala', '2025-07-19 05:46:59', '2025-07-19 05:46:59', 1),
(906, 19, 236, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 05:47:25', '2025-07-19 05:47:25', 1),
(907, 19, 232, 'Booking Completed', 'You have completed the booking of Ujala', '2025-07-19 05:47:25', '2025-07-19 05:47:25', 1),
(908, 20, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:10:12', '2025-07-19 06:10:12', 1),
(909, 20, 232, 'New Booking', 'New booking found ', '2025-07-19 06:10:13', '2025-07-19 06:10:13', 1),
(910, 20, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:17:22', '2025-07-19 06:17:22', 1),
(911, 20, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:17:22', '2025-07-19 06:17:22', 1),
(912, 20, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:17:50', '2025-07-19 06:17:50', 1),
(913, 20, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:17:50', '2025-07-19 06:17:50', 1),
(914, 20, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:19:03', '2025-07-19 06:19:03', 1),
(915, 20, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:19:03', '2025-07-19 06:19:03', 1),
(916, 21, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:20:59', '2025-07-19 06:20:59', 1),
(917, 21, 232, 'New Booking', 'New booking found ', '2025-07-19 06:20:59', '2025-07-19 06:20:59', 1),
(918, 21, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:21:07', '2025-07-19 06:21:07', 1),
(919, 21, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:21:07', '2025-07-19 06:21:07', 1),
(920, 21, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:21:20', '2025-07-19 06:21:20', 1),
(921, 21, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:21:20', '2025-07-19 06:21:20', 1),
(922, 21, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:21:27', '2025-07-19 06:21:27', 1),
(923, 21, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:21:27', '2025-07-19 06:21:27', 1),
(924, 22, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:27:54', '2025-07-19 06:27:54', 1),
(925, 22, 232, 'New Booking', 'New booking found ', '2025-07-19 06:27:54', '2025-07-19 06:27:54', 1),
(926, 22, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:28:02', '2025-07-19 06:28:02', 1),
(927, 22, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:28:02', '2025-07-19 06:28:02', 1),
(928, 22, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:28:17', '2025-07-19 06:28:17', 1),
(929, 22, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:28:17', '2025-07-19 06:28:17', 1),
(930, 22, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:28:27', '2025-07-19 06:28:27', 1),
(931, 22, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:28:27', '2025-07-19 06:28:27', 1),
(932, 23, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:31:00', '2025-07-19 06:31:00', 1),
(933, 23, 232, 'New Booking', 'New booking found ', '2025-07-19 06:31:01', '2025-07-19 06:31:01', 1),
(934, 23, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:31:12', '2025-07-19 06:31:12', 1),
(935, 23, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:31:12', '2025-07-19 06:31:12', 1),
(936, 23, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:31:26', '2025-07-19 06:31:26', 1),
(937, 23, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:31:26', '2025-07-19 06:31:26', 1),
(938, 23, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:31:34', '2025-07-19 06:31:34', 1),
(939, 23, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:31:34', '2025-07-19 06:31:34', 1),
(940, 24, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:33:02', '2025-07-19 06:33:02', 1),
(941, 24, 232, 'New Booking', 'New booking found ', '2025-07-19 06:33:03', '2025-07-19 06:33:03', 1),
(942, 24, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:33:15', '2025-07-19 06:33:15', 1),
(943, 24, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:33:15', '2025-07-19 06:33:15', 1),
(944, 24, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:34:33', '2025-07-19 06:34:33', 1),
(945, 24, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:34:33', '2025-07-19 06:34:33', 1),
(946, 24, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:34:40', '2025-07-19 06:34:40', 1),
(947, 24, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:34:40', '2025-07-19 06:34:40', 1),
(948, 25, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:37:55', '2025-07-19 06:37:55', 1),
(949, 25, 232, 'New Booking', 'New booking found ', '2025-07-19 06:37:55', '2025-07-19 06:37:55', 1),
(950, 25, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:38:01', '2025-07-19 06:38:01', 1),
(951, 25, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:38:01', '2025-07-19 06:38:01', 1),
(952, 25, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:38:30', '2025-07-19 06:38:30', 1),
(953, 25, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:38:30', '2025-07-19 06:38:30', 1),
(954, 25, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:38:36', '2025-07-19 06:38:36', 1),
(955, 25, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:38:36', '2025-07-19 06:38:36', 1),
(956, 25, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:38:37', '2025-07-19 06:38:37', 1),
(957, 25, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:38:37', '2025-07-19 06:38:37', 1),
(958, 26, 230, 'New Booking', 'New Booking Created', '2025-07-19 06:43:33', '2025-07-19 06:43:33', 1),
(959, 26, 232, 'New Booking', 'New booking found ', '2025-07-19 06:43:33', '2025-07-19 06:43:33', 1),
(960, 26, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 06:43:37', '2025-07-19 06:43:37', 1),
(961, 26, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 06:43:37', '2025-07-19 06:43:37', 1),
(962, 26, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 06:43:44', '2025-07-19 06:43:44', 1),
(963, 26, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 06:43:44', '2025-07-19 06:43:44', 1),
(964, 26, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 06:43:52', '2025-07-19 06:43:52', 1),
(965, 26, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 06:43:52', '2025-07-19 06:43:52', 1),
(966, 27, 230, 'New Booking', 'New Booking Created', '2025-07-19 07:05:50', '2025-07-19 07:05:50', 1),
(967, 27, 232, 'New Booking', 'New booking found ', '2025-07-19 07:05:50', '2025-07-19 07:05:50', 1),
(968, 27, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 07:05:55', '2025-07-19 07:05:55', 1),
(969, 27, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 07:05:55', '2025-07-19 07:05:55', 1),
(970, 27, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 07:06:07', '2025-07-19 07:06:07', 1),
(971, 27, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 07:06:07', '2025-07-19 07:06:07', 1),
(972, 27, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 07:06:12', '2025-07-19 07:06:12', 1),
(973, 27, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 07:06:12', '2025-07-19 07:06:12', 1),
(974, 28, 230, 'New Booking', 'New Booking Created', '2025-07-19 07:18:50', '2025-07-19 07:18:50', 1),
(975, 28, 232, 'New Booking', 'New booking found ', '2025-07-19 07:18:51', '2025-07-19 07:18:51', 1),
(976, 28, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 07:18:56', '2025-07-19 07:18:56', 1),
(977, 28, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 07:18:56', '2025-07-19 07:18:56', 1),
(978, 28, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 07:19:04', '2025-07-19 07:19:04', 1),
(979, 28, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 07:19:04', '2025-07-19 07:19:04', 1),
(980, 28, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-19 07:19:10', '2025-07-19 07:19:10', 1),
(981, 28, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-19 07:19:10', '2025-07-19 07:19:10', 1),
(982, 29, 230, 'New Booking', 'New Booking Created', '2025-07-19 09:53:42', '2025-07-19 09:53:42', 1),
(983, 29, 232, 'New Booking', 'New booking found ', '2025-07-19 09:53:43', '2025-07-19 09:53:43', 1),
(984, 30, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:08:17', '2025-07-19 10:08:17', 1),
(985, 30, 232, 'New Booking', 'New booking found ', '2025-07-19 10:08:17', '2025-07-19 10:08:17', 1),
(986, 31, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:22:47', '2025-07-19 10:22:47', 1),
(987, 31, 232, 'New Booking', 'New booking found ', '2025-07-19 10:22:47', '2025-07-19 10:22:47', 1),
(988, 31, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 10:22:52', '2025-07-19 10:22:52', 1),
(989, 31, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 10:22:52', '2025-07-19 10:22:52', 1),
(990, 31, 230, 'Booking Cancelled', 'Your booking has been cancelled by Fazlu Rehman', '2025-07-19 10:23:45', '2025-07-19 10:23:45', 1),
(991, 31, 232, 'Booking Cancelled', 'You have cancelled the booking of Sarthak', '2025-07-19 10:23:45', '2025-07-19 10:23:45', 1),
(992, 32, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:26:44', '2025-07-19 10:26:44', 1),
(993, 32, 232, 'New Booking', 'New booking found ', '2025-07-19 10:26:45', '2025-07-19 10:26:45', 1),
(994, 33, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:27:50', '2025-07-19 10:27:50', 1),
(995, 33, 232, 'New Booking', 'New booking found ', '2025-07-19 10:27:51', '2025-07-19 10:27:51', 1),
(996, 33, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-19 10:27:55', '2025-07-19 10:27:55', 1),
(997, 33, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-19 10:27:55', '2025-07-19 10:27:55', 1),
(998, 33, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-19 10:28:13', '2025-07-19 10:28:13', 1),
(999, 33, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-19 10:28:13', '2025-07-19 10:28:13', 1),
(1000, 33, 230, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-19 10:28:22', '2025-07-19 10:28:22', 1),
(1001, 34, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:34:43', '2025-07-19 10:34:43', 1),
(1002, 35, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:35:55', '2025-07-19 10:35:55', 1),
(1003, 36, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:36:42', '2025-07-19 10:36:42', 1),
(1004, 37, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:38:10', '2025-07-19 10:38:10', 1),
(1005, 38, 230, 'New Booking', 'New Booking Created', '2025-07-19 10:38:33', '2025-07-19 10:38:33', 1),
(1006, 39, 230, 'New Booking', 'New Booking Created', '2025-07-19 11:07:44', '2025-07-19 11:07:44', 1),
(1007, 40, 230, 'New Booking', 'New Booking Created', '2025-07-19 11:51:00', '2025-07-19 11:51:00', 1),
(1008, 41, 230, 'New Booking', 'New Booking Created', '2025-07-19 11:51:28', '2025-07-19 11:51:28', 1),
(1009, 42, 230, 'New Booking', 'New Booking Created', '2025-07-19 11:54:56', '2025-07-19 11:54:56', 1),
(1010, 43, 230, 'New Booking', 'New Booking Created', '2025-07-19 12:00:56', '2025-07-19 12:00:56', 1),
(1011, 44, 230, 'New Booking', 'New Booking Created', '2025-07-19 12:01:48', '2025-07-19 12:01:48', 1),
(1012, 45, 230, 'New Booking', 'New Booking Created', '2025-07-19 12:05:12', '2025-07-19 12:05:12', 1),
(1013, 46, 230, 'New Booking', 'New Booking Created', '2025-07-19 12:05:13', '2025-07-19 12:05:13', 1),
(1014, 47, 239, 'New Booking', 'New Booking Created', '2025-07-19 17:56:48', '2025-07-19 17:56:48', 1),
(1015, 48, 239, 'New Booking', 'New Booking Created', '2025-07-19 17:57:24', '2025-07-19 17:57:24', 1),
(1016, 48, 233, 'New Booking', 'New booking found ', '2025-07-19 17:57:24', '2025-07-19 17:57:24', 1),
(1017, 48, 239, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-19 17:57:45', '2025-07-19 17:57:45', 1),
(1018, 48, 233, 'Booking Accepted', 'You have accepted the booking of Kunal', '2025-07-19 17:57:45', '2025-07-19 17:57:45', 1),
(1019, 48, 239, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-19 17:58:30', '2025-07-19 17:58:30', 1),
(1020, 48, 233, 'Booking Activated', 'You have activated the booking of Kunal', '2025-07-19 17:58:30', '2025-07-19 17:58:30', 1),
(1021, 48, 239, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-19 17:58:53', '2025-07-19 17:58:53', 1),
(1022, 48, 233, 'Booking Completed', 'You have completed the booking of Kunal', '2025-07-19 17:58:53', '2025-07-19 17:58:53', 1),
(1023, 49, 239, 'New Booking', 'New Booking Created', '2025-07-19 18:00:37', '2025-07-19 18:00:37', 1),
(1024, 50, 234, 'New Booking', 'New Booking Created', '2025-07-20 10:10:06', '2025-07-20 10:10:06', 1),
(1025, 51, 234, 'New Booking', 'New Booking Created', '2025-07-20 10:10:48', '2025-07-20 10:10:48', 1),
(1026, 52, 234, 'New Booking', 'New Booking Created', '2025-07-20 10:11:36', '2025-07-20 10:11:36', 1),
(1027, 52, 233, 'New Booking', 'New booking found ', '2025-07-20 10:11:37', '2025-07-20 10:11:37', 1),
(1028, 52, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-20 10:11:47', '2025-07-20 10:11:47', 1),
(1029, 52, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-20 10:11:47', '2025-07-20 10:11:47', 1),
(1030, 52, 234, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-20 10:12:19', '2025-07-20 10:12:19', 1),
(1031, 52, 233, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-20 10:12:19', '2025-07-20 10:12:19', 1),
(1032, 52, 234, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-20 10:12:45', '2025-07-20 10:12:45', 1),
(1033, 52, 233, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-20 10:12:45', '2025-07-20 10:12:45', 1),
(1034, 53, 234, 'New Booking', 'New Booking Created', '2025-07-20 10:13:58', '2025-07-20 10:13:58', 1),
(1035, 53, 233, 'New Booking', 'New booking found ', '2025-07-20 10:13:59', '2025-07-20 10:13:59', 1),
(1036, 53, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-20 10:14:17', '2025-07-20 10:14:17', 1),
(1037, 53, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-20 10:14:17', '2025-07-20 10:14:17', 1),
(1038, 53, 234, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-20 10:14:41', '2025-07-20 10:14:41', 1),
(1039, 54, 234, 'New Booking', 'New Booking Created', '2025-07-20 10:15:14', '2025-07-20 10:15:14', 1),
(1040, 54, 233, 'New Booking', 'New booking found ', '2025-07-20 10:15:15', '2025-07-20 10:15:15', 1),
(1041, 54, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-20 10:15:25', '2025-07-20 10:15:25', 1),
(1042, 54, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-20 10:15:25', '2025-07-20 10:15:25', 1),
(1043, 54, 234, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-20 10:15:48', '2025-07-20 10:15:48', 1),
(1044, 54, 233, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-20 10:15:48', '2025-07-20 10:15:48', 1),
(1045, 54, 234, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-20 10:16:25', '2025-07-20 10:16:25', 1),
(1046, 54, 233, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-20 10:16:25', '2025-07-20 10:16:25', 1),
(1047, 55, 234, 'New Booking', 'New Booking Created', '2025-07-20 14:38:21', '2025-07-20 14:38:21', 1),
(1048, 56, 234, 'New Booking', 'New Booking Created', '2025-07-20 14:39:02', '2025-07-20 14:39:02', 1),
(1049, 56, 233, 'New Booking', 'New booking found ', '2025-07-20 14:39:03', '2025-07-20 14:39:03', 1),
(1050, 56, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-20 14:39:12', '2025-07-20 14:39:12', 1),
(1051, 56, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-20 14:39:12', '2025-07-20 14:39:12', 1),
(1052, 56, 234, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-20 14:39:36', '2025-07-20 14:39:36', 1),
(1053, 56, 233, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-20 14:39:36', '2025-07-20 14:39:36', 1),
(1054, 56, 234, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-20 14:40:08', '2025-07-20 14:40:08', 1),
(1055, 56, 233, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-20 14:40:08', '2025-07-20 14:40:08', 1),
(1056, 57, 234, 'New Booking', 'New Booking Created', '2025-07-20 14:41:13', '2025-07-20 14:41:13', 1),
(1057, 57, 233, 'New Booking', 'New booking found ', '2025-07-20 14:41:14', '2025-07-20 14:41:14', 1),
(1058, 58, 234, 'New Booking', 'New Booking Created', '2025-07-20 14:41:36', '2025-07-20 14:41:36', 1),
(1059, 58, 233, 'New Booking', 'New booking found ', '2025-07-20 14:41:36', '2025-07-20 14:41:36', 1),
(1060, 58, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-20 14:41:50', '2025-07-20 14:41:50', 1),
(1061, 58, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-20 14:41:50', '2025-07-20 14:41:50', 1),
(1062, 56, 234, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-20 19:01:16', '2025-07-20 19:01:16', 1),
(1063, 56, 233, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-20 19:01:16', '2025-07-20 19:01:16', 1),
(1064, 59, 239, 'New Booking', 'New Booking Created', '2025-07-20 19:22:27', '2025-07-20 19:22:27', 1),
(1065, 59, 233, 'New Booking', 'New booking found ', '2025-07-20 19:22:27', '2025-07-20 19:22:27', 1),
(1066, 59, 239, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-20 19:22:54', '2025-07-20 19:22:54', 1),
(1067, 59, 233, 'Booking Accepted', 'You have accepted the booking of Kunal', '2025-07-20 19:22:54', '2025-07-20 19:22:54', 1),
(1068, 59, 239, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-20 19:23:33', '2025-07-20 19:23:33', 1),
(1069, 59, 233, 'Booking Activated', 'You have activated the booking of Kunal', '2025-07-20 19:23:33', '2025-07-20 19:23:33', 1),
(1070, 59, 239, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-20 19:23:53', '2025-07-20 19:23:53', 1),
(1071, 59, 233, 'Booking Completed', 'You have completed the booking of Kunal', '2025-07-20 19:23:53', '2025-07-20 19:23:53', 1),
(1072, 60, 230, 'New Booking', 'New Booking Created', '2025-07-21 05:25:25', '2025-07-21 05:25:25', 1),
(1073, 61, 230, 'New Booking', 'New Booking Created', '2025-07-21 05:30:36', '2025-07-21 05:30:36', 1),
(1074, 62, 241, 'New Booking', 'New Booking Created', '2025-07-21 05:38:31', '2025-07-21 05:38:31', 1),
(1075, 63, 241, 'New Booking', 'New Booking Created', '2025-07-21 05:40:21', '2025-07-21 05:40:21', 1),
(1076, 63, 240, 'New Booking', 'New booking found ', '2025-07-21 05:40:22', '2025-07-21 05:40:22', 1),
(1077, 64, 241, 'New Booking', 'New Booking Created', '2025-07-21 05:40:45', '2025-07-21 05:40:45', 1),
(1078, 64, 240, 'New Booking', 'New booking found ', '2025-07-21 05:40:46', '2025-07-21 05:40:46', 1),
(1079, 64, 241, 'Booking Accepted', 'Your booking has been accepted by Dilkhush kumar', '2025-07-21 05:41:13', '2025-07-21 05:41:13', 1),
(1080, 64, 240, 'Booking Accepted', 'You have accepted the booking of Karan Sahani ji', '2025-07-21 05:41:13', '2025-07-21 05:41:13', 1),
(1081, 64, 241, 'Booking Activated', 'Your booking has been activated by Dilkhush kumar', '2025-07-21 05:42:38', '2025-07-21 05:42:38', 1),
(1082, 64, 240, 'Booking Activated', 'You have activated the booking of Karan Sahani ji', '2025-07-21 05:42:38', '2025-07-21 05:42:38', 1),
(1083, 64, 241, 'Booking Completed', 'Your booking has been completed by Dilkhush kumar', '2025-07-21 05:43:42', '2025-07-21 05:43:42', 1),
(1084, 64, 240, 'Booking Completed', 'You have completed the booking of Karan Sahani ji', '2025-07-21 05:43:42', '2025-07-21 05:43:42', 1),
(1085, 65, 230, 'New Booking', 'New Booking Created', '2025-07-21 05:53:05', '2025-07-21 05:53:05', 1),
(1086, 66, 241, 'New Booking', 'New Booking Created', '2025-07-21 06:09:41', '2025-07-21 06:09:41', 1),
(1087, 66, 240, 'New Booking', 'New booking found ', '2025-07-21 06:09:41', '2025-07-21 06:09:41', 1),
(1088, 67, 230, 'New Booking', 'New Booking Created', '2025-07-21 06:12:53', '2025-07-21 06:12:53', 1),
(1089, 68, 230, 'New Booking', 'New Booking Created', '2025-07-21 06:14:55', '2025-07-21 06:14:55', 1),
(1090, 68, 232, 'New Booking', 'New booking found ', '2025-07-21 06:14:55', '2025-07-21 06:14:55', 1),
(1091, 69, 230, 'New Booking', 'New Booking Created', '2025-07-21 06:16:27', '2025-07-21 06:16:27', 1),
(1092, 69, 232, 'New Booking', 'New booking found ', '2025-07-21 06:16:27', '2025-07-21 06:16:27', 1),
(1093, 69, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-21 06:16:31', '2025-07-21 06:16:31', 1),
(1094, 69, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-21 06:16:31', '2025-07-21 06:16:31', 1),
(1095, 69, 230, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-21 06:16:54', '2025-07-21 06:16:54', 1),
(1096, 70, 230, 'New Booking', 'New Booking Created', '2025-07-21 06:19:27', '2025-07-21 06:19:27', 1),
(1097, 70, 232, 'New Booking', 'New booking found ', '2025-07-21 06:19:27', '2025-07-21 06:19:27', 1),
(1098, 70, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-21 06:19:37', '2025-07-21 06:19:37', 1),
(1099, 70, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-21 06:19:37', '2025-07-21 06:19:37', 1),
(1100, 70, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-21 06:19:51', '2025-07-21 06:19:51', 1),
(1101, 70, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-21 06:19:51', '2025-07-21 06:19:51', 1),
(1102, 70, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-21 06:20:00', '2025-07-21 06:20:00', 1),
(1103, 70, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-21 06:20:00', '2025-07-21 06:20:00', 1),
(1104, 71, 230, 'New Booking', 'New Booking Created', '2025-07-21 06:26:11', '2025-07-21 06:26:11', 1),
(1105, 71, 232, 'New Booking', 'New booking found ', '2025-07-21 06:26:12', '2025-07-21 06:26:12', 1),
(1106, 71, 230, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-21 06:26:19', '2025-07-21 06:26:19', 1),
(1107, 71, 232, 'Booking Accepted', 'You have accepted the booking of Sarthak', '2025-07-21 06:26:19', '2025-07-21 06:26:19', 1),
(1108, 71, 230, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-21 06:26:35', '2025-07-21 06:26:35', 1),
(1109, 71, 232, 'Booking Activated', 'You have activated the booking of Sarthak', '2025-07-21 06:26:35', '2025-07-21 06:26:35', 1),
(1110, 71, 230, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-21 06:26:45', '2025-07-21 06:26:45', 1),
(1111, 71, 232, 'Booking Completed', 'You have completed the booking of Sarthak', '2025-07-21 06:26:45', '2025-07-21 06:26:45', 1),
(1112, 58, 234, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-21 07:51:45', '2025-07-21 07:51:45', 1),
(1113, 72, 234, 'New Booking', 'New Booking Created', '2025-07-21 07:53:01', '2025-07-21 07:53:01', 1),
(1114, 73, 234, 'New Booking', 'New Booking Created', '2025-07-21 07:53:37', '2025-07-21 07:53:37', 1),
(1115, 74, 234, 'New Booking', 'New Booking Created', '2025-07-21 07:54:56', '2025-07-21 07:54:56', 1),
(1116, 74, 233, 'New Booking', 'New booking found ', '2025-07-21 07:54:56', '2025-07-21 07:54:56', 1),
(1117, 74, 234, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-21 07:55:16', '2025-07-21 07:55:16', 1),
(1118, 74, 233, 'Booking Accepted', 'You have accepted the booking of Abhi', '2025-07-21 07:55:16', '2025-07-21 07:55:16', 1),
(1119, 74, 234, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-21 07:56:26', '2025-07-21 07:56:26', 1),
(1120, 74, 233, 'Booking Activated', 'You have activated the booking of Abhi', '2025-07-21 07:56:26', '2025-07-21 07:56:26', 1),
(1121, 74, 234, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-21 07:57:16', '2025-07-21 07:57:16', 1),
(1122, 74, 233, 'Booking Completed', 'You have completed the booking of Abhi', '2025-07-21 07:57:16', '2025-07-21 07:57:16', 1),
(1123, 75, 247, 'New Booking', 'New Booking Created', '2025-07-21 09:14:16', '2025-07-21 09:14:16', 1),
(1124, 76, 247, 'New Booking', 'New Booking Created', '2025-07-21 09:14:22', '2025-07-21 09:14:22', 1),
(1125, 1, 255, 'New Booking', 'New Booking Created', '2025-07-21 16:31:18', '2025-07-21 16:31:18', 1),
(1126, 2, 255, 'New Booking', 'New Booking Created', '2025-07-21 16:33:31', '2025-07-21 16:33:31', 1),
(1127, 3, 255, 'New Booking', 'New Booking Created', '2025-07-21 16:34:05', '2025-07-21 16:34:05', 1),
(1128, 3, 250, 'New Booking', 'New booking found ', '2025-07-21 16:34:06', '2025-07-21 16:34:06', 1),
(1129, 3, 255, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-21 16:34:18', '2025-07-21 16:34:18', 1),
(1130, 3, 250, 'Booking Accepted', 'You have accepted the booking of Abhi Chadha', '2025-07-21 16:34:18', '2025-07-21 16:34:18', 1),
(1131, 3, 255, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-21 16:34:42', '2025-07-21 16:34:42', 1),
(1132, 3, 250, 'Booking Activated', 'You have activated the booking of Abhi Chadha', '2025-07-21 16:34:42', '2025-07-21 16:34:42', 1),
(1133, 3, 255, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-21 16:35:20', '2025-07-21 16:35:20', 1),
(1134, 3, 250, 'Booking Completed', 'You have completed the booking of Abhi Chadha', '2025-07-21 16:35:20', '2025-07-21 16:35:20', 1),
(1135, 4, 257, 'New Booking', 'New Booking Created', '2025-07-22 07:16:06', '2025-07-22 07:16:06', 1),
(1136, 5, 257, 'New Booking', 'New Booking Created', '2025-07-22 07:16:33', '2025-07-22 07:16:33', 1),
(1137, 6, 257, 'New Booking', 'New Booking Created', '2025-07-22 07:17:08', '2025-07-22 07:17:08', 1),
(1138, 7, 257, 'New Booking', 'New Booking Created', '2025-07-22 07:18:19', '2025-07-22 07:18:19', 1),
(1139, 8, 257, 'New Booking', 'New Booking Created', '2025-07-22 07:19:42', '2025-07-22 07:19:42', 1),
(1140, 9, 266, 'New Booking', 'New Booking Created', '2025-07-23 03:00:45', '2025-07-23 03:00:45', 1),
(1141, 10, 268, 'New Booking', 'New Booking Created', '2025-07-23 03:44:16', '2025-07-23 03:44:16', 1),
(1142, 11, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:07:37', '2025-07-23 06:07:37', 1),
(1143, 12, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:08:19', '2025-07-23 06:08:19', 1),
(1144, 13, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:08:41', '2025-07-23 06:08:41', 1),
(1145, 14, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:09:42', '2025-07-23 06:09:42', 1),
(1146, 15, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:11:17', '2025-07-23 06:11:17', 1),
(1147, 16, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:46:24', '2025-07-23 06:46:24', 1),
(1148, 16, 275, 'New Booking', 'New booking found ', '2025-07-23 06:46:24', '2025-07-23 06:46:24', 1),
(1149, 17, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:46:44', '2025-07-23 06:46:44', 1),
(1150, 17, 275, 'New Booking', 'New booking found ', '2025-07-23 06:46:44', '2025-07-23 06:46:44', 1),
(1151, 17, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-23 06:50:26', '2025-07-23 06:50:26', 1),
(1152, 17, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-23 06:50:26', '2025-07-23 06:50:26', 1),
(1153, 17, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-23 06:50:45', '2025-07-23 06:50:45', 1),
(1154, 17, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-23 06:50:45', '2025-07-23 06:50:45', 1),
(1155, 17, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-23 06:50:54', '2025-07-23 06:50:54', 1),
(1156, 17, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-23 06:50:54', '2025-07-23 06:50:54', 1),
(1157, 18, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:51:26', '2025-07-23 06:51:26', 1),
(1158, 18, 275, 'New Booking', 'New booking found ', '2025-07-23 06:51:26', '2025-07-23 06:51:26', 1),
(1159, 18, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-23 06:51:35', '2025-07-23 06:51:35', 1),
(1160, 18, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-23 06:51:35', '2025-07-23 06:51:35', 1),
(1161, 18, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-23 06:51:57', '2025-07-23 06:51:57', 1),
(1162, 18, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-23 06:51:57', '2025-07-23 06:51:57', 1),
(1163, 18, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-23 06:52:37', '2025-07-23 06:52:37', 1),
(1164, 18, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-23 06:52:37', '2025-07-23 06:52:37', 1),
(1165, 19, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:53:03', '2025-07-23 06:53:03', 1),
(1166, 19, 275, 'New Booking', 'New booking found ', '2025-07-23 06:53:03', '2025-07-23 06:53:03', 1),
(1167, 19, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-23 06:53:18', '2025-07-23 06:53:18', 1),
(1168, 19, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-23 06:53:18', '2025-07-23 06:53:18', 1),
(1169, 19, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-23 06:59:01', '2025-07-23 06:59:01', 1),
(1170, 19, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-23 06:59:01', '2025-07-23 06:59:01', 1),
(1171, 19, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-23 06:59:16', '2025-07-23 06:59:16', 1),
(1172, 19, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-23 06:59:16', '2025-07-23 06:59:16', 1),
(1173, 20, 258, 'New Booking', 'New Booking Created', '2025-07-23 06:59:51', '2025-07-23 06:59:51', 1),
(1174, 20, 275, 'New Booking', 'New booking found ', '2025-07-23 06:59:51', '2025-07-23 06:59:51', 1),
(1175, 20, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-23 06:59:59', '2025-07-23 06:59:59', 1),
(1176, 20, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-23 06:59:59', '2025-07-23 06:59:59', 1),
(1177, 20, 258, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-23 07:00:03', '2025-07-23 07:00:03', 1),
(1178, 21, 258, 'New Booking', 'New Booking Created', '2025-07-23 07:00:53', '2025-07-23 07:00:53', 1),
(1179, 21, 275, 'New Booking', 'New booking found ', '2025-07-23 07:00:54', '2025-07-23 07:00:54', 1),
(1180, 22, 285, 'New Booking', 'New Booking Created', '2025-07-24 06:03:43', '2025-07-24 06:03:43', 1),
(1181, 23, 285, 'New Booking', 'New Booking Created', '2025-07-24 06:04:08', '2025-07-24 06:04:08', 1),
(1182, 24, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:34:51', '2025-07-24 06:34:51', 1),
(1183, 24, 286, 'New Booking', 'New booking found ', '2025-07-24 06:34:52', '2025-07-24 06:34:52', 1),
(1184, 24, 255, 'Booking Accepted', 'Your booking has been accepted by Ķeñnédý', '2025-07-24 06:35:03', '2025-07-24 06:35:03', 1),
(1185, 24, 286, 'Booking Accepted', 'You have accepted the booking of Abhi Chadha', '2025-07-24 06:35:03', '2025-07-24 06:35:03', 1),
(1186, 24, 255, 'Booking Activated', 'Your booking has been activated by Ķeñnédý', '2025-07-24 06:36:54', '2025-07-24 06:36:54', 1),
(1187, 24, 286, 'Booking Activated', 'You have activated the booking of Abhi Chadha', '2025-07-24 06:36:54', '2025-07-24 06:36:54', 1),
(1188, 24, 255, 'Booking Completed', 'Your booking has been completed by Ķeñnédý', '2025-07-24 06:37:21', '2025-07-24 06:37:21', 1),
(1189, 24, 286, 'Booking Completed', 'You have completed the booking of Abhi Chadha', '2025-07-24 06:37:21', '2025-07-24 06:37:21', 1),
(1190, 25, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:41:26', '2025-07-24 06:41:26', 1),
(1191, 26, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:41:48', '2025-07-24 06:41:48', 1),
(1192, 27, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:42:15', '2025-07-24 06:42:15', 1),
(1193, 27, 286, 'New Booking', 'New booking found ', '2025-07-24 06:42:16', '2025-07-24 06:42:16', 1),
(1194, 28, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:42:52', '2025-07-24 06:42:52', 1),
(1195, 28, 286, 'New Booking', 'New booking found ', '2025-07-24 06:42:53', '2025-07-24 06:42:53', 1),
(1196, 29, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:43:11', '2025-07-24 06:43:11', 1),
(1197, 30, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:43:23', '2025-07-24 06:43:23', 1),
(1198, 31, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:43:38', '2025-07-24 06:43:38', 1),
(1199, 32, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:44:17', '2025-07-24 06:44:17', 1),
(1200, 33, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:44:41', '2025-07-24 06:44:41', 1),
(1201, 34, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:44:58', '2025-07-24 06:44:58', 1),
(1202, 34, 286, 'New Booking', 'New booking found ', '2025-07-24 06:44:58', '2025-07-24 06:44:58', 1),
(1203, 34, 255, 'Booking Accepted', 'Your booking has been accepted by Ķeñnédý', '2025-07-24 06:45:05', '2025-07-24 06:45:05', 1),
(1204, 34, 286, 'Booking Accepted', 'You have accepted the booking of Abhi Chadha', '2025-07-24 06:45:05', '2025-07-24 06:45:05', 1),
(1205, 34, 255, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-24 06:45:30', '2025-07-24 06:45:30', 1),
(1206, 35, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:47:29', '2025-07-24 06:47:29', 1),
(1207, 35, 286, 'New Booking', 'New booking found ', '2025-07-24 06:47:30', '2025-07-24 06:47:30', 1),
(1208, 36, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:48:12', '2025-07-24 06:48:12', 1),
(1209, 36, 286, 'New Booking', 'New booking found ', '2025-07-24 06:48:12', '2025-07-24 06:48:12', 1),
(1210, 37, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:48:41', '2025-07-24 06:48:41', 1),
(1211, 37, 286, 'New Booking', 'New booking found ', '2025-07-24 06:48:42', '2025-07-24 06:48:42', 1),
(1212, 38, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:50:41', '2025-07-24 06:50:41', 1),
(1213, 38, 286, 'New Booking', 'New booking found ', '2025-07-24 06:50:42', '2025-07-24 06:50:42', 1),
(1214, 39, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:51:21', '2025-07-24 06:51:21', 1),
(1215, 39, 286, 'New Booking', 'New booking found ', '2025-07-24 06:51:21', '2025-07-24 06:51:21', 1),
(1216, 40, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:51:36', '2025-07-24 06:51:36', 1),
(1217, 40, 286, 'New Booking', 'New booking found ', '2025-07-24 06:51:37', '2025-07-24 06:51:37', 1),
(1218, 41, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:52:05', '2025-07-24 06:52:05', 1),
(1219, 41, 286, 'New Booking', 'New booking found ', '2025-07-24 06:52:05', '2025-07-24 06:52:05', 1),
(1220, 42, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:52:51', '2025-07-24 06:52:51', 1),
(1221, 42, 286, 'New Booking', 'New booking found ', '2025-07-24 06:52:51', '2025-07-24 06:52:51', 1),
(1222, 43, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:53:07', '2025-07-24 06:53:07', 1),
(1223, 43, 286, 'New Booking', 'New booking found ', '2025-07-24 06:53:08', '2025-07-24 06:53:08', 1),
(1224, 44, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:54:19', '2025-07-24 06:54:19', 1),
(1225, 44, 286, 'New Booking', 'New booking found ', '2025-07-24 06:54:20', '2025-07-24 06:54:20', 1),
(1226, 45, 255, 'New Booking', 'New Booking Created', '2025-07-24 06:54:29', '2025-07-24 06:54:29', 1),
(1227, 45, 286, 'New Booking', 'New booking found ', '2025-07-24 06:54:29', '2025-07-24 06:54:29', 1),
(1228, 46, 258, 'New Booking', 'New Booking Created', '2025-07-24 07:44:19', '2025-07-24 07:44:19', 1),
(1229, 46, 275, 'New Booking', 'New booking found ', '2025-07-24 07:44:20', '2025-07-24 07:44:20', 1),
(1230, 46, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-24 07:44:27', '2025-07-24 07:44:27', 1),
(1231, 46, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-24 07:44:27', '2025-07-24 07:44:27', 1),
(1232, 46, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-24 07:47:42', '2025-07-24 07:47:42', 1),
(1233, 46, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-24 07:47:42', '2025-07-24 07:47:42', 1),
(1234, 46, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-24 07:47:50', '2025-07-24 07:47:50', 1),
(1235, 46, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-24 07:47:50', '2025-07-24 07:47:50', 1),
(1236, 47, 258, 'New Booking', 'New Booking Created', '2025-07-24 07:49:23', '2025-07-24 07:49:23', 1),
(1237, 47, 275, 'New Booking', 'New booking found ', '2025-07-24 07:49:23', '2025-07-24 07:49:23', 1),
(1238, 47, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-24 07:50:00', '2025-07-24 07:50:00', 1),
(1239, 47, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-24 07:50:00', '2025-07-24 07:50:00', 1),
(1240, 47, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-24 07:50:54', '2025-07-24 07:50:54', 1),
(1241, 47, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-24 07:50:54', '2025-07-24 07:50:54', 1),
(1242, 47, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-24 07:53:03', '2025-07-24 07:53:03', 1),
(1243, 47, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-24 07:53:03', '2025-07-24 07:53:03', 1),
(1244, 48, 284, 'New Booking', 'New Booking Created', '2025-07-24 10:04:40', '2025-07-24 10:04:40', 1),
(1245, 49, 284, 'New Booking', 'New Booking Created', '2025-07-24 10:05:17', '2025-07-24 10:05:17', 1),
(1246, 50, 258, 'New Booking', 'New Booking Created', '2025-07-25 05:48:52', '2025-07-25 05:48:52', 1),
(1247, 50, 275, 'New Booking', 'New booking found ', '2025-07-25 05:48:53', '2025-07-25 05:48:53', 1),
(1248, 50, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 05:49:03', '2025-07-25 05:49:03', 1),
(1249, 50, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 05:49:03', '2025-07-25 05:49:03', 1),
(1250, 50, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 05:49:18', '2025-07-25 05:49:18', 1),
(1251, 50, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 05:49:18', '2025-07-25 05:49:18', 1),
(1252, 50, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 05:49:24', '2025-07-25 05:49:24', 1),
(1253, 50, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 05:49:24', '2025-07-25 05:49:24', 1),
(1254, 51, 258, 'New Booking', 'New Booking Created', '2025-07-25 05:50:39', '2025-07-25 05:50:39', 1),
(1255, 51, 275, 'New Booking', 'New booking found ', '2025-07-25 05:50:39', '2025-07-25 05:50:39', 1),
(1256, 51, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 05:50:47', '2025-07-25 05:50:47', 1),
(1257, 51, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 05:50:47', '2025-07-25 05:50:47', 1),
(1258, 51, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 05:51:04', '2025-07-25 05:51:04', 1),
(1259, 51, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 05:51:04', '2025-07-25 05:51:04', 1),
(1260, 51, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 05:51:23', '2025-07-25 05:51:23', 1),
(1261, 51, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 05:51:23', '2025-07-25 05:51:23', 1),
(1262, 52, 258, 'New Booking', 'New Booking Created', '2025-07-25 05:51:45', '2025-07-25 05:51:45', 1),
(1263, 52, 275, 'New Booking', 'New booking found ', '2025-07-25 05:51:46', '2025-07-25 05:51:46', 1),
(1264, 52, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 05:51:51', '2025-07-25 05:51:51', 1),
(1265, 52, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 05:51:51', '2025-07-25 05:51:51', 1),
(1266, 52, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 05:52:27', '2025-07-25 05:52:27', 1),
(1267, 52, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 05:52:27', '2025-07-25 05:52:27', 1),
(1268, 1, 290, 'New Booking', 'New Booking Created', '2025-07-25 06:52:54', '2025-07-25 06:52:54', 1),
(1269, 2, 290, 'New Booking', 'New Booking Created', '2025-07-25 06:53:53', '2025-07-25 06:53:53', 1),
(1270, 3, 290, 'New Booking', 'New Booking Created', '2025-07-25 06:54:28', '2025-07-25 06:54:28', 1),
(1271, 1, 258, 'New Booking', 'New Booking Created', '2025-07-25 07:04:06', '2025-07-25 07:04:06', 1),
(1272, 2, 258, 'New Booking', 'New Booking Created', '2025-07-25 07:04:44', '2025-07-25 07:04:44', 1),
(1273, 3, 258, 'New Booking', 'New Booking Created', '2025-07-25 07:06:02', '2025-07-25 07:06:02', 1),
(1274, 4, 258, 'New Booking', 'New Booking Created', '2025-07-25 07:06:55', '2025-07-25 07:06:55', 1),
(1275, 5, 258, 'New Booking', 'New Booking Created', '2025-07-25 07:08:09', '2025-07-25 07:08:09', 1),
(1276, 1, 258, 'New Booking', 'New Booking Created', '2025-07-25 09:05:22', '2025-07-25 09:05:22', 1),
(1277, 1, 275, 'New Booking', 'New booking found ', '2025-07-25 09:05:22', '2025-07-25 09:05:22', 1),
(1278, 1, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 09:05:35', '2025-07-25 09:05:35', 1),
(1279, 1, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 09:05:35', '2025-07-25 09:05:35', 1),
(1280, 1, 258, 'Booking Cancelled', 'Your booking has been cancelled by fazlu 8826626739', '2025-07-25 09:06:38', '2025-07-25 09:06:38', 1),
(1281, 1, 275, 'Booking Cancelled', 'You have cancelled the booking of fazlu rehman', '2025-07-25 09:06:38', '2025-07-25 09:06:38', 1),
(1282, 2, 258, 'New Booking', 'New Booking Created', '2025-07-25 09:07:02', '2025-07-25 09:07:02', 1);
INSERT INTO `tbl_notification` (`id`, `booking_id`, `user_id`, `subject`, `description`, `created_at`, `updated_at`, `status`) VALUES
(1283, 2, 275, 'New Booking', 'New booking found ', '2025-07-25 09:07:02', '2025-07-25 09:07:02', 1),
(1284, 2, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 09:07:12', '2025-07-25 09:07:12', 1),
(1285, 2, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 09:07:12', '2025-07-25 09:07:12', 1),
(1286, 2, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 09:08:24', '2025-07-25 09:08:24', 1),
(1287, 2, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 09:08:24', '2025-07-25 09:08:24', 1),
(1288, 2, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 09:08:39', '2025-07-25 09:08:39', 1),
(1289, 2, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 09:08:39', '2025-07-25 09:08:39', 1),
(1290, 3, 258, 'New Booking', 'New Booking Created', '2025-07-25 09:29:40', '2025-07-25 09:29:40', 1),
(1291, 3, 275, 'New Booking', 'New booking found ', '2025-07-25 09:29:40', '2025-07-25 09:29:40', 1),
(1292, 4, 258, 'New Booking', 'New Booking Created', '2025-07-25 09:47:41', '2025-07-25 09:47:41', 1),
(1293, 4, 275, 'New Booking', 'New booking found ', '2025-07-25 09:47:41', '2025-07-25 09:47:41', 1),
(1294, 1, 258, 'New Booking', 'New Booking Created', '2025-07-25 10:20:43', '2025-07-25 10:20:43', 1),
(1295, 2, 258, 'New Booking', 'New Booking Created', '2025-07-25 10:20:44', '2025-07-25 10:20:44', 1),
(1296, 1, 275, 'New Booking', 'New booking found ', '2025-07-25 10:20:44', '2025-07-25 10:20:44', 1),
(1297, 2, 275, 'New Booking', 'New booking found ', '2025-07-25 10:20:44', '2025-07-25 10:20:44', 1),
(1298, 1, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 10:21:12', '2025-07-25 10:21:12', 1),
(1299, 1, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 10:21:12', '2025-07-25 10:21:12', 1),
(1300, 1, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 10:23:09', '2025-07-25 10:23:09', 1),
(1301, 1, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 10:23:09', '2025-07-25 10:23:09', 1),
(1302, 1, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 10:23:46', '2025-07-25 10:23:46', 1),
(1303, 1, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 10:23:46', '2025-07-25 10:23:46', 1),
(1304, 2, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 10:41:49', '2025-07-25 10:41:49', 1),
(1305, 2, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 10:41:49', '2025-07-25 10:41:49', 1),
(1306, 2, 258, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-25 10:42:18', '2025-07-25 10:42:18', 1),
(1307, 3, 258, 'New Booking', 'New Booking Created', '2025-07-25 10:44:43', '2025-07-25 10:44:43', 1),
(1308, 3, 275, 'New Booking', 'New booking found ', '2025-07-25 10:44:44', '2025-07-25 10:44:44', 1),
(1309, 3, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 10:44:51', '2025-07-25 10:44:51', 1),
(1310, 3, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 10:44:51', '2025-07-25 10:44:51', 1),
(1311, 3, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 10:45:08', '2025-07-25 10:45:08', 1),
(1312, 3, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 10:45:08', '2025-07-25 10:45:08', 1),
(1313, 3, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 10:45:29', '2025-07-25 10:45:29', 1),
(1314, 3, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 10:45:29', '2025-07-25 10:45:29', 1),
(1315, 4, 258, 'New Booking', 'New Booking Created', '2025-07-25 11:14:04', '2025-07-25 11:14:04', 1),
(1316, 4, 275, 'New Booking', 'New booking found ', '2025-07-25 11:14:05', '2025-07-25 11:14:05', 1),
(1317, 1, 258, 'New Booking', 'New Booking Created', '2025-07-25 11:16:47', '2025-07-25 11:16:47', 1),
(1318, 1, 275, 'New Booking', 'New booking found ', '2025-07-25 11:16:47', '2025-07-25 11:16:47', 1),
(1319, 1, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 11:16:50', '2025-07-25 11:16:50', 1),
(1320, 1, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 11:16:50', '2025-07-25 11:16:50', 1),
(1321, 1, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 11:17:03', '2025-07-25 11:17:03', 1),
(1322, 1, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 11:17:03', '2025-07-25 11:17:03', 1),
(1323, 1, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 11:17:16', '2025-07-25 11:17:16', 1),
(1324, 1, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 11:17:16', '2025-07-25 11:17:16', 1),
(1325, 2, 258, 'New Booking', 'New Booking Created', '2025-07-25 11:24:37', '2025-07-25 11:24:37', 1),
(1326, 2, 275, 'New Booking', 'New booking found ', '2025-07-25 11:24:37', '2025-07-25 11:24:37', 1),
(1327, 2, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 11:28:57', '2025-07-25 11:28:57', 1),
(1328, 2, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 11:28:57', '2025-07-25 11:28:57', 1),
(1329, 2, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 11:29:26', '2025-07-25 11:29:26', 1),
(1330, 2, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 11:29:26', '2025-07-25 11:29:26', 1),
(1331, 2, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 11:29:34', '2025-07-25 11:29:34', 1),
(1332, 2, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 11:29:34', '2025-07-25 11:29:34', 1),
(1333, 3, 258, 'New Booking', 'New Booking Created', '2025-07-25 11:42:16', '2025-07-25 11:42:16', 1),
(1334, 3, 275, 'New Booking', 'New booking found ', '2025-07-25 11:42:17', '2025-07-25 11:42:17', 1),
(1335, 3, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 11:42:24', '2025-07-25 11:42:24', 1),
(1336, 3, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 11:42:24', '2025-07-25 11:42:24', 1),
(1337, 3, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 11:42:38', '2025-07-25 11:42:38', 1),
(1338, 3, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 11:42:38', '2025-07-25 11:42:38', 1),
(1339, 3, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 11:42:47', '2025-07-25 11:42:47', 1),
(1340, 3, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 11:42:47', '2025-07-25 11:42:47', 1),
(1341, 4, 258, 'New Booking', 'New Booking Created', '2025-07-25 11:45:10', '2025-07-25 11:45:10', 1),
(1342, 4, 275, 'New Booking', 'New booking found ', '2025-07-25 11:45:10', '2025-07-25 11:45:10', 1),
(1343, 4, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 11:47:43', '2025-07-25 11:47:43', 1),
(1344, 4, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 11:47:43', '2025-07-25 11:47:43', 1),
(1345, 4, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 11:47:52', '2025-07-25 11:47:52', 1),
(1346, 4, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 11:47:52', '2025-07-25 11:47:52', 1),
(1347, 4, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 11:47:59', '2025-07-25 11:47:59', 1),
(1348, 4, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 11:47:59', '2025-07-25 11:47:59', 1),
(1349, 5, 258, 'New Booking', 'New Booking Created', '2025-07-25 11:52:55', '2025-07-25 11:52:55', 1),
(1350, 5, 275, 'New Booking', 'New booking found ', '2025-07-25 11:52:55', '2025-07-25 11:52:55', 1),
(1351, 5, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 12:06:58', '2025-07-25 12:06:58', 1),
(1352, 5, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 12:06:58', '2025-07-25 12:06:58', 1),
(1353, 5, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 12:07:13', '2025-07-25 12:07:13', 1),
(1354, 5, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 12:07:13', '2025-07-25 12:07:13', 1),
(1355, 5, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 12:07:22', '2025-07-25 12:07:22', 1),
(1356, 5, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 12:07:22', '2025-07-25 12:07:22', 1),
(1357, 6, 258, 'New Booking', 'New Booking Created', '2025-07-25 12:26:25', '2025-07-25 12:26:25', 1),
(1358, 6, 275, 'New Booking', 'New booking found ', '2025-07-25 12:26:26', '2025-07-25 12:26:26', 1),
(1359, 6, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 12:26:31', '2025-07-25 12:26:31', 1),
(1360, 6, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 12:26:31', '2025-07-25 12:26:31', 1),
(1361, 6, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 12:26:46', '2025-07-25 12:26:46', 1),
(1362, 6, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 12:26:46', '2025-07-25 12:26:46', 1),
(1363, 6, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 12:26:52', '2025-07-25 12:26:52', 1),
(1364, 6, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 12:26:52', '2025-07-25 12:26:52', 1),
(1365, 7, 258, 'New Booking', 'New Booking Created', '2025-07-25 12:54:52', '2025-07-25 12:54:52', 1),
(1366, 7, 275, 'New Booking', 'New booking found ', '2025-07-25 12:54:53', '2025-07-25 12:54:53', 1),
(1367, 7, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-25 12:54:59', '2025-07-25 12:54:59', 1),
(1368, 7, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-25 12:54:59', '2025-07-25 12:54:59', 1),
(1369, 7, 258, 'Booking Activated', 'Your booking has been activated by fazlu 8826626739', '2025-07-25 12:55:06', '2025-07-25 12:55:06', 1),
(1370, 7, 275, 'Booking Activated', 'You have activated the booking of fazlu rehman', '2025-07-25 12:55:06', '2025-07-25 12:55:06', 1),
(1371, 7, 258, 'Booking Completed', 'Your booking has been completed by fazlu 8826626739', '2025-07-25 12:55:12', '2025-07-25 12:55:12', 1),
(1372, 7, 275, 'Booking Completed', 'You have completed the booking of fazlu rehman', '2025-07-25 12:55:12', '2025-07-25 12:55:12', 1),
(1373, 8, 284, 'New Booking', 'New Booking Created', '2025-07-26 16:18:54', '2025-07-26 16:18:54', 1),
(1374, 8, 286, 'New Booking', 'New booking found ', '2025-07-26 16:18:55', '2025-07-26 16:18:55', 1),
(1375, 8, 284, 'Booking Accepted', 'Your booking has been accepted by Ķeñnédý', '2025-07-26 16:19:34', '2025-07-26 16:19:34', 1),
(1376, 8, 286, 'Booking Accepted', 'You have accepted the booking of Kunal Roy', '2025-07-26 16:19:34', '2025-07-26 16:19:34', 1),
(1377, 8, 284, 'Booking Activated', 'Your booking has been activated by Ķeñnédý', '2025-07-26 16:20:01', '2025-07-26 16:20:01', 1),
(1378, 8, 286, 'Booking Activated', 'You have activated the booking of Kunal Roy', '2025-07-26 16:20:01', '2025-07-26 16:20:01', 1),
(1379, 9, 255, 'New Booking', 'New Booking Created', '2025-07-26 16:28:52', '2025-07-26 16:28:52', 1),
(1380, 1, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:05:24', '2025-07-28 07:05:24', 1),
(1381, 2, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:05:51', '2025-07-28 07:05:51', 1),
(1382, 3, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:06:12', '2025-07-28 07:06:12', 1),
(1383, 4, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:06:34', '2025-07-28 07:06:34', 1),
(1384, 5, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:07:18', '2025-07-28 07:07:18', 1),
(1385, 6, 258, 'New Booking', 'New Booking Created', '2025-07-28 07:11:31', '2025-07-28 07:11:31', 1),
(1386, 6, 275, 'New Booking', 'New booking found ', '2025-07-28 07:11:31', '2025-07-28 07:11:31', 1),
(1387, 6, 258, 'Booking Accepted', 'Your booking has been accepted by fazlu 8826626739', '2025-07-28 07:11:33', '2025-07-28 07:11:33', 1),
(1388, 6, 275, 'Booking Accepted', 'You have accepted the booking of fazlu rehman', '2025-07-28 07:11:33', '2025-07-28 07:11:33', 1),
(1389, 7, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:43:03', '2025-07-28 07:43:03', 1),
(1390, 8, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:44:43', '2025-07-28 07:44:43', 1),
(1391, 9, 263, 'New Booking', 'New Booking Created', '2025-07-28 07:45:12', '2025-07-28 07:45:12', 1),
(1392, 6, 258, 'Booking Cancelled', 'You have cancelled the booking of ', '2025-07-28 10:21:01', '2025-07-28 10:21:01', 1),
(1393, 10, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:06:53', '2025-07-28 17:06:53', 1),
(1394, 11, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:07:09', '2025-07-28 17:07:09', 1),
(1395, 12, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:07:11', '2025-07-28 17:07:11', 1),
(1396, 13, 255, 'New Booking', 'New Booking Created', '2025-07-28 17:08:19', '2025-07-28 17:08:19', 1),
(1397, 14, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:08:30', '2025-07-28 17:08:30', 1),
(1398, 15, 255, 'New Booking', 'New Booking Created', '2025-07-28 17:09:08', '2025-07-28 17:09:08', 1),
(1399, 16, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:09:15', '2025-07-28 17:09:15', 1),
(1400, 17, 255, 'New Booking', 'New Booking Created', '2025-07-28 17:09:35', '2025-07-28 17:09:35', 1),
(1401, 18, 255, 'New Booking', 'New Booking Created', '2025-07-28 17:10:52', '2025-07-28 17:10:52', 1),
(1402, 19, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:11:28', '2025-07-28 17:11:28', 1),
(1403, 20, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:11:54', '2025-07-28 17:11:54', 1),
(1404, 21, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:12:51', '2025-07-28 17:12:51', 1),
(1405, 22, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:17:14', '2025-07-28 17:17:14', 1),
(1406, 23, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:19:04', '2025-07-28 17:19:04', 1),
(1407, 24, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:20:21', '2025-07-28 17:20:21', 1),
(1408, 25, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:20:45', '2025-07-28 17:20:45', 1),
(1409, 26, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:22:22', '2025-07-28 17:22:22', 1),
(1410, 27, 294, 'New Booking', 'New Booking Created', '2025-07-28 17:23:40', '2025-07-28 17:23:40', 1),
(1411, 28, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:13:31', '2025-07-29 09:13:31', 1),
(1412, 29, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:13:49', '2025-07-29 09:13:49', 1),
(1413, 30, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:14:58', '2025-07-29 09:14:58', 1),
(1414, 31, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:17:14', '2025-07-29 09:17:14', 1),
(1415, 32, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:17:58', '2025-07-29 09:17:58', 1),
(1416, 33, 298, 'New Booking', 'New Booking Created', '2025-07-29 09:28:47', '2025-07-29 09:28:47', 1),
(1417, 34, 298, 'New Booking', 'New Booking Created', '2025-07-29 09:32:09', '2025-07-29 09:32:09', 1),
(1418, 34, 296, 'New Booking', 'New booking found ', '2025-07-29 09:32:10', '2025-07-29 09:32:10', 1),
(1419, 34, 298, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-29 09:32:18', '2025-07-29 09:32:18', 1),
(1420, 34, 296, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-29 09:32:18', '2025-07-29 09:32:18', 1),
(1421, 34, 298, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-29 09:32:39', '2025-07-29 09:32:39', 1),
(1422, 34, 296, 'Booking Activated', 'You have activated the booking of Sumit', '2025-07-29 09:32:39', '2025-07-29 09:32:39', 1),
(1423, 34, 298, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-29 09:33:02', '2025-07-29 09:33:02', 1),
(1424, 34, 296, 'Booking Completed', 'You have completed the booking of Sumit', '2025-07-29 09:33:02', '2025-07-29 09:33:02', 1),
(1425, 35, 298, 'New Booking', 'New Booking Created', '2025-07-29 09:33:50', '2025-07-29 09:33:50', 1),
(1426, 35, 296, 'New Booking', 'New booking found ', '2025-07-29 09:33:50', '2025-07-29 09:33:50', 1),
(1427, 35, 298, 'Booking Accepted', 'Your booking has been accepted by Fazlu Rehman', '2025-07-29 09:37:55', '2025-07-29 09:37:55', 1),
(1428, 35, 296, 'Booking Accepted', 'You have accepted the booking of Sumit', '2025-07-29 09:37:55', '2025-07-29 09:37:55', 1),
(1429, 35, 298, 'Booking Activated', 'Your booking has been activated by Fazlu Rehman', '2025-07-29 09:38:20', '2025-07-29 09:38:20', 1),
(1430, 35, 296, 'Booking Activated', 'You have activated the booking of Sumit', '2025-07-29 09:38:20', '2025-07-29 09:38:20', 1),
(1431, 35, 298, 'Booking Completed', 'Your booking has been completed by Fazlu Rehman', '2025-07-29 09:38:27', '2025-07-29 09:38:27', 1),
(1432, 35, 296, 'Booking Completed', 'You have completed the booking of Sumit', '2025-07-29 09:38:27', '2025-07-29 09:38:27', 1),
(1433, 36, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:45:23', '2025-07-29 09:45:23', 1),
(1434, 37, 255, 'New Booking', 'New Booking Created', '2025-07-29 09:45:53', '2025-07-29 09:45:53', 1),
(1435, 38, 255, 'New Booking', 'New Booking Created', '2025-07-29 10:54:13', '2025-07-29 10:54:13', 1),
(1436, 39, 255, 'New Booking', 'New Booking Created', '2025-07-29 10:57:59', '2025-07-29 10:57:59', 1),
(1437, 39, 250, 'New Booking', 'New booking found ', '2025-07-29 10:57:59', '2025-07-29 10:57:59', 1),
(1438, 39, 255, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-29 10:58:06', '2025-07-29 10:58:06', 1),
(1439, 39, 250, 'Booking Accepted', 'You have accepted the booking of Abhi Chadha', '2025-07-29 10:58:06', '2025-07-29 10:58:06', 1),
(1440, 39, 255, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-29 10:58:22', '2025-07-29 10:58:22', 1),
(1441, 39, 250, 'Booking Activated', 'You have activated the booking of Abhi Chadha', '2025-07-29 10:58:22', '2025-07-29 10:58:22', 1),
(1442, 39, 255, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-29 10:59:37', '2025-07-29 10:59:37', 1),
(1443, 39, 250, 'Booking Completed', 'You have completed the booking of Abhi Chadha', '2025-07-29 10:59:37', '2025-07-29 10:59:37', 1),
(1444, 40, 255, 'New Booking', 'New Booking Created', '2025-07-29 11:10:14', '2025-07-29 11:10:14', 1),
(1445, 40, 250, 'New Booking', 'New booking found ', '2025-07-29 11:10:14', '2025-07-29 11:10:14', 1),
(1446, 41, 255, 'New Booking', 'New Booking Created', '2025-07-29 11:13:20', '2025-07-29 11:13:20', 1),
(1447, 41, 250, 'New Booking', 'New booking found ', '2025-07-29 11:13:20', '2025-07-29 11:13:20', 1),
(1448, 42, 255, 'New Booking', 'New Booking Created', '2025-07-29 11:13:57', '2025-07-29 11:13:57', 1),
(1449, 43, 255, 'New Booking', 'New Booking Created', '2025-07-29 11:14:36', '2025-07-29 11:14:36', 1),
(1450, 44, 255, 'New Booking', 'New Booking Created', '2025-07-29 11:15:08', '2025-07-29 11:15:08', 1),
(1451, 44, 250, 'New Booking', 'New booking found ', '2025-07-29 11:15:08', '2025-07-29 11:15:08', 1),
(1452, 44, 255, 'Booking Accepted', 'Your booking has been accepted by Aman kumar', '2025-07-29 11:15:12', '2025-07-29 11:15:12', 1),
(1453, 44, 250, 'Booking Accepted', 'You have accepted the booking of Abhi Chadha', '2025-07-29 11:15:12', '2025-07-29 11:15:12', 1),
(1454, 44, 255, 'Booking Activated', 'Your booking has been activated by Aman kumar', '2025-07-29 11:15:38', '2025-07-29 11:15:38', 1),
(1455, 44, 250, 'Booking Activated', 'You have activated the booking of Abhi Chadha', '2025-07-29 11:15:38', '2025-07-29 11:15:38', 1),
(1456, 44, 255, 'Booking Completed', 'Your booking has been completed by Aman kumar', '2025-07-29 11:17:08', '2025-07-29 11:17:08', 1),
(1457, 44, 250, 'Booking Completed', 'You have completed the booking of Abhi Chadha', '2025-07-29 11:17:08', '2025-07-29 11:17:08', 1),
(1458, 45, 255, 'New Booking', 'New Booking Created', '2025-07-29 11:17:39', '2025-07-29 11:17:39', 1),
(1459, 45, 250, 'New Booking', 'New booking found ', '2025-07-29 11:17:39', '2025-07-29 11:17:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otp`
--

CREATE TABLE `tbl_otp` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL COMMENT 'user.id',
  `otp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1-Active,2-Expired',
  `module_type` tinyint NOT NULL DEFAULT '1' COMMENT '1-Login,2-Register,3-Forget Password',
  `otp_type` tinyint NOT NULL DEFAULT '1' COMMENT '1-Mobile, 2-Email',
  `field_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_otp`
--

INSERT INTO `tbl_otp` (`id`, `user_id`, `otp`, `status`, `module_type`, `otp_type`, `field_value`, `created_at`, `updated_at`) VALUES
(1, NULL, '491147', 2, 1, 1, '7042739659', '2025-07-28 07:04:19', '2025-07-28 07:04:19'),
(2, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 07:09:19', '2025-07-28 07:09:19'),
(3, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 07:10:09', '2025-07-28 07:10:09'),
(4, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 07:10:52', '2025-07-28 07:10:52'),
(5, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 07:11:06', '2025-07-28 07:11:06'),
(6, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 07:37:44', '2025-07-28 07:37:44'),
(7, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 07:45:02', '2025-07-28 07:45:02'),
(8, NULL, '123456', 2, 1, 1, '7428059960', '2025-07-28 10:26:25', '2025-07-28 10:26:25'),
(9, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 10:26:36', '2025-07-28 10:26:36'),
(10, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 10:32:30', '2025-07-28 10:32:30'),
(11, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 11:17:20', '2025-07-28 11:17:20'),
(12, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 11:31:37', '2025-07-28 11:31:37'),
(13, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 12:14:39', '2025-07-28 12:14:39'),
(14, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 12:15:07', '2025-07-28 12:15:07'),
(15, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 12:16:39', '2025-07-28 12:16:39'),
(16, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 12:18:15', '2025-07-28 12:18:15'),
(17, NULL, '786100', 2, 1, 1, '9534343483', '2025-07-28 15:25:36', '2025-07-28 15:25:36'),
(18, NULL, '914592', 2, 1, 1, '7889351360', '2025-07-28 17:07:17', '2025-07-28 17:07:17'),
(19, NULL, '568476', 2, 1, 1, '9523707084', '2025-07-28 17:13:56', '2025-07-28 17:13:56'),
(20, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-28 17:18:33', '2025-07-28 17:18:33'),
(21, NULL, '422765', 2, 1, 1, '9523707084', '2025-07-28 17:22:55', '2025-07-28 17:22:55'),
(22, NULL, '464519', 2, 2, 1, '8853887366', '2025-07-29 09:20:28', '2025-07-29 09:20:28'),
(23, NULL, '123456', 2, 2, 1, '7428059960', '2025-07-29 09:20:35', '2025-07-29 09:20:35'),
(24, NULL, '515675', 2, 1, 1, '8853887366', '2025-07-29 09:21:48', '2025-07-29 09:21:48'),
(25, NULL, '123456', 2, 1, 1, '8700682075', '2025-07-29 09:41:42', '2025-07-29 09:41:42'),
(26, NULL, '340157', 2, 2, 1, '7428059961', '2025-07-29 09:53:12', '2025-07-29 09:53:12'),
(27, NULL, '896985', 2, 2, 1, '8853887366', '2025-07-29 09:55:10', '2025-07-29 09:55:10'),
(28, NULL, '741672', 2, 1, 1, '8853887366', '2025-07-29 09:57:43', '2025-07-29 09:57:43'),
(29, NULL, '678745', 2, 1, 1, '8853887366', '2025-07-29 09:59:15', '2025-07-29 09:59:15'),
(30, NULL, '225111', 2, 1, 1, '9534343483', '2025-07-29 10:51:56', '2025-07-29 10:51:56'),
(31, NULL, '851812', 2, 1, 1, '9534343483', '2025-07-29 10:53:46', '2025-07-29 10:53:46'),
(32, NULL, '652091', 2, 1, 1, '7889351360', '2025-07-29 10:55:45', '2025-07-29 10:55:45'),
(33, NULL, '476915', 2, 1, 1, '7889351360', '2025-07-29 10:56:59', '2025-07-29 10:56:59'),
(34, NULL, '147079', 2, 2, 1, '9693526167', '2025-07-29 12:52:12', '2025-07-29 12:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pet_bookings`
--

CREATE TABLE `tbl_pet_bookings` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `booking_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `booking_time` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Delted',
  `booking_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Pending,2-Confirmed,3-Cancelled',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pet_bookings`
--

INSERT INTO `tbl_pet_bookings` (`id`, `customer_id`, `pet_id`, `booking_date`, `booking_time`, `description`, `status`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '20-11-2024', '10:20 PM', 'Test', 1, 3, '2024-11-20 12:44:56', '2024-11-20 12:44:56'),
(2, 1, 6, '20-11-2024', '10:20 PM', NULL, 1, 1, '2024-11-20 12:45:01', '2024-11-20 12:45:01'),
(3, 1, 5, '20-11-2024', '10:20 PM', NULL, 1, 1, '2024-11-20 13:06:36', '2024-11-20 13:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `id` int NOT NULL,
  `request` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_request`
--

INSERT INTO `tbl_request` (`id`, `request`, `created_at`) VALUES
(1, 'POST /api/payment/callback HTTP/1.1\nAccept:         */*\nContent-Length: 1208\nContent-Type:   application/x-www-form-urlencoded\nHost:           krnacab.live.devs-nerasoft.tech\nUser-Agent:     PHP-Curl-Class/8.0.3 (+https://github.com/php-curl-class/php-curl-class) PHP/8.2.27 curl/8.5.0\n\nmihpayid=403993715534431534&mode=CC&status=success&key=0KouTO&txnid=98516&amount=1.00&addedon=2025-07-28+14%3A57%3A31&productinfo=test+payment&firstname=Ayush+Gupta&lastname=&address1=&address2=&city=&state=&country=&zipcode=&email=fazlu.developer%40gmail.com&phone=917428059960&udf1=&udf2=&udf3=&udf4=&udf5=&udf6=&udf7=&udf8=&udf9=&udf10=&card_token=&card_no=XXXXXXXXXXXX2346&field0=&field1=725382652579409200&field2=705787&field3=1.00&field4=&field5=00&field6=02&field7=AUTHPOSITIVE&field8=AUTHORIZED&field9=Transaction+is+Successful&payment_source=paymentLink&PG_TYPE=CC-PG&error=E000&error_Message=No+Error&cardToken=&net_amount_debit=1&discount=0.00&offer_key=&offer_availed=&unmappedstatus=captured&hash=04566280732738582c7df07f5424f9c6139502989de22d9d3e53dcdac85c78c533a3ee5e3e70359a244c71ca4b026799d27e43695cebf38d178fdc1d02981b52&bank_ref_no=725382652579409200&bank_ref_num=725382652579409200&bankcode=CC&surl=https%3A%2F%2Fuattools.payu.in%2FpaymentLink%2FpostBackParam.do&curl=https%3A%2F%2Fuattools.payu.in%2FpaymentLink%2FpostBackParam.do&furl=https%3A%2F%2Fuattools.payu.in%2FpaymentLink%2FpostBackParam.do&card_hash=515a2cb0f0e6711f6a3d2c4704cc691d212d4dc0e065c7c8d3441a6b5fc23e97&pa_name=PayU', '2025-07-28 09:28:06'),
(2, 'POST /api/payment/callback HTTP/1.1\nAccept:         */*\nContent-Length: 1211\nContent-Type:   application/x-www-form-urlencoded\nHost:           krnacab.live.devs-nerasoft.tech\nUser-Agent:     PHP-Curl-Class/8.0.3 (+https://github.com/php-curl-class/php-curl-class) PHP/8.2.27 curl/8.5.0\n\nmihpayid=403993715534431543&mode=CC&status=failure&key=0KouTO&txnid=98517&amount=1.00&addedon=2025-07-28+14%3A58%3A49&productinfo=test+payment&firstname=Ayush+Gupta&lastname=&address1=&address2=&city=&state=&country=&zipcode=&email=fazlu.developer%40gmail.com&phone=917428059960&udf1=&udf2=&udf3=&udf4=&udf5=&udf6=&udf7=&udf8=&udf9=&udf10=&card_token=&card_no=XXXXXXXXXXXX2346&field0=&field1=979558595968894200&field2=&field3=&field4=&field5=&field6=00&field7=3DS_CHALLENGE_NEGATIVE&field8=Transaction+failed+in+Authorization&field9=Transaction+Failed+at+bank+end.&payment_source=paymentLink&PG_TYPE=CC-PG&error=E308&error_Message=Transaction+Failed+at+bank+end.&net_amount_debit=0&discount=0.00&offer_key=&offer_availed=&unmappedstatus=failed&hash=6204e450cd768e40c66d7d7fa0d82dbc150606dd893ff85d673088e47e6cc3db562960458d9f66d24cd63a4965f0388699426153260e69fdff7e97cf0ed27ce9&bank_ref_no=&bank_ref_num=&bankcode=CC&surl=https%3A%2F%2Fuattools.payu.in%2FpaymentLink%2FpostBackParam.do&curl=https%3A%2F%2Fuattools.payu.in%2FpaymentLink%2FpostBackParam.do&furl=https%3A%2F%2Fuattools.payu.in%2FpaymentLink%2FpostBackParam.do&card_hash=515a2cb0f0e6711f6a3d2c4704cc691d212d4dc0e065c7c8d3441a6b5fc23e97&pa_name=PayU', '2025-07-28 09:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`id`, `title`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Uttar Pradesh', '2025-01-21 12:50:35', '2025-07-15 10:50:57', 1),
(2, 'Delhi', '2025-01-21 12:50:38', '2025-07-14 03:15:52', 1),
(4, 'Bihar', '2025-05-08 07:16:35', '2025-05-08 07:16:35', 1),
(5, 'Jharkhand', '2025-05-08 07:16:42', '2025-05-08 07:16:42', 1),
(7, 'Haryana', '2025-07-11 09:43:21', '2025-07-15 14:09:15', 3),
(8, 'Punjab', '2025-07-28 17:55:49', '2025-07-28 17:55:49', 1),
(9, 'Chandigarh', '2025-07-28 18:00:28', '2025-07-28 18:00:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_statement`
--

CREATE TABLE `tbl_statement` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `booking_id` int DEFAULT NULL COMMENT 'tbl_booking.id',
  `transaction_type` tinyint NOT NULL DEFAULT '0' COMMENT '1-Accept Booking Charges,2-Complete Booking Charges, 3-Top Up Wallet , 4-Share Charges Post Booking,5-Cancel Booking  Charges',
  `payment_type` tinyint DEFAULT '0' COMMENT '1-Credit , 2-Debit',
  `amount` bigint NOT NULL DEFAULT '0',
  `payment_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Success,2-Failed,3-Process',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token`
--

CREATE TABLE `tbl_token` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Expire',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_token`
--

INSERT INTO `tbl_token` (`id`, `user_id`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 290, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjkwLCJpYXQiOjE3NTM0MjYzNTksImV4cCI6MTc4NDk2MjM1OX0.zJwFigDeyxvCrRPxPDYnE3X-ulM-ZqJv5sAUIcmznCA', 1, '2025-07-25 06:52:39', '2025-07-25 06:52:39'),
(2, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM0MjY5ODYsImV4cCI6MTc4NDk2Mjk4Nn0.e7cGehRbRiCwDTLkKvD2mttdW-l5hqBpTeLa8f7SVrA', 2, '2025-07-25 07:03:06', '2025-07-25 07:07:53'),
(3, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM0MjcwMjcsImV4cCI6MTc4NDk2MzAyN30.lMI3yqVUGfY-2_fBHKtwHW355j_iDn3QUGDZiMZxGBk', 2, '2025-07-25 07:03:47', '2025-07-28 07:09:27'),
(4, 251, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjUxLCJpYXQiOjE3NTM0MjcyMTAsImV4cCI6MTc4NDk2MzIxMH0.JCVCvg9DF9uDe9bMBnxJZ_ZtBIcrV4ioyamtD3ToJvE', 2, '2025-07-25 07:06:50', '2025-07-25 08:03:47'),
(5, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM0MjcyNzMsImV4cCI6MTc4NDk2MzI3M30.axNHM8J-uIFso3XqeaDpgt6qW6GF8WHrhdeO3J_e2Yo', 2, '2025-07-25 07:07:53', '2025-07-25 09:05:03'),
(6, 250, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjUwLCJpYXQiOjE3NTM0Mjk0MzIsImV4cCI6MTc4NDk2NTQzMn0.bcEoZVjXLDspEsZ7pZIn7mwjBiRfTHH5J4r2M3g5oho', 2, '2025-07-25 07:43:52', '2025-07-28 15:25:47'),
(7, 251, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjUxLCJpYXQiOjE3NTM0MzA2MjcsImV4cCI6MTc4NDk2NjYyN30.RTEECozM_uSdEG-cbwUWxvWFVODopUeQt8AYFCLZwCw', 1, '2025-07-25 08:03:47', '2025-07-25 08:03:47'),
(8, 291, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjkxLCJpYXQiOjE3NTM0MzA4MzAsImV4cCI6MTc4NDk2NjgzMH0.o0nxl_5i-KSpqXuvO5BQ35eRGuzGk4k6OlTrbICVJSk', 2, '2025-07-25 08:07:10', '2025-07-28 10:26:55'),
(9, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM0MzQzMDMsImV4cCI6MTc4NDk3MDMwM30.avJ1mbURMX7OHx8G0JAZ8Gan1_2B0-Zjw_Fk723w_L4', 2, '2025-07-25 09:05:03', '2025-07-25 09:52:32'),
(10, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM0MzcxNTIsImV4cCI6MTc4NDk3MzE1Mn0.K2DWkl-UUt2LjCxzEDP5d-lVC4UjlTgG6V8r-MLV53A', 2, '2025-07-25 09:52:32', '2025-07-25 13:02:35'),
(11, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM0NDg1NTUsImV4cCI6MTc4NDk4NDU1NX0.LQp1QLcJL7zJa9a-n7QjI5bi2lgvK_2N_zXaECepMrI', 2, '2025-07-25 13:02:35', '2025-07-25 13:11:15'),
(12, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM0NDkwNzUsImV4cCI6MTc4NDk4NTA3NX0.gOGNwGp-chYg6Eni9AZ3_vwEeiKI1Ftg79bc2GRAVig', 2, '2025-07-25 13:11:15', '2025-07-28 07:10:56'),
(13, 292, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjkyLCJpYXQiOjE3NTM0NTg4OTAsImV4cCI6MTc4NDk5NDg5MH0.GN4esikrH8V-liE60ljS24uuQ7ReETjFB23pQj2HNSc', 1, '2025-07-25 15:54:50', '2025-07-25 15:54:50'),
(14, 293, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjkzLCJpYXQiOjE3NTM0NTkxODAsImV4cCI6MTc4NDk5NTE4MH0.GPlymnjbDjssPnzI_BRL6zyIn6czzt9E-Epk__8LGYE', 1, '2025-07-25 15:59:40', '2025-07-25 15:59:40'),
(15, 294, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6Mjk0LCJpYXQiOjE3NTM1NDQwNTcsImV4cCI6MTc4NTA4MDA1N30.TGecMe_UFAthKZ3dRjf826beYQmK_e3XcZW1ssE23D8', 1, '2025-07-26 15:34:17', '2025-07-26 15:34:17'),
(16, 286, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjg2LCJpYXQiOjE3NTM1NDY1ODgsImV4cCI6MTc4NTA4MjU4OH0.g6-g2L4kqR5W2lvbfjse9nz5hG0cTSw8kPuRrs7ZEdQ', 2, '2025-07-26 16:16:28', '2025-07-26 16:25:38'),
(17, 284, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6Mjg0LCJpYXQiOjE3NTM1NDY3MDYsImV4cCI6MTc4NTA4MjcwNn0.h1JCSMdAfoX0uZHiOR2yNAUJe3vO_r4_WPNq_-4mHhE', 1, '2025-07-26 16:18:26', '2025-07-26 16:18:26'),
(18, 286, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjg2LCJpYXQiOjE3NTM1NDcxMzgsImV4cCI6MTc4NTA4MzEzOH0.zdO10DqMkqPoJAqcjXjZxXy4ObtRnuFVf8ya0h7HU30', 2, '2025-07-26 16:25:38', '2025-07-28 17:14:18'),
(19, 255, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU1LCJpYXQiOjE3NTM1NDcyMzYsImV4cCI6MTc4NTA4MzIzNn0.cCIY1pUkzUds7v9pYnC3WJ2hQ1yhm1B_HbUg-Q6VrIg', 2, '2025-07-26 16:27:16', '2025-07-26 16:27:56'),
(20, 255, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU1LCJpYXQiOjE3NTM1NDcyNzYsImV4cCI6MTc4NTA4MzI3Nn0.lLXUyYXb4_4ATUPv681xipLG-cr94IzJ7iFfRWKRLf8', 2, '2025-07-26 16:27:56', '2025-07-28 17:07:30'),
(21, 256, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjU2LCJpYXQiOjE3NTM1ODAwMTksImV4cCI6MTc4NTExNjAxOX0.m9GC-wUmL1WdAEByIJNMjN_OqNPyJB_YANfvI_I_O7U', 1, '2025-07-27 01:33:39', '2025-07-27 01:33:39'),
(22, 295, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6Mjk1LCJpYXQiOjE3NTM1ODAyMDAsImV4cCI6MTc4NTExNjIwMH0.2Ghyf8MkPRcpDjpK1zqdR7ZqnwMQyLmRmInRxFbgPp8', 1, '2025-07-27 01:36:40', '2025-07-27 01:36:40'),
(23, 263, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjYzLCJpYXQiOjE3NTM2ODYyODMsImV4cCI6MTc4NTIyMjI4M30.Fufdjb8OdDwx-24TpDSg7SiVS6OQOS-RFJ-WYJtKOO4', 1, '2025-07-28 07:04:43', '2025-07-28 07:04:43'),
(24, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM2ODY1NjcsImV4cCI6MTc4NTIyMjU2N30.cWenXHk4ewIRxEuOkjdsON0tMlfX9NimyZNddY7z8NM', 2, '2025-07-28 07:09:27', '2025-07-28 07:10:14'),
(25, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM2ODY2MTQsImV4cCI6MTc4NTIyMjYxNH0.2Z0qOkl-unVz4lBeMVvUkEA6aCldAQERlsg5VCKpggQ', 2, '2025-07-28 07:10:14', '2025-07-28 07:11:11'),
(26, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM2ODY2NTYsImV4cCI6MTc4NTIyMjY1Nn0.5F8BbxwLfRTDqKou0EtTRBHYCcFBiaOnTwJ50x1SPmQ', 2, '2025-07-28 07:10:56', '2025-07-28 10:32:39'),
(27, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM2ODY2NzEsImV4cCI6MTc4NTIyMjY3MX0.2hZYN0poYcapumbOGJ4qfODurq-cB-ruJHlbct8ux5A', 2, '2025-07-28 07:11:11', '2025-07-28 07:37:57'),
(28, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM2ODgyNzcsImV4cCI6MTc4NTIyNDI3N30.6rdIRLiADrgzZAwx-6wkgji596jKIbdA4-lvO2USwVQ', 2, '2025-07-28 07:37:57', '2025-07-28 07:45:09'),
(29, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM2ODg3MDksImV4cCI6MTc4NTIyNDcwOX0.JrlXqNTDGpMnWDig4nA5X4UtL68drsK4Jk2dAhnpzoQ', 2, '2025-07-28 07:45:09', '2025-07-28 10:26:42'),
(30, 258, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU4LCJpYXQiOjE3NTM2OTg0MDIsImV4cCI6MTc4NTIzNDQwMn0.KJWTtnbJO0h0-lmqg5F1c1RSfXefpe7fuv4rjSyipvg', 1, '2025-07-28 10:26:42', '2025-07-28 10:26:42'),
(31, 291, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjkxLCJpYXQiOjE3NTM2OTg0MTUsImV4cCI6MTc4NTIzNDQxNX0.GW2IForPlHNuMbTk5sR2JbbPzhX-HxnHxepZ-FBEYZY', 1, '2025-07-28 10:26:55', '2025-07-28 10:26:55'),
(32, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM2OTg3NTksImV4cCI6MTc4NTIzNDc1OX0.RNpO1SDHXmWvASEYfKGAeMUjZGf0XdAOS9GgdfIgp2Q', 2, '2025-07-28 10:32:39', '2025-07-28 12:15:19'),
(33, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM3MDQ5MTksImV4cCI6MTc4NTI0MDkxOX0.WLqfSvX5H_WHHIlCIhloFsJptHgUmSwwUF1bxUnyuLs', 2, '2025-07-28 12:15:19', '2025-07-28 17:18:39'),
(34, 250, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjUwLCJpYXQiOjE3NTM3MTYzNDcsImV4cCI6MTc4NTI1MjM0N30.ahneHQFUsMTp9YT25knG-U_V2DQjwkHoWqFGEYvvxq8', 2, '2025-07-28 15:25:47', '2025-07-29 10:52:20'),
(35, 255, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU1LCJpYXQiOjE3NTM3MjI0NTAsImV4cCI6MTc4NTI1ODQ1MH0.o0ASnzKfQyTJ00d-xVSRZLsEF5mYiAnSTl1kDgHlCk4', 2, '2025-07-28 17:07:30', '2025-07-29 10:57:30'),
(36, 286, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjg2LCJpYXQiOjE3NTM3MjI4NTgsImV4cCI6MTc4NTI1ODg1OH0.Vmf4dXFQoPaOFGoeJa7RUxOMN8TbJAk-8VZJyrAoXKg', 2, '2025-07-28 17:14:18', '2025-07-28 17:23:16'),
(37, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM3MjMxMTksImV4cCI6MTc4NTI1OTExOX0.beeGiXJqEw4rYvqHky1qcEjclpp3S7ltJMdro4tmZpo', 2, '2025-07-28 17:18:39', '2025-07-29 09:41:47'),
(38, 286, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjg2LCJpYXQiOjE3NTM3MjMzOTYsImV4cCI6MTc4NTI1OTM5Nn0.D6rSJ_ATbiUWD_DQgkWQz8PHWn5HM15OzUQN8s7kQ7k', 1, '2025-07-28 17:23:16', '2025-07-28 17:23:16'),
(39, 296, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjk2LCJpYXQiOjE3NTM3ODA4NDksImV4cCI6MTc4NTMxNjg0OX0.cvkcK3cippp_xMMstEE1OXUDR5mBejArdEOebPmjyBM', 2, '2025-07-29 09:20:49', '2025-07-29 09:20:49'),
(40, 296, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjk2LCJpYXQiOjE3NTM3ODA4NDksImV4cCI6MTc4NTMxNjg0OX0.cvkcK3cippp_xMMstEE1OXUDR5mBejArdEOebPmjyBM', 1, '2025-07-29 09:20:49', '2025-07-29 09:20:49'),
(41, 298, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6Mjk4LCJpYXQiOjE3NTM3ODA4NjQsImV4cCI6MTc4NTMxNjg2NH0.gOAwBrlqpzP2JoyMCDbaCKMPZqgj9ItIQ54F5sFsEs0', 2, '2025-07-29 09:21:04', '2025-07-29 09:22:10'),
(42, 298, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6Mjk4LCJpYXQiOjE3NTM3ODA5MzAsImV4cCI6MTc4NTMxNjkzMH0.N3x6L4qdTNQerRDY_dy6LGW67Sn8myt7VjwrQPldviA', 1, '2025-07-29 09:22:10', '2025-07-29 09:22:10'),
(43, 275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjc1LCJpYXQiOjE3NTM3ODIxMDcsImV4cCI6MTc4NTMxODEwN30.e8fTJubPjNK6jqvlakHUveCNOK7DEBRGT97njs-JZ5E', 1, '2025-07-29 09:41:47', '2025-07-29 09:41:47'),
(44, 299, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6Mjk5LCJpYXQiOjE3NTM3ODI4MjAsImV4cCI6MTc4NTMxODgyMH0.cT7cADXLmhrUy3KDlhYGHoE90mXksDfYkQKs-u7IOP0', 1, '2025-07-29 09:53:40', '2025-07-29 09:53:40'),
(45, 300, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MzAwLCJpYXQiOjE3NTM3ODI5NDUsImV4cCI6MTc4NTMxODk0NX0.Z-FTbqPwy274bJ04VXoYOOqhMIAlyEaJMXyCd_pUp8E', 2, '2025-07-29 09:55:45', '2025-07-29 09:57:59'),
(46, 300, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MzAwLCJpYXQiOjE3NTM3ODMwNzksImV4cCI6MTc4NTMxOTA3OX0.neMvQDEk0mMaIg18_2XghJmn29gmjQza8s_Umg8FOVw', 2, '2025-07-29 09:57:59', '2025-07-29 09:59:54'),
(47, 300, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MzAwLCJpYXQiOjE3NTM3ODMxOTQsImV4cCI6MTc4NTMxOTE5NH0.4gvXeUPFfdcLweO8yezGRHt8qdIxmVd3pRfbPzBdaYg', 1, '2025-07-29 09:59:54', '2025-07-29 09:59:54'),
(48, 250, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjUwLCJpYXQiOjE3NTM3ODYzNDAsImV4cCI6MTc4NTMyMjM0MH0.557i8z6vtXohWUbndY9uEbAafi7O4GkeUcAQi_elCA8', 2, '2025-07-29 10:52:20', '2025-07-29 10:53:55'),
(49, 250, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MjUwLCJpYXQiOjE3NTM3ODY0MzUsImV4cCI6MTc4NTMyMjQzNX0.GqusB6QIBLT5GoUvHt34TopXE9x1GkrQ2orrmxDjx0Q', 1, '2025-07-29 10:53:55', '2025-07-29 10:53:55'),
(50, 255, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVXNlciIsInN1YiI6MjU1LCJpYXQiOjE3NTM3ODY2NTAsImV4cCI6MTc4NTMyMjY1MH0.657Jjw6V6RLDPwJe4XElz1MOePWGVJMJ5ws6kG8uevw', 1, '2025-07-29 10:57:30', '2025-07-29 10:57:30'),
(51, 301, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQ2FwdGFpbiIsInN1YiI6MzAxLCJpYXQiOjE3NTM3OTM1NjIsImV4cCI6MTc4NTMyOTU2Mn0.dG76vHZ86QWL8jf4daElMkgjRX1RxgW3_aX_8t8SML4', 1, '2025-07-29 12:52:42', '2025-07-29 12:52:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id\r\n',
  `booking_id` int NOT NULL COMMENT 'bookings.id',
  `active_bank_id` int NOT NULL COMMENT 'banks.id',
  `amount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Pending,2-Paid',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`id`, `user_id`, `booking_id`, `active_bank_id`, `amount`, `file`, `transaction_status`, `created_at`, `updated_at`) VALUES
(1, 1, 57, 1, '', NULL, 1, '2024-12-27 12:41:03', ''),
(2, 1, 58, 1, '', NULL, 1, '2024-12-27 12:41:03', ''),
(3, 1, 59, 1, '', NULL, 1, '2024-12-27 12:41:03', ''),
(4, 48, 60, 1, '', NULL, 1, '2024-12-27 15:06:50', NULL),
(5, 48, 61, 1, '', NULL, 1, '2024-12-27 15:25:57', NULL),
(6, 43, 62, 1, '', NULL, 1, '2024-12-27 15:35:54', NULL),
(7, 48, 63, 1, '', NULL, 1, '2024-12-27 15:36:32', NULL),
(8, 48, 64, 1, '', NULL, 1, '2024-12-27 16:25:20', NULL),
(9, 43, 65, 1, '', NULL, 1, '2024-12-27 16:44:35', NULL),
(10, 43, 66, 1, '', NULL, 1, '2024-12-27 16:52:46', NULL),
(11, 43, 67, 1, '', NULL, 1, '2024-12-27 16:53:49', NULL),
(12, 43, 68, 1, '', NULL, 1, '2024-12-27 16:55:14', NULL),
(13, 43, 69, 1, '', NULL, 1, '2024-12-27 16:55:22', NULL),
(14, 43, 70, 1, '', NULL, 1, '2024-12-27 16:58:43', NULL),
(15, 43, 71, 1, '', NULL, 1, '2024-12-27 17:07:15', NULL),
(16, 48, 72, 1, '', NULL, 1, '2024-12-27 17:52:59', NULL),
(17, 48, 73, 1, '', NULL, 1, '2024-12-27 17:56:01', NULL),
(18, 48, 74, 1, '', NULL, 1, '2024-12-27 18:23:52', NULL),
(19, 43, 75, 1, '', NULL, 1, '2024-12-28 11:10:52', NULL),
(20, 49, 76, 1, '', NULL, 1, '2024-12-28 11:12:58', NULL),
(21, 48, 77, 1, '', NULL, 1, '2024-12-28 11:13:57', NULL),
(22, 50, 78, 1, '', NULL, 1, '2024-12-28 12:17:18', NULL),
(23, 50, 79, 1, '', NULL, 1, '2024-12-28 12:18:04', NULL),
(24, 43, 80, 1, '', NULL, 1, '2024-12-28 14:35:07', NULL),
(25, 43, 81, 1, '', NULL, 1, '2024-12-28 14:36:22', NULL),
(26, 43, 82, 1, '', NULL, 1, '2024-12-28 14:54:39', NULL),
(27, 43, 83, 1, '', NULL, 1, '2024-12-28 14:55:00', NULL),
(28, 43, 84, 1, '', NULL, 1, '2024-12-28 14:56:38', NULL),
(29, 43, 85, 1, '', NULL, 1, '2024-12-28 14:59:20', NULL),
(30, 43, 86, 1, '', NULL, 1, '2025-01-02 14:06:05', NULL),
(31, 43, 87, 1, '', NULL, 1, '2025-01-02 14:06:37', NULL),
(32, 43, 88, 1, '', NULL, 1, '2025-01-03 13:22:33', NULL),
(33, 43, 89, 1, '', NULL, 1, '2025-01-06 07:19:29', NULL),
(34, 50, 90, 1, '', NULL, 1, '2025-01-07 08:30:11', NULL),
(35, 50, 91, 1, '', NULL, 1, '2025-01-08 16:19:01', NULL),
(36, 43, 92, 1, '', NULL, 1, '2025-01-15 08:22:31', NULL),
(37, 43, 93, 1, '', NULL, 1, '2025-01-15 09:16:04', NULL),
(38, 63, 94, 1, '', NULL, 1, '2025-01-15 13:11:04', NULL),
(39, 63, 95, 1, '', NULL, 1, '2025-01-15 13:12:58', NULL),
(40, 63, 96, 1, '', NULL, 1, '2025-01-15 13:13:55', NULL),
(41, 63, 97, 1, '', NULL, 1, '2025-01-15 13:14:13', NULL),
(42, 63, 98, 1, '', NULL, 1, '2025-01-15 13:14:39', NULL),
(43, 63, 99, 1, '', NULL, 1, '2025-01-15 13:16:08', NULL),
(44, 63, 100, 1, '', NULL, 1, '2025-01-15 14:08:20', NULL),
(45, 65, 101, 1, '', NULL, 1, '2025-01-16 06:54:09', NULL),
(46, 65, 102, 1, '', NULL, 1, '2025-01-16 06:56:35', NULL),
(47, 65, 103, 1, '', NULL, 1, '2025-01-16 06:57:05', NULL),
(48, 64, 104, 1, '', NULL, 1, '2025-01-16 07:15:03', NULL),
(49, 63, 105, 1, '', NULL, 1, '2025-01-16 09:29:59', NULL),
(50, 66, 106, 1, '5000', 'uploads/A6DOT8kpGfBUnjrm38LJKtBkuxOZ64VVviyjxkrU.pdf', 2, '2025-01-16 12:58:39', NULL),
(51, 65, 107, 1, '10000', 'uploads/4JFp7zLHz4MTSdxh2AmqzX22HxcV05HF6W0dANLp.png', 2, '2025-01-17 16:49:46', NULL),
(52, 68, 108, 1, '3000000', 'uploads/7flSGGhhnFovwmwr4PNFi2jnRfXwvuxqtvHwTL7Z.pdf', 2, '2025-01-19 09:17:59', NULL),
(53, 69, 109, 1, '3000', 'uploads/4Q3sNxNkM2CjMtZSNaJNZ0FvVBsT5pfJo9xZifHe.pdf', 2, '2025-01-20 07:57:01', NULL),
(54, 63, 110, 1, '30000', 'uploads/G1DGei5Rvsm6uAgNarCTyHPcQM2SiZG6t3fxTOWr.pdf', 2, '2025-01-20 10:29:56', NULL),
(55, 63, 111, 1, NULL, NULL, 1, '2025-01-20 10:45:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_update_profile_request`
--

CREATE TABLE `tbl_update_profile_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `field_value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `field_type` int NOT NULL COMMENT '1-Mobile,2-Email',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Pending, 2-Approval,3-Reject',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_update_profile_request`
--

INSERT INTO `tbl_update_profile_request` (`id`, `user_id`, `field_value`, `field_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '9756188580', 1, 2, '2024-10-07 10:50:49', NULL),
(2, 1, 'shadab.nerasoft@gmail.com', 2, 2, '2024-10-07 11:24:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicle`
--

CREATE TABLE `tbl_vehicle` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kilo_meter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_charges` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `seater` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_vehicle`
--

INSERT INTO `tbl_vehicle` (`id`, `title`, `image`, `kilo_meter`, `extra_charges`, `seater`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bike Lite', 'vehicle/peDWYSYxiarKt0fkWxLYRSxO2hQ2Uvc8GeNMgcpB.png', '12', '2.04', '1', 1, '2025-04-08 10:36:19', '2025-07-13 06:09:51'),
(2, 'Cab Mini  Alto, Spress etc.', 'vehicle/vD0qsqpBGRtnWuwvxeCLotxFm96N7YTa0zMsURhu.jpg', '22', '3.74', '4', 1, '2025-04-08 10:38:25', '2025-07-13 06:07:31'),
(3, 'Cab Sedan Amaze, Dzire etc.', 'vehicle/IiF4Ht4bggdxS5QRd4idLMBlPbOwTjtcMs270KFU.png', '24', '4.08', '4', 1, '2025-04-08 10:38:56', '2025-07-13 06:07:08'),
(4, 'Cab XL  Ertiga, Innova etc', 'vehicle/LAgsKFYHYwejw8ptOveEbDPQYW49t7MCioppQnqG.webp', '28', '4.76', '6', 1, '2025-04-08 10:40:00', '2025-07-25 04:46:01'),
(5, 'Auto', 'vehicle/nKsTBOjzVN1eHqmdPueNJxE8JWvPCRqqTtgccamY.jpg', '20', '4', '3', 1, '2025-07-13 06:44:05', '2025-07-15 11:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vehicle_image`
--

CREATE TABLE `tbl_vehicle_image` (
  `id` int NOT NULL,
  `user_id` int NOT NULL COMMENT 'users.id',
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1-User With Vehcile Image, 2- Vehicle Image',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vehicle_image`
--

INSERT INTO `tbl_vehicle_image` (`id`, `user_id`, `image`, `type`, `created_at`, `updated_at`, `status`) VALUES
(1, 296, 'vehicle_image/aoN0RosAerOmANJ44iIp5jbb1eUAUHY05en9SvDf.jpg', 2, '2025-07-29 09:23:47', NULL, 1),
(2, 296, 'vehicle_image/5yT0NcoaDIQnqNJakHNezfPRzNldIaNHTDtp497N.jpg', 2, '2025-07-29 09:23:47', NULL, 1),
(3, 296, 'vehicle_image/6ou2STe6ETHKYFHCqe0d60GwnsANQqgZMEu53et5.jpg', 2, '2025-07-29 09:23:47', NULL, 1),
(4, 296, 'vehicle_with_driver/2d3BR1k3YvGq7MbtWfFUWjhiJ5EMlisNkQI2oK54.jpg', 1, '2025-07-29 09:23:47', NULL, 1),
(5, 296, 'vehicle_with_driver/ZQVYEveuBQmWHKOVF1hJW8CuLByHBmlehXLvZXEh.jpg', 1, '2025-07-29 09:23:47', NULL, 1),
(6, 296, 'vehicle_with_driver/EslP4BP2cfAiLkQN7W4ZA0EsM6WdPvCj0t0PZSVL.jpg', 1, '2025-07-29 09:23:47', NULL, 1),
(7, 299, 'vehicle_image/lQdS7oUMg9N0Fit8Ezg6B8ORXdyhmQoStsjobBmv.jpg', 2, '2025-07-29 09:55:41', NULL, 1),
(8, 299, 'vehicle_with_driver/NlBbQmM32tUtR4KRrbbbyn53X20TCF6dlHcOa9To.jpg', 1, '2025-07-29 09:55:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `testimonals`
--

CREATE TABLE `testimonals` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_count` int NOT NULL DEFAULT '3',
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonals`
--

INSERT INTO `testimonals` (`id`, `name`, `image`, `rate_count`, `designation`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lead', 'testimonial/XRPMCOfhvnuJPWpfVlOqkhNkozRapqUuAFKfHgpS.png', 4, 'Lead Designer', 'It Was Very Good Experince', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus nibh mauris, nec turpis orci lectus maecenas. Suspendisse sed magna eget nibh in turpis. Consequat duis diam lacus arcu. Faucibus venenatis felis id augue sit cursus pellentesque enim arcu. Elementum felis magna pretium in tincidunt. Suspendisse sed magna eget nibh in turpis. Consequat duis diam lacus arcu.', 1, '2024-12-01 08:33:37', '2024-12-01 08:41:23'),
(6, 'Fazlu Rehman', 'testimonial/qkWfRXlKKRIS9Irqo1IIp2lDpsfFsXVfzGPJtpeF.jpg', 5, 'Developer', 'it is Amazing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus nibh mauris, nec turpis orci lectus maecenas. Suspendisse sed magna eget nibh in turpis. Consequat duis diam lacus arcu. Faucibus venenatis felis id augue sit cursus pellentesque enim arcu. Elementum felis magna pretium in tincidunt. Suspendisse sed magna eget nibh in turpis. Consequat duis diam lacus arcu.', 1, '2024-12-04 07:09:24', '2024-12-04 07:09:24'),
(7, 'Jack', 'testimonial/DxjHfKLJwZfvXcNlD0ccmJ2e2SvBzAIi9vuTMNkn.jpg', 2, 'CEO', 'Good Enough', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus nibh mauris, nec turpis orci lectus maecenas. Suspendisse sed magna eget nibh in turpis. Consequat duis diam lacus arcu. Faucibus venenatis felis id augue sit cursus pellentesque enim arcu. Elementum felis magna pretium in tincidunt. Suspendisse sed magna eget nibh in turpis. Consequat duis diam lacus arcu.', 1, '2024-12-04 07:10:58', '2024-12-04 07:10:58'),
(8, 'Ayush', 'testimonial/HrbbulswsLf0f3boHyKJZFB16QG5bxgnCNe8qHIP.webp', 4, 'CEO', 'I would highly recommend…', '\"I’ve been using [Product/Service] for the past three months, and it has truly exceeded my expectations. The ease of use and excellent customer support made my experience smooth and enjoyable. After using it, I saw a significant improvement in my [specific problem], and I’m now more efficient and organized than ever before. I highly recommend [Product/Service] to anyone looking for a reliable solution to [problem].\"', 1, '2024-12-05 07:37:28', '2024-12-05 07:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int NOT NULL COMMENT 'roles.id',
  `car_id` int DEFAULT NULL COMMENT 'tbl_vehicle.id',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_front_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_back_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_front_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_back_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'states.id',
  `ride_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tbl_state.id',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tbl_district.id\r\n',
  `ins_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ins_end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pollution_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pollution_in_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cab_com_permit_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cab_com_permit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_duty` tinyint NOT NULL DEFAULT '2' COMMENT '1-On , 2- Off',
  `is_booking_active` tinyint NOT NULL DEFAULT '2' COMMENT '1-active , 2-inactive',
  `ride_vehicle_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'city.id',
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `permanent_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'states.id',
  `permanent_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'city.id',
  `permanent_town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'tbl_vehicle.id',
  `vehicle_capicity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dl_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dl_validity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dl_front_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dl_back_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rc_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rc_front_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rc_back_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ins_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `police_verification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_amount` bigint NOT NULL DEFAULT '0',
  `reserve_amount` bigint NOT NULL DEFAULT '0',
  `withdraw_amount` bigint NOT NULL DEFAULT '0',
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1234',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_loggedin` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-InActive,3-Deleted, 4- Permanent Deleted',
  `fcm_token` text COLLATE utf8mb4_unicode_ci,
  `is_user_verified` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'non-verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `car_id`, `name`, `email`, `image`, `mobile_no`, `gender`, `aadhar_front_image`, `aadhar_back_image`, `aadhar_no`, `pan_front_image`, `pan_back_image`, `pan_no`, `state`, `ride_state`, `district`, `ins_image`, `ins_end_date`, `vehicle_number`, `pollution_image`, `pollution_in_date`, `cab_com_permit_date`, `cab_com_permit`, `is_duty`, `is_booking_active`, `ride_vehicle_type`, `dob`, `city`, `town`, `pincode`, `address`, `permanent_state`, `permanent_city`, `permanent_town`, `permanent_pincode`, `permanent_address`, `vehicle_type`, `vehicle_capicity`, `registration_number`, `service_expiry_date`, `dl_number`, `dl_validity`, `dl_front_image`, `dl_back_image`, `rc_number`, `rc_front_image`, `rc_back_image`, `ins_number`, `police_verification`, `password`, `account_number`, `ifsc_code`, `bank_name`, `wallet_amount`, `reserve_amount`, `withdraw_amount`, `lat`, `long`, `current_address`, `user_otp`, `remember_token`, `email_verified_at`, `is_loggedin`, `created_at`, `updated_at`, `status`, `fcm_token`, `is_user_verified`) VALUES
(1, 1, 0, 'Admin', 'admin@gmail.com', 'profile-pictures/676432dea09c1.png', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Uttar Pradesh', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, '201304', 'Assotech Business Cresterra, Plot No 22, Noida-Greater Noida Expressway, Gautam Buddha Nagar, Bajidpur - 201304, Uttar Pradesh, India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$J7WlZSseprMYZnCI54G4.eL.ONRo1eNbRRDBOYyS0qJPgTMZYkv2G', NULL, NULL, NULL, 0, 0, 0, '28.4957977', '77.4021124', 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', '1234', 'jR6xDHx3f8s2SviYVPkZbNvWdv57gKEgFvRkeNFgOL0myyRsHexThoO83cGu', NULL, '0', NULL, '2025-01-25 12:31:59', 1, NULL, 'verified'),
(250, 2, 2, 'Aman kumar', 'Karnacab@yahoo.com', 'uploads/profile/ce3JNL8d9VDInc8DguKOf09PDjSd5M4KUzud8h3E.jpg', '9534343483', 'Male', 'uploads/profile/fwS1IHPLZFV4SWrECafOjPYIfzrGba7rnI8KabYz.jpg', 'uploads/profile/9SBNbitT2tRXmTTtUwcrLdF5hly45BRszdsBbCaS.jpg', '763950383232', 'uploads/profile/1QHg55pKytu4PYWwqHMXb7Pmu4G2gbAEpknOelRW.jpg', 'uploads/profile/NxEwJXKWyQCDUuVEJXKQGtI4otKNL8Px42eOQ4x3.jpg', 'DXFPK5938G', NULL, '2', '22', 'uploads/profile/XWug4ZZ90WViEOcjXtLGNGACXmphOfQldXWjSdSX.jpg', '2026-04-28', 'BR19T5876', 'uploads/profile/niTMMMur9PqL4CP0xyYO6EaqIkIneZLKhf6rqXOv.jpg', '2026-04-08', '2026-04-28', 'uploads/profile/m70AmI04ydtyVjC5An8gn84KWkrK0hp56b19Ztq2.jpg', 2, 2, 'Car', '1997-10-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BR1920160030086', '2036-12-04', 'uploads/profile/PvWrgiDwGwoLNtG03IY6KQ1e0oAZCgOpkD3iNeTg.jpg', 'uploads/profile/t0LQawm9GCJVYJXd9HQEhgytw0hHrMul6UJ3ZNIK.jpg', 'XUV300 W8', 'uploads/profile/4i05I0VJJ8n5F2DET5gvPsFgfuVIrqM803aQRFWB.jpg', 'uploads/profile/qqy4JNEKss2fZwDyTIVbGujK2ZXxGUTecQaaz8wU.jpg', NULL, NULL, '$2y$10$twrwcx5hnLK54QtD.pR7MOs1kNJdDEYoRSIskQ9vYlri5d8FgyuCy', NULL, NULL, NULL, 0, 0, 0, '25.8851823', '86.5979805', 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', '1234', NULL, NULL, '0', '2025-07-21 11:39:18', '2025-07-29 11:24:39', 1, 'eB7OYEh6TyWzBWr-G9-qRI:APA91bEfBPlDieob8C4U7Gq5WZQw3oN_W6gXPFmJvc_9CUUzebja9i16yyxxpa66RoSAHOLPVo8OTmwLJbOo3JBn0XAkdmKKeSQmR4ovenG9BZX6VYgHFQM', 'verified'),
(252, 3, NULL, 'Mahesh Kumar', NULL, NULL, '8826626739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$fH5XIMLPmw2.kqFP6sWc6eSWiKhRqeWcpyWDB175RbnCIEVRK7fTG', NULL, NULL, NULL, 0, 0, 0, '25.9484602', '86.54559', 'WGXV+7RQ, Sihoul, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-21 12:18:39', '2025-07-21 12:19:03', 1, 'cKEn3ZKZTXeUJeNasfUOBC:APA91bE__G6mHz0EAvK5T9OgH4tpjArQClZi3K9TN9D5t5gXMImBFbEQKI6-IRp8YmiMAPy6Ef4f_o4b_6aNgD6CNlaknBd_cnBqsnnl_1h1e2rTSotvywg', 'non-verified'),
(253, 3, NULL, 'Sajan kumar', NULL, NULL, '7258958153', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Gz1ugV6MJkcIGqYi31XZZO8.qA1r6CH49Yp8PKIBFlXKIevRdD5UO', NULL, NULL, NULL, 0, 0, 0, '25.9300399', '86.4549414', 'WFJ3+2X Chandrain, Bihar, India', '1234', NULL, NULL, '0', '2025-07-21 12:21:20', '2025-07-21 12:21:25', 1, 'c8e3NCj_Qw26LKJ0vIi17N:APA91bGwi4qtaDwdYBRiTAlFmUnh3YG8WDAj4t-cbbyo0GG4NenOiYBkIRy0dZsWHoc2VUs7EtTTTG0XsUhwNEu4uM5aG9jGwol4_g79Mnd9MzFX_qwu1GM', 'non-verified'),
(254, 3, NULL, 'Kennedy Boss', 'Eraman08@yahoo.com', 'uploads/profile/1gQSbdGlQr2XB7lMdZtNCKY8cdHmHc4FOFFpEUR1.jpg', '9523707084', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, '1997-10-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$HU/miTzLepKEDhU96hZ6aOhURke4XxKjn7iAn5uGmxzjX8JeiNdy.', NULL, NULL, NULL, 0, 0, 0, '25.8777818', '87.8346033', 'Railway, Station Road, near Loknath Temple, Dalkhola Railgate, Farsara, Dalkhola, West Bengal 733201, India', '1234', NULL, NULL, '0', '2025-07-21 16:16:56', '2025-07-25 04:42:57', 1, 'fRxlicm_TfGRpGSk-OcZe0:APA91bHu1q6cRYai96mPLLAWlIMMTX2Ngn-azYg-rbR70unnjXnfR7Pz9NJLSAqTkXHwYj68C_H567IfW6QP93zsxXrwrq9EsPMFSF1mXlFXbfs5MVRgHGQ', 'non-verified'),
(255, 3, NULL, 'Abhi Chadha', NULL, NULL, '7889351360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zUcP6OHW/Fd6zZn11X41GuOH8t1krhiB3mCDf5hyUngeZnZB5OwPy', NULL, NULL, NULL, 0, 0, 0, '25.8851674', '86.5979678', 'Panchwati chowk, Rajwanshi Nagar, Saharsa, Bihar 852201, India', '1234', NULL, NULL, '0', '2025-07-21 16:30:23', '2025-07-29 11:17:15', 1, 'cLCO-oFKTPKoVuuAoiyKLt:APA91bEdc5ItmYLQ8q95KlkSadpYbThwa_8MctJ8PMcH1UCjUJATfo02IaOd5-EcJuVcdTbHswNazIa-XIHmWbc48g8hpxdW2np8frxCCNm5CvxFVIH3NTw', 'non-verified'),
(256, 2, 5, 'Bhupendra', NULL, NULL, '8809001741', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Bike', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$EwI3x5wzQdxCMbE1YbluN.o9KW7o90bZFVoVyrkwJ2uUs0iIlcHxm', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '1234', NULL, NULL, '0', '2025-07-22 02:39:57', '2025-07-22 02:40:51', 1, 'cEXGjTKOQeOv-ASm9c0TcC:APA91bE8zqh12bIABL3LSSQieJA25LWKjG1xis8W5CCvolw9SEsttA8FNqoDOQlmuBRrz8KV3ftQkL2J2y8T-IDxnkTj53Hbg6tAkTB2NE6lBcZ9B5GkHXo', 'non-verified'),
(257, 3, NULL, 'Jay kumar', 'Jaysaharsa@@gmail.com', 'uploads/profile/Cqv4puBvQ7ntFaRi6s47ahQrK55xG0Mgrsburw18.jpg', '7631262079', 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, '1980-04-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$HNAE.2vKAw4UrqGowPA/bejxD04ToqiBI09u6opu7ADcKvAkyxzmK', NULL, NULL, NULL, 0, 0, 0, '25.8940728', '86.5928225', 'VHVR+JR2, Police Line, Saharsa, Bihar 852202, India', '1234', NULL, NULL, '0', '2025-07-22 07:08:12', '2025-07-22 07:15:16', 1, 'diP_9hPSThaHyQ6wkbxkdg:APA91bGENrh1928mqnn4rYu9B-RfquZPHz2_K2bZhuHNGAOUs-5pf-9zag_T01b0JisSnemdcNr1K4Yepr5AUPbXhFb6GtWi5g4wAWuqSEJrcp--lXFK9oE', 'non-verified'),
(258, 3, NULL, 'fazlu rehman', NULL, NULL, '8700682075', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$5D3b8PJBiyC.g8EFwQYEzeVO.uF0aUCUTA8cZcIMWUt2vMo06f6B.', NULL, NULL, NULL, 0, 0, 0, '28.4958785', '77.4019956', 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', '1234', NULL, NULL, '0', '2025-07-22 07:38:36', '2025-07-23 06:06:58', 1, 'cb4qPzkjS5GhP4vN_ttEpd:APA91bG6YXT9nU1bP8trnMYI_4YKWDqNLlfvDifxHyIrQF52Ok0o_gMB_R_uApRx_jDeVhjfT6pfPsPXt03WPT6j1nQAgws2PLrxBRqBnUPDm8I9TSYpvDI', 'non-verified'),
(263, 3, NULL, 'Karan Sahani ji', NULL, NULL, '7042739659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$v3SCIdR7iBHC.wD6SxlIYezck9uvxNIYNClWdfR/9fNN1C9dOSiFK', NULL, NULL, NULL, 0, 0, 0, '25.8940903', '86.5926231', 'VHVR+JR2, Police Line, Saharsa, Bihar 852202, India', '1234', NULL, NULL, '0', '2025-07-22 08:11:44', '2025-07-28 07:42:03', 1, 'eS5iDDEMQEGZLQOdZOPjIf:APA91bEVgXjOxj2L1o-q_64RG9w-Sve12FJ0RwsCOXOQk1etIibIrqsfmylBJeowrxa9QtIxOBUaKqYATagiyq0IgIRHGNGNOyDhwOkvNgEHWjOnOcgc9E0', 'non-verified'),
(264, 2, NULL, 'Mannu kumar', NULL, NULL, '6207496622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$D/gnEfsfHx53XHxZe7pOi.lnCIqSYI.Wz6FtRrwhw0V6DMcsPcNFy', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '1234', NULL, NULL, '0', '2025-07-22 12:35:25', '2025-07-22 12:36:03', 1, 'ej9gHRcMRF6c8t9wAaVh2C:APA91bGqAXTp2tiULVjvRdJTf5hZ0KRUfT5JbnPcDtyCKGZp_yLOqVR-2KZbube9aY8zzXa8ax888jUwl1kz0OC9UTs2VGu9S3PFcv6bV8kaLyuEQT-Qie0', 'non-verified'),
(265, 3, NULL, 'Mannu kumar', NULL, NULL, '6207496622', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$dM/.DYb2yYbx0liAO9bcseXkjiRxhQ0mcooY33iGk9fF05BZtNOPu', NULL, NULL, NULL, 0, 0, 0, '25.8682268', '86.5195083', 'VG99+6RW, Bangaon East, Bihar 852212, India', '1234', NULL, NULL, '0', '2025-07-22 12:38:47', '2025-07-22 12:39:36', 1, 'dzzl9iIBTdSEl4Hr0HHz5w:APA91bH-9VUNXEd2kHGVurLTABd7TE0Q4AS9VqJCQW9uZ3eNkHWmAQGmhgg6ga6UfxtpJuMTib3apCwiRblRrt5CM1c1stXc4H1OStFij09578dtN_FPDR8', 'non-verified'),
(266, 3, NULL, 'Neti kumar', NULL, NULL, '6201347038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Ua1HNYhvMtq6C3RjzFyYRe.BdHGUg95vfjCDIEKbc6ZYW2EpSSNMm', NULL, NULL, NULL, 0, 0, 0, '25.8683763', '86.522745', 'VG9F+924, SH66, Bangaon East, Bihar 852212, India', '1234', NULL, NULL, '0', '2025-07-23 02:57:30', '2025-07-23 02:57:34', 1, NULL, 'non-verified'),
(267, 3, NULL, 'Amet vickram', NULL, NULL, '7070600783', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$P1u4c2biUTvqW/BUE1UXlemvOk7RksJ/D43toSOC.Th49MIXI6TH2', NULL, NULL, NULL, 0, 0, 0, '25.4158798', '86.2055254', 'Lakho, Bidupur Bazar - Railway Station Rd, Chak Barauna, Bihar 851126, India', '1234', NULL, NULL, '0', '2025-07-23 03:21:36', '2025-07-23 03:22:00', 1, 'd_ZiFPBVSo2TvuAgi9aW4W:APA91bHIf27H1CsCgEhkvhUjXxmZzLyRqwvTGBbGHLr70ezZwa3z7UCSwaSU-1tR9A5GzTm0oOiTpDdAA57GOkiC0GGCu8xpn-GkVVwHtPxCT9OGvIeTYnU', 'non-verified'),
(268, 3, NULL, 'Ritesh Kumar', NULL, 'uploads/profile/u9SKfQuVxK52Q5ro0wE81854tjYiyw6kirbKztx0.jpg', '7033191993', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$QwJ4StCNhjDzYZHbAAsq/.Cb0AmYswujyhFThQ878up3HjH5Gt8z.', NULL, NULL, NULL, 0, 0, 0, '25.8249322', '86.3394188', 'R8FQ+XQ Bishunia, Bihar, India', '1234', NULL, NULL, '0', '2025-07-23 03:42:45', '2025-07-23 03:53:24', 1, 'ffTtbxe5TxO4ykoljiJzvJ:APA91bEtTQGqFJ3RixLNqJTcuvZtxvJzQ368jZ83LaC6gXcnAO59TcoYyxQJVgOyPgwXxVcDzUSIUVvJxQ_Ye5wbvC__qwocPUgQpeT3E28qWvBveFCcnl8', 'non-verified'),
(269, 2, 1, 'Ritesh kr (RH Patna Karnacab)', NULL, NULL, '7877163134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Bike', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ulQmDU9HDfixnnuzBZ0bP...42XZentHgUVCYS1r1ItqSwl9WQnxq', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'R8FQ+XQ Bishunia, Bihar, India', '1234', NULL, NULL, '0', '2025-07-23 03:49:37', '2025-07-23 03:50:07', 1, 'cM4L0yCGRmmt_-MJJGVXyQ:APA91bFA97nNprejErNG6kgV0k9adi8my5DUCLOP_zC5TVONGleZvtYP-nuXY0Qyys3g2D_tLxIH6cluuvySS5WQby-I6fzYis45qNj4REfaU0Lai4JNBJ0', 'non-verified'),
(270, 3, NULL, 'Chanchal kumar', NULL, NULL, '8651554082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$sFmicZ4/Vn/UpKMwBuysuOw87n8nTNYSgisoeDei59VfCNz/EboTW', NULL, NULL, NULL, 0, 0, 0, '25.9605773', '86.5585263', 'XH65+33W, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-23 04:04:00', '2025-07-24 14:03:06', 1, NULL, 'non-verified'),
(271, 2, 4, 'Mahesh Kumar', NULL, NULL, '8826626739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$m4UJW43.I9AlKHayJSVIEumz9ZUCGMpnBL7a.6U6ryKRjEUWXTtPC', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'XG5X+M56, in front of Shambhavi motor bike showroom, Bihra Panchayat, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-23 04:45:48', '2025-07-23 04:46:15', 1, NULL, 'non-verified'),
(275, 2, 1, 'fazlu 8826626739', NULL, NULL, '8700682075', NULL, 'uploads/profile/Qdaw6eIrC3JWvjQfCMZRKUOaFyMYuxntPlMVJzVQ.jpg', 'uploads/profile/Bc8Uq0sIBsNNucpB25zSuWQMVAAMpoUr0ioCTZ3T.jpg', '757278428753', 'uploads/profile/XrkaiPZWa32efwel9xXdtA7LnCnhJjPWTWWTWBJ8.jpg', 'uploads/profile/6Py71QIGrnW6YUoT8XMIaPWC2sCA8JNcHdMxedeb.jpg', 'GDUEE7652H', NULL, '2', '3', 'uploads/profile/s2mapjRfDkzsYT6wvP4CASSDh6dtCFYahHOpcvht.jpg', '2094-83-44', '4786578333', 'uploads/profile/UswUfbs4L8Ukmlo4DNHWJaZa0eTIoeRwsWgdcZXW.jpg', '7347-34-14', '3247-28-74', 'uploads/profile/U2VArcmvgpTO1k5oOmfQ7rvwJKXwXiy6Tjsjt4xH.jpg', 1, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '784378678378', '2000-84-93', 'uploads/profile/PuVCij6pJJyH6vLHfsSdiCTYRIvc2RDsYbZ4DVdo.jpg', 'uploads/profile/55bsz7nB2fLWzVNeLbdC8O0yQvdhp1IRdoRodrAX.jpg', '3212414', 'uploads/profile/OJzn5DAhxlLe5PeFqQuIBEXLKXCRcqwIvUxNb1iH.jpg', 'uploads/profile/HLDa4HiNhDfSaT6KmI1twdpj78f7WqBhxKVazTEk.jpg', NULL, NULL, '$2y$10$rz7.U1J42gipZRYcxvrLqO5bk.CubhJmGsl6KcDRje0B4vn5R99V6', NULL, NULL, NULL, 0, 0, 0, '28.4990907', '77.3937451', 'Maharajganj, Uttar Pradesh sonbarsa, F9XV+MG7, Wazidpur, Sector 130, Noida, Bajidpur, Uttar Pradesh 201304, India', '1234', NULL, NULL, '0', '2025-07-23 05:36:31', '2025-07-29 09:42:42', 1, 'cZlC6edtRLyxceYsKMdatl:APA91bGj0TlaN9LDkfl9SoLAvgBy5zeBDQPPh1hHZmoRMYN4oMgVOp0QR4WVYUm53oz96A4IM9FVoBUfWSHPAKxCvE316CXr_TOYfbjo1f3qNhv61yfgOCg', 'verified'),
(276, 2, 4, 'Md Shamim', NULL, NULL, '7979018967', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$oxET6PXvLXACt1aCHg8nL.xtNozd58aCt/IiZH4nMk.5LQQjuf57a', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'jeans Junction shop No-10, pani tanki Rk thakur, Vidyapuri, Balwa Punarwas, Supaul, Bihar 852131, India', '1234', NULL, NULL, '0', '2025-07-23 05:42:36', '2025-07-23 05:43:15', 1, 'f4g24Q-TSSy74anf7lF80q:APA91bFEVVrpFhMBSuR0tfemm5ECcNRBlW0swZY5i87Gtu2R16RaaXnV04cNnK78oMt2oY8vZ61OO8amXWzQ8DYQABuxMM9coFLBSbzUyiIXsvNps3Db8aw', 'non-verified'),
(277, 2, 5, 'Mithesh kumar', NULL, NULL, '9343393324', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$aO2qu.Byalyv7NyWUphFU.c0IzpB1JwaVlyoFWyyoBmvDTHxyaJ.y', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'VGRM+M3 Balha Patti, Bihar, India', '1234', NULL, NULL, '0', '2025-07-23 11:36:56', '2025-07-23 11:37:32', 1, 'c6lhEl37ShOtTkrds7Aez0:APA91bG1CF3yvyZRy2uU8CGMC2fY2hnf9XhyNghawYjQbeTkR7I_X8HuB82pS44CKJKQLJ2i-cHGLhu2rB_zKRTs-01edAsOxNI6GHoDRWNtlmGCFwC-IJQ', 'non-verified'),
(281, 3, NULL, 'Mukoond kumar', NULL, NULL, '8521368022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$dyVuBjTYbCM.2H50P2Jxp.kLRE/wPTeVcG..ESbjBqTdG3jXvGyFi', NULL, NULL, NULL, 0, 0, 0, '25.9571331', '86.5465464', 'XG4W+RF9, SH66, Bihra Panchayat, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-24 04:19:27', '2025-07-24 04:19:32', 1, 'fWFHazIwTU6w-s4SScVtKJ:APA91bHPcV781tWSvDa1oULcuuGQTtvH9N3tOXI1QXRLJugl21YGA5bpxwYsrdgql0gpUvhhW_BdlKWxUQW0I3hkGNL6J-SIdaCg9IkFo1VG8s8F57-EM4M', 'non-verified'),
(282, 2, 5, 'Mukoond kumar', NULL, NULL, '8521368022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$LaYe9Pf5RcLojAvrU7QIqe6dMBjvudvdYH3b/GP5mUzCq6slE5Cmq', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'XG5X+M56, in front of Shambhavi motor bike showroom, Bihra Panchayat, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-24 04:22:15', '2025-07-24 04:22:47', 1, 'dxk29LQXSh6NJLSVAXq9li:APA91bFPDeAMFZyP4X_qYied-HlMopMQzfKGEd63tWKLL3KwjFNjiAUvV9Dctt2ZZdngm_DRlZ7xJHYVSWHTWaQNE6pKSDq3tbDmbKfyu5aT01nh2hBXmXs', 'non-verified'),
(283, 2, NULL, 'uniq', NULL, NULL, '9343393322', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$mss/x7LXxycIdMUMskQCze1p3./egtX.6kgtkXAKxCb.A210mfFE2', NULL, NULL, NULL, 0, 0, 0, '25.8940728', '86.5928225', 'VHVR+JR2, Police Line, Saharsa, Bihar 852202, India', '1234', NULL, NULL, '0', '2025-07-24 04:43:03', '2025-07-24 04:43:03', 1, NULL, 'non-verified'),
(284, 3, NULL, 'Kunal Roy', NULL, NULL, '7645076522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$sx8mtXpOACdsWgsRvPz4h.EOR/RJBIFG3mhDu4IfkauR.TnpnOGAK', NULL, NULL, NULL, 0, 0, 0, '25.8466855', '86.4125612', 'RCX6+3QC, Mahishi, Mangrauni, Bihar 852216, India', '1234', NULL, NULL, '0', '2025-07-24 05:48:01', '2025-07-26 16:18:29', 1, 'e20vexrgSxa-X06QGH0C3w:APA91bG-suPqIBjTtsF5zaTgaQ6YaUvIyD9A2JpDyw0UA8AKgfUMDnH1aqqGFH5TxigGgKIpAqTsc7lYqT8QLnHYwlmilr0ty_Px2UCz3QfOusa8oFbwwDY', 'non-verified'),
(285, 3, NULL, 'Bhupur thakur', NULL, NULL, '8809001741', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zi0pZcC1zGu7DPCwiKReEuhymdYrpdcn4L0c8A7Z4cIyhG/U/inTS', NULL, NULL, NULL, 0, 0, 0, '25.9636895', '86.5496921', 'XG7X+CRH, SH66, Patori, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-24 05:58:08', '2025-07-24 05:58:12', 1, 'dvqh2SNRRsO1bbX9mcEcUc:APA91bEeZ_tXBzfCOiTr_W7wZ6w_3LqrAbfkXgSaW32Hsl6O4xk0Bn3Ne4XK0FOQ7OE95e9vzKQgKJdzxBtYp-F_4gv_4kUH1u7o2KozKR2xBkVuAhh5pWI', 'non-verified'),
(286, 2, 3, 'Ķeñnédý', NULL, NULL, '9523707084', NULL, 'uploads/profile/88iHZ0qG7RAXGBH2SazP6PJvUtj1MMZqoXwYQ1MS.jpg', 'uploads/profile/fUjVWU2Xt71EI6fpVLxNxdQ14zUCkEoUs2OEIMEw.jpg', '080825258658', 'uploads/profile/ZTEnJhRB1al7CxrqKNw6bG7VOksr6jE3QaDXceJC.jpg', 'uploads/profile/iUyudjQPeEcuEL3MpcPwv97PK78mcmbV1CudhQ6s.jpg', 'PXPKP5656A', NULL, '4', '24', 'uploads/profile/VOW2SCCmUmMrmHykEJrFtuqUQKOVYLAgr3etesBY.jpg', '2026-09-09', 'Xuv300 w8', 'uploads/profile/B9KLpkNjg2A594aYRLQq8ZP2Z7Jjpa2cPZYVbROb.jpg', '2026-09-09', '2026-09-09', 'uploads/profile/PL1lx4j4CbFRTx7Cge9EgcoY0WhLV4UAvcTEcj64.jpg', 1, 1, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BR0133468', '2025-09-09', 'uploads/profile/vvoTeinKweNebjL95CdkbBsuESM6XtZXrHxOo5w1.jpg', 'uploads/profile/K7k4cTQh0lyHkHdnesvXQg5jfOWZ4l5JBNnC5da9.jpg', 'BR19T5876', 'uploads/profile/YMyIrTNcxvsmljGeBOacNQxH54qmLX3ifD62hiIy.jpg', 'uploads/profile/m6XXYd4dRgEsMOMe4D1mWy7dkUqZMPrnMAQ5xC1F.jpg', NULL, NULL, '$2y$10$XAmxjwQUA5b9i33f0Ma6iuIn5wi3nB2Gn72FkAR44duHL9.US1gIa', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'VHFM+QX7, Bangaon Rd, Krishna Nagar, Saharsa, Kahra, Bihar 852202, India', '1234', NULL, NULL, '0', '2025-07-24 06:29:35', '2025-07-29 10:49:38', 1, 'd31neeDlTBybJTYm4lOsij:APA91bGly_cQ_EQQUj_ixMTDlTiwNO6-zLxxmBJv95MgkdFiP4Q4Pa_zbYgKc1tAZSHk30SZ0WIhZHv7vj2vxIpGZ4jBJeI3Kf_HcAVYNsLKEMTXRzIYqn4', 'verified'),
(287, 3, NULL, 'Rahul kumar Bhushan', NULL, NULL, '8368884747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$6A4hBkGjMUJpYyVhQG.rseOODYLvIVNWyGUOQy3gH42ZUs3C4PUjS', NULL, NULL, NULL, 0, 0, 0, '26.0214215', '86.6036193', '2JC3+CM8, Baruari, Bihar 852110, India', '1234', NULL, NULL, '0', '2025-07-24 10:03:03', '2025-07-24 10:05:07', 1, 'f0EkJPFiTWi-38pqrCb58q:APA91bGHm8-8hfX-Zv1WxseX5nznyksOfPzVhsshauDDJyXboZG2zewZMFxsmeN3iKwswqofnhcAB76r1gUxtlidVNhf97VpULXYkOUKjnZSHHIecK8-N4Q', 'non-verified'),
(288, 2, NULL, 'Mukesh Kumar', NULL, NULL, '9279391157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Mln5/2sQ.1WRCLLvZ/4HuehpNeieSnlbygVLqTd3Y5ZxCxNV7igmK', NULL, NULL, NULL, 0, 0, 0, '25.8788177', '86.430625', 'VCHJ+H5Q, near Reshmi Fuel Center, Murli, Khairaha, Bihar 852216, India', '1234', NULL, NULL, '0', '2025-07-24 11:50:31', '2025-07-24 11:50:31', 1, 'fN_xP4hDR06LoYwcUjyax6:APA91bGAavvGJqaGONmIxCc67B2UhOrwNECoJHa6YCfffAcnrinkVDvQV0pZANmGxmLTjdDJY3Yq-kVKuNuUmX_k-HsJsuqXi9rDH17hKJMaNl0efRfh6XI', 'non-verified'),
(289, 3, NULL, 'Mukesh Kumar', NULL, NULL, '9279391157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$uhCoXGYNFkDpC7lz0PKB5.ajrGv7K4aJtEi4/vLUbpiDGKyvc8L1W', NULL, NULL, NULL, 0, 0, 0, '25.8788487', '86.4306628', 'VCHJ+H5Q, near Reshmi Fuel Center, Murli, Khairaha, Bihar 852216, India', '1234', NULL, NULL, '0', '2025-07-24 11:52:00', '2025-07-24 11:52:03', 1, 'fSJZ6gTbSyWge6NRo_g3jb:APA91bEvnQEwmeI7Bqk2CXBcLBv4BUOuJnMIcelI4d8QeIEJHKzM3_wkifhDEn6hioaztVm_-n45hfp4avhvgPtyxr0BlxpJCT3VsjUsFvXO5UIK8GqTEk4', 'non-verified'),
(292, 3, NULL, 'Sanjit rajak', NULL, NULL, '7070750994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$hKfy5fw/GEHY5wxu1cWLx.Eh1Bc1P34ToRumucSCbNRmuyt8G2uYO', NULL, NULL, NULL, 0, 0, 0, '25.9557719', '86.5582108', 'XH45+G49, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-25 15:54:50', '2025-07-25 15:54:55', 1, 'coZ5FPlcQYyqZfSfq5tCSv:APA91bHK-io1-iRoHJF0Kr_wVYgJffK-59_SayGAB7BGIdSl3IW1p3Zm86_0LG_by2UEGfWa9q9kDUY0_O_vESkq7Y18FLUjqJqsAscKztLIHi7iay5V1Y8', 'non-verified'),
(293, 2, 5, 'Sanjit rajak', NULL, NULL, '7070750994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$iTpifXgFP/ASdMb/mI/n5OxjIIABMb7f5f0WO6xbPL5cqi/kjf2UC', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '1234', NULL, NULL, '0', '2025-07-25 15:59:40', '2025-07-25 16:03:35', 1, 'ej2s3cMjRtGaTYa8NLym5Y:APA91bEcNF1bgoPPTs7c3jO6ytLTLVat9XIuDoJMdWIENhJrI5SK3VFrZyN1t7HtGxzJedc1gcDDvPNogHtQ3uf3Qk7WH1izaz3BPjXE6oR_lP9xcdNYWHM', 'non-verified'),
(294, 3, NULL, 'Shivam kumar', NULL, NULL, '9122563543', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$kW1pldHZYmnMQn1i60ODqufqoqYfCs2MHGblF2xlhpQEbemanyqOa', NULL, NULL, NULL, 0, 0, 0, '25.8983705', '86.5815509', 'VHXJ+8GM, Vinoba Bhave Path, Police Line, Saharsa, Bihar 852201, India', '1234', NULL, NULL, '0', '2025-07-26 15:34:17', '2025-07-28 17:08:02', 1, 'evlpNkBHTAWtr2NlYcaD1t:APA91bHzJQwadxCZjoAQrU5EsTy8UXMexydkh6g1ZJMHT7CM0dybes-Fu0m44YwQkFNV7Q_XyPiin1PbVsESeAq_rIPQs_-OC1U6Nr0vINciXOBtUwv6uEM', 'non-verified'),
(295, 3, NULL, 'Ugan thakur', NULL, NULL, '7462846420', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Iwy30hjx.uiuaIjDj7B.7eMiH12mfRWZbLk5evjuWGxOMkLcZ.Yw.', NULL, NULL, NULL, 0, 0, 0, '25.9588542', '86.5481144', 'XG5X+M56, in front of Shambhavi motor bike showroom, Bihra Panchayat, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-27 01:36:40', '2025-07-28 10:02:08', 1, 'dpEBATUySoaK7bnnP6_mnw:APA91bEHDRvfdZaW2ihsubiwXyRY9n7LAOzwrdttBJb20xbCv6bLYSSfRq3xYbtBghtIrBGmD5B94bpp7HmjoEcNJHB0HgPaNmESDimpxioZAb9mJ1Fvd7w', 'non-verified'),
(296, 2, 2, 'Fazlu Rehman', NULL, NULL, '7428059960', NULL, 'uploads/profile/LHMYj0v5lYa37IGDaMaoaHL9Mka1U0Gc96Sf587b.jpg', 'uploads/profile/nuVpbBZXixkwWUuzN4auqFgXY6UsNwABbNJFA5au.jpg', '994823248062', 'uploads/profile/EAgiNC9WOoEpY1T61iy1gZaoFi008RMwJyF8QhMf.jpg', 'uploads/profile/vt3EcFWPHFHf2LfU9lx9uRWeuoCsF32nowqskMJI.jpg', 'FQBPR8887Q', NULL, '2', '2', 'uploads/profile/OfNXWEmIzGlnO8DuQFSaLOgWLC82HFpMrKPu77Ol.jpg', '2027-08-14', 'DL7SCR8481', 'uploads/profile/prpylcfmFo8Ms23c8cUVuC0aiAxn9BktqBEnY6q0.jpg', '2027-12-09', '2028-12-23', 'uploads/profile/DlZy0DIOWZho7T5dkymltDX3RfCMQsQ9tKGwgYgH.jpg', 1, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3557858558', '2000-12-12', 'uploads/profile/B82nlWBEvNEyqCxjYJ9USwmSvPyrRoNGzcAMQPcB.jpg', 'uploads/profile/VgCT7OUwpLahfQIw2IwRhp0CUhkWhGM3QaIcvEAf.jpg', 'DL7SCR8481', 'uploads/profile/NCD01wJPQ6jeePMu1tnDzn2oF4HukGocLTDvP0CE.jpg', 'uploads/profile/8gGmFjfciKzv6wVU5zTVRFODlYZxtbAnU0EB9ruR.jpg', NULL, NULL, '$2y$10$PjCa1rmFFiLdluvgMX6nYuHaUqUOdVpidFq4ZLAD/5JVT3dF5oj/m', NULL, NULL, NULL, 0, 0, 0, '28.4957696', '77.4021378', 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', '1234', NULL, NULL, '0', '2025-07-29 09:20:49', '2025-07-29 09:41:51', 1, 'dMUVM2GNTcGB5upvbbk-KV:APA91bH8ShU6eDWBGWsp_y7iH7Kndnvsz4O4x714b_hOoE2Ym9ijHBZLkLoRTXipr-F9I0y0OZhqnh1KuJxt1iGVEKmONLmipeZdpgGx-kFX1DrAAHsNYfk', 'verified'),
(299, 2, 1, 'Test kumar', NULL, NULL, '7428059961', NULL, 'uploads/profile/q3E5i92tsQ1uCYH6auDzi1TSDHjCn7Lg18k18Tlb.jpg', 'uploads/profile/KV7AxUh8EoTslVYFSVl5mb6QbjjyfUcTlf2YO82C.jpg', '806236458787', 'uploads/profile/AsoJTIstckGRyqXwik4ih9WTnp0fKxVUlNMYa1rx.jpg', 'uploads/profile/H8E2LdSNjXdb8SLgMtE0oSmY3gsBjHARxWsj8Wtb.jpg', 'FQBPR8887Q', NULL, '2', '4', 'uploads/profile/IfjCkYTcLFuX4uXiaCCtgBItbW9ySuQbBkFoKQbp.jpg', '7272-72-72', '737373737372', 'uploads/profile/pE2LIMB0ThKSnwZmoJIgC7j1BHt1YCvouOXE7bJF.jpg', '2772-72-82', '2882-82-82', 'uploads/profile/rjvJo5qp4RTjufQs9iViiD79GxIM4HEclYSkOuNF.jpg', 1, 2, 'Car', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dl738', '8383-88-38', 'uploads/profile/tGkqJ4QgC7BKxnK2dh58XUc2cvDEgEbGDxSLrrvo.jpg', 'uploads/profile/O14CnGjCe80RZrUjTLADspTT0YlVMWaZZLSaHx10.jpg', '72727272727', 'uploads/profile/TUU4Il2pM5L1mBOy5hvFb6g2SQ2zQuzT4ROtQOfE.jpg', 'uploads/profile/vipfsz1ucnP3eQcCoX5E4zAYknoFsTjM52t0FSQw.jpg', NULL, NULL, '$2y$10$hoW5VAP7AZJQ/cJcEdDyrueFj1udWTAb6c3nyjMdRsd188Ymal71S', NULL, NULL, NULL, 0, 0, 0, '28.4957556', '77.4021485', 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', '1234', NULL, NULL, '0', '2025-07-29 09:53:40', '2025-07-29 10:01:01', 1, 'dMUVM2GNTcGB5upvbbk-KV:APA91bH8ShU6eDWBGWsp_y7iH7Kndnvsz4O4x714b_hOoE2Ym9ijHBZLkLoRTXipr-F9I0y0OZhqnh1KuJxt1iGVEKmONLmipeZdpgGx-kFX1DrAAHsNYfk', 'verified'),
(300, 3, NULL, 'Pramod', NULL, NULL, '8853887366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$J702YAItGYM1ANXuCjHLHOaKxoHSgLtzTnq3GC9dcMSDb2nTbb1yK', NULL, NULL, NULL, 0, 0, 0, '28.4957546', '77.402132', 'A605, Sector 135, Noida, Bajidpur, Uttar Pradesh 201304, India', '1234', NULL, NULL, '0', '2025-07-29 09:55:45', '2025-07-29 10:00:00', 1, 'dYf2rSL8TyCn-QBfhez4IX:APA91bFKw9cN0xYRngIMVgdWQXLE7oYYmT2SrSB33slao9CV0httEVGt7MC6mox0arNxyV7Sw5kwNP3A23mKBBPHy79NSw2MMVevUvQvBd5kvr0bRc_g2_g', 'non-verified'),
(301, 2, 1, 'Bikash kumar', NULL, NULL, '9693526167', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'Bike', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$3VPbSqrUqBNw35vF6UjbbeRsEXM7vkdexGF3oAITdTCegtprlI0Za', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 'XH53+J56, Bihra Panchayat, Bihra, Bihar 852124, India', '1234', NULL, NULL, '0', '2025-07-29 12:52:42', '2025-07-29 12:53:11', 1, 'fCnUe1YIR1qwSgOUomlNqP:APA91bGCRuX4z2H9vSXoWnPYlkVcaFMS0aN8zm1fZsiU8SiZWpOLICigF4Xgob7aLtlKAoOSGO9O3z_qmssgZb0dkHHqZn8O6nbWf9gOe_KqEsgdRd23Qqg', 'non-verified');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL COMMENT 'users.id',
  `vehicle_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vehicle_default` tinyint NOT NULL DEFAULT '2' COMMENT '1-default,2-Not default',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Deleted',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `user_id`, `vehicle_type`, `vehicle_number`, `is_vehicle_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test 90', '2783973912321', 1, 2, '2024-12-23 11:55:22', '2025-01-22 07:02:44'),
(2, 36, 'Test 2', '2783', 2, 3, '2024-12-23 11:55:33', '2024-12-26 14:15:49'),
(3, 36, 'Test 32783', '2783232323', 2, 3, '2024-12-23 11:55:59', '2024-12-26 14:15:49'),
(4, 42, 'Test 1', '8921839812', 2, 3, '2024-12-23 11:56:34', '2024-12-23 12:08:10'),
(5, 42, 'Test 2', '293891203821', 2, 3, '2024-12-23 11:56:42', '2024-12-23 12:08:19'),
(6, 42, 'Test 3', '3278371239213', 2, 3, '2024-12-23 12:06:53', '2024-12-23 12:08:22'),
(7, 42, 'Test 4', '238190339123921', 1, 3, '2024-12-23 12:07:01', '2024-12-23 12:08:25'),
(8, 36, 'Testing 2', '2819082908201', 2, 3, '2024-12-23 12:14:09', '2024-12-26 14:15:49'),
(9, 36, 'Testing 3', '311132123213', 2, 3, '2024-12-23 12:15:19', '2024-12-26 14:15:49'),
(10, 36, 'Test 5', '85454546464', 2, 3, '2024-12-25 19:02:26', '2024-12-26 14:15:49'),
(11, 36, 'Testing', '85555555555', 2, 3, '2024-12-25 19:08:23', '2024-12-26 14:16:09'),
(12, 36, 'Testing', '588664466808774', 2, 3, '2024-12-25 19:12:17', '2024-12-26 14:15:49'),
(13, 36, 'Texting', '888856446644', 2, 3, '2024-12-25 19:12:37', '2024-12-26 14:15:49'),
(14, 36, 'Testing 5', '8484546464646400488448', 2, 3, '2024-12-26 05:51:00', '2024-12-26 14:16:06'),
(15, 36, 'Testing m', '5454554546', 2, 3, '2024-12-26 14:14:44', '2024-12-26 14:16:03'),
(16, 36, 'Trajan aka', '5454546464', 2, 3, '2024-12-26 14:14:53', '2024-12-26 14:16:01'),
(17, 36, 'Aagah', '54545455454', 2, 3, '2024-12-26 14:15:01', '2024-12-26 14:15:59'),
(18, 36, 'Javed', '4848485454', 1, 1, '2024-12-26 14:15:07', '2024-12-26 14:15:49'),
(19, 43, 'Test', '8853644552', 2, 1, '2024-12-26 14:19:32', '2025-01-15 09:24:00'),
(20, 43, 'Test', '55222475', 2, 3, '2024-12-26 14:19:40', '2025-01-15 09:24:00'),
(21, 44, 'Testing', '283179379231', 1, 1, '2024-12-26 14:45:29', '2024-12-26 14:45:29'),
(22, 45, '8e923', '39230293123', 1, 1, '2024-12-26 15:03:05', '2024-12-26 15:03:05'),
(23, 43, 'Test 2', '3789837193712', 2, 1, '2024-12-26 16:40:29', '2025-01-15 09:24:00'),
(24, 47, 'Testing', 'Testing', 1, 1, '2024-12-27 08:00:35', '2024-12-27 08:00:35'),
(25, 48, 'Mahindra BE 6', 'DL@81921221', 2, 1, '2024-12-27 08:11:46', '2024-12-27 18:04:33'),
(26, 48, 'MG Comet EV', 'DL@1238913', 1, 1, '2024-12-27 08:12:03', '2024-12-27 18:04:33'),
(27, 48, 'Tata Tiago EV', 'DL@82912', 2, 3, '2024-12-27 08:12:18', '2024-12-27 18:04:33'),
(28, 48, '323123123', '123123123213', 2, 3, '2024-12-27 08:30:52', '2024-12-27 18:04:33'),
(29, 48, '212321312312313', '12312312312', 2, 3, '2024-12-27 08:30:57', '2024-12-27 18:04:33'),
(30, 48, '32113123213', '21321321312', 2, 1, '2024-12-27 08:31:04', '2024-12-27 18:04:33'),
(31, 49, 'Testing', '38913198322139', 1, 1, '2024-12-28 11:12:51', '2024-12-28 11:12:51'),
(32, 50, 'Test', '2783293291923', 2, 1, '2024-12-28 12:16:45', '2025-01-08 16:21:31'),
(33, 50, 'Test 2', '821998218921', 1, 1, '2024-12-28 12:16:54', '2025-01-08 16:21:31'),
(34, 50, 'Testing 50', 'DLIU92882', 2, 1, '2025-01-08 16:20:27', '2025-01-08 16:21:31'),
(35, 50, 'Testing 3902', '81829121221', 2, 1, '2025-01-08 16:20:38', '2025-01-08 16:21:31'),
(36, 43, 'Test 89122', 'DL@89218', 1, 1, '2025-01-15 08:38:50', '2025-01-15 09:24:00'),
(37, 43, 'Test 182192', 'DL@78318932', 2, 1, '2025-01-15 09:37:15', '2025-01-15 09:37:15'),
(38, 63, 'DL@GJH2828', '2828827227', 1, 1, '2025-01-15 13:10:40', '2025-01-15 13:10:40'),
(39, 64, 'Tata', 'HR51BE9192', 1, 1, '2025-01-15 13:33:07', '2025-01-15 13:33:07'),
(40, 65, 'NEXON', '12345', 1, 1, '2025-01-16 04:48:02', '2025-01-16 04:48:02'),
(41, 66, 'Test 01', '238921880321', 1, 1, '2025-01-16 12:58:34', '2025-01-16 12:58:34'),
(42, 68, 'Test', 'DL@128981921', 1, 1, '2025-01-19 09:17:52', '2025-01-19 09:17:52'),
(43, 69, 'Test', '781991723123', 1, 1, '2025-01-20 07:56:50', '2025-01-20 07:56:50');

-- --------------------------------------------------------

--
-- Table structure for table `whislist_property`
--

CREATE TABLE `whislist_property` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `property_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1-Active,2-Inactive,3-Delted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_amenties`
--
ALTER TABLE `add_amenties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_book_amenties`
--
ALTER TABLE `add_book_amenties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_book_facilities`
--
ALTER TABLE `add_book_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_book_property`
--
ALTER TABLE `add_book_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_facilities_propery`
--
ALTER TABLE `add_facilities_propery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_package_service`
--
ALTER TABLE `add_package_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignroutes`
--
ALTER TABLE `assignroutes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_lead`
--
ALTER TABLE `assign_lead`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bedtypes`
--
ALTER TABLE `bedtypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dynamic_url`
--
ALTER TABLE `dynamic_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emi_collections`
--
ALTER TABLE `emi_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallaries`
--
ALTER TABLE `gallaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycdatas`
--
ALTER TABLE `kycdatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_leads`
--
ALTER TABLE `kyc_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_leads_guarantor`
--
ALTER TABLE `kyc_leads_guarantor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_processes`
--
ALTER TABLE `kyc_processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_reject_reasons`
--
ALTER TABLE `kyc_reject_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_disbursements`
--
ALTER TABLE `loan_disbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_requests`
--
ALTER TABLE `loan_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pet_category`
--
ALTER TABLE `pet_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties_images`
--
ALTER TABLE `properties_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_reviews`
--
ALTER TABLE `property_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_code`
--
ALTER TABLE `referral_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refers`
--
ALTER TABLE `refers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refer_and_earn`
--
ALTER TABLE `refer_and_earn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_models`
--
ALTER TABLE `role_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_logs`
--
ALTER TABLE `route_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_booking_log`
--
ALTER TABLE `tbl_booking_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pet_bookings`
--
ALTER TABLE `tbl_pet_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_statement`
--
ALTER TABLE `tbl_statement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_token`
--
ALTER TABLE `tbl_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_update_profile_request`
--
ALTER TABLE `tbl_update_profile_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_vehicle`
--
ALTER TABLE `tbl_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_vehicle_image`
--
ALTER TABLE `tbl_vehicle_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonals`
--
ALTER TABLE `testimonals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whislist_property`
--
ALTER TABLE `whislist_property`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_amenties`
--
ALTER TABLE `add_amenties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `add_book_amenties`
--
ALTER TABLE `add_book_amenties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `add_book_facilities`
--
ALTER TABLE `add_book_facilities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `add_book_property`
--
ALTER TABLE `add_book_property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `add_facilities_propery`
--
ALTER TABLE `add_facilities_propery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `add_package_service`
--
ALTER TABLE `add_package_service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assignroutes`
--
ALTER TABLE `assignroutes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `assign_lead`
--
ALTER TABLE `assign_lead`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bedtypes`
--
ALTER TABLE `bedtypes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dynamic_url`
--
ALTER TABLE `dynamic_url`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emi_collections`
--
ALTER TABLE `emi_collections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallaries`
--
ALTER TABLE `gallaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kycdatas`
--
ALTER TABLE `kycdatas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_leads`
--
ALTER TABLE `kyc_leads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_leads_guarantor`
--
ALTER TABLE `kyc_leads_guarantor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_processes`
--
ALTER TABLE `kyc_processes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyc_reject_reasons`
--
ALTER TABLE `kyc_reject_reasons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan_disbursements`
--
ALTER TABLE `loan_disbursements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_requests`
--
ALTER TABLE `loan_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pet_category`
--
ALTER TABLE `pet_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `properties_images`
--
ALTER TABLE `properties_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `property_reviews`
--
ALTER TABLE `property_reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_code`
--
ALTER TABLE `referral_code`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `refers`
--
ALTER TABLE `refers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `refer_and_earn`
--
ALTER TABLE `refer_and_earn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_models`
--
ALTER TABLE `role_models`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `route_logs`
--
ALTER TABLE `route_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_booking_log`
--
ALTER TABLE `tbl_booking_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1460;

--
-- AUTO_INCREMENT for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_pet_bookings`
--
ALTER TABLE `tbl_pet_bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_statement`
--
ALTER TABLE `tbl_statement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_token`
--
ALTER TABLE `tbl_token`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tbl_update_profile_request`
--
ALTER TABLE `tbl_update_profile_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_vehicle`
--
ALTER TABLE `tbl_vehicle`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_vehicle_image`
--
ALTER TABLE `tbl_vehicle_image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `testimonals`
--
ALTER TABLE `testimonals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `whislist_property`
--
ALTER TABLE `whislist_property`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
