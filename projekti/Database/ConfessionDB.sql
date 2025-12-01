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
  `upvote` int(11) DEFAULT 0,
  `downvote` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table confessionboard.confessions: ~123 rows (suunnilleen)
DELETE FROM `confessions`;
INSERT INTO `confessions` (`id`, `username`, `confession`, `created_at`, `upvote`, `downvote`) VALUES
	(22, 'Kolve', 'haloooooooooo', '2025-11-14 12:52:17', 0, 2),
	(23, 'Kolve', 'helloo', '2025-11-14 12:54:19', 0, 0),
	(24, 'Kolve', 'hellooo', '2025-11-14 13:00:34', 0, 0),
	(25, 'Kolve', 'terveeeeeee', '2025-11-14 13:01:07', 0, 0),
	(26, 'Kolve', 'ewifkufewiufew', '2025-11-14 13:05:33', 0, 0),
	(27, 'Kolve', 'qdkkfwkfwkfwkfwkqkwfkfwkfwkkwkfwkfwkfwklfwlifwjlkfwjoikwjfoikjfwoijkfwoikjfwoifjwoifwoifwoifwfwoijfwoifwoifwfwoijoifwoifwoifwwooowofowofwofolfwlofolfwoolfofspkfwlpfwpfwpfwöfwpkfwpofwpokepofepofw', '2025-11-17 07:22:43', 0, 0),
	(28, 'Kolve', 'w', '2025-11-17 07:29:30', 0, 0),
	(29, 'Kolve', 'huaiddaadidaj', '2025-11-17 07:31:18', 0, 0),
	(30, 'Kolve', 'kkk', '2025-11-17 07:50:20', 0, 0),
	(31, 'Kolve', 'fweifewifwfwofwiwof', '2025-11-17 09:58:44', 0, 0),
	(32, 'Kolve', 'matias on homo', '2025-11-17 09:59:40', 12, 0),
	(33, 'Kolve', 'wwrwrw', '2025-11-17 10:42:01', 0, 0),
	(34, 'Kolve', 'kkewkfkfw', '2025-11-17 10:50:27', 0, 0),
	(35, 'Kolve', 'fsfsfsfsfsfsfsfs', '2025-11-17 10:52:46', 0, 1),
	(36, 'Kolve', 'sqsqsqqssq', '2025-11-17 10:55:25', 0, 1),
	(37, 'Kolve', 'a', '2025-11-17 10:56:59', 1, 0),
	(38, 'Kolve', 'ada', '2025-11-17 10:57:32', 0, 0),
	(39, 'Kolve', 'wadadq', '2025-11-17 10:58:39', 0, 0),
	(40, 'Kolve', 'dadqqd', '2025-11-17 11:02:59', 0, 0),
	(41, 'Kolve', 'dwdwwddw', '2025-11-17 11:11:34', 10, 5),
	(42, 'Kolve', 'dqdqdqqddq', '2025-11-17 11:33:26', 0, 0),
	(43, 'Kolve', 'acaccaca', '2025-11-17 11:45:16', 0, 0),
	(44, 'Kolve', 'dadadaadda', '2025-11-17 11:45:41', 0, 0),
	(45, 'Kolve', 'fsfsfsfs', '2025-11-17 11:52:29', 0, 0),
	(46, 'Kolve', '.,.', '2025-11-17 11:52:46', 1, 0),
	(47, 'Kolve', 'rewfewfwfww', '2025-11-17 11:54:17', 1, 3),
	(48, 'Kolve', 'x<x<', '2025-11-17 12:25:35', 0, 0),
	(49, 'Kolve', 'dwffesw', '2025-11-17 12:26:18', 0, 0),
	(50, 'Kolve', 'juuhujujujuhuhu', '2025-11-18 07:29:56', 0, 0),
	(51, 'Kolve', 'wwwrrwwr', '2025-11-18 07:54:41', 0, 1),
	(52, 'Kolve', 'addadaad', '2025-11-18 07:56:06', 0, 0),
	(53, 'Kolve', 'rwwrrwwr', '2025-11-18 07:56:37', 0, 1),
	(54, 'Kolve', 'ddqqd', '2025-11-18 07:57:50', 0, 0),
	(55, 'Kolve', 'ffsfssfsf', '2025-11-18 07:58:15', 0, 1),
	(56, 'Kolve', 'ddaad', '2025-11-18 07:59:06', 2, 0),
	(57, 'Kolve', 'fewfwfw', '2025-11-18 07:59:31', 1, 1),
	(58, 'Kolve', 'dadadadadaad', '2025-11-18 08:05:46', 1, 6),
	(59, 'Kolve', 'qddd', '2025-11-18 10:12:14', 1, 8),
	(60, 'Kolve', 'sffssf', '2025-11-18 10:23:47', 1, 0),
	(61, 'Kolve', 'jjdjf', '2025-11-18 10:52:00', 0, 0),
	(62, 'Kolve', 'kifwkfek', '2025-11-18 10:53:22', 1, 0),
	(63, 'Kolve', 'ewlir3qedwoijdqoijiqd', '2025-11-19 07:34:29', 1, 0),
	(64, 'Kolve', 'pihohooihoiji', '2025-11-19 07:35:24', 1, 0),
	(65, 'Kolve', 'WWUNFW', '2025-11-19 07:49:59', 1, 0),
	(66, 'Kolve', 'daidaida', '2025-11-19 07:50:30', 1, 0),
	(67, 'Kolve', 'dadaaddada', '2025-11-19 07:51:47', 1, 0),
	(68, 'Kolve', 'daddadadadada', '2025-11-19 07:55:42', 2, 0),
	(69, 'Kolve', 'rwkmfifwfw', '2025-11-19 07:57:40', 1, 1),
	(70, 'Kolve', 'dadakdada', '2025-11-19 08:30:21', 0, 1),
	(71, 'Kolve', 'iudahudaa', '2025-11-19 08:32:59', 1, 0),
	(72, 'Kolve', 'fsfsfsfsfs', '2025-11-19 08:35:19', 0, 1),
	(73, 'Kolve', 'dakjdakjad', '2025-11-19 08:35:45', 1, 0),
	(74, 'Kolve', 'jwnfwjfw', '2025-11-19 08:35:59', 1, 0),
	(75, 'Kolve', 'lowkfwfw', '2025-11-19 08:40:25', 1, 0),
	(76, 'Kolve', 'adadada', '2025-11-19 08:41:47', 0, 1),
	(77, 'Kolve', 'ddadada', '2025-11-19 09:30:46', 0, 1),
	(78, 'Kolve', 'dadjajad', '2025-11-19 09:31:40', 0, 1),
	(79, 'Matias2007', 'juon ES ja syön muffinseja ja minulla on Gambling addiktio', '2025-11-19 09:35:52', 0, 1),
	(80, 'Kolve', 'dadaadda', '2025-11-19 09:41:39', 0, 1),
	(81, 'Kolve', 'zcacacacacacacacacaca', '2025-11-19 09:42:18', 1, 0),
	(82, 'Kolve', 'l', '2025-11-19 10:51:01', 1, 0),
	(83, 'Kolve', 'hello my name is uula', '2025-11-19 11:38:20', 1, 0),
	(84, 'Kolve', 'dqwwffwfw', '2025-11-20 07:31:40', 1, 1),
	(85, 'Matias2007', 'dwjfwjf', '2025-11-20 07:51:29', 0, 1),
	(86, 'Kolve', '.\n', '2025-11-20 07:58:36', 0, 0),
	(87, 'Kolve', '.', '2025-11-20 07:58:55', 0, 0),
	(88, 'Kolve', 'ytytytyty', '2025-11-20 08:05:04', 0, 1),
	(89, 'Kolve', 'dqqddqdqdqdq', '2025-11-20 08:06:02', 1, 0),
	(90, 'Kolve', 'iitiee', '2025-11-20 08:07:35', 0, 1),
	(91, 'Kolve', 'moi', '2025-11-20 08:36:07', 0, 1),
	(92, 'Kolve', 'moi', '2025-11-20 08:39:28', 0, 1),
	(93, 'Kolve', ' lioioidqoidqw', '2025-11-20 09:33:45', 0, 1),
	(94, 'Kolve', 'fefewfewefentanylfsfkssf', '2025-11-20 10:11:00', 0, 1),
	(95, 'Kolve', 'fwkjfwhfwjfw', '2025-11-20 10:21:40', 0, 1),
	(96, 'Kolve', 'daffsfs', '2025-11-20 10:22:16', 1, 0),
	(97, 'Kolve', 'fijfjsijsf', '2025-11-20 10:24:09', 0, 1),
	(98, 'Kolve', 'wdfekjfwkjfw', '2025-11-20 10:49:55', 1, 0),
	(99, 'Kolve', '9r32i8r99r', '2025-11-24 07:56:09', 1, 1),
	(100, 'Matias2007', 'dadaaddadadada', '2025-11-24 07:56:40', 1, 0),
	(101, 'Kolve', 'moi', '2025-11-24 08:14:24', 0, 0),
	(102, 'Kolve', 'sadsasadsa', '2025-11-24 08:19:30', 1, 0),
	(103, 'Kolve', 'moi', '2025-11-24 08:23:57', 1, 0),
	(104, 'Kolve', 'moi', '2025-11-24 08:24:13', 0, 0),
	(105, 'Matias2007', 'terve\n', '2025-11-24 08:24:49', 0, 0),
	(106, 'Kolve', 'hello everybody', '2025-11-24 09:56:40', 0, 1),
	(107, 'Kolve', 'fswfssfs', '2025-11-24 10:07:50', 1, 0),
	(108, 'Matias2007', 'qwffwfwfw', '2025-11-24 10:08:10', 0, 0),
	(109, 'Kolve', 'dokdkakada', '2025-11-24 10:30:15', 0, 0),
	(110, 'Kolve', 'sdada', '2025-11-24 10:48:27', 0, 0),
	(111, 'Kolve', 'fssffsfs', '2025-11-24 10:49:38', 0, 0),
	(112, 'Kolve', 'e2qdada', '2025-11-24 10:49:52', 0, 0),
	(113, 'Kolve', 'cadadada', '2025-11-24 10:52:32', 0, 0),
	(114, 'Kolve', 'addadadadad', '2025-11-24 11:17:29', 0, 0),
	(115, 'Kolve', 'FSFSFSFS', '2025-11-24 11:20:45', 0, 0),
	(116, 'Kolve', 'fsfsfsfs', '2025-11-24 11:24:07', 0, 0),
	(117, 'Kolve', 'dadada', '2025-11-24 11:28:38', 0, 0),
	(118, 'Kolve', 'acacacaca', '2025-11-24 11:30:59', 0, 0),
	(119, 'Kolve', 'csszcs', '2025-11-24 11:36:45', 0, 0),
	(120, 'Kolve', 'czcczczzc', '2025-11-24 11:41:18', 0, 0),
	(121, 'Matias2007', 'dadadadad', '2025-11-24 11:42:35', 0, 0),
	(122, 'Kolve', 'accacacacaca', '2025-11-24 11:47:35', 0, 0),
	(123, 'Kolve', 'addada', '2025-11-24 11:52:33', 0, 0),
	(124, 'Kolve', 'acccaca', '2025-11-24 11:54:11', 0, 0),
	(125, 'Kolve', 'fsfsfsfsfs', '2025-11-24 12:01:30', 0, 0),
	(126, 'Kolve', 'aadadadda', '2025-11-24 12:05:30', 0, 0),
	(127, 'Kolve', 'daddadada', '2025-11-24 12:05:50', 0, 0),
	(128, 'Kolve', 'aaddaaddada', '2025-11-24 12:08:54', 0, 0),
	(129, 'Kolve', 'adadadadadada', '2025-11-24 12:10:07', 0, 0),
	(130, 'Kolve', 'dadadadada', '2025-11-24 12:11:45', 0, 0),
	(131, 'Kolve', 'adadadadada', '2025-11-24 12:15:03', 0, 0),
	(132, 'Kolve', 'fssffsfs', '2025-11-25 07:21:43', 0, 0),
	(133, 'Kolve', 'dadadada', '2025-11-25 07:38:55', 0, 0),
	(134, 'Kolve', 'aaddada', '2025-11-25 07:39:49', 0, 0),
	(135, 'Kolve', 'afffafafa', '2025-11-25 07:43:59', 0, 0),
	(136, 'Kolve', 'dadadadada', '2025-11-25 07:47:18', 0, 0),
	(137, 'Kolve', 'addadada', '2025-11-25 08:16:40', 0, 0),
	(138, 'Kolve', 'addajadhda', '2025-11-25 08:20:32', 0, 0),
	(139, 'Kolve', 'cacacacaca', '2025-11-25 08:20:54', 0, 0),
	(140, 'Kolve', 'adadaadda', '2025-11-26 07:53:03', 0, 0),
	(141, 'Kolve', 'addadadada', '2025-11-26 07:53:27', 0, 0),
	(142, 'Kolve', 'dadadada', '2025-11-26 08:12:40', 0, 0),
	(143, 'Kolve', 'dadadadada', '2025-11-26 08:15:36', 0, 0),
	(144, 'Kolve', 'wqddqlda', '2025-11-26 08:17:50', 0, 0);

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

-- Dumping data for table confessionboard.users: ~14 rows (suunnilleen)
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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table confessionboard.votes: ~51 rows (suunnilleen)
DELETE FROM `votes`;
INSERT INTO `votes` (`id`, `confession_id`, `user_id`, `vote_type`, `created_at`) VALUES
	(1, 93, 6, -1, '2025-11-20 09:44:44'),
	(2, 92, 6, -1, '2025-11-20 09:50:07'),
	(3, 94, 6, -1, '2025-11-20 10:11:04'),
	(4, 91, 6, -1, '2025-11-20 10:20:53'),
	(5, 95, 6, -1, '2025-11-20 10:21:42'),
	(6, 90, 6, -1, '2025-11-20 10:22:21'),
	(7, 88, 6, -1, '2025-11-20 10:22:23'),
	(8, 89, 6, 1, '2025-11-20 10:23:55'),
	(9, 97, 6, -1, '2025-11-20 10:24:11'),
	(10, 96, 6, 1, '2025-11-20 10:24:12'),
	(11, 68, 6, 1, '2025-11-20 10:40:19'),
	(12, 69, 6, -1, '2025-11-20 10:40:20'),
	(13, 98, 6, 1, '2025-11-20 10:50:04'),
	(14, 84, 6, -1, '2025-11-20 10:50:08'),
	(15, 99, 6, 1, '2025-11-24 07:56:11'),
	(16, 99, 5, -1, '2025-11-24 07:57:22'),
	(17, 100, 5, 1, '2025-11-24 08:13:38'),
	(18, 102, 6, 1, '2025-11-24 08:24:00'),
	(19, 103, 6, 1, '2025-11-24 08:24:01'),
	(20, 106, 6, -1, '2025-11-24 09:56:43'),
	(21, 107, 6, 1, '2025-11-24 10:07:52'),
	(22, 113, 6, -1, '2025-11-24 11:17:00'),
	(29, 114, 6, -1, '2025-11-24 11:17:31'),
	(33, 115, 6, 1, '2025-11-24 11:20:47'),
	(36, 116, 6, 1, '2025-11-24 11:24:21'),
	(38, 117, 6, -1, '2025-11-24 11:28:40'),
	(44, 118, 6, 1, '2025-11-24 11:31:01'),
	(49, 119, 6, 1, '2025-11-24 11:36:46'),
	(57, 111, 6, -1, '2025-11-24 11:37:01'),
	(62, 120, 6, -1, '2025-11-24 11:41:21'),
	(63, 120, 5, -1, '2025-11-24 11:42:38'),
	(64, 122, 6, 1, '2025-11-24 11:47:38'),
	(65, 123, 6, 1, '2025-11-24 11:52:35'),
	(69, 124, 6, -1, '2025-11-24 11:54:12'),
	(70, 121, 6, -1, '2025-11-24 11:55:35'),
	(71, 125, 6, -1, '2025-11-24 12:01:31'),
	(73, 126, 6, -1, '2025-11-24 12:05:31'),
	(74, 127, 6, 1, '2025-11-24 12:05:51'),
	(76, 128, 6, -1, '2025-11-24 12:08:55'),
	(77, 129, 6, -1, '2025-11-24 12:10:08'),
	(78, 130, 6, -1, '2025-11-24 12:11:46'),
	(79, 131, 6, 1, '2025-11-24 12:15:04'),
	(93, 132, 6, -1, '2025-11-25 07:21:45'),
	(94, 135, 6, 1, '2025-11-25 07:44:01'),
	(96, 136, 6, 1, '2025-11-25 07:47:20'),
	(103, 137, 6, -1, '2025-11-25 08:16:42'),
	(104, 141, 6, 1, '2025-11-26 07:53:28'),
	(106, 140, 6, -1, '2025-11-26 07:53:30'),
	(107, 139, 6, 1, '2025-11-26 07:53:31'),
	(111, 142, 6, -1, '2025-11-26 08:12:42'),
	(114, 143, 6, 1, '2025-11-26 08:15:37'),
	(117, 144, 6, -1, '2025-11-26 08:17:52'),
	(125, 144, 5, 1, '2025-11-26 08:35:22'),
	(135, 143, 5, -1, '2025-11-26 08:35:55');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
