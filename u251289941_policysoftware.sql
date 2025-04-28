-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2025 at 08:16 AM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u251289941_policysoftware`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `father_or_husband` tinyint(1) NOT NULL DEFAULT 1 COMMENT '	1 = father, 0 = husband	',
  `father_or_husband_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agent_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `agent_id`, `name`, `father_or_husband`, `father_or_husband_name`, `image`, `phone`, `dob`, `gender`, `status`, `area_id`, `address`, `created_at`, `updated_at`, `agent_code`) VALUES
(12, '99149001', 'SATTANANDA HALDER', 1, 'JOYTISH CH HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725693727_WhatsApp Image 2024-09-07 at 12.11.37 AM.jpeg', '9732468280', '01 Jan, 1969', 'Male', 1, 5, 'KASHINAGAR', '2024-09-07 12:52:07', '2024-09-07 12:52:07', 'BYE917'),
(21, '99149002', 'OFFICE', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743785656_tathya mitra logo.jpg', '9733200300', '08 Mar, 2025', 'Male', 1, 10, 'OFFICE', '2025-04-04 22:24:16', '2025-04-04 22:26:31', 'NUR978'),
(22, '99149003', 'SUJAY BAIDYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744295586_tathya mitra logo.jpg', '9732200300', '02 May, 1986', 'Male', 1, 5, 'KASHINAGAR', '2025-04-10 20:03:06', '2025-04-10 20:03:06', 'DNW793');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `police_station` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `visibility` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `pincode`, `state`, `district`, `police_station`, `landmark`, `visibility`, `created_at`, `updated_at`) VALUES
(5, 'NEW POLICY CUSTOMER', '743349', 'WESTBENGAL', 'SOUTH 24 PGS', 'RAIDIGHI', 'KASHIANGAR BAZAR', '1', '2024-07-17 20:31:29', '2025-03-27 18:03:01'),
(8, 'GOLD LOAN CUSTOMER', '743354', 'West Bengal', 'South 24 Parganas', 'RAIDIGHI', 'KASHINAGAR', '1', '2024-09-13 12:06:27', '2025-03-27 18:03:20'),
(9, 'POLICY BOND MORTGAGE CUSTOMER', '743349', 'West Bengal', 'South 24 Parganas', 'RAIDIGHI', 'KASHINAGAR', '1', '2025-03-25 21:22:35', '2025-03-27 18:06:55'),
(10, 'UPI CUSTOMER', '743349', 'West Bengal', 'South 24 Parganas', 'RAIDIGHI', 'KASHINAGAR', '1', '2025-03-25 21:56:52', '2025-03-25 21:56:52'),
(11, 'P/L LOAN CUSTOMER', '743349', 'West Bengal', 'South 24 Parganas', 'RAIDIGHI', 'KASHINAGAR', '1', '2025-03-27 18:07:47', '2025-03-27 18:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) DEFAULT NULL,
  `random_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `father_or_husband` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = father, 0 = husband	',
  `father_or_husband_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nominee_image` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `alternative_phone` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_id`, `area_id`, `agent_id`, `random_code`, `name`, `father_or_husband`, `father_or_husband_name`, `image`, `nominee_image`, `phone`, `alternative_phone`, `dob`, `gender`, `address`, `status`, `created_at`, `updated_at`) VALUES
(21, '991491', 5, 15, NULL, 'PALASH KAYAL', 1, 'BHUPAL KAYAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725695237_WhatsApp Image 2024-09-07 at 12.46.09 AM.jpeg', NULL, '9932910192', NULL, '01 Jan, 1988', 'Male', 'FULBAGICHA', 1, '2024-09-07 13:17:17', '2024-09-07 13:17:17'),
(22, '991492', 5, 15, NULL, 'PRITAM HALDER', 1, 'DILIP HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726247617_PJ=00001aabb.jpg', NULL, '9733823709', NULL, '01 May, 2010', 'Male', 'MAJHARPARA', 1, '2024-09-07 13:18:52', '2024-09-13 22:43:37'),
(23, '99149103', 5, 15, NULL, 'LUSI HALDER', 0, 'NIL KUMAR HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726817843_WhatsApp Image 2024-09-20 at 12.34.43 AM (1).jpeg', NULL, '8944935866', NULL, '01 Jan, 1980', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-07 15:03:00', '2024-09-20 13:07:23'),
(24, '99149112', 5, 15, NULL, 'KRISHNA TANTI', 1, 'KARTIK CH TANTI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726816702_WhatsApp Image 2024-09-20 at 12.15.27 AM.jpeg', NULL, '9733707413', NULL, '01 Jan, 1975', 'Male', 'SINGHERCHAK', 1, '2024-09-07 15:05:11', '2024-09-20 12:48:22'),
(25, '99149113', 5, 15, NULL, 'SUMITRA GAYAN', 0, 'BALARAM GAYAN', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742616623_4678fb1a-064c-4282-9d59-eecad3d334fa.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742616623_4678fb1a-064c-4282-9d59-eecad3d334fa.jpg', '7364941485', '9733823709', '01 Jan, 1975', 'Female', 'HAJARI PARA', 1, '2024-09-07 15:08:04', '2025-03-22 09:40:23'),
(26, '9914916', 5, 12, NULL, 'BARNALI KARMAKAR', 0, 'DIPAK KARMAKAR', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725702123_barnali karmakar.jpeg', NULL, '7797485921', NULL, '07 Sep, 2024', 'Female', 'SINGHERCHAK', 1, '2024-09-07 15:12:03', '2024-09-07 15:12:03'),
(27, '99149101', 5, 15, NULL, 'KALICHARAN SARDER', 1, 'MADHUSUDAN SARDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725702383_KALICHARAN.jpeg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742918286_sahaj logo .jpg', '9851535633', '9733200300', '01 Jan, 1980', 'Male', 'SOUTH BISHNUPUR', 1, '2024-09-07 15:16:23', '2025-03-25 21:34:04'),
(28, '9914926', 5, 15, NULL, 'RASIDA LASKAR GAZI', 1, 'AHAMMAD ALI LASKAR', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725702641_rashida gazi.jpeg', NULL, '9123813856', NULL, '04 Jun, 1987', 'Female', 'CHANDPASA', 1, '2024-09-07 15:20:41', '2024-09-07 15:20:41'),
(29, '9914984', 5, 15, NULL, 'KINKAR MANNA', 1, 'MADHUSUDAN MANNA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725702922_KINKAR MANNA.jpeg', NULL, '9330381345', NULL, '08 Feb, 1996', 'Male', 'CHANDPASA', 1, '2024-09-07 15:25:22', '2024-09-07 15:25:22'),
(30, '99149100', 5, 15, NULL, 'MOUSUMI SARKAR', 0, 'DILIP HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725703221_MOUSUMI.jpeg', NULL, '9093509870', NULL, '04 Apr, 1989', 'Female', 'MAJHERPARA', 1, '2024-09-07 15:30:21', '2024-09-07 15:30:21'),
(31, '99149114', 5, 15, NULL, 'RAJKUMAR HALDER', 1, 'XXYZ', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729157591_raj kumar.jpeg', NULL, '9564108155', NULL, '01 Jan, 1980', 'Male', 'KORALERCHAK', 1, '2024-09-07 15:33:15', '2024-10-17 15:03:11'),
(32, '9914961', 5, 15, NULL, 'SHANU KHAMARU', 1, 'SAHADEB KHAMARU', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726490213_WhatsApp Image 2024-09-16 at 6.05.34 PM.jpeg', NULL, '7602072042', NULL, '01 Jan, 1990', 'Male', 'SABJI BAZAR', 1, '2024-09-07 15:38:40', '2024-09-16 18:06:53'),
(33, '99149104', 5, 14, NULL, 'SUMANA HALDER MANDAL', 1, 'SUJIT MANDAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725703825_WhatsApp Image 2024-09-07 at 12.12.18 AM.jpeg', NULL, '8420738685', NULL, '15 Nov, 1990', 'Female', 'MADHABPUR', 1, '2024-09-07 15:40:25', '2024-09-07 15:40:25'),
(34, '9914105', 5, 15, NULL, 'ABIR HALDER', 1, 'DIPTA PRASAD HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725704135_ABIR HALDER.jpeg', NULL, '9732046561', NULL, '01 Jan, 2002', 'Male', 'SINGHERCHAK', 1, '2024-09-07 15:45:35', '2024-09-07 15:45:35'),
(35, '99149107', 5, 15, NULL, 'RUMPA HALDER', 0, 'DIPTA PRASAD HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725704453_RUMPA HALDER.jpeg', NULL, '7384129024', NULL, '08 Mar, 1983', 'Female', 'SINGHERCHAK', 1, '2024-09-07 15:50:53', '2024-09-07 15:50:53'),
(36, '9914108', 5, 15, NULL, 'DIPTA PRASAD HALDER', 1, 'ANIRUDHA HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725704827_WhatsApp Image 2024-09-07 at 3.24.58 AM.jpeg', NULL, '9732046561', NULL, '26 May, 1969', 'Male', 'SENGHERCHAK', 1, '2024-09-07 15:57:07', '2024-09-07 15:57:07'),
(37, '99149109', 5, 12, NULL, 'SATTANANDA HALDER', 1, 'JOYTISH CH HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725705328_WhatsApp Image 2024-09-07 at 12.11.37 AM.jpeg', NULL, '9732468280', NULL, '01 Jan, 1972', 'Male', 'SINGHERCHAK', 1, '2024-09-07 16:05:28', '2024-09-07 16:05:28'),
(38, '991496', 5, 12, NULL, 'JHARNA KAYAL', 0, 'SANJAY KAYAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738657180_WhatsApp Image 2025-02-03 at 10.41.51 PM.jpeg', NULL, '6297710586', NULL, '01 Jan, 1970', 'Female', 'KASHINAGAR', 1, '2024-09-07 16:10:42', '2025-02-04 13:49:40'),
(39, '9914930', 5, 15, NULL, 'CHAMPA KAYAL', 1, 'PLASH KAYAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725969761_PJ=0010aa.jpg', NULL, '9932910192', NULL, '01 Jan, 1995', 'Female', 'FULBAGHICHA', 1, '2024-09-07 16:16:25', '2024-09-10 17:32:41'),
(40, '9914993', 5, 15, NULL, 'SOMA MONDAL', 0, 'RAKESH MONDAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725974304_WhatsApp Image 2024-09-10 at 6.46.31 PM.jpeg', NULL, '8509134314', NULL, '27 Oct, 1995', 'Female', 'BARASHI', 1, '2024-09-07 16:20:33', '2024-09-10 18:48:24'),
(41, '9914995', 5, 15, NULL, 'PRADIP TANTI', 1, 'NITAI CHAND TANTI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725706511_PRADIP TANTI.jpeg', NULL, '9733999510', NULL, '15 Feb, 1975', 'Male', 'SARBERIYA', 1, '2024-09-07 16:25:11', '2024-09-07 16:25:11'),
(42, '9914940', 5, 12, NULL, 'ABU HOSSAIN AKHAN', 1, 'FFCFDF', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731918362_WhatsApp Image 2024-11-18 at 12.23.52 AM.jpeg', NULL, '7980681418', NULL, '01 Jan, 1975', 'Male', 'CHANDPASA', 1, '2024-09-07 16:27:58', '2024-11-18 13:56:02'),
(43, '99149130', 5, 15, NULL, 'PANCHUGOPAL HALDER', 1, 'JOYDEB HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740406375_33333.jpg', NULL, '6294374347', NULL, '01 Jan, 1980', 'Male', 'BATISWAR', 1, '2024-09-07 16:32:17', '2025-02-24 19:42:55'),
(44, '9914933', 5, 12, NULL, 'TRIPTI HALDER', 0, 'SUKHEN HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965079_WhatsApp Image 2024-09-10 at 3.17.51 AM.jpeg', NULL, '9733612360', NULL, '01 Jan, 1980', 'Female', 'KASINAGAR', 1, '2024-09-07 16:36:07', '2024-09-10 16:14:39'),
(45, '99149144', 5, 15, NULL, 'RUPALI PRADHAN', 0, 'JHHGHBH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965039_WhatsApp Image 2024-09-10 at 3.17.51 AM (1).jpeg', NULL, '9800086671', NULL, '01 Jan, 1980', 'Female', 'KASHINAGAR', 1, '2024-09-09 12:19:12', '2024-09-10 16:13:59'),
(46, '99149141', 5, 15, NULL, 'DALI BAIDAY', 0, 'BHOLA BHADYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965181_WhatsApp Image 2024-09-10 at 3.22.36 AM.jpeg', NULL, '6294163282', NULL, '08 May, 1971', 'Female', 'KASHINAGAR', 1, '2024-09-09 12:21:48', '2024-09-10 16:16:21'),
(47, '99149135', 5, 15, NULL, 'SUPRIYA BISWAS', 0, 'INDRAJIT BISWAS', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726816075_WhatsApp Image 2024-09-20 at 12.05.36 AM.jpeg', NULL, '8001963095', NULL, '01 Jan, 1998', 'Female', 'KASHINAGAR', 1, '2024-09-09 12:26:00', '2024-09-20 12:37:55'),
(48, '99149116', 5, 15, NULL, 'SUBHANKAR HALDER', 1, 'UHCUDHU', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726818227_WhatsApp Image 2024-09-20 at 12.40.53 AM.jpeg', NULL, '9732045134', NULL, '01 Jan, 1980', 'Male', 'KASHINAR', 1, '2024-09-09 12:40:21', '2024-09-20 13:13:47'),
(49, '99149123', 5, 15, NULL, 'PULAKESH DEBNATH', 1, 'LATE SAMBHU CH DEBNATH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726237532_WhatsApp Image 2024-09-13 at 7.47.52 PM.jpeg', NULL, '8918821673', NULL, '01 Jan, 1984', 'Male', 'KASHINAGAR', 1, '2024-09-09 12:42:55', '2024-09-13 19:55:32'),
(50, '99149166', 5, 15, NULL, 'SAHINA MOLLA', 1, 'SABIR MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726656283_WhatsApp Image 2024-09-18 at 3.41.52 AM.jpeg', NULL, '6294521370', NULL, '04 Jan, 1997', 'Female', 'KASHINAGAR', 1, '2024-09-09 12:46:29', '2024-09-18 16:14:43'),
(51, '99149111', 5, 15, NULL, 'DEBALA SARDER', 0, 'PALAN SARDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965719_WhatsApp Image 2024-09-09 at 5.42.01 AM.jpeg', NULL, '8172097895', NULL, '13 Jan, 1996', 'Female', 'KASHINAGAR', 1, '2024-09-09 13:04:53', '2024-09-10 16:25:19'),
(52, '99149173', 5, 15, NULL, 'ASIT DEBNATH', 1, 'SANKAR PRASAD DEBNATH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726205442_WhatsApp Image 2024-09-13 at 10.37.40 AM.jpeg', NULL, '9932346287', NULL, '01 Jan, 1973', 'Male', 'BARASHI', 1, '2024-09-09 13:09:46', '2024-09-13 11:00:42'),
(53, '99149139', 5, 15, NULL, 'LAXMI HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726815870_WhatsApp Image 2024-09-19 at 11.59.43 PM.jpeg', NULL, '8016867397', NULL, '01 Aug, 2000', 'Female', 'CHANDPASA', 1, '2024-09-09 13:24:23', '2024-09-20 12:34:30'),
(54, '9914983', 5, 15, NULL, 'DIPAK HALDER', 1, 'BHARAT HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732450391_WhatsApp Image 2024-11-24 at 5.39.42 PM.jpeg', NULL, '6296193147', NULL, '04 Jan, 1995', 'Male', 'KASHINAGAR', 1, '2024-09-09 14:50:20', '2024-11-24 17:43:11'),
(55, '99149157', 5, 15, NULL, 'DHULAPADA HALDER', 1, 'CHITTRANJAN  HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740406575_dhula.jpg', NULL, '6294854554', NULL, '19 May, 1976', 'Male', 'CHAND PASHA', 1, '2024-09-09 14:52:04', '2025-02-24 19:46:15'),
(56, '99149147', 5, 15, NULL, 'MASUDA BIBI SHEKH', 1, 'RASID MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726823067_WhatsApp Image 2024-09-20 at 2.02.15 AM.jpeg', NULL, '7384031298', NULL, '01 Jan, 1987', 'Female', 'BARASHI', 1, '2024-09-09 14:58:07', '2024-09-20 14:34:27'),
(57, '99149178', 5, 15, NULL, 'PUSHPA SARKAR', 0, 'SWAPAN SARKAR', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726823456_WhatsApp Image 2024-09-20 at 2.09.07 AM.jpeg', NULL, '9342905233', NULL, '05 Dec, 1972', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-09 15:27:05', '2024-09-20 14:40:56'),
(58, '9914925', 5, 15, NULL, 'PALAN PRAMANIK', 1, 'SANKAR PRAMANIK', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725876390_WhatsApp Image 2024-09-09 at 3.05.25 AM.jpeg', NULL, '9775024447', NULL, '16 Dec, 1975', 'Male', 'BARASHI', 1, '2024-09-09 15:36:30', '2024-09-09 15:36:30'),
(59, '99149192', 5, 15, NULL, 'RUMA DAS', 1, 'KARTICK DAS', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725876543_WhatsApp Image 2024-09-09 at 3.08.22 AM.jpeg', NULL, '9907337519', NULL, '12 Oct, 1986', 'Female', 'SHINGHER CHAK', 1, '2024-09-09 15:39:04', '2024-09-09 15:39:04'),
(60, '9914958', 5, 12, NULL, 'MUKTESWAR PAL', 1, 'KHAGEN PAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725973548_WhatsApp Image 2024-09-10 at 3.47.53 PM.jpeg', NULL, '9933559891', NULL, '01 Jan, 1977', 'Male', 'UTTAR KASHINAGAR', 1, '2024-09-09 15:42:56', '2024-09-10 18:35:48'),
(61, '9914949', 5, 12, NULL, 'SANAT KHAN', 1, 'NIMAI KHAN', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726655700_WhatsApp Image 2024-09-18 at 3.31.28 AM.jpeg', NULL, '9933960164', NULL, '05 Sep, 1972', 'Male', 'KASHINAGAR', 1, '2024-09-09 15:44:12', '2024-09-18 16:05:00'),
(62, '9914976', 5, 12, NULL, 'GOUR SHIULI', 1, 'GANGADHAR SHIULI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725970306_WhatsApp Image 2024-09-10 at 3.52.38 PM.jpeg', NULL, '7063073919', NULL, '15 Feb, 1975', 'Male', 'BARASHI', 1, '2024-09-09 15:46:55', '2024-09-10 17:41:46'),
(63, '9914987', 5, 15, NULL, 'GOURI MANNA', 0, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726655963_WhatsApp Image 2024-09-18 at 3.35.26 AM.jpeg', NULL, '9831953403', NULL, '01 May, 1988', 'Female', 'KASHINAGAR', 1, '2024-09-09 15:53:45', '2024-09-18 16:09:23'),
(64, '99149201', 5, 12, NULL, 'SAMPAD KAYAL', 1, 'SANJAY KAYA L', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738657208_74d6e4cd-aea8-4a3d-a3d6-fa5f370fa9d8.jpg', NULL, '6297710586', NULL, '12 Feb, 1994', 'Male', 'KASHINAGAR                                                                                                       `', 1, '2024-09-09 15:56:53', '2025-02-04 13:50:08'),
(65, '99149206', 5, 12, NULL, 'BIJALI SIKARI', 0, 'SUKUMAR SHIKARI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726825561_WhatsApp Image 2024-09-20 at 2.43.58 AM.jpeg', NULL, '7365931574', NULL, '12 Apr, 1982', 'Female', 'KASHINAGAR', 1, '2024-09-09 15:59:27', '2024-09-20 15:16:01'),
(66, '9914915', 5, 12, NULL, 'SUBHRA HALDER', 0, 'SATYANANDA HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726656608_WhatsApp Image 2024-09-18 at 3.47.54 AM.jpeg', NULL, '8768036074', NULL, '01 Jan, 1984', 'Female', 'KASHINAGAR', 1, '2024-09-09 16:01:38', '2024-09-18 16:20:08'),
(67, '99149202', 5, 12, NULL, 'SANJAY KAYAL', 1, 'JATIN KAYAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726825955_WhatsApp Image 2024-09-20 at 2.47.30 AM.jpeg', NULL, '8768010520', NULL, '25 May, 1968', 'Male', 'KASHINAGAR', 1, '2024-09-09 16:03:57', '2024-11-12 12:04:26'),
(68, '99149122', 5, 15, NULL, 'AMINA MOLLA', 0, 'NIJAMUDDIN MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725878347_WhatsApp Image 2024-09-07 at 2.14.52 AM.jpeg', NULL, '8001762906', NULL, '01 Feb, 1994', 'Female', 'KALIKAPUR', 1, '2024-09-09 16:09:07', '2024-09-09 16:09:07'),
(69, '99149118', 5, 15, NULL, 'JAYA PAIK', 0, 'SUSHANTA PAIK', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725878641_WhatsApp Image 2024-09-07 at 2.15.29 AM.jpeg', NULL, '8250798833', NULL, '29 May, 1996', 'Female', 'KRISHNACHANDRAPUR', 1, '2024-09-09 16:14:01', '2024-09-09 16:14:01'),
(70, '99149209', 5, 15, NULL, 'NIJAMUDDIN MOLLA', 1, 'AHAMMAD ALI MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741606152_3fd8c8c6-3774-4eb9-803b-c2d579e97799.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741606152_3fd8c8c6-3774-4eb9-803b-c2d579e97799.jpg', '9064254845', '9733200300', '01 Jan, 1992', 'Male', 'KALIKAPUR', 1, '2024-09-09 16:17:11', '2025-03-10 16:59:12'),
(71, '9914970', 5, 12, NULL, 'GOUTAM MAYRA', 1, 'KANAI LAL MAYARA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965130_WhatsApp Image 2024-09-10 at 3.17.52 AM.jpeg', NULL, '9933502775', NULL, '01 Jan, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-09 16:24:20', '2024-09-10 16:15:30'),
(72, '99149210', 5, 15, NULL, 'JALALUDDIN MOLLA', 1, 'MAHIRUDDIN MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965207_WhatsApp Image 2024-09-10 at 3.22.37 AM.jpeg', NULL, '8597248068', NULL, '11 Oct, 1997', 'Male', 'GILERCHAT', 1, '2024-09-10 13:02:27', '2024-09-10 16:16:47'),
(73, '99149125', 5, 15, NULL, 'PARTHA MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725953973_WhatsApp Image 2024-09-07 at 2.15.47 AM.jpeg', NULL, '9733923534', NULL, '01 Jan, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-10 13:09:33', '2024-11-15 11:06:12'),
(74, '99149184', 5, 15, NULL, 'MARUFA MOLLA', 0, 'JALALUDDIN MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965406_WhatsApp Image 2024-09-10 at 3.22.38 AM (2).jpeg', NULL, '8293622604', NULL, '26 May, 1997', 'Female', 'KALIKAPUR', 1, '2024-09-10 13:12:17', '2024-09-10 16:20:06'),
(75, '9914973', 5, 12, NULL, 'TARUN PURKAIT', 1, 'RATAN PURKAIT', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726817609_WhatsApp Image 2024-09-20 at 12.31.07 AM.jpeg', NULL, '9564623138', NULL, '02 Mar, 1981', 'Male', 'KHARI', 1, '2024-09-10 13:15:08', '2024-09-20 13:03:29'),
(76, '99149190', 5, 12, NULL, 'PALASH CHAKRABARTY', 1, 'ARUN KUMAR CHAKRABORTY', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725954756_WhatsApp Image 2024-09-10 at 12.48.39 AM (1).jpeg', NULL, '9093658428', NULL, '05 Dec, 1988', 'Male', 'UTTAR KASHINAGAR', 1, '2024-09-10 13:22:36', '2024-09-10 13:22:36'),
(77, '99149200', 5, 15, NULL, 'SARFUNNESA MOLLA', 0, 'RAFIK MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725955121_123.jpg', NULL, '8116938589', NULL, '01 Jan, 1985', 'Female', 'KALIKAPUR', 1, '2024-09-10 13:28:41', '2024-09-10 13:28:41'),
(78, '9914931', 5, 15, NULL, 'SUJAY BAIDYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965955_WhatsApp Image 2024-09-10 at 3.22.36 AM (1).jpeg', NULL, '9732967887', NULL, '01 Jan, 1990', 'Male', 'KASHINAGAR', 1, '2024-09-10 13:31:50', '2024-09-10 16:29:15'),
(79, '99149189', 5, 12, NULL, 'GOUTAM BAIDYA', 1, 'AMBIKA CHARAN BAIDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729503511_goutam.jpeg', NULL, '9883723195', NULL, '10 Jan, 1972', 'Male', 'UTTAR KASHINAGAR', 1, '2024-09-10 13:34:53', '2024-10-21 15:08:31'),
(80, '9914951', 5, 12, NULL, 'SATINATH SANTARA', 1, 'SUDHANSU SANTARA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741149935_72d913af-3e79-4279-876a-cba30dc701e3.jpg', NULL, '6297824890', NULL, '04 Feb, 1965', 'Male', 'KASHINAGAR', 1, '2024-09-10 13:38:31', '2025-03-05 10:15:35'),
(81, '9914979', 5, 12, NULL, 'SUKUMAR SIKARI', 1, 'BISWANATH SIKARI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726816371_WhatsApp Image 2024-09-20 at 12.10.23 AM.jpeg', NULL, '8167616164', NULL, '10 Mar, 1980', 'Male', 'KHARI', 1, '2024-09-10 13:41:35', '2024-09-20 12:42:51'),
(82, '991493', 5, 15, NULL, 'SAIFUDDIN BAIDYA', 1, 'IUNUCHH BAIDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738506446_df88d3ec-7980-4ea5-b232-a70c57e41607.jpg', NULL, '9775808129', NULL, '01 Jan, 1970', 'Male', 'KAUTALA', 1, '2024-09-10 13:50:47', '2025-02-02 19:57:26'),
(83, '99149176', 5, 15, NULL, 'ABDUR RAHAMAN MOLLA', 1, 'ATIYAR MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726666438_WhatsApp Image 2024-09-18 at 7.00.54 PM.jpeg', NULL, '7319317360', NULL, '02 May, 2002', 'Male', 'GILERCHAT', 1, '2024-09-10 13:53:07', '2024-09-18 19:03:58'),
(84, '9914946', 5, 12, NULL, 'ABHIMANNU SARDER', 1, 'DULAL SARDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725979913_WhatsApp Image 2024-09-10 at 8.19.59 PM.jpeg', NULL, '8617303360', NULL, '01 Jan, 1990', 'Male', 'UTTAR KASHINAGAR', 1, '2024-09-10 13:55:52', '2024-09-10 20:21:53'),
(85, '99149220', 5, 15, NULL, 'DEBASIS PRAMANIK', 1, 'SAILENDRANATH PRAMANIK', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725957141_WhatsApp Image 2024-09-10 at 1.29.14 AM.jpeg', NULL, '8334051150', NULL, '03 Feb, 1984', 'Male', 'UTTAR KASHINAGAR', 1, '2024-09-10 14:02:21', '2024-09-10 14:02:21'),
(86, '99149187', 5, 15, NULL, 'SUDIPTA PRAMANIK HALDER', 0, 'DEBASIS PRAMANIK', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725962274_WhatsApp Image 2024-09-07 at 2.18.40 AM.jpeg', NULL, '9064949367', NULL, '14 Oct, 1985', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-10 14:05:08', '2024-09-10 15:27:54'),
(87, '99149229', 5, 15, NULL, 'ANANYA MANNA', 1, 'SWADESH MANNA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726147320_WhatsApp Image 2024-09-12 at 6.41.08 PM.jpeg', NULL, '9635231228', NULL, '01 Jan, 1995', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-10 14:27:59', '2024-09-12 18:52:00'),
(88, '99149182', 5, 15, NULL, 'ALOKA HALDER', 0, 'HARISADHAN HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965285_WhatsApp Image 2024-09-10 at 3.22.39 AM (2).jpeg', NULL, '9163817424', NULL, '10 Nov, 1985', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-10 14:31:49', '2024-09-10 16:18:05'),
(89, '99149212', 5, 12, NULL, 'NASIMULLA BAIDYA', 1, 'HABIBULLA BAIDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965745_WhatsApp Image 2024-09-06 at 8.05.23 AM (1).jpeg', NULL, '8016464345', NULL, '17 Oct, 1985', 'Male', 'KAUTALA', 1, '2024-09-10 14:35:40', '2024-09-10 16:25:45'),
(90, '99149188', 5, 15, NULL, 'INDRAJIT  BISWAS', 1, 'SACHINDRA NATH BISWAS', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725959684_WhatsApp Image 2024-09-10 at 2.12.32 AM.jpeg', NULL, '8001963095', NULL, '05 Jan, 1985', 'Male', 'UTTAR KASHINAGAR', 1, '2024-09-10 14:44:44', '2024-09-10 14:44:44'),
(91, '99149121', 5, 15, NULL, 'MONALISA GHARAMI', 1, 'BADAL CH MANDAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725965258_WhatsApp Image 2024-09-10 at 3.22.39 AM (1).jpeg', NULL, '8609601947', NULL, '01 Jan, 1989', 'Female', 'UTTAR LAXMIKANTAPUR', 1, '2024-09-10 15:02:24', '2024-09-10 16:17:38'),
(92, '9914942', 5, 15, NULL, 'SAHABUDDIN  MOLLA', 1, 'ABUKALAM', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1739252802_0860825a-052d-45c7-9243-232acdd6ff05.jpg', NULL, '9609169046', NULL, '01 May, 2002', 'Male', 'KALIKAPUR', 1, '2024-09-10 15:16:02', '2025-02-11 11:16:42'),
(93, '99149240', 5, 15, NULL, 'PARBATI NASKAR MONDAL', 1, 'SAHADEB NASKAR', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725962121_WhatsApp Image 2024-09-07 at 2.20.06 AM.jpeg', NULL, '9732638971', NULL, '10 Oct, 1981', 'Female', 'RADHAKANTAPUR', 1, '2024-09-10 15:25:21', '2024-09-10 15:25:21'),
(94, '9914911', 5, 15, NULL, 'SANKAR HALDER', 1, 'NADIRAM HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725962770_WhatsApp Image 2024-09-10 at 3.00.51 AM.jpeg', NULL, '9932248595', NULL, '19 Nov, 1982', 'Male', 'GAJAMATI', 1, '2024-09-10 15:36:10', '2024-09-10 15:36:10'),
(95, '9914997', 5, 12, NULL, 'PRANABESH GAYAN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729503571_pranabesh.jpeg', NULL, '9679044074', NULL, '22 Mar, 1992', 'Male', 'KALIKAPUR', 1, '2024-09-10 15:40:50', '2024-10-21 15:09:31'),
(96, '99149183', 5, 12, NULL, 'SAHABUDDIN MOLLA', 1, 'MATALEB MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1725964291_WhatsApp Image 2024-09-10 at 12.02.21 AM.jpeg', NULL, '7585839638', NULL, '01 Jan, 1980', 'Male', 'KHARI SARASWATI PARA', 1, '2024-09-10 16:00:44', '2024-09-10 16:01:31'),
(97, '99149205', 5, 12, NULL, 'MITHUN BUDHAK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741703974_2fca243f-f219-49bf-b1d4-474d3efb87c5.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741703974_2fca243f-f219-49bf-b1d4-474d3efb87c5.jpg', '7001589263', '9733200300', '01 Jan, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-11 11:30:59', '2025-03-11 20:09:34'),
(98, '99149120', 5, 15, NULL, 'ANANDA TANTI', 1, 'SANTOSH TANTI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726039851_WhatsApp Image 2024-09-11 at 12.28.55 AM.jpeg', NULL, '6295112819', NULL, '13 Sep, 1993', 'Male', 'KAUTALA', 1, '2024-09-11 13:00:51', '2024-09-11 13:00:51'),
(99, '9914963', 5, 12, NULL, 'KESOB ADHIKARI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741866427_3b0fb360-aef2-4658-acb3-53df605219e6.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741866427_3b0fb360-aef2-4658-acb3-53df605219e6.jpg', '8016379841', '9733823700', '01 Jan, 1984', 'Male', 'KASHINAGAR', 1, '2024-09-11 13:13:54', '2025-03-13 17:17:07'),
(101, '99149165', 5, 12, NULL, 'MAHIUDDIN MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741866475_26b0f84e-0e37-4ce1-9834-096b5355e1cf.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741866475_26b0f84e-0e37-4ce1-9834-096b5355e1cf.jpg', '9800983152', '9733200300', '01 Jan, 1984', 'Male', 'KHARI', 1, '2024-09-11 13:23:25', '2025-03-13 17:17:55'),
(102, '9914972', 5, 12, NULL, 'RAJIB BISWAS', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1739455802_cebd6a40-3607-435d-9962-9573aa3b770e.jpg', NULL, '9002515700', NULL, '01 Jan, 1985', 'Male', 'BAMUNERCHAK', 1, '2024-09-11 13:26:19', '2025-02-13 19:40:02'),
(103, '99149177', 5, 12, NULL, 'JAKIR HOSSAIN MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726041545_123.jpg', NULL, '8967519313', NULL, '01 May, 1984', 'Male', 'KHARI', 1, '2024-09-11 13:29:05', '2024-09-11 13:29:05'),
(104, '99149185', 5, 12, NULL, 'SAHIL MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742875312_7ba984e6-054b-4d73-aaa7-5f17f3046549.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741515882_580c342b-2f86-4a70-bcfb-474400a3921c.jpg', '8001823542', '9733200300', '01 Jan, 1985', 'Male', 'KALIKAPUR', 1, '2024-09-11 13:34:09', '2025-03-25 09:31:52'),
(105, '9914982', 5, 12, NULL, 'NUR ISLAM SEAKH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741704450_6667dd7d-6577-4ce7-9480-06e8873d08b4.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741704450_6667dd7d-6577-4ce7-9480-06e8873d08b4.jpg', '8167323382', '9733200300', '01 May, 1985', 'Male', 'KALIKAPUR', 1, '2024-09-11 13:35:52', '2025-03-11 20:17:30'),
(106, '9914999', 5, 12, NULL, 'PINTU PAUL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726247635_PJ=003.jpg', NULL, '9635286647', NULL, '01 Mar, 1987', 'Male', 'KASHINAGAR', 1, '2024-09-11 13:37:34', '2024-09-13 22:43:55'),
(107, '99149198', 5, 12, NULL, 'DIPAK PRAMANIK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726042161_123.jpg', NULL, '8016404530', NULL, '12 Aug, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-11 13:39:21', '2024-09-11 13:39:21'),
(108, '99149203', 5, 12, NULL, 'GOLOK NASKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738657250_e40523b9-09af-4d9a-822e-61ad9405d399.jpg', NULL, '9785434440', NULL, '12 May, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-11 13:41:08', '2025-02-04 13:50:50'),
(109, '99149213', 5, 12, NULL, 'SUJIT HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733395235_WhatsApp Image 2024-12-04 at 11.36.20 PM.jpeg', NULL, '7797669006', NULL, '01 Feb, 1987', 'Male', 'KASHINAGAR', 1, '2024-09-11 14:32:57', '2024-12-05 16:10:35'),
(110, '99149215', 5, 12, NULL, 'BILASH DEBNATH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742875356_f8305bf6-8f12-472b-870f-f8714e8f58cf.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742875356_f8305bf6-8f12-472b-870f-f8714e8f58cf.jpg', '9932491631', '9733823700', '01 Oct, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-11 14:59:55', '2025-03-25 09:32:36'),
(111, '99149216', 5, 12, NULL, 'SANTOSH HAZRA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726047131_123.jpg', NULL, '9932491631', NULL, '01 Feb, 1988', 'Male', 'KASHINAGAR', 1, '2024-09-11 15:02:11', '2024-09-11 15:02:11'),
(112, '99149214', 5, 12, NULL, 'AYAN MAYRA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726047247_123.jpg', NULL, '9932491631', NULL, '01 Feb, 1987', 'Male', 'KASHIAGAR', 1, '2024-09-11 15:04:07', '2024-09-11 15:04:07'),
(113, '99149217', 5, 12, NULL, 'DEBASIS HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740406001_a1dd9cf4-9c9d-4977-bbd8-18886dc58eb5.jpg', NULL, '9914921856', NULL, '11 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-11 15:06:18', '2025-02-24 19:36:41'),
(114, '99149218', 5, 12, NULL, 'GANESH NASKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742814277_56e29a06-0ce8-44fc-b405-9e3141bcf880.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742814277_56e29a06-0ce8-44fc-b405-9e3141bcf880.jpg', '7719114368', '6295703119', '01 May, 1989', 'Male', 'KASHINAGAR', 1, '2024-09-11 15:10:51', '2025-03-24 16:34:37'),
(115, '99149222', 5, 12, NULL, 'SAMBHU HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726047927_123.jpg', NULL, '7063458550', NULL, '12 May, 1981', 'Male', 'KASHINAGAR', 1, '2024-09-11 15:15:27', '2024-09-11 15:15:27'),
(116, '99149227', 5, 12, NULL, 'SATYAN SAMANTA', 1, 'BIBHUTI SAMANTA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741443182_551e0a5a-145d-4d98-8205-960600a13721.jpg', NULL, '9733595535', '9733595535', '14 Mar, 1977', 'Male', 'KASHINAGAR', 1, '2024-09-11 15:18:34', '2025-03-08 19:43:02'),
(117, '99149223', 5, 15, NULL, 'GOUTAM HALDER', 1, 'FANI BHUSAN HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726067999_WhatsApp Image 2024-09-11 at 8.49.06 PM.jpeg', NULL, '9547181685', NULL, '01 Jan, 1970', 'Male', 'BATISWAT', 1, '2024-09-11 20:49:59', '2024-09-11 20:49:59'),
(118, '99149231', 5, 12, NULL, 'RINA NASKAR', 0, 'SANTANU NASKAR', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726383345_WhatsApp Image 2024-09-15 at 12.04.53 PM.jpeg', NULL, '7699969595', NULL, '01 Feb, 1987', 'Male', 'KASHINAGAR', 1, '2024-09-12 11:27:00', '2024-09-15 12:26:15'),
(119, '99149237', 5, 12, NULL, 'SUSHIL PURKAIT', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726120764_123.jpg', NULL, '8019648723', NULL, '01 Feb, 1987', 'Male', 'KASHINAGAR', 1, '2024-09-12 11:29:24', '2024-09-12 11:29:24'),
(120, '99149238', 5, 12, NULL, 'PRASANTA SARDAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742815394_032e1cad-1802-438f-8345-b4a4c4075ba6.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742047430_HHHH.jpg', '8014562365', '9733200300', '04 May, 1985', 'Male', 'KASHIAGAR', 1, '2024-09-12 11:30:37', '2025-03-24 16:53:14'),
(121, '99149239', 5, 12, NULL, 'KALIDAS RAY', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743162414_8385866c-cf2d-481d-9ef9-8b45d76b8415.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743162414_8385866c-cf2d-481d-9ef9-8b45d76b8415.jpg', '8523698563', '7278615805', '21 May, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 11:38:27', '2025-03-28 17:16:54'),
(122, '99149242', 5, 12, NULL, 'GOUTAM RUIDAS', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726121629_123.jpg', NULL, '8256987456', NULL, '11 Feb, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 11:43:50', '2024-09-12 13:32:35'),
(123, '99149245', 5, 12, NULL, 'SWARUP HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726121739_123.jpg', NULL, '8569745698', NULL, '01 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 11:45:39', '2024-09-12 11:45:39'),
(124, '9914964', 5, 12, NULL, 'RAMKRISHNA CHAKROBORTY', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1739250748_5a4260fd-49bb-44ba-9157-526a48726f00.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743399731_67d4aac3-adc1-4dfa-aa32-f6c0c011644a.jpg', '9800986534', '8535918598', '08 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 11:50:40', '2025-03-31 11:12:11'),
(125, '99149235', 5, 14, NULL, 'JAYA KANRAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726755551_WhatsApp Image 2024-09-19 at 6.30.11 PM (2).jpeg', NULL, '9732718184', NULL, '01 May, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-12 13:05:53', '2024-09-19 19:49:11'),
(126, '99149236', 5, 15, NULL, 'AILA CHAPRASI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726826296_WhatsApp Image 2024-09-19 at 7.14.44 AM.jpeg', NULL, '9144947953', NULL, '04 Feb, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-12 13:07:43', '2024-09-20 15:28:16'),
(127, '99149243', 5, 15, NULL, 'BILASH HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732873559_bilash 1.jpeg', NULL, '7864988616', NULL, '05 Nov, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 13:09:33', '2024-11-29 15:15:59'),
(128, '99149232', 5, 15, NULL, 'SUMAN HALDER', 1, 'SATYANANDA HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726817415_WhatsApp Image 2024-09-20 at 12.28.43 AM.jpeg', NULL, '9732468280', NULL, '01 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 13:28:19', '2024-09-20 13:00:15'),
(129, '99329241', 5, 15, NULL, 'ABHIJIT BAIDYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726128498_123.jpg', NULL, '9635619985', NULL, '01 May, 1990', 'Male', 'KASHINAGAR DAS BAIDYAPARA', 1, '2024-09-12 13:38:18', '2024-09-12 13:38:18'),
(130, '99149253', 5, 15, NULL, 'ASTAMI SARDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726128670_123.jpg', NULL, '9523654872', NULL, '01 Feb, 1982', 'Female', 'KASHINAGAR', 1, '2024-09-12 13:41:10', '2024-09-12 13:41:10'),
(131, '991494', 5, 15, NULL, 'SAMIR HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726133783_123.jpg', NULL, '8420659690', NULL, '01 Feb, 1982', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:06:23', '2024-09-12 15:06:23'),
(132, '991497', 5, 15, NULL, 'SANAT GHOSH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740489601_8b9c3123-5f47-47c0-bc7f-c4c8560aa78e.jpg', NULL, '8945805641', NULL, '01 May, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:07:55', '2025-02-25 18:52:13'),
(133, '991498', 5, 15, NULL, 'SERINA MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726133972_123.jpg', NULL, '6294425908', NULL, '01 May, 1990', 'Female', 'KASHINAGER', 1, '2024-09-12 15:09:32', '2024-09-12 15:09:32'),
(134, '991499', 5, 15, NULL, 'KARIM MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726134078_123.jpg', NULL, '6297305040', NULL, '01 May, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:11:18', '2024-09-12 15:11:18'),
(135, '9914910', 5, 15, NULL, 'SUKAMAL DEBNATH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726134195_123.jpg', NULL, '9733116361', NULL, '01 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:13:15', '2024-09-12 15:13:15'),
(136, '9914912', 5, 15, NULL, 'RAJA BAIDYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726134542_123.jpg', NULL, '7585918610', NULL, '04 Dec, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:19:02', '2024-09-12 15:19:02'),
(137, '9914913', 5, 15, NULL, 'RAKIB BAIDYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726134656_123.jpg', NULL, '8345955581', NULL, '01 Feb, 1986', 'Male', 'BAIDYA PARA', 1, '2024-09-12 15:20:56', '2024-09-12 15:20:56'),
(138, '9914914', 5, 15, NULL, 'TUKAI BAIDYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726134744_123.jpg', NULL, '9933192000', NULL, '02 Nov, 1987', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:22:24', '2024-09-12 15:22:24'),
(139, '9914917', 5, 15, NULL, 'JASSICA MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726134914_123.jpg', NULL, '8016405119', NULL, '02 Dec, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:25:14', '2024-09-12 15:25:14'),
(140, '9914918', 5, 15, NULL, 'ARJYA DAS', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726135054_123.jpg', NULL, '8016405019', NULL, '02 Feb, 1989', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:27:34', '2024-09-12 15:27:34'),
(141, '9914919', 5, 15, NULL, 'SWAPAN KUMAR RUIDAS', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1734879392_6f6c18a4-74f9-4e96-bd3d-fee1268a74f3.jpg', NULL, '9382874980', NULL, '02 Jan, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 15:30:15', '2025-02-24 18:46:48'),
(142, '9914920', 5, 15, NULL, 'PRADIPTA HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726137138_123.jpg', NULL, '9748388446', NULL, '02 May, 1986', 'Male', 'KAHINAGAR', 1, '2024-09-12 16:02:18', '2024-09-12 16:02:18'),
(143, '9914921', 5, 15, NULL, 'MABUDA SEKH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726137374_123.jpg', NULL, '8392069668', NULL, '01 May, 1992', 'Male', 'KASHINAGAR', 1, '2024-09-12 16:06:14', '2024-09-12 16:06:14'),
(144, '9914923', 5, 15, NULL, 'SUMAN HALDER', 1, 'purnendu halder', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741698748_3709b309-9d1d-4dbd-9dcb-9192689d6ace.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741698748_3709b309-9d1d-4dbd-9dcb-9192689d6ace.jpg', '8944885526', '8944885526', '02 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-12 16:07:49', '2025-03-11 18:43:34'),
(145, '9924924', 5, 15, NULL, 'BIRENDRA MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726137638_123.jpg', NULL, '9091532787', NULL, '02 Feb, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-12 16:10:38', '2024-09-12 16:10:38'),
(146, '9914927', 5, 15, NULL, 'SABINA PAIK', 1, NULL, 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742197113_cccdf067-da37-4cd6-9adf-d1704db5b27e.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742197113_cccdf067-da37-4cd6-9adf-d1704db5b27e.jpg', '7063114559', '9733200300', '01 Feb, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-12 16:12:46', '2025-03-17 13:08:33'),
(147, '9914928', 5, 15, NULL, 'SAJIDA KHAMARU', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726139952_GJJJ.jpg', NULL, '8436768136', NULL, '01 May, 1970', 'Female', 'KASHINAGAR', 1, '2024-09-12 16:49:12', '2024-09-12 16:49:12'),
(148, '9914929', 5, 15, NULL, 'NAYANTARA HALDER', 0, 'SWAPAN KR HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726140065_GJJJ.jpg', NULL, '9933094170', NULL, '01 Jan, 1970', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-12 16:51:05', '2024-09-12 16:51:05'),
(149, '9914932', 5, 15, NULL, 'RAMKRISHNA  MONDAL', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726140238_GJJJ.jpg', NULL, '8637095373', NULL, '01 Jan, 1985', 'Male', 'SANKARPURKAITER CHAK', 1, '2024-09-12 16:53:58', '2024-09-12 17:54:00'),
(150, '9914934', 5, 15, NULL, 'UTTAM MONDAL', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726140809_GJJJ.jpg', NULL, '9933616805', NULL, '01 Jan, 1980', 'Male', 'MAJHER PARA', 1, '2024-09-12 17:03:29', '2024-09-12 17:03:29'),
(151, '9914935', 5, 15, NULL, 'MILAN HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726141969_GJJJ.jpg', NULL, '7384141484', NULL, '01 Jan, 1970', 'Male', 'UTTAR  KASHINGAR', 1, '2024-09-12 17:22:49', '2024-09-12 17:22:49'),
(152, '9914936', 5, 15, NULL, 'PRASANJIT BAIDYA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726142050_GJJJ.jpg', NULL, '9064833479', NULL, '01 Feb, 1970', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:24:10', '2024-09-12 17:24:10'),
(153, '9914937', 5, 15, NULL, 'MAHADEB MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726142131_GJJJ.jpg', NULL, '7479015946', NULL, '01 Feb, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:25:31', '2024-09-12 17:25:31'),
(154, '9914938', 5, 15, NULL, 'ISMAIL MOLLA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726142271_GJJJ.jpg', NULL, '9907685828', NULL, '01 Feb, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:27:51', '2024-09-12 17:27:51'),
(155, '9914939', 5, 15, NULL, 'PRADIP GAYEN', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726142664_GJJJ.jpg', NULL, '6294697105', NULL, '01 May, 2020', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:34:24', '2024-09-12 17:34:24'),
(156, '9914941', 5, 15, NULL, 'BABULAL HALDER', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726143035_GJJJ.jpg', NULL, '9734681603', NULL, '01 Feb, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:40:35', '2024-09-12 17:40:35'),
(157, '9914943', 5, 15, NULL, 'INDRANATH GAYEN', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726143153_GJJJ.jpg', NULL, '8001361871', NULL, '01 Feb, 2020', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:42:33', '2024-09-12 17:42:33'),
(158, '9914944', 5, 15, NULL, 'ABU BAKKAR AKHAN', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731918144_WhatsApp Image 2024-11-17 at 11.37.54 PM.jpeg', NULL, '7797329150', NULL, '01 Jan, 2020', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:48:18', '2024-11-18 13:52:24'),
(159, '9914945', 5, 15, NULL, 'PATHIK MONDAL', 1, 'XXXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726143637_GJJJ.jpg', NULL, '9907517077', NULL, '01 Feb, 2002', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:50:37', '2024-09-12 17:50:37'),
(160, '9914947', 5, 15, NULL, 'MUJIBAR LASKAR', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726143750_GJJJ.jpg', NULL, '9733677331', NULL, '01 Jan, 2018', 'Male', 'KASHINAGAR', 1, '2024-09-12 17:52:30', '2024-09-12 17:52:30'),
(161, '9914986', 5, 15, NULL, 'KAMALA PRAMANIK', 1, 'BASUDEV PARAMANIK', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1739766637_81d1ef05-e0ce-498a-bf9f-5f5e30eb4d3e.jpg', NULL, '7602031798', NULL, '01 Feb, 2000', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-12 17:57:32', '2025-02-17 10:00:37'),
(162, '9914988', 5, 15, NULL, 'JAYASHREE NIDDYA', 1, 'BALA RAM MIDDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726144145_GJJJ.jpg', NULL, '9933904595', NULL, '01 Feb, 1995', 'Female', 'BATISWAR', 1, '2024-09-12 17:59:05', '2024-09-12 17:59:05'),
(163, '99149228', 5, 15, NULL, 'SOUMEN HALDER', 1, 'DIPU HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726147302_WhatsApp Image 2024-09-12 at 6.49.30 PM (1).jpeg', NULL, '9635122312', NULL, '01 Jan, 2000', 'Male', 'FULBAGICHA', 1, '2024-09-12 18:51:42', '2024-09-12 18:51:42'),
(164, '9914989', 5, 15, NULL, 'SUMIT HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726160216_GJJJ.jpg', NULL, '6290456090', NULL, '01 Feb, 1990', 'Male', 'KASHINAGAR', 1, '2024-09-12 22:26:56', '2024-09-12 22:26:56'),
(165, '9914990', 5, 15, NULL, 'RAMA DEBNATH', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726160413_GJJJ.jpg', NULL, '8016839252', NULL, '01 Feb, 1995', 'Female', 'KASHINAGAR', 1, '2024-09-12 22:30:13', '2024-09-12 22:30:13'),
(166, '9914991', 5, 15, NULL, 'MAIDUL GAZI', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726160503_GJJJ.jpg', NULL, '9564255205', NULL, '01 Jan, 2002', 'Male', 'KASHINAGAR', 1, '2024-09-12 22:31:43', '2024-09-12 22:31:43'),
(167, '9914992', 5, 15, NULL, 'SANKHA SUBHA GAYEN', 1, 'XXXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740287840_85346278-06ff-4c9a-b160-197a151cda45.jpg', NULL, '9749711530', NULL, '01 Feb, 2000', 'Male', 'KASHINAGAR', 1, '2024-09-12 22:33:04', '2025-02-23 10:47:20'),
(168, '9914994', 5, 15, NULL, 'SIKHA HALDER', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742052477_7d773ac5-73b1-4e74-936d-2508f312bd29.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742052477_7d773ac5-73b1-4e74-936d-2508f312bd29.jpg', '9547748943', '9733200300', '01 Jan, 2000', 'Female', 'UTTAR KASHINAGAR', 1, '2024-09-12 22:34:31', '2025-03-15 20:57:57'),
(169, '9914996', 5, 15, NULL, 'JAHANGIR HOSEN MOLLA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726244320_JAHANGIR  MOLLA.jpeg', NULL, '7890605481', NULL, '01 Feb, 1990', 'Male', 'KASHINAGAR', 1, '2024-09-12 22:36:20', '2024-09-13 21:48:40'),
(170, '9914998', 5, 15, NULL, 'SADIM ALI MOLLA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726160867_GJJJ.jpg', NULL, '9163158719', NULL, '01 Feb, 2003', 'Male', 'KASHINAGAR', 1, '2024-09-12 22:37:47', '2024-09-12 22:37:47'),
(171, '99149102', 5, 15, NULL, 'KRISHNA CHAKRABORTY', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726207344_123.jpg', NULL, '9733709413', NULL, '02 Dec, 1998', 'Male', 'KASHINAGAR', 1, '2024-09-13 11:32:24', '2024-09-13 11:32:24'),
(172, '99149105', 5, 15, NULL, 'ABIR HALDER', 1, 'DIPTA PRASAD HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726207578_ABIR HALDER.jpeg', NULL, '9732046561', NULL, '02 Mar, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-13 11:36:18', '2024-09-13 11:36:18'),
(173, '99149108', 5, 15, NULL, 'DIPTA PRASAD HALDER', 1, 'ANINIRUDHA HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726208043_WhatsApp Image 2024-09-07 at 3.24.58 AM.jpeg', NULL, '9732046561', NULL, '01 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-13 11:44:03', '2024-09-13 11:44:03'),
(174, '99149110', 5, 15, NULL, 'HOSEN ALI LASKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726208365_123.jpg', NULL, '8617582187', NULL, '01 Dec, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-13 11:49:25', '2024-09-13 11:49:25'),
(175, '99149115', 5, 15, NULL, 'SABITA PRAMANIK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726816970_WhatsApp Image 2024-09-20 at 12.21.07 AM.jpeg', NULL, '9865321452', NULL, '01 Feb, 1986', 'Male', 'KASHINGAR', 1, '2024-09-13 11:52:09', '2024-09-20 12:52:50'),
(176, '99149117', 5, 15, NULL, 'HASIBUL LASKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726208668_123.jpg', NULL, '9382411825', NULL, '01 Feb, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-13 11:54:28', '2024-09-13 11:54:28'),
(177, '99149119', 5, 15, NULL, 'REBEKA GHARAMI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726208807_123.jpg', NULL, '8768867446', NULL, '12 Feb, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-13 11:56:47', '2024-09-13 11:56:47'),
(178, '99149126', 5, 15, NULL, 'SUMITRA HALDER (BOJIRANI)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742048020_33333.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742048020_33333.jpg', '9883797499', '9732200300', '12 Feb, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-13 12:02:41', '2025-03-30 10:17:19'),
(179, '99149127', 5, 15, NULL, 'AKTAR HOSSEN AKHON', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726209355_123.jpg', NULL, '8436432662', NULL, '02 Jan, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-13 12:05:55', '2024-09-13 12:05:55'),
(180, '99149128', 5, 15, NULL, 'ISMAIL GAZI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726209503_123.jpg', NULL, '9967296965', NULL, '25 May, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-13 12:08:23', '2024-09-13 12:08:23'),
(181, '99149129', 5, 15, NULL, 'ANUPAM JANA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726209677_123.jpg', NULL, '9733662403', NULL, '02 Feb, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-13 12:11:17', '2024-09-13 12:11:17'),
(182, '99149131', 5, 15, NULL, 'BHIM PRAMANIK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726209812_123.jpg', NULL, '6296662844', NULL, '02 May, 1983', 'Male', 'KASHINAGAR', 1, '2024-09-13 12:13:32', '2024-09-13 12:13:32'),
(183, '99149132', 5, 15, NULL, 'PARBATI GHOSH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726211174_123.jpg', NULL, '8116782396', NULL, '25 Feb, 1987', 'Female', 'KASHINAGAR', 1, '2024-09-13 12:36:14', '2024-09-13 12:36:14'),
(184, '99149133', 5, 15, NULL, 'HAMIDA BIBI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726211247_123.jpg', NULL, '9865323265', NULL, '14 Feb, 1985', 'Female', 'KSHINAGAR', 1, '2024-09-13 12:37:27', '2024-09-13 12:37:27'),
(185, '99149134', 5, 15, NULL, 'KAMALA GAYAN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1727684502_WhatsApp Image 2024-09-27 at 4.04.07 AM.jpeg', NULL, '8956241236', NULL, '01 May, 1983', 'Female', 'KASHINAGAR', 1, '2024-09-13 12:39:20', '2024-09-30 13:51:42'),
(186, '99149136', 5, 15, NULL, 'MAMATA GAYAN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726823266_WhatsApp Image 2024-09-20 at 2.06.18 AM.jpeg', NULL, '8632598563', NULL, '01 May, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-13 12:44:14', '2024-09-20 14:37:46'),
(187, '99149137', 5, 15, NULL, 'TILATTAMA GAYAN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726824584_WhatsApp Image 2024-09-20 at 2.14.31 AM (2).jpeg', NULL, '8956232365', NULL, '05 Mar, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-13 12:46:52', '2024-09-20 14:59:44'),
(188, '99149138', 5, 15, NULL, 'MITA GAYAN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726824375_WhatsApp Image 2024-09-20 at 2.14.31 AM (1).jpeg', NULL, '8956325698', NULL, '02 Feb, 1983', 'Female', 'KASHINAGAR', 1, '2024-09-13 12:50:31', '2024-09-20 14:56:15'),
(189, '99149140', 5, 15, NULL, 'PURNIMA PRAMANIK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726213977_123.jpg', NULL, '7063879838', NULL, '01 May, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-13 13:22:57', '2024-09-13 13:22:57'),
(190, '99149142', 5, 15, NULL, 'TAMINA KHATUN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726214213_123.jpg', NULL, '9163265452', NULL, '01 Feb, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-13 13:26:53', '2024-09-13 13:26:53');
INSERT INTO `customers` (`id`, `customer_id`, `area_id`, `agent_id`, `random_code`, `name`, `father_or_husband`, `father_or_husband_name`, `image`, `nominee_image`, `phone`, `alternative_phone`, `dob`, `gender`, `address`, `status`, `created_at`, `updated_at`) VALUES
(191, '99149143', 5, 15, NULL, 'RIJIYA BIBI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726214293_123.jpg', NULL, '8956232364', NULL, '05 Dec, 1982', 'Female', 'KASHINAGAR', 1, '2024-09-13 13:28:13', '2024-09-13 13:28:13'),
(192, '99149145', 5, 15, NULL, 'AJMIRA BIBI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741152625_2075a79d-0140-40f7-9027-895ceffbeac6.jpg', NULL, '6297725951', NULL, '02 May, 1986', 'Female', 'KASHINAGAR', 1, '2024-09-13 13:37:04', '2025-03-05 11:00:25'),
(193, '99149146', 5, 15, NULL, 'FIDDAUS MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726215226_123.jpg', NULL, '6294350779', NULL, '01 Feb, 1985', 'Male', 'KASHINAGAR', 1, '2024-09-13 13:43:46', '2024-09-13 13:43:46'),
(194, '99149149', 5, 15, NULL, 'SABIR HOSSEN LASKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726215440_123.jpg', NULL, '7365019084', NULL, '02 May, 1983', 'Male', 'KASHINAGAR', 1, '2024-09-13 13:47:20', '2024-09-13 15:23:03'),
(195, '99149148', 5, 15, NULL, 'AJIJUL MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726220859_123.jpg', NULL, '8101370834', NULL, '01 May, 1986', 'Male', 'KASHINAGAR', 1, '2024-09-13 15:17:39', '2024-09-13 15:17:39'),
(196, '99149150', 5, 15, NULL, 'SAMRAT KUMAR DEY', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1735627959_SAMRAT DEY.jpg', NULL, '6291921973', NULL, '01 May, 1985', 'Male', 'KASHINGAR', 1, '2024-09-13 15:25:27', '2024-12-31 12:22:39'),
(197, '99149254', 5, 15, NULL, 'BRINDABAN TANTI', 1, 'PRATAB CH TANTI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726231602_WhatsApp Image 2024-09-13 at 6.14.15 PM.jpeg', NULL, '7047921082', NULL, '07 Mar, 1972', 'Male', 'KHARI GHOSER CHAK', 1, '2024-09-13 18:16:42', '2024-09-13 18:16:42'),
(198, '99149255', 5, 15, NULL, 'CHAMPA HALDER', 0, 'DEBA PRASAD HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726236509_WhatsApp Image 2024-09-13 at 7.33.14 PM (1).jpeg', NULL, '9547185219', NULL, '01 Jan, 1988', 'Female', 'KHARI SARASWATI PARA', 1, '2024-09-13 19:38:29', '2024-09-13 19:38:29'),
(199, '99149211', 5, 15, NULL, 'IRUCH ALI MOLLA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726244679_IRUCH ALI MOLLA ID 99149211.jpg', NULL, '9732200300', NULL, '02 Apr, 1980', 'Male', 'KHARI GHOSER CHAK', 1, '2024-09-13 21:54:39', '2024-09-13 21:54:39'),
(200, '99149151', 5, 15, NULL, 'KINKOR HALDER', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726246615_GJJJ.jpg', NULL, '9748404881', NULL, '01 Feb, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-13 22:26:55', '2024-09-13 22:26:55'),
(201, '99149152', 5, 15, NULL, 'KHOKAN HALDER', 0, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726246674_GJJJ.jpg', NULL, '8653519783', NULL, '01 Feb, 1970', 'Male', 'KASHINAGAR', 1, '2024-09-13 22:27:54', '2024-09-13 22:27:54'),
(202, '99149153', 5, 15, NULL, 'DIPANKAR HALDER', 1, '8293991617', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1734244870_fa9a6882-22f6-4b63-a95a-d19f302e1794.jpg', NULL, '8293991617', NULL, '01 Mar, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-13 22:29:13', '2024-12-15 12:11:10'),
(203, '99149155', 5, 15, NULL, 'RAJKUMAR MAITY', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1735628460_RAJKUMAR MAITY.jpeg', NULL, '9732586792', NULL, '01 Feb, 1970', 'Male', 'KASHINAGAR', 1, '2024-09-13 22:30:33', '2024-12-31 12:31:00'),
(204, '99149158', 5, 15, NULL, 'PUSPA RANI RUI DAS', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726247078_GJJJ.jpg', NULL, '7001731619', NULL, '01 Feb, 1970', 'Female', 'KASHINAGAR', 1, '2024-09-13 22:34:38', '2024-09-13 22:34:38'),
(205, '99149159', 5, 15, NULL, 'SUJATA SARDAR', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726815167_WhatsApp Image 2024-09-19 at 11.50.15 PM.jpeg', NULL, '6295809306', NULL, '01 Feb, 1970', 'Female', 'KASHINAGAR DAS BAIDYA PARA', 1, '2024-09-13 22:36:40', '2024-09-20 12:22:47'),
(206, '99149160', 5, 15, NULL, 'ALAMGIR MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726290967_images.jpg', NULL, '9749333663', NULL, '01 Feb, 1980', 'Male', 'KASHINAGAR', 1, '2024-09-14 10:46:07', '2024-09-14 10:46:07'),
(207, '99149161', 5, 15, NULL, 'SWAPAN HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726291036_images.jpg', NULL, '6294257871', NULL, '01 Feb, 2000', 'Male', 'KASHINAGAR', 1, '2024-09-14 10:47:16', '2024-09-14 10:47:16'),
(208, '99149162', 5, 15, NULL, 'GANESH PRAMANIK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726291098_images.jpg', NULL, '9734849618', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 10:48:18', '2024-09-14 10:48:18'),
(209, '99149167', 5, 21, NULL, 'MAYA HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744808041_maya.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744808041_maya.jpg', '9619893968', '9733200300', '04 Sep, 2024', 'Female', 'OFFICE', 1, '2024-09-14 10:51:12', '2025-04-16 18:24:01'),
(210, '99149168', 5, 21, NULL, 'SUSAMA PURKAIT', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744807946_susama.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744807946_susama.jpg', '9732300200', '9733200300', '04 Sep, 2024', 'Female', 'OFFICE', 1, '2024-09-14 10:52:25', '2025-04-16 18:22:26'),
(211, '99149169', 5, 21, NULL, 'SANDHYA PURKAIT', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744807985_sandhya.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744807985_sandhya.jpg', '8609738960', '9733200300', '04 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 11:20:01', '2025-04-16 18:23:05'),
(212, '99149170', 5, 21, NULL, 'KALIDASI GAYEN', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1745409966_ab6054c4-8a72-40f4-a00a-b22829230c82.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1745409966_9559dd31-0684-4caa-8163-1905333e5659.jpg', '9619893968', '9733200300', '11 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 11:21:09', '2025-04-23 17:36:06'),
(213, '99149171', 5, 15, NULL, 'ASHIMA GHOSH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726293123_images.jpg', NULL, '7679916421', NULL, '11 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 11:22:03', '2024-09-14 11:22:03'),
(214, '99149172', 5, 15, NULL, 'KINKOR GHOSH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726293398_images.jpg', NULL, '7679916421', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 11:26:38', '2024-09-14 11:26:38'),
(215, '99149174', 5, 15, NULL, 'NOOR JAMAL SEKH', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726293525_images.jpg', NULL, '9883723195', NULL, '11 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 11:28:45', '2024-09-14 11:28:45'),
(216, '99149175', 5, 15, NULL, 'BISWANATH MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726293579_images.jpg', NULL, '8972760866', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 11:29:39', '2024-09-14 11:29:39'),
(217, '99149180', 5, 15, NULL, 'BUDDHISWAR MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726293687_images.jpg', NULL, '9674070556', NULL, '03 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 11:31:27', '2024-09-14 11:31:27'),
(218, '99149181', 5, 15, NULL, 'MADHUMITA SARDAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726293757_images.jpg', NULL, '9064432336', NULL, '28 Aug, 2024', 'Female', 'KHARI KOYABATI', 1, '2024-09-14 11:32:37', '2024-09-27 13:37:41'),
(219, '99149186', 5, 15, NULL, 'RINA CHAKRABORTY', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726294211_images.jpg', NULL, '9732928621', NULL, '12 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 11:40:11', '2024-09-14 11:40:11'),
(220, '99149191', 5, 15, NULL, 'SABITRI MIDDYA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726294327_images.jpg', NULL, '9933904595', NULL, '10 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 11:42:07', '2024-09-14 11:42:07'),
(221, '99149193', 5, 15, NULL, 'RAJU THAKUR', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726320017_GJJJ.jpg', NULL, '7679197631', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 18:50:17', '2024-09-14 18:50:17'),
(222, '99149194', 5, 15, NULL, 'PRASANTA SARKAR', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741869186_b5847ce1-c52f-48f0-8a5f-37e2348283f6.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741869186_b5847ce1-c52f-48f0-8a5f-37e2348283f6.jpg', '6294030380', '9733200300', '11 Sep, 2024', 'Male', 'PAKURTALA', 1, '2024-09-14 18:51:31', '2025-03-13 18:03:06'),
(223, '99149196', 5, 15, NULL, 'RINA  ADHIKARI', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733318023_8db88e5b-15f4-411e-bc4c-697df11a0285.jpg', NULL, '7679175025', NULL, '04 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 18:55:30', '2024-12-04 18:43:43'),
(224, '99149197', 5, 15, NULL, 'MONJILA BIBI MOLLA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726320407_GJJJ.jpg', NULL, '8392009982', NULL, '04 Sep, 2024', 'Female', 'KASHINGAR', 1, '2024-09-14 18:56:47', '2024-09-14 18:56:47'),
(226, '99149204', 5, 15, NULL, 'CHANDRIKA PATHAK', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742991591_e31ea7c4-315f-40b3-9f71-85a4a866583f.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742991591_e31ea7c4-315f-40b3-9f71-85a4a866583f.jpg', '9732786465', '9732786465', '11 Sep, 2024', 'Female', 'KASHINAGAR', 1, '2024-09-14 19:01:17', '2025-03-26 17:49:51'),
(227, '99149219', 5, 15, NULL, 'SHYAMALENDU SARKAR', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741151017_f487502d-f991-48b2-954a-a7bdb396204b.jpg', NULL, '9933483115', NULL, '04 Sep, 2024', 'Male', 'PAKURTALA', 1, '2024-09-14 19:04:52', '2025-03-05 10:33:37'),
(228, '99149221', 5, 15, NULL, 'TUHIN MONDAL', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743267223_58e6ab23-aabb-4ba1-adc6-70be2297cb6f.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743267223_58e6ab23-aabb-4ba1-adc6-70be2297cb6f.jpg', '8436736784', '9733200300', '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:05:55', '2025-03-29 22:23:43'),
(229, '99149224', 5, 15, NULL, 'UTTAM HALDER', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726321140_GJJJ.jpg', NULL, '7718459126', NULL, '10 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:09:00', '2024-09-14 19:09:00'),
(230, '99149225', 5, 15, NULL, 'ASRAB MOLLA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726321232_GJJJ.jpg', NULL, '9732460829', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:10:32', '2024-09-14 19:10:32'),
(231, '99149226', 5, 15, NULL, 'HABIB BULLA SEKH', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726666968_WhatsApp Image 2024-09-18 at 7.00.34 PM.jpeg', NULL, '6296794435', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:11:44', '2024-09-18 19:12:48'),
(232, '9914924', 5, 15, NULL, 'BISHOKATU NAIYA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726321544_GJJJ.jpg', NULL, '9907529927', NULL, '11 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:15:44', '2024-09-14 19:15:44'),
(233, '99149241', 5, 15, NULL, 'ABHIJIT BAIDYA', 1, 'BHARAT BAIDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726321687_GJJJ.jpg', NULL, '9733200300', NULL, '05 Sep, 2024', 'Male', 'DAS BAIDYA PARA', 1, '2024-09-14 19:18:07', '2024-09-14 19:18:07'),
(234, '99149244', 5, 15, NULL, 'SWARUP CHAKRABORTY', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729503545_swarup ch.jpeg', NULL, '9635489752', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:24:10', '2024-10-21 15:09:05'),
(235, '99149246', 5, 12, NULL, 'PRATIMA DEBNATH', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733395319_WhatsApp Image 2024-12-05 at 12.48.33 AM (1).jpeg', NULL, '9732200300', NULL, '05 Sep, 2024', 'Male', 'KASHINAGAR BAZAR', 1, '2024-09-14 19:26:40', '2024-12-05 16:11:59'),
(236, '99149247', 5, 15, NULL, 'SANTU MOYRA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742753782_f2dc0a76-48a7-48f9-9308-32ca2718d29e.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742753782_f2dc0a76-48a7-48f9-9308-32ca2718d29e.jpg', '9733200300', '9064685620', '05 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:27:46', '2025-03-23 23:46:22'),
(237, '99149248', 5, 12, NULL, 'ABDUL HAMID MOLLA', 1, 'HASAN MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738926073_750fe309-c2d6-4a6f-8024-0442c9af8747.jpg', NULL, '9851359754', NULL, '18 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:29:12', '2025-02-07 16:31:13'),
(238, '99149249', 5, 12, NULL, 'INDRANI PRAMANIK', 0, 'NIRMAL PRAMANIK', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732450371_WhatsApp Image 2024-11-24 at 5.40.19 PM.jpeg', NULL, '6297757130', NULL, '04 Sep, 2024', 'Female', 'KASHINAGAR BAZAR', 1, '2024-09-14 19:30:38', '2024-11-24 17:42:51'),
(239, '99149250', 5, 15, NULL, 'UTTAM ROY', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726322541_GJJJ.jpg', NULL, '7602717658', NULL, '04 Sep, 2024', 'Male', 'KHARI SRINAGAR', 1, '2024-09-14 19:32:21', '2024-09-14 19:32:21'),
(240, '99149251', 5, 15, NULL, 'CHHALA UDDIN GAZI', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742052970_d32ccbc0-cc16-4896-970a-6da35045f9b2.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742052970_d32ccbc0-cc16-4896-970a-6da35045f9b2.jpg', '8327014284', '9733200300', '11 Sep, 2024', 'Male', 'CHANDPASHA', 1, '2024-09-14 19:35:12', '2025-03-15 21:06:10'),
(241, '99149252', 5, 15, NULL, 'SUBHARA MONDAL', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726322819_GJJJ.jpg', NULL, '9609196291', NULL, '04 Sep, 2024', 'Male', 'KASHINAGAR', 1, '2024-09-14 19:36:59', '2024-09-14 19:36:59'),
(242, '99149256', 5, 15, NULL, 'SAMSUDA BAIDYA', 0, 'ARFAT ALI BAIDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1726383282_WhatsApp Image 2024-09-15 at 12.18.17 PM.jpeg', NULL, '8536088445', NULL, '11 Sep, 2024', 'Female', 'KHARI SHASAN PARA', 1, '2024-09-15 12:24:42', '2024-09-15 12:24:42'),
(243, '99149259', 5, 15, NULL, 'JASMINA SEKH', 1, 'KHAYRUL SEKH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1727344920_WhatsApp Image 2024-09-24 at 10.17.42 PM.jpeg', NULL, '7478115020', NULL, '08 Feb, 1991', 'Female', 'KHARI', 1, '2024-09-26 15:32:01', '2024-09-27 12:13:51'),
(244, '99149260', 5, 15, NULL, 'ARJINA SEKH', 0, 'RABIUL SEKH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1727419805_WhatsApp Image 2024-09-24 at 4.44.35 AM.jpeg', NULL, '7602699370', NULL, '07 Sep, 1994', 'Female', 'KHARI', 1, '2024-09-27 12:20:05', '2024-09-27 12:20:05'),
(245, '99149261', 5, 15, NULL, 'SUBIR SEKH', 1, 'HARAN SEKH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1730112998_subir.jpeg', NULL, '8250385431', NULL, '07 Dec, 1984', 'Male', 'JOTAR DEUL', 1, '2024-09-27 12:28:14', '2024-10-28 16:26:38'),
(246, '99149262', 5, 15, NULL, 'RUPA HALDER', 0, 'SAMBHU NATH HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1727421066_WhatsApp Image 2024-09-27 at 12.05.51 AM.jpeg', NULL, '9609105003', NULL, '25 Jan, 1995', 'Female', 'KASHINAGAR', 1, '2024-09-27 12:41:06', '2024-09-27 12:41:06'),
(247, '99149263', 5, 15, NULL, 'JITHIKA DEBNATH', 0, 'BADAL DEBNATH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1727684425_WhatsApp Image 2024-09-30 at 1.17.30 AM (2).jpeg', NULL, '8116350011', NULL, '01 Jan, 1977', 'Female', 'KASHINAGAR', 1, '2024-09-30 13:50:25', '2024-09-30 13:50:25'),
(248, '99149264', 5, 15, NULL, 'RAJU KHAN', 1, NULL, 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1728902502_images.jpg', NULL, '6295607023', NULL, '09 Oct, 2024', 'Male', 'UTTAR KASHINAGAR', 1, '2024-10-14 16:11:42', '2024-10-14 16:11:42'),
(249, '99149265', 5, 15, NULL, 'MOUSUMI HALDER', 0, 'PULAK HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729503944_mou.jpeg', NULL, '9339026093', NULL, '10 Oct, 2024', 'Female', 'ARJUNTALA', 1, '2024-10-14 16:13:08', '2024-10-21 15:15:44'),
(250, '99149266', 5, 15, NULL, 'ANANDA KANSARI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740405959_50eb777c-545e-41e8-9663-b903d6fbdf4d.jpg', NULL, '8918893761', NULL, '02 Oct, 2024', 'Male', 'SANKARPURKAITCHAK', 1, '2024-10-14 16:14:18', '2025-02-24 19:35:59'),
(251, '99149267', 5, 15, NULL, 'SUBRATA NASKAR', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729493387_surata.jpeg', NULL, '8597244945', NULL, '09 Oct, 2024', 'Male', 'KASHINAGAR', 1, '2024-10-14 16:15:26', '2024-10-21 12:19:47'),
(252, '99149268', 5, 15, NULL, 'JOSHNA PAIK', 1, 'XXXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741150467_c1ee423a-59a2-4441-8cdb-a5c074f9bf4d.jpg', NULL, '8250498890', NULL, '03 Oct, 2024', 'Female', 'KASHINAGAR', 1, '2024-10-14 16:16:36', '2025-03-05 10:24:27'),
(253, '99149269', 5, 12, NULL, 'MAHESWAR HALDER', 1, 'DEBENDRANATH HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1728902926_images.jpg', NULL, '9733823700', NULL, '02 Oct, 2024', 'Male', 'KASHINAGAR', 1, '2024-10-14 16:18:46', '2024-10-14 16:18:46'),
(254, '99149270', 5, 12, NULL, 'TAPAN DHARA', 1, 'XXXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741866576_2b120c66-38e2-4e05-a2d6-99a1ae0eb2f0.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741866576_2b120c66-38e2-4e05-a2d6-99a1ae0eb2f0.jpg', '9064049763', '9733823700', '09 Oct, 2024', 'Male', 'KASHINAGAR', 1, '2024-10-14 16:19:46', '2025-03-13 17:19:36'),
(255, '99149271', 5, 15, NULL, 'RIYAJ UDDIN MOLLA', 1, 'RAHAMATULLA MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1728907988_2a4cbfea-768a-4e7f-ae65-1e58bb66eaec (1).jpeg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742053005_0897625d-05e5-4acc-8d8b-05e20d609832.jpg', '6296373414', '9733200300', '01 Jan, 1994', 'Male', 'KHARI', 1, '2024-10-14 16:22:20', '2025-03-15 21:06:45'),
(256, '99149272', 5, 15, NULL, 'RAJAT HALDER', 1, 'SAMIR HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1728907968_WhatsApp Image 2024-10-14 at 4.46.40 PM.jpeg', NULL, '9064675620', NULL, '18 Oct, 2024', 'Male', 'UTTAR KASHINAGAR', 1, '2024-10-14 17:37:28', '2024-10-14 17:42:48'),
(257, '99149273', 5, 15, NULL, 'SUCHITRA HALDER', 0, 'BIJAY HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1728907951_WhatsApp Image 2024-10-14 at 4.46.39 PM.jpeg', NULL, '8373886998', NULL, '17 Oct, 2024', 'Male', 'UTTAR KASHINAGAR', 1, '2024-10-14 17:40:07', '2024-10-14 17:43:35'),
(258, '99149274', 5, 15, NULL, 'SIPRA RANI DOLUI', 0, 'RINKU DOLUI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729246925_images.jpg', NULL, '8937125532', NULL, '02 Apr, 1990', 'Female', 'MANDAL PARA', 1, '2024-10-18 15:52:05', '2024-10-18 15:52:05'),
(259, '99149276', 5, 15, NULL, 'SELINA DOLUI', 0, 'MALAY DOLUI', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729249277_SELINA.jpeg', NULL, '9732526233', NULL, '10 Jan, 1994', 'Female', 'KASHINAGAR', 1, '2024-10-18 15:55:48', '2024-10-18 16:31:17'),
(260, '99149275', 5, 15, NULL, 'RATNA MONDAL', 0, 'ASIS MONDAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729577437_WhatsApp Image 2024-10-21 at 4.27.15 AM.jpeg', NULL, '7679916369', NULL, '12 May, 1995', 'Female', 'KASHINAGAR', 1, '2024-10-22 11:40:37', '2024-10-22 11:40:37'),
(261, '99149277', 5, 15, NULL, 'RAJARSHI HALDER', 1, 'BIMAL KRISHNA HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1729930597_WhatsApp Image 2024-10-26 at 1.15.48 AM.jpeg', NULL, '9732602566', NULL, '21 Dec, 1979', 'Male', 'KASHINAGAR', 1, '2024-10-26 13:46:37', '2024-10-26 13:46:37'),
(262, '99149278', 5, 15, NULL, 'SWAPNA HALDER', 0, 'SHYAM SUNDAR HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731670074_66666.jpg', NULL, '8768106632', NULL, '29 Oct, 2024', 'Female', 'MANDAL PARA', 1, '2024-10-30 12:07:51', '2024-11-15 16:59:44'),
(263, '99149279', 5, 15, NULL, 'SUSHMITA MONDAL', 0, 'SATYAJIT MONDAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1730270979_WhatsApp Image 2024-10-29 at 1.33.58 AM.jpeg', NULL, '9564631740', NULL, '22 Jun, 1997', 'Female', 'KASHINAGAR', 1, '2024-10-30 12:19:39', '2024-10-30 12:19:39'),
(264, '99149280', 5, 12, NULL, 'BAPI PURKAIT', 1, 'LT DIBAKAR PURKAIT', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731056551_WhatsApp Image 2024-11-08 at 12.59.54 AM.jpeg', NULL, '9734897337', NULL, '14 Nov, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-08 14:32:31', '2024-11-08 14:32:31'),
(265, '99149281', 5, 15, NULL, 'SAMIR TELI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731056638_SAMIR.jpeg', NULL, '9608147716', NULL, '06 Nov, 2024', 'Male', 'COMPANIR THAK', 1, '2024-11-08 14:33:58', '2024-11-08 14:33:58'),
(266, '99149282', 5, 12, NULL, 'PATRHA MOYRA', 1, 'NIMAI MOYRA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731056707_WhatsApp Image 2024-11-06 at 2.27.52 AM.jpeg', NULL, '7001132960', NULL, '31 Oct, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-08 14:35:07', '2024-11-08 14:35:07'),
(267, '99149283', 5, 15, NULL, 'UTPAL JATUA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731056967_WhatsApp Image 2024-11-08 at 1.06.19 AM.jpeg', NULL, '9733552340', NULL, '02 Jan, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-08 14:39:27', '2024-11-08 14:39:27'),
(268, '99149284', 5, 12, NULL, 'DINABANDHU GAYEN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731057109_WhatsApp Image 2024-11-06 at 11.16.32 PM.jpeg', NULL, '9163723330', NULL, '06 Nov, 2024', 'Male', 'MAJHER PARA', 1, '2024-11-08 14:41:49', '2024-11-08 14:41:49'),
(269, '99149285', 5, 15, NULL, 'HEMANTA KAYAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742815249_3cb0fb9b-e82f-4190-86ee-6fddf0ec21de.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742754007_214b3dfb-0d22-46cb-a9cf-6d70c8f00c0d.jpg', '7063114348', '9733205064', '13 Nov, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-13 15:58:23', '2025-03-24 16:50:49'),
(270, '99149291', 5, 18, NULL, 'SHANKAR GHORAMI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731494492_WhatsApp Image 2024-11-13 at 2.37.55 AM.jpeg', NULL, '9647482801', NULL, '07 Nov, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-13 16:11:32', '2024-11-13 16:11:32'),
(271, '99149257', 5, 15, NULL, 'LILUFA BIBI', 0, 'MEHEBUB HOSSEN MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731922733_123.jpg', NULL, '9832501016', NULL, '31 Oct, 2024', 'Female', 'KALIKAPUR', 1, '2024-11-18 15:08:53', '2024-11-18 15:08:53'),
(272, '99149258', 5, 15, NULL, 'MEHEBUB HOSSEN MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1731922823_123.jpg', NULL, '9832491016', NULL, '14 Nov, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-18 15:10:23', '2024-11-18 15:10:23'),
(273, '99149293', 5, 15, NULL, 'RAJESH MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732523851_123.jpg', NULL, '8514834239', NULL, '07 Nov, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-25 14:07:31', '2024-11-25 14:07:31'),
(274, '99149294', 5, 15, NULL, 'TANMOY GAYEN', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732524452_TANMOY .jpeg', NULL, '8016389821', NULL, '30 Oct, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-25 14:10:11', '2024-11-25 14:17:32'),
(275, '99149295', 5, 15, NULL, 'SANTOSHI MAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732957259_SANTOSHI.jpeg', NULL, '8481977499', NULL, '14 Nov, 2024', 'Female', 'KASHINAGAR', 1, '2024-11-30 14:27:49', '2024-11-30 15:05:50'),
(276, '99149296', 5, 18, NULL, 'KHOKON NAIYA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1732957375_KHOKON.jpeg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742053042_d4871d96-b4c6-498d-a2e5-12e87849c1d2.jpg', '8967267388', '9733200300', '13 Nov, 2024', 'Male', 'KASHINAGAR', 1, '2024-11-30 14:32:55', '2025-03-15 21:07:22'),
(277, '99149297', 5, 18, NULL, 'BIKRAM PURKAIT', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1734687911_WhatsApp Image 2024-12-01 at 11.56.01 PM.jpeg', NULL, '7908959435', NULL, '11 Dec, 2024', 'Male', 'KASHINAGAR', 1, '2024-12-02 15:10:13', '2024-12-20 15:15:11'),
(278, '99149298', 5, 18, NULL, 'HARSADEV SARDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1734687851_WhatsApp Image 2024-12-01 at 11.20.34 PM.jpeg', NULL, '9830252338', NULL, '13 Dec, 2024', 'Male', 'KASHINAGAR', 1, '2024-12-02 15:13:27', '2024-12-20 15:14:11'),
(279, '99149299', 5, 18, NULL, 'BABUSONA HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733132798_BABU.jpeg', NULL, '8927838008', NULL, '11 Dec, 2024', 'Male', 'KASHINAGAR', 1, '2024-12-02 15:16:38', '2024-12-02 15:16:38'),
(280, '99149300', 5, 15, NULL, 'OFFICE COLECTION', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733133655_sahaj logo .jpg', NULL, '9064676556', NULL, '11 Dec, 2024', 'Male', 'OFFICE COLECTION', 1, '2024-12-02 15:30:55', '2024-12-02 15:30:55'),
(281, '99149292', 5, 15, NULL, 'SUPARNA ROY', 0, 'RAMKRISHNA ROY', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743148103_ad744054-679e-4ea4-a959-11455fa2cb1c.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743148103_ad744054-679e-4ea4-a959-11455fa2cb1c.jpg', '7316672909', '9733200300', '11 Dec, 2024', 'Female', 'KASHINAGAR', 1, '2024-12-02 15:58:04', '2025-03-28 13:18:23'),
(282, '99149301', 5, 15, NULL, 'SHASHINATH PRAMANIK', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733212197_SHASHANKA.jpeg', NULL, '8016389549', NULL, '12 Dec, 2024', 'Male', 'CHAKKATIRTHA', 1, '2024-12-03 13:19:57', '2024-12-03 13:19:57'),
(283, '99149302', 5, 15, NULL, 'DINOBANDHU NAIYA', 1, 'AJIT NAIYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1733826007_DINO.jpeg', NULL, '9733560189', NULL, '01 Apr, 1978', 'Male', 'CHAPLA', 1, '2024-12-10 15:50:07', '2024-12-10 15:50:07'),
(284, '99149303', 5, 15, NULL, 'MOMTAJ PEYADA', 0, 'NASIRUDDIN PEYADA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738225769_f10a93b5-2a83-4304-b385-9da9b8430684.jpg', NULL, '8768108491', NULL, '19 Oct, 1984', 'Female', 'KASHINAGAR', 1, '2024-12-26 15:07:03', '2025-01-30 13:59:29'),
(285, '99149304', 5, 15, NULL, 'UTTAM MONDAL', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1735627827_UTTAM MANDAL.jpg', NULL, '8670237703', NULL, '12 Dec, 2024', 'Male', 'KASHINAGAR', 1, '2024-12-31 12:20:27', '2024-12-31 12:20:27'),
(286, '99149305', 5, 15, NULL, 'GOPAL NASKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1735628205_GOPAL NASKAR.jpg', NULL, '9647408156', NULL, '11 Dec, 2024', 'Male', 'KASHINAGAR', 1, '2024-12-31 12:26:45', '2024-12-31 12:26:45'),
(287, '99149306', 5, 15, NULL, 'BAPPA HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1735808388_3599fa0d-c836-4745-a75a-301545e3fc0f.jpg', NULL, '7797669006', NULL, '16 Jan, 2025', 'Male', 'KASHINAGAR', 1, '2025-01-02 11:54:48', '2025-01-02 14:29:48'),
(288, '99149307', 5, 18, NULL, 'TAPAN HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1735799269_123.jpg', NULL, '7810957867', NULL, '08 Jan, 2025', 'Male', 'KASHINAGAR', 1, '2025-01-02 11:57:49', '2025-01-02 11:57:49'),
(289, '99149308', 5, 18, NULL, 'BHOLANATH KARMAKAR', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1736750251_BHOLA.jpeg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742753912_f2593fba-259f-458d-bea7-fd5256013851.jpg', '9733820000', '9733506020', '16 Jan, 2025', 'Male', NULL, 1, '2025-01-13 12:07:31', '2025-03-23 23:48:32'),
(290, '99149376', 5, 15, NULL, 'RAHIMAN BIBI PAIK', 1, 'JAKIR HOSSEN', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738220844_RB.jpeg', NULL, '8371849395', NULL, '07 Aug, 1980', 'Female', 'KALIKA PUR', 1, '2025-01-30 12:37:24', '2025-01-30 12:37:24'),
(291, '99149375', 5, 15, NULL, 'MINA KHATUN BIBI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738318919_123.jpg', NULL, '8214523698', NULL, '08 Jan, 2025', 'Female', 'KASHINAGAR', 1, '2025-01-31 15:51:59', '2025-01-31 15:51:59'),
(292, '99149377', 5, 15, NULL, 'TAPAS HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738658044_e8edce2a-cac2-4f00-92eb-f046963abf1c.jpg', NULL, '9062789359', NULL, '06 Feb, 2025', 'Female', 'KASHINAGAR', 1, '2025-02-04 12:56:42', '2025-02-04 14:04:04'),
(293, '99149378', 5, 15, NULL, 'CHADEK MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1740405699_325b6284-ce86-42ff-9851-027bc0605adf.jpg', NULL, '8768685095', NULL, '12 Feb, 2025', 'Male', 'KASHINAGAR', 1, '2025-02-04 13:01:58', '2025-02-24 19:31:39'),
(294, '99149379', 5, 12, NULL, 'ARIFA BIBI MOLLA', 1, 'EMADULLA MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1738926793_1e317024-9fe7-4971-ad6f-9c16094f90e3.jpg', NULL, '8001765911', NULL, '01 Jan, 1991', 'Female', 'NARAYANI MANDIR', 1, '2025-02-07 16:43:13', '2025-02-07 16:43:13'),
(295, '99149316', 5, 15, NULL, 'TAX LAW FARM', 1, 'DILIP HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741622275_images (1).jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1741622030_images.jpg', '9804938884', '9733200300', '08 Mar, 2025', 'Male', 'KASHINAGAR', 1, '2025-03-10 16:00:04', '2025-03-10 21:27:55'),
(296, '99149318', 5, 15, NULL, 'SOUMEN HALDER', 1, 'DURBADAL HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742754345_595f31c0-5161-4908-9ab5-33f56a6d3b6e.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742754345_595f31c0-5161-4908-9ab5-33f56a6d3b6e.jpg', '9064838176', '9060626120', '14 Jun, 1995', 'Male', 'KUMRAPARA (RAIDIGHI )', 1, '2025-03-23 23:55:45', '2025-03-23 23:55:45'),
(297, '99149319', 8, 15, NULL, 'ARCHANA HALDER (GOLD )', 1, 'SADHAN HALDER', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007529_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742916859_tathya mitra logo.jpg', '9518837307', '9733200300', '07 Mar, 2025', 'Female', 'UTTAR JOYKRISHNA PUR', 1, '2025-03-25 21:04:19', '2025-03-26 22:15:29'),
(298, '99149320', 8, 15, NULL, 'HABIBULLA SEKH  (GOLD )', 1, 'ALAUDDIN SEKH', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007605_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742919179_6667777.jpg', '6296794435', '9733200300', '18 Jun, 2023', 'Male', 'KHARI SARASWATI PARA', 1, '2025-03-25 21:42:59', '2025-03-26 22:16:45'),
(299, '99149321', 8, 15, NULL, 'MAHIUDDIN MOLLA (GOLD)', 1, 'MOTALEB MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007629_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1742919389_6667777.jpg', '9733200300', '9872200300', '01 Mar, 2025', 'Male', 'KHARI SAWASWATI PARA', 1, '2025-03-25 21:46:29', '2025-03-26 22:17:09'),
(300, '99149322', 8, 15, NULL, 'MITA DEBNATH (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007806_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007806_123.jpg', '9733200300', '9733200300', '01 Mar, 2025', 'Female', 'UTTAR JAUKRISHNA PUR', 1, '2025-03-26 22:20:06', '2025-03-26 22:20:06'),
(301, '99149323', 8, 15, NULL, 'SOMA MONDAL (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007936_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743007936_images.jpg', '9733200300', '9733200300', '01 Mar, 2025', 'Female', 'BARASHI', 1, '2025-03-26 22:22:16', '2025-03-26 22:22:16'),
(302, '99149324', 8, 15, NULL, 'DIPALI NAIYA (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008033_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008033_images.jpg', '9733200300', '9733200300', '07 Mar, 2025', 'Female', 'GAJMURI', 1, '2025-03-26 22:23:53', '2025-03-26 22:23:53'),
(303, '99149325', 8, 15, NULL, 'SUMITRA GAYEN ( GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008119_images.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008119_images.jpg', '9733823709', '9733200300', '07 Mar, 2025', 'Female', 'ARJUNTALA', 1, '2025-03-26 22:25:19', '2025-03-26 22:25:19'),
(304, '99149326', 8, 15, NULL, 'RAJESH MONDAL (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008193_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008193_123.jpg', '9733200300', '9733200300', '01 Mar, 2025', 'Male', 'KASHINAGAR', 1, '2025-03-26 22:26:33', '2025-03-26 22:26:33'),
(305, '99149327', 8, 15, NULL, 'HABIBULLA SEKH (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008264_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008264_123.jpg', '9733823709', '9733200300', '01 Mar, 2025', 'Male', 'KASHINAGAR', 1, '2025-03-26 22:27:44', '2025-03-26 22:28:31'),
(306, '99149328', 8, 15, NULL, 'PURNIMA PRAMANIK (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008393_images.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743008393_images.jpg', '9733200300', '9733200300', '01 Mar, 2025', 'Female', 'UTTAR KASHINAGAR', 1, '2025-03-26 22:29:53', '2025-03-26 22:29:53'),
(307, '99149329', 8, 15, NULL, 'AMIR UDDIN GAZI (GOLD )', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743070899_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743070899_sahaj logo .jpg', '9883555743', '9883555743', '01 Mar, 2025', 'Male', 'CHANDPASHA', 1, '2025-03-27 15:51:39', '2025-03-27 15:52:04'),
(308, '99149330', 8, 15, NULL, 'HASIBUR RAHAMAN MOLLA (GOLD)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071043_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071043_sahaj logo .jpg', '9733200300', '9733200300', '01 Mar, 2025', 'Male', 'KHARI KALIKAPUR', 1, '2025-03-27 15:54:03', '2025-03-27 15:54:03'),
(309, '99149331', 8, 15, NULL, 'PALASH KAYAL (P/L)', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071169_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071169_sahaj logo .jpg', '9733200300', '9733200300', '01 Mar, 2025', 'Male', 'KHARI', 1, '2025-03-27 15:56:09', '2025-03-27 15:57:55'),
(310, '99149332', 8, 15, NULL, 'POLTU MOLLA ( P/L )', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071241_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071241_sahaj logo .jpg', '9733823709', '9733200300', '01 Mar, 2025', 'Male', 'KOUTALA', 1, '2025-03-27 15:57:21', '2025-03-27 15:57:21'),
(311, '99149333', 9, 15, NULL, 'SAHINA MOLLA (P/L )', 0, 'SABIR MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071855_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743071855_sahaj logo .jpg', '6294521370', '6294521370', '01 Mar, 2025', 'Female', 'KHARI', 1, '2025-03-27 16:07:35', '2025-03-27 16:07:35'),
(312, '99149334', 8, 15, NULL, 'PRITAM JEWELLERS', 1, NULL, 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743168803_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743168803_sahaj logo .jpg', '9064676556', '9733823709', '01 Jan, 2024', 'Male', 'KASHINAGAR', 1, '2025-03-28 19:03:23', '2025-03-28 19:10:04'),
(313, '99149335', 9, 15, NULL, 'GOLOK NASKAR  P/L', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743414037_WhatsApp Image 2024-11-12 at 1.41.29 AM.jpeg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743414037_e40523b9-09af-4d9a-822e-61ad9405d399.jpg', '9785434440', '9785434440', '13 Mar, 2025', 'Male', 'KASHINAGAR', 1, '2025-03-31 15:10:37', '2025-03-31 15:10:37'),
(314, '99149336', 9, 15, NULL, 'SUKUMAR SIKARI P/L', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743414253_123.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743414253_images.jpg', '9933200300', '9832200300', '12 Mar, 2025', 'Male', 'KASHINAGAR', 1, '2025-03-31 15:14:13', '2025-03-31 15:14:13'),
(315, '99149337', 8, 15, NULL, 'SHIBANI BAIDYA (GOLD)', 0, 'SUJAY BAIDYA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743438781_tathya mitra logo.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743438781_tathya mitra logo.jpg', '9732967887', '9732967887', '01 Mar, 2025', 'Female', 'SHINGHER CHAK', 1, '2025-03-31 22:03:01', '2025-03-31 22:03:01'),
(316, '99149338', 10, 15, NULL, 'ABU HOSEN AKHAN ( UPI )', 1, 'AYAJ ALI AKHAN', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743606129_tathya mitra logo.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743606129_tathya mitra logo.jpg', '7980681418', '7980681418', '02 Apr, 2025', 'Male', 'CHANDPASHA AKHAN PARA', 1, '2025-04-02 20:32:09', '2025-04-02 20:33:46'),
(317, '99149317', 5, 15, NULL, 'SUMITRA ADHIKARI', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743663667_images.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743663667_123.jpg', '9922200300', '9933200300', '09 Apr, 2025', 'Male', 'KASHINAGAR', 1, '2025-04-03 12:31:07', '2025-04-03 12:31:07'),
(318, '99149380', 5, 12, NULL, 'MAHADEB HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743674432_images.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1743674432_images.jpg', '9733200300', '9733200300', '03 Apr, 2025', 'Male', 'UTTAR KASHINAGAR', 1, '2025-04-03 15:30:32', '2025-04-03 15:30:32'),
(319, '99149339', 11, 21, NULL, 'DIPANKAR CHAKRABORTY  (P/L )', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744043068_tathya mitra logo.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744043068_tathya mitra logo.jpg', '9733200300', '9733200300', '04 Apr, 2025', 'Male', NULL, 1, '2025-04-07 21:54:28', '2025-04-07 21:54:28'),
(320, '99149340', 11, 21, NULL, 'KHOKAN MONDAL ( P/L )', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744043153_tathya mitra logo.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744043153_tathya mitra logo.jpg', '9733200300', '9733200300', '04 Apr, 2025', 'Male', 'KASHINAGAR', 1, '2025-04-07 21:55:53', '2025-04-07 21:58:28'),
(321, '99149341', 5, 21, NULL, 'PANCHU HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744190749_adb9cac2-8b4e-46ce-80b9-69237bf041ee.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744190749_ed2439d7-4970-4aa2-bc2e-658337d06fe4.jpg', '9093715556', '8617598476', '02 Apr, 2025', 'Male', 'KASHINAGAR', 1, '2025-04-09 14:55:49', '2025-04-09 14:55:49'),
(322, '99149342', 5, 21, NULL, 'SANGITA HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744190837_ed2439d7-4970-4aa2-bc2e-658337d06fe4.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744190837_adb9cac2-8b4e-46ce-80b9-69237bf041ee.jpg', '8617598476', '9093715556', '03 Apr, 2025', 'Female', 'KASHINAGAR', 1, '2025-04-09 14:57:17', '2025-04-09 15:29:30'),
(323, '99149343', 5, 21, NULL, 'ASISH HALDER', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744190936_e8ea01ca-2693-4ffe-af81-e8a5f1378786.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744190936_e8ea01ca-2693-4ffe-af81-e8a5f1378786.jpg', '9804782515', '9804782515', '02 Apr, 2025', 'Male', 'KASHINAGAR', 1, '2025-04-09 14:58:56', '2025-04-09 14:58:56'),
(324, '99149344', 5, 21, NULL, 'HASIBUR RAHAMAN MOLLA', 1, 'ABU HOSEN MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744267319_7e6f1384-eae5-40d5-b742-5a8b58b9bbfe.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744267319_7e6f1384-eae5-40d5-b742-5a8b58b9bbfe.jpg', '7365807435', '8116026606', '01 Jan, 1997', 'Male', 'KALIKAPUR', 1, '2025-04-10 12:11:59', '2025-04-10 12:11:59'),
(325, '99149345', 8, 21, NULL, 'SAHINA MOLLA (GOLD LOAN )', 0, 'SABIR MOLLA', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744795452_images.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744795452_images.jpg', '9679285243', '9733200300', '16 Apr, 2025', 'Female', 'KHARI SRINAGAR', 1, '2025-04-16 14:54:12', '2025-04-16 14:56:08'),
(326, '99149347', 5, 21, NULL, 'ANTARIT MONDAL', 1, 'DIBENDU MONDAL', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744890305_5b2da263-f889-49c0-ab89-05c3f2626356.jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1744890305_8ff61af9-6ade-4466-8aad-c9f0392b3319.jpg', '9732545681', '8509364612', '03 Apr, 2025', 'Male', 'PARINITA MONDAL', 1, '2025-04-17 17:15:05', '2025-04-17 17:15:05'),
(327, '99149348', 8, 21, NULL, 'ABU KALAM MOLLA', 1, 'XXX', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1745072793_sahaj logo .jpg', 'https://kashinagarsbilifepremiumpoint.in/public/files/agents/1745072793_sahaj logo .jpg', '9609169046', '9609169046', '04 Apr, 2025', 'Male', 'KALIKAPUR', 1, '2025-04-19 19:56:33', '2025-04-19 19:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frequancy_policies`
--

CREATE TABLE `frequancy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frequancy_policies`
--

INSERT INTO `frequancy_policies` (`id`, `name`, `title`, `visibility`, `created_at`, `updated_at`) VALUES
(5, 'Yearly', NULL, 1, '2024-07-03 20:05:28', '2024-07-03 20:10:48'),
(8, 'Half- Yearly', NULL, 1, '2024-09-14 20:57:07', '2024-09-14 20:57:07'),
(9, 'Monthly', NULL, 1, '2024-12-20 19:55:49', '2024-12-20 19:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_21_132821_create_customers_table', 2),
(6, '2024_06_21_190109_create_frequancy_policies_table', 2),
(9, '2024_06_22_120037_create_policyterms_table', 2),
(18, '2024_06_22_012601_create_policytypes_table', 3),
(19, '2024_06_22_014051_create_payment_modes_table', 3),
(20, '2024_06_22_161307_create_areas_table', 3),
(21, '2024_06_22_164935_create_agents_table', 3),
(22, '2024_06_24_013004_add_area_id_to_customers_table', 3),
(23, '2024_06_24_013433_add_foreign_key_to_customers_table', 3),
(24, '2024_06_25_093803_add_agent_id_to_customers_table', 3),
(25, '2024_06_26_123152_create_policies_table', 3),
(29, '2024_06_26_144302_create_policy_payment_modes_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `name`, `title`, `visibility`, `created_at`, `updated_at`) VALUES
(2, 'Online', NULL, 1, '2024-07-03 20:26:58', '2024-07-03 20:26:58'),
(3, 'Cheque', NULL, 1, '2024-07-03 20:27:33', '2024-07-03 20:30:15'),
(4, 'Cash', NULL, 1, '2024-07-04 06:47:28', '2024-07-04 06:47:28'),
(6, 'A/C PAY', NULL, 1, '2024-12-08 21:09:48', '2024-12-08 21:09:48'),
(7, 'UPI', NULL, 1, '2024-12-08 21:10:12', '2024-12-08 21:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `policy_no` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `policy_type` varchar(255) DEFAULT NULL,
  `policy_term` varchar(255) DEFAULT NULL,
  `sum_assured` decimal(10,2) DEFAULT NULL,
  `maturity_date` varchar(255) DEFAULT NULL,
  `nominee_name` varchar(255) DEFAULT NULL,
  `nominee_relationship` varchar(255) DEFAULT NULL,
  `nominee_contact_number` varchar(255) DEFAULT NULL,
  `premium_amount` decimal(10,2) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `policy_no`, `customer_id`, `policy_type`, `policy_term`, `sum_assured`, `maturity_date`, `nominee_name`, `nominee_relationship`, `nominee_contact_number`, `premium_amount`, `frequency`, `due_date`, `status`, `created_at`, `updated_at`) VALUES
(4, '1J538173602', 63, 'SARAL SWADHAN PLUS', '10', 100000.00, '25 Jun, 2039', 'Husband', 'HUSBAND', '9339866678', 2000.00, 'Yearly', '22 Jul, 2025', '1', '2024-12-11 16:04:12', '2024-12-20 12:17:58'),
(5, '4A797822504', 109, 'SMART BACHAT PLUS ( 7 -15 )', '7', 200000.00, '06 Dec, 2039', 'wife', 'wife', '7797669006', 30800.00, 'Yearly', '06 Dec, 2025', '1', '2024-12-16 12:28:44', '2024-12-20 12:18:57'),
(6, '2P716273504', 235, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '06 Dec, 2036', 'Husband', 'HUSBAND', '9679838221', 12540.00, 'Yearly', '06 Dec, 2025', '1', '2024-12-16 12:34:42', '2024-12-20 12:19:28'),
(7, '2K455594306', 23, 'SMART PLATINA ASSURE (7  -15 )', '7', 1100000.00, '01 Feb, 2039', 'NILKUMAR HALDER', 'HUSBAND', '7602020577', 104500.00, 'Yearly', '01 Feb, 2025', '1', '2024-12-20 12:22:42', '2024-12-20 12:22:42'),
(8, '2K731336506', 24, 'SMART PLATINA ASSURE (7  -15 )', '7', 1100000.00, '31 Jan, 2039', 'BAPI TANTI', 'FATHER', '9733709413', 104500.00, 'Yearly', '31 Jan, 2025', '1', '2024-12-20 12:25:06', '2024-12-20 12:25:06'),
(9, '2D713259510', 25, 'NEW SMART SAMRIDDHI  ( 6 -12)', '7', 150000.00, '07 Feb, 2038', 'PRADIP GAYEN', 'SON', '7364941485', 14729.00, 'Yearly', '07 Feb, 2025', '1', '2024-12-20 12:28:34', '2024-12-20 12:28:34'),
(10, '2D306602102', 26, 'SMART BACHAT (10-15 )', '10', 100000.00, '07 Feb, 2039', 'SON', 'SON', '7797485921', 5000.00, 'Half- Yearly', '07 Feb, 2025', '1', '2024-12-20 12:31:14', '2024-12-20 12:31:14'),
(11, '2K744880406', 27, 'SMART PLATINA ASSURE (7  -15 )', '7', 1100000.00, '28 Feb, 2039', 'WIFE', 'wife', '9851535633', 104500.00, 'Yearly', '28 Feb, 2025', '1', '2024-12-20 14:29:19', '2024-12-20 14:29:19'),
(12, '2D749588408', 28, 'SMART BACHAT (10-15 )', '10', 100000.00, '20 Feb, 2039', 'HUSBAND', 'HUSBAND', '9123813856', 4910.00, 'Half- Yearly', '20 Feb, 2025', '1', '2024-12-20 14:32:49', '2024-12-20 14:32:49'),
(13, '2D302571106', 29, 'SMART BACHAT (10-15 )', '10', 100000.00, '16 Feb, 2039', 'wife', 'wife', '6295909644', 5040.00, 'Half- Yearly', '16 Feb, 2025', '1', '2024-12-20 14:35:45', '2024-12-20 14:35:45'),
(14, '2P460537304', 30, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 150000.00, '09 Feb, 2036', 'PRITAM HALDER', 'SON', '9064676556', 12540.00, 'Yearly', '09 Feb, 2025', '1', '2024-12-20 14:38:26', '2024-12-20 14:38:26'),
(15, '2D402182302', 31, 'SMART BACHAT (10-15 )', '10', 200000.00, '28 Feb, 2038', 'WIFE', 'wife', '9564108155', 7427.00, 'Half- Yearly', '28 Feb, 2025', '1', '2024-12-20 14:45:53', '2024-12-20 14:45:53'),
(16, 'P-1234XYZ', 249, 'SMART BACHAT PLUS ( 7 -15 )', '7', 200000.00, '23 Dec, 2039', 'PULAK HALDER', 'HUSBAND', '9339026093', 27310.00, 'Yearly', '23 Dec, 2025', '1', '2024-12-23 15:26:09', '2024-12-23 15:26:09'),
(17, '2PMC036728', 118, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '30 Dec, 2036', 'SANTANU NASKAR', 'HUSBAND', '7699969595', 12500.00, 'Yearly', '30 Dec, 2025', '1', '2025-01-31 12:13:44', '2025-01-31 12:13:44'),
(18, '2DYH246041', 32, 'SMART BACHAT (10-15 )', '10', 200000.00, '09 Mar, 2039', 'wife', 'wife', '7602072042', 7500.00, 'Half- Yearly', '09 Mar, 2025', '1', '2025-01-31 12:20:37', '2025-01-31 12:20:37'),
(19, '1J04549483', 33, 'SARAL SWADHAN PLUS', '10', 500000.00, '09 Mar, 2039', 'SOUMEN HALDER', 'HUSBAND', '8420738685', 5000.00, 'Yearly', '09 Mar, 2025', '1', '2025-01-31 12:23:22', '2025-01-31 12:23:22'),
(20, '1J04549195', 34, 'SARAL SWADHAN PLUS', '10', 500000.00, '09 Mar, 2039', 'RUMPA HALDER', 'MOTHER', '9732046561', 5000.00, 'Yearly', '09 Mar, 2025', '1', '2025-01-31 12:25:34', '2025-01-31 12:25:34'),
(21, '1CNG940236', 34, 'SBI LIFE SMART SCHOLAR', '10', 250000.00, '13 Mar, 2039', 'DIPTA PRASAD HALDER', 'FATHER', '9732046561', 15000.00, 'Yearly', '13 Mar, 2025', '1', '2025-01-31 12:28:35', '2025-01-31 12:28:35'),
(22, '1NYH253561', 35, 'SMART MONEY BACK GOLD', '8', 300000.00, '12 Mar, 2039', 'ABIR HALDER', 'SON', '9732046561', 30000.00, 'Yearly', '12 Mar, 2025', '1', '2025-01-31 12:31:25', '2025-01-31 12:31:25'),
(23, '1J04549897', 86, 'SARAL SWADHAN PLUS', '10', 500000.00, '12 Mar, 2039', 'RUMPA HALDER', 'wife', '9732046561', 5000.00, 'Yearly', '12 Mar, 2025', '1', '2025-01-31 12:33:20', '2025-01-31 12:33:20'),
(24, '1J04549842', 37, 'SARAL SWADHAN PLUS', '10', 500000.00, '12 Mar, 2039', 'SUBHRA HALDER', 'wife', '9732468280', 5000.00, 'Yearly', '12 Mar, 2024', '1', '2025-01-31 12:37:55', '2025-01-31 12:37:55'),
(25, '1BYH246640', 38, 'RETIRE SMART PLUS', '12', 150000.00, '09 Mar, 2036', 'SANJOY KAYAL', 'HUSBAND', '8768010520', 6300.00, 'Half- Yearly', '09 Mar, 2025', '1', '2025-01-31 12:42:31', '2025-01-31 12:42:31'),
(26, '2P00248939', 39, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 150000.00, '21 Mar, 2036', 'PALASH KAYAL', 'HUSBAND', '9931910192', 12500.00, 'Yearly', '21 Mar, 2025', '1', '2025-01-31 12:45:11', '2025-01-31 12:45:11'),
(27, '2DYH326556', 40, 'SMART BACHAT (10-15 )', '10', 150000.00, '29 Mar, 2039', 'RAKESH MONDAL', 'HUSBAND', '8509134314', 7500.00, 'Half- Yearly', '29 Mar, 2025', '1', '2025-01-31 12:48:31', '2025-01-31 12:48:31'),
(28, '2P00250101', 41, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 150000.00, '29 Mar, 2036', 'WIFE', 'wife', '9733999510', 12500.00, 'Yearly', '29 Mar, 2025', '1', '2025-01-31 13:12:08', '2025-01-31 13:12:08'),
(29, '1NYH334375', 42, 'SMART MONEY BACK GOLD (8-15 )', '8', 500000.00, '31 Mar, 2039', 'ABU BAKKAR', 'BROTHER', '7980681480', 36500.00, 'Yearly', '31 Mar, 2025', '1', '2025-01-31 16:15:21', '2025-04-10 14:47:06'),
(30, '2DYH331609', 44, 'SMART BACHAT (10-15 )', '10', 150000.00, '30 Mar, 2039', 'TATAI HALDER', 'SON', '9733682360', 7500.00, 'Half- Yearly', '30 Mar, 2025', '1', '2025-01-31 16:17:24', '2025-01-31 16:17:24'),
(31, '1j473858810', 173, 'SARAL SWADHAN PLUS', '10', 500000.00, '08 Mar, 2039', 'RUMPA HALDER', 'wife', '9733200300', 5000.00, 'Yearly', '09 Mar, 2025', '1', '2025-03-05 12:26:25', '2025-03-05 12:26:25'),
(32, '2x717072406', 80, 'SMART PLATINA PLUS', '7', 550000.00, '09 Jul, 2031', 'wife', 'wife', '9732200300', 52250.00, 'Yearly', '09 Jul, 2024', '1', '2025-03-06 14:20:35', '2025-03-06 14:20:35'),
(33, '2P798738208', 237, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '10 Feb, 2037', 'hayatan bibi molla', 'wife', '9732200300', 12540.00, 'Yearly', '10 Feb, 2026', '1', '2025-03-06 14:23:49', '2025-03-06 14:23:49'),
(34, '2P781957002', 21, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '11 Jul, 2036', 'WIFE', 'wife', '9333200300', 12540.00, 'Yearly', '11 Jul, 2025', '1', '2025-03-06 14:33:04', '2025-03-06 14:33:04'),
(35, '1N393420610', 61, 'SMART MONEY BACK GOLD', '8', 350000.00, '16 Jun, 2039', 'SUBHRA KHAN', 'wife', '9333200300', 16800.00, 'Half- Yearly', '16 Dec, 2024', '1', '2025-03-06 14:38:08', '2025-03-06 14:38:08'),
(36, '2D403477104', 60, 'SMART BACHAT (10-15 )', '10', 100000.00, '17 Jun, 2039', 'wife', 'wife', '9733200300', 5000.00, 'Half- Yearly', '17 Dec, 2024', '1', '2025-03-06 14:41:23', '2025-03-06 14:41:23'),
(37, '2P513974304', 108, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '12 Nov, 2036', 'SUNITA NASKAR', 'wife', '9733200300', 12540.00, 'Yearly', '12 Nov, 2024', '1', '2025-03-06 14:47:50', '2025-03-06 14:47:50'),
(38, '2P601835904', 281, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '13 Nov, 2036', 'SOUMILI ROY', 'DOUGHTER', '9733300200', 12540.00, 'Yearly', '13 Nov, 2025', '1', '2025-03-06 14:51:28', '2025-03-06 14:51:28'),
(39, '3W632669702', 158, 'SARAL SWADHAN PLUS', '7', 700000.00, '18 Nov, 2040', 'WIFE', 'wife', '9933200300', 9000.00, 'Yearly', '18 Nov, 2025', '1', '2025-03-07 13:21:29', '2025-03-07 13:21:29'),
(40, '2P738155704', 260, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '22 Oct, 2036', 'WIFE', 'wife', '9733200300', 12500.00, 'Yearly', '22 Oct, 2025', '1', '2025-03-07 13:35:33', '2025-03-07 13:35:33'),
(41, '3M358614202', 252, 'SMART FORTUNE BULLDER', '6', 1000000.00, '30 Jan, 2031', 'KHOKAN PAIK', 'HUSBAND', '9733200300', 100000.00, 'Yearly', '30 Jan, 2026', '1', '2025-03-07 13:40:12', '2025-03-07 13:40:12'),
(42, '2P709232402', 105, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '03 Feb, 2037', 'FATHER', 'SAMIM SEKH', '9733200300', 12540.00, 'Yearly', '03 Feb, 2026', '1', '2025-03-07 13:44:34', '2025-03-07 13:44:34'),
(43, '2P418481806', 290, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '03 Feb, 2037', 'MINA KHATUN', 'DOUGHTER', '9733200300', 12540.00, 'Yearly', '03 Feb, 2026', '1', '2025-03-07 13:48:28', '2025-03-07 13:48:28'),
(44, '2P411275110', 96, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '09 Sep, 2036', 'wife', 'wife', '9733200300', 12540.00, 'Yearly', '09 Sep, 2025', '1', '2025-03-07 13:57:02', '2025-03-07 13:57:02'),
(45, '2D380065906', 125, 'SMART BACHAT (10-15 )', '10', 200000.00, '26 Sep, 2039', 'HUSBAND', 'HUSBAND', '9733200300', 6000.00, 'Half- Yearly', '26 Sep, 2025', '1', '2025-03-07 14:01:16', '2025-03-07 14:01:16'),
(46, '1J536249406', 205, 'SARAL SWADHAN PLUS', '10', 100000.00, '26 Sep, 2039', 'WIFE', 'wife', '9733200300', 2500.00, 'Yearly', '26 Sep, 2025', '1', '2025-03-07 14:14:18', '2025-03-07 14:14:18'),
(47, '1J523960506', 90, 'SARAL SWADHAN PLUS', '10', 150000.00, '16 Aug, 2039', 'WIFE', 'wife', '9933200300', 2500.00, 'Yearly', '16 Aug, 2025', '1', '2025-03-10 14:34:16', '2025-03-10 14:34:16'),
(48, '2D497593404', 91, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '16 Aug, 2036', 'HUSBAND', 'HUSBAND', '9933200300', 12500.00, 'Yearly', '16 Aug, 2025', '1', '2025-03-10 14:38:39', '2025-03-10 14:38:39'),
(49, '2D365054710', 83, 'SMART BACHAT (10-15 )', '10', 100000.00, '17 Jul, 2039', 'wife', 'wife', '9933200300', 12832.00, 'Yearly', '17 Jul, 2025', '1', '2025-03-10 14:43:02', '2025-03-10 14:43:02'),
(50, '1J531128510', 82, 'SARAL SWADHAN PLUS', '10', 100000.00, '17 Jul, 2039', 'WIFE', 'wife', '9933200300', 2000.00, 'Yearly', '17 Jul, 2025', '1', '2025-03-11 13:37:16', '2025-03-11 13:37:16'),
(51, '1J739214610', 85, 'SARAL SWADHAN PLUS', '10', 100000.00, '22 Jul, 2039', 'wife', 'wife', '9933200300', 2000.00, 'Yearly', '22 Jul, 2025', '1', '2025-03-11 13:39:28', '2025-03-11 13:39:28'),
(52, '2P758364610', 240, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '21 Feb, 2037', 'wife', 'wife', '9933200300', 12540.00, 'Yearly', '21 Feb, 2026', '1', '2025-03-11 13:44:22', '2025-03-11 13:44:22'),
(53, '2k437528010', 87, 'SMART PLATINA ASSURE (7  -15 )', '7', 1100000.00, '02 Aug, 2039', 'FATHER', 'FATHER', '9733200300', 104500.00, 'Yearly', '02 Aug, 2025', '1', '2025-03-17 12:47:58', '2025-03-17 12:47:58'),
(54, '1B458979010', 52, 'SMART BACHAT (10-15 )', '10', 100000.00, '22 Apr, 2039', 'WIFE', 'wife', '9933200300', 12940.00, 'Yearly', '22 Apr, 2025', '1', '2025-03-17 12:55:18', '2025-03-17 12:55:18'),
(55, '1J300031908', 59, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '11 Jun, 2039', 'FATHER', 'FATHER', '9933200300', 300.00, 'Yearly', '11 Jun, 2025', '1', '2025-03-17 13:03:24', '2025-03-17 13:03:24'),
(56, '1J301527508', 65, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '26 Jun, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2000.00, 'Yearly', '26 Jun, 2025', '1', '2025-03-17 13:05:31', '2025-03-17 13:05:31'),
(57, '1J347551808', 79, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '07 Apr, 2039', 'WIFE', 'wife', '9933200300', 2000.00, 'Yearly', '07 Apr, 2025', '1', '2025-03-17 13:08:06', '2025-03-17 13:08:06'),
(58, '1J383223602', 66, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '26 Jun, 2039', 'HUSBAND', 'HUSBAND', '9733200300', 2500.00, 'Yearly', '26 Jun, 2025', '1', '2025-03-17 13:10:13', '2025-03-17 13:10:13'),
(59, '1J416553402', 57, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '06 May, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2500.00, 'Yearly', '06 May, 2025', '1', '2025-03-17 13:13:08', '2025-03-17 13:13:08'),
(60, '1J423237710', 51, 'SARAL SWADHAN PLUS (10-15)', '10', 500000.00, '22 Apr, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 5000.00, 'Yearly', '22 Apr, 2025', '1', '2025-03-17 13:18:01', '2025-03-17 13:18:01'),
(61, '1J427299610', 72, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '01 Jul, 2039', 'wife', 'wife', '9933200300', 2000.00, 'Yearly', '01 Jul, 2025', '1', '2025-03-17 13:20:30', '2025-03-17 13:20:30'),
(62, '1J450629402', 70, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '30 Jun, 2039', 'WIFE', 'wife', '9933200300', 2000.00, 'Yearly', '30 Jun, 2025', '1', '2025-03-17 13:23:25', '2025-03-17 13:23:25'),
(63, '1J528773806', 47, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '08 Apr, 2039', 'WIFE', 'wife', '9933200300', 2500.00, 'Yearly', '08 Apr, 2025', '1', '2025-03-17 13:26:25', '2025-03-17 13:26:25'),
(64, '1J531128510', 82, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '03 Jul, 2039', 'WIFE', 'wife', '9933200300', 2000.00, 'Yearly', '03 Jul, 2025', '1', '2025-03-17 13:29:26', '2025-03-17 13:29:26'),
(65, '1J551045302', 94, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '20 Aug, 2039', 'WIFE', 'wife', '9933200300', 2500.00, 'Yearly', '20 Aug, 2025', '1', '2025-03-17 13:32:15', '2025-03-17 13:32:15'),
(66, '2P715723504', 283, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '01 Mar, 2037', 'WIFE', 'wife', '9933200300', 12540.00, 'Yearly', '01 Mar, 2026', '1', '2025-03-17 13:38:06', '2025-03-17 13:38:06'),
(67, '2P622962110', 118, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '30 Dec, 2037', 'HUSBAND', 'HUSBAND', '9933200300', 12500.00, 'Yearly', '30 Dec, 2025', '1', '2025-03-17 13:52:00', '2025-03-17 13:52:00'),
(69, '2P589118910', 262, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '15 Nov, 2036', 'HUSBAND', 'HUSBAND', '9933200300', 15670.00, 'Yearly', '15 Nov, 2025', '1', '2025-03-17 14:01:40', '2025-03-17 14:01:40'),
(70, '4A797822504', 109, 'SMART BACHAT PLUS ( 7 -15 )', '7', 230000.00, '05 Dec, 2039', 'WIFE', 'wife', '9933200300', 31800.00, 'Yearly', '05 Dec, 2025', '1', '2025-03-17 14:10:28', '2025-03-17 14:10:28'),
(72, '1N615320306', 35, 'SMART MONEY BACK GOLD (8-15 )', '8', 500000.00, '13 Mar, 2039', 'WIFE', 'wife', '9933200300', 29608.00, 'Yearly', '13 Mar, 2025', '1', '2025-03-18 15:22:23', '2025-03-18 15:22:23'),
(76, '2P351906804', 101, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '14 Mar, 2037', 'WIFE', 'wife', '9933200300', 12540.00, 'Yearly', '14 Mar, 2026', '1', '2025-03-18 15:41:37', '2025-03-18 15:41:37'),
(77, '4A374876606', 113, 'SMART BACHAT PLUS ( 7 -15 )', '7', 400000.00, '01 Mar, 2040', 'wife', 'wife', '9933200300', 30580.00, 'Yearly', '01 Mar, 2026', '1', '2025-03-18 15:44:42', '2025-03-18 15:44:42'),
(78, '2P765066908', 116, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '01 Mar, 2040', 'WIFE', 'wife', '9933200300', 12540.00, 'Yearly', '01 Mar, 2026', '1', '2025-03-18 15:46:55', '2025-03-18 15:46:55'),
(80, '1N408757602', 81, 'SMART MONEY BACK GOLD (8-15 )', '8', 300000.00, '11 Jul, 2039', 'WIFE', 'wife', '9933200300', 35000.00, 'Half- Yearly', '11 Jul, 2025', '1', '2025-03-18 15:54:58', '2025-03-18 15:54:58'),
(81, '2P771418808', 55, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '02 May, 2036', 'WIFE', 'wife', '9933200300', 18540.00, 'Half- Yearly', '02 May, 2025', '1', '2025-03-18 15:58:42', '2025-03-18 15:58:42'),
(82, '1N437445510', 54, 'SMART MONEY BACK GOLD (8-15 )', '8', 300000.00, '02 May, 2039', 'WIFE', 'wife', '9933200300', 36000.00, 'Half- Yearly', '02 May, 2025', '1', '2025-03-18 16:01:26', '2025-03-18 16:01:26'),
(83, '1J663908406', 56, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '28 May, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2500.00, 'Yearly', '28 May, 2025', '1', '2025-03-18 16:03:43', '2025-03-18 16:03:43'),
(84, '1J587287502', 21, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '09 Apr, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2000.00, 'Yearly', '09 Apr, 2025', '1', '2025-03-19 14:14:56', '2025-03-19 14:14:56'),
(85, '2P515927606', 45, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '09 Apr, 2036', 'HUSBAND', 'HUSBAND', '9933200300', 12570.00, 'Yearly', '09 Apr, 2025', '1', '2025-03-19 14:20:38', '2025-03-19 14:20:38'),
(86, '2P455883906', 49, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '16 Apr, 2036', 'WIFE', 'wife', '9933200300', 12540.00, 'Yearly', '16 Apr, 2025', '1', '2025-03-19 14:23:04', '2025-03-19 14:23:04'),
(87, '2D763352308', 50, 'SMART BACHAT (10-15 )', '10', 100000.00, '18 Apr, 2039', 'HUSBAND', 'HUSBAND', '9914200300', 12540.00, 'Yearly', '18 Apr, 2025', '1', '2025-03-19 14:25:32', '2025-03-19 14:25:32'),
(88, '2D743516508', 48, 'SMART BACHAT (10-15 )', '10', 100000.00, '16 Apr, 2039', 'WIFE', 'wife', '9933200300', 12540.00, 'Yearly', '16 Apr, 2025', '1', '2025-03-19 14:29:00', '2025-03-19 14:29:00'),
(89, '2P598827408', 43, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '23 Apr, 2036', 'WIFE', 'wife', '9933200300', 12540.00, 'Yearly', '23 Apr, 2025', '1', '2025-03-19 14:32:06', '2025-03-19 14:32:06'),
(90, '1J704368610', 53, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '23 Apr, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2500.00, 'Yearly', '23 Apr, 2025', '1', '2025-03-19 14:34:21', '2025-03-19 14:34:21'),
(91, '1N543393102', 84, 'SMART MONEY BACK GOLD (8-15 )', '8', 200000.00, '24 Jun, 2039', 'WIFE', 'wife', '9933200300', 16804.00, 'Half- Yearly', '24 Jan, 2025', '1', '2025-03-19 14:37:14', '2025-03-19 14:37:14'),
(92, '1N304735204', 71, 'SMART MONEY BACK GOLD (8-15 )', '8', 300000.00, '12 Jun, 2039', 'WIFE', 'wife', '9933200300', 26450.00, 'Half- Yearly', '12 May, 2025', '1', '2025-03-19 14:52:23', '2025-03-19 14:52:23'),
(93, '2P716273504', 235, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '07 Dec, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 12540.00, 'Yearly', '07 Dec, 2025', '1', '2025-03-19 14:55:05', '2025-03-19 14:55:05'),
(94, '2D714159504', 93, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '20 Aug, 2036', 'HUSBAND', 'HUSBAND', '9933200300', 15540.00, 'Half- Yearly', '20 Aug, 2026', '1', '2025-03-20 13:03:49', '2025-03-20 13:03:49'),
(95, '1J776569102', 92, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '20 Aug, 2039', 'WIFE', 'wife', '9933200300', 2500.00, 'Yearly', '20 Aug, 2025', '1', '2025-03-20 13:12:33', '2025-03-20 13:12:33'),
(96, '2D74297308', 58, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '11 Jun, 2036', 'WIFE', 'wife', '9933200300', 12540.00, 'Half- Yearly', '11 Jun, 2025', '1', '2025-03-20 13:16:16', '2025-03-20 13:16:16'),
(97, '1J589098102', 223, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '19 Jun, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2000.00, 'Yearly', '19 Jun, 2025', '1', '2025-03-20 13:19:54', '2025-03-20 13:19:54'),
(98, '2D685493506', 63, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 100000.00, '25 Jun, 2036', 'HUSBAND', 'HUSBAND', '9933200300', 12540.00, 'Half- Yearly', '25 Jun, 2025', '1', '2025-03-20 13:22:37', '2025-03-20 13:22:37'),
(99, '1J04640020', 66, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '26 Jun, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2500.00, 'Yearly', '26 Jun, 2025', '1', '2025-03-20 13:24:54', '2025-03-20 13:24:54'),
(100, '1J301527508', 65, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '26 Jun, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2000.00, 'Yearly', '26 Jun, 2025', '1', '2025-03-20 13:30:07', '2025-03-20 13:30:07'),
(101, '1B684039310', 67, 'SMART INCOME PROTECT', '10', 100000.00, '25 Jun, 2034', 'WIFE', 'wife', '9933200300', 10138.00, 'Half- Yearly', '25 Jun, 2026', '1', '2025-03-20 14:37:52', '2025-03-20 14:37:52'),
(102, '1J596705408', 69, 'SARAL SWADHAN PLUS (10-15)', '10', 100000.00, '29 Jun, 2039', 'HUSBAND', 'HUSBAND', '9933200300', 2500.00, 'Yearly', '29 Jun, 2025', '1', '2025-03-20 14:41:09', '2025-03-20 14:41:09'),
(103, '2P316473708', 132, 'NEW SMART SAMRIDDHI  ( 6 -12)', '6', 62880.00, '28 Feb, 2037', 'wife', 'wife', '9933200300', 12270.00, 'Yearly', '28 Feb, 2026', '1', '2025-04-16 15:51:22', '2025-04-16 15:51:22'),
(104, '1N528093806', 62, 'SMART MONEY BACK GOLD (8-15 )', '8', 300000.00, '19 Jun, 2040', 'wife', 'wife', '9933200300', 50086.00, 'Yearly', '19 Jun, 2025', '1', '2025-04-16 15:59:30', '2025-04-16 15:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `policys_payments`
--

CREATE TABLE `policys_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `policy_number` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_mode` bigint(20) UNSIGNED NOT NULL,
  `refference_number` varchar(255) DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policys_payments`
--

INSERT INTO `policys_payments` (`id`, `policy_number`, `customer_id`, `amount`, `payment_mode`, `refference_number`, `payment_date`, `remarks`, `created_at`, `updated_at`) VALUES
(49, '2P781957002', 21, 12500.00, 2, NULL, '2024-07-11 00:00:00', 'POLICY ISSU', '2024-09-27 16:20:56', '2025-04-05 20:33:57'),
(50, '0', 82, 2000.00, 3, NULL, '2024-10-31 00:00:00', 'POLICY ISSU', '2024-11-12 11:54:47', '2024-11-12 11:54:47'),
(51, '0', 38, 6400.00, 3, NULL, '2024-03-08 00:00:00', 'JHARNA KAYAL POLICY ISSU', '2024-11-12 12:24:37', '2024-11-12 12:24:37'),
(54, '0', 38, 10140.00, 3, NULL, '2024-06-26 00:00:00', 'SANJOY KAYAL , POLICY ISSU', '2024-11-12 12:30:27', '2024-11-12 12:30:27'),
(55, '0', 38, 2000.00, 3, NULL, '2024-06-26 00:00:00', 'SAMPAD KAYAL , POLICY ISSU', '2024-11-12 12:31:08', '2024-11-12 12:31:08'),
(56, '0', 94, 2500.00, 3, NULL, '2024-08-20 00:00:00', 'POLICY ISSU', '2024-11-12 12:49:26', '2024-11-12 12:49:26'),
(57, '0', 66, 2000.00, 3, NULL, '2024-06-26 00:00:00', 'POLICY ISSU', '2024-11-12 12:51:36', '2024-11-12 12:51:36'),
(58, '0', 58, 5200.00, 3, NULL, '2024-06-11 00:00:00', 'POLICY ISSU', '2024-11-12 12:55:45', '2024-11-12 12:55:45'),
(59, '0', 42, 36050.00, 3, NULL, '2024-03-31 00:00:00', 'POLICY ISSU', '2024-11-12 13:06:51', '2024-11-12 13:06:51'),
(60, '0', 92, 2500.00, 3, NULL, '2024-08-21 00:00:00', 'POLICY ISSU   C/O - ABUKALAM', '2024-11-12 13:10:53', '2024-11-12 13:10:53'),
(61, '0', 84, 16800.00, 3, NULL, '2024-07-19 00:00:00', 'POLICY ISSU', '2024-11-12 13:19:49', '2024-11-12 13:19:49'),
(62, '0', 61, 16840.00, 3, NULL, '2024-06-17 00:00:00', 'POLICY ISSU', '2024-11-12 13:25:03', '2024-11-12 13:25:03'),
(63, '0', 80, 54250.00, 3, NULL, '2024-07-09 00:00:00', 'POLICY ISSU', '2024-11-12 13:43:51', '2024-11-12 13:43:51'),
(64, '0', 60, 5200.00, 3, NULL, '2024-06-17 00:00:00', 'POLICY ISSU', '2024-11-12 13:47:30', '2024-11-12 13:47:30'),
(65, '0', 71, 26450.00, 3, NULL, '2024-06-10 00:00:00', 'POLICY ISSU', '2024-11-12 13:59:28', '2024-11-12 13:59:28'),
(66, '0', 75, 12540.00, 3, NULL, '2024-06-02 00:00:00', 'POLICY ISSU', '2024-11-12 14:11:04', '2024-11-12 14:11:04'),
(67, '0', 62, 51200.00, 3, NULL, '2024-06-18 00:00:00', 'POLICY ISSU', '2024-11-12 16:31:13', '2024-11-12 16:31:13'),
(68, '0', 81, 17220.00, 3, NULL, '2024-07-11 00:00:00', 'policy issu  - sukumar shikari -17220/-', '2024-11-13 13:16:52', '2024-11-13 13:16:52'),
(69, '0', 81, 2000.00, 3, NULL, '2024-06-26 00:00:00', 'bijali shikari - 2000/- policy issu', '2024-11-13 13:17:41', '2024-11-13 13:17:41'),
(70, '0', 63, 5050.00, 3, NULL, '2024-06-25 00:00:00', 'plicy issu -5050/-', '2024-11-13 13:24:11', '2024-11-13 13:24:11'),
(71, '0', 63, 2000.00, 3, NULL, '2024-07-09 00:00:00', 'policy issu -2000/-', '2024-11-13 13:25:39', '2024-11-13 13:25:39'),
(72, '0', 95, 5250.00, 3, NULL, '2024-08-21 00:00:00', 'POLISHI ISSU', '2024-11-13 13:42:41', '2024-11-13 13:42:41'),
(73, '0', 25, 4850.00, 3, NULL, '2024-04-30 00:00:00', 'RENUYAL PAYMENT  4850/-', '2024-11-14 15:14:32', '2024-11-14 15:14:32'),
(74, '0', 48, 12540.00, 3, NULL, '2024-04-15 00:00:00', 'POLICY ISSU', '2024-11-14 15:18:29', '2024-11-14 15:18:29'),
(75, '0', 69, 2500.00, 3, NULL, '2024-06-29 00:00:00', 'POLICY ISSU', '2024-11-14 15:29:50', '2024-11-14 15:29:50'),
(76, '0', 98, 10400.00, 3, NULL, '2024-09-13 00:00:00', 'POLICY PAYMENT', '2024-11-14 15:32:01', '2024-11-14 15:32:01'),
(77, '0', 91, 12500.00, 3, NULL, '2024-08-17 00:00:00', 'POLICY ISSU', '2024-11-14 15:39:09', '2024-11-14 15:39:09'),
(78, '0', 68, 5000.00, 3, NULL, '2024-06-28 00:00:00', 'POLICY ISSU -5000/-', '2024-11-15 11:01:58', '2024-11-15 11:01:58'),
(79, '0', 68, 2000.00, 3, NULL, '2024-06-30 00:00:00', 'NIJAM UDDIN  POLICY ISSU   -  2000/-', '2024-11-15 11:03:07', '2024-11-15 11:03:07'),
(80, '0', 73, 2000.00, 3, NULL, '2024-07-02 00:00:00', 'POLICY ISSU', '2024-11-15 11:05:35', '2024-11-15 11:05:35'),
(81, '0', 43, 12540.00, 3, NULL, '2024-04-22 00:00:00', 'POLICY ISSU -  12540 (YEARLY )', '2024-11-15 11:13:22', '2024-11-15 11:13:22'),
(84, '0', 52, 12940.00, 3, NULL, '2024-04-22 00:00:00', 'POLICY ISSU', '2024-11-15 12:05:08', '2024-11-15 12:05:08'),
(85, '0', 83, 12850.00, 3, NULL, '2024-07-17 00:00:00', 'POLICY ISSU', '2024-11-15 12:12:28', '2024-11-15 12:12:28'),
(86, '0', 88, 12540.00, 3, NULL, '2024-08-06 00:00:00', 'POLICY ISSU', '2024-11-15 12:20:52', '2024-11-15 12:20:52'),
(87, '0', 96, 12500.00, 3, NULL, '2024-09-09 00:00:00', 'POLICY ISSU', '2024-11-15 12:25:59', '2024-11-15 12:25:59'),
(88, '0', 74, 5000.00, 3, NULL, '2024-07-01 00:00:00', 'POLICY ISSU-MARUFA', '2024-11-15 12:35:01', '2024-11-15 12:35:01'),
(89, '0', 74, 2000.00, 3, NULL, '2024-07-01 00:00:00', 'PILICY ISSU -JALAUDDIN', '2024-11-15 12:36:19', '2024-11-15 12:36:19'),
(90, '0', 86, 5100.00, 3, NULL, '2024-07-22 00:00:00', 'POLICY ISSU -SUDIPTA PRAMANIK', '2024-11-15 12:46:26', '2024-11-15 12:46:26'),
(91, '0', 86, 2000.00, 3, NULL, '2024-07-22 00:00:00', 'POLICY ISSU -DEBASIS PRAMANIK', '2024-11-15 12:47:16', '2024-11-15 12:47:16'),
(92, '0', 90, 2500.00, 3, NULL, '2024-08-16 00:00:00', 'POLICY ISSU-', '2024-11-15 12:56:04', '2024-11-15 12:56:04'),
(93, '0', 79, 2000.00, 3, NULL, '2024-07-04 00:00:00', 'POLICY ISSU', '2024-11-15 12:59:36', '2024-11-15 12:59:36'),
(94, '0', 76, 16850.00, 3, NULL, '2024-07-03 00:00:00', 'POLICY ISSU', '2024-11-15 13:04:40', '2024-11-15 13:04:40'),
(95, '0', 59, 3000.00, 3, NULL, '2024-06-11 00:00:00', 'POLICY ISSU', '2024-11-15 13:15:46', '2024-11-15 13:15:46'),
(97, '0', 108, 12540.00, 3, NULL, '2024-11-12 00:00:00', 'POLICY ISSU', '2024-11-15 14:48:53', '2024-11-15 14:48:53'),
(98, '0', 97, 7000.00, 3, NULL, '2024-08-01 00:00:00', '7000  CASH WITHDRAWAL', '2024-11-15 15:16:22', '2024-11-15 15:16:22'),
(99, '0', 89, 12540.00, 3, NULL, '2024-08-15 00:00:00', 'POLICY ISSU', '2024-11-15 15:32:45', '2024-11-15 15:32:45'),
(101, '0', 125, 6000.00, 3, NULL, '2024-09-26 00:00:00', 'POLICY ISSU', '2024-11-18 12:29:32', '2024-11-18 12:29:32'),
(102, '0', 121, 15675.00, 3, NULL, '2024-10-30 00:00:00', 'POLICY ISSU', '2024-11-18 14:40:37', '2024-11-18 14:40:37'),
(103, '0', 93, 7700.00, 3, NULL, '2024-08-20 00:00:00', 'POLICY ISSU', '2024-11-18 14:45:04', '2024-11-18 14:45:04'),
(104, '0', 260, 12540.00, 3, NULL, '2024-10-21 00:00:00', 'policy issu', '2024-11-19 11:27:53', '2024-11-19 11:27:53'),
(105, '0', 262, 15670.00, 3, NULL, '2024-11-15 00:00:00', 'policy issu', '2024-11-19 11:39:19', '2024-11-19 11:39:19'),
(108, '0', 44, 7860.00, 2, NULL, '2024-11-22 00:00:00', 'Renewal Payment 7860 /-', '2024-11-22 20:34:05', '2024-11-22 20:34:05'),
(109, '0', 38, 6480.00, 4, NULL, '2024-11-22 00:00:00', 'Renewal Payment  6480/-', '2024-11-22 20:50:30', '2024-11-22 20:50:30'),
(110, '0', 97, 2500.00, 3, NULL, '2024-12-04 00:00:00', 'upi pay - Tathya Mitra kendra  2500/-', '2024-12-04 20:48:13', '2024-12-04 20:48:13'),
(111, '0', 109, 31500.00, 3, NULL, '2024-12-05 00:00:00', 'POLICY ISSU', '2024-12-05 16:09:57', '2024-12-05 16:09:57'),
(112, '0', 235, 12540.00, 2, NULL, '2024-12-06 00:00:00', 'POLICY ISSU', '2024-12-06 19:19:20', '2024-12-06 19:19:20'),
(113, '0', 92, 900.00, 4, NULL, '2024-11-30 00:00:00', 'SAHABUDDIN MOLLA - 99149183 WRONG DEPOSIT 900 /-', '2024-12-06 19:27:58', '2024-12-06 19:27:58'),
(114, '0', 158, 9000.00, 3, NULL, '2024-11-18 00:00:00', 'POLICY ISSU', '2024-12-07 14:47:07', '2024-12-07 14:47:07'),
(115, '0', 158, 10000.00, 4, NULL, '2024-11-30 00:00:00', 'CASH TRANFER TO  ABU HOSEN AKHAN', '2024-12-07 14:48:50', '2024-12-07 14:48:50'),
(117, '0', 126, 200.00, 4, NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE (400-200)', '2024-12-10 15:17:26', '2024-12-10 15:17:26'),
(118, '0', 71, 20000.00, 3, NULL, '2024-12-12 00:00:00', 'RENEWAL PYAMENT', '2024-12-12 15:53:10', '2024-12-12 15:53:10'),
(119, '0', 249, 27310.00, 6, NULL, '2024-12-23 00:00:00', 'POLICY ISSU', '2024-12-23 15:20:03', '2024-12-23 15:20:03'),
(120, '0', 203, 29590.00, 2, NULL, '2024-12-30 00:00:00', 'Sbi Life policy payment 29594.09/-', '2024-12-28 15:31:55', '2024-12-28 15:31:55'),
(121, '0', 118, 12540.00, 2, NULL, '2024-12-30 00:00:00', 'POLICY ISSU 12540/-', '2024-12-30 16:30:15', '2024-12-30 16:30:15'),
(122, '0', 58, 5200.00, 2, NULL, '2024-12-30 00:00:00', 'POLICY RENEWAL PAYMENT 5200/-', '2024-12-30 16:41:29', '2024-12-30 16:41:29'),
(123, '0', 60, 5200.00, 2, NULL, '2024-12-30 00:00:00', 'POLICY RENEWAL PAYMENT -5200/-', '2024-12-30 16:57:56', '2024-12-30 16:57:56'),
(124, '0', 280, 93670.00, 6, NULL, '2024-12-31 00:00:00', 'CUSTOMAR DISBES', '2025-01-09 15:48:14', '2025-01-09 16:01:45'),
(125, '0', 252, 100000.00, 2, NULL, '2025-01-30 00:00:00', 'Policy issue -Fortune Builder', '2025-01-30 19:33:19', '2025-01-30 19:33:19'),
(126, '0', 280, 110390.00, 6, NULL, '2025-01-31 00:00:00', 'Policy Customer payment -110390/-', '2025-02-03 19:15:29', '2025-02-03 19:15:29'),
(127, '0', 61, 16980.00, 2, NULL, '2025-02-05 00:00:00', 'policy Renewal payment = 16978/-', '2025-02-05 09:15:54', '2025-02-05 09:15:54'),
(128, '0', 72, 1000.00, 4, NULL, '2025-02-08 00:00:00', 'wrong entry - Marufa Bibi Molla ID - 99149184 =  1000/-', '2025-02-08 19:22:31', '2025-02-08 19:22:31'),
(129, '0', 132, 12540.00, 2, NULL, '2025-02-10 00:00:00', 'POLICY PAYMENT 12540/-', '2025-02-10 15:20:08', '2025-02-10 15:20:08'),
(130, '0', 237, 12540.00, 2, NULL, '2025-02-10 00:00:00', 'POLICY PAYMENT 12540/-', '2025-02-10 15:21:06', '2025-02-10 15:21:06'),
(131, '0', 105, 12540.00, 2, NULL, '2025-02-02 00:00:00', 'POLICY PAYMENT 12540/-', '2025-02-10 15:23:34', '2025-02-10 15:23:34'),
(132, '0', 67, 3100.00, 6, NULL, '2024-12-31 00:00:00', 'wrong entry  - Jharna Kayal a/c  transfer 3100/-', '2025-02-14 14:28:49', '2025-02-14 14:28:49'),
(133, '0', 255, 15675.00, 4, NULL, '2025-02-25 00:00:00', 'POLICY ISSU -15675/-', '2025-02-25 12:58:11', '2025-02-25 12:58:11'),
(134, '0', 240, 12540.00, 2, NULL, '2025-02-21 00:00:00', 'POLICY ISSU', '2025-02-25 13:00:13', '2025-02-25 13:00:13'),
(136, '0', 26, 4980.00, 4, NULL, '2025-02-28 00:00:00', 'Renewal payment', '2025-02-28 15:09:23', '2025-02-28 15:09:23'),
(137, '0', 28, 4910.00, 2, NULL, '2025-02-28 00:00:00', 'policy renewal', '2025-02-28 15:12:43', '2025-02-28 15:12:43'),
(138, '0', 290, 12540.00, 2, NULL, '2025-02-03 00:00:00', 'policy payment', '2025-02-28 15:31:02', '2025-02-28 15:31:02'),
(139, '0', 276, 12540.00, 2, NULL, '2025-02-28 00:00:00', 'policy payment', '2025-02-28 15:44:20', '2025-02-28 15:44:20'),
(140, '0', 250, 15670.00, 2, NULL, '2025-02-28 00:00:00', 'policy issu', '2025-02-28 15:49:23', '2025-02-28 15:49:23'),
(141, '0', 283, 12540.00, 2, NULL, '2025-03-01 00:00:00', 'POLICY PAYMENT', '2025-03-01 16:41:22', '2025-03-01 16:41:22'),
(142, '0', 280, 102500.00, 2, NULL, '2025-02-28 00:00:00', 'Policy Holder disbuds', '2025-03-04 18:03:58', '2025-03-04 18:03:58'),
(143, '0', 132, 500.00, 7, NULL, '2025-02-25 00:00:00', 'self Help to cash', '2025-03-04 21:01:37', '2025-03-04 21:01:37'),
(144, '0', 75, 1000.00, 7, NULL, '2025-02-25 00:00:00', 'self Help to cash', '2025-03-04 21:02:25', '2025-03-04 21:02:25'),
(145, '0', 293, 3500.00, 7, NULL, '2025-02-25 00:00:00', 'Self Help to Cash', '2025-03-04 21:09:22', '2025-03-04 21:09:22'),
(146, '0', 116, 12540.00, 2, NULL, '2025-03-08 00:00:00', 'Policy Payment 12540/-', '2025-03-08 19:38:39', '2025-03-08 19:38:39'),
(147, '0', 113, 30580.00, 2, NULL, '2025-03-08 00:00:00', 'policy payment', '2025-03-08 19:40:05', '2025-03-08 19:40:05'),
(148, '0', 74, 5070.00, 2, NULL, '2025-03-10 00:00:00', 'Renewal policy payment  5070/-', '2025-03-10 11:24:33', '2025-03-10 11:24:33'),
(149, '0', 295, 5000.00, 6, NULL, '2025-03-10 00:00:00', 'M .CHAKRABORTY BY A/C PAY', '2025-03-10 16:03:41', '2025-03-10 16:03:41'),
(150, '0', 101, 12540.00, 2, NULL, '2025-03-14 00:00:00', 'New Policy Payment 12540/-', '2025-03-14 16:02:17', '2025-03-14 16:02:17'),
(151, '0', 254, 12540.00, 2, NULL, '2025-03-14 00:00:00', 'New policy Payment', '2025-03-14 16:03:13', '2025-03-14 16:48:01'),
(152, '0', 76, 17120.00, 2, NULL, '2025-03-14 00:00:00', 'Policy Renewal payment 17120/-', '2025-03-14 16:45:17', '2025-03-14 16:45:17'),
(153, '0', 93, 7700.00, 2, NULL, '2025-03-20 00:00:00', 'policy Renewal\r\npayment 7700/-', '2025-03-20 17:05:59', '2025-03-20 17:05:59'),
(154, '0', 120, 15670.00, 2, NULL, '2025-03-25 00:00:00', 'POLICY ISSU', '2025-03-25 11:22:54', '2025-03-25 11:22:54'),
(155, '0', 268, 12540.00, 2, NULL, '2025-03-25 00:00:00', 'policy issu', '2025-03-25 12:54:28', '2025-03-25 12:54:28'),
(156, '0', 269, 12540.00, 2, NULL, '2025-03-25 00:00:00', 'policy issu', '2025-03-25 12:55:02', '2025-03-25 12:55:02'),
(157, '0', 38, 10300.00, 2, NULL, '2025-03-25 00:00:00', 'SANJOY KAYAL  RENUWAL PAYMENT  10300/-', '2025-03-25 17:16:14', '2025-03-25 17:16:14'),
(158, '1N408757602', 81, 17490.00, 6, NULL, '2025-03-24 00:00:00', 'POLICY  PAYMENT', '2025-03-25 17:31:13', '2025-03-27 17:25:47'),
(159, '0', 297, 7000.00, 6, NULL, '2023-05-16 00:00:00', 'GOLD', '2025-03-25 21:05:47', '2025-03-25 21:05:47'),
(160, '0', 298, 5500.00, 6, NULL, '2023-06-18 00:00:00', 'GOLD', '2025-03-25 21:44:10', '2025-03-25 21:44:10'),
(161, '0', 311, 9200.00, 6, NULL, '2025-03-27 00:00:00', 'Policy Bond Mortgage loan', '2025-03-27 16:18:54', '2025-03-27 16:18:54'),
(162, '0', 310, 30000.00, 6, NULL, '2021-03-01 00:00:00', 'adv loan 30000/-', '2025-03-27 16:19:34', '2025-03-27 16:19:34'),
(163, '0', 309, 20000.00, 6, NULL, '2024-03-01 00:00:00', 'adv - loan', '2025-03-27 16:20:18', '2025-03-27 16:20:18'),
(164, '0', 299, 25000.00, 6, NULL, '2024-04-06 00:00:00', 'GOLD LOAN', '2025-03-27 16:43:49', '2025-03-27 16:43:49'),
(165, '0', 300, 6000.00, 6, NULL, '2024-09-10 00:00:00', 'GOLD LOAN', '2025-03-27 16:44:40', '2025-03-27 16:44:40'),
(166, '0', 301, 20000.00, 6, NULL, '2024-09-10 00:00:00', 'GOLD LOAN', '2025-03-27 16:45:35', '2025-03-27 16:45:35'),
(167, '0', 302, 10000.00, 6, NULL, '2024-09-28 00:00:00', 'GOLD LOAN', '2025-03-27 16:46:32', '2025-03-27 16:46:32'),
(168, '0', 303, 10000.00, 6, NULL, '2024-10-28 00:00:00', 'P/L LOAN', '2025-03-27 16:47:42', '2025-03-27 16:47:42'),
(169, '0', 304, 6000.00, 6, NULL, '2024-11-04 00:00:00', 'GOLD LOAN', '2025-03-27 16:48:39', '2025-03-27 16:48:39'),
(170, '0', 305, 6000.00, 6, NULL, '2024-12-02 00:00:00', 'GOLD LOAN', '2025-03-27 16:50:31', '2025-03-27 16:50:31'),
(171, '0', 306, 37000.00, 6, NULL, '2025-03-01 00:00:00', 'GOLD LOAN', '2025-03-27 16:51:27', '2025-03-27 16:51:27'),
(172, '0', 307, 13000.00, 6, NULL, '2024-03-12 00:00:00', 'GOLD LOAN', '2025-03-27 16:52:16', '2025-03-27 16:52:16'),
(173, '0', 308, 3000.00, 6, NULL, '2025-03-20 00:00:00', 'GOLD LOAN', '2025-03-27 16:53:12', '2025-03-27 16:53:12'),
(174, '0', 178, 12540.00, 6, NULL, '2025-03-27 00:00:00', 'Policy Issu', '2025-03-27 22:35:39', '2025-03-27 22:35:39'),
(175, '0', 284, 12540.00, 6, NULL, '2025-03-28 00:00:00', 'POLICY ISSU', '2025-03-28 16:18:52', '2025-03-28 16:18:52'),
(176, '0', 236, 15680.00, 6, NULL, '2025-03-28 00:00:00', 'POLICY ISSU', '2025-03-28 16:19:54', '2025-03-28 16:27:57'),
(177, '0', 261, 12540.00, 2, NULL, '2025-03-29 00:00:00', 'policy issu', '2025-03-29 21:05:05', '2025-03-29 21:05:05'),
(178, '0', 127, 12540.00, 2, NULL, '2025-03-29 00:00:00', 'policy issu', '2025-03-29 21:05:51', '2025-03-29 21:05:51'),
(180, '0', 315, 21000.00, 4, NULL, '2025-03-31 00:00:00', 'GOLD', '2025-03-31 22:04:39', '2025-03-31 22:04:39'),
(181, '0', 316, 2500.00, 7, NULL, '2025-04-02 00:00:00', 'UPI PAYMENT', '2025-04-02 20:33:01', '2025-04-02 20:33:01'),
(182, '0', 280, 110060.00, 6, NULL, '2025-03-31 00:00:00', 'ALL POLICY A/C TRANSFER', '2025-04-03 18:20:59', '2025-04-03 18:20:59'),
(183, '0', 41, 12270.00, 2, NULL, '2025-04-05 00:00:00', 'policy renewal payment 12270/-', '2025-04-05 19:30:45', '2025-04-05 19:30:45'),
(184, '0', 311, 1000.00, 7, NULL, '2025-04-06 00:00:00', 'cash credit 1000/-', '2025-04-06 19:23:02', '2025-04-06 19:23:02'),
(185, '0', 320, 6000.00, 7, NULL, '2021-01-01 00:00:00', 'UPI CASH CREDIT', '2025-04-07 21:57:09', '2025-04-07 21:57:09'),
(186, '0', 319, 1500.00, 7, NULL, '2023-01-01 00:00:00', 'UPI CASH CREDIT', '2025-04-07 21:57:59', '2025-04-07 21:57:59'),
(187, '0', 314, 15000.00, 6, NULL, '2025-04-08 00:00:00', 'POLICY BOND', '2025-04-08 15:42:59', '2025-04-08 15:42:59'),
(188, '0', 313, 10000.00, 6, NULL, '2025-04-08 00:00:00', 'POLICY BOND', '2025-04-08 15:43:54', '2025-04-08 15:43:54'),
(189, '0', 228, 12540.00, 6, NULL, '2025-04-08 00:00:00', 'POLICY ISSU', '2025-04-08 20:38:43', '2025-04-08 20:38:43'),
(190, '0', 314, 15000.00, 4, NULL, '2025-04-14 00:00:00', 'POLICY LOAN', '2025-04-14 18:30:40', '2025-04-14 18:30:40'),
(192, '0', 316, 50.00, 7, NULL, '2025-04-15 00:00:00', 'service ch 6200 +17500', '2025-04-15 22:34:16', '2025-04-15 22:34:16'),
(195, '0', 325, 10000.00, 6, NULL, '2025-04-16 00:00:00', 'GOLD LOAN', '2025-04-16 14:55:19', '2025-04-16 14:55:19'),
(196, '2P455883906', 49, 12270.00, 6, NULL, '2025-04-16 00:00:00', 'POLICY PAID', '2025-04-16 15:00:31', '2025-04-16 15:00:31'),
(197, '0', 238, 34500.00, 6, NULL, '2025-04-17 00:00:00', 'POLICY PAYMENT', '2025-04-17 14:55:17', '2025-04-17 14:55:17'),
(199, '0', 327, 7000.00, 6, NULL, '2025-04-19 00:00:00', 'GOLD LOAN', '2025-04-19 19:57:15', '2025-04-19 19:57:15'),
(200, '0', 46, 2000.00, 6, NULL, '2025-04-21 00:00:00', 'POLICY PAYMENT', '2025-04-21 18:27:08', '2025-04-21 18:27:08'),
(201, '0', 53, 2500.00, 6, NULL, '2025-04-23 00:00:00', 'policy renewal', '2025-04-23 10:03:20', '2025-04-23 10:03:20'),
(203, '0', 50, 12100.00, 6, NULL, '2025-04-24 00:00:00', 'cash deposite', '2025-04-24 15:10:47', '2025-04-24 15:10:47'),
(204, '0', 125, 6073.00, 6, NULL, '2025-04-25 00:00:00', 'policy payment', '2025-04-25 17:58:02', '2025-04-25 17:58:02'),
(205, '0', 48, 12250.00, 6, NULL, '2025-04-25 00:00:00', 'policy payment', '2025-04-25 18:21:24', '2025-04-25 18:21:24'),
(206, '0', 178, 150.00, 4, NULL, '2025-04-02 00:00:00', 'new pan card exp', '2025-04-27 18:39:20', '2025-04-27 18:39:20'),
(207, '2D685493506', 63, 5220.00, 6, NULL, '2025-04-27 00:00:00', 'Renewal payment', '2025-04-27 19:30:59', '2025-04-27 19:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `policyterms`
--

CREATE TABLE `policyterms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `premium_amount` decimal(10,2) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policytypes`
--

CREATE TABLE `policytypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policytypes`
--

INSERT INTO `policytypes` (`id`, `name`, `title`, `visibility`, `created_at`, `updated_at`) VALUES
(6, 'SMART LIFETIME SAVER (12-12)', NULL, 1, '2024-09-14 19:51:09', '2025-03-15 16:53:21'),
(7, 'SMART PLATINA ASSURE (7  -15 )', NULL, 1, '2024-09-14 19:51:40', '2024-09-14 19:55:00'),
(8, 'SMART BACHAT (10-15 )', NULL, 1, '2024-09-14 19:52:16', '2024-09-14 19:54:37'),
(9, 'NEW SMART SAMRIDDHI  ( 6 -12)', NULL, 1, '2024-09-14 19:54:17', '2024-09-14 19:54:17'),
(10, 'SARAL SWADHAN PLUS (10-15)', NULL, 1, '2024-09-14 20:39:44', '2025-03-15 16:54:21'),
(11, 'SMART PLATINA PLUS (7-15)', NULL, 1, '2024-09-14 20:41:52', '2025-03-15 16:55:04'),
(12, 'SBI LIFE SMART CHAMP', NULL, 1, '2024-09-14 20:42:59', '2025-03-15 16:55:28'),
(13, 'SBI LIFE SMART SCHOLAR (10-15)', NULL, 1, '2024-09-14 20:43:52', '2025-03-15 16:56:00'),
(14, 'RETIRE SMART PLUS', NULL, 1, '2024-09-14 20:44:25', '2024-09-14 20:44:25'),
(16, 'RETIRE SMART', NULL, 1, '2024-09-14 20:45:30', '2024-09-14 20:45:30'),
(18, 'SBI LIFE SMART POWER', NULL, 1, '2024-09-14 20:46:51', '2024-09-14 20:46:51'),
(19, 'SMART PRIVILEGE PLUS (5 -10 )', NULL, 1, '2024-09-14 20:47:40', '2025-03-15 17:02:28'),
(21, 'SMART MONEY BACK GOLD (8-15 )', NULL, 1, '2024-09-14 20:49:02', '2025-03-15 17:00:55'),
(23, 'SMART INCOME PROTECT', NULL, 1, '2024-09-14 20:49:37', '2024-09-14 20:49:37'),
(24, 'SMART BACHAT PLUS ( 7 -15 )', NULL, 1, '2024-12-10 21:23:24', '2024-12-10 21:23:24'),
(25, 'SMART PLATINA SUPREME (10-25 )', NULL, 1, '2024-12-10 21:24:11', '2025-03-15 17:00:24'),
(27, 'SBI LIFE SWADHAN NEO (7-15)', NULL, 1, '2025-03-15 16:57:51', '2025-03-15 16:57:51'),
(28, 'SMART FORTUNE BUILDER (5 - 6 )', NULL, 1, '2025-03-15 16:58:38', '2025-03-15 16:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `policy_payment_modes`
--

CREATE TABLE `policy_payment_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `policy_number` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `refference_number` varchar(255) DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policy_payment_modes`
--

INSERT INTO `policy_payment_modes` (`id`, `policy_number`, `customer_id`, `amount`, `payment_mode`, `refference_number`, `payment_date`, `remarks`, `created_at`, `updated_at`) VALUES
(59, '2P781957002', 21, 1000.00, '4', NULL, '2024-01-26 00:00:00', 'CASH', '2024-09-27 16:15:53', '2025-04-05 20:28:11'),
(60, '2P781957002', 21, 2000.00, '4', NULL, '2024-03-29 00:00:00', 'CASH', '2024-09-27 16:17:35', '2025-04-05 20:28:33'),
(61, '2P781957002', 21, 1000.00, '4', NULL, '2024-04-29 00:00:00', 'CASH', '2024-09-27 16:18:20', '2025-04-05 20:28:46'),
(62, '2P781957002', 21, 1000.00, '4', NULL, '2024-08-08 00:00:00', 'CASH', '2024-09-27 16:18:58', '2025-04-05 20:29:10'),
(63, '2P781957002', 21, 1000.00, '4', NULL, '2024-09-09 00:00:00', 'CASH', '2024-09-27 16:19:25', '2025-04-05 20:29:23'),
(64, '2P781957002', 21, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 11:48:04', '2025-04-05 20:29:37'),
(65, '0', 22, 36700.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 11:52:39', '2024-11-12 11:52:39'),
(66, '1J531128510', 82, 1500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 11:53:46', '2025-04-16 15:37:59'),
(67, '1BYH246640', 38, 24800.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 12:21:30', '2025-04-06 15:40:04'),
(68, '2P316473708', 132, 8500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 12:44:15', '2025-04-16 15:52:13'),
(69, '1J551045302', 94, 1350.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 12:46:26', '2025-04-06 15:40:29'),
(70, '1J383223602', 66, 1230.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 12:51:01', '2025-04-06 15:41:07'),
(72, '2D74297308', 58, 8300.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 12:54:39', '2025-04-06 15:41:22'),
(73, '0', 146, 1200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:01:41', '2024-11-12 13:01:41'),
(74, '1NYH334375', 42, 20550.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:06:02', '2025-04-10 18:11:13'),
(75, '1J776569102', 92, 1300.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:08:55', '2025-04-10 18:17:38'),
(76, '3W632669702', 158, 20150.00, '3', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:15:54', '2025-04-10 18:19:23'),
(77, '1N543393102', 84, 14600.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:17:58', '2025-04-10 18:21:46'),
(78, '1N393420610', 61, 23750.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:24:06', '2025-04-10 18:22:28'),
(79, '2x717072406', 80, 26000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:42:45', '2025-04-10 18:25:54'),
(80, '2D403477104', 60, 6930.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:46:38', '2025-04-10 18:27:55'),
(81, '0', 99, 11400.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:50:24', '2024-11-12 13:50:24'),
(82, '0', 124, 450.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:53:03', '2024-11-12 13:53:03'),
(83, '1N304735204', 71, 33300.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 13:56:24', '2025-04-10 18:30:11'),
(84, '0', 102, 1300.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 14:02:09', '2024-11-12 14:02:09'),
(85, '0', 75, 10950.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 14:03:39', '2024-11-12 14:03:39'),
(86, '1N528093806', 62, 64700.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-12 16:28:25', '2025-04-16 16:00:01'),
(87, '1N408757602', 81, 17970.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-13 13:14:32', '2025-04-05 21:29:40'),
(88, '2P709232402', 105, 5130.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-13 13:20:03', '2025-04-16 15:54:32'),
(89, '2D685493506', 63, 5800.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-13 13:23:11', '2025-04-16 15:54:00'),
(90, '0', 162, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-13 13:27:42', '2024-11-13 13:27:42'),
(91, '0', 40, 1200.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-13 13:28:51', '2024-11-13 13:28:51'),
(92, '2P00250101', 41, 6000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-13 13:30:42', '2025-04-10 21:09:43'),
(93, '0', 95, 3500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-13 13:40:03', '2024-11-13 13:40:03'),
(94, '0', 106, 450.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 14:57:57', '2024-11-14 14:57:57'),
(95, '0', 33, 600.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 14:58:49', '2024-11-14 14:58:49'),
(96, '0', 36, 600.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 14:59:31', '2024-11-14 14:59:31'),
(97, '0', 37, 600.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:00:49', '2024-11-14 15:00:49'),
(98, '0', 174, 600.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:07:24', '2024-11-14 15:07:24'),
(99, '1J423237710', 51, 2400.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:10:30', '2025-04-16 15:07:51'),
(100, '2D713259510', 25, 11150.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:13:33', '2025-04-16 15:17:25'),
(101, '0', 175, 2550.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:15:59', '2024-11-14 15:15:59'),
(102, '0', 48, 12000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:17:28', '2024-11-14 15:17:28'),
(103, '0', 69, 4000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:28:46', '2024-11-14 15:28:46'),
(104, '0', 98, 7000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:30:57', '2024-11-14 15:30:57'),
(105, '0', 91, 8000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-14 15:38:22', '2024-11-14 15:38:22'),
(106, '0', 68, 5000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:01:01', '2024-11-15 11:01:01'),
(107, '0', 73, 2000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:04:55', '2024-11-15 11:04:55'),
(108, '0', 179, 1000.00, '4', NULL, '2024-03-31 00:00:00', 'CASH', '2024-11-15 11:07:12', '2024-11-15 11:07:12'),
(109, '0', 181, 1000.00, '4', NULL, '2024-03-31 00:00:00', 'CASH', '2024-11-15 11:08:45', '2024-11-15 11:08:45'),
(110, '0', 43, 5540.00, '2', NULL, '2024-03-31 00:00:00', 'ONLINE', '2024-11-15 11:11:06', '2024-11-15 11:11:06'),
(111, '0', 43, 1000.00, '4', NULL, '2024-07-31 00:00:00', 'CASH', '2024-11-15 11:11:47', '2024-11-15 11:11:47'),
(112, '0', 185, 2000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:18:32', '2024-11-15 11:18:32'),
(113, '0', 186, 800.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:19:36', '2024-11-15 11:19:36'),
(114, '0', 187, 400.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:20:23', '2024-11-15 11:20:23'),
(115, '0', 188, 400.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:21:30', '2024-11-15 11:21:30'),
(116, '0', 189, 8000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:22:22', '2024-11-15 11:22:22'),
(117, '2P351906804', 101, 5350.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 11:27:13', '2025-04-10 20:53:53'),
(118, '0', 209, 2000.00, '4', NULL, '2024-04-30 00:00:00', 'ONLY S/B', '2024-11-15 11:28:26', '2024-11-15 11:28:26'),
(119, '0', 210, 2000.00, '4', NULL, '2024-04-30 00:00:00', 'CASH', '2024-11-15 11:29:20', '2024-11-15 11:29:20'),
(120, '0', 211, 2000.00, '4', NULL, '2024-04-30 00:00:00', 'ONLY S/B', '2024-11-15 11:30:07', '2024-11-15 11:30:07'),
(121, '0', 212, 5000.00, '4', NULL, '2024-04-30 00:00:00', 'ONLY S/B', '2024-11-15 11:31:29', '2024-11-15 11:31:29'),
(123, '1B458979010', 52, 12700.00, '4', NULL, '2024-04-30 00:00:00', 'CASH', '2024-11-15 12:02:12', '2025-04-10 20:57:42'),
(124, '1B458979010', 52, 13600.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:06:51', '2025-04-10 20:58:02'),
(125, '0', 83, 9000.00, '4', NULL, '2024-01-01 00:00:00', 'CASH', '2024-11-15 12:11:06', '2024-11-15 12:11:06'),
(126, '0', 103, 870.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:15:50', '2024-11-15 12:15:50'),
(127, '0', 217, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:17:26', '2024-11-15 12:17:26'),
(128, '0', 88, 6000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:19:37', '2024-11-15 12:19:37'),
(129, '2P411275110', 96, 6510.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:24:26', '2025-04-12 13:54:09'),
(130, '0', 74, 7000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:33:24', '2024-11-15 12:33:24'),
(131, '0', 104, 3400.00, '4', NULL, '2024-10-01 00:00:00', 'CASH', '2024-11-15 12:38:56', '2024-11-15 12:38:56'),
(132, '0', 219, 1000.00, '4', NULL, '2024-10-01 00:00:00', 'CASH', '2024-11-15 12:40:26', '2024-11-15 12:40:26'),
(133, '0', 86, 5500.00, '4', NULL, '2024-10-01 00:00:00', 'CASH', '2024-11-15 12:45:19', '2024-11-15 12:45:19'),
(134, '0', 90, 1800.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:54:22', '2024-11-15 12:54:22'),
(135, '0', 79, 1800.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 12:58:15', '2024-11-15 12:58:15'),
(136, '0', 76, 14200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 13:03:03', '2024-11-15 13:03:03'),
(137, '0', 220, 500.00, '4', NULL, '2024-10-31 00:00:00', 'JAYASHREE MIDDYA  CASH', '2024-11-15 13:08:27', '2024-11-15 13:08:27'),
(138, '0', 59, 4500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 13:13:59', '2024-11-15 13:13:59'),
(139, '0', 221, 6000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 13:17:49', '2024-11-15 13:17:49'),
(140, '0', 222, 500.00, '4', NULL, '2024-10-31 00:00:00', 'KAUTALA EX PRADHAN', '2024-11-15 13:18:48', '2024-11-15 13:18:48'),
(141, '0', 223, 700.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 13:21:07', '2024-11-15 13:21:07'),
(142, '0', 224, 3000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 14:14:25', '2024-11-15 14:14:25'),
(143, '0', 108, 6200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 14:47:00', '2024-11-15 14:47:00'),
(144, '0', 97, 10700.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 15:15:02', '2024-11-15 15:15:02'),
(145, '0', 199, 650.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 15:22:33', '2024-11-15 15:22:33'),
(146, '0', 89, 5650.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 15:28:15', '2024-11-15 15:28:15'),
(147, '0', 112, 550.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 15:36:20', '2024-11-15 15:36:20'),
(148, '0', 109, 10700.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-15 15:38:25', '2024-11-15 15:38:25'),
(149, '0', 111, 300.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 11:38:30', '2024-11-18 11:38:30'),
(150, '4A374876606', 113, 9300.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 11:42:12', '2025-04-12 13:47:06'),
(152, '0', 228, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 11:55:42', '2024-11-18 11:55:42'),
(153, '0', 115, 700.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 11:58:28', '2024-11-18 11:58:28'),
(154, '0', 116, 2780.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 12:01:43', '2024-11-18 12:01:43'),
(155, '0', 118, 2550.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 12:05:00', '2024-11-18 12:05:00'),
(156, '0', 125, 6000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 12:07:47', '2024-11-18 12:07:47'),
(157, '0', 126, 300.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 12:09:50', '2024-11-18 12:09:50'),
(158, '0', 119, 960.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-18 12:16:01', '2024-11-18 12:16:01'),
(159, '0', 232, 460.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 12:21:30', '2024-11-18 12:21:30'),
(160, '0', 110, 1970.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 12:36:19', '2024-11-18 12:36:19'),
(161, '0', 227, 500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 12:48:50', '2024-11-18 12:48:50'),
(162, '0', 120, 1500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 12:56:44', '2024-11-18 12:56:44'),
(163, '0', 121, 4300.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:39:03', '2024-11-18 14:39:03'),
(164, '0', 93, 5000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:43:48', '2024-11-18 14:43:48'),
(165, '0', 127, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:46:56', '2024-11-18 14:46:56'),
(166, '0', 235, 2700.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:48:15', '2024-11-18 14:48:15'),
(167, '0', 236, 1800.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:49:59', '2024-11-18 14:49:59'),
(168, '0', 237, 1790.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:51:50', '2024-11-18 14:51:50'),
(169, '0', 238, 5500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:53:38', '2025-04-17 15:01:35'),
(170, '2P758364610', 240, 1590.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:55:06', '2025-04-12 13:49:28'),
(171, '0', 241, 1800.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:57:05', '2024-11-18 14:57:05'),
(172, '0', 198, 200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 14:58:20', '2024-11-18 15:01:37'),
(173, '0', 242, 200.00, '4', NULL, '2024-10-31 00:00:00', 'CASG', '2024-11-18 15:01:07', '2024-11-18 15:01:07'),
(174, '0', 197, 400.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:02:25', '2024-11-18 15:02:25'),
(175, '0', 271, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:11:31', '2024-11-18 15:11:31'),
(176, '0', 244, 200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:12:18', '2024-11-18 15:12:18'),
(177, '0', 245, 500.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:12:48', '2024-11-18 15:12:48'),
(178, '0', 243, 200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:13:20', '2024-11-18 15:13:20'),
(179, '0', 247, 200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:14:06', '2024-11-18 15:14:06'),
(180, '0', 246, 200.00, '4', NULL, '2024-10-31 00:00:00', 'CASH', '2024-11-18 15:15:22', '2024-11-18 20:25:44'),
(181, '0', 248, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:13:45', '2024-11-19 11:13:45'),
(182, '0', 249, 1250.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:16:13', '2024-11-19 11:16:13'),
(183, '0', 250, 1100.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:17:52', '2024-11-19 11:17:52'),
(184, '0', 252, 12500.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:19:49', '2024-11-19 11:19:49'),
(185, '0', 251, 100.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:21:04', '2024-11-19 11:21:04'),
(186, '0', 253, 100.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:21:48', '2024-11-19 11:21:48'),
(187, '0', 254, 450.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:22:29', '2025-03-14 16:52:45'),
(188, '0', 255, 15000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:23:08', '2024-11-19 11:23:08'),
(189, '0', 258, 1250.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:25:51', '2024-11-19 11:25:51'),
(190, '0', 260, 10000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:26:34', '2024-11-19 11:26:34'),
(191, '0', 259, 400.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:30:54', '2024-11-19 11:30:54'),
(192, '0', 261, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:33:45', '2024-11-19 11:33:45'),
(193, '0', 262, 1000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:36:25', '2024-11-19 11:36:25'),
(194, '0', 263, 10000.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-19 11:37:29', '2024-11-19 11:37:29'),
(195, '0', 262, 13670.00, '4', NULL, '2024-11-15 00:00:00', 'cash Deposite', '2024-11-19 11:50:09', '2024-11-19 11:50:09'),
(196, '0', 262, 1000.00, '4', NULL, '2024-11-15 00:00:00', 'DWRING COPITITION 1000 CH', '2024-11-19 11:51:43', '2024-11-19 11:51:43'),
(197, '2P00250101', 41, 1000.00, '4', NULL, '2024-11-20 00:00:00', 'cash deposit', '2024-11-20 18:34:59', '2025-04-10 21:10:44'),
(198, '0', 40, 1300.00, '4', NULL, '2024-11-21 00:00:00', 'CASH DEPOSIT', '2024-11-21 17:47:54', '2024-11-21 17:47:54'),
(199, '0', 44, 7500.00, '4', NULL, '2024-10-31 00:00:00', 'cash', '2024-11-22 20:31:00', '2024-12-02 15:33:54'),
(200, '0', 54, 3000.00, '4', NULL, '2024-11-24 00:00:00', 'Cash Deposit ( Self )', '2024-11-24 17:35:47', '2024-11-24 17:35:47'),
(201, '0', 127, 3000.00, '4', NULL, '2024-11-29 00:00:00', 'cash deposite', '2024-11-29 15:17:41', '2024-11-29 15:17:41'),
(202, '0', 91, 1500.00, '4', NULL, '2024-11-29 00:00:00', 'cash deposite', '2024-11-29 15:19:05', '2024-11-29 15:19:05'),
(203, '0', 189, 1000.00, '4', NULL, '2024-11-02 00:00:00', 'CASH DIPOSITE', '2024-12-02 15:39:37', '2024-12-02 15:39:37'),
(204, '0', 265, 1000.00, '4', NULL, '2024-11-04 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:40:44', '2024-12-02 15:40:44'),
(205, '0', 223, 200.00, '4', NULL, '2024-11-04 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:41:48', '2024-12-02 15:41:48'),
(206, '0', 126, 400.00, '4', NULL, '2024-11-04 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:42:33', '2024-12-02 15:42:33'),
(207, '0', 88, 2000.00, '4', NULL, '2024-11-04 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:43:14', '2024-12-02 15:43:14'),
(208, '0', 249, 1250.00, '4', NULL, '2024-11-05 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:44:11', '2024-12-02 15:44:11'),
(209, '0', 263, 1000.00, '4', NULL, '2024-11-05 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:45:49', '2024-12-02 15:45:49'),
(210, '2P00250101', 41, 1000.00, '4', NULL, '2024-11-05 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:46:31', '2025-04-10 21:11:20'),
(211, '0', 267, 500.00, '4', NULL, '2024-11-07 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:47:45', '2024-12-02 15:47:45'),
(212, '0', 227, 3000.00, '4', NULL, '2024-11-08 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:50:15', '2024-12-02 15:50:15'),
(213, '0', 90, 1000.00, '4', NULL, '2024-11-08 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:51:28', '2024-12-02 15:51:28'),
(214, '0', 59, 500.00, '4', NULL, '2024-11-08 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:52:32', '2024-12-02 15:52:32'),
(215, '0', 63, 1000.00, '4', NULL, '2024-11-12 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:53:21', '2024-12-02 15:53:21'),
(216, '0', 93, 1500.00, '4', NULL, '2024-11-12 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:54:05', '2024-12-02 15:54:05'),
(217, '0', 281, 12500.00, '4', NULL, '2024-11-21 00:00:00', 'CASH DEPOSITE', '2024-12-02 15:59:49', '2024-12-02 15:59:49'),
(218, '0', 262, 13670.00, '4', NULL, '2024-11-15 00:00:00', 'CASH DEPOSITE', '2024-12-02 16:01:06', '2024-12-02 16:01:06'),
(219, '0', 198, 200.00, '4', NULL, '2024-11-16 00:00:00', 'CASH DEPOSITE', '2024-12-02 16:02:01', '2024-12-02 16:02:01'),
(220, '0', 33, 200.00, '4', NULL, '2024-11-21 00:00:00', 'OFFICE DEPOSITE', '2024-12-02 16:03:08', '2024-12-02 16:03:08'),
(221, '0', 37, 200.00, '4', NULL, '2024-11-21 00:00:00', 'OFFICE DEPOSITE', '2024-12-02 16:04:26', '2024-12-02 16:04:26'),
(222, '0', 36, 200.00, '4', NULL, '2024-11-22 00:00:00', 'OFFICE DEPOSITE', '2024-12-02 16:05:16', '2024-12-02 16:05:16'),
(223, '0', 273, 1000.00, '4', NULL, '2024-11-22 00:00:00', 'CASH DEPOSITE', '2024-12-02 16:06:29', '2024-12-02 16:06:29'),
(224, '0', 280, 2450.00, '4', NULL, '2024-12-01 00:00:00', 'KUNDU DA', '2024-12-02 16:07:30', '2024-12-02 16:07:30'),
(225, '0', 280, 810.00, '4', NULL, '2024-12-02 00:00:00', 'KUNDU DA', '2024-12-02 16:08:32', '2024-12-02 16:08:32'),
(226, '0', 280, 3200.00, '4', NULL, '2024-12-03 00:00:00', 'kundu da', '2024-12-03 14:54:59', '2024-12-03 14:54:59'),
(227, '1N393420610', 61, 2900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DIPOSIT', '2024-12-04 14:30:37', '2025-04-10 18:22:46'),
(228, '2D403477104', 60, 1250.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:31:38', '2025-04-10 18:28:14'),
(229, '2x717072406', 80, 2000.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:32:58', '2025-04-10 18:26:13'),
(230, '1N543393102', 84, 1100.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:36:48', '2025-04-10 18:22:02'),
(231, '3W632669702', 158, 2300.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:48:54', '2025-04-10 18:19:45'),
(232, '1NYH334375', 42, 2300.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:50:23', '2025-04-10 18:12:15'),
(233, '0', 132, 200.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:51:17', '2024-12-04 14:51:17'),
(234, '1N304735204', 71, 6500.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:52:18', '2025-04-10 18:30:30'),
(235, '0', 62, 800.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:53:17', '2024-12-04 14:53:17'),
(236, '0', 75, 350.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:54:13', '2024-12-04 14:54:13'),
(237, '1N408757602', 81, 2500.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:55:23', '2025-04-05 21:29:10'),
(238, '0', 22, 2500.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:58:09', '2024-12-04 14:58:09'),
(239, '0', 58, 1000.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 14:59:02', '2024-12-04 14:59:02'),
(240, '2D713259510', 25, 800.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:00:17', '2025-04-16 15:17:45'),
(241, '2P351906804', 101, 850.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:01:28', '2025-04-10 20:54:23'),
(242, '1B458979010', 52, 1150.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:02:27', '2025-04-10 20:59:12'),
(243, '0', 104, 1100.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:03:09', '2024-12-04 15:03:09'),
(244, '1J776569102', 92, 900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:05:06', '2025-04-10 18:17:53'),
(245, '0', 105, 870.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:06:11', '2024-12-04 15:06:11'),
(246, '0', 76, 2300.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:07:32', '2024-12-04 15:07:32'),
(247, '0', 89, 1400.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:08:34', '2024-12-04 15:08:34'),
(248, '0', 66, 70.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:09:57', '2024-12-04 15:09:57'),
(249, '0', 108, 2600.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:11:01', '2024-12-04 15:11:01'),
(250, '0', 109, 3000.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:11:58', '2024-12-04 15:11:58'),
(251, '4A374876606', 113, 2800.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:13:11', '2025-04-12 13:47:28'),
(252, '0', 114, 350.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:14:13', '2024-12-04 15:14:13'),
(253, '0', 116, 900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:15:33', '2024-12-04 15:15:33'),
(254, '0', 118, 870.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:20:02', '2024-12-04 15:20:02'),
(255, '0', 119, 480.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:21:01', '2024-12-04 15:21:01'),
(256, '0', 120, 1000.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:22:01', '2024-12-04 15:22:01'),
(257, '0', 121, 2100.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:22:55', '2024-12-04 15:22:55'),
(258, '0', 235, 1400.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:23:36', '2024-12-04 15:23:36'),
(259, '0', 236, 1150.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:24:17', '2024-12-04 15:24:17'),
(260, '0', 237, 900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:25:04', '2024-12-04 15:25:04'),
(261, '2P758364610', 240, 750.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:26:08', '2025-04-12 13:49:41'),
(262, '0', 238, 2700.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:26:48', '2024-12-04 15:26:48'),
(263, '0', 250, 1900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:27:29', '2024-12-04 15:27:29'),
(264, '0', 251, 400.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:28:11', '2024-12-04 15:28:11'),
(265, '0', 252, 14000.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:28:53', '2024-12-04 15:28:53'),
(266, '0', 254, 950.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:29:41', '2024-12-04 15:29:41'),
(267, '0', 264, 5600.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:31:57', '2024-12-04 15:31:57'),
(268, '0', 266, 2500.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:33:35', '2024-12-04 15:33:35'),
(269, '0', 268, 740.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:34:18', '2024-12-04 15:34:18'),
(270, '0', 269, 850.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:35:05', '2024-12-04 15:35:05'),
(271, '0', 270, 30.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:38:09', '2024-12-04 15:38:09'),
(272, '0', 38, 2900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-04 15:38:53', '2024-12-04 15:38:53'),
(273, '0', 256, 800.00, '4', NULL, '2024-12-04 00:00:00', 'CASH DEPOSITE UPI', '2024-12-04 15:42:59', '2024-12-04 15:42:59'),
(274, '0', 43, 3000.00, '4', NULL, '2024-12-04 00:00:00', 'CASH DEPOSITE UPI', '2024-12-04 15:44:11', '2024-12-04 15:44:11'),
(275, '0', 280, 2860.00, '4', NULL, '2024-12-04 00:00:00', 'KUNDU DA', '2024-12-04 15:53:31', '2024-12-04 15:53:31'),
(276, '0', 260, 2500.00, '4', NULL, '2024-12-05 00:00:00', 'CASH DEPOSIT', '2024-12-05 15:51:14', '2024-12-05 15:51:14'),
(277, '0', 280, 2000.00, '4', NULL, '2024-12-05 00:00:00', 'CASH DEPOSITE', '2024-12-06 12:42:58', '2024-12-06 12:42:58'),
(278, '0', 280, 2310.00, '4', NULL, '2024-12-06 00:00:00', 'KUNDU DA', '2024-12-06 15:13:50', '2024-12-06 15:13:50'),
(279, '0', 93, 1200.00, '4', NULL, '2024-12-06 00:00:00', 'CASH DIPOSITE', '2024-12-06 15:43:32', '2024-12-06 15:43:32'),
(280, '0', 96, 900.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSIT', '2024-12-06 19:25:37', '2024-12-06 19:25:37'),
(281, '0', 98, 1000.00, '4', NULL, '2024-12-06 00:00:00', 'CASH DEPOSIT - UPI', '2024-12-06 20:21:46', '2024-12-06 20:21:46'),
(282, '2P00250101', 41, 500.00, '4', NULL, '2024-12-06 00:00:00', 'CASH DEPOSIT', '2024-12-06 20:22:56', '2025-04-10 21:11:51'),
(283, '0', 223, 200.00, '4', NULL, '2024-12-06 00:00:00', 'CASH DEPOSIT', '2024-12-06 20:23:43', '2024-12-06 20:23:43'),
(284, '1NYH334375', 42, 10000.00, '4', NULL, '2024-11-30 00:00:00', 'ABU BAKKAR A/C TO TRANFER', '2024-12-07 14:54:25', '2025-04-10 18:12:59'),
(286, '0', 280, 4610.00, '4', NULL, '2024-12-07 00:00:00', 'CASH DIPOSITE', '2024-12-09 14:32:20', '2024-12-09 14:32:20'),
(287, '0', 59, 500.00, '4', NULL, '2024-12-09 00:00:00', 'CASH DEPOSITE', '2024-12-09 14:33:40', '2024-12-09 14:33:40'),
(288, '0', 280, 2160.00, '4', NULL, '2024-12-08 00:00:00', 'KUNDU DA', '2024-12-09 15:44:23', '2024-12-09 15:44:23'),
(289, '0', 280, 4900.00, '4', NULL, '2024-12-09 00:00:00', 'KUNDU DA', '2024-12-09 15:45:11', '2024-12-09 15:45:11'),
(290, '1J423237710', 51, 400.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-10 15:00:37', '2025-04-16 15:08:21'),
(291, '0', 275, 1000.00, '4', NULL, '2024-11-30 00:00:00', 'CASH DEPOSITE', '2024-12-10 15:38:40', '2024-12-10 15:38:40'),
(292, '0', 63, 1000.00, '4', NULL, '2024-12-10 00:00:00', 'CASH DEPOSITE', '2024-12-10 15:40:52', '2024-12-10 15:40:52'),
(293, '0', 280, 2410.00, '4', NULL, '2024-12-10 00:00:00', 'KUNDU DA', '2024-12-10 15:41:34', '2024-12-10 15:41:34'),
(294, '0', 221, 4000.00, '4', NULL, '2024-12-11 00:00:00', 'CASH DEPOSITE', '2024-12-11 14:51:07', '2024-12-11 14:51:07'),
(295, '0', 280, 2420.00, '4', NULL, '2024-12-11 00:00:00', 'KUNDU DA', '2024-12-11 15:10:44', '2024-12-11 15:10:44'),
(296, '0', 249, 1250.00, '4', NULL, '2024-12-12 00:00:00', 'CASH DEPOSITE', '2024-12-12 12:40:30', '2024-12-12 12:40:30'),
(297, '0', 280, 2810.00, '4', NULL, '2024-12-12 00:00:00', 'KUNDU DA', '2024-12-12 15:49:37', '2024-12-12 15:49:37'),
(298, '0', 280, 2160.00, '4', NULL, '2024-12-13 00:00:00', 'KUNDU DA', '2024-12-13 15:32:06', '2024-12-13 15:32:06'),
(299, '0', 280, 2610.00, '4', NULL, '2024-12-14 00:00:00', 'KUNDU DA', '2024-12-16 12:37:30', '2024-12-16 12:37:30'),
(300, '0', 280, 3060.00, '4', NULL, '2024-12-15 00:00:00', 'KUNDU DA', '2024-12-16 15:48:34', '2024-12-16 15:48:34'),
(301, '0', 280, 2080.00, '4', NULL, '2024-12-16 00:00:00', 'KUNDU DA', '2024-12-16 15:49:12', '2024-12-16 15:49:12'),
(302, '0', 280, 2540.00, '4', NULL, '2024-12-17 00:00:00', 'KUNDU DA', '2024-12-17 15:17:00', '2024-12-17 15:17:00'),
(303, '0', 280, 2510.00, '4', NULL, '2024-12-18 00:00:00', 'KUNDU DA', '2024-12-18 15:02:33', '2024-12-18 15:02:33'),
(304, '0', 283, 1000.00, '4', NULL, '2024-12-18 00:00:00', 'CASH', '2024-12-18 15:28:58', '2024-12-18 15:28:58'),
(305, '0', 280, 5040.00, '4', NULL, '2024-12-19 00:00:00', 'KUNDU DA', '2024-12-19 14:51:55', '2024-12-19 14:51:55'),
(306, '0', 280, 2030.00, '4', NULL, '2024-12-20 00:00:00', 'KUNDU DA', '2024-12-20 15:53:00', '2024-12-20 15:53:00'),
(307, 'P-1234XYZ', 249, 15000.00, '7', NULL, '2024-12-23 00:00:00', 'UPI PAYMENT', '2024-12-23 15:18:46', '2025-04-08 14:53:44'),
(308, '0', 280, 5180.00, '4', NULL, '2024-12-21 00:00:00', 'KUNDU DA', '2024-12-23 15:57:00', '2024-12-23 15:57:00'),
(309, '0', 280, 3390.00, '4', NULL, '2024-12-22 00:00:00', 'KUNDU DA', '2024-12-23 15:58:14', '2024-12-23 15:58:14'),
(310, '0', 280, 1540.00, '4', NULL, '2024-12-23 00:00:00', 'KUNDU DA', '2024-12-23 15:59:17', '2024-12-23 15:59:17'),
(311, '1J423237710', 51, 400.00, '4', NULL, '2024-12-26 00:00:00', 'cash deposite', '2024-12-26 12:46:57', '2025-04-16 15:10:47'),
(312, '0', 280, 1860.00, '4', NULL, '2024-12-25 00:00:00', 'KUNDU DA', '2024-12-26 15:42:32', '2024-12-26 15:42:32'),
(313, '0', 280, 1490.00, '4', NULL, '2024-12-26 00:00:00', 'KUNDU DA', '2024-12-26 15:43:17', '2024-12-26 15:43:17'),
(314, '0', 284, 1000.00, '4', NULL, '2024-12-26 00:00:00', 'CASH DEPOSITE', '2024-12-26 15:53:11', '2024-12-26 15:53:11'),
(315, '0', 86, 1600.00, '4', NULL, '2024-12-27 00:00:00', 'CASH DEPOSITE', '2024-12-27 11:59:02', '2024-12-27 11:59:02'),
(316, '0', 88, 2000.00, '4', NULL, '2024-12-27 00:00:00', 'CASH DEPOSITE', '2024-12-27 11:59:56', '2024-12-27 11:59:56'),
(317, '0', 280, 3300.00, '4', NULL, '2024-12-27 00:00:00', 'KUNDU DA', '2024-12-27 16:12:31', '2024-12-27 16:12:31'),
(319, '0', 54, 3000.00, '4', NULL, '2024-12-27 00:00:00', 'CASH', '2024-12-27 19:09:13', '2024-12-27 19:09:13'),
(320, '0', 203, 5000.00, '3', NULL, '2024-12-28 00:00:00', 'Cheque No - 091516  \r\n(Bank of India )', '2024-12-28 15:28:17', '2024-12-28 15:28:17'),
(321, '0', 83, 1000.00, '4', NULL, '2024-12-28 00:00:00', 'CASH DEPOSIT', '2024-12-28 18:09:40', '2024-12-28 18:09:40'),
(322, '1J776569102', 92, 1200.00, '7', NULL, '2024-12-28 00:00:00', 'upi payment -1200/-', '2024-12-28 19:20:34', '2025-04-10 18:18:09'),
(323, '0', 280, 2650.00, '4', NULL, '2024-12-28 00:00:00', 'KUNDU DA', '2025-01-01 12:26:33', '2025-01-09 15:15:05'),
(324, '0', 280, 10130.00, '4', NULL, '2024-12-29 00:00:00', 'KUNDU DA', '2025-01-01 12:29:12', '2025-01-09 15:10:35'),
(325, '0', 280, 2610.00, '4', NULL, '2024-12-30 00:00:00', 'KUNDU DA', '2025-01-01 12:30:08', '2025-01-09 15:17:27'),
(326, '0', 280, 4540.00, '4', NULL, '2024-12-31 00:00:00', 'KUNDU DA', '2025-01-01 12:31:11', '2025-01-09 15:10:50'),
(327, '0', 274, 1000.00, '4', NULL, '2024-12-29 00:00:00', 'CASH ISSU', '2025-01-01 13:54:31', '2025-01-09 15:11:10'),
(328, '0', 68, 1000.00, '4', NULL, '2024-12-28 00:00:00', 'CASH ISSU', '2025-01-01 13:55:32', '2025-01-09 15:11:27'),
(329, '0', 280, 2010.00, '4', NULL, '2024-12-24 00:00:00', 'KUNDU DA', '2025-01-09 15:20:48', '2025-01-09 15:27:51'),
(330, '0', 74, 1500.00, '4', NULL, '2024-12-28 00:00:00', 'CASH RECIVED', '2025-01-09 15:37:21', '2025-01-09 15:37:21'),
(331, '0', 224, 1000.00, '4', NULL, '2024-12-28 00:00:00', 'CASH RECEIVED', '2025-01-09 15:38:39', '2025-01-09 15:58:02'),
(332, '0', 67, 3100.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RICEIVED', '2025-01-10 11:31:07', '2025-01-10 11:31:07'),
(333, '0', 44, 1250.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECIVED', '2025-01-10 11:35:33', '2025-01-10 11:35:33'),
(334, '1N393420610', 61, 2900.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:38:02', '2025-04-10 18:23:12'),
(335, '2D403477104', 60, 1550.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:39:26', '2025-04-10 18:28:30'),
(336, '2x717072406', 80, 1500.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:42:41', '2025-04-10 18:26:35'),
(337, '3W632669702', 158, 1350.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:44:30', '2025-04-10 18:20:04'),
(338, '1NYH334375', 42, 1350.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:47:21', '2025-04-10 18:13:38'),
(339, '1N304735204', 71, 6400.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:49:40', '2025-04-10 18:30:50'),
(340, '0', 62, 900.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:51:51', '2025-01-10 11:51:51'),
(341, '0', 75, 300.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:54:55', '2025-01-10 11:54:55'),
(342, '1N408757602', 81, 2700.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 11:56:58', '2025-04-05 21:30:01'),
(343, '0', 22, 4800.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:01:58', '2025-01-10 12:01:58'),
(344, '0', 58, 1200.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:03:54', '2025-01-10 12:03:54'),
(345, '0', 95, 200.00, '4', NULL, '2024-03-02 00:00:00', 'CASH RECEIVED', '2025-01-10 12:05:09', '2025-01-10 12:05:09'),
(346, '2D713259510', 25, 550.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:07:12', '2025-04-16 15:18:09'),
(347, '2P351906804', 101, 900.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:08:26', '2025-04-10 20:54:44'),
(348, '1B458979010', 52, 750.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:09:19', '2025-04-10 20:59:31'),
(349, '1J776569102', 92, 0.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:10:31', '2025-04-10 18:18:34'),
(350, '0', 105, 870.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:11:24', '2025-01-10 12:11:24'),
(351, '0', 76, 2400.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:14:09', '2025-01-10 12:14:09'),
(352, '0', 89, 1450.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:15:08', '2025-01-10 12:15:08'),
(353, '0', 66, 480.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:17:05', '2025-01-10 12:17:05'),
(354, '0', 108, 1900.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:19:26', '2025-01-10 12:19:26'),
(355, '0', 109, 3100.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:20:11', '2025-01-10 12:20:11'),
(356, '4A374876606', 113, 2600.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:20:58', '2025-04-12 13:47:45'),
(357, '0', 114, 300.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:21:42', '2025-01-10 12:21:42'),
(358, '0', 116, 930.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:52:04', '2025-01-10 12:52:04'),
(359, '0', 118, 630.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:53:08', '2025-01-10 12:53:08'),
(360, '0', 119, 730.00, '4', NULL, '2024-12-31 00:00:00', 'CSH RECEIVED', '2025-01-10 12:53:54', '2025-01-10 12:53:54'),
(361, '0', 120, 1000.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:54:32', '2025-01-10 12:54:32'),
(362, '0', 121, 2400.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:55:28', '2025-01-10 12:55:28'),
(363, '0', 237, 1140.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:56:11', '2025-01-10 12:56:11'),
(364, '0', 235, 2650.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:56:52', '2025-01-10 12:56:52'),
(365, '0', 236, 950.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:57:43', '2025-01-10 12:57:43'),
(366, '2P758364610', 240, 650.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:58:26', '2025-04-12 13:49:55'),
(367, '0', 238, 3000.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 12:59:14', '2025-01-10 12:59:14'),
(368, '0', 94, 0.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:00:05', '2025-01-10 13:05:07'),
(369, '0', 250, 1400.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:00:41', '2025-01-10 13:06:13'),
(370, '0', 251, 650.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:08:49', '2025-01-10 13:08:49'),
(371, '0', 252, 16000.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:09:40', '2025-01-10 13:09:40'),
(372, '0', 254, 1250.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:10:25', '2025-01-10 13:10:25'),
(373, '0', 264, 6000.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:11:16', '2025-01-10 13:11:16'),
(374, '0', 266, 2800.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:12:46', '2025-01-10 13:12:46'),
(375, '0', 268, 930.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:15:13', '2025-01-10 13:15:13'),
(376, '0', 269, 1250.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:16:03', '2025-01-10 13:16:03'),
(377, '0', 282, 550.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:17:06', '2025-01-10 13:17:06'),
(379, '0', 97, 30.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 13:18:42', '2025-01-10 13:18:42'),
(380, '0', 96, 930.00, '4', NULL, '2024-12-31 00:00:00', 'CASH RECEIVED', '2025-01-10 15:06:53', '2025-01-10 15:06:53'),
(381, '2P781957002', 21, 1000.00, '7', NULL, '2024-11-30 00:00:00', 'Policy Recived', '2025-01-10 21:01:30', '2025-04-05 20:30:09'),
(382, '0', 68, 1000.00, '6', NULL, '2024-12-20 00:00:00', 'advisor incentive 31/12/2024 close a/c pay office', '2025-01-10 21:04:14', '2025-01-10 21:04:14'),
(383, '0', 280, 890.00, '4', NULL, '2025-01-01 00:00:00', 'KUNDU DA', '2025-01-13 11:17:13', '2025-01-13 11:17:13'),
(384, '0', 280, 2850.00, '4', NULL, '2025-01-02 00:00:00', 'KUNDU DA', '2025-01-13 11:18:00', '2025-01-13 11:18:00'),
(385, '0', 280, 2760.00, '4', NULL, '2025-01-03 00:00:00', 'KUNDU DA', '2025-01-13 11:18:34', '2025-01-13 11:18:34'),
(386, '0', 280, 2850.00, '4', NULL, '2025-01-04 00:00:00', 'KUNDU DA', '2025-01-13 11:19:29', '2025-01-13 11:19:29'),
(387, '0', 280, 3620.00, '4', NULL, '2025-01-05 00:00:00', 'KUNDU DA', '2025-01-13 11:20:05', '2025-01-13 11:20:05'),
(388, '0', 280, 3220.00, '4', NULL, '2025-01-06 00:00:00', 'KUNDU DA', '2025-01-13 11:20:41', '2025-01-13 11:20:41'),
(389, '0', 280, 3550.00, '4', NULL, '2025-01-07 00:00:00', 'KUNDU DA', '2025-01-13 11:21:20', '2025-01-13 11:21:20'),
(390, '0', 280, 3330.00, '4', NULL, '2025-01-08 00:00:00', 'KUNDU DA', '2025-01-13 11:22:05', '2025-01-13 11:22:05'),
(391, '0', 280, 2760.00, '4', NULL, '2025-01-09 00:00:00', 'KUNDU DA', '2025-01-13 11:23:02', '2025-01-13 11:23:02'),
(392, '0', 280, 3000.00, '4', NULL, '2025-01-10 00:00:00', 'KUNDU DA', '2025-01-13 11:23:34', '2025-01-13 11:23:34'),
(393, '0', 94, 500.00, '4', NULL, '2025-01-01 00:00:00', 'CASH RECEIVED', '2025-01-13 11:26:00', '2025-01-13 11:26:00'),
(394, '0', 223, 200.00, '4', NULL, '2025-01-04 00:00:00', 'CASH RECEIVED', '2025-01-13 11:27:00', '2025-01-13 11:27:00'),
(395, '0', 192, 800.00, '4', NULL, '2025-01-06 00:00:00', 'CASH RECEIVED', '2025-01-13 11:27:59', '2025-01-13 11:27:59'),
(396, '2P781957002', 21, 1000.00, '4', NULL, '2025-01-10 00:00:00', 'CASH RECEIVED', '2025-01-13 11:28:46', '2025-04-05 20:31:07'),
(397, '0', 59, 500.00, '4', NULL, '2025-01-10 00:00:00', 'CASH RECEIVED', '2025-01-13 11:29:18', '2025-01-13 11:29:18'),
(398, '2P00250101', 41, 500.00, '4', NULL, '2025-01-10 00:00:00', 'CASH RECEIVED', '2025-01-13 11:29:53', '2025-04-10 21:12:12'),
(399, '0', 280, 3660.00, '4', NULL, '2025-01-11 00:00:00', 'KUNDU DA', '2025-01-15 14:15:45', '2025-01-15 14:15:45'),
(400, '2P00250101', 41, 400.00, '4', NULL, '2025-01-12 00:00:00', 'CASH RECEIVED', '2025-01-15 14:17:44', '2025-04-10 21:14:08'),
(401, '0', 280, 3710.00, '4', NULL, '2025-01-12 00:00:00', 'KUNDU DA', '2025-01-15 14:18:49', '2025-01-15 14:18:49'),
(402, '0', 93, 1250.00, '4', NULL, '2025-01-13 00:00:00', 'CASH RECEIVED', '2025-01-15 14:20:14', '2025-01-15 14:20:14'),
(403, '0', 280, 2880.00, '4', NULL, '2025-01-13 00:00:00', 'KUNDU DA', '2025-01-15 14:20:52', '2025-01-15 14:20:52'),
(404, '0', 280, 2990.00, '4', NULL, '2025-01-14 00:00:00', 'KUNDU DA', '2025-01-15 14:21:36', '2025-01-15 15:36:16'),
(405, '0', 280, 2860.00, '4', NULL, '2025-01-15 00:00:00', 'KUNDU DA', '2025-01-15 15:34:45', '2025-01-15 15:34:45'),
(406, '0', 263, 1540.00, '4', NULL, '2024-01-16 00:00:00', 'CASH RECEIVED', '2025-01-17 11:50:45', '2025-01-17 11:50:45'),
(407, '0', 63, 1000.00, '4', NULL, '2024-01-16 00:00:00', 'CASH RECEIVED', '2025-01-17 11:51:29', '2025-01-17 11:51:29'),
(408, '0', 280, 2630.00, '4', NULL, '2024-01-16 00:00:00', 'KUNDU DA', '2025-01-17 11:52:19', '2025-01-17 11:52:19'),
(409, '0', 280, 3590.00, '4', NULL, '2024-01-17 00:00:00', 'KUNDU DA', '2025-01-17 16:01:15', '2025-01-21 11:19:01'),
(410, '0', 69, 1500.00, '4', NULL, '2025-01-17 00:00:00', 'CASH RECEIVED', '2025-01-17 16:03:13', '2025-04-24 14:29:37'),
(411, '0', 280, 3400.00, '4', NULL, '2025-01-18 00:00:00', 'KUNDU DA', '2025-01-21 11:19:43', '2025-01-21 11:19:43'),
(412, '0', 280, 3430.00, '4', NULL, '2025-01-19 00:00:00', 'KUNDU DA', '2025-01-21 11:20:20', '2025-01-21 11:20:20'),
(413, '0', 280, 3490.00, '4', NULL, '2025-01-20 00:00:00', 'KUNDU DA', '2025-01-21 11:20:56', '2025-01-21 11:20:56'),
(414, '0', 280, 3110.00, '4', NULL, '2025-01-21 00:00:00', 'KUNDU DA', '2025-01-21 15:43:31', '2025-01-21 15:43:31'),
(415, '0', 280, 2220.00, '4', NULL, '2025-01-22 00:00:00', 'KUNDU DA', '2025-01-22 16:08:03', '2025-01-22 16:08:03'),
(416, '2P00250101', 41, 600.00, '4', NULL, '2025-01-22 00:00:00', 'CASH RECEIVED', '2025-01-22 16:09:10', '2025-04-10 21:12:39'),
(417, '0', 273, 1200.00, '4', NULL, '2025-01-22 00:00:00', 'CASH RECEIVED', '2025-01-22 16:10:03', '2025-01-22 16:10:03'),
(418, '0', 248, 2000.00, '4', NULL, '2025-01-22 00:00:00', 'CASH RECEIVED', '2025-01-22 16:10:57', '2025-01-22 16:10:57'),
(419, '0', 280, 2770.00, '4', NULL, '2025-01-23 00:00:00', 'KUNDU DA', '2025-01-24 16:00:14', '2025-01-24 16:00:14'),
(420, '0', 280, 3440.00, '4', NULL, '2025-01-24 00:00:00', 'KUNDU DA', '2025-01-24 16:00:45', '2025-01-24 16:00:45'),
(421, '0', 280, 2150.00, '4', NULL, '2025-01-25 00:00:00', 'KUNDU DA', '2025-01-25 16:41:02', '2025-01-25 16:41:02'),
(423, '0', 274, 1000.00, '4', NULL, '2025-01-23 00:00:00', 'CASH DEPOSITE', '2025-01-30 11:49:45', '2025-01-30 11:49:45'),
(424, '0', 283, 1000.00, '4', NULL, '2025-01-26 00:00:00', 'CASH DEPOSITE', '2025-01-30 11:50:55', '2025-01-30 11:50:55'),
(425, '1J423237710', 51, 400.00, '4', NULL, '2024-01-27 00:00:00', 'CASH DEPOSITE', '2025-01-30 11:52:08', '2025-04-16 15:11:20'),
(426, '0', 280, 3030.00, '4', NULL, '2025-01-27 00:00:00', 'CASH DEPOSITE', '2025-01-30 11:53:10', '2025-01-30 11:53:10'),
(427, '0', 280, 17800.00, '4', NULL, '2025-01-28 00:00:00', 'KUNDU DA', '2025-01-30 12:15:56', '2025-01-30 12:15:56'),
(428, '0', 280, 2520.00, '4', NULL, '2025-01-29 00:00:00', 'KUNDU DA', '2025-01-30 12:16:42', '2025-01-30 12:16:42'),
(429, '0', 280, 2630.00, '4', NULL, '2025-01-16 00:00:00', 'KUNDU DA', '2025-01-31 15:34:40', '2025-01-31 15:34:40'),
(430, '0', 280, 3590.00, '4', NULL, '2025-01-17 00:00:00', 'KUNDU DA', '2025-01-31 15:35:22', '2025-01-31 15:35:22'),
(431, '0', 280, 3280.00, '4', NULL, '2025-01-26 00:00:00', 'KUNDU DA', '2025-01-31 15:38:02', '2025-01-31 15:38:02'),
(432, '0', 280, 2550.00, '4', NULL, '2025-01-30 00:00:00', 'KUNDU DA', '2025-01-31 15:40:27', '2025-01-31 15:40:27'),
(433, '0', 54, 3000.00, '4', NULL, '2025-01-30 00:00:00', 'CASH RECEIVED', '2025-01-31 15:42:25', '2025-01-31 15:42:25'),
(434, '0', 178, 800.00, '4', NULL, '2025-01-30 00:00:00', 'CASH RECEIVED', '2025-01-31 15:45:11', '2025-01-31 15:45:11'),
(435, '0', 284, 2000.00, '4', NULL, '2025-01-30 00:00:00', 'CASH RECEIVED', '2025-01-31 15:46:39', '2025-01-31 15:46:39'),
(436, '0', 290, 1000.00, '4', NULL, '2025-01-28 00:00:00', 'CASH RECEIVED', '2025-01-31 15:48:20', '2025-01-31 15:48:20'),
(437, '0', 190, 1000.00, '4', NULL, '2025-01-28 00:00:00', 'CASH RECEIVED', '2025-01-31 15:53:04', '2025-01-31 15:53:04'),
(438, '0', 127, 2000.00, '4', NULL, '2025-01-31 00:00:00', 'cash', '2025-01-31 16:54:46', '2025-01-31 16:54:46'),
(439, '0', 280, 1300.00, '4', NULL, '2025-02-01 00:00:00', 'KUNDU DA', '2025-02-03 15:32:37', '2025-02-03 15:32:37'),
(440, '0', 280, 2950.00, '4', NULL, '2025-02-02 00:00:00', 'KUNDU DA', '2025-02-03 15:33:22', '2025-02-03 15:33:22'),
(441, '0', 280, 2330.00, '4', NULL, '2025-02-03 00:00:00', 'KUNDU DA', '2025-02-03 15:34:05', '2025-02-03 15:34:05'),
(442, '0', 280, 6050.00, '4', NULL, '2025-01-31 00:00:00', 'OFFICE KUNDU DA', '2025-02-03 19:12:48', '2025-02-03 19:12:48'),
(443, '0', 38, 3100.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:53:07', '2025-02-04 11:53:07'),
(444, '1N393420610', 61, 3100.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:54:35', '2025-04-10 18:23:43'),
(445, '2x717072406', 80, 1500.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:55:26', '2025-04-10 18:26:52'),
(446, '3W632669702', 158, 1250.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:56:19', '2025-04-10 18:20:34'),
(447, '1NYH334375', 42, 1250.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:57:12', '2025-04-10 18:14:07'),
(448, '0', 132, 1200.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:58:13', '2025-02-04 11:58:13'),
(449, '1N304735204', 71, 4400.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 11:59:03', '2025-04-10 18:31:09'),
(450, '0', 62, 5900.00, '4', NULL, '2025-01-31 00:00:00', 'CASH RECEIVED', '2025-02-04 12:00:58', '2025-02-04 12:00:58'),
(451, '0', 75, 350.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:06:40', '2025-02-04 12:06:40'),
(452, '1N408757602', 81, 3350.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:07:49', '2025-04-05 21:30:23'),
(453, '0', 22, 1000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:08:35', '2025-02-04 12:08:35'),
(454, '0', 58, 900.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:09:29', '2025-02-04 12:09:29'),
(455, '0', 95, 300.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:11:01', '2025-02-04 12:11:01'),
(456, '2D713259510', 25, 650.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:12:33', '2025-04-16 15:18:37'),
(457, '2P351906804', 101, 850.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:14:20', '2025-04-10 20:55:34'),
(458, '1B458979010', 52, 900.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:15:15', '2025-04-10 20:59:53'),
(459, '0', 96, 1390.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:16:25', '2025-02-04 12:16:25'),
(460, '0', 105, 870.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:17:26', '2025-02-04 12:17:26'),
(461, '0', 76, 2800.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:18:35', '2025-02-04 12:18:35'),
(462, '0', 89, 1500.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:19:28', '2025-02-04 12:19:28'),
(463, '0', 66, 150.00, '4', NULL, '2024-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:21:02', '2025-02-04 12:21:02'),
(464, '0', 108, 2000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:22:29', '2025-02-04 12:22:29'),
(465, '0', 109, 6200.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:23:28', '2025-02-04 12:23:28'),
(466, '4A374876606', 113, 2900.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:24:28', '2025-04-12 13:47:56'),
(467, '0', 114, 350.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:25:32', '2025-02-04 12:25:32'),
(468, '2D403477104', 60, 1500.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:26:23', '2025-04-10 18:28:46'),
(469, '0', 116, 930.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:27:52', '2025-02-04 12:27:52'),
(470, '0', 118, 1000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:28:48', '2025-02-04 12:28:48'),
(471, '0', 119, 430.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:30:28', '2025-02-04 12:30:28'),
(472, '0', 120, 1000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:31:34', '2025-02-04 12:31:34'),
(473, '0', 121, 2600.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:32:41', '2025-02-04 12:32:41'),
(474, '0', 237, 1080.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:33:56', '2025-02-04 12:33:56'),
(475, '0', 235, 2800.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:34:50', '2025-02-04 12:34:50'),
(476, '0', 236, 1200.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:35:51', '2025-02-04 12:35:51'),
(477, '0', 240, 700.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:36:42', '2025-02-04 12:36:42'),
(478, '0', 238, 3100.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:37:33', '2025-02-04 12:37:33'),
(479, '0', 250, 1400.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:38:23', '2025-02-04 12:38:23'),
(480, '0', 251, 900.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:39:36', '2025-02-04 12:39:36'),
(481, '0', 252, 15000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:40:30', '2025-02-04 12:40:30'),
(482, '0', 254, 950.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:41:26', '2025-02-04 12:41:26'),
(483, '0', 264, 6000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:42:13', '2025-02-04 12:42:13');
INSERT INTO `policy_payment_modes` (`id`, `policy_number`, `customer_id`, `amount`, `payment_mode`, `refference_number`, `payment_date`, `remarks`, `created_at`, `updated_at`) VALUES
(484, '0', 73, 600.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:43:02', '2025-02-04 12:43:02'),
(486, '0', 269, 1000.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:44:48', '2025-02-04 12:44:48'),
(487, '0', 282, 550.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:45:54', '2025-02-04 12:45:54'),
(488, '0', 276, 3100.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:46:41', '2025-02-04 12:46:41'),
(489, '0', 286, 30.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:47:27', '2025-02-04 12:47:27'),
(490, '0', 196, 90.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:48:14', '2025-02-04 12:48:14'),
(491, '0', 287, 1500.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:50:15', '2025-02-04 12:50:15'),
(492, '2K731336506', 24, 7750.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:51:05', '2025-04-16 15:15:00'),
(493, '0', 289, 1200.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 12:52:15', '2025-02-04 12:52:15'),
(494, '0', 292, 3400.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 13:02:53', '2025-02-04 13:02:53'),
(495, '0', 293, 1600.00, '4', NULL, '2025-01-31 00:00:00', 'CASH DEPOSITE', '2025-02-04 13:03:43', '2025-02-04 13:03:43'),
(497, '0', 280, 1920.00, '4', NULL, '2025-02-04 00:00:00', 'KUNDU DA', '2025-02-04 15:55:27', '2025-02-04 15:55:27'),
(498, '0', 223, 200.00, '4', NULL, '2025-02-04 00:00:00', 'CASH DEPOSITE', '2025-02-04 15:58:13', '2025-02-04 15:58:13'),
(499, '0', 280, 3030.00, '4', NULL, '2025-02-05 00:00:00', 'KUNDU DA', '2025-02-05 15:51:14', '2025-02-05 15:51:14'),
(500, '2D306602102', 26, 5000.00, '4', NULL, '2025-02-06 00:00:00', 'CASH DEPOSITE', '2025-02-06 15:45:46', '2025-04-16 15:21:12'),
(501, '0', 280, 2200.00, '4', NULL, '2025-02-06 00:00:00', 'KUNDU DA', '2025-02-06 15:46:55', '2025-02-06 15:46:55'),
(503, '0', 72, 1000.00, '4', NULL, '2025-02-08 00:00:00', 'cash', '2025-02-08 19:03:09', '2025-02-08 19:03:09'),
(507, '0', 280, 5020.00, '4', NULL, '2025-02-08 00:00:00', 'KUNDU DA', '2025-02-10 15:41:59', '2025-02-10 15:41:59'),
(508, '2P781957002', 21, 1000.00, '4', NULL, '2025-02-08 00:00:00', 'CASH DEPOSITE', '2025-02-10 15:42:57', '2025-04-05 20:27:30'),
(509, '0', 280, 3120.00, '4', NULL, '2025-02-09 00:00:00', 'KUNDU DA', '2025-02-10 15:44:02', '2025-02-10 15:44:02'),
(510, '0', 280, 3690.00, '4', NULL, '2025-02-10 00:00:00', 'KUNDU DA', '2025-02-10 15:45:01', '2025-02-10 15:45:01'),
(511, '0', 74, 1000.00, '4', NULL, '2025-02-10 00:00:00', 'CASH DEPOSITE', '2025-02-10 15:45:59', '2025-02-10 15:45:59'),
(512, '0', 63, 1000.00, '4', NULL, '2025-02-10 00:00:00', 'CASH DEPOSITE', '2025-02-10 15:47:13', '2025-02-10 15:47:13'),
(513, '0', 59, 500.00, '4', NULL, '2025-02-10 00:00:00', 'CASH DEPOSITE', '2025-02-10 15:48:15', '2025-02-10 15:48:15'),
(514, '0', 224, 1000.00, '4', NULL, '2025-02-10 00:00:00', 'CASH DEPOSITE', '2025-02-10 15:48:55', '2025-02-10 15:48:55'),
(515, '0', 68, 1000.00, '4', NULL, '2025-02-10 00:00:00', 'CASH DEPOSITE', '2025-02-10 15:49:36', '2025-02-10 15:49:36'),
(516, '0', 280, 3610.00, '4', NULL, '2025-02-07 00:00:00', 'KUNDU DA', '2025-02-10 15:54:53', '2025-02-10 15:54:53'),
(517, '0', 280, 3500.00, '4', NULL, '2025-02-11 00:00:00', 'KUNDU DA', '2025-02-11 15:32:19', '2025-02-11 15:32:19'),
(518, '0', 280, 2780.00, '4', NULL, '2025-02-12 00:00:00', 'KUNDU DA', '2025-02-12 14:48:20', '2025-02-12 14:48:20'),
(519, '0', 93, 1250.00, '4', NULL, '2025-02-12 00:00:00', 'CASH DEPOSITE', '2025-02-12 14:49:15', '2025-02-12 14:49:15'),
(520, '2D403477104', 60, 320.00, '4', NULL, '2025-02-13 00:00:00', 'office cash Deposit = 320 /-', '2025-02-13 16:30:46', '2025-04-10 18:29:01'),
(521, '0', 58, 100.00, '4', NULL, '2025-02-13 00:00:00', 'office cash Deposit 100/-', '2025-02-13 16:32:56', '2025-02-13 16:32:56'),
(522, '0', 38, 3100.00, '4', NULL, '2024-12-31 00:00:00', 'cash deposit', '2025-02-14 14:30:10', '2025-02-14 14:30:10'),
(523, '0', 161, 100.00, '4', NULL, '2025-02-17 00:00:00', 'cash deposit', '2025-02-17 09:56:50', '2025-02-17 09:56:50'),
(524, '0', 280, 2900.00, '4', NULL, '2025-02-13 00:00:00', 'KUNDU DA', '2025-02-17 11:30:06', '2025-02-17 11:30:06'),
(525, '0', 280, 2820.00, '4', NULL, '2025-02-14 00:00:00', 'KUNDU DA', '2025-02-17 11:30:45', '2025-02-17 11:30:45'),
(526, '0', 280, 3750.00, '4', NULL, '2025-02-15 00:00:00', 'KUNDU DA', '2025-02-17 11:31:14', '2025-02-17 11:31:14'),
(527, '0', 280, 2700.00, '4', NULL, '2025-02-16 00:00:00', 'KUNDU DA', '2025-02-17 15:55:41', '2025-02-17 15:55:41'),
(528, '0', 280, 5050.00, '4', NULL, '2025-02-17 00:00:00', 'KUNDU DA', '2025-02-17 15:56:19', '2025-02-17 15:56:19'),
(529, '0', 88, 2500.00, '4', NULL, '2025-02-17 00:00:00', 'cash deposit', '2025-02-17 19:30:01', '2025-02-17 19:30:01'),
(530, '0', 280, 4320.00, '4', NULL, '2025-02-18 00:00:00', 'KUNDU DA', '2025-02-18 15:31:36', '2025-02-18 15:31:36'),
(532, '0', 280, 2550.00, '4', NULL, '2025-02-20 00:00:00', 'KUNDU DA', '2025-02-20 15:51:24', '2025-02-20 15:51:24'),
(533, '0', 280, 2820.00, '4', NULL, '2025-02-19 00:00:00', 'KUNDU DA', '2025-02-20 15:54:54', '2025-02-20 15:54:54'),
(534, '0', 50, 8000.00, '4', NULL, '2025-02-20 00:00:00', 'cash deposit', '2025-02-20 17:31:43', '2025-02-20 17:31:43'),
(535, '2P00250101', 41, 1000.00, '4', NULL, '2025-02-20 00:00:00', 'cash deposit', '2025-02-20 18:14:01', '2025-04-10 21:13:16'),
(536, '0', 280, 2550.00, '4', NULL, '2025-02-21 00:00:00', 'KUNDU DA', '2025-02-21 15:05:58', '2025-02-21 15:05:58'),
(537, '0', 280, 3600.00, '4', NULL, '2025-02-22 00:00:00', 'KUNDU DA', '2025-02-24 15:38:15', '2025-02-24 15:38:15'),
(538, '0', 280, 3420.00, '4', NULL, '2025-02-23 00:00:00', 'KUNDU DA', '2025-02-24 15:39:00', '2025-02-24 15:39:00'),
(539, '0', 280, 3120.00, '4', NULL, '2025-02-24 00:00:00', 'KUNDU DA', '2025-02-24 15:39:50', '2025-02-24 15:39:50'),
(540, '0', 280, 2570.00, '4', NULL, '2025-02-25 00:00:00', 'KUNDU DA', '2025-02-25 15:25:32', '2025-02-25 15:25:32'),
(541, '0', 54, 3000.00, '4', NULL, '2025-02-25 00:00:00', 'Cash Deposit', '2025-02-25 19:41:22', '2025-02-25 19:41:22'),
(544, '0', 280, 3000.00, '4', NULL, '2025-02-26 00:00:00', 'KUNDU DA', '2025-02-27 15:32:59', '2025-02-27 15:32:59'),
(545, '1J423237710', 51, 400.00, '4', NULL, '2025-02-26 00:00:00', 'CASH DEPOSITE', '2025-02-27 15:33:51', '2025-04-16 15:11:45'),
(546, '2D749588408', 28, 4900.00, '4', NULL, '2025-02-26 00:00:00', 'CASH DEPOSITE', '2025-02-27 15:34:53', '2025-04-16 15:23:58'),
(547, '0', 280, 9760.00, '4', NULL, '2025-02-27 00:00:00', 'CASH DEPOSITE', '2025-02-27 15:35:44', '2025-02-27 15:35:44'),
(548, '0', 178, 2000.00, '4', NULL, '2025-02-28 00:00:00', 'CASH', '2025-02-28 11:04:37', '2025-02-28 11:04:37'),
(550, '0', 290, 10000.00, '4', NULL, '2025-01-28 00:00:00', 'cash deposite', '2025-02-28 15:29:37', '2025-02-28 15:29:37'),
(551, '0', 276, 3000.00, '4', NULL, '2024-12-31 00:00:00', 'cash deposite', '2025-02-28 15:43:08', '2025-02-28 15:43:08'),
(553, '0', 249, 3000.00, '4', NULL, '2025-02-28 00:00:00', 'cash deposit', '2025-02-28 15:59:13', '2025-02-28 15:59:13'),
(554, '0', 283, 8000.00, '4', NULL, '2025-02-28 00:00:00', 'cash deposit', '2025-02-28 20:36:29', '2025-02-28 20:36:29'),
(555, '0', 280, 12120.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-03 12:17:02', '2025-03-03 12:17:02'),
(556, '0', 280, 1670.00, '4', NULL, '2025-03-01 00:00:00', 'KUNDU DA', '2025-03-03 12:17:42', '2025-03-03 12:17:42'),
(557, '0', 38, 2800.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:05:08', '2025-03-04 13:05:08'),
(558, '0', 44, 1250.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:06:39', '2025-03-04 13:06:39'),
(559, '1N393420610', 61, 2200.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:09:02', '2025-04-10 18:24:41'),
(560, '2x717072406', 80, 1500.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:10:16', '2025-04-10 18:27:07'),
(561, '3W632669702', 158, 1050.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:12:24', '2025-04-10 18:20:57'),
(562, '1NYH334375', 42, 1050.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:13:25', '2025-04-10 18:14:31'),
(563, '0', 132, 850.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:14:46', '2025-03-04 13:14:46'),
(564, '1N304735204', 71, 5000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:16:04', '2025-04-10 18:31:37'),
(565, '0', 62, 5600.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:17:45', '2025-03-04 13:17:45'),
(566, '0', 75, 500.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:19:16', '2025-03-04 13:19:16'),
(567, '1N408757602', 81, 2000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:20:28', '2025-04-05 21:30:48'),
(568, '0', 22, 3000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:21:36', '2025-03-04 13:21:36'),
(569, '0', 58, 900.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:22:41', '2025-03-04 13:22:41'),
(570, '0', 95, 200.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:24:03', '2025-03-04 13:24:03'),
(571, '2D713259510', 25, 700.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:25:48', '2025-04-16 15:19:11'),
(572, '2P351906804', 101, 650.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:27:50', '2025-04-10 20:56:02'),
(573, '1B458979010', 52, 1000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:29:11', '2025-04-10 21:00:24'),
(574, '0', 96, 1360.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:31:18', '2025-03-04 13:31:18'),
(575, '0', 105, 810.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:32:21', '2025-03-04 13:32:21'),
(576, '0', 76, 2600.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:33:36', '2025-03-04 13:33:36'),
(577, '0', 89, 1350.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:35:40', '2025-03-04 13:35:40'),
(578, '0', 66, 250.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:37:13', '2025-03-04 13:37:13'),
(579, '0', 108, 2000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:41:03', '2025-03-04 13:41:03'),
(580, '0', 109, 5400.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:41:55', '2025-03-04 13:41:55'),
(581, '4A374876606', 113, 2100.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:42:52', '2025-04-12 13:48:10'),
(582, '0', 114, 500.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:43:34', '2025-03-04 13:43:34'),
(583, '2D403477104', 60, 1000.00, '4', NULL, '2028-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:44:25', '2025-04-10 18:29:16'),
(584, '0', 116, 870.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:49:33', '2025-03-04 13:49:33'),
(585, '0', 118, 1850.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:50:27', '2025-03-04 13:50:27'),
(586, '0', 119, 450.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:51:33', '2025-03-04 13:51:33'),
(587, '0', 120, 1000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:52:50', '2025-03-04 13:52:50'),
(588, '0', 121, 2300.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:53:45', '2025-03-04 13:53:45'),
(589, '0', 237, 1520.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:54:42', '2025-03-04 13:54:42'),
(590, '0', 235, 2800.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:55:40', '2025-03-04 13:55:40'),
(591, '0', 236, 1100.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:56:37', '2025-03-04 13:56:37'),
(592, '0', 240, 900.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:58:00', '2025-03-04 13:58:00'),
(593, '0', 238, 2800.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 13:59:43', '2025-03-04 13:59:43'),
(594, '0', 250, 1150.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:00:30', '2025-03-04 14:00:30'),
(595, '0', 251, 400.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:01:27', '2025-03-04 14:01:27'),
(596, '0', 252, 14000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:02:35', '2025-03-04 14:02:35'),
(597, '0', 254, 950.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:03:29', '2025-03-04 14:03:29'),
(598, '0', 264, 5600.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:04:27', '2025-03-04 14:04:27'),
(599, '0', 268, 840.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:08:27', '2025-03-04 14:08:27'),
(600, '0', 269, 1150.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:09:33', '2025-03-04 14:09:33'),
(601, '0', 282, 400.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:10:42', '2025-03-04 14:10:42'),
(602, '0', 276, 2300.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:11:27', '2025-03-04 14:11:27'),
(603, '0', 292, 1500.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:12:51', '2025-03-04 14:12:51'),
(604, '0', 287, 1350.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:13:40', '2025-03-04 14:13:40'),
(605, '2K731336506', 24, 7000.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:14:29', '2025-04-16 15:16:01'),
(606, '0', 293, 1350.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:15:26', '2025-03-04 14:15:26'),
(607, '0', 289, 1200.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:16:11', '2025-03-04 14:16:11'),
(608, '0', 294, 100.00, '4', NULL, '2025-02-28 00:00:00', 'KUNDU DA', '2025-03-04 14:16:56', '2025-03-04 14:16:56'),
(609, '0', 284, 2000.00, '4', NULL, '2025-02-25 00:00:00', 'CASH DEPOSITE', '2025-03-04 14:45:54', '2025-03-04 14:45:54'),
(610, '0', 280, 2630.00, '4', NULL, '2025-03-02 00:00:00', 'KUNDU DA', '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(611, '0', 280, 3270.00, '4', NULL, '2025-03-03 00:00:00', 'KUNDU DA', '2025-03-04 15:54:04', '2025-03-04 15:54:04'),
(612, '0', 280, 2400.00, '4', NULL, '2025-03-04 00:00:00', 'KUNDU DA', '2025-03-04 15:55:13', '2025-03-04 15:55:13'),
(613, '0', 83, 1000.00, '4', NULL, '2025-03-04 00:00:00', 'CASH DEPOSITE', '2025-03-04 15:56:11', '2025-03-04 15:56:11'),
(614, '0', 192, 200.00, '4', NULL, '2024-01-26 00:00:00', 'Opening  cash deposit', '2025-03-05 11:03:34', '2025-03-05 11:03:34'),
(615, '0', 261, 1000.00, '4', NULL, '2024-12-07 00:00:00', 'CASH DEPOSIT', '2025-03-05 15:12:54', '2025-03-05 15:12:54'),
(616, '0', 261, 1000.00, '6', NULL, '2024-10-02 00:00:00', 'DRAWING COMPITITION', '2025-03-05 15:15:16', '2025-03-05 15:15:16'),
(617, '0', 274, 1000.00, '6', NULL, '2024-10-02 00:00:00', 'DRAWAING COMPITITION', '2025-03-05 15:18:54', '2025-03-05 15:18:54'),
(618, '0', 280, 2870.00, '4', NULL, '2025-03-05 00:00:00', 'KUNDU DA', '2025-03-05 15:55:06', '2025-03-05 15:55:06'),
(619, '0', 280, 3310.00, '4', NULL, '2025-03-06 00:00:00', 'KUNDU DA', '2025-03-06 15:44:56', '2025-03-06 15:44:56'),
(620, '0', 280, 3410.00, '4', NULL, '2025-03-07 00:00:00', 'KUNDU DA', '2025-03-07 15:22:24', '2025-03-07 15:22:24'),
(621, '0', 134, 200.00, '4', NULL, '2024-01-26 00:00:00', 'Opening cash deposit', '2025-03-09 14:22:39', '2025-03-09 14:22:39'),
(622, '0', 135, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:23:13', '2025-03-09 14:23:13'),
(623, '0', 133, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:24:03', '2025-03-09 14:24:03'),
(624, '0', 137, 500.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:24:42', '2025-03-09 14:24:42'),
(625, '0', 136, 500.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:25:45', '2025-03-09 14:25:45'),
(626, '0', 138, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:26:35', '2025-03-09 14:26:35'),
(627, '0', 139, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:27:26', '2025-03-09 14:27:26'),
(628, '0', 140, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:28:12', '2025-03-09 14:28:12'),
(629, '0', 141, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:28:54', '2025-03-09 14:28:54'),
(630, '0', 142, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:29:52', '2025-03-09 14:29:52'),
(631, '0', 143, 500.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:31:03', '2025-03-09 14:31:03'),
(632, '0', 144, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:33:14', '2025-03-09 14:33:14'),
(633, '0', 147, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:35:17', '2025-03-09 14:35:17'),
(634, '0', 148, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:36:03', '2025-03-09 14:36:03'),
(635, '0', 131, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:36:46', '2025-03-09 14:36:46'),
(636, '0', 151, 200.00, '4', NULL, '2025-03-01 00:00:00', 'opening cash deposit', '2025-03-09 14:37:36', '2025-03-09 14:37:36'),
(637, '0', 152, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 14:38:31', '2025-03-09 14:38:31'),
(638, '0', 152, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 15:14:10', '2025-03-09 15:14:10'),
(639, '0', 153, 200.00, '4', NULL, '2024-01-26 00:00:00', 'cash deposit opening', '2025-03-09 15:15:01', '2025-03-09 15:15:01'),
(640, '0', 154, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 15:15:51', '2025-03-09 15:15:51'),
(641, '0', 155, 200.00, '4', NULL, '2024-01-26 00:00:00', 'cash deposit opening', '2025-03-09 15:16:55', '2025-03-09 15:16:55'),
(642, '0', 156, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 15:17:53', '2025-03-09 15:17:53'),
(643, '0', 157, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 15:18:46', '2025-03-09 15:18:46'),
(644, '0', 159, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 15:19:48', '2025-03-09 15:19:48'),
(645, '0', 160, 200.00, '4', NULL, '2024-01-26 00:00:00', 'opening cash deposit', '2025-03-09 15:20:44', '2025-03-09 15:20:44'),
(646, '0', 74, 1500.00, '4', NULL, '2025-03-08 00:00:00', 'CASH DEPOSIT', '2025-03-10 11:12:06', '2025-03-10 11:12:06'),
(647, '0', 68, 1000.00, '4', NULL, '2025-03-08 00:00:00', 'CASH DEPOSIT', '2025-03-10 12:56:48', '2025-03-10 12:56:48'),
(648, '2P781957002', 21, 1000.00, '4', NULL, '2025-03-08 00:00:00', 'CASH DEPOSIT', '2025-03-10 12:57:32', '2025-04-05 20:26:53'),
(649, '0', 295, 5000.00, '7', NULL, '2025-03-09 00:00:00', 'SUKUMAR MONDAL (  FOR IT FILE    5000 /-', '2025-03-10 16:02:02', '2025-03-10 16:02:02'),
(651, '0', 145, 200.00, '4', NULL, '2024-01-26 00:00:00', 'CASH DEPOSITE', '2025-03-11 13:04:34', '2025-03-11 13:04:34'),
(652, '0', 149, 200.00, '4', NULL, '2024-01-26 00:00:00', 'CASH DEPOSITE', '2025-03-11 13:07:04', '2025-03-11 13:07:04'),
(655, '0', 280, 3140.00, '4', NULL, '2025-03-08 00:00:00', 'KUNDU DA', '2025-03-11 14:10:34', '2025-03-11 15:56:00'),
(656, '0', 59, 500.00, '4', NULL, '2025-03-08 00:00:00', 'CASH DEPOSITE', '2025-03-11 14:11:12', '2025-03-11 14:11:12'),
(657, '0', 280, 3170.00, '4', NULL, '2025-03-09 00:00:00', 'KUNDU DA', '2025-03-11 14:11:51', '2025-03-11 14:11:51'),
(658, '0', 280, 3230.00, '4', NULL, '2025-03-10 00:00:00', 'KUNDU DA', '2025-03-11 14:12:28', '2025-03-11 14:12:28'),
(659, '0', 280, 5120.00, '4', NULL, '2025-03-11 00:00:00', 'KUNDU DA', '2025-03-11 15:59:10', '2025-03-11 15:59:58'),
(660, '0', 144, 200.00, '4', NULL, '2024-03-31 00:00:00', 'cash deposit', '2025-03-11 18:54:16', '2025-03-11 18:54:16'),
(661, '0', 128, 330.00, '4', NULL, '2024-09-30 00:00:00', 'cash received', '2025-03-13 12:05:46', '2025-03-13 12:05:46'),
(662, '0', 280, 2870.00, '4', NULL, '2025-03-12 00:00:00', 'kundu da', '2025-03-13 12:36:20', '2025-03-13 12:36:20'),
(663, '0', 98, 2000.00, '4', NULL, '2025-03-13 00:00:00', 'cash received', '2025-03-13 12:50:46', '2025-03-13 12:50:46'),
(664, '0', 280, 2970.00, '4', NULL, '2025-03-13 00:00:00', 'kundu da', '2025-03-13 15:47:18', '2025-03-13 15:47:18'),
(665, '0', 178, 200.00, '4', NULL, '2024-03-31 00:00:00', 'CASH DEPOSIT', '2025-03-15 12:18:22', '2025-03-15 12:18:22'),
(666, '0', 178, 4000.00, '4', NULL, '2025-03-15 00:00:00', 'CASH DEPOSIT', '2025-03-15 12:19:14', '2025-03-15 12:19:14'),
(667, '0', 280, 1580.00, '4', NULL, '2025-03-14 00:00:00', 'KUNDU DA', '2025-03-17 15:54:34', '2025-03-17 15:54:34'),
(668, '0', 280, 2970.00, '4', NULL, '2025-03-15 00:00:00', 'KUNDU DA', '2025-03-17 15:55:59', '2025-03-17 15:55:59'),
(670, '0', 280, 3700.00, '4', NULL, '2025-03-16 00:00:00', 'KUNDU DA', '2025-03-18 14:51:18', '2025-03-18 14:51:18'),
(671, '0', 280, 2900.00, '4', NULL, '2025-03-17 00:00:00', 'KUNDU DA', '2025-03-18 14:52:11', '2025-03-18 14:52:11'),
(672, '0', 280, 3710.00, '4', NULL, '2025-03-18 00:00:00', 'KUNDU DA', '2025-03-20 14:06:30', '2025-03-20 14:06:30'),
(673, '2P00250101', 41, 900.00, '2', NULL, '2025-03-19 00:00:00', 'CASH DEPOSITE', '2025-03-20 14:07:27', '2025-04-10 21:14:34'),
(674, '0', 91, 3000.00, '2', NULL, '2025-03-19 00:00:00', 'CASH DEPOSITE', '2025-03-20 14:08:47', '2025-03-20 14:08:47'),
(675, '0', 280, 4250.00, '4', NULL, '2025-03-19 00:00:00', 'CASH DEPOSITE', '2025-03-20 14:09:53', '2025-03-20 14:09:53'),
(676, '0', 280, 3240.00, '4', NULL, '2025-03-20 00:00:00', 'KUNDU DA', '2025-03-20 14:55:51', '2025-03-20 14:55:51'),
(677, '0', 93, 1300.00, '4', NULL, '2025-03-20 00:00:00', 'CASH DEPOSIT', '2025-03-20 16:46:12', '2025-03-20 16:46:12'),
(678, '1J423237710', 51, 400.00, '4', NULL, '2025-03-20 00:00:00', 'cash deposit', '2025-03-20 17:16:30', '2025-04-16 15:12:07'),
(679, '0', 54, 3000.00, '4', NULL, '2025-03-22 00:00:00', 'cash deposit', '2025-03-22 21:13:17', '2025-03-22 21:13:17'),
(680, '0', 226, 200.00, '4', NULL, '2025-03-26 00:00:00', 'cash', '2025-03-26 17:50:34', '2025-03-26 17:50:34'),
(681, '0', 227, 500.00, '4', NULL, '2025-03-26 00:00:00', 'cash', '2025-03-26 20:58:30', '2025-03-26 20:58:30'),
(682, '0', 303, 7500.00, '6', NULL, '2025-02-20 00:00:00', 'CASH RECIVED', '2025-03-27 16:54:33', '2025-03-27 16:54:33'),
(683, '0', 88, 1000.00, '4', NULL, '2025-03-27 00:00:00', 'cash', '2025-03-27 19:10:23', '2025-03-27 19:10:23'),
(684, '0', 284, 1000.00, '4', NULL, '2024-12-25 00:00:00', '25 DECEMBOR OFFER', '2025-03-28 16:25:49', '2025-03-28 16:25:49'),
(685, '0', 261, 5000.00, '7', NULL, '2025-03-28 00:00:00', 'UPI Pay ( SBI life Premium point )', '2025-03-28 16:47:32', '2025-03-28 16:47:32'),
(686, '0', 312, 60000.00, '3', NULL, '2024-02-01 00:00:00', 'Cheque pay', '2025-03-28 19:05:03', '2025-03-28 19:05:03'),
(687, '0', 312, 45000.00, '3', NULL, '2024-01-03 00:00:00', 'cheque pay', '2025-03-28 19:06:09', '2025-03-28 19:06:09'),
(688, '0', 312, 55000.00, '3', NULL, '2024-01-02 00:00:00', 'Cheque pay', '2025-03-28 19:07:10', '2025-03-28 19:07:10'),
(689, '0', 261, 1000.00, '4', NULL, '2025-01-31 00:00:00', 'cash deposit', '2025-03-29 14:44:12', '2025-03-29 14:44:12'),
(690, '0', 228, 5000.00, '4', NULL, '2025-03-29 00:00:00', 'cash deposit', '2025-03-29 20:04:52', '2025-03-29 20:04:52'),
(691, '0', 127, 2000.00, '4', NULL, '2025-03-25 00:00:00', 'cash deposit', '2025-03-29 21:08:05', '2025-03-29 21:08:05'),
(692, '0', 280, 2690.00, '4', NULL, '2025-03-21 00:00:00', 'KUNDU DA', '2025-03-31 16:02:01', '2025-03-31 16:02:01'),
(693, '0', 280, 2390.00, '4', NULL, '2025-03-22 00:00:00', 'KUNDU DA', '2025-03-31 16:03:29', '2025-03-31 16:03:29'),
(694, '0', 280, 3210.00, '4', NULL, '2025-03-23 00:00:00', 'KUNDU DA', '2025-03-31 16:04:51', '2025-03-31 16:04:51'),
(695, '0', 280, 3170.00, '4', NULL, '2025-03-24 00:00:00', 'KUNDU DA', '2025-03-31 16:07:17', '2025-03-31 16:07:17'),
(696, '0', 280, 7920.00, '4', NULL, '2025-03-25 00:00:00', 'KUNDU DA', '2025-03-31 16:08:03', '2025-03-31 16:08:03'),
(697, '0', 280, 2570.00, '4', NULL, '2025-03-26 00:00:00', 'KUNDU DA', '2025-03-31 16:10:53', '2025-03-31 16:10:53'),
(698, '0', 280, 2640.00, '4', NULL, '2025-03-27 00:00:00', 'KUNDU DA', '2025-03-31 16:12:48', '2025-03-31 16:12:48'),
(699, '0', 284, 2000.00, '4', NULL, '2025-03-27 00:00:00', 'CASH DEPOSITE', '2025-03-31 16:15:40', '2025-03-31 16:15:40'),
(700, '0', 280, 3380.00, '4', NULL, '2025-03-28 00:00:00', 'KUNDU DA', '2025-03-31 16:17:05', '2025-03-31 16:17:05'),
(701, '0', 280, 2420.00, '4', NULL, '2025-03-30 00:00:00', 'KUNDU DA', '2025-03-31 16:18:04', '2025-03-31 16:18:04'),
(702, '0', 53, 2500.00, '4', NULL, '2025-03-31 00:00:00', 'CASH DEPOSITE', '2025-03-31 16:19:13', '2025-03-31 16:19:13'),
(703, '0', 280, 12730.00, '4', NULL, '2025-03-31 00:00:00', 'KUNDU DA', '2025-03-31 16:21:09', '2025-03-31 16:21:09'),
(704, '0', 280, 3000.00, '4', NULL, '2025-03-29 00:00:00', 'kundu da', '2025-04-01 12:29:53', '2025-04-01 12:29:53'),
(705, '0', 280, 1530.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-01 14:59:30', '2025-04-01 14:59:30'),
(706, '0', 223, 200.00, '4', NULL, '2025-03-03 00:00:00', 'cash deposite', '2025-04-01 15:06:13', '2025-04-01 15:06:13'),
(707, '0', 63, 1500.00, '4', NULL, '2025-03-10 00:00:00', 'cash deposite', '2025-04-01 15:13:00', '2025-04-01 15:13:00'),
(708, '0', 224, 1000.00, '4', NULL, '2025-03-10 00:00:00', 'cash deposite', '2025-04-01 15:14:38', '2025-04-01 15:14:38'),
(709, '0', 283, 2500.00, '4', NULL, '2025-03-29 00:00:00', 'cash deposite', '2025-04-01 15:29:21', '2025-04-01 15:29:21'),
(710, '0', 280, 2120.00, '4', NULL, '2025-04-01 00:00:00', 'kundu da', '2025-04-01 15:38:34', '2025-04-01 15:38:34'),
(711, '0', 280, 2920.00, '4', NULL, '2025-04-02 00:00:00', 'kundu da', '2025-04-02 15:18:22', '2025-04-02 15:18:22'),
(712, '0', 309, 2500.00, '4', NULL, '2025-04-02 00:00:00', 'Cash Deposit', '2025-04-02 17:31:01', '2025-04-02 17:31:01'),
(713, '0', 38, 3000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:18:43', '2025-04-03 11:18:43'),
(714, '0', 44, 1250.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:19:38', '2025-04-03 11:19:38'),
(715, '1N393420610', 61, 2800.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:20:57', '2025-04-10 18:25:24'),
(717, '2x717072406', 80, 1000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:22:34', '2025-04-10 18:27:22'),
(718, '3W632669702', 158, 1100.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:25:34', '2025-04-10 18:21:13'),
(720, '0', 132, 1100.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:29:24', '2025-04-03 11:29:24'),
(721, '1N304735204', 71, 4800.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:31:09', '2025-04-10 18:31:56'),
(722, '0', 62, 3600.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:34:42', '2025-04-03 11:34:42'),
(723, '0', 75, 600.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:35:35', '2025-04-03 11:35:35'),
(724, '1N408757602', 81, 3300.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:36:54', '2025-04-05 20:40:43'),
(725, '0', 22, 1700.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:37:47', '2025-04-03 11:37:47'),
(726, '0', 58, 1000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:38:54', '2025-04-03 11:38:54'),
(727, '0', 95, 100.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:40:35', '2025-04-03 11:40:35'),
(729, '2D713259510', 25, 1640.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:42:06', '2025-04-16 15:19:34'),
(730, '2P351906804', 101, 1000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:44:12', '2025-04-10 20:56:28'),
(731, '1B458979010', 52, 1000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:45:00', '2025-04-10 21:00:54'),
(732, '0', 96, 1450.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:46:06', '2025-04-03 11:46:06'),
(733, '0', 105, 840.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:47:04', '2025-04-03 11:47:04'),
(734, '0', 76, 2700.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:48:03', '2025-04-03 11:48:03'),
(735, '0', 89, 1500.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:48:45', '2025-04-03 11:48:45'),
(736, '0', 66, 60.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:49:29', '2025-04-03 11:49:29'),
(737, '0', 108, 2700.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:50:28', '2025-04-03 11:50:28'),
(738, '0', 109, 5000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:51:26', '2025-04-03 11:51:26'),
(739, '4A374876606', 113, 2700.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:52:31', '2025-04-12 13:48:24'),
(740, '0', 114, 600.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:53:19', '2025-04-03 11:53:19'),
(741, '2D403477104', 60, 1050.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:54:07', '2025-04-10 18:29:32'),
(742, '0', 116, 1350.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:55:16', '2025-04-03 11:55:16'),
(743, '0', 118, 1450.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:56:04', '2025-04-03 11:56:04'),
(744, '0', 119, 300.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:56:59', '2025-04-03 11:56:59'),
(745, '0', 120, 1450.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:58:38', '2025-04-03 11:58:38'),
(746, '0', 121, 2200.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 11:59:43', '2025-04-03 15:05:55'),
(747, '0', 237, 1440.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:00:37', '2025-04-03 12:00:37'),
(748, '0', 235, 1500.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:01:56', '2025-04-03 12:01:56'),
(749, '0', 236, 1200.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:02:41', '2025-04-03 12:02:41'),
(750, '0', 240, 1900.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:04:14', '2025-04-03 12:04:14'),
(751, '0', 238, 3000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:05:18', '2025-04-03 12:05:18'),
(752, '0', 250, 2700.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:07:08', '2025-04-03 12:07:08'),
(753, '0', 251, 1200.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:08:21', '2025-04-03 12:08:21'),
(754, '0', 252, 15500.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:09:18', '2025-04-03 12:09:18'),
(755, '0', 254, 900.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:11:00', '2025-04-03 12:11:00'),
(756, '0', 264, 6000.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:12:24', '2025-04-03 12:12:24'),
(757, '0', 268, 1050.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:13:09', '2025-04-03 12:13:09'),
(758, '0', 269, 1950.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:14:09', '2025-04-03 12:14:09'),
(759, '0', 282, 150.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:15:35', '2025-04-03 12:15:35'),
(760, '0', 276, 3200.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:16:40', '2025-04-03 12:16:40'),
(761, '0', 287, 1250.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:18:00', '2025-04-03 12:18:00'),
(762, '2K731336506', 24, 7750.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:18:52', '2025-04-16 15:16:38'),
(763, '0', 293, 1550.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:19:36', '2025-04-03 12:19:36'),
(764, '0', 289, 1100.00, '4', NULL, '2025-03-31 00:00:00', 'kundu da', '2025-04-03 12:20:38', '2025-04-03 12:20:38'),
(767, '0', 317, 480.00, '4', NULL, '2025-03-31 00:00:00', 'KUNDU DA', '2025-04-03 12:33:26', '2025-04-03 12:33:26'),
(768, '1NYH334375', 42, 1100.00, '4', NULL, '2025-03-31 00:00:00', 'KUNDU DA', '2025-04-03 15:10:22', '2025-04-10 18:14:54'),
(769, '0', 318, 800.00, '4', NULL, '2025-03-31 00:00:00', 'KUNDU DA', '2025-04-03 15:32:03', '2025-04-03 15:32:03'),
(770, '0', 280, 3000.00, '4', NULL, '2025-04-03 00:00:00', 'KUNDU DA', '2025-04-03 15:54:52', '2025-04-03 15:54:52'),
(771, '0', 49, 12270.00, '4', NULL, '2025-04-01 00:00:00', 'on line', '2025-04-07 15:16:59', '2025-04-07 15:16:59'),
(772, '0', 280, 3350.00, '4', NULL, '2025-04-04 00:00:00', 'kundu da', '2025-04-07 15:24:27', '2025-04-07 15:24:27'),
(773, '0', 280, 3500.00, '4', NULL, '2025-04-05 00:00:00', 'kundu da', '2025-04-07 15:25:16', '2025-04-07 15:25:16'),
(774, '0', 280, 2950.00, '4', NULL, '2025-04-06 00:00:00', 'kundu da', '2025-04-07 15:26:12', '2025-04-07 15:26:12'),
(775, '2P00250101', 41, 370.00, '4', NULL, '2025-04-07 00:00:00', 'cash deposite', '2025-04-07 15:27:25', '2025-04-10 21:09:18'),
(776, '0', 280, 3000.00, '4', NULL, '2025-04-07 00:00:00', 'kundu da', '2025-04-07 15:28:22', '2025-04-07 15:28:22'),
(777, '0', 228, 6500.00, '4', NULL, '2025-04-08 00:00:00', 'CASH DEPOSIT', '2025-04-08 16:17:27', '2025-04-08 16:17:27'),
(778, '2P00250101', 41, 700.00, '4', NULL, '2025-04-15 00:00:00', 'CASH', '2025-04-15 11:59:17', '2025-04-15 11:59:17'),
(780, '0', 316, 2500.00, '7', NULL, '2025-04-16 00:00:00', 'paid', '2025-04-16 14:50:06', '2025-04-16 14:50:06'),
(782, '0', 311, 1000.00, '4', NULL, '2025-04-12 00:00:00', 'cash deposit', '2025-04-16 15:40:01', '2025-04-16 15:40:01'),
(783, '2D743516508', 48, 12250.00, '4', NULL, '2025-04-16 00:00:00', 'policy renewal payment', '2025-04-16 16:53:27', '2025-04-16 16:53:27'),
(786, '0', 280, 3250.00, '4', NULL, '2025-04-08 00:00:00', 'KUNDU DA', '2025-04-17 15:48:52', '2025-04-17 15:48:52'),
(787, '0', 63, 1500.00, '4', NULL, '2025-04-08 00:00:00', 'CASH DEPOSITE', '2025-04-17 15:49:43', '2025-04-17 15:49:43'),
(788, '0', 280, 3600.00, '4', NULL, '2025-04-09 00:00:00', 'KUNDU DA', '2025-04-17 15:50:32', '2025-04-17 15:50:32'),
(789, '0', 59, 500.00, '4', NULL, '2025-04-09 00:00:00', 'CASH DEPOSITE', '2025-04-17 15:57:24', '2025-04-17 15:57:24'),
(790, '0', 21, 1000.00, '4', NULL, '2025-04-09 00:00:00', 'CASH DEPOSITE', '2025-04-17 15:59:25', '2025-04-17 15:59:25'),
(791, '0', 280, 3550.00, '4', NULL, '2025-04-10 00:00:00', 'KUNDU DA', '2025-04-17 16:00:33', '2025-04-17 16:00:33'),
(792, '0', 280, 3300.00, '4', NULL, '2025-04-11 00:00:00', 'KUNDU DA', '2025-04-17 16:01:31', '2025-04-17 16:01:31'),
(793, '0', 280, 3390.00, '4', NULL, '2025-04-12 00:00:00', 'KUNDU DA', '2025-04-17 16:04:29', '2025-04-17 16:04:29'),
(794, '0', 280, 3440.00, '4', NULL, '2025-04-13 00:00:00', 'KUNDU DA', '2025-04-17 16:06:05', '2025-04-17 16:06:05'),
(796, '0', 280, 7750.00, '4', NULL, '2025-04-14 00:00:00', 'KUNDU DA', '2025-04-17 16:08:04', '2025-04-17 16:31:25'),
(797, '0', 46, 2000.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:09:48', '2025-04-17 16:09:48'),
(798, '0', 41, 700.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:11:37', '2025-04-17 16:11:37'),
(799, '0', 50, 4000.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:13:27', '2025-04-17 16:13:27'),
(800, '0', 211, 2000.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:14:38', '2025-04-17 16:14:38'),
(801, '0', 210, 2000.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:15:41', '2025-04-17 16:15:41'),
(802, '0', 209, 2000.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:16:55', '2025-04-17 16:16:55'),
(803, '0', 280, 3850.00, '4', NULL, '2025-04-15 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:18:10', '2025-04-17 16:18:10'),
(804, '0', 280, 3000.00, '4', NULL, '2025-04-16 00:00:00', 'CASH DEPOSITE', '2025-04-17 16:19:49', '2025-04-17 16:19:49'),
(805, '0', 280, 3450.00, '4', NULL, '2025-04-17 00:00:00', 'KUNDU DA', '2025-04-17 16:21:35', '2025-04-17 16:21:35'),
(806, '0', 326, 3000.00, '7', NULL, '2025-04-17 00:00:00', 'UPI PAY', '2025-04-17 17:16:02', '2025-04-17 17:16:02'),
(807, '0', 306, 7000.00, '6', NULL, '2025-04-17 00:00:00', 'CASH', '2025-04-17 17:47:04', '2025-04-17 17:47:04'),
(808, '0', 54, 3000.00, '4', NULL, '2025-04-20 00:00:00', 'cash', '2025-04-21 22:19:09', '2025-04-21 22:19:09'),
(809, '0', 326, 3000.00, '4', NULL, '2025-04-18 00:00:00', 'cash deposite', '2025-04-24 14:33:49', '2025-04-24 14:33:49'),
(810, '0', 280, 2670.00, '4', NULL, '2025-04-18 00:00:00', 'kundu da', '2025-04-24 14:34:39', '2025-04-24 14:34:39'),
(811, '0', 280, 3350.00, '4', NULL, '2025-04-19 00:00:00', 'cash', '2025-04-24 14:45:00', '2025-04-24 14:45:00'),
(812, '0', 44, 1250.00, '4', NULL, '2025-04-20 00:00:00', 'cash deposite', '2025-04-24 14:47:11', '2025-04-24 14:47:11'),
(813, '0', 280, 3700.00, '4', NULL, '2025-04-20 00:00:00', 'kundu da', '2025-04-24 14:48:06', '2025-04-24 14:48:06'),
(814, '0', 280, 3020.00, '4', NULL, '2025-04-21 00:00:00', 'kundu da', '2025-04-24 14:49:01', '2025-04-24 14:49:01'),
(815, '0', 54, 3000.00, '4', NULL, '2025-04-21 00:00:00', 'cash deposite', '2025-04-24 14:50:06', '2025-04-24 14:50:06'),
(816, '0', 114, 5000.00, '4', NULL, '2025-04-21 00:00:00', 'cash deposite', '2025-04-24 14:51:30', '2025-04-24 14:51:30'),
(817, '0', 280, 3970.00, '4', NULL, '2025-04-22 00:00:00', 'kundu da', '2025-04-24 14:52:26', '2025-04-24 14:52:26'),
(818, '0', 280, 2660.00, '4', NULL, '2025-04-23 00:00:00', 'kundu da', '2025-04-24 14:53:17', '2025-04-24 14:53:17'),
(819, '0', 51, 400.00, '4', NULL, '2025-04-23 00:00:00', 'cash deposite', '2025-04-24 14:54:09', '2025-04-24 14:54:09'),
(820, '0', 127, 2000.00, '4', NULL, '2025-04-23 00:00:00', 'cash deposite', '2025-04-24 14:55:14', '2025-04-24 14:55:14'),
(821, '0', 212, 5000.00, '4', NULL, '2025-04-24 00:00:00', 'cash deposite', '2025-04-24 14:56:30', '2025-04-24 14:56:30'),
(822, '0', 311, 500.00, '4', NULL, '2025-04-24 00:00:00', 'cash received', '2025-04-24 15:12:20', '2025-04-24 15:12:20'),
(823, '0', 280, 3350.00, '4', NULL, '2025-04-24 00:00:00', 'kundu da', '2025-04-24 15:18:36', '2025-04-24 15:43:25'),
(824, '0', 280, 3070.00, '4', NULL, '2025-04-25 00:00:00', 'kundu da', '2025-04-25 15:51:54', '2025-04-25 15:51:54'),
(825, '0', 125, 6000.00, '4', NULL, '2025-04-25 00:00:00', 'Renewal  Deposit', '2025-04-25 17:57:03', '2025-04-25 17:57:03'),
(826, '0', 88, 1000.00, '4', NULL, '2025-04-26 00:00:00', 'cash', '2025-04-26 19:35:42', '2025-04-26 19:35:42'),
(827, '0', 168, 3000.00, '7', NULL, '2025-04-27 00:00:00', 'CASH', '2025-04-27 12:18:28', '2025-04-27 12:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `site_font` smallint(6) DEFAULT 19,
  `application_name` varchar(255) NOT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  `homepage_title` varchar(255) DEFAULT 'Home',
  `site_description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `facebook_url` varchar(500) DEFAULT NULL,
  `twitter_url` varchar(500) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `pinterest_url` varchar(500) DEFAULT NULL,
  `linkedin_url` varchar(500) DEFAULT NULL,
  `youtube_url` varchar(500) DEFAULT NULL,
  `vk_url` varchar(500) DEFAULT NULL,
  `whatsapp_url` varchar(255) DEFAULT NULL,
  `tumblr_url` varchar(255) DEFAULT NULL,
  `flickr_url` varchar(255) DEFAULT NULL,
  `vimeo_url` varchar(255) DEFAULT NULL,
  `about_footer` varchar(1000) DEFAULT NULL,
  `contact_text` text DEFAULT NULL,
  `contact_address` varchar(500) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_email_opt` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_phone_opt` varchar(255) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  `cookies_warning` tinyint(1) DEFAULT 0,
  `cookies_warning_text` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `fabicon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `lang_id`, `site_font`, `application_name`, `site_title`, `site_url`, `homepage_title`, `site_description`, `keywords`, `facebook_url`, `twitter_url`, `instagram_url`, `pinterest_url`, `linkedin_url`, `youtube_url`, `vk_url`, `whatsapp_url`, `tumblr_url`, `flickr_url`, `vimeo_url`, `about_footer`, `contact_text`, `contact_address`, `contact_email`, `contact_email_opt`, `contact_phone`, `contact_phone_opt`, `copyright`, `cookies_warning`, `cookies_warning_text`, `logo`, `fabicon`, `created_at`) VALUES
(1, 1, 25, 'Policy Software', 'Sibomsoiftware', 'https://www.Sibomsoiftware.com/', 'index', 'Developed By Code of Dolphins', 'index, home, Sibomsoiftware', 'https://www.facebook.com/', 'https://twitter.com', 'https://www.instagram.com/', 'https://pinterest.com', 'https://www.linkedin.com', 'https://www.youtube.com', 'https://vk.com', 'https://wa.me/', 'https://www.tumblr.com', 'https://www.flickr.com', 'https://vimeo.com', '', '', 'dweqhd fuwefigwehui fuf', 'demo@gmail.com', 'demo@gmail.com', '0000000000', '1111111111', '© 2024 by Policy Software', 0, '<p>This site uses cookies. By continuing to browse the site, you are agreeing to our use of cookies.</p>', '1720426346round_16000950.png', '1720426346round_16000950.png', '2020-05-11 01:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verification_code` varchar(255) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone_verification_code` varchar(255) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `status`, `role`, `name`, `email`, `email_verification_code`, `is_email_verified`, `email_verified_at`, `phone`, `phone_verification_code`, `is_phone_verified`, `phone_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '1', 'admin', 'Snehasish Bhurisrestha', 'admin@admin.com', NULL, 0, NULL, NULL, NULL, 0, NULL, '$2y$10$5byC3vCl6hp.4rZiu9vcWu0RkvnXimupaBuDkWi0T1JLlPDD3cImK', NULL, '2024-06-20 14:18:59', '2024-07-08 07:27:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agents_area_id_foreign` (`area_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_area_id_foreign` (`area_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `frequancy_policies`
--
ALTER TABLE `frequancy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policys_payments`
--
ALTER TABLE `policys_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policyterms`
--
ALTER TABLE `policyterms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policyterms_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `policytypes`
--
ALTER TABLE `policytypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_payment_modes`
--
ALTER TABLE `policy_payment_modes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policy_payment_modes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `frequancy_policies`
--
ALTER TABLE `frequancy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `policys_payments`
--
ALTER TABLE `policys_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `policytypes`
--
ALTER TABLE `policytypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `policy_payment_modes`
--
ALTER TABLE `policy_payment_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=828;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
