-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2025 at 07:24 PM
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
(1, 1, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(2, 2, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(3, 3, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(4, 4, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(5, 5, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(6, 6, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(7, 7, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(8, 8, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(9, 9, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(10, 10, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(11, 11, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(12, 12, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(13, 13, NULL, 'Seeder Creation', 'User created via seeder', '2025-05-19 02:08:11', '2025-05-19 02:08:11');

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

INSERT INTO `gyms` (`id`, `region_id`, `name`, `address`, `phone`, `email`, `opening_time`, `closing_time`, `description`, `image_path`, `facilities`, `status`, `commission_rate`, `payment_settings`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 4, 'D\'Amore, Kreiger and Howell Gym', '96237 Giovanny Shore Apt. 356\nLornastad, CO 63856', '+1 (440) 702-4420', 'fatima46@rolfson.com', '07:43:00', '21:36:00', 'Vitae impedit et fugit. Blanditiis consequuntur ullam porro qui aut qui eos. Commodi vitae mollitia dolores quo et voluptatibus harum. Corporis harum voluptates in non.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 17.92, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 54.6841140, -6.5079360, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(2, 3, 'Buckridge, Watsica and Senger Gym', '4368 Prohaska Land\nLake Malachi, NH 78983', '308-333-2465', 'hill.shawn@schinner.org', '22:30:00', '23:38:00', 'Qui rem sunt aut sunt. Est accusamus voluptates et dicta quae. Harum molestiae consequuntur soluta similique.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 19.04, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 18.8628220, 152.4811910, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(3, 3, 'Keeling-Tillman Gym', '41747 Hyatt Villages Suite 732\nNew Gerhard, GA 93345-4871', '704.813.0062', 'towne.pierre@stroman.com', '12:46:00', '07:32:00', 'Perspiciatis ad aut est adipisci voluptatem porro. Praesentium temporibus modi cupiditate quaerat dolore deserunt alias reprehenderit. Dolor harum occaecati iste aliquid sunt harum ea.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 5.10, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -84.7239920, 122.4528200, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(4, 1, 'Cartwright LLC Gym', '652 Donnelly Junctions\nLaylamouth, WY 53931-4437', '1-283-517-1462', 'bayer.eino@conroy.com', '09:28:00', '11:06:00', 'Dignissimos asperiores accusantium inventore laudantium error. Consequatur et consequatur ut quibusdam sed distinctio. Nihil assumenda possimus architecto eos nesciunt maxime odit. Fuga sit nulla quia beatae excepturi cum.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 19.02, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 73.0522230, 46.4462920, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(5, 4, 'Marquardt PLC Gym', '20565 Fredy Throughway Apt. 105\nChrisview, KY 46079', '+1.276.235.4294', 'sallie28@larson.com', '03:01:00', '22:36:00', 'Nesciunt debitis delectus sed ipsum et fugiat magnam. Est maxime ea dolore et alias. Magni ducimus distinctio doloremque tempora modi.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 11.37, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -30.7728720, 14.4293330, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(6, 1, 'Monahan Ltd Gym', '8062 Stamm Hill\nEast Onietown, NH 52674-9730', '(925) 376-3917', 'halvorson.mollie@morar.com', '03:27:00', '07:08:00', 'Quidem quod omnis harum amet. Suscipit optio nulla quo rerum. Eveniet laudantium eos sed dolorum hic nihil.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 7.41, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 42.1898550, 57.7024210, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(7, 1, 'Gottlieb Inc Gym', '615 Breana Ridges Apt. 136\nGunnerfurt, VA 28047', '815.465.3024', 'wgrant@considine.org', '00:42:00', '00:01:00', 'Est unde occaecati adipisci cupiditate ullam odit. Sit nisi voluptatem neque ut ut officia. Perferendis qui id sed.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 5.18, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -7.2135980, 145.4265470, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(8, 2, 'Borer PLC Gym', '32410 Kurtis Crossroad Suite 558\nLake Delphiafort, LA 32862-9485', '+1 (520) 383-3029', 'lawson.fahey@koelpin.com', '14:00:00', '01:03:00', 'Ducimus error blanditiis voluptatibus aut sunt qui et. Cupiditate perspiciatis vero harum iste nam quia. Nostrum expedita qui vero assumenda est alias. Odit inventore voluptas nisi sequi earum enim explicabo. Et minus natus sunt quia eius voluptatem ab itaque.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 6.11, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -22.6868400, -142.1441130, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(9, 1, 'Hayes, Olson and Dickinson Gym', '8668 Buckridge Mountain\nVernhaven, TN 54697-6870', '(314) 727-4223', 'rswaniawski@blanda.com', '15:34:00', '17:59:00', 'Aperiam dolorum vitae ratione nobis. Consequatur et voluptatem voluptas modi quia qui. Doloribus nesciunt non ipsam ut quae.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 17.99, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -77.6254590, -70.8106280, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(10, 2, 'McCullough Inc Gym', '50432 Oberbrunner Walks\nPort Damon, AR 27734', '781.499.1759', 'nsatterfield@runolfsson.info', '07:34:00', '20:28:00', 'Est commodi a ut rerum quibusdam. Ea corrupti ut distinctio vel. Consequatur est omnis rerum culpa deserunt tenetur.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 10.79, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 70.3901470, 116.9361010, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(11, 3, 'Reichel, Boyle and Bradtke Gym', '40289 Effertz Islands Apt. 585\nNorth Salvador, VT 63250', '+1-478-364-5154', 'reymundo35@frami.com', '12:18:00', '11:48:00', 'Aperiam sint in iusto quia sit totam. Ea cumque soluta minus voluptate. Molestias et omnis facere non rerum. Et voluptatem dignissimos sapiente numquam architecto id.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 14.00, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -63.2035620, 143.3823180, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(12, 4, 'Renner-Stehr Gym', '89810 Telly Points Apt. 145\nTrefurt, WA 09808', '+1-534-459-1019', 'csatterfield@douglas.com', '04:25:00', '06:42:00', 'Ut recusandae rerum debitis mollitia tenetur sed. Et quae minus adipisci blanditiis velit tempore esse. Voluptates vel maiores tempora reprehenderit. Temporibus possimus dolor perferendis nostrum voluptatum beatae dolor.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 13.59, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 72.6993530, 76.7994250, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(13, 4, 'Conroy, Kub and Von Gym', '353 Haley Shoal\nKayleeberg, ID 24161', '+19785602163', 'zrice@hane.biz', '21:21:00', '05:33:00', 'Error explicabo qui sit iusto. Aut dolores fugiat nisi quia aspernatur. Sunt alias velit dolor et pariatur dolores non.', 'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 19.63, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 22.8440160, 118.7438500, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(14, 1, 'Rath-Lemke Gym', '5086 Sipes Prairie Apt. 333\nMarielastad, DC 58931-6013', '+1-925-470-3261', 'ocasper@pacocha.biz', '15:38:00', '22:57:00', 'Ea non pariatur maxime velit sunt et magnam. Fuga doloremque possimus aut asperiores aspernatur voluptates. Molestiae et asperiores nisi et sequi. Aliquid quibusdam et fugiat eius aut aut voluptatem. Voluptatem atque incidunt dolore expedita dolorum.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 13.42, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 82.0957000, -99.0652760, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(15, 1, 'Bode, Mitchell and Haag Gym', '6979 Talon Stream Suite 650\nWunschberg, TN 63353', '254.738.5218', 'josiane40@schmidt.com', '17:56:00', '12:10:00', 'Natus magnam ut sequi maiores sed. Corporis rerum ratione porro omnis harum ullam. Architecto maiores occaecati qui asperiores ullam.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 12.20, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -34.0347590, -90.2141860, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(16, 2, 'Stehr Ltd Gym', '28549 Hudson Place Suite 284\nPort Jackie, DC 44625-0017', '+1.346.331.2855', 'barton53@bergnaum.net', '04:05:00', '20:00:00', 'Accusantium dolor commodi aut quidem iste. Voluptate sed dolores rerum. Deleniti ex minus omnis dolores quisquam provident.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 19.64, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 0.6374570, 10.9282290, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(17, 1, 'Conn-Stehr Gym', '88309 Piper Run Suite 390\nSouth Dinoborough, WV 05111', '+1-650-863-6050', 'elmira55@rutherford.com', '13:30:00', '09:26:00', 'Officiis pariatur odit impedit ipsa ipsum doloremque ullam. Odit natus velit voluptas dolores vero debitis soluta. Officia ut accusamus laboriosam nam adipisci odio. Atque molestiae debitis exercitationem ex facilis id.', 'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 8.55, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -21.1822450, -98.8745220, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(18, 1, 'Keebler and Sons Gym', '99171 Herzog Curve\nPort Vidashire, MO 79308-1733', '+1.843.881.0725', 'jeanne99@parisian.com', '13:33:00', '13:47:00', 'Assumenda repudiandae velit aliquam eligendi consequatur reiciendis. Voluptatem saepe aut consequatur facere ipsam blanditiis adipisci. Cupiditate est eos et sint voluptatem. Aut accusantium consectetur quia quas unde.', 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 15.66, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', -80.3432260, 89.4939170, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(19, 5, 'Mitchell LLC Gym', '78657 Shayne Street\nMariannaborough, ND 80841-3534', '(580) 523-6763', 'ubechtelar@boyle.biz', '11:25:00', '20:47:00', 'Fugit neque perferendis neque eum eaque tenetur harum. Ab rem nihil et suscipit cum et. Quis qui quia recusandae voluptatibus quis id repellat autem.', 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'approved', 16.17, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 4.2382250, -93.8810450, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(20, 2, 'Corwin Group Gym', '37600 Bosco Ranch\nPort Richiebury, UT 79159-5023', '+1.917.639.1704', 'lesley.welch@welch.biz', '13:33:00', '10:14:00', 'Ipsam nulla quae quasi eaque qui quia. Nobis deleniti quisquam facilis quibusdam possimus soluta ex. Sint ut aliquam quis debitis voluptate velit. Dolores aut quae assumenda magnam.', 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400', '\"[\\\"Cardio Machines\\\",\\\"Weight Lifting\\\",\\\"Personal Training\\\",\\\"Yoga Classes\\\"]\"', 'pending', 11.53, '\"{\\\"paypal\\\":true,\\\"stripe\\\":false}\"', 88.9397330, -14.8210010, '2025-05-19 02:17:21', '2025-05-19 02:17:21');

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
(1, 1, 2000.00, 'Seeder Method', 'completed', '2025-05-19 02:08:10', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(2, 2, 2000.00, 'Seeder Method', 'completed', '2025-05-19 02:08:10', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(3, 5, 2000.00, 'Seeder Method', 'completed', '2025-05-19 02:08:10', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(4, 6, 2000.00, 'Seeder Method', 'completed', '2025-05-19 02:08:10', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(5, 7, 2000.00, 'Seeder Method', 'completed', '2025-05-19 02:08:11', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(6, 13, 2000.00, 'Seeder Method', 'completed', '2025-05-19 02:08:11', '2025-05-19 02:08:11', '2025-05-19 02:08:11');

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
(3, 'App\\Models\\User', 15, 'auth_token', '9a54f4cfb1b5d62e9518abad86314356022e97bea0a855ce3286eafef75d720c', '[\"*\"]', '2025-05-19 02:22:24', NULL, '2025-05-19 02:20:38', '2025-05-19 02:22:24');

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
(1, 1, 'Gym Access', 'Access to all gym equipment', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(2, 1, 'Locker Usage', 'Daily locker rental', 30, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(3, 1, 'Fitness Classes', 'Weekly group classes', 4, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(4, 1, 'Trainer Consultation', 'Free trainer sessions', 1, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(5, 2, '24/7 Gym Access', 'Unlimited access all hours', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(6, 2, 'Personal Locker', 'Dedicated locker', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(7, 2, 'Unlimited Classes', 'All fitness classes included', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(8, 2, 'Personal Trainer', 'Weekly sessions', 4, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(9, 2, 'Sauna Access', 'Unlimited sauna usage', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(10, 3, 'Family Members', 'Number of family members', 4, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(11, 3, 'Gym Access', 'Access for all members', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(12, 3, 'Kids Club', 'Childcare service', 20, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(13, 3, 'Swimming Pool', 'Pool access for family', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(14, 4, 'Gym Access', 'Access during student hours', NULL, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(15, 4, 'Locker Usage', 'Daily locker rental', 15, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(16, 4, 'Basic Classes', 'Selected fitness classes', 2, 1, '2025-05-19 02:17:21', '2025-05-19 02:17:21');

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
(1, 'North Region', 'Northern areas of the country', '2025-05-19 02:17:22', '2025-05-19 02:17:22'),
(2, 'South Region', 'Southern areas of the country', '2025-05-19 02:17:22', '2025-05-19 02:17:22'),
(3, 'East Region', 'Eastern areas of the country', '2025-05-19 02:17:22', '2025-05-19 02:17:22'),
(4, 'West Region', 'Western areas of the country', '2025-05-19 02:17:22', '2025-05-19 02:17:22'),
(5, 'Central Region', 'Central areas of the country', '2025-05-19 02:17:22', '2025-05-19 02:17:22');

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
(1, 'admin', '2025-05-19 02:07:54', '2025-05-19 02:07:54'),
(2, 'gym_owner', '2025-05-19 17:17:37', '2025-05-19 17:17:37');

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
(1, 'Basic Membership', 'active', 29.99, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(2, 'Premium Membership', 'active', 59.99, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(3, 'Family Package', 'active', 99.99, '2025-05-19 02:17:21', '2025-05-19 02:17:21'),
(4, 'Student Plan', 'active', 19.99, '2025-05-19 02:17:21', '2025-05-19 02:17:21');

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
(1, 'Admin', 'Jao', 'admin@gym.com', '03001234567', 1, 1, 0, '2025-05-19 02:08:10', 1, 1, '$2y$10$SzI44UTUH.XtE9.F6PJOOOblhdlh7sYXt/3TMc5slfhwWHq7XuMMq', '6gLCZczc090dRGi37QtGctjeTZa27XEJgB8JJORY39OSqZZCsFIYdn8rsqUN', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(2, 'Ali', 'Khan', 'ali@example.com', '03001112222', 0, 1, 0, '2025-05-19 02:08:10', 1, NULL, '$2y$10$1JC3/l7MNjm27PW0Vj4kh.KmT7OKoyt/oiW8NKXPn5zK2dY5b3NNq', 'lW1s2v5UPv', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(3, 'Sara', 'Ahmed', 'sara@example.com', '03007654321', 0, 0, 0, '2025-05-19 02:08:10', 1, NULL, '$2y$10$MRCximWSg8dOc1jN9CI3iOHkIy0RNND6VhTf8oz.wY61k6vg2cruW', 'lUFd8NqnEL', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(4, 'Gloria', 'Volkman', 'nlueilwitz@example.com', '03510378599', 0, 0, 0, '2025-05-19 02:08:10', 1, NULL, '$2y$10$yoi1thIoMDN5awYS12a3a.IJW3jtvTcaqHYdExlUDHjCB82pAdffq', 'TKfKOsiZFx', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(5, 'Delbert', 'Heathcote', 'christophe.ferry@example.net', '03592214575', 0, 1, 0, '2025-05-19 02:08:10', 1, NULL, '$2y$10$7PcS.MDTBnFFoL.H0oGgnuxCFtRhpOCh0VttMnUzNXKi4bgEWMh8u', 'MG8lwsRwZf', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(6, 'Camren', 'Crooks', 'pjohns@example.com', '03710561212', 0, 1, 0, '2025-05-19 02:08:10', 1, NULL, '$2y$10$vn1duPCR//Z21H.s9FmtieytIaEtB2vWnGXCfAJsLYkI.x7M58mtO', 'eVExMIZ43P', '2025-05-19 02:08:10', '2025-05-19 02:08:10'),
(7, 'Sylvan', 'Nicolas', 'rau.gordon@example.org', '03643483072', 0, 1, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$BTXjqCwGxJMSbWWuxXNGNubypCYCFDgNvmba8p5OCjf9vBSrjRFZq', 'MRLN7rHaaR', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(8, 'Jacinthe', 'Beahan', 'ashlee.schimmel@example.com', '03823649407', 0, 0, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$6Owx1V/TfXFDr52cvcafHu3TEOVEU7deGyxhImV3mHFCzPcA3P2qm', 'z3OWvcz6GE', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(9, 'Desmond', 'Davis', 'gorczany.alaina@example.net', '03696242107', 0, 0, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$hPXXMCIQBVM11uvTh7j5ROdiMhNjrbORjfiTi3Aaio/Z9iTOR.dsu', 'Raceg7qJsy', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(10, 'Rebeca', 'O\'Conner', 'zwalter@example.com', '03371358993', 0, 0, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$JtJPDrToJ1rCPBOpnSZiuOK686.YMikrlvVP3SlCu3K0xYbYA6f.m', 'JAuDAGRiqh', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(11, 'Dock', 'Barrows', 'dalton96@example.org', '03998976607', 0, 0, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$IQMtUFsEWHX/Sn93jrFxGODimrDrjHLpv/bH9x7hd.45Hqxw4oy6a', 'EswhdgDvVG', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(12, 'Gladyce', 'Breitenberg', 'aglae.orn@example.org', '03827337418', 0, 0, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$6bO6lgfbD/.h8LA1M7VLW.POQ14Rsd5KhBlSqhpVrrO5ylQda1jQ2', 'n77mcG4gL4', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(13, 'Bo', 'Harvey', 'hrau@example.com', '03395769459', 0, 1, 0, '2025-05-19 02:08:11', 1, NULL, '$2y$10$0vyjy5/.Kdel/a.Vu79rBePoNYuTJ2DtE2CfHImz07S3wX3IXpn0q', 'dx9BwO8Sv8', '2025-05-19 02:08:11', '2025-05-19 02:08:11'),
(14, 'Dilawar', 'Ayaz', 'asad@gmail.com', '03136316198', 0, 0, 0, NULL, NULL, NULL, '$2y$10$IulbaILi44F6GA874s0zE.uS8u7GFzUGtjcqlx6nVZJ3//jtVfOrW', NULL, '2025-05-19 02:08:48', '2025-05-19 02:08:48'),
(15, 'Dilawar', 'Ayaz', 'fullstack968@gmail.com', '0313631619844', 0, 0, 0, NULL, NULL, NULL, '$2y$10$UP3a0zTwKEzrAQnJdLr6JOBo7qv40VMj6dzilarAzJGhR/lmwYZ4W', NULL, '2025-05-19 02:20:10', '2025-05-19 02:20:10'),
(16, 'asad', 'ayaz', 'sheri@gmail.com', '66666677787899999', 0, 0, 0, NULL, NULL, 2, '$2y$10$UtDoMTfUkpFrqpLUxVXuAuC7oey2MmHENKkWMZkvX/.ZaWkD/4yLi', NULL, '2025-05-19 12:14:39', '2025-05-19 12:14:39');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_histories`
--
ALTER TABLE `payment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
