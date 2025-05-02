-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2025 at 02:39 PM
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`id`, `name`, `address`, `phone`, `email`, `opening_time`, `closing_time`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ufit', 'rahim yar khan,near canal view hotel', '031363161982', 'dilawarayaz1234@gmail.com', '11:27:00', '14:32:00', 'in Dar es Salaam, Life Fitness Club in Arusha, and Arusha Fitness Master Gym in Arusha', '2025-04-29 01:37:20', '2025-04-30 03:20:31'),
(3, 'Planet Fitness Club', 'in Dar es Salaam, Life Fitness Club in Arusha, and Arusha Fitness Master Gym in Arusha', '+255 742872398', 'planetfitnesclub@gmail.com', '07:30:00', '21:31:00', 'in Dar es Salaam, Life Fitness Club in Arusha, and Arusha Fitness Master Gym in Arusha', '2025-04-30 03:16:34', '2025-04-30 03:16:34');

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
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 2),
(10, '2025_04_28_103422_create_roles_table', 2),
(11, '2025_04_28_103441_create_permissions_table', 2),
(12, '2025_04_28_103454_create_subscription_plans_table', 2),
(15, '2025_04_28_103536_create_gym_classes_table', 2),
(16, '2025_04_28_103553_create_trainers_table', 2),
(17, '2025_04_28_103607_create_payments_table', 2),
(18, '2025_04_28_103618_create_expenses_table', 2),
(20, '2025_04_28_123153_add_amount_to_payments_table', 3),
(21, '2025_04_28_103523_create_gyms_table', 4),
(24, '2025_04_29_082653_create_plan_features_table', 5),
(26, '2025_04_28_103507_create_user_subscriptions_table', 6);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 5, 'auth_token', 'bb129a2023c03265505dcdd2f35e678a228c4cc58ba456d6e78e7b229f2546fb', '[\"*\"]', NULL, NULL, '2025-05-01 03:26:12', '2025-05-01 03:26:12'),
(4, 'App\\Models\\User', 6, 'auth_token', 'e7cfea8bc03bf99f39335e6ac2057d41514bfd229ea1d408e404e1d48f7fb711', '[\"*\"]', NULL, NULL, '2025-05-02 01:53:10', '2025-05-02 01:53:10'),
(6, 'App\\Models\\User', 7, 'auth_token', '44ea70f8d76b56a9c58361900c28778a3e2a5208f87b5908da7ccd9423c26d63', '[\"*\"]', NULL, NULL, '2025-05-02 01:58:05', '2025-05-02 01:58:05'),
(11, 'App\\Models\\User', 4, 'auth_token', 'ced00f17ea694be88a57f926c8aab8b14794d1adb1028c0d12ab4725afd41b86', '[\"*\"]', '2025-05-02 03:23:23', NULL, '2025-05-02 03:22:14', '2025-05-02 03:23:23'),
(17, 'App\\Models\\User', 8, 'auth_token', '326d081023127c5b770366790ace794dacf96cb525aa7ccdc34f9ca6afaeec50', '[\"*\"]', NULL, NULL, '2025-05-02 05:02:14', '2025-05-02 05:02:14');

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
(8, 4, 'Access to all gym equipment', 'Access to all gym equipment', NULL, 1, '2025-05-02 06:58:20', '2025-05-02 06:58:20'),
(9, 4, 'Locker facility', 'Locker facility', NULL, 1, '2025-05-02 06:58:34', '2025-05-02 06:58:34'),
(10, 4, '1 trainer session per week', '1 trainer session per week', NULL, 1, '2025-05-02 06:58:49', '2025-05-02 06:58:49'),
(11, 5, 'Everything in Basic Plan', 'Everything in Basic Plan', NULL, 1, '2025-05-02 06:59:56', '2025-05-02 06:59:56'),
(12, 5, 'Unlimited trainer support', 'Unlimited trainer support', NULL, 1, '2025-05-02 07:00:09', '2025-05-02 07:00:09'),
(13, 5, 'Access to steam & sauna', 'Access to steam & sauna', NULL, 1, '2025-05-02 07:00:24', '2025-05-02 07:00:24'),
(14, 5, 'Custom nutrition plan', 'Custom nutrition plan', NULL, 1, '2025-05-02 07:00:37', '2025-05-02 07:00:37'),
(15, 6, 'Everything in Standard Plan', 'Everything in Standard Plan', NULL, 1, '2025-05-02 07:01:26', '2025-05-02 07:01:26'),
(16, 6, 'Dedicated personal trainer', 'Dedicated personal trainer', NULL, 1, '2025-05-02 07:01:47', '2025-05-02 07:01:47'),
(17, 6, 'Massage therapy once a week', 'Massage therapy once a week', NULL, 1, '2025-05-02 07:02:04', '2025-05-02 07:02:04'),
(18, 6, 'Diet and health consultation', 'Diet and health consultation', NULL, 1, '2025-05-02 07:02:16', '2025-05-02 07:02:16'),
(19, 6, 'Priority customer support', 'Priority customer support', NULL, 1, '2025-05-02 07:02:30', '2025-05-02 07:02:30');

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
(4, 'Basic Plan', 'active', 10.00, '2025-05-02 06:57:46', '2025-05-02 06:57:46'),
(5, 'Standard Plan', 'active', 50.00, '2025-05-02 06:59:21', '2025-05-02 06:59:21'),
(6, 'Premium Plan', 'active', 100.00, '2025-05-02 07:00:56', '2025-05-02 07:00:56');

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
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` int(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Doe', 'johnn@example.com', NULL, '$2y$10$n1S9FrTWEvkdb419FhnspObLUe.fdkRCUMtm5sGWMuSjTY9NvkbLS', 0, NULL, '2025-04-28 04:50:58', '2025-04-28 04:50:58'),
(2, 'Admin', 'jao', 'admin@gym.com', NULL, '$2y$10$8ZQ3ZGrcIGfvroGGBrdXQuu5NPiVRJDF1tqGDU1WTt0HCXbCFGnWS', 1, NULL, '2025-04-28 07:04:47', '2025-04-28 07:04:47'),
(3, 'Test', 'User', 'test@gmail.com', NULL, '$2y$10$z6XKQLKzyJSYR0ynMNX.uOowJ67/yHvbFwfDz/DslUvgpXGItRvpm', 0, NULL, '2025-04-30 06:11:08', '2025-04-30 06:11:08'),
(4, 'Dilawar', 'Ayaz', 'dilawarayaz1234@gmail.com', NULL, '$2y$10$cvInF2PW8HboO5v6O8dCY.IJpgrjq0vEs8i93ciNT55H3O3Q28vDK', 0, NULL, '2025-04-30 06:39:34', '2025-04-30 06:39:34'),
(5, 'Test', 'User', 'test1@gmail.com', NULL, '$2y$10$D4wLFyasVuOZb/FZwQT40OrdqHnzcgkm8kzRekzU2Z7v2wCj6Pqni', 0, NULL, '2025-05-01 03:17:48', '2025-05-01 03:17:48'),
(6, 'Test', 'User', 'test2@gmail.com', NULL, '$2y$10$b2rrrQkDpav9DpvCLHXJ4uurW/dC109/uWnCth9kkBqr0tSTbRnx.', 0, NULL, '2025-05-02 01:53:10', '2025-05-02 01:53:10'),
(7, 'zawar', 'ahmed', 'fullstack968@gmail.com', NULL, '$2y$10$nQrtfKQnd27ZPkzXhiwgDOrAZkg98HfKIXYag3SD93gKSpZXEPZnq', 0, NULL, '2025-05-02 01:58:03', '2025-05-02 01:58:03'),
(8, 'Asad', 'Ayaz', 'zawar@codingsolution24.com', NULL, '$2y$10$PYPcdT5.Av5Wki08g7wXVO6Gv9hr61n0ZyiBm7b4MgjG5kZfjPWZO', 0, NULL, '2025-05-02 02:02:02', '2025-05-02 02:02:02');

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
(1, 1, 'premium', 1, '2025-04-29', '2025-05-29', 22.00, 'pending', NULL, NULL, '2025-04-29 07:17:17', '2025-04-29 07:17:17', NULL),
(2, 1, 'basic', 0, '2025-03-01', '2025-03-29', 300.00, 'pending', NULL, NULL, '2025-04-29 07:17:17', '2025-04-29 07:17:17', NULL),
(3, 1, 'premium', 0, '2025-04-19', '2025-05-28', 400.00, 'pending', NULL, NULL, '2025-04-29 07:17:17', '2025-04-29 07:17:17', NULL),
(4, 2, 'premium', 1, '2025-04-29', '2025-05-29', 500.00, 'pending', NULL, NULL, '2025-04-29 07:17:17', '2025-04-29 07:17:17', NULL),
(5, 2, 'basic', 0, '2025-03-01', '2025-03-29', 700.00, 'pending', NULL, NULL, '2025-04-29 07:17:17', '2025-04-29 07:17:17', NULL),
(6, 2, 'premium', 1, '2025-04-22', '2025-06-25', 700.00, 'pending', NULL, NULL, '2025-04-29 07:17:17', '2025-04-29 07:17:17', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gym_classes`
--
ALTER TABLE `gym_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
