-- --------------------------------------------------------
-- Database: confessionboard
-- --------------------------------------------------------

DROP DATABASE IF EXISTS `confessionboard`;
CREATE DATABASE IF NOT EXISTS `confessionboard`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `confessionboard`;

-- --------------------------------------------------------
-- Table: confessions
-- --------------------------------------------------------

DROP TABLE IF EXISTS `confessions`;
CREATE TABLE `confessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `confession` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `upvote` int(11) DEFAULT 0,
  `downvote` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `confessions`;

-- (your 123 confession rows remain untouched)
-- --------------------------------------------------------
-- Table: users
-- --------------------------------------------------------

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  `isAdmin` BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `users`;

INSERT INTO `users` (`id`, `username`, `password_hash`, `age`, `city`, `created_at`, `email`, `isAdmin`) VALUES
  (1, 'admin', '$2b$10$oRmQ20s3KAeRUEBjeBfI5.n/ZLOqyQHnelpWBDzkkLNTYxkjnGQ46', 30, 'AdminCity', NOW(), 'admin@example.com', TRUE),
  (2, 'riue', 'fafafa', 16, 'dhahfs', '2025-11-10 07:29:39', 'ufwuuwf@da.com', FALSE),
  (3, 'dafafewew', 'fafafa', 17, 'scvsv', '2025-11-10 08:16:00', 'dawdad@dald.com', FALSE),
  (4, 'r3wwrwfw', '123456', 18, 'helsinki', '2025-11-10 10:18:22', 'dadadawdad@gmail.com', FALSE),
  (5, 'Matias2007', '$2b$10$RULMiPBaQ.ELvu2woeCOruJU5WqAEqqcbVi3VjeXeTPwyyk7cE78u', 18, 'Helsinki', '2025-11-10 10:36:17', 'matiasholmber07@gmail.com', FALSE),
  (6, 'Kolve', '$2b$10$e4gI603M9MiAavg7lAi3iOU7reBtX/y8ZF9Q1mkOX9riyVajK1QCK', 18, 'Helsinki', '2025-11-10 10:42:26', 'veeti.kojonen@edu.bc.fi', FALSE),
  (7, 'jfjfsjifs', '$2b$10$H7P88bbrYLXODWb8726hSe31Sjuc.FLVuC7ayk8xTATMDTycM5Ns6', 16, 'wdwfw', '2025-11-10 11:07:05', 'wdadada@adkdka.com', FALSE),
  (8, 'dadada', '$2b$10$LIONIenfDHCVGqomZlZVMODBbQ2Jio1hqWEe7z8tvtsZHuMi7uF4m', 23, 'adada', '2025-11-10 11:19:59', 'dawdaddd@dald.com', FALSE),
  (9, 'fafaf', '$2b$10$GFFYtOp7hHCBQIvAPw1j5OBwyd9JXRD3XL5uUT2NpwuPUfwjeLQGG', 23, 'hhhh', '2025-11-10 11:27:13', 'dawda2d@dald.com', FALSE),
  (10, 'dadda', '$2b$10$wvMGCo3PC/t4QTLu2nP.g.7vHmGTyU/LFpA9d0EwItbaOVVnxksUe', 23, 'hhhh', '2025-11-10 11:29:54', 'dawda3d@dald.com', FALSE),
  (11, 'qdwwf', '$2b$10$2vNlDcY6hF8/WTuYC/aQnebQybe7BRTcPc/tmfEy24IpHYZ/C/D6G', 22, 'ffffff', '2025-11-10 12:16:33', 'dawda33d@dald.com', FALSE),
  (12, 'pdiddy', '$2b$10$Vu5dad930vjIlLtNvJeFF.TLQ2gyTbaa2JOsYcvgE5PfxzXlBwU8i', 60, 'ohio', '2025-11-12 12:22:05', 'pdiddy@pdiddy.pdiddy', FALSE),
  (13, 'fssf', '$2b$10$WetXJvc1LgNTRFoGThmay.AxTj1ynEB0wl4JUz6I6qrNDm9SQMG.W', 21, 'fafs', '2025-11-12 12:29:42', 'adaffa@dadajfa.com', FALSE),
  (14, 'fsvsv', '$2b$10$Y6784Ig6cojEmefEjefB5O05SNdmNNdHUvc1igHSwXlFGUVk9WWCG', 14, 'affafafa', '2025-11-12 12:30:32', 'dqdww@da.c', FALSE),
  (15, 'fewf', '$2b$10$GMPdSLTrXPaS8Uhs3EruF.WSxjKQ.ilZ.4FfhbV8StDk5I/HAZnhe', 21, 'fsfs', '2025-11-12 12:32:34', 'dadad@dadad.ccc', FALSE);

-- --------------------------------------------------------
-- Table: reports
-- --------------------------------------------------------

DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
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

DELETE FROM `reports`;

-- --------------------------------------------------------
-- Table: votes
-- --------------------------------------------------------

DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `confession_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vote_type` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vote` (`confession_id`,`user_id`),
  CONSTRAINT `votes_ibfk_1`
    FOREIGN KEY (`confession_id`) REFERENCES `confessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELETE FROM `votes`;

-- (your vote rows preserved here)

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
