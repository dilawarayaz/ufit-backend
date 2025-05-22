-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 09:37 AM
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
(1, 1, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(2, 2, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(3, 3, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(4, 4, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(5, 5, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(6, 6, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(7, 7, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(8, 8, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(9, 9, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(10, 10, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(11, 11, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-21 02:52:06', '2025-05-21 02:52:06');

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
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
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

INSERT INTO `gyms` (`id`, `region_id`, `owner_id`, `name`, `address`, `phone`, `email`, `opening_time`, `closing_time`, `description`, `image_path`, `facilities`, `status`, `commission_rate`, `payment_settings`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'Gutmann-Treutel Gym', '9179 Corwin Freeway Suite 422\nRathmouth, ME 26184', '1-475-431-6492', 'yasmin.deckow@blanda.net', '00:43:00', '02:20:00', 'Explicabo minima rerum dignissimos rem exercitationem est. Eligendi consequuntur error facilis repellat nostrum sint velit. Hic perspiciatis nisi adipisci vero recusandae eius numquam quam.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 18.94, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 59.7709840, 103.7507370, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(2, 1, 3, 'Lesch Inc Gym', '90913 Sylvia Mills Apt. 797\nMaidaview, IN 27725', '903-750-8726', 'breilly@franecki.com', '10:30:00', '13:48:00', 'Est unde maiores dolorem qui minima voluptatibus. Sed minima corrupti quaerat autem minima qui. Soluta labore modi sunt ad qui minima.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 15.04, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -12.3685360, -76.1532220, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(3, 3, 1, 'Donnelly Group Gym', '528 Stefan Throughway Apt. 731\nNew Tyreekhaven, SD 57284-3862', '(380) 815-2788', 'vonrueden.melissa@crona.info', '09:24:00', '22:05:00', 'Est aut et sint et. Alias deleniti rerum quasi aut. Ea quibusdam delectus facere consequatur qui soluta.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 9.38, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 45.4889410, -64.7276740, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(4, 1, 9, 'Hartmann, Herzog and Stoltenberg Gym', '58793 Green Union\nBatzfort, ME 47149', '618.903.5248', 'welch.bethel@christiansen.org', '02:36:00', '21:39:00', 'Quibusdam et velit maiores recusandae adipisci accusamus enim. Suscipit nemo illum sed vel. Aut et impedit voluptatem qui vel illum.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 16.51, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 55.2587970, 63.7948640, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(5, 2, 3, 'Stracke LLC Gym', '79518 Stamm Fort Suite 533\nLake Vern, KY 21652-5280', '1-380-866-9518', 'thill@romaguera.com', '14:47:00', '01:02:00', 'Quia sint eligendi quibusdam qui ipsam eum. Incidunt tenetur rem et dignissimos sint iure et. A eos occaecati consequatur dolores ut eius nostrum.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 18.79, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 48.8866250, -17.4070830, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(6, 3, 11, 'Carroll-Kerluke Gym', '92359 Constance Key Apt. 116\nRaynorside, WA 08643-9082', '+1.858.226.7162', 'stacey.zulauf@oreilly.info', '05:33:00', '09:23:00', 'Voluptatem ea optio earum cumque. Sed incidunt ipsum harum repellendus sint. Aut dicta repellendus iste minima ipsum.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 12.22, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -63.8883850, -41.5029070, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(7, 5, 11, 'Schmitt, Larson and Gibson Gym', '34892 Horacio Isle Suite 576\nPort Nathen, FL 36888', '(808) 987-0086', 'brandy87@sporer.biz', '23:33:00', '03:15:00', 'Ut fugiat animi autem rem architecto. Ipsa est et officia sint aperiam reiciendis. Id et dolorum ut voluptates asperiores.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 16.73, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -28.2150440, -119.4585520, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(8, 2, 7, 'Champlin-Mayert Gym', '910 Botsford Via Suite 109\nEast Deborah, TX 42612', '(870) 959-0304', 'dietrich.morgan@auer.com', '07:29:00', '18:32:00', 'Sint incidunt et sint eveniet laboriosam nostrum corporis pariatur. Sit accusantium aut incidunt doloremque ea eos ut. Eligendi recusandae facere quam esse numquam. Provident fuga amet consequuntur.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 18.65, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -86.2111750, -26.8072760, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(9, 1, 11, 'Runolfsson, Kuvalis and Veum Gym', '5427 Ignatius Fort\nLynchland, AR 67391-5862', '386-899-1052', 'jefferey.beer@simonis.com', '17:20:00', '05:33:00', 'Aut totam fugiat quia nesciunt sed. Reiciendis vitae saepe esse repudiandae non sint reiciendis. Reprehenderit explicabo quo quas consequatur sunt animi animi omnis. Corporis sed incidunt distinctio modi quidem sed animi nihil.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 19.77, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 74.6113390, 29.4451760, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(10, 1, 9, 'Stehr, Bahringer and Koelpin Gym', '2042 Klein Greens\nWindlerside, NC 12139', '740-680-1904', 'will.wilma@schaden.com', '06:38:00', '01:23:00', 'Inventore aperiam quos voluptatem labore doloribus explicabo nemo. Quia earum aut id recusandae cum quidem. Placeat voluptatem enim eaque sit ipsa sit. Omnis possimus nulla consequatur non accusantium sunt officiis. Consequuntur at labore sit voluptatem accusantium.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 5.15, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 50.5324710, -69.0096610, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(11, 3, 9, 'Kulas, Senger and Bruen Gym', '529 Thaddeus Shoals Apt. 840\nSebastianbury, TX 03601', '828-832-2837', 'damore.jaylin@lockman.biz', '00:23:00', '01:22:00', 'Qui deleniti eaque maiores. Consequatur est nemo harum qui rerum enim. Unde dicta rem provident nisi rem.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 5.56, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 28.3345400, -38.5606630, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(12, 3, 1, 'Turcotte-Ernser Gym', '8507 Ledner Views\nNorth Aldaport, NM 87419-2650', '1-706-697-6591', 'hhodkiewicz@howe.net', '05:22:00', '02:16:00', 'Quia dolores fuga amet ea reprehenderit. Incidunt recusandae eaque repellat sit ut. Non voluptatibus aspernatur voluptatem maxime a.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 10.51, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -48.9627360, -31.9792410, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(13, 5, 11, 'Cummerata PLC Gym', '762 Gleason Flat Apt. 387\nAlysaville, IA 44453-1378', '+1-667-570-2196', 'brant.daniel@murray.com', '15:06:00', '18:54:00', 'Quos eum qui est. Quas ut illum modi. Magni beatae assumenda voluptas doloribus non nemo et.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 6.10, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -25.4096150, -150.0617700, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(14, 1, 9, 'Feil, Kunze and Heaney Gym', '4400 Edgar Tunnel Apt. 563\nEast Rosemarymouth, AR 15371-4634', '231.810.3711', 'madyson70@dickinson.net', '01:49:00', '11:58:00', 'Exercitationem ea autem ex eum fuga esse magnam. Enim ut deserunt tempora neque dolorem.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 14.63, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 5.4696740, 139.8844410, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(15, 3, 10, 'Heathcote, Green and Raynor Gym', '72562 Stiedemann Manors Apt. 182\nEast Flavie, GA 98540-9914', '+1-564-822-4238', 'rosalia.leannon@wehner.com', '03:37:00', '16:55:00', 'Et corrupti iste nam reprehenderit. Unde voluptate est autem officiis omnis ipsa voluptatem. Pariatur et voluptatem et quos error iure doloribus. Aut rerum alias animi ducimus distinctio nemo ab autem.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 17.62, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 17.7286030, 156.8786070, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(16, 2, 3, 'Wilderman and Sons Gym', '334 Murphy Garden\nCristophershire, ID 57216', '+1 (269) 613-6442', 'iraynor@effertz.com', '09:44:00', '23:59:00', 'Sequi quidem amet voluptas ipsum ducimus. Perferendis autem consequuntur maxime. Reiciendis omnis et accusantium ea voluptatum assumenda at debitis. Incidunt accusantium odio natus sit.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 15.48, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 47.9705980, 57.0423500, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(17, 5, 2, 'Armstrong LLC Gym', '71516 Mary Mill Apt. 225\nLake Nedland, KY 25199-8689', '+16519237125', 'august.corkery@kub.com', '22:13:00', '18:04:00', 'Omnis saepe et pariatur ut atque sint. Est officia rerum impedit ducimus necessitatibus. Ut illo voluptas ullam doloremque. Facere aut illo debitis corrupti.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 5.14, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 79.5074600, -112.0371530, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(18, 3, 3, 'Mueller LLC Gym', '51626 Davin Coves Suite 508\nNorth Sedrickville, DE 86665', '+1-762-682-2717', 'glen79@cassin.info', '17:46:00', '00:03:00', 'Voluptas quia perferendis magni sit quod. Vitae voluptate animi consequatur temporibus rerum ut. Facilis ea qui cupiditate corrupti. Tempora nam fugit harum natus et dolorem sint.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 14.89, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -46.0829600, -42.2421040, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(19, 5, 7, 'Macejkovic, Jacobs and Pfeffer Gym', '365 Kautzer Mountains Apt. 427\nGeorgebury, IL 74141-9551', '+1 (812) 579-9388', 'gmcglynn@langworth.com', '19:53:00', '10:11:00', 'Est quidem molestiae et repellat soluta necessitatibus et. Debitis dolorum nemo aut iusto qui sit. Eligendi assumenda et velit laborum similique cum harum.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 12.09, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 41.8208180, 37.6853370, '2025-05-21 03:11:13', '2025-05-21 03:11:13'),
(20, 3, 10, 'Kuphal-Connelly Gym', '73165 Salvatore Forks\nPort Robert, OR 34691-2877', '951-488-9739', 'lflatley@hansen.org', '12:09:00', '20:50:00', 'Eligendi aut quis velit neque laborum sit nobis vero. Non labore voluptatem saepe qui laboriosam assumenda. Ad qui rerum sapiente eius aut. Distinctio ut ab nostrum doloremque et veritatis et. Quidem minus cumque deleniti qui eveniet vel vel omnis.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 17.38, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -9.4461210, 179.5933340, '2025-05-21 03:11:13', '2025-05-21 03:11:13');

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
(1, 1, NULL, 100.00, 'success', 'stripe', 'test_txn_682d8b24ac15c', NULL, '2025-05-21 03:13:24', '2025-05-21 03:13:24'),
(2, 1, NULL, 0.01, 'failed', 'stripe', 'test_failed_682d8b24ac166', NULL, '2025-05-21 03:13:24', '2025-05-21 03:13:24'),
(3, 1, NULL, 250.50, 'pending', 'paypal', 'test_pending_682d8b24ac16c', NULL, '2025-05-21 03:13:24', '2025-05-21 03:13:24'),
(4, 1, NULL, 9999.99, 'success', 'bank_transfer', 'test_bank_682d8b24ac170', NULL, '2025-05-21 03:13:24', '2025-05-21 03:13:24');

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
(1, 1, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:05', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(2, 3, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:05', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(3, 4, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:05', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(4, 5, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:05', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(5, 6, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:05', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(6, 7, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:06', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(7, 10, 2000.00, 'Seeder Method', 'completed', '2025-05-21 02:52:06', '2025-05-21 02:52:06', '2025-05-21 02:52:06');

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
(1, 'App\\Models\\User', 12, 'auth_token', 'ba5d547e0a21168e1ba3df7c8b55702c1989fec116117890fe02afbe3f36aea2', '[\"*\"]', NULL, NULL, '2025-05-21 08:16:23', '2025-05-21 08:16:23'),
(4, 'App\\Models\\User', 13, 'auth_token', 'd9768fa181155c39aedece900e873a32f7abaf47d773318012e0c585dc076d7b', '[\"*\"]', NULL, NULL, '2025-05-22 02:05:23', '2025-05-22 02:05:23');

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
(1, 1, 'Gym Access', 'Access to all gym equipment', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(2, 1, 'Locker Usage', 'Daily locker rental', 30, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(3, 1, 'Fitness Classes', 'Weekly group classes', 4, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(4, 1, 'Trainer Consultation', 'Free trainer sessions', 1, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(5, 2, '24/7 Gym Access', 'Unlimited access all hours', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(6, 2, 'Personal Locker', 'Dedicated locker', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(7, 2, 'Unlimited Classes', 'All fitness classes included', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(8, 2, 'Personal Trainer', 'Weekly sessions', 4, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(9, 2, 'Sauna Access', 'Unlimited sauna usage', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(10, 3, 'Family Members', 'Number of family members', 4, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(11, 3, 'Gym Access', 'Access for all members', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(12, 3, 'Kids Club', 'Childcare service', 20, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(13, 3, 'Swimming Pool', 'Pool access for family', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(14, 4, 'Gym Access', 'Access during student hours', NULL, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(15, 4, 'Locker Usage', 'Daily locker rental', 15, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(16, 4, 'Basic Classes', 'Selected fitness classes', 2, 1, '2025-05-21 03:06:38', '2025-05-21 03:06:38');

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
(1, 'North Region', 'Northern areas of the country', '2025-05-21 03:06:19', '2025-05-21 03:06:19'),
(2, 'South Region', 'Southern areas of the country', '2025-05-21 03:06:19', '2025-05-21 03:06:19'),
(3, 'East Region', 'Eastern areas of the country', '2025-05-21 03:06:19', '2025-05-21 03:06:19'),
(4, 'West Region', 'Western areas of the country', '2025-05-21 03:06:19', '2025-05-21 03:06:19'),
(5, 'Central Region', 'Central areas of the country', '2025-05-21 03:06:19', '2025-05-21 03:06:19');

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

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2025-05-21 02:52:26', '2025-05-21 02:52:26'),
(2, 'Gym Owner', '2025-05-21 02:52:26', '2025-05-21 02:52:26'),
(3, 'User', '2025-05-21 02:52:26', '2025-05-21 02:52:26');

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
(1, 'Basic Membership', 'active', 29.99, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(2, 'Premium Membership', 'active', 59.99, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(3, 'Family Package', 'active', 99.99, '2025-05-21 03:06:38', '2025-05-21 03:06:38'),
(4, 'Student Plan', 'active', 19.99, '2025-05-21 03:06:38', '2025-05-21 03:06:38');

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

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `is_admin`, `is_paid`, `is_suspended`, `email_verified_at`, `gym_id`, `role_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Jao', 'admin@gym.com', '03001234567', 1, 1, 0, '2025-05-21 02:52:05', 1, 1, '$2y$10$wx1OeC4QZh1MC9WYJgXfeeHRspA8v2XKwU3L32b.i8FIPZflz7f2W', 'EjJkn8w5q8', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(2, 'Joe', 'Ortiz', 'darlene48@example.net', '03327193807', 0, 0, 0, '2025-05-21 02:52:05', 1, 3, '$2y$10$QEOX7JS.Udq.GNtQT/58fuQpV8pOiKuaIiiBtafNxNEMpBu1TdF.a', 'R0tkNlRRjG', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(3, 'Green', 'Toy', 'pwalsh@example.com', '03828811351', 0, 1, 0, '2025-05-21 02:52:05', 1, 2, '$2y$10$MbW11bG/Vil8VC1mkbIhTuFZ7BI2yMRnrtP7gM8jX1LL9VzDsKpDS', 'nDo0Y17fOL', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(4, 'Jacques', 'Donnelly', 'fritsch.kristy@example.com', '03151513685', 0, 1, 0, '2025-05-21 02:52:05', 1, 3, '$2y$10$1Objlfr1v5BqW.H7JLGw4O9lqpTeTmENmm5UHjK6NJSvLFAYlkEJG', 'LiWKuDI4Bc', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(5, 'Clement', 'Fahey', 'eliezer62@example.net', '03989853695', 0, 1, 0, '2025-05-21 02:52:05', 1, 3, '$2y$10$P.3WnVaQFdrDUO.q9Sqwm.gt9bwiHN3Ieakc/eu3022biNaLfbvle', 'uacKBgsv9X', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(6, 'Shawn', 'Abernathy', 'adach@example.com', '03113375825', 0, 1, 0, '2025-05-21 02:52:05', 1, 2, '$2y$10$RvjOcl14QZkqNguwUwGtx.3WVhnXA.MA89yCCfYnnWWAoQik3gAb.', 'YOnOPt6H8W', '2025-05-21 02:52:05', '2025-05-21 02:52:05'),
(7, 'Terrance', 'Corwin', 'brohan@example.org', '03635725885', 0, 1, 1, '2025-05-21 02:52:06', 1, 2, '$2y$10$1fKtiwVSNoM7vORtQSs4tu4TQJflAl5P1g2n.NxV.jpFzMn4LcAqC', 'zKViNWxwz6', '2025-05-21 02:52:06', '2025-05-21 05:04:33'),
(8, 'Gregg', 'Hahn', 'pamela26@example.com', '03563847924', 0, 0, 0, '2025-05-21 02:52:06', 1, 2, '$2y$10$EnYREc5RSNhipWQndCk2zOz2EADTdgTydfQzhUhKZKSW4nYg0nSjm', 'Wee0A7eYH1', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(9, 'Beth', 'Larkin', 'nicklaus.ebert@example.net', '03451038823', 0, 0, 0, '2025-05-21 02:52:06', 1, 3, '$2y$10$RXxTLXd/Tcvct/T2FtIE.uuevm1t6HkoNdgLHgLcDV38GzTp3HfN2', 'g0oncQPsPY', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(10, 'Sophie', 'McCullough', 'thomas.schulist@example.net', '03720505306', 0, 1, 0, '2025-05-21 02:52:06', 1, 2, '$2y$10$JQQI7gHF9zhoEmmIdq7jVeQpHksPo1mj/MaE8f8KoyzcUMCoU7mRy', 'X37Mit3XNb', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(11, 'Jason', 'Tillman', 'christ10@example.com', '03788165199', 0, 0, 0, '2025-05-21 02:52:06', 1, 3, '$2y$10$5ZJHgXkdqyEfmq2huIs2bub0jsP2ieKSjA5OJStjvu2Yav2G7lAcG', 'NV8FVtIXCm', '2025-05-21 02:52:06', '2025-05-21 02:52:06'),
(12, 'zawar', 'ahmad', 'zawarappdeveloper@gmail.com', '6789098764544', 0, 0, 0, NULL, NULL, NULL, '$2y$10$e/fzoVg3uVe1OnLgGP/HsOWkWAvWtaNfPXykW9O10PvZTRMauC/ae', NULL, '2025-05-21 08:16:22', '2025-05-21 08:16:22'),
(13, 'Ali', 'Malik', 'groupofsaraiki@gmail.com', '03123456785590', 0, 0, 0, NULL, NULL, NULL, '$2y$10$zUHteRmy6jEZCiApqptxKeyQmkMtMTsSFFWhQ3JWuFAwqaSHxHaYq', NULL, '2025-05-22 01:56:36', '2025-05-22 02:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `gym_id` int(11) NOT NULL,
  `subscription_type` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `billing_cycle` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `gym_id`, `subscription_type`, `is_active`, `start_date`, `end_date`, `price`, `payment_status`, `billing_cycle`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(2, 1, 5, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(3, 1, 12, 'basic', 0, '2025-05-11', '2025-07-16', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(4, 2, 14, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(5, 2, 8, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(6, 3, 7, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(7, 3, 16, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(8, 3, 2, 'gold', 0, '2025-05-13', '2025-06-21', 29.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(9, 4, 4, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(10, 4, 8, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(11, 4, 7, 'gold', 0, '2025-05-17', '2025-06-17', 29.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(12, 5, 9, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(13, 5, 14, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(14, 6, 18, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(15, 6, 16, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(16, 6, 14, 'basic', 0, '2025-05-13', '2025-06-07', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(17, 7, 16, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(18, 7, 13, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(19, 8, 5, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(20, 8, 12, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(21, 9, 3, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(22, 9, 2, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(23, 10, 19, 'premium', 1, '2025-05-21', '2025-06-21', 19.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL),
(24, 10, 7, 'basic', 0, '2025-03-21', '2025-04-21', 9.99, 'pending', NULL, NULL, '2025-05-21 03:11:18', '2025-05-21 03:11:18', NULL);

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gym_visits`
--
ALTER TABLE `gym_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
