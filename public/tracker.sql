-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 03:11 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `business_name`, `created_at`, `updated_at`, `link`, `status`) VALUES
(11, 'Franz Pet Shop', '2021-01-28 20:18:24', '2021-01-28 20:18:24', 'franz-pet-shop-1611893904', 1),
(12, 'Tonyo\'s Barber Shop', '2021-01-28 21:39:10', '2021-01-28 21:39:10', 'tonyos-barber-shop-1611898750', 1),
(13, 'Victory Hotel', '2021-01-29 11:57:21', '2021-01-29 16:05:55', 'victory-hotel-1611950241', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `user_id`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 1, 11, '2021-01-28 21:03:31', '2021-01-28 21:03:31'),
(2, 11, 11, '2021-01-28 21:09:37', '2021-01-28 21:09:37'),
(3, 12, 11, '2021-01-28 21:12:31', '2021-01-28 21:12:31'),
(4, 13, 11, '2021-01-28 21:17:07', '2021-01-28 21:17:07'),
(5, 14, 12, '2021-01-28 21:39:47', '2021-01-28 21:39:47'),
(6, 15, 12, '2021-01-28 21:40:45', '2021-01-28 21:40:45'),
(7, 16, 12, '2021-01-29 01:14:16', '2021-01-29 01:14:16'),
(8, 17, 11, '2021-01-29 09:38:12', '2021-01-29 09:38:12'),
(9, 18, 11, '2021-01-29 09:41:37', '2021-01-29 09:41:37'),
(10, 19, 11, '2021-01-29 10:27:04', '2021-01-29 10:27:04'),
(11, 20, 12, '2021-01-29 10:37:56', '2021-01-29 10:37:56'),
(12, 21, 12, '2021-01-29 10:39:55', '2021-01-29 10:39:55'),
(13, 22, 12, '2021-01-29 10:40:44', '2021-01-29 10:40:44'),
(14, 23, 12, '2021-01-29 11:47:47', '2021-01-29 11:47:47'),
(15, 24, 12, '2021-01-29 11:48:15', '2021-01-29 11:48:15'),
(16, 25, 11, '2021-01-29 17:12:46', '2021-01-29 17:12:46'),
(17, 26, 11, '2021-01-29 17:58:23', '2021-01-29 17:58:23'),
(18, 27, 11, '2021-01-29 17:58:55', '2021-01-29 17:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_01_28_222553_create_business_table', 1),
(5, '2021_01_29_040123_create_history_table', 1),
(6, '2021_01_29_041540_add_link_to_business', 2),
(7, '2021_01_29_235618_add_status_to_business', 3);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `email_verified_at`, `phone`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Franz Darelle', 'Macatangga', 'admin@gmail.com', '2021-01-28 20:14:28', '855.702.0905', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'AX9ukU95uoSKT9JIFTVY7Y1kllZ8Gf2PUgylR6ESfdeQk5ExuI27oPNqHUVI', '2021-01-28 20:14:28', '2021-01-28 20:14:28'),
(11, 'John', 'Walton', NULL, NULL, '844-3492-583', NULL, 0, NULL, '2021-01-28 21:09:37', '2021-01-28 21:09:37'),
(12, 'Coleen', 'De Leon', NULL, NULL, '839-2940-313', NULL, 0, NULL, '2021-01-28 21:12:31', '2021-01-28 21:12:31'),
(13, 'Jade', 'Mann', NULL, NULL, '738-4930-029', NULL, 0, NULL, '2021-01-28 21:17:07', '2021-01-28 21:17:07'),
(14, 'Albert', 'Hall', NULL, NULL, '839-9402-0139', NULL, 0, NULL, '2021-01-28 21:39:47', '2021-01-28 21:39:47'),
(15, 'Monica', 'Cruz', NULL, NULL, '840-3485-931', NULL, 0, NULL, '2021-01-28 21:40:45', '2021-01-28 21:40:45'),
(16, 'Rafa', 'Macatangga', NULL, NULL, '384-4923-382', NULL, 0, NULL, '2021-01-29 01:14:16', '2021-01-29 01:14:16'),
(17, 'Justin', 'Vasquez', NULL, NULL, '940-3902-193', NULL, 0, NULL, '2021-01-29 09:38:12', '2021-01-29 09:38:12'),
(18, 'Chenee', 'Torres', NULL, NULL, '839-3829-281', NULL, 0, NULL, '2021-01-29 09:41:37', '2021-01-29 09:41:37'),
(19, 'Joshua', 'Okogie', NULL, NULL, '493-3922-495', NULL, 0, NULL, '2021-01-29 10:27:04', '2021-01-29 10:27:04'),
(20, 'Andrew', 'Bogut', NULL, NULL, '384-5932-394', NULL, 0, NULL, '2021-01-29 10:37:56', '2021-01-29 10:37:56'),
(21, 'Tom', 'Holland', NULL, NULL, '845-2953-394', NULL, 0, NULL, '2021-01-29 10:39:55', '2021-01-29 10:39:55'),
(22, 'Jason', 'Stacy', NULL, NULL, '849-2593-304', NULL, 0, NULL, '2021-01-29 10:40:44', '2021-01-29 10:40:44'),
(23, 'John', 'Elwood', NULL, NULL, '595-3953-395', NULL, 0, NULL, '2021-01-29 11:47:47', '2021-01-29 11:47:47'),
(24, 'Ben', 'Woods', NULL, NULL, '249-6943-583', NULL, 0, NULL, '2021-01-29 11:48:15', '2021-01-29 11:48:15'),
(25, 'Jason', 'Mamoa', NULL, NULL, '930-4302-940', NULL, 0, NULL, '2021-01-29 17:12:46', '2021-01-29 17:12:46'),
(26, 'Jamie', 'Underwood', NULL, NULL, '839-5938-001', NULL, 0, NULL, '2021-01-29 17:58:23', '2021-01-29 17:58:23'),
(27, 'Justin', 'Warren', NULL, NULL, '984-2942-931', NULL, 0, NULL, '2021-01-29 17:58:55', '2021-01-29 17:58:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_user_id_foreign` (`user_id`),
  ADD KEY `history_business_id_foreign` (`business_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
  ADD CONSTRAINT `history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
