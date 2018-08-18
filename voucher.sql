-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2018 at 07:22 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voucher`
--

-- --------------------------------------------------------

--
-- Table structure for table `appslogs`
--

CREATE TABLE IF NOT EXISTS `appslogs` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appslogs`
--

INSERT INTO `appslogs` (`id`, `user_id`, `ip_address`, `class`, `action`, `description`, `created_at`) VALUES
(1, 1, 'fe80::3dfd:aea5:a5cf:ba93', '1', 'recipient created', '{"_token":"z4NDE0JYyYFSPLwG87lvzXPeGaS4bYqmGTmGgOoF","name":"Recipient 1","email":"Recipient1@gmail.com","save_exit":"Save & Exit"}', '2018-01-03 11:51:26'),
(2, 1, 'fe80::3dfd:aea5:a5cf:ba93', '1', 'special offer created', '{"_token":"z4NDE0JYyYFSPLwG87lvzXPeGaS4bYqmGTmGgOoF","name":"Special Offer","discount":"10","save_exit":"Save & Exit"}', '2018-01-03 11:51:50'),
(3, 1, 'fe80::3dfd:aea5:a5cf:ba93', '1', 'vouchercode created', '{"_token":"z4NDE0JYyYFSPLwG87lvzXPeGaS4bYqmGTmGgOoF","voucher_code":"12345678","recipient_id":"1","special_offer_id":"1","expiration_date":"10\\/01\\/2018","used_once":"1","save":"Save"}', '2018-01-03 11:52:09'),
(4, 1, 'fe80::3dfd:aea5:a5cf:ba93', '1', 'vouchercode created', '{"_token":"z4NDE0JYyYFSPLwG87lvzXPeGaS4bYqmGTmGgOoF","voucher_code":"abcdefgh","recipient_id":"1","special_offer_id":"1","expiration_date":"11\\/01\\/2018","used_once":"0","save":"Save"}', '2018-01-03 11:52:27'),
(5, 1, 'fe80::3dfd:aea5:a5cf:ba93', '1', 'vouchercode updated', '{"_token":"z4NDE0JYyYFSPLwG87lvzXPeGaS4bYqmGTmGgOoF","voucher_code":"abcdefgh","recipient_id":"1","special_offer_id":"1","expiration_date":"11\\/01\\/2018","used_once":"0","save_exit":"Save & Exit"}', '2018-01-03 11:52:29');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE IF NOT EXISTS `recipients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`id`, `name`, `email`, `deleted`, `updated_at`, `created_at`) VALUES
(1, 'Recipient 1', 'Recipient1@gmail.com', '0', '2018-01-03 06:21:26', '2018-01-03 06:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `special_offers`
--

CREATE TABLE IF NOT EXISTS `special_offers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `special_offers`
--

INSERT INTO `special_offers` (`id`, `name`, `discount`, `deleted`, `updated_at`, `created_at`) VALUES
(1, 'Special Offer', 10, '0', '2018-01-03 06:21:50', '2018-01-03 06:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=Inactive,1=Active',
  `deleted` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=Visible,1=Invisible',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `remember_token`, `status`, `deleted`, `updated_at`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$7sZpsubczZZldgAlt3YeT.cLupya7Jox2pPSPqtg4mG6yqovTkmwi', '', '4HoikSvmHZteokAqGKUKJuBQZz7ep13a165ayQ0Z4oZo9eIMjCqivyVCrfJF', '1', '0', '2018-01-02 06:25:18', '2018-01-02 04:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_codes`
--

CREATE TABLE IF NOT EXISTS `voucher_codes` (
  `id` int(11) NOT NULL,
  `voucher_code` varchar(255) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `special_offer_id` int(11) NOT NULL,
  `expiration_date` date NOT NULL,
  `used_once` enum('0','1') NOT NULL DEFAULT '0',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_codes`
--

INSERT INTO `voucher_codes` (`id`, `voucher_code`, `recipient_id`, `special_offer_id`, `expiration_date`, `used_once`, `deleted`, `updated_at`, `created_at`) VALUES
(1, '12345678', 1, 1, '2018-01-10', '1', '0', '2018-01-03 06:22:09', '2018-01-03 06:22:09'),
(2, 'abcdefgh', 1, 1, '2018-01-11', '0', '0', '2018-01-03 06:22:27', '2018-01-03 06:22:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appslogs`
--
ALTER TABLE `appslogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `voucher_codes`
--
ALTER TABLE `voucher_codes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appslogs`
--
ALTER TABLE `appslogs`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `special_offers`
--
ALTER TABLE `special_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `voucher_codes`
--
ALTER TABLE `voucher_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
