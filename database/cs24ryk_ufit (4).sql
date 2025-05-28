-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 09:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs24ryk_ufit`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `activity_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `activity_type`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:12', '2025-05-27 06:48:12'),
(2, 2, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(3, 3, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(4, 4, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(5, 5, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(6, 6, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(7, 7, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(8, 8, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(9, 9, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(10, 10, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(11, 11, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:14', '2025-05-27 06:48:14'),
(12, 12, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(13, 13, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(14, 14, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(15, 15, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(16, 16, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(17, 17, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(18, 18, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(19, 19, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(20, 20, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(21, 21, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-27 06:48:51', '2025-05-27 06:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `gym_id` int(11) DEFAULT NULL,
  `checkin_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`id`, `user_id`, `gym_id`, `checkin_time`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-05-21 04:05:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(2, 1, 3, '2025-05-20 04:54:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(3, 2, 2, '2025-05-18 05:50:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(4, 2, 2, '2025-05-18 03:14:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(5, 2, 1, '2025-05-20 03:53:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(6, 2, 3, '2025-05-24 05:40:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(7, 3, 1, '2025-05-27 04:31:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(8, 3, 1, '2025-05-20 05:38:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(9, 3, 3, '2025-05-20 04:51:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(10, 3, 4, '2025-05-18 05:14:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(11, 4, 1, '2025-05-18 03:48:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(12, 5, 1, '2025-05-20 03:41:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(13, 5, 4, '2025-05-18 05:18:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(14, 5, 5, '2025-05-22 06:35:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(15, 5, 5, '2025-05-22 03:51:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(16, 5, 4, '2025-05-26 05:54:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(17, 6, 2, '2025-05-25 05:46:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(18, 6, 4, '2025-05-21 06:47:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(19, 6, 1, '2025-05-23 03:38:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(20, 7, 4, '2025-05-17 05:16:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(21, 8, 4, '2025-05-26 06:17:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(22, 9, 2, '2025-05-27 03:13:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(23, 10, 5, '2025-05-19 03:44:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(24, 10, 5, '2025-05-24 04:33:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(25, 10, 4, '2025-05-18 05:23:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(26, 10, 5, '2025-05-20 04:59:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(27, 10, 5, '2025-05-22 04:10:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(28, 11, 2, '2025-05-27 06:27:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(29, 11, 3, '2025-05-23 04:06:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(30, 11, 5, '2025-05-24 03:57:00', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(31, 11, 5, '2025-05-18 05:37:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(32, 11, 5, '2025-05-18 06:18:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(33, 12, 3, '2025-05-22 04:06:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(34, 12, 4, '2025-05-21 06:00:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(35, 12, 3, '2025-05-20 04:41:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(36, 13, 2, '2025-05-20 06:27:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(37, 13, 4, '2025-05-21 04:20:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(38, 13, 4, '2025-05-19 05:29:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(39, 14, 1, '2025-05-22 05:16:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(40, 14, 5, '2025-05-17 04:03:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(41, 14, 4, '2025-05-22 05:47:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(42, 15, 3, '2025-05-22 03:25:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(43, 15, 2, '2025-05-25 05:26:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(44, 15, 5, '2025-05-27 05:14:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(45, 15, 5, '2025-05-27 03:33:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(46, 15, 1, '2025-05-19 03:12:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(47, 16, 1, '2025-05-25 05:14:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(48, 16, 1, '2025-05-24 03:34:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(49, 16, 5, '2025-05-23 06:50:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(50, 17, 5, '2025-05-24 03:12:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(51, 17, 5, '2025-05-17 03:12:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(52, 17, 3, '2025-05-24 04:21:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(53, 18, 1, '2025-05-18 03:23:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(54, 18, 1, '2025-05-22 03:02:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(55, 18, 5, '2025-05-20 04:29:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(56, 18, 5, '2025-05-26 05:00:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(57, 19, 5, '2025-05-23 04:10:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(58, 19, 1, '2025-05-17 03:03:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(59, 19, 3, '2025-05-24 03:52:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(60, 20, 1, '2025-05-23 04:40:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(61, 20, 2, '2025-05-25 05:39:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(62, 20, 5, '2025-05-24 06:41:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(63, 20, 1, '2025-05-19 06:01:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(64, 20, 1, '2025-05-24 06:16:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(65, 21, 5, '2025-05-21 04:38:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(66, 21, 4, '2025-05-23 05:18:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(67, 21, 4, '2025-05-20 04:42:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(68, 21, 1, '2025-05-26 05:01:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52'),
(69, 21, 4, '2025-05-20 06:33:00', '2025-05-27 06:48:52', '2025-05-27 06:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `favorite_gyms`
--

CREATE TABLE `favorite_gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `region_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `facilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`facilities`)),
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `commission_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `payment_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_settings`)),
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`id`, `region_id`, `owner_id`, `name`, `address`, `opening_time`, `closing_time`, `description`, `image_path`, `facilities`, `status`, `commission_rate`, `payment_settings`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Bergnaum Inc Gym', '729 Predovic Light Apt. 122\nJoemouth, MA 08234', '06:00:00', '23:00:00', 'Sint repellendus in vitae. Aliquid sit voluptatem esse aut autem sunt omnis. Architecto sint et cumque impedit voluptatem. Aut dignissimos rerum consequatur vel deleniti.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Yoga Studio\\\",\\\"Sauna\\\",\\\"Swimming Pool\\\",\\\"Cardio\\\",\\\"CrossFit\\\"]\"', 'rejected', 11.79, NULL, 24.8089430, 67.2203570, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(2, 2, 7, 'Schuppe, Kuhn and Lehner Gym', '5119 Carlie Cliff Suite 868\nJudeborough, WV 58085', '06:00:00', '23:00:00', 'Possimus nesciunt harum voluptatibus. Velit reprehenderit repudiandae occaecati ab aut. Expedita et id illum qui culpa. Aut qui veritatis ullam qui id esse reprehenderit cumque. Adipisci est ex id rerum iste.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio\\\",\\\"Weights\\\"]\"', 'pending', 7.61, NULL, 24.9573510, 67.2547400, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(3, 1, 9, 'Pouros-Langosh Gym', '2537 Gerhold Village Suite 717\nLake Murray, UT 85202-8912', '06:00:00', '23:00:00', 'Possimus et libero nostrum beatae voluptas sit architecto. Quos quisquam enim labore animi. Fuga aut eaque ipsa assumenda sunt. Reiciendis minus odio est.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Yoga Studio\\\",\\\"Weights\\\",\\\"Personal Trainer\\\",\\\"Cardio\\\"]\"', 'approved', 14.90, NULL, 24.9908790, 66.9639290, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(4, 2, 10, 'Torp-Murphy Gym', '567 Tremblay Rue\nKilbackport, KY 44909', '06:00:00', '23:00:00', 'Ipsum animi alias tempora sed harum culpa dolore. Vel alias a sint quasi quam corporis nesciunt. Accusantium sed architecto natus et eligendi occaecati.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Personal Trainer\\\",\\\"Cardio\\\",\\\"Weights\\\",\\\"Sauna\\\",\\\"CrossFit\\\"]\"', 'pending', 17.79, NULL, 24.8305950, 67.2313260, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(5, 4, 6, 'Russel PLC Gym', '95546 Shanahan Crossing\nEast Sydney, IL 95243-0324', '06:00:00', '23:00:00', 'Et sint aspernatur adipisci. Sunt quis ab et dolore.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Personal Trainer\\\",\\\"Swimming Pool\\\",\\\"Cardio\\\",\\\"CrossFit\\\",\\\"Yoga Studio\\\"]\"', 'rejected', 7.63, NULL, 24.8451430, 67.2955830, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(6, 1, 5, 'Schoen, Simonis and Grimes Gym', '1228 Angel Prairie\nAniyashire, AZ 91240', '06:00:00', '23:00:00', 'Fuga in quasi consequatur. Accusamus cum atque enim quo nihil quia consequatur autem. Consequatur qui et omnis animi quis placeat praesentium. Magni ullam tempore vitae et.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"CrossFit\\\",\\\"Cardio\\\"]\"', 'pending', 18.76, NULL, 24.9658720, 67.1623860, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(7, 4, 8, 'Kemmer, Dach and Daugherty Gym', '9474 Bogisich Square Suite 265\nWest Bertramport, ID 37334-1595', '06:00:00', '23:00:00', 'Pariatur et enim voluptas temporibus architecto maxime neque. Sed rerum ea cumque quisquam officiis dolor. Dolores consequuntur enim facere voluptatum a reiciendis. In asperiores eaque officia.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Sauna\\\",\\\"Cardio\\\"]\"', 'rejected', 16.10, NULL, 24.9159700, 67.2801640, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(8, 4, 10, 'Volkman, Quigley and Stanton Gym', '51206 Schmidt Estate\nJailyntown, GA 68575', '06:00:00', '23:00:00', 'Laborum quia quia incidunt qui consequuntur labore et. Qui ullam occaecati voluptates incidunt. Consequuntur necessitatibus non sequi blanditiis voluptatibus velit.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Yoga Studio\\\",\\\"Sauna\\\"]\"', 'approved', 12.69, NULL, 24.9212070, 67.1746770, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(9, 5, 1, 'Schoen, Treutel and Pfeffer Gym', '6613 Estefania Mill\nEast Cordiahaven, VT 63009-7190', '06:00:00', '23:00:00', 'Nesciunt dignissimos at necessitatibus et asperiores qui. Impedit est ea praesentium non doloribus. Pariatur quibusdam sunt sit quos dolor.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Personal Trainer\\\",\\\"Swimming Pool\\\"]\"', 'pending', 12.18, NULL, 24.8259200, 67.2716630, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(10, 4, 3, 'Collins-Mertz Gym', '4736 Hagenes Tunnel Apt. 253\nNorth Wilmer, MT 35964-6410', '06:00:00', '23:00:00', 'Qui aliquam a incidunt aliquid doloribus et velit necessitatibus. Exercitationem voluptatem cum non aut magnam voluptas beatae. Commodi qui vel maxime. Consequatur delectus quia reprehenderit dolore numquam culpa quia voluptas.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Sauna\\\",\\\"Swimming Pool\\\"]\"', 'approved', 9.55, NULL, 24.8690980, 67.1031170, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(11, 3, 5, 'Daniel Group Gym', '53962 Peggie Flats Suite 384\nWebsterchester, AK 92025', '06:00:00', '23:00:00', 'Perspiciatis velit expedita adipisci id asperiores minima. Ipsam aut sint maxime tenetur quia. Doloribus est suscipit et non atque suscipit. Perspiciatis ipsa magnam voluptatem qui qui necessitatibus.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Cardio\\\",\\\"Yoga Studio\\\",\\\"CrossFit\\\",\\\"Sauna\\\"]\"', 'approved', 18.30, NULL, 24.9857430, 67.2308430, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(12, 2, 2, 'Feeney, Larson and Treutel Gym', '4417 Dietrich Mountains\nProhaskatown, MN 12542', '06:00:00', '23:00:00', 'Perferendis dolore quasi officia qui impedit. Impedit reprehenderit est consequatur dolorum tenetur veritatis unde quia. Earum rerum consequatur nostrum accusantium.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Swimming Pool\\\",\\\"Weights\\\"]\"', 'rejected', 19.30, NULL, 24.8757880, 67.1945540, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(13, 4, 3, 'Thompson-Daniel Gym', '214 Sharon Club\nJaskolskishire, IA 15533', '06:00:00', '23:00:00', 'Laboriosam officia quia officia qui. Vel et aut eligendi ad. Eos nesciunt impedit recusandae ab aut deleniti tenetur iusto.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Yoga Studio\\\",\\\"Cardio\\\",\\\"Sauna\\\"]\"', 'approved', 15.34, NULL, 24.8705320, 67.2242220, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(14, 3, 5, 'Pacocha, Cummerata and Reinger Gym', '20200 Abernathy Plaza Suite 845\nEast Earlene, CT 39638-2993', '06:00:00', '23:00:00', 'Ea qui voluptas rerum animi voluptate debitis sed. Expedita ad non vitae molestiae. Dolore ab dolorum aperiam nihil sunt blanditiis qui. Molestiae tempore maiores est id ipsam dolorem.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"CrossFit\\\",\\\"Personal Trainer\\\"]\"', 'pending', 9.87, NULL, 24.8575740, 66.9257800, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(15, 1, 7, 'Deckow, Hyatt and Shields Gym', '70359 Rodrick Common\nSouth Henri, MD 95633', '06:00:00', '23:00:00', 'Eveniet alias et harum rerum sed et nesciunt. Nemo consequatur ducimus repellat dolorum doloremque similique aperiam. Omnis animi molestiae unde et ut. Repellat iure possimus et voluptatem.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Yoga Studio\\\",\\\"Cardio\\\",\\\"Sauna\\\"]\"', 'pending', 16.91, NULL, 24.8267780, 67.0160550, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(16, 3, 9, 'Kirlin-Corwin Gym', '760 Makenzie Streets\nNorth Kristopher, WI 53413', '06:00:00', '23:00:00', 'Et laborum sunt reiciendis debitis qui et asperiores. Tempore ea voluptas vero laboriosam aut vel nemo. Eligendi perspiciatis inventore optio corrupti sint illo quo.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"CrossFit\\\",\\\"Weights\\\"]\"', 'pending', 9.28, NULL, 24.9196910, 66.8629430, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(17, 5, 8, 'Kuvalis-Wisoky Gym', '917 Jaylon Isle Apt. 821\nAndersonstad, NH 81819-8655', '06:00:00', '23:00:00', 'Quia ut saepe libero totam fugiat qui. Rerum ex ipsa ipsam libero ea explicabo ut. Ea voluptates molestiae perferendis vel. Nemo ex fugiat impedit.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"CrossFit\\\",\\\"Cardio\\\",\\\"Weights\\\",\\\"Swimming Pool\\\"]\"', 'approved', 19.39, NULL, 24.8936040, 67.0381850, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(18, 5, 3, 'Romaguera Inc Gym', '5195 Fritz Port\nLuciousshire, IA 03774', '06:00:00', '23:00:00', 'Delectus autem rem doloremque vel. Et est cum ipsa temporibus. Dolorem nostrum occaecati aut.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"CrossFit\\\",\\\"Cardio\\\",\\\"Yoga Studio\\\",\\\"Weights\\\",\\\"Swimming Pool\\\"]\"', 'approved', 13.47, NULL, 24.9787540, 67.1853640, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(19, 3, 8, 'Heathcote Inc Gym', '18471 Amie Centers\nEast Celine, WI 90391', '06:00:00', '23:00:00', 'Sit voluptatem tenetur minus sit repellat quasi vel. Dolorum reiciendis libero maxime. Cupiditate in est et dolorum molestias minima rerum. Corporis sunt similique facere aut pariatur rerum.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Sauna\\\",\\\"Weights\\\",\\\"Swimming Pool\\\",\\\"Yoga Studio\\\"]\"', 'rejected', 10.20, NULL, 24.8406250, 67.2014390, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(20, 3, 5, 'King-Becker Gym', '35456 Cassandra Rest\nOramouth, MT 43215', '06:00:00', '23:00:00', 'Consectetur ut ut ut id ratione voluptas. Quo quis eum doloremque. Dolorum non culpa esse.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"CrossFit\\\",\\\"Yoga Studio\\\",\\\"Weights\\\",\\\"Sauna\\\"]\"', 'pending', 10.88, NULL, 24.8326420, 66.8295010, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(21, 2, 2, 'Runte Group Gym', '2609 Antonietta Mall\nBinsville, LA 09344', '06:00:00', '23:00:00', 'Pariatur asperiores saepe cupiditate. Excepturi corporis vitae occaecati doloremque delectus. Quia sed consequatur sit eum.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Weights\\\",\\\"Cardio\\\",\\\"Sauna\\\",\\\"CrossFit\\\"]\"', 'approved', 11.12, NULL, 24.9471870, 66.8493590, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(22, 2, 9, 'Stehr-Roob Gym', '72446 Bergnaum Knolls\nNorth Daijaborough, WY 86100', '06:00:00', '23:00:00', 'Laboriosam omnis commodi praesentium recusandae. Quia necessitatibus ad maxime similique quam rerum. Quis quasi quo nisi est nisi.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Swimming Pool\\\",\\\"Yoga Studio\\\",\\\"CrossFit\\\"]\"', 'rejected', 11.83, NULL, 24.9667570, 66.8131410, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(23, 3, 4, 'D\'Amore PLC Gym', '648 Julie Trail\nLake Holden, WA 84480-3770', '06:00:00', '23:00:00', 'Quia impedit architecto aliquid nam provident aliquam qui. Eum quidem veritatis sint corporis qui et. Molestiae nostrum excepturi sunt architecto impedit dolores et nostrum.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Sauna\\\",\\\"Personal Trainer\\\"]\"', 'rejected', 11.14, NULL, 24.9351580, 66.9188700, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(24, 5, 11, 'Gutkowski PLC Gym', '78868 Goldner Knoll\nNew Dante, ID 13048', '06:00:00', '23:00:00', 'Necessitatibus quas sequi quia et. Minus quasi atque voluptates sed minus commodi. Iste autem pariatur aut a consequuntur quisquam nulla at. Occaecati accusantium delectus odio sint est et.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"CrossFit\\\",\\\"Swimming Pool\\\",\\\"Weights\\\",\\\"Sauna\\\",\\\"Cardio\\\"]\"', 'pending', 10.24, NULL, 24.8902410, 67.1683500, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(25, 2, 11, 'Wyman-O\'Reilly Gym', '23566 Nolan Landing Apt. 440\nPort Hoytport, NH 27097', '06:00:00', '23:00:00', 'Similique molestias a quo saepe ut. Neque repellat ut saepe optio aut. Fugiat odio odit amet voluptates. Nesciunt vero in sit aut iste.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Personal Trainer\\\",\\\"Swimming Pool\\\",\\\"Weights\\\"]\"', 'pending', 12.16, NULL, 24.9392230, 66.8254590, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(26, 5, 11, 'Graham Group Gym', '39893 Lueilwitz Circle Suite 157\nPerrymouth, DC 10761', '06:00:00', '23:00:00', 'Voluptatem sunt inventore quidem veniam id. Nisi ea commodi harum natus ab optio. Id consequatur a sunt ullam vero.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"CrossFit\\\",\\\"Sauna\\\",\\\"Weights\\\",\\\"Swimming Pool\\\"]\"', 'pending', 12.04, NULL, 24.9859080, 66.9322520, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(27, 4, 3, 'Schmeler-Hoppe Gym', '27660 Serenity Rue Suite 393\nNorth Shaniamouth, AL 29549-2569', '06:00:00', '23:00:00', 'Dolorem et et animi et velit eligendi quos. Quia ea aliquam qui et accusantium culpa. Aut suscipit qui repellat corrupti laborum alias. Eos nostrum sint dicta. Placeat vero facilis non sunt laboriosam.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Personal Trainer\\\",\\\"Weights\\\",\\\"Cardio\\\",\\\"CrossFit\\\"]\"', 'approved', 13.08, NULL, 24.8383660, 67.2008750, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(28, 5, 1, 'Langosh, Brekke and Buckridge Gym', '414 Federico Dam Apt. 895\nBlancatown, SC 07769-6786', '06:00:00', '23:00:00', 'Quae consequatur ipsa aut. Optio explicabo voluptas magni laboriosam saepe maxime. Iure est libero eos quisquam sit laborum. Consequuntur placeat eaque provident minus fugit id cumque nihil.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Weights\\\",\\\"Personal Trainer\\\"]\"', 'approved', 17.42, NULL, 24.8694710, 67.0552190, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(29, 2, 6, 'Pollich Group Gym', '74916 Ansel Rest Suite 616\nSouth Abnershire, AZ 35284', '06:00:00', '23:00:00', 'Sed facere quo maiores dolor fugiat velit dolorum. Dolores iusto autem corporis ipsum consequatur voluptatem. Occaecati quisquam quibusdam sed. Quo aut aperiam incidunt numquam pariatur vero quis esse.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Yoga Studio\\\",\\\"Sauna\\\",\\\"Swimming Pool\\\",\\\"Weights\\\"]\"', 'rejected', 19.86, NULL, 24.8913620, 67.2298470, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(30, 3, 7, 'Reichert, Gerlach and Abshire Gym', '770 Reba Lodge Apt. 390\nAriton, CO 65292-3336', '06:00:00', '23:00:00', 'Quod natus modi molestiae ut vero omnis. Eos tempore saepe modi nam. Fuga perspiciatis eius ut asperiores eos. Dicta quo eum est est quam voluptatibus.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Personal Trainer\\\",\\\"Yoga Studio\\\",\\\"Swimming Pool\\\"]\"', 'approved', 12.98, NULL, 24.8753390, 66.9566460, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(31, 2, 6, 'Mosciski-West Gym', '2999 Mills Divide\nPort Liam, CA 50425-3756', '06:00:00', '23:00:00', 'Eos repellat quia sunt. Cupiditate ipsa accusantium ut eaque est sit quas repudiandae. Ut culpa perspiciatis odio. Sunt veniam modi deserunt velit.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"CrossFit\\\",\\\"Cardio\\\",\\\"Weights\\\",\\\"Swimming Pool\\\",\\\"Yoga Studio\\\"]\"', 'pending', 8.41, NULL, 24.8644180, 66.8602120, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(32, 1, 9, 'Koch, Frami and Champlin Gym', '98374 Graham Creek Suite 251\nLake Granthaven, MT 53053', '06:00:00', '23:00:00', 'Minus eum vel non assumenda. Provident dignissimos voluptatem at iure quae. Quaerat ut quo a consequuntur itaque. Eum doloremque ex impedit facilis occaecati molestiae ipsa consequatur.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"CrossFit\\\",\\\"Swimming Pool\\\",\\\"Cardio\\\",\\\"Weights\\\",\\\"Yoga Studio\\\"]\"', 'rejected', 14.62, NULL, 24.8390610, 67.1948040, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(33, 4, 5, 'Trantow LLC Gym', '90708 Murphy Plains Apt. 269\nEast Ava, IL 77222', '06:00:00', '23:00:00', 'Eveniet consectetur ullam facilis culpa ipsam et. Ut nobis libero ad. Sequi maiores animi error voluptatem qui occaecati corporis et.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Yoga Studio\\\",\\\"Swimming Pool\\\",\\\"Weights\\\",\\\"Cardio\\\"]\"', 'pending', 12.80, NULL, 24.9689560, 66.9813240, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(34, 4, 1, 'Hahn-Casper Gym', '95654 Weissnat Divide Apt. 114\nSouth Lori, NV 74367-6734', '06:00:00', '23:00:00', 'Expedita et aut quibusdam. Autem perferendis laboriosam praesentium quo reiciendis eos et. Sit laboriosam exercitationem qui laboriosam quia.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio\\\",\\\"Personal Trainer\\\"]\"', 'pending', 11.27, NULL, 24.8120830, 66.9224940, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(35, 1, 8, 'Runolfsson, Lindgren and Herman Gym', '1688 Runte Wells Apt. 597\nMelodyburgh, MI 15019-2552', '06:00:00', '23:00:00', 'Soluta veritatis nihil quos dicta voluptatem. Id aut cumque ut consequatur. Alias et nihil delectus ullam harum porro delectus commodi. Hic velit modi incidunt corrupti consectetur et eum.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Weights\\\",\\\"CrossFit\\\"]\"', 'approved', 17.13, NULL, 24.8940280, 67.0944580, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(36, 1, 6, 'Zulauf-Conroy Gym', '3141 Arely Gardens Apt. 483\nSouth Loraine, TN 48896-2096', '06:00:00', '23:00:00', 'Quisquam asperiores odit inventore pariatur laboriosam. Illum ea consequatur itaque deserunt beatae vero ut. Dolor exercitationem et cupiditate aut occaecati numquam qui nobis.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Personal Trainer\\\",\\\"Cardio\\\",\\\"Weights\\\"]\"', 'pending', 12.27, NULL, 24.8767070, 67.1442560, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(37, 1, 1, 'Wyman, Runolfsson and Bogisich Gym', '10190 Koepp Ranch\nPort Imogeneton, CO 77821', '06:00:00', '23:00:00', 'Dolorem consectetur est inventore esse eaque dolorem aut molestiae. Optio eaque doloribus dolores sed. Repellendus qui quia omnis asperiores.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Personal Trainer\\\",\\\"Cardio\\\",\\\"Yoga Studio\\\",\\\"Swimming Pool\\\",\\\"CrossFit\\\"]\"', 'pending', 18.99, NULL, 24.9906090, 67.1030450, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(38, 4, 3, 'Mraz, Welch and Lesch Gym', '566 Idella Lights\nRuntefort, ID 08010-0495', '06:00:00', '23:00:00', 'Quae alias aliquam ipsum fugit ipsa voluptatem. Quos et nihil ullam laboriosam modi et. Ea consequatur qui sunt eum cumque aspernatur ab assumenda.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Sauna\\\",\\\"Personal Trainer\\\",\\\"Weights\\\"]\"', 'pending', 14.64, NULL, 24.9197100, 66.8145460, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(39, 2, 2, 'Lowe, Weissnat and Fritsch Gym', '823 Crist Estate Suite 591\nNew Amberside, GA 16696', '06:00:00', '23:00:00', 'Rerum quo magnam sint sint possimus molestiae. Enim voluptates inventore corrupti dicta error quis. Nihil rerum beatae earum labore rem.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Swimming Pool\\\",\\\"Sauna\\\",\\\"Yoga Studio\\\"]\"', 'pending', 13.24, NULL, 24.8613280, 67.0167960, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(40, 1, 2, 'Collier-Hoppe Gym', '1352 Alysa Mews\nEast Nilsberg, MN 02009-6724', '06:00:00', '23:00:00', 'Enim recusandae laudantium qui quia harum. At et quis omnis culpa aut quo exercitationem. Repellat voluptate dignissimos nisi. Et beatae recusandae in aut autem ab.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Personal Trainer\\\",\\\"Yoga Studio\\\",\\\"Cardio\\\",\\\"CrossFit\\\"]\"', 'approved', 5.79, NULL, 24.8402930, 67.2811160, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(41, 5, 9, 'Wilderman PLC Gym', '876 Melody Manor Apt. 766\nWaltershire, MS 56886-9212', '06:00:00', '23:00:00', 'Magni animi nihil dignissimos vitae quae ad. Enim neque quo est autem tenetur dolorem qui. Amet qui perferendis magnam neque sit consequatur. Et omnis deserunt aliquid ex. Omnis voluptate rerum dicta fuga natus nihil.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Yoga Studio\\\",\\\"Weights\\\",\\\"CrossFit\\\",\\\"Sauna\\\",\\\"Personal Trainer\\\"]\"', 'rejected', 17.92, NULL, 24.8468840, 66.9126430, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(42, 2, 7, 'Senger, Terry and Hintz Gym', '88844 Jennie Islands Apt. 696\nKeatonbury, OH 75871-7665', '06:00:00', '23:00:00', 'Est ut atque incidunt odit molestiae necessitatibus. Odit labore numquam eaque voluptates sint. Eos modi aperiam in aut. Quasi accusantium ut voluptas necessitatibus maiores.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Swimming Pool\\\",\\\"Cardio\\\"]\"', 'pending', 18.77, NULL, 24.9030060, 66.9792410, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(43, 2, 7, 'Will, Bogisich and Herzog Gym', '52439 Forrest Circles\nNorth Sabryna, TN 93309-5214', '06:00:00', '23:00:00', 'Ea reiciendis quisquam rem. Quam corrupti consequatur quia. Aperiam deserunt harum dicta non officiis. Et ut laboriosam qui adipisci praesentium.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Sauna\\\",\\\"Weights\\\",\\\"CrossFit\\\",\\\"Personal Trainer\\\"]\"', 'rejected', 17.05, NULL, 24.9791040, 66.8180350, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(44, 5, 11, 'McLaughlin-Quigley Gym', '22213 Hessel Mews\nAubreyside, IA 03926', '06:00:00', '23:00:00', 'At quibusdam consectetur non rem delectus voluptas provident. Ipsum vero harum aut voluptas et consequuntur.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Personal Trainer\\\",\\\"Cardio\\\",\\\"Swimming Pool\\\",\\\"Weights\\\",\\\"CrossFit\\\"]\"', 'pending', 9.97, NULL, 24.9122410, 67.2077420, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(45, 1, 2, 'Bernhard, Goodwin and Feil Gym', '37072 Garland Square Suite 620\nPort Heloise, OH 17959-9756', '06:00:00', '23:00:00', 'Et saepe omnis velit. Dolores harum cupiditate veniam aut unde provident. Reiciendis et ut delectus. Cupiditate quia hic et commodi totam autem.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Sauna\\\",\\\"Yoga Studio\\\",\\\"Weights\\\",\\\"Cardio\\\",\\\"CrossFit\\\"]\"', 'approved', 14.25, NULL, 24.8019350, 67.2958980, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(46, 2, 11, 'Koepp, Stanton and Schuppe Gym', '360 Garth Springs\nBergetown, CA 91484', '06:00:00', '23:00:00', 'Veniam incidunt qui ut eaque est. Ad libero totam quidem mollitia at voluptas.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio\\\",\\\"Yoga Studio\\\",\\\"CrossFit\\\",\\\"Personal Trainer\\\",\\\"Sauna\\\"]\"', 'approved', 10.89, NULL, 24.9431570, 67.1060170, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(47, 3, 9, 'Dach-Bradtke Gym', '186 Kailee Plaza Suite 095\nNew Natalieville, RI 39440', '06:00:00', '23:00:00', 'Reiciendis quia enim accusantium sed nostrum. Non recusandae sit quia distinctio sit.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"CrossFit\\\",\\\"Swimming Pool\\\"]\"', 'pending', 15.49, NULL, 24.9804290, 66.8407620, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(48, 2, 4, 'Cremin-Nader Gym', '1789 Farrell Orchard\nWalkerview, IN 24396-5471', '06:00:00', '23:00:00', 'Similique qui culpa mollitia libero reprehenderit qui aliquam. Consequatur rem mollitia sit. Optio vero reiciendis molestias magnam. Nulla ut beatae quisquam quibusdam et sed natus.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio\\\",\\\"Personal Trainer\\\",\\\"Sauna\\\",\\\"CrossFit\\\"]\"', 'rejected', 17.52, NULL, 24.8062130, 67.2231540, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(49, 2, 11, 'Wolf, Wilkinson and Streich Gym', '84024 Purdy Causeway Apt. 409\nEugeniaberg, IA 04315', '06:00:00', '23:00:00', 'Nostrum et provident quos. Recusandae ut quos alias deserunt autem.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Weights\\\",\\\"Personal Trainer\\\"]\"', 'pending', 10.94, NULL, 24.8768580, 66.8910560, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(50, 1, 4, 'Wolff Inc Gym', '199 Sigmund Crescent Apt. 564\nKoelpinport, SD 45145-6853', '06:00:00', '23:00:00', 'Est ut rerum rem sunt neque dolor totam. Quidem ut qui excepturi vitae. Ipsam sed ipsam eum cum similique.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Sauna\\\",\\\"Personal Trainer\\\",\\\"Swimming Pool\\\",\\\"CrossFit\\\",\\\"Cardio\\\"]\"', 'approved', 6.80, NULL, 24.8555510, 66.8240150, '2025-05-27 06:48:46', '2025-05-27 06:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `gym_classes`
--

CREATE TABLE `gym_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gym_equipment`
--

CREATE TABLE `gym_equipment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `condition` varchar(255) NOT NULL DEFAULT 'good',
  `last_maintenance_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gym_reviews`
--

CREATE TABLE `gym_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `comment` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gym_reviews`
--

INSERT INTO `gym_reviews` (`id`, `gym_id`, `user_id`, `rating`, `comment`, `approved`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 3, 'Dolores ut qui est et neque molestiae ut.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(2, 1, 8, 4, 'In nesciunt non numquam repellat qui adipisci eligendi vitae.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(3, 1, 5, 2, 'Ut voluptatum illum est nemo corrupti sit officiis.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(4, 2, 10, 1, 'Sint eum qui perferendis.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(5, 2, 6, 5, 'Repudiandae quia sint quas deserunt.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(6, 2, 11, 2, 'Sunt quia et et enim et et.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(7, 2, 7, 3, 'Consectetur quidem et at voluptas quidem aut sapiente in.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(8, 2, 3, 1, 'Possimus consequatur fuga rerum iure rerum et sed.', 0, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(9, 2, 5, 3, 'Ea et vero nam officia voluptas et ad.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(10, 2, 9, 4, 'Quas temporibus minus et tenetur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(11, 3, 5, 3, 'Distinctio maxime suscipit nihil et qui quae nisi.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(12, 3, 2, 3, 'Recusandae ea sed molestiae sed officia consequatur qui.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(13, 3, 3, 3, 'Eum nemo assumenda aspernatur illo atque sit ut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(14, 4, 5, 1, 'Eos ab fugit dolorem quo aut ut omnis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(15, 4, 6, 5, 'Repellat ratione ut mollitia accusamus.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(16, 4, 10, 4, 'Adipisci rerum ab quo odit dolores.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(17, 4, 1, 1, 'Impedit qui voluptatibus alias est libero.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(18, 4, 5, 5, 'Pariatur molestiae nulla fugit assumenda est accusantium voluptatem.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(19, 4, 6, 5, 'Et provident at rem vel illum et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(20, 5, 8, 3, 'Sed et non sed maxime.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(21, 5, 5, 4, 'Id ducimus illum ullam soluta quis sunt rerum.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(22, 5, 1, 4, 'Quia aliquid iusto consequatur error ex ut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(23, 5, 8, 2, 'Et vero aut temporibus itaque aut tempore.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(24, 6, 4, 5, 'Magnam accusamus et sit iure nihil maiores.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(25, 6, 8, 1, 'Accusantium et debitis ducimus est est.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(26, 6, 10, 5, 'Autem adipisci repellendus qui vel molestiae quasi et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(27, 6, 6, 3, 'Molestiae sit consequuntur labore animi ut ut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(28, 6, 10, 5, 'Voluptas et blanditiis totam fuga et eum.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(29, 6, 11, 1, 'Ut quis esse in quis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(30, 6, 6, 3, 'Officia quo quia consequatur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(31, 7, 1, 4, 'Velit est sint molestiae labore sit amet hic.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(32, 7, 9, 1, 'Aperiam occaecati qui quia unde repellat nobis saepe.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(33, 7, 3, 3, 'Ullam in nihil fugit magni sed.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(34, 7, 2, 2, 'In cum illo eum provident.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(35, 7, 4, 4, 'Id non reiciendis eaque adipisci autem dolores officiis est.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(36, 7, 8, 2, 'Fugiat aut dolores eos reiciendis voluptatem sit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(37, 8, 10, 1, 'Et labore voluptatibus qui est accusamus minus voluptatem.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(38, 8, 4, 2, 'Sunt distinctio quas porro.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(39, 8, 4, 3, 'Vel corrupti minima sapiente nesciunt qui.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(40, 8, 6, 3, 'Molestiae magnam nulla eum suscipit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(41, 8, 6, 4, 'Optio voluptatem aliquid dolorum maiores.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(42, 8, 7, 5, 'Asperiores eos neque ad delectus quam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(43, 8, 2, 4, 'Quam reiciendis ut temporibus id et qui tempora nihil.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(44, 9, 5, 5, 'Ipsum delectus et consectetur nulla pariatur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(45, 9, 6, 4, 'Quo sint nostrum repellendus.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(46, 9, 5, 4, 'Accusamus debitis nihil enim nobis enim sit dolore.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(47, 9, 11, 1, 'Sapiente adipisci nesciunt quaerat sint occaecati ut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(48, 9, 2, 4, 'Itaque nostrum aliquid qui iusto.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(49, 9, 7, 1, 'Aperiam vel corporis voluptate culpa voluptatem et eaque.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(50, 9, 9, 4, 'Nisi est quidem quia.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(51, 10, 7, 1, 'Omnis illo accusamus nulla libero animi aut illum.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(52, 10, 4, 2, 'Soluta dignissimos excepturi placeat quas adipisci accusamus unde.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(53, 10, 11, 3, 'Cum libero reiciendis voluptatibus repudiandae et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(54, 10, 5, 5, 'Totam omnis et non.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(55, 10, 8, 3, 'Sequi porro quia quia ea.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(56, 10, 7, 3, 'Cupiditate temporibus nulla ducimus voluptatibus.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(57, 10, 2, 1, 'Sed libero est dolorum molestiae.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(58, 11, 4, 3, 'Omnis pariatur commodi voluptas non laudantium quibusdam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(59, 11, 3, 1, 'Omnis quas sit aliquid recusandae officiis blanditiis velit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(60, 11, 7, 3, 'Iusto corporis dicta adipisci.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(61, 11, 3, 3, 'Ut soluta perspiciatis eius voluptatem eligendi assumenda.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(62, 11, 3, 1, 'Incidunt cum voluptates voluptas eos est.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(63, 12, 11, 4, 'Ut fugit vitae expedita nisi assumenda vero ea.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(64, 12, 2, 3, 'Nostrum quia magnam numquam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(65, 12, 8, 2, 'Dolor voluptas explicabo placeat distinctio aliquam similique voluptatibus.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(66, 13, 8, 4, 'Autem accusamus rerum maiores.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(67, 13, 8, 2, 'Delectus qui aut ut laborum officia sit exercitationem.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(68, 13, 10, 2, 'Cupiditate dignissimos temporibus ut quo.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(69, 13, 7, 3, 'Culpa corrupti mollitia explicabo qui.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(70, 13, 10, 3, 'Eius qui dolore omnis similique nam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(71, 13, 6, 2, 'Laudantium quae cumque porro vero enim in.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(72, 13, 8, 1, 'Exercitationem ab deleniti omnis et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(73, 13, 9, 3, 'Impedit ut doloremque fugiat tempora suscipit sed dignissimos voluptate.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(74, 13, 4, 4, 'Dolores magnam quia consequatur tempore vitae.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(75, 14, 2, 3, 'Consequuntur facilis aliquid ipsa perferendis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(76, 14, 9, 4, 'Consequatur dolorem rerum ipsum doloremque.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(77, 14, 5, 1, 'Occaecati natus aut eum natus voluptatem consequatur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(78, 14, 7, 1, 'Laboriosam harum eos accusamus et sequi.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(79, 15, 1, 5, 'Expedita ab illo suscipit velit non aliquam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(80, 15, 5, 3, 'Aut ipsum nihil similique ab qui deserunt.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(81, 15, 10, 5, 'Sed aut repudiandae aut dolorem.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(82, 15, 5, 2, 'Eveniet ipsa voluptate assumenda quos quo.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(83, 15, 5, 2, 'Earum asperiores et dolore et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(84, 15, 8, 1, 'Sit rem sunt consequatur amet est.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(85, 15, 2, 3, 'Autem non amet est tempore.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(86, 16, 6, 2, 'Unde perferendis aut porro.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(87, 16, 2, 1, 'Numquam accusamus impedit reprehenderit atque tenetur reprehenderit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(88, 16, 7, 5, 'Reprehenderit sunt magni delectus.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(89, 16, 8, 3, 'Doloribus assumenda optio sunt facilis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(90, 16, 3, 5, 'Non numquam porro labore adipisci omnis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(91, 17, 10, 5, 'Dolorem rerum facere fugit aut iure blanditiis nam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(92, 17, 9, 4, 'Eaque quaerat nemo fugiat eveniet.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(93, 17, 4, 2, 'Porro magnam accusamus cumque quis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(94, 17, 2, 5, 'Vitae ipsam sequi qui ipsam saepe saepe.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(95, 17, 11, 4, 'Veniam illo quia voluptatem necessitatibus dolorum.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(96, 17, 1, 1, 'Ut sed omnis reiciendis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(97, 18, 3, 3, 'Autem velit provident dolorem veritatis et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(98, 18, 6, 5, 'Et perspiciatis suscipit maiores sapiente et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(99, 18, 3, 3, 'Quo consequatur voluptas deserunt.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(100, 18, 8, 3, 'Voluptates ea maxime suscipit consequuntur veritatis ea eligendi.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(101, 18, 7, 3, 'Quam voluptatem accusantium laudantium sed sunt voluptas et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(102, 18, 2, 2, 'Repellendus sequi eaque sed dignissimos et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(103, 18, 3, 3, 'Ut labore dolorem suscipit numquam veniam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(104, 18, 11, 3, 'Molestiae repellendus officiis corrupti consequatur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(105, 19, 2, 4, 'Quo iure saepe quaerat enim perferendis nisi.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(106, 19, 11, 1, 'Ut aut natus assumenda.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(107, 19, 8, 4, 'Nostrum harum deserunt praesentium ut vero aperiam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(108, 19, 7, 3, 'Temporibus aut nulla eos dolorum dolor qui aut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(109, 19, 3, 2, 'Maxime quibusdam praesentium dolorem et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(110, 19, 8, 1, 'Aut quia facere voluptate natus dolor provident.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(111, 20, 1, 2, 'Velit magni exercitationem architecto magnam consequuntur et voluptatem.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(112, 20, 2, 2, 'Qui tenetur earum in in aspernatur vel.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(113, 20, 6, 1, 'Aut qui velit maiores mollitia veritatis sint.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(114, 20, 1, 1, 'Modi in optio temporibus soluta labore qui.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(115, 20, 9, 3, 'Quia occaecati aliquid dolor ab et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(116, 20, 8, 5, 'Molestiae et corrupti voluptate et explicabo.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(117, 21, 2, 1, 'Quas quisquam fugiat at voluptas voluptas amet.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(118, 21, 4, 5, 'Necessitatibus et necessitatibus qui reiciendis quia omnis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(119, 21, 9, 2, 'Ex fugiat suscipit in.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(120, 21, 10, 5, 'Deleniti nihil nulla et animi officia minima explicabo.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(121, 21, 11, 5, 'Nostrum sint officia officia et fugiat ipsum et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(122, 22, 6, 5, 'Itaque quia possimus repellat amet.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(123, 22, 9, 4, 'Qui eos possimus aliquid excepturi voluptatum tempore.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(124, 22, 9, 3, 'Voluptates sapiente pariatur aliquid ratione.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(125, 22, 4, 5, 'Minima provident rerum est velit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(126, 22, 5, 5, 'Architecto a illo quasi alias soluta autem quaerat.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(127, 22, 10, 3, 'Dolor sit ut qui.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(128, 22, 7, 1, 'Expedita saepe et dolore.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(129, 23, 10, 2, 'Et tempora ea ut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(130, 23, 11, 1, 'Eum dicta nihil aut blanditiis dolor blanditiis magni.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(131, 23, 3, 2, 'Dolorem voluptatibus omnis facere optio debitis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(132, 23, 11, 5, 'Dicta dolorum soluta velit rerum.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(133, 24, 6, 2, 'Iure consectetur autem et perspiciatis omnis quia maxime.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(134, 24, 10, 2, 'Nihil animi nam beatae repellendus a ea.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(135, 24, 4, 4, 'Voluptas natus odio est maiores veritatis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(136, 24, 6, 4, 'At praesentium perspiciatis reprehenderit ut tempore.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(137, 24, 2, 4, 'Qui in maxime amet ducimus natus omnis provident.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(138, 24, 7, 1, 'Et facilis asperiores corrupti enim fugit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(139, 24, 9, 1, 'Veniam velit perspiciatis maiores saepe facilis cumque.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(140, 25, 2, 3, 'Debitis placeat nihil aliquid quo a totam assumenda.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(141, 25, 11, 4, 'Nihil officiis eos ea aperiam illum numquam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(142, 25, 8, 2, 'Quis officia vel earum quis et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(143, 25, 7, 5, 'Dolores distinctio quo inventore suscipit error dolor.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(144, 26, 10, 2, 'Autem ab laboriosam minus eligendi quia qui.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(145, 26, 7, 4, 'Sunt delectus debitis et dolorem praesentium impedit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(146, 26, 5, 2, 'In et est voluptas vitae officia.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(147, 26, 9, 2, 'Eius voluptas exercitationem ducimus amet velit modi enim.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(148, 26, 1, 5, 'Qui quas ipsum itaque voluptatum sed consequuntur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(149, 27, 10, 2, 'Adipisci sapiente et consequuntur quis.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(150, 27, 6, 3, 'Sunt voluptatem eius deserunt facere adipisci in sunt numquam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(151, 27, 9, 4, 'Voluptatem distinctio veniam ut dolorum repellat expedita.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(152, 27, 7, 2, 'Et provident velit aut architecto corrupti id et.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(153, 28, 11, 1, 'Necessitatibus aperiam aut eveniet praesentium rerum est.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(154, 28, 4, 5, 'Placeat voluptatum similique voluptatibus fugit repellendus.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(155, 28, 6, 3, 'Ut accusantium magnam tempora et et voluptate.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(156, 28, 9, 4, 'Nemo aperiam rerum dicta ut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(157, 28, 6, 5, 'Voluptatem autem eius unde asperiores sapiente consequatur.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(158, 28, 2, 5, 'Atque inventore non necessitatibus occaecati quia id.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(159, 28, 8, 1, 'Libero suscipit atque ipsam dicta perferendis at quas.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(160, 28, 9, 5, 'Optio dolore est fugit enim optio.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(161, 29, 2, 3, 'Ab nihil adipisci magni sequi est.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(162, 29, 4, 1, 'Quo numquam aut ad est praesentium itaque.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(163, 29, 5, 2, 'Rerum nihil et cumque culpa est expedita.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(164, 29, 10, 4, 'Voluptatum quibusdam tempora eligendi voluptatibus eum consequatur sequi provident.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(165, 29, 5, 2, 'Sit voluptate labore dolor eum aut.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(166, 29, 4, 3, 'Velit tempora tenetur dolores hic.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(167, 29, 5, 1, 'Aliquid aut voluptate dignissimos voluptatem rerum.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(168, 30, 9, 1, 'Et quis repellat nostrum molestiae exercitationem.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(169, 30, 6, 4, 'Et voluptatem eaque quia sed.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(170, 30, 6, 5, 'Cum neque sint ipsam id sit.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(171, 31, 3, 1, 'Ut optio est veritatis aperiam nulla suscipit cupiditate.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(172, 31, 6, 3, 'Veritatis et mollitia aut similique blanditiis labore natus error.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(173, 31, 3, 4, 'Ducimus tenetur omnis deserunt eaque.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(174, 31, 6, 1, 'Ullam magni vitae eum tempora sed.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(175, 31, 1, 4, 'Aut officia impedit unde laboriosam.', 0, '2025-05-27 06:48:49', '2025-05-27 06:48:49'),
(176, 32, 8, 5, 'Consequuntur et ratione ad consequatur perspiciatis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(177, 32, 8, 5, 'Corporis rerum natus nobis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(178, 32, 5, 2, 'Molestias fuga culpa inventore amet consequatur.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(179, 32, 11, 4, 'Placeat nulla facere aliquam omnis ea quia aut.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(180, 33, 9, 2, 'Omnis est exercitationem distinctio debitis quaerat mollitia.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(181, 33, 5, 5, 'Ut odit dolorem officia doloremque dolores velit laborum itaque.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(182, 33, 1, 4, 'Esse ut placeat laborum neque similique.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(183, 34, 1, 2, 'Esse ad et eum ut id.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(184, 34, 2, 5, 'Vitae quo eligendi vel.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(185, 34, 2, 5, 'Sint esse culpa sit provident id laudantium tempore.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(186, 34, 3, 5, 'Et assumenda et quia qui sed odit enim sit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(187, 34, 2, 5, 'Nobis sit velit quae veniam et quo.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(188, 34, 7, 3, 'Quidem illo quibusdam doloribus laboriosam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(189, 34, 1, 1, 'Error explicabo molestiae mollitia temporibus quis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(190, 34, 11, 5, 'Molestiae dolor quas repellat voluptate amet inventore.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(191, 34, 11, 2, 'Qui inventore eius ipsa praesentium aliquam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(192, 35, 6, 4, 'Ratione perspiciatis velit eius et voluptate perspiciatis assumenda.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(193, 35, 11, 3, 'Aspernatur vel quos in ad quo est consequatur.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(194, 35, 3, 1, 'Quos ad totam voluptatem dolorem aliquam nemo vel.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(195, 35, 11, 4, 'Id exercitationem quia sequi similique optio.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(196, 35, 10, 4, 'Sit est officiis autem nobis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(197, 35, 5, 4, 'Iure voluptatem minus ipsum repellendus velit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(198, 35, 2, 1, 'Excepturi neque consequuntur possimus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(199, 36, 1, 3, 'Dolores et nostrum doloremque et et quis laboriosam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(200, 36, 9, 4, 'Dolor eveniet ea necessitatibus sed.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(201, 36, 2, 2, 'Doloribus similique voluptatum maxime rerum quia occaecati perferendis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(202, 36, 2, 1, 'Minus repudiandae doloribus aut.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(203, 36, 3, 5, 'Quas ad quaerat dolores.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(204, 36, 5, 4, 'Debitis minima dolorem aut architecto.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(205, 37, 1, 3, 'Voluptatem error voluptatum recusandae voluptas in et et molestiae.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(206, 37, 8, 2, 'Et animi qui laboriosam cum accusamus voluptatum soluta.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(207, 37, 5, 2, 'Commodi est cumque voluptatibus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(208, 37, 2, 4, 'Perferendis ipsum illum quia saepe rerum temporibus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(209, 37, 2, 3, 'Omnis nesciunt occaecati doloremque aliquam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(210, 38, 8, 2, 'Quaerat perspiciatis hic quidem consequuntur perferendis magni voluptatem fugit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(211, 38, 4, 4, 'Porro odit inventore nobis animi.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(212, 38, 1, 1, 'Ut laborum et aperiam sequi ex sint ut.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(213, 39, 4, 1, 'Enim rerum optio cupiditate voluptatibus molestias iure.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(214, 39, 10, 1, 'Vel placeat voluptatem et delectus mollitia.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(215, 39, 5, 3, 'Animi soluta sed quidem iure aspernatur.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(216, 39, 11, 4, 'Aspernatur ex pariatur fugit facere quas.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(217, 40, 3, 3, 'Consequatur nemo aut similique voluptatem.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(218, 40, 3, 1, 'Ea debitis qui voluptas libero in impedit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(219, 40, 4, 3, 'Nesciunt delectus a possimus aut aliquam voluptatibus eum in.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(220, 40, 11, 4, 'Odio dolores rerum necessitatibus et facilis aliquid.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(221, 40, 6, 2, 'Magni et quaerat qui vel.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(222, 41, 5, 5, 'Eaque rem quasi maxime labore cupiditate.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(223, 41, 6, 4, 'Aut ut debitis molestiae temporibus nihil occaecati rerum velit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(224, 41, 7, 3, 'Aut sint ex illo ea.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(225, 41, 8, 4, 'Voluptatibus recusandae et nam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(226, 41, 4, 5, 'Aliquid voluptate dolor totam error.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(227, 41, 7, 1, 'Error id assumenda porro voluptatum temporibus sunt vero.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(228, 42, 11, 4, 'Cumque et molestiae aut tempora incidunt.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(229, 42, 5, 4, 'Ex nisi nostrum vitae illum corrupti perspiciatis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(230, 42, 6, 3, 'Saepe consequatur aut consequatur esse ea ut incidunt.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(231, 42, 5, 3, 'Voluptatem dolorum neque optio ipsa laboriosam rerum dolores.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(232, 42, 7, 1, 'Nemo ullam distinctio blanditiis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(233, 42, 1, 4, 'Quibusdam praesentium sunt itaque voluptas.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(234, 43, 11, 2, 'Occaecati ducimus animi alias praesentium voluptatibus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(235, 43, 11, 1, 'Ut omnis sequi repellat rem est praesentium odio.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(236, 43, 11, 3, 'Sint et adipisci accusamus velit odit impedit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(237, 43, 9, 5, 'Reiciendis laudantium ullam et consequatur doloribus qui aut.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(238, 43, 11, 1, 'Qui corporis non id quo tempora consequatur sit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(239, 44, 10, 2, 'Exercitationem et velit maiores eos occaecati.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(240, 44, 10, 5, 'Aut unde voluptatem delectus sed adipisci occaecati.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(241, 44, 3, 4, 'Dolor est rerum voluptatem et nemo officiis sunt.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(242, 44, 9, 5, 'Distinctio facere accusantium dolor dolores debitis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(243, 44, 6, 3, 'Natus iste aut corporis animi.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(244, 44, 1, 3, 'Sint neque eos eveniet qui et.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(245, 45, 1, 3, 'Asperiores repellendus corrupti vero similique odio distinctio esse.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(246, 45, 9, 3, 'Vel ex dicta in totam ut voluptatem.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(247, 45, 9, 1, 'Repellat qui autem ut est.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(248, 45, 9, 1, 'Rerum quidem laboriosam ratione et doloremque pariatur eum sit.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(249, 45, 8, 4, 'Perspiciatis et sapiente voluptas nam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(250, 45, 2, 4, 'Facere et ullam dolore rerum.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(251, 45, 5, 1, 'Praesentium dolores non iure.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(252, 45, 7, 2, 'Iure praesentium asperiores aut quas qui.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(253, 45, 5, 5, 'Animi explicabo et explicabo qui tenetur pariatur.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(254, 46, 9, 1, 'Dolore quo rerum doloribus nisi ut nulla tempore.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(255, 46, 10, 5, 'Ut error praesentium nesciunt vel quia.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(256, 46, 2, 4, 'Ea porro quia labore ratione et.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(257, 47, 2, 3, 'Possimus alias deleniti dolorem corrupti commodi ea officiis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(258, 47, 10, 3, 'Dicta aut voluptas ut debitis blanditiis quam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(259, 47, 9, 4, 'Reprehenderit qui iure voluptas.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(260, 47, 11, 3, 'Et harum autem quis quia odit eius facilis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(261, 47, 9, 1, 'Cum magnam animi quisquam libero iure.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(262, 48, 9, 5, 'Voluptate iusto earum error omnis.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(263, 48, 9, 2, 'Accusantium id aut voluptate natus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(264, 48, 10, 5, 'Ipsa temporibus nostrum sit et eius dolor rerum.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(265, 49, 5, 2, 'Deserunt placeat aut quaerat illo at.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(266, 49, 3, 4, 'Expedita aliquam totam consectetur veniam sed voluptatem aliquam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(267, 49, 11, 2, 'Sed reprehenderit ut consectetur quis illum possimus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(268, 49, 8, 5, 'Reiciendis cum voluptas rerum quam pariatur assumenda porro enim.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(269, 49, 4, 4, 'Omnis sed provident dolorem et sint quidem ex.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(270, 49, 8, 1, 'Esse velit cupiditate in sed distinctio earum doloremque.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(271, 49, 9, 3, 'Quidem maiores amet consequatur est est voluptas unde possimus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(272, 49, 10, 5, 'Eligendi aut totam amet delectus.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(273, 50, 8, 1, 'Iusto quae non laudantium.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(274, 50, 8, 1, 'Voluptatibus unde dignissimos ipsa ipsa repellendus nulla eaque veniam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(275, 50, 3, 2, 'Soluta architecto quae tempore ullam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(276, 50, 9, 4, 'Et assumenda officia rerum voluptatem architecto.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(277, 50, 4, 4, 'Rem deserunt doloribus maxime saepe ipsum magnam.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(278, 50, 4, 5, 'Ut architecto aperiam fugiat voluptatum quia tenetur.', 0, '2025-05-27 06:48:50', '2025-05-27 06:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `gym_visits`
--

CREATE TABLE `gym_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `check_in_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `check_out_at` timestamp NULL DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gym_visits`
--

INSERT INTO `gym_visits` (`id`, `gym_id`, `user_id`, `check_in_at`, `check_out_at`, `duration_minutes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-05-24 05:11:41', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(2, 1, 1, '2025-03-12 08:23:16', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(3, 1, 6, '2025-03-19 19:48:39', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(4, 1, 7, '2025-04-08 20:58:23', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(5, 1, 7, '2024-11-30 08:13:37', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(6, 1, 1, '2025-01-28 04:55:37', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(7, 2, 8, '2025-03-30 09:17:58', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(8, 2, 9, '2025-02-18 01:22:47', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(9, 2, 3, '2025-01-28 10:38:29', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(10, 2, 5, '2025-05-07 08:28:22', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(11, 2, 1, '2025-01-26 21:54:53', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(12, 2, 2, '2024-12-22 12:24:23', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(13, 2, 5, '2025-05-02 06:11:31', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(14, 2, 2, '2024-12-11 17:16:08', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(15, 2, 11, '2025-01-16 15:35:24', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(16, 2, 6, '2025-01-15 19:41:48', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(17, 2, 9, '2025-01-27 02:32:48', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(18, 3, 1, '2025-04-11 16:37:36', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(19, 3, 8, '2025-05-12 13:48:09', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(20, 3, 10, '2025-05-12 16:48:42', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(21, 3, 8, '2025-01-12 01:43:57', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(22, 3, 11, '2025-02-05 17:25:47', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(23, 3, 10, '2025-03-24 07:28:52', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(24, 4, 4, '2025-05-23 06:01:06', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(25, 4, 3, '2024-12-28 03:16:52', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(26, 4, 6, '2025-01-22 02:13:16', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(27, 4, 8, '2025-04-08 16:08:52', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(28, 4, 9, '2025-05-21 12:09:02', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(29, 4, 8, '2025-03-26 04:45:43', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(30, 4, 10, '2025-02-05 01:05:25', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(31, 4, 10, '2024-12-01 08:42:04', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(32, 4, 3, '2025-01-01 00:32:07', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(33, 5, 8, '2025-05-12 15:00:48', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(34, 5, 3, '2025-05-11 20:28:37', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(35, 5, 10, '2025-04-27 17:43:26', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(36, 5, 5, '2025-05-22 04:04:21', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(37, 5, 7, '2025-01-25 11:58:09', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(38, 5, 2, '2024-12-23 00:26:04', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(39, 5, 1, '2025-05-19 22:14:12', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(40, 5, 5, '2025-04-02 15:38:54', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(41, 5, 11, '2025-04-27 01:26:09', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(42, 6, 7, '2025-01-27 19:03:52', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(43, 6, 8, '2025-04-12 04:05:42', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(44, 6, 9, '2025-05-17 15:16:20', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(45, 6, 3, '2025-05-01 10:09:11', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(46, 6, 4, '2025-01-22 16:56:50', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(47, 6, 7, '2025-01-29 13:37:11', NULL, NULL, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(48, 6, 5, '2025-05-04 18:53:09', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(49, 7, 8, '2025-01-13 14:38:08', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(50, 7, 2, '2025-01-06 18:15:52', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(51, 7, 9, '2025-01-20 11:09:44', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(52, 7, 2, '2025-04-06 20:27:15', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(53, 7, 3, '2025-03-14 15:09:04', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(54, 7, 1, '2025-03-23 01:37:23', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(55, 7, 6, '2024-12-23 14:27:04', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(56, 7, 2, '2025-04-30 09:08:02', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(57, 7, 6, '2025-05-05 23:13:45', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(58, 7, 4, '2025-03-15 03:28:28', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(59, 7, 4, '2025-04-02 02:21:55', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(60, 7, 2, '2025-02-01 22:16:30', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(61, 8, 10, '2025-02-21 06:20:50', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(62, 8, 1, '2025-04-21 01:00:22', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(63, 8, 3, '2025-02-28 01:01:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(64, 8, 2, '2025-04-20 21:24:49', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(65, 8, 9, '2025-04-22 11:57:53', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(66, 8, 9, '2025-02-11 21:32:45', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(67, 9, 2, '2025-02-19 08:42:54', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(68, 9, 3, '2024-12-31 18:05:01', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(69, 9, 10, '2025-04-13 10:20:25', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(70, 9, 4, '2024-12-02 21:03:47', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(71, 9, 8, '2025-02-09 17:16:53', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(72, 9, 7, '2025-02-17 01:57:37', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(73, 9, 11, '2025-01-29 20:20:57', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(74, 9, 9, '2025-04-23 05:08:39', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(75, 9, 7, '2025-05-12 11:05:15', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(76, 9, 9, '2025-03-24 17:44:50', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(77, 9, 1, '2025-02-24 20:16:24', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(78, 9, 9, '2025-01-17 23:46:26', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(79, 10, 7, '2025-05-14 09:54:55', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(80, 10, 7, '2024-12-09 21:00:33', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(81, 10, 11, '2025-01-29 00:08:18', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(82, 10, 2, '2025-05-04 00:29:37', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(83, 10, 7, '2025-01-11 06:37:25', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(84, 10, 3, '2024-12-13 03:49:28', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(85, 10, 7, '2025-04-02 00:40:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(86, 11, 9, '2025-03-11 15:28:44', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(87, 11, 5, '2025-05-17 12:56:45', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(88, 11, 11, '2025-01-09 15:06:04', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(89, 11, 1, '2025-01-20 02:56:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(90, 11, 5, '2025-04-10 20:02:03', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(91, 11, 2, '2025-01-06 03:26:41', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(92, 11, 9, '2025-04-22 05:21:58', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(93, 11, 2, '2025-04-14 22:37:29', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(94, 12, 11, '2025-03-04 06:40:43', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(95, 12, 7, '2025-01-30 11:42:05', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(96, 12, 2, '2025-02-18 23:27:59', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(97, 12, 10, '2025-02-16 21:49:22', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(98, 12, 10, '2025-05-14 21:11:01', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(99, 12, 8, '2025-04-07 19:59:26', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(100, 12, 11, '2025-02-20 15:45:10', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(101, 12, 11, '2025-01-14 21:33:06', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(102, 12, 6, '2025-03-12 06:14:57', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(103, 12, 10, '2025-03-08 09:16:38', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(104, 13, 10, '2025-03-30 18:09:19', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(105, 13, 11, '2025-03-20 19:15:54', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(106, 13, 10, '2025-04-22 21:38:43', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(107, 13, 2, '2025-02-22 20:17:44', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(108, 13, 11, '2024-12-28 02:25:12', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(109, 13, 3, '2025-03-05 01:07:09', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(110, 13, 5, '2025-03-20 16:57:27', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(111, 13, 5, '2025-02-28 14:59:54', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(112, 13, 7, '2025-02-20 15:59:04', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(113, 14, 11, '2025-01-13 01:23:53', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(114, 14, 9, '2025-03-14 07:41:22', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(115, 14, 10, '2025-02-28 12:39:46', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(116, 14, 7, '2025-01-03 04:15:26', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(117, 14, 9, '2025-04-14 23:58:10', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(118, 14, 11, '2025-04-12 05:02:24', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(119, 14, 1, '2024-12-31 17:45:38', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(120, 15, 7, '2025-02-20 22:04:03', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(121, 15, 2, '2025-01-26 22:47:48', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(122, 15, 6, '2025-04-02 09:56:15', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(123, 15, 5, '2024-12-14 00:42:54', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(124, 15, 2, '2024-12-31 01:26:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(125, 15, 2, '2025-03-31 03:07:48', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(126, 16, 8, '2024-12-18 07:35:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(127, 16, 4, '2025-04-14 17:47:01', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(128, 16, 11, '2025-05-07 02:16:31', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(129, 16, 5, '2025-05-20 00:05:14', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(130, 16, 6, '2025-04-01 02:58:56', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(131, 16, 8, '2025-01-30 04:57:16', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(132, 16, 7, '2025-01-09 23:18:17', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(133, 16, 11, '2025-02-04 09:55:38', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(134, 16, 4, '2025-01-30 16:28:08', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(135, 17, 8, '2025-04-08 05:17:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(136, 17, 7, '2025-03-03 00:24:46', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(137, 17, 1, '2025-01-27 14:37:50', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(138, 17, 10, '2024-12-29 01:26:58', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(139, 17, 2, '2024-12-01 16:02:03', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(140, 17, 1, '2025-02-12 11:46:11', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(141, 17, 4, '2025-04-25 08:22:48', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(142, 18, 8, '2025-04-07 06:08:29', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(143, 18, 6, '2025-04-08 12:48:08', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(144, 18, 11, '2025-02-23 05:05:14', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(145, 18, 5, '2025-01-24 20:37:20', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(146, 18, 4, '2025-05-06 23:44:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(147, 18, 4, '2025-04-18 23:49:57', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(148, 19, 5, '2025-05-12 22:44:30', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(149, 19, 3, '2024-12-24 11:49:26', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(150, 19, 2, '2025-05-18 12:49:30', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(151, 19, 6, '2025-05-04 19:42:58', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(152, 19, 1, '2025-03-04 22:22:31', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(153, 19, 9, '2025-03-28 14:39:52', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(154, 19, 3, '2025-05-17 21:33:16', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(155, 19, 10, '2025-05-22 13:44:45', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(156, 20, 5, '2024-12-25 14:40:04', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(157, 20, 1, '2025-04-04 13:48:36', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(158, 20, 3, '2025-03-22 19:57:10', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(159, 20, 10, '2025-01-14 13:52:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(160, 20, 6, '2025-03-03 06:28:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(161, 20, 4, '2025-03-02 05:24:25', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(162, 20, 9, '2025-03-06 03:54:39', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(163, 20, 6, '2025-03-15 21:01:33', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(164, 20, 6, '2024-12-14 12:13:03', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(165, 20, 3, '2024-12-10 16:58:37', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(166, 20, 4, '2024-12-28 15:02:21', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(167, 20, 8, '2025-04-15 21:33:13', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(168, 20, 9, '2025-05-14 21:41:32', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(169, 21, 9, '2024-12-02 15:05:26', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(170, 21, 6, '2025-01-12 18:54:08', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(171, 21, 2, '2024-12-19 11:25:19', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(172, 21, 10, '2025-03-03 02:22:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(173, 21, 10, '2025-03-28 18:13:56', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(174, 21, 10, '2025-03-03 06:28:56', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(175, 21, 4, '2025-02-24 13:55:29', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(176, 21, 1, '2025-05-10 08:54:31', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(177, 22, 11, '2024-12-23 10:23:42', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(178, 22, 4, '2025-02-13 04:43:24', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(179, 22, 6, '2025-02-27 20:35:09', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(180, 22, 8, '2025-01-05 20:19:42', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(181, 22, 8, '2025-04-21 10:05:02', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(182, 22, 4, '2025-04-06 18:28:19', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(183, 22, 5, '2025-04-18 14:40:45', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(184, 22, 5, '2025-03-11 19:48:05', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(185, 22, 3, '2025-05-01 19:08:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(186, 22, 10, '2025-04-07 12:48:01', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(187, 23, 5, '2025-05-07 08:35:22', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(188, 23, 1, '2025-04-10 03:33:07', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(189, 23, 5, '2025-01-20 06:05:38', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(190, 23, 2, '2025-05-19 17:15:48', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(191, 23, 5, '2025-02-18 07:21:12', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(192, 24, 6, '2025-01-27 15:08:48', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(193, 24, 3, '2025-02-02 07:41:58', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(194, 24, 5, '2025-01-24 05:18:37', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(195, 24, 3, '2024-12-30 16:13:32', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(196, 24, 6, '2025-04-17 13:49:10', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(197, 25, 8, '2025-04-16 22:33:33', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(198, 25, 4, '2025-01-02 13:49:00', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(199, 25, 2, '2025-05-15 22:47:11', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(200, 25, 10, '2025-02-05 20:31:36', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(201, 25, 7, '2025-01-17 21:45:59', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(202, 25, 10, '2025-04-29 08:31:48', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(203, 25, 2, '2025-01-24 05:04:40', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(204, 25, 1, '2025-02-04 15:32:49', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(205, 25, 5, '2025-03-22 06:58:18', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(206, 25, 10, '2025-03-11 14:27:04', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(207, 25, 2, '2025-05-15 19:09:17', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(208, 26, 7, '2025-03-25 09:30:38', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(209, 26, 7, '2025-01-04 10:48:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(210, 26, 11, '2025-01-01 21:15:47', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(211, 26, 6, '2025-04-24 23:44:31', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(212, 26, 3, '2025-03-22 13:24:52', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(213, 26, 5, '2025-02-11 12:27:50', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(214, 26, 9, '2025-01-12 16:25:03', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(215, 26, 8, '2025-04-08 15:34:09', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(216, 26, 1, '2025-04-15 07:06:40', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(217, 26, 8, '2025-02-08 14:08:07', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(218, 26, 10, '2025-05-20 23:35:11', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(219, 27, 2, '2025-05-22 04:54:51', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(220, 27, 10, '2024-12-07 19:14:41', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(221, 27, 9, '2025-02-03 14:03:28', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(222, 27, 10, '2025-04-28 14:31:52', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(223, 27, 7, '2025-03-19 13:59:30', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(224, 27, 1, '2025-04-01 23:47:31', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(225, 27, 7, '2024-12-09 23:46:10', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(226, 27, 7, '2024-12-04 02:33:16', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(227, 27, 11, '2025-03-22 02:31:00', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(228, 28, 9, '2025-01-03 22:17:27', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(229, 28, 11, '2025-02-19 08:29:28', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(230, 28, 9, '2024-12-22 02:29:14', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(231, 28, 6, '2025-04-17 03:18:39', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(232, 28, 2, '2024-12-10 06:43:28', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(233, 28, 5, '2025-01-04 04:26:00', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(234, 28, 8, '2025-01-23 17:41:47', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(235, 29, 11, '2025-05-07 17:24:13', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(236, 29, 6, '2025-03-28 17:57:39', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(237, 29, 3, '2025-02-09 02:43:27', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(238, 29, 2, '2025-02-18 09:46:33', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(239, 29, 1, '2025-04-03 09:17:35', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(240, 29, 2, '2025-02-26 14:30:37', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(241, 29, 3, '2025-01-01 01:21:09', NULL, NULL, '2025-05-27 06:48:47', '2025-05-27 06:48:47'),
(242, 29, 4, '2025-04-13 08:21:34', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(243, 29, 7, '2025-04-01 05:57:38', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(244, 29, 1, '2024-12-08 19:08:56', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(245, 29, 10, '2025-04-17 08:49:01', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(246, 29, 5, '2025-01-28 04:33:18', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(247, 30, 11, '2025-03-17 23:39:07', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(248, 30, 3, '2025-04-17 18:52:07', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(249, 30, 9, '2024-12-13 15:10:36', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(250, 30, 11, '2024-12-18 04:14:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(251, 30, 7, '2025-05-17 21:50:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(252, 30, 7, '2024-12-02 12:40:53', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(253, 30, 3, '2024-12-18 15:42:01', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(254, 30, 9, '2024-12-07 14:59:49', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(255, 30, 10, '2025-02-06 04:19:54', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(256, 30, 8, '2024-12-12 03:06:16', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(257, 30, 2, '2025-04-21 00:20:41', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(258, 30, 7, '2025-04-13 20:45:15', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(259, 31, 10, '2024-12-16 17:49:21', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(260, 31, 9, '2024-12-18 08:42:17', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(261, 31, 4, '2025-05-15 22:41:03', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(262, 31, 2, '2025-04-25 07:45:54', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(263, 31, 1, '2025-05-07 11:51:54', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(264, 31, 1, '2024-12-16 01:05:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(265, 31, 6, '2025-04-19 02:19:17', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(266, 32, 3, '2025-01-20 06:48:42', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(267, 32, 2, '2025-02-20 01:52:22', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(268, 32, 6, '2025-03-18 06:12:37', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(269, 32, 6, '2025-05-03 21:53:18', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(270, 32, 3, '2025-04-29 02:56:52', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(271, 32, 2, '2024-12-28 22:45:15', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(272, 32, 7, '2025-05-04 03:00:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(273, 32, 7, '2025-04-19 00:55:11', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(274, 32, 4, '2025-04-14 23:34:59', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(275, 32, 3, '2025-01-23 09:13:31', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(276, 33, 6, '2025-03-28 20:39:45', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(277, 33, 6, '2025-01-21 03:16:05', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(278, 33, 9, '2025-01-16 10:31:15', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(279, 33, 2, '2024-12-31 14:18:51', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(280, 33, 10, '2025-01-05 13:05:53', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(281, 33, 5, '2025-04-06 14:12:42', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(282, 34, 2, '2025-02-23 14:35:03', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(283, 34, 2, '2025-05-22 06:57:37', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(284, 34, 7, '2025-02-24 13:10:48', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(285, 34, 5, '2025-05-16 23:34:13', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(286, 34, 11, '2025-05-16 11:10:00', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(287, 35, 1, '2025-03-07 20:27:07', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(288, 35, 9, '2025-02-22 08:20:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(289, 35, 6, '2025-05-11 12:49:32', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(290, 35, 11, '2024-12-25 14:31:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(291, 35, 6, '2025-01-29 16:02:43', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(292, 35, 6, '2025-03-07 23:41:41', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(293, 35, 4, '2025-03-25 08:50:32', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(294, 36, 4, '2025-03-26 14:38:57', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(295, 36, 10, '2024-12-20 00:01:59', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(296, 36, 11, '2024-11-28 08:57:31', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(297, 36, 7, '2025-03-23 22:32:50', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(298, 36, 5, '2025-04-15 06:11:22', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(299, 36, 5, '2025-01-07 17:32:08', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(300, 36, 5, '2025-01-12 19:17:14', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(301, 36, 3, '2024-12-21 17:41:35', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(302, 37, 11, '2025-05-03 10:50:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(303, 37, 8, '2025-02-06 14:48:24', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(304, 37, 2, '2025-03-19 19:54:11', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(305, 37, 7, '2025-01-16 21:12:26', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(306, 37, 10, '2025-03-31 07:18:19', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(307, 37, 4, '2025-05-10 08:39:43', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(308, 37, 3, '2025-02-12 04:56:04', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(309, 37, 4, '2025-01-09 16:00:38', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(310, 37, 7, '2025-02-16 05:07:21', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(311, 38, 9, '2025-03-26 13:39:23', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(312, 38, 3, '2025-02-28 03:49:44', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(313, 38, 2, '2025-03-25 14:28:30', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(314, 38, 4, '2024-12-24 07:19:55', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(315, 38, 4, '2025-04-03 23:34:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(316, 38, 8, '2024-12-13 04:26:27', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(317, 38, 11, '2024-12-01 00:31:36', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(318, 38, 9, '2025-05-15 22:38:55', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(319, 38, 4, '2025-02-19 16:32:05', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(320, 39, 7, '2025-02-12 03:40:57', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(321, 39, 10, '2025-02-05 21:31:11', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(322, 39, 1, '2025-01-07 18:24:57', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(323, 39, 8, '2025-04-28 04:13:04', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(324, 39, 8, '2025-02-09 02:21:46', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(325, 39, 4, '2025-02-26 15:42:39', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(326, 39, 9, '2025-01-27 21:15:59', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(327, 39, 3, '2025-03-19 19:34:52', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(328, 39, 7, '2025-04-17 07:55:51', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(329, 39, 7, '2025-01-06 10:41:03', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(330, 39, 10, '2025-03-25 09:31:37', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(331, 39, 2, '2025-01-21 16:53:16', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(332, 39, 6, '2025-04-24 22:04:02', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(333, 40, 11, '2024-12-16 19:40:29', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(334, 40, 7, '2024-12-04 08:08:31', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(335, 40, 10, '2025-01-24 11:53:33', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(336, 40, 6, '2025-04-04 18:08:16', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(337, 40, 5, '2025-01-24 21:53:43', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(338, 40, 11, '2025-03-14 06:34:58', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(339, 40, 1, '2025-05-17 11:02:51', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(340, 40, 6, '2025-03-01 10:04:39', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(341, 40, 10, '2025-01-29 02:27:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(342, 40, 11, '2025-03-09 13:16:01', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(343, 40, 8, '2024-12-16 19:21:07', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(344, 40, 4, '2025-02-20 08:56:12', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(345, 40, 7, '2025-01-25 04:05:15', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(346, 41, 5, '2025-04-03 13:27:14', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(347, 41, 10, '2025-05-17 10:50:21', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(348, 41, 5, '2025-04-01 02:08:32', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(349, 41, 9, '2025-04-26 21:08:08', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(350, 41, 11, '2025-04-02 20:39:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(351, 42, 10, '2025-02-15 09:21:23', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(352, 42, 4, '2025-02-01 17:10:42', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(353, 42, 3, '2025-02-04 19:03:23', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(354, 42, 4, '2025-02-03 14:31:44', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(355, 42, 10, '2025-05-23 03:45:29', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(356, 42, 9, '2025-04-22 15:54:50', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(357, 42, 8, '2025-02-11 17:37:16', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(358, 42, 2, '2025-01-13 05:34:44', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(359, 42, 2, '2025-03-27 08:27:27', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(360, 42, 3, '2025-01-01 08:09:22', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(361, 43, 10, '2025-03-19 08:56:38', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(362, 43, 1, '2025-03-28 01:52:33', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(363, 43, 6, '2025-01-19 06:42:51', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(364, 43, 6, '2025-03-04 06:12:56', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(365, 43, 11, '2025-02-15 03:34:52', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(366, 43, 7, '2025-04-16 00:14:45', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(367, 43, 9, '2025-01-20 03:13:14', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(368, 44, 9, '2024-12-26 18:20:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(369, 44, 1, '2024-12-04 20:10:15', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(370, 44, 7, '2024-12-19 17:51:34', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(371, 44, 4, '2025-03-21 21:09:36', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(372, 44, 11, '2025-05-10 03:16:23', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(373, 44, 5, '2025-03-07 17:27:39', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(374, 45, 7, '2025-04-27 07:40:36', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(375, 45, 7, '2025-02-09 02:28:48', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(376, 45, 6, '2025-02-06 13:46:30', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(377, 45, 3, '2025-02-15 08:39:36', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(378, 45, 8, '2025-03-01 23:17:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(379, 45, 10, '2025-02-20 22:12:27', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(380, 45, 8, '2025-04-04 05:56:09', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(381, 46, 11, '2025-04-08 21:39:40', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(382, 46, 6, '2025-05-04 20:43:05', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(383, 46, 11, '2025-04-16 05:11:25', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(384, 46, 8, '2025-02-04 11:57:05', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(385, 46, 7, '2024-12-20 11:43:15', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(386, 46, 4, '2025-01-10 05:00:14', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(387, 46, 3, '2024-12-14 03:18:50', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(388, 46, 4, '2025-05-08 04:44:17', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(389, 47, 6, '2025-03-31 22:57:30', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(390, 47, 10, '2025-04-20 20:01:05', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(391, 47, 6, '2025-03-22 12:28:14', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(392, 47, 9, '2024-12-06 22:42:17', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(393, 47, 5, '2025-02-21 20:21:51', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(394, 47, 3, '2025-04-19 02:14:42', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(395, 47, 4, '2025-04-06 22:59:18', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(396, 47, 8, '2025-01-03 07:32:31', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(397, 47, 4, '2025-04-23 22:00:59', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(398, 47, 7, '2025-02-12 19:05:44', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(399, 48, 6, '2025-01-16 06:58:10', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(400, 48, 8, '2025-04-06 05:37:49', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(401, 48, 3, '2025-02-18 05:44:25', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(402, 48, 4, '2025-03-21 10:49:22', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(403, 48, 3, '2025-04-09 05:40:20', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(404, 48, 9, '2025-05-20 19:52:42', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(405, 48, 11, '2025-05-10 02:04:00', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(406, 48, 9, '2025-04-28 17:10:08', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(407, 48, 4, '2025-03-25 07:21:59', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(408, 48, 10, '2025-04-23 10:50:55', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(409, 49, 7, '2025-05-15 14:46:59', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(410, 49, 4, '2024-12-02 09:52:19', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(411, 49, 6, '2025-02-16 09:53:41', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(412, 49, 11, '2025-05-23 22:30:34', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(413, 49, 4, '2025-03-24 11:18:57', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(414, 49, 9, '2025-05-15 10:01:14', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(415, 49, 3, '2025-02-19 18:52:27', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(416, 49, 1, '2024-12-01 10:46:24', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(417, 50, 11, '2025-05-08 20:21:23', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(418, 50, 9, '2025-04-28 13:07:48', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(419, 50, 8, '2025-01-13 22:20:00', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(420, 50, 6, '2025-04-22 15:53:06', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(421, 50, 8, '2025-05-13 22:22:52', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(422, 50, 8, '2025-03-27 09:41:19', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(423, 50, 6, '2025-05-13 11:51:20', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(424, 50, 10, '2025-01-20 19:34:47', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(425, 50, 10, '2025-04-22 18:00:31', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(426, 50, 10, '2024-12-17 13:45:31', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(427, 50, 8, '2024-12-16 18:30:04', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(428, 50, 10, '2025-01-25 09:51:02', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48'),
(429, 50, 7, '2024-12-05 09:43:57', NULL, NULL, '2025-05-27 06:48:48', '2025-05-27 06:48:48');

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
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_04_28_103441_create_permissions_table', 1),
(7, '2025_04_28_103454_create_subscription_plans_table', 1),
(8, '2025_04_28_103507_create_user_subscriptions_table', 1),
(9, '2025_04_28_103523_create_gyms_table', 1),
(10, '2025_04_28_103536_create_gym_classes_table', 1),
(11, '2025_04_28_103553_create_trainers_table', 1),
(12, '2025_04_28_103618_create_expenses_table', 1),
(13, '2025_04_29_082653_create_plan_features_table', 1),
(14, '2025_05_08_104917_create_favorite_gyms_table', 1),
(15, '2025_05_13_074051_create_checkins_table', 1),
(16, '2025_05_13_104509_create_activity_logs_table', 1),
(17, '2025_05_13_104524_create_payment_histories_table', 1),
(18, '2025_05_14_081949_create_gym_visits_table', 1),
(19, '2025_05_14_082250_create_gym_reviews_table', 1),
(20, '2025_05_14_082534_create_gym_equipment_table', 1),
(21, '2025_05_15_082905_create_payments_table', 1),
(22, '2025_05_16_034716_create_regions_table', 1),
(23, '2025_05_19_070542_create_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `gym_id`, `amount`, `status`, `payment_method`, `transaction_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 100.00, 'success', 'stripe', 'test_txn_6835a6974d834', NULL, '2025-05-27 06:48:39', '2025-05-27 06:48:39'),
(2, 1, NULL, 0.01, 'failed', 'stripe', 'test_failed_6835a6974d83f', NULL, '2025-05-27 06:48:39', '2025-05-27 06:48:39'),
(3, 1, NULL, 250.50, 'pending', 'paypal', 'test_pending_6835a6974d845', NULL, '2025-05-27 06:48:39', '2025-05-27 06:48:39'),
(4, 1, NULL, 9999.99, 'success', 'bank_transfer', 'test_bank_6835a6974d84a', NULL, '2025-05-27 06:48:39', '2025-05-27 06:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `payment_histories`
--

CREATE TABLE `payment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `paid_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_histories`
--

INSERT INTO `payment_histories` (`id`, `user_id`, `amount`, `payment_method`, `status`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:12', '2025-05-27 06:48:12', '2025-05-27 06:48:12'),
(2, 5, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:13', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(3, 8, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:13', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(4, 9, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:13', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(5, 10, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:13', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(6, 11, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:14', '2025-05-27 06:48:14', '2025-05-27 06:48:14'),
(7, 12, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:50', '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(8, 13, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:50', '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(9, 15, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:51', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(10, 16, 2000.00, 'Seeder Method', 'completed', '2025-05-27 06:48:51', '2025-05-27 06:48:51', '2025-05-27 06:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 22, 'auth_token', 'a8749c040dc9d0101c101ca0b91a5dd0c0a9bd66084b08145b4cc3f383d066f3', '[\"*\"]', NULL, NULL, '2025-05-28 02:20:18', '2025-05-28 02:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `plan_features`
--

CREATE TABLE `plan_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_plan_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_features`
--

INSERT INTO `plan_features` (`id`, `subscription_plan_id`, `name`, `description`, `limit`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 'Gym Access', 'Access to all gym equipment', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(2, 1, 'Locker Usage', 'Daily locker rental', 30, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(3, 1, 'Fitness Classes', 'Weekly group classes', 4, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(4, 1, 'Trainer Consultation', 'Free trainer sessions', 1, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(5, 2, '24/7 Gym Access', 'Unlimited access all hours', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(6, 2, 'Personal Locker', 'Dedicated locker', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(7, 2, 'Unlimited Classes', 'All fitness classes included', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(8, 2, 'Personal Trainer', 'Weekly sessions', 4, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(9, 2, 'Sauna Access', 'Unlimited sauna usage', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(10, 3, 'Family Members', 'Number of family members', 4, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(11, 3, 'Gym Access', 'Access for all members', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(12, 3, 'Kids Club', 'Childcare service', 20, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(13, 3, 'Swimming Pool', 'Pool access for family', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(14, 4, 'Gym Access', 'Access during student hours', NULL, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(15, 4, 'Locker Usage', 'Daily locker rental', 15, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(16, 4, 'Basic Classes', 'Selected fitness classes', 2, 1, '2025-05-27 06:48:46', '2025-05-27 06:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'North Region', 'Northern areas of the country', '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(2, 'South Region', 'Southern areas of the country', '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(3, 'East Region', 'Eastern areas of the country', '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(4, 'West Region', 'Western areas of the country', '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(5, 'Central Region', 'Central areas of the country', '2025-05-27 06:48:46', '2025-05-27 06:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `name`, `status`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Basic Membership', 'active', 29.99, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(2, 'Premium Membership', 'active', 59.99, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(3, 'Family Package', 'active', 99.99, '2025-05-27 06:48:46', '2025-05-27 06:48:46'),
(4, 'Student Plan', 'active', 19.99, '2025-05-27 06:48:46', '2025-05-27 06:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `profile_picture`, `stripe_customer_id`, `is_admin`, `is_paid`, `is_suspended`, `email_verified_at`, `gym_id`, `role_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Jao', 'admin@gym.com', '03001234567', NULL, NULL, 1, 1, 0, '2025-05-27 06:48:12', 1, 1, '$2y$10$8YPVJdTbb1KsYC/5GTBgQeZlP9IT0ybmjlMR2GJlKheqSK1NaiOXa', 'HeumVXvLux', '2025-05-27 06:48:12', '2025-05-27 06:48:12'),
(2, 'Saige', 'Feest', 'clara73@example.net', '03690991021', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$NBJ2fBtU9qVEb7quN9vgxedbCgjCjikkXRl.OcWxDdpL1nGGym.wi', '5VLRVlzqvk', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(3, 'Conner', 'Howe', 'baumbach.camilla@example.com', '03479629395', NULL, 'cus_SO8GQ2Hk9DwsFn', 0, 0, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$s9ew7gPtrPdtN7wRIpO3XecTynMW4TlunxbTOe4DHd6yfc4WWMZNi', 'EVgEA6kjxX', '2025-05-27 06:48:13', '2025-05-27 06:49:04'),
(4, 'Deshaun', 'Jacobs', 'rosinski@example.org', '03535815228', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$Lff6h0MENuCv3dVUzLPk/uh97iMlk/8KAebbHhtGrRaU.NeLkKLRW', 'hqaektTp5m', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(5, 'Jessyca', 'Gutkowski', 'hdicki@example.net', '03749491758', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:13', 1, 2, '$2y$10$Hw3DqzzQ/5V1ieVyHvblwuH1a7jS17prcS4Rzc89hIiWfj27WtGUK', 'QnMOYqNDYx', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(6, 'Amber', 'Parker', 'vonrueden.stan@example.org', '03607100274', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:13', 1, 2, '$2y$10$ZPq/OUeZoz/u8m46A0nFce.gM0yzk7slcxDOW2FWs/kMImzOcrY9e', '7rSVSfZO7M', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(7, 'Kathryne', 'Rau', 'zwisozk@example.org', '03290990778', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$gnHkApXl6D/OcYI3.RptZ.mqMdAgprOW8fgKNABZOnDzk6tCScCNG', 'y803XAYLCe', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(8, 'Myra', 'Keeling', 'ratke.enoch@example.org', '03354207862', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$JIhVsb.Xgd4yZkysFyjugueayicP21e7g6OpwEx/kZ1tik4Qvj19a', 'RZqrydOEQB', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(9, 'Ron', 'Schultz', 'maia.klein@example.org', '03973597690', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$YS3XWUUG14NZTI2uDTmHTubauYanVrg2G32RPftpInO5juA.aScBe', 'PGd3h6F7dO', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(10, 'Gerry', 'Kunde', 'marcel.hammes@example.org', '03107249035', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:13', 1, 3, '$2y$10$BWRt9bYTOUoaAC9Vvx4mouU5eW3OSgjm9a.frKr1QvbLuprHp7qgS', 'z9IFWTwGZu', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(11, 'Friedrich', 'Heathcote', 'clotilde27@example.org', '03746196961', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:13', 1, 2, '$2y$10$hucGROpuwGuzvB.JDrF0s.ThTj97KcqDBacGi4FH2EaqX6D.6TNfe', 'FOS5ncSPl5', '2025-05-27 06:48:13', '2025-05-27 06:48:13'),
(12, 'Tyree', 'Altenwerth', 'jackie73@example.org', '03664097697', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:50', 1, 2, '$2y$10$rfu1qmEXCzUSGFUJt5o37.dnI4xKA/uKw8bDtqPurTjn4D.1MmGVO', '10q83XlHPl', '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(13, 'Bradley', 'Wunsch', 'walsh.owen@example.com', '03472739616', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:50', 1, 3, '$2y$10$Z3OuQRRtn1LrF0yFyqlu2eiNcT9.gEVxq2StID.gdIyDYw4kkxBJC', 'rgMAHjvBWl', '2025-05-27 06:48:50', '2025-05-27 06:48:50'),
(14, 'Penelope', 'Nicolas', 'fcassin@example.com', '03441535010', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:51', 1, 3, '$2y$10$8XkdmPTjAw4nWXxSpEL6puZaO0vQDrZKqELaSRp3qZzYe5Vf3QYjC', 'yKG7lHfT14', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(15, 'Arnaldo', 'Wunsch', 'deanna59@example.com', '03950250283', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:51', 1, 2, '$2y$10$gIwbAoFSPkRmi.P0p5pfD..MDzAFnZ7aOQKfa3Z.zczN5uP1XJHRm', 'WFKdGwsbJK', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(16, 'Krystina', 'Howell', 'hills.norval@example.org', '03178106301', NULL, NULL, 0, 1, 0, '2025-05-27 06:48:51', 1, 3, '$2y$10$jBmHQv2OiyMy1JnP9dxY5OZn69FFQxulFG/jcn9htTpGTnkZp2LmC', '2qBC38Zn0a', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(17, 'Ashtyn', 'Haley', 'electa23@example.com', '03218746073', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:51', 1, 2, '$2y$10$pcTcV6kIhvjRqN4d3yM/hOSnHBb.8cf3cRMGBAofqczgTkA0BtSyO', 'ACxJSBe5Jr', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(18, 'Krystel', 'Dickinson', 'schneider.ashlynn@example.net', '03734898315', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:51', 1, 3, '$2y$10$okcOuSw77EpS7KVzeyJAtOe/CZz9UudbikAB5YjueiDDosnYuDM.a', 'vouyqeKmuH', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(19, 'King', 'Grimes', 'romaguera.aric@example.org', '03655234667', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:51', 1, 3, '$2y$10$3VKa.wLIeX7NamKQJVjQ4.2BvNq8CKhQXE1IKPx70tseUANFzzTje', 'VJoepOuLpw', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(20, 'Kyleigh', 'Dibbert', 'chelsey66@example.com', '03181241997', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:51', 1, 2, '$2y$10$Z01O.pa3Bq/4KCHfzXqrueGbLR5GZ6YFgaH756JewuL3ie8kvTXSy', '0iSB2tb071', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(21, 'Lorenzo', 'Ledner', 'monahan.leonard@example.org', '03845414358', NULL, NULL, 0, 0, 0, '2025-05-27 06:48:51', 1, 2, '$2y$10$XR32ZodWUl8NoTGKXjbSkeg2MYIY2KrsJj3feIZ8.lteT1s2DI67C', 'Om9m47KfYw', '2025-05-27 06:48:51', '2025-05-27 06:48:51'),
(22, 'asad', 'ayz', 'asadayazz@gmail.com', '66677788865', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '$2y$10$pDlp8vIp.cVzktVfBpjum.4bQAP22VjxtExiqKoJgY7B3TSXXmiN6', NULL, '2025-05-28 02:20:18', '2025-05-28 02:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subscription_type` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `billing_cycle` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `previous_subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stripe_subscription_id` varchar(255) DEFAULT NULL,
  `stripe_customer_id` varchar(255) DEFAULT NULL,
  `last_payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorite_gyms`
--
ALTER TABLE `favorite_gyms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorite_gyms_user_id_gym_id_unique` (`user_id`,`gym_id`),
  ADD KEY `favorite_gyms_gym_id_foreign` (`gym_id`);

--
-- Indexes for table `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gym_classes`
--
ALTER TABLE `gym_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gym_equipment`
--
ALTER TABLE `gym_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gym_equipment_gym_id_category_index` (`gym_id`,`category`);

--
-- Indexes for table `gym_reviews`
--
ALTER TABLE `gym_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gym_reviews_user_id_foreign` (`user_id`),
  ADD KEY `gym_reviews_gym_id_user_id_index` (`gym_id`,`user_id`);

--
-- Indexes for table `gym_visits`
--
ALTER TABLE `gym_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gym_visits_user_id_foreign` (`user_id`),
  ADD KEY `gym_visits_gym_id_user_id_index` (`gym_id`,`user_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_gym_id_foreign` (`gym_id`);

--
-- Indexes for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_features_subscription_plan_id_foreign` (`subscription_plan_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscriptions_user_id_index` (`user_id`),
  ADD KEY `user_subscriptions_gym_id_index` (`gym_id`),
  ADD KEY `user_subscriptions_plan_id_index` (`plan_id`),
  ADD KEY `user_subscriptions_is_active_index` (`is_active`),
  ADD KEY `user_subscriptions_end_date_index` (`end_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite_gyms`
--
ALTER TABLE `favorite_gyms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gyms`
--
ALTER TABLE `gyms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `gym_classes`
--
ALTER TABLE `gym_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gym_equipment`
--
ALTER TABLE `gym_equipment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gym_reviews`
--
ALTER TABLE `gym_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT for table `gym_visits`
--
ALTER TABLE `gym_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite_gyms`
--
ALTER TABLE `favorite_gyms`
  ADD CONSTRAINT `favorite_gyms_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_gyms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gym_equipment`
--
ALTER TABLE `gym_equipment`
  ADD CONSTRAINT `gym_equipment_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gym_reviews`
--
ALTER TABLE `gym_reviews`
  ADD CONSTRAINT `gym_reviews_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gym_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gym_visits`
--
ALTER TABLE `gym_visits`
  ADD CONSTRAINT `gym_visits_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gym_visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_histories`
--
ALTER TABLE `payment_histories`
  ADD CONSTRAINT `payment_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD CONSTRAINT `plan_features_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
