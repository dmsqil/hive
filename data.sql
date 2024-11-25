-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk hive
DROP DATABASE IF EXISTS `hive`;
CREATE DATABASE IF NOT EXISTS `hive` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hive`;

-- membuang struktur untuk table hive.activities
DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_user_id_foreign` (`user_id`),
  CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.activities: ~0 rows (lebih kurang)
DELETE FROM `activities`;

-- membuang struktur untuk table hive.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.comments: ~19 rows (lebih kurang)
DELETE FROM `comments`;
INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
	(2, 7, 8, 'Libero dignissimos consectetur dolor occaecati sed sit. Quia assumenda nulla maxime voluptatem ut amet consequatur. Adipisci architecto et et dolore. Unde excepturi culpa vel molestias vel sed. Et ullam ea omnis debitis minima doloribus accusamus.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(3, 7, 5, 'Ut sed nihil commodi. Perspiciatis praesentium ut ut pariatur. Sed veritatis non quod aperiam corrupti odio officia. Qui temporibus quae repellat eveniet nostrum.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(4, 2, 4, 'Voluptas repudiandae exercitationem sit velit quod velit. Rerum asperiores est quo tempora velit. Nulla qui est nobis eum soluta qui quam.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(5, 9, 1, 'Consectetur architecto ut ea unde. Voluptatem explicabo ab alias exercitationem laborum ut iusto. Ea assumenda sit quia ut doloribus iusto. Beatae et dolor consequatur molestias illum esse.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(6, 2, 5, 'Et dolor nihil ratione sit itaque. Voluptatem qui facilis nostrum commodi. Totam illum maxime error magni vel a eligendi aliquid.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(7, 11, 4, 'Natus qui expedita exercitationem. Dolor corporis perferendis quod rerum illum. Laborum dolor atque quia nam id molestiae possimus.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(8, 8, 2, 'Quia eos cum est. Rem sit sit maxime. Praesentium sit voluptatem et ut. Qui dolorem rerum tenetur.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(9, 4, 2, 'Velit a illo blanditiis et minima. Est aperiam accusantium ab quod consequatur. Eum alias inventore est dolorem ut deserunt quo sint. Cupiditate cumque vel distinctio vero dolorem.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(10, 8, 7, 'Ullam qui distinctio ducimus vel consequatur laborum ratione. Vero molestiae voluptas qui et.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(11, 5, 11, 'Sapiente alias perspiciatis non non. Eum deserunt velit itaque iure. Est consequatur officia est aut.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(12, 11, 9, 'Qui labore qui hic aut. Iusto aut ut perferendis. Est sit similique ea numquam sit quasi. Molestiae sunt cum quas animi voluptatibus et qui.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(13, 9, 5, 'Ut reiciendis quia esse in. Blanditiis dolore sed ipsa unde explicabo maiores nisi. Temporibus sunt minima dolor eveniet. Vitae voluptatum maxime sed ullam fuga cumque dignissimos.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(14, 11, 4, 'Praesentium natus est provident non laborum. Ab expedita ut omnis dolores commodi temporibus.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(15, 2, 5, 'Impedit saepe aut harum omnis. Ut omnis quibusdam et provident aut dolorum. Quas architecto debitis adipisci nisi nihil. Placeat est sit nobis voluptatum ducimus.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(16, 7, 11, 'Explicabo dolor quae quia aliquam id et ad quo. Qui sed ut explicabo itaque aperiam. Illum modi praesentium saepe sed est minima. Perspiciatis magnam eius eligendi.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(17, 9, 4, 'Voluptas neque accusamus ut excepturi. Saepe commodi rerum libero nulla sunt excepturi. Hic voluptatum aliquid ut et aut maxime. Enim est aliquid laudantium fugit.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(18, 7, 7, 'Optio voluptatem aut voluptate nihil consectetur quam qui. Asperiores et tempora illo ad. Facere voluptatibus quis et sint. Reiciendis blanditiis ex quos itaque.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(19, 2, 8, 'Ratione praesentium est perferendis officiis vel. Harum totam vel eveniet et corporis non vel. Delectus ad voluptatem vel error. Sunt quaerat porro illo sunt maxime voluptatem possimus.', '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(20, 11, 6, 'Sapiente iste animi officiis aut quibusdam reprehenderit. A iste earum cumque voluptas sunt dolorum rem.', '2024-11-25 07:26:07', '2024-11-25 07:26:07');

-- membuang struktur untuk table hive.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.failed_jobs: ~0 rows (lebih kurang)
DELETE FROM `failed_jobs`;

-- membuang struktur untuk table hive.followers
DROP TABLE IF EXISTS `followers`;
CREATE TABLE IF NOT EXISTS `followers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `followers_user_id_follower_id_unique` (`user_id`,`follower_id`),
  KEY `followers_follower_id_foreign` (`follower_id`),
  CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.followers: ~0 rows (lebih kurang)
DELETE FROM `followers`;

-- membuang struktur untuk table hive.likes
DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `comment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_post_id_foreign` (`post_id`),
  KEY `likes_comment_id_foreign` (`comment_id`),
  CONSTRAINT `likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.likes: ~18 rows (lebih kurang)
DELETE FROM `likes`;
INSERT INTO `likes` (`id`, `user_id`, `post_id`, `comment_id`, `created_at`, `updated_at`) VALUES
	(1, 8, NULL, 4, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(3, 8, 7, 16, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(5, 7, NULL, 8, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(6, 1, NULL, 5, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(7, 9, NULL, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(8, 11, 8, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(9, 11, 3, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(10, 3, NULL, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(11, 4, 8, 9, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(12, 2, NULL, 7, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(13, 5, NULL, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(14, 9, NULL, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(15, 10, 6, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(16, 10, NULL, 17, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(17, 9, NULL, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(18, 9, 11, 17, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(19, 2, 9, NULL, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(20, 9, NULL, 13, '2024-11-25 07:26:07', '2024-11-25 07:26:07');

-- membuang struktur untuk table hive.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.migrations: ~0 rows (lebih kurang)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2021_06_10_131515_create_posts_table', 1),
	(6, '2021_06_10_131527_create_comments_table', 1),
	(7, '2021_06_10_131538_create_likes_table', 1),
	(8, '2024_11_22_165829_create_followers_table', 1),
	(9, '2024_11_22_165924_create_search_histories_table', 1),
	(10, '2024_11_22_170047_create_activities_table', 1),
	(11, '2024_11_22_170153_create_settings_table', 1);

-- membuang struktur untuk table hive.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.password_resets: ~0 rows (lebih kurang)
DELETE FROM `password_resets`;

-- membuang struktur untuk table hive.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.personal_access_tokens: ~0 rows (lebih kurang)
DELETE FROM `personal_access_tokens`;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'auth_token', '4deb85ea1a01df3d2930ef14c47972b47fd062b8df10d644a9f93dfff784bf87', '["*"]', '2024-11-25 07:52:01', '2024-11-25 07:27:57', '2024-11-25 07:52:01'),
	(2, 'App\\Models\\User', 1, 'auth_token', '78c3b9ffe3c3c4356cbed1ce1ac494da0b08734ab023f36ad964b4e34b67af53', '["*"]', '2024-11-25 07:44:58', '2024-11-25 07:44:42', '2024-11-25 07:44:58'),
	(3, 'App\\Models\\User', 1, 'auth_token', 'f8be01a4cf3832754f0f7ff21b0fedcb721d395ff8fec1308d479c3e926ad40b', '["*"]', '2024-11-25 07:49:07', '2024-11-25 07:45:44', '2024-11-25 07:49:07');

-- membuang struktur untuk table hive.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like_count` int NOT NULL DEFAULT '0',
  `comment_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.posts: ~11 rows (lebih kurang)
DELETE FROM `posts`;
INSERT INTO `posts` (`id`, `user_id`, `body`, `image`, `like_count`, `comment_count`, `created_at`, `updated_at`) VALUES
	(2, 10, 'Rerum minima reprehenderit explicabo quam. Sapiente beatae reiciendis voluptatem ea numquam voluptatem.', 'https://via.placeholder.com/640x480.png/00dd77?text=nostrum', 62, 33, '2024-11-25 07:26:07', '2024-11-25 07:52:01'),
	(3, 2, 'Minus quos quae dignissimos soluta dolorem. Et dolorem quaerat incidunt consectetur. Sed iusto ratione tenetur aliquid cumque nam voluptate labore. Voluptatem culpa unde et nostrum rerum et quidem.', 'https://via.placeholder.com/640x480.png/007700?text=voluptate', 98, 44, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(4, 5, 'Qui laudantium officiis consectetur et quia. Officiis maxime perspiciatis quibusdam quasi nobis. Distinctio veniam quam qui voluptatem ad.', 'https://via.placeholder.com/640x480.png/0099ee?text=porro', 19, 14, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(5, 5, 'Dolorem laboriosam repudiandae quidem voluptatibus eius unde. Velit aliquam eum eos minima tempore omnis at soluta. Perferendis illum eveniet ipsam tempore ea. Est quae molestiae repellat quaerat.', 'https://via.placeholder.com/640x480.png/00aa88?text=dignissimos', 84, 9, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(6, 3, 'Repellendus officiis necessitatibus rerum. Ratione delectus nihil est corporis neque. Ducimus quia repudiandae ullam reprehenderit tempore.', 'https://via.placeholder.com/640x480.png/00ff11?text=omnis', 37, 25, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(7, 5, 'Ut aut excepturi suscipit asperiores laboriosam. Dolorem laboriosam eos facilis et dolore nihil pariatur qui. Aut ut omnis necessitatibus tenetur. Minima deserunt sit quia consequatur.', 'https://via.placeholder.com/640x480.png/0088ff?text=reprehenderit', 40, 32, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(8, 6, 'Sapiente illo delectus quia id eos qui. Sit maxime sed sit veritatis est quia. Molestiae dignissimos et autem ratione aspernatur minus dolorem. Harum voluptates ipsam dolorem maiores.', 'https://via.placeholder.com/640x480.png/00bb88?text=hic', 93, 17, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(9, 1, 'Aspernatur ipsa maiores id magni nemo et quisquam. Repudiandae perferendis deleniti illo quidem quisquam qui magni. Amet deserunt nobis repellendus est sunt saepe quo.', 'https://via.placeholder.com/640x480.png/0066cc?text=non', 88, 23, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(10, 7, 'Quae sed neque beatae sit sunt. Velit sed ducimus sit velit soluta. Illum ipsam reiciendis dolorem omnis facere consequatur recusandae. Est in libero ullam officiis hic.', 'https://via.placeholder.com/640x480.png/00ff11?text=ea', 89, 17, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(11, 11, 'Vitae dolores eveniet temporibus et. Officia tempora tenetur nesciunt quis impedit consectetur. Repudiandae optio ipsum id. Ut voluptas ab recusandae sapiente dolorem nemo qui ut.', 'https://via.placeholder.com/640x480.png/00cccc?text=et', 65, 48, '2024-11-25 07:26:07', '2024-11-25 07:26:07'),
	(12, 1, 'post terbaru', NULL, 0, 0, '2024-11-25 07:30:40', '2024-11-25 07:30:40');

-- membuang struktur untuk table hive.search_histories
DROP TABLE IF EXISTS `search_histories`;
CREATE TABLE IF NOT EXISTS `search_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `search_term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `search_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.search_histories: ~0 rows (lebih kurang)
DELETE FROM `search_histories`;

-- membuang struktur untuk table hive.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `notifications_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_user_id_foreign` (`user_id`),
  CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.settings: ~0 rows (lebih kurang)
DELETE FROM `settings`;

-- membuang struktur untuk table hive.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel hive.users: ~11 rows (lebih kurang)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `bio`, `image`, `is_verified`, `created_at`, `updated_at`) VALUES
	(1, 'user', 'user@u.u', '$2y$10$1tDWNTbDxnmrddQrjj4ap.YO6JxZ6Laa8vcH4XkHRQQYvY4waGnti', NULL, NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(2, 'Mrs. Mina Wolff', 'arlo46@example.org', '$2y$10$cK/0jSuYZwX69P3/icabPOWMmeEH0UFuJEaPmdfb3/kUtWG792nTS', 'Unde facere et consectetur dolorum.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(3, 'Brown Rath', 'newell.predovic@example.org', '$2y$10$.t0XGh.1ZUb5EI8T4OaLkeTjGIv0ba3P/oI3IsNcDV9lS67XUmkZW', 'Sapiente earum ipsa qui sed velit.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(4, 'Retta Veum', 'schinner.reagan@example.com', '$2y$10$r4MRTXrhmDggz/lFq9bNc.l78.IiJ6rIj5eWEDrmhdUOM5CwTjKWy', 'Sed est et pariatur.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(5, 'Evangeline Kshlerin', 'lynch.willy@example.org', '$2y$10$MVBPT6DRfZTQzJR7.0Pp1eVm3RLiszVsj5im8VNrP06F1xjCj9cXC', 'Autem voluptatem quo maxime ut culpa qui ipsum.', NULL, 1, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(6, 'Moriah Stokes', 'robyn.beer@example.org', '$2y$10$WBE5LHWNG2RITLx7hd.8X.GaW2R/nRGN57H21LP3.kMAbtrz8PV1i', 'Labore numquam voluptatum voluptas reiciendis incidunt.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(7, 'Eloise Fritsch', 'hamill.nicola@example.com', '$2y$10$ev8q5ZtcNvqBd03DlfGnteA2ct.GRs5AP19Fbad4vZnorzo4Xv1R2', 'Provident aut eaque sint voluptate.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(8, 'Melody Gutmann', 'sortiz@example.org', '$2y$10$l4hN9uu64fCn6dk5FjIImeTCcsEl1BOdFxr06bZIqEs/Y68h5Yt3C', 'Porro enim velit mollitia sint.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(9, 'Julien Grimes', 'murray.margot@example.org', '$2y$10$9IVFN7aNVT/unGGnfEp2feV.2Y0iE.4cIZIlPgcIEKffU0s53a7Z6', 'Fugit omnis aliquam blanditiis porro aliquam ad.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(10, 'Miss Calista Hirthe DDS', 'gpagac@example.org', '$2y$10$6ciHeXv.TlE7BUZgyNPAEeqUEJV74LVpnOlT0Oy9RFj3UOiRn0Ze6', 'Consequatur occaecati velit sequi corrupti quia illo occaecati.', NULL, 1, '2024-11-25 07:26:06', '2024-11-25 07:26:06'),
	(11, 'Toni Rutherford', 'elroy.romaguera@example.net', '$2y$10$tnTxSUjA0A1oyctcTx7VLeNydNTVaD8u/MPLhI1otnh6ola6EM7Y6', 'Sit rerum debitis voluptatem omnis.', NULL, 0, '2024-11-25 07:26:06', '2024-11-25 07:26:06');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
