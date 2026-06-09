-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2026 at 07:53 AM
-- Server version: 8.4.7
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_08_120843_create_real_estates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `real_estates`
--

DROP TABLE IF EXISTS `real_estates`;
CREATE TABLE IF NOT EXISTS `real_estates` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_state_type` enum('house','department','land','commercial_ground') COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_number` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rooms` int NOT NULL,
  `bathrooms` decimal(8,2) NOT NULL,
  `comments` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `real_estates`
--

INSERT INTO `real_estates` (`id`, `name`, `real_state_type`, `street`, `external_number`, `internal_number`, `neighborhood`, `city`, `country`, `rooms`, `bathrooms`, `comments`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cole LLC', 'department', 'Elliott Path', '57GP', 'N60', 'bury', 'ujjain', 'IN', 3, 2.90, 'Ut sit numquam labore saepe quod.', '2026-06-08 13:04:30', '2026-06-08 07:30:24', '2026-06-08 13:04:30'),
(2, 'Batz-Prohaska', 'land', 'Raynor Streets', '25NK', NULL, 'furt', 'ujjain', 'IN', 6, 2.20, 'Quae veritatis voluptates ullam ut ex praesentium eaque.', '2026-06-08 13:02:49', '2026-06-08 07:30:24', '2026-06-08 13:02:49'),
(3, 'Kozey PLC', 'commercial_ground', 'Donna Ridges', '90LC', 'Y17', 'town', 'ujjain', 'IN', 7, 2.10, 'Et exercitationem reprehenderit animi architecto doloribus ratione.', '2026-06-08 13:06:46', '2026-06-08 07:30:24', '2026-06-08 13:06:46'),
(4, 'Rogahn-Walker', 'department', 'Cyrus Shoals', '39ZK', 'R31', 'mouth', 'bhopal', 'IN', 4, 1.90, 'Sed porro eveniet sint.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(5, 'Denesik and Sons', 'department', 'Baumbach Common', '61NL', 'V72', 'chester', 'indore', 'IN', 0, 4.60, 'Assumenda est cum qui quo ad fuga enim.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(6, 'Yost, Block and Hartmann', 'commercial_ground', 'Runolfsdottir Terrace', '99GX', 'Z40', 'ville', 'indore', 'IN', 6, 1.00, 'Totam veniam recusandae quos et.', '2026-06-08 13:02:34', '2026-06-08 07:30:24', '2026-06-08 13:02:34'),
(7, 'Homenick, Ondricka and Raynor', 'land', 'Wuckert Ferry', '59EM', NULL, 'berg', 'dewas', 'IN', 6, 3.00, 'Architecto porro iste repellendus accusantium a velit.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(8, 'Pollich Group', 'house', 'McGlynn Locks', '87TX', NULL, 'port', 'bhopal', 'IN', 0, 5.00, 'Sit dolor aut asperiores quisquam praesentium reiciendis.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(9, 'Ryan-Barton', 'land', 'Catalina Cliff', '94EU', NULL, 'side', 'indore', 'IN', 3, 3.90, 'Quos praesentium esse ut odio voluptatibus blanditiis.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(10, 'Trantow, Berge and Kohler', 'land', 'Bergnaum Walk', '14RK', NULL, 'mouth', 'indore', 'IN', 5, 1.30, 'Nobis aut occaecati sit hic possimus id.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(11, 'Volkman, Kovacek and Russel', 'land', 'Jimmie Lock', '69NH', NULL, 'view', 'indore', 'IN', 7, 3.20, 'Debitis magni nisi et voluptatem commodi sapiente fugiat.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(12, 'Bahringer-Jaskolski', 'commercial_ground', 'Chet Row', '27PF', 'R38', 'stad', 'dewas', 'IN', 8, 4.50, 'Et error aut et ex quia occaecati.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(13, 'Brekke LLC', 'house', 'Borer Hills', '49QV', NULL, 'shire', 'bhopal', 'IN', 4, 3.50, 'Voluptate harum itaque molestias vel corrupti nostrum non debitis.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(14, 'Ortiz and Sons', 'commercial_ground', 'Nolan Squares', '08VI', 'Z20', 'land', 'bhopal', 'IN', 5, 0.50, 'Autem asperiores facere quibusdam ab eos et veniam.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(15, 'Hirthe, Reichert and Hartmann', 'land', 'Beahan Circle', '54MF', NULL, 'mouth', 'indore', 'IN', 3, 2.20, 'Earum quos tempore nam libero perferendis quas aut autem.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(16, 'Corkery, Treutel and Jaskolski', 'house', 'Durgan Mission', '95EY', NULL, 'berg', 'indore', 'IN', 1, 4.90, 'Voluptas et sed omnis autem.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(17, 'Ferry-Bednar', 'land', 'Davis Creek', '30ER', NULL, 'borough', 'dewas', 'IN', 5, 3.10, 'Aut rerum cumque rerum recusandae exercitationem quis.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(18, 'Will, Quigley and Halvorson', 'department', 'Lila Plains', '16VG', 'R99', 'haven', 'dewas', 'IN', 3, 4.10, 'Vero corrupti libero quisquam placeat ab.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(19, 'Strosin Inc', 'department', 'Orion Valley', '19CN', 'Z64', 'fort', 'bhopal', 'IN', 4, 3.40, 'Doloribus officia beatae voluptas sequi quos repellat est.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(20, 'Schumm-Johnston', 'department', 'Mohamed Flat', '00EE', 'D31', 'ton', 'indore', 'IN', 4, 0.80, 'Quis dolore fuga ducimus modi.', NULL, '2026-06-08 07:30:24', '2026-06-08 07:30:24'),
(21, 'Deepak malviya5', 'house', 'House 13', '2323', '232', '232', 'indore', 'IN', 12, 13.00, 'wew', NULL, '2026-06-08 10:00:33', '2026-06-08 11:14:07'),
(22, 'Business Park', 'commercial_ground', '76 bengali square', '1234567894', '2121211212', 'neighbor', 'bhopal', 'IN', 5, 5.00, 'test comments', NULL, '2026-06-08 12:46:58', '2026-06-08 12:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1uvRmwH1HVQTGa7uwAYb9Gf3BZu9VD0N7Zo5TomC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJkZVZIYVhxZzFOYU1ad2FEa1RUTU9hcGxZUEtrajdGdkNRc3RYNEZqIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluXC9wcm9wZXJ0aWVzIiwicm91dGUiOiJwcm9wZXJ0aWVzLmluZGV4In0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyfQ==', 1780949792);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Deepak malviya', 'deepak.malviya23@gmail.com', NULL, '$2y$12$Cpdm0ltotEDGyt7qdPPucusrmhoQjiKSO99iSTlVXn3NXvXzvQNYq', NULL, '2026-06-08 08:02:02', '2026-06-08 08:02:02'),
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$12$Kta9VOD.Gkp0g0TyfpHGI.xuExvptMIfDKxjLLAcbIigb26WNpE8G', NULL, '2026-06-08 09:08:13', '2026-06-08 09:08:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
