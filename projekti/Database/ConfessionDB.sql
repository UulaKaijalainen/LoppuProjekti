-- --------------------------------------------------------
-- Verkkotietokone:              127.0.0.1
-- Palvelinversio:               12.0.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versio:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for confessionboard
DROP DATABASE IF EXISTS `confessionboard`;
CREATE DATABASE IF NOT EXISTS `confessionboard` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `confessionboard`;

-- Dumping structure for taulu confessionboard.confessions
DROP TABLE IF EXISTS `confessions`;
CREATE TABLE IF NOT EXISTS `confessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `confession` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table confessionboard.confessions: ~16 rows (suunnilleen)
DELETE FROM `confessions`;
INSERT INTO `confessions` (`id`, `username`, `confession`, `created_at`) VALUES
	(1, 'Kolve', 'dadadw', '2025-11-12 13:52:16'),
	(2, 'Kolve', 'honoo', '2025-11-12 13:53:19'),
	(3, 'Kolve', 'wdfifwk', '2025-11-13 08:04:45'),
	(4, 'Kolve', 'kjejge', '2025-11-13 08:06:44'),
	(5, 'Kolve', 'moi', '2025-11-13 10:41:47'),
	(6, 'Kolve', 'moi', '2025-11-13 10:41:55'),
	(7, 'Kolve', 'heippa', '2025-11-13 10:44:04'),
	(8, 'Kolve', 'sad', '2025-11-13 10:45:07'),
	(9, 'Kolve', 'sad', '2025-11-13 10:48:03'),
	(10, 'Kolve', 'sad', '2025-11-13 10:52:15'),
	(11, 'Kolve', 'sad', '2025-11-13 10:52:32'),
	(12, 'Kolve', 'sad', '2025-11-13 10:53:02'),
	(13, 'Kolve', 'sad', '2025-11-13 10:53:43'),
	(14, 'Kolve', 'sadfas', '2025-11-13 10:57:48'),
	(15, 'Kolve', 'dkkdwwd', '2025-11-14 07:16:58'),
	(16, 'Kolve', 'daaddadada', '2025-11-14 07:18:32');

-- Dumping structure for taulu confessionboard.reports
DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confession_id` int(11) NOT NULL,
  `reporter_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','reviewed','dismissed') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `confession_id` (`confession_id`),
  KEY `reporter_id` (`reporter_id`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`confession_id`) REFERENCES `confessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table confessionboard.reports: ~0 rows (suunnilleen)
DELETE FROM `reports`;

-- Dumping structure for taulu confessionboard.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table confessionboard.users: ~15 rows (suunnilleen)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password_hash`, `age`, `city`, `created_at`, `email`) VALUES
	(1, 'fqfqqf', 'fafafa', 15, 'heheehh', '2025-11-07 10:51:09', '1e9e29@da.com'),
	(2, 'riue', 'fafafa', 16, 'dhahfs', '2025-11-10 07:29:39', 'ufwuuwf@da.com'),
	(3, 'dafafewew', 'fafafa', 17, 'scvsv', '2025-11-10 08:16:00', 'dawdad@dald.com'),
	(4, 'r3wwrwfw', '123456', 18, 'helsinki', '2025-11-10 10:18:22', 'dadadawdad@gmail.com'),
	(5, 'Matias2007', '$2b$10$RULMiPBaQ.ELvu2woeCOruJU5WqAEqqcbVi3VjeXeTPwyyk7cE78u', 18, 'Helsinki', '2025-11-10 10:36:17', 'matiasholmber07@gmail.com'),
	(6, 'Kolve', '$2b$10$e4gI603M9MiAavg7lAi3iOU7reBtX/y8ZF9Q1mkOX9riyVajK1QCK', 18, 'Helsinki', '2025-11-10 10:42:26', 'veeti.kojonen@edu.bc.fi'),
	(7, 'jfjfsjifs', '$2b$10$H7P88bbrYLXODWb8726hSe31Sjuc.FLVuC7ayk8xTATMDTycM5Ns6', 16, 'wdwfw', '2025-11-10 11:07:05', 'wdadada@adkdka.com'),
	(8, 'dadada', '$2b$10$LIONIenfDHCVGqomZlZVMODBbQ2Jio1hqWEe7z8tvtsZHuMi7uF4m', 23, 'adada', '2025-11-10 11:19:59', 'dawdaddd@dald.com'),
	(9, 'fafaf', '$2b$10$GFFYtOp7hHCBQIvAPw1j5OBwyd9JXRD3XL5uUT2NpwuPUfwjeLQGG', 23, 'hhhh', '2025-11-10 11:27:13', 'dawda2d@dald.com'),
	(10, 'dadda', '$2b$10$wvMGCo3PC/t4QTLu2nP.g.7vHmGTyU/LFpA9d0EwItbaOVVnxksUe', 23, 'hhhh', '2025-11-10 11:29:54', 'dawda3d@dald.com'),
	(11, 'qdwwf', '$2b$10$2vNlDcY6hF8/WTuYC/aQnebQybe7BRTcPc/tmfEy24IpHYZ/C/D6G', 22, 'ffffff', '2025-11-10 12:16:33', 'dawda33d@dald.com'),
	(12, 'pdiddy', '$2b$10$Vu5dad930vjIlLtNvJeFF.TLQ2gyTbaa2JOsYcvgE5PfxzXlBwU8i', 60, 'ohio', '2025-11-12 12:22:05', 'pdiddy@pdiddy.pdiddy'),
	(13, 'fssf', '$2b$10$WetXJvc1LgNTRFoGThmay.AxTj1ynEB0wl4JUz6I6qrNDm9SQMG.W', 21, 'fafs', '2025-11-12 12:29:42', 'adaffa@dadajfa.com'),
	(14, 'fsvsv', '$2b$10$Y6784Ig6cojEmefEjefB5O05SNdmNNdHUvc1igHSwXlFGUVk9WWCG', 14, 'affafafa', '2025-11-12 12:30:32', 'dqdww@da.c'),
	(15, 'fewf', '$2b$10$GMPdSLTrXPaS8Uhs3EruF.WSxjKQ.ilZ.4FfhbV8StDk5I/HAZnhe', 21, 'fsfs', '2025-11-12 12:32:34', 'dadad@dadad.ccc');

-- Dumping structure for taulu confessionboard.votes
DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confession_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vote_type` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vote` (`confession_id`,`user_id`),
  CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`confession_id`) REFERENCES `confessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table confessionboard.votes: ~0 rows (suunnilleen)
DELETE FROM `votes`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
