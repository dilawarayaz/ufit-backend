-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 02:04 PM
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
-- Database: `trbo-swift`
--

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
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`id`, `name`, `address`, `phone`, `email`, `opening_time`, `closing_time`, `description`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'Murphy, Weimann and Kutch Gym', '3067 Parisian Manors Suite 481\nStrosinville, NJ 17577-7858', '678-789-5229', 'margarett.hodkiewicz@koss.com', '02:45:00', '08:35:00', 'Sint qui ut rerum consequatur dolore. Laborum ut et consequatur vel nobis dolor. Veritatis et qui totam laboriosam nam.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(2, 'Hamill-Harber Gym', '7161 Jeanie Shoal\nJudyfort, MO 08767-8348', '380-345-6611', 'schmitt.blake@christiansen.com', '12:26:00', '18:28:00', 'Pariatur corporis error et. Aut officiis veniam nam asperiores fugiat provident et. Officia autem porro voluptatem qui. Ab porro commodi ut quibusdam porro. Ratione incidunt minus quia consectetur consectetur distinctio.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(3, 'Jones, Beahan and Huel Gym', '256 Willie Stream Suite 200\nAdalineshire, TX 45115', '(559) 385-7521', 'genevieve07@okuneva.com', '04:31:00', '19:32:00', 'Quis eligendi dolores omnis in aut rerum fugiat. Nisi nam ullam culpa molestias omnis maxime nostrum. Alias est incidunt totam tempora omnis dolores eum.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(4, 'Kerluke-Carter Gym', '6315 Fabian Motorway Apt. 871\nKleinborough, CO 58918', '+1 (689) 548-8634', 'ida99@beer.com', '10:32:00', '08:31:00', 'Officiis in est architecto enim omnis. Quisquam culpa harum ratione et doloremque aut doloremque. Debitis qui rerum velit iusto tempora.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(5, 'Kihn-Kessler Gym', '3657 Rosenbaum Haven\nJohnsonton, CT 68864-1976', '(260) 757-5693', 'legros.earnestine@eichmann.com', '00:59:00', '09:12:00', 'Tempore consectetur molestiae tempore et. Quos aliquid modi ut ea iste dolores. Quia quia a et ipsum molestias illum.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(6, 'Kuhic PLC Gym', '550 Alyson Dale\nDeangeloport, IA 75385-7549', '1-254-408-3626', 'don.stehr@murray.com', '17:39:00', '16:40:00', 'Omnis provident delectus est. Numquam numquam et unde expedita laudantium. Nesciunt amet maiores recusandae illo reiciendis rerum. Odit dignissimos quibusdam nemo maxime in dolores accusantium.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(7, 'Luettgen PLC Gym', '61735 Shannon Summit Suite 052\nRunolfsdottirview, KS 06261-3824', '+1 (567) 852-8327', 'dorothea75@trantow.com', '06:21:00', '16:02:00', 'Et maiores est nisi ut sunt libero. Voluptate molestias hic maiores saepe. Quia doloribus commodi odit veniam doloribus. Sunt sequi consequatur voluptate praesentium ut et.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(8, 'Sipes, King and Cummerata Gym', '65326 Maddison Turnpike Suite 418\nStevieville, NY 11952', '+1-231-201-2767', 'ustark@smith.biz', '02:31:00', '23:54:00', 'Commodi dolor nihil excepturi fugit eligendi dignissimos in. Dignissimos ut et odit magnam eaque. Modi ut rerum soluta perspiciatis sed iste.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(9, 'Krajcik LLC Gym', '928 Mohammad Camp\nSouth Dudley, WA 37059', '283-653-7653', 'raynor.madelynn@hudson.com', '10:19:00', '03:18:00', 'Consectetur et perspiciatis et sit aut. Amet odio laudantium distinctio magni rem quibusdam dolorem quia. Et fugit esse libero qui quos ab.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(10, 'Goyette LLC Gym', '9745 Ervin Ports\nEast Rahsaan, NH 25781-4131', '+19475058482', 'cmann@oberbrunner.com', '12:57:00', '07:04:00', 'Tempora molestiae iusto aspernatur consectetur sint at numquam. Doloribus molestiae dolorem eius commodi atque debitis laboriosam. Repudiandae labore ratione et error fugiat est. Molestiae porro amet et nam. Rem dolorem officiis quasi aliquam molestias officia.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(11, 'Gusikowski, Zieme and Altenwerth Gym', '357 Laury Turnpike\nAureliachester, KY 01989-0182', '1-531-686-0778', 'emelie.gislason@rodriguez.net', '20:11:00', '08:58:00', 'Itaque animi non facere. Sit quisquam sit harum qui tenetur animi. Qui enim modi qui temporibus omnis. Quae beatae blanditiis magnam vel eligendi.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(12, 'Ondricka Ltd Gym', '873 Raynor Groves Suite 937\nLake Roxaneside, DE 52841', '804-674-5784', 'helmer43@mclaughlin.net', '15:40:00', '03:14:00', 'Sapiente minima est iure ea. Minima molestias similique et sit praesentium et. Qui minus voluptatum recusandae culpa. Aut id corporis ut amet.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(13, 'Klocko, Littel and Turner Gym', '8093 Crooks Turnpike\nSouth Keyshawn, MA 91655', '650.377.2953', 'wschaefer@okuneva.info', '20:27:00', '02:17:00', 'Laborum tenetur id ut veritatis voluptas. Autem ipsum et corporis nulla dolorum error est. Id et aliquam neque iste.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(14, 'Corkery, Rutherford and Kuvalis Gym', '5509 Monty Street Apt. 327\nKovacekville, CA 61810-0360', '747.293.5668', 'lcorkery@hickle.info', '02:36:00', '12:04:00', 'Repellat fugit aut blanditiis dolorem. Itaque magni dolores est excepturi sed fuga.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(15, 'Aufderhar and Sons Gym', '73123 Kemmer Crossroad\nWhiteburgh, NH 79872', '985.769.3731', 'raphaelle.nader@kris.com', '20:01:00', '04:42:00', 'Nemo minus labore sit molestiae. Sunt qui et nihil hic rerum laudantium. Est minus animi dicta quas.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(16, 'Smith, Ullrich and Hegmann Gym', '14961 Tamara Mountains\nWest Kobyview, PA 40694-7625', '(870) 503-8644', 'domingo.kilback@willms.com', '01:37:00', '17:01:00', 'In est non ratione laborum sint unde. Cumque vel fuga nihil dolorem repudiandae quod ab quaerat. Sit est commodi amet cum ipsum.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(17, 'Hauck, Kuhlman and Toy Gym', '72318 Jesse Ramp\nWest Verlamouth, OR 39683-5499', '978.646.7936', 'coty.hickle@hoeger.net', '11:23:00', '05:41:00', 'Aut sunt et consequatur temporibus dolores possimus a. Rerum eum maxime quia quia. Consequuntur aspernatur iste repellat deserunt quaerat animi vel est.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(18, 'Gerlach, Erdman and Schultz Gym', '504 Aimee Course\nNew Casimir, CA 10896', '+1-334-869-6858', 'rafaela.little@johns.com', '05:11:00', '18:52:00', 'Ea qui et aliquam laudantium. Iure rerum mollitia voluptatum provident aperiam. Nisi et ab aut optio et aut. Sunt error magnam consequuntur at illo delectus consequatur.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(19, 'Jacobs and Sons Gym', '3639 Waters Trail Apt. 045\nWest Kennedy, SC 14130-3642', '+1-276-628-0635', 'rogahn.merle@konopelski.com', '15:33:00', '07:11:00', 'Iure ullam impedit commodi nihil non quas. Delectus alias iure quae. Numquam exercitationem officiis et non. Eos recusandae asperiores provident ipsum.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51'),
(20, 'Thiel-Feeney Gym', '879 Schiller Shore Suite 311\nBrettburgh, OK 88120', '1-630-490-2504', 'reagan31@roberts.net', '14:51:00', '06:10:00', 'Quos dolorem aliquid a harum qui unde sit deserunt. Sit officia eaque voluptate incidunt aperiam ipsam a. Fuga dolor et maiores est quod rerum nemo minima.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '2025-05-05 03:34:51', '2025-05-05 03:34:51');

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
(6, '2025_04_28_103422_create_roles_table', 1),
(7, '2025_04_28_103441_create_permissions_table', 1),
(8, '2025_04_28_103454_create_subscription_plans_table', 1),
(9, '2025_04_28_103507_create_user_subscriptions_table', 1),
(10, '2025_04_28_103523_create_gyms_table', 1),
(11, '2025_04_28_103536_create_gym_classes_table', 1),
(12, '2025_04_28_103553_create_trainers_table', 1),
(13, '2025_04_28_103607_create_payments_table', 1),
(14, '2025_04_28_103618_create_expenses_table', 1),
(15, '2025_04_28_123153_add_amount_to_payments_table', 1),
(16, '2025_04_29_082653_create_plan_features_table', 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 'Access to all gym equipment', 'Access to all gym equipment', NULL, 1, '2025-05-05 06:58:24', '2025-05-05 06:58:24'),
(2, 1, 'Locker facility', 'Locker facility', NULL, 1, '2025-05-05 06:58:45', '2025-05-05 06:58:45'),
(3, 1, '1 trainer session per week', '1 trainer session per week', NULL, 1, '2025-05-05 06:58:58', '2025-05-05 06:58:58'),
(4, 2, 'Everything in Basic Plan', 'Everything in Basic Plan', NULL, 1, '2025-05-05 06:59:40', '2025-05-05 06:59:40'),
(5, 2, 'Unlimited trainer support', 'Unlimited trainer support', NULL, 1, '2025-05-05 06:59:50', '2025-05-05 06:59:50'),
(6, 2, 'Access to steam & sauna', 'Access to steam & sauna', NULL, 1, '2025-05-05 07:00:01', '2025-05-05 07:00:01'),
(7, 2, 'Custom nutrition plan', 'Custom nutrition plan', NULL, 1, '2025-05-05 07:00:31', '2025-05-05 07:00:31'),
(8, 3, 'Everything in Standard Plan', 'Everything in Standard Plan', NULL, 1, '2025-05-05 07:01:06', '2025-05-05 07:01:06'),
(9, 3, 'Dedicated personal trainer', 'Dedicated personal trainer', NULL, 1, '2025-05-05 07:01:17', '2025-05-05 07:01:17'),
(10, 3, 'Massage therapy once a week', 'Massage therapy once a week', NULL, 1, '2025-05-05 07:01:29', '2025-05-05 07:01:29'),
(11, 3, 'Diet and health consultation', 'Diet and health consultation', NULL, 1, '2025-05-05 07:01:41', '2025-05-05 07:01:41'),
(12, 3, 'Priority customer support', 'Priority customer support', NULL, 1, '2025-05-05 07:01:52', '2025-05-05 07:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Basic Plan', 'active', 10.00, '2025-05-05 03:58:58', '2025-05-05 06:57:58'),
(2, 'Standard Plan', 'active', 50.00, '2025-05-05 05:08:23', '2025-05-05 06:59:24'),
(3, 'Premium Plan', 'active', 100.00, '2025-05-05 07:00:49', '2025-05-05 07:00:49');

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
  `is_admin` int(1) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `is_admin`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'jao', 1, 'admin@gym.com', NULL, '$2y$10$DJIsfAttrEtguM1mV3khX.1REmj8vY2KPImF3wINNW92CjnRG4BrG', NULL, '2025-05-05 03:47:47', '2025-05-05 03:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_type`, `is_active`, `start_date`, `end_date`, `price`, `payment_status`, `billing_cycle`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'premium', 1, '2025-05-05', '2025-06-05', NULL, 'pending', NULL, NULL, '2025-05-05 04:00:52', '2025-05-05 04:00:52', NULL),
(2, 1, 'basic', 0, '2025-03-05', '2025-04-05', NULL, 'pending', NULL, NULL, '2025-05-05 04:00:52', '2025-05-05 04:00:52', NULL),
(3, 1, 'premium', 1, '2025-05-03', '2025-06-15', NULL, 'pending', NULL, NULL, '2025-05-05 04:00:52', '2025-05-05 04:00:52', NULL);

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscriptions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD CONSTRAINT `plan_features_subscription_plan_id_foreign` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `user_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
