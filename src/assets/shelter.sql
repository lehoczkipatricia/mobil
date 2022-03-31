-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Már 23. 07:52
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `shelter`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adoptions`
--

CREATE TABLE `adoptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `pets_id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `breeds`
--

CREATE TABLE `breeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bname` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `species_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `breeds`
--

INSERT INTO `breeds` (`id`, `bname`, `species_id`, `created_at`, `updated_at`) VALUES
(1, 'kuvasz', 1, NULL, NULL),
(2, 'sziámi', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_25_153653_create_species_table', 1),
(6, '2022_01_25_153704_create_breeds_table', 1),
(7, '2022_01_25_153799_create_shelters_table', 1),
(8, '2022_01_25_153800_create_pets_table', 1),
(9, '2022_01_25_153801_create_adoptions_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(20, 'App\\Models\\User', 6, 'adoptme', '54e558a885a2912616030a431d8f5f969bd1b762a0f457ec75d467a5a717421d', '[\"*\"]', '2022-03-23 01:08:53', '2022-03-23 01:06:07', '2022-03-23 01:08:53'),
(22, 'App\\Models\\User', 6, 'adoptme', 'c9f9730f1405f161ee462bf0042088f84863a5dd28b01267cf050e6fbe5598b8', '[\"*\"]', NULL, '2022-03-23 05:46:12', '2022-03-23 05:46:12');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pets`
--

CREATE TABLE `pets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `breeds_id` bigint(20) UNSIGNED NOT NULL,
  `age` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `adopted` tinyint(1) NOT NULL,
  `shelters_id` bigint(20) UNSIGNED NOT NULL,
  `picture_path` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `neutered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `pets`
--

INSERT INTO `pets` (`id`, `name`, `breeds_id`, `age`, `gender`, `adopted`, `shelters_id`, `picture_path`, `neutered`, `created_at`, `updated_at`) VALUES
(1, 'Teszt', 1, 6, 0, 0, 1, 'teszt', 0, NULL, NULL),
(2, 'cirmi', 2, 4, 0, 1, 2, '', 1, NULL, NULL),
(3, 'mano', 2, 10, 1, 0, 4, '', 1, NULL, NULL),
(4, 'Mazsi', 1, 10, 1, 0, 3, '', 1, NULL, NULL),
(5, 'Cirmi', 2, 4, 1, 0, 2, '', 1, NULL, NULL),
(6, 'Picur', 2, 4, 1, 0, 1, '', 1, NULL, NULL),
(7, 'Cirmi', 2, 5, 1, 0, 1, '', 1, '2022-03-22 20:14:12', '2022-03-22 20:14:12'),
(8, 'FormTeszt', 1, 5, 0, 0, 1, '', 0, '2022-03-22 20:30:16', '2022-03-22 20:30:16'),
(9, 'Tesztkettő', 1, 5, 0, 0, 3, '', 0, '2022-03-22 20:33:57', '2022-03-22 20:33:57'),
(10, 'teszthárom', 2, 7, 0, 0, 1, '', 0, '2022-03-22 20:37:44', '2022-03-22 20:37:44'),
(11, 'teszthárom', 2, 7, 0, 0, 1, '', 0, '2022-03-22 20:37:58', '2022-03-22 20:37:58'),
(12, 'tesztöt', 2, 7, 1, 0, 2, '', 0, '2022-03-22 20:40:10', '2022-03-22 20:40:10'),
(13, 'macskika', 2, 10, 0, 0, 5, '', 1, '2022-03-22 20:42:29', '2022-03-22 20:42:29'),
(14, 'macskika', 2, 10, 0, 0, 5, '', 1, '2022-03-22 20:42:38', '2022-03-22 20:42:38'),
(15, 'alasza', 2, 10, 0, 0, 5, '', 1, '2022-03-22 21:04:42', '2022-03-22 21:04:42'),
(16, 'asasa', 2, 22, 0, 0, 5, '', 1, '2022-03-22 21:10:14', '2022-03-22 21:10:14'),
(17, 'aaa', 2, 10, 0, 0, 1, '', 1, '2022-03-22 21:26:56', '2022-03-22 21:26:56'),
(18, 'ddd', 2, 10, 1, 0, 3, '', 1, '2022-03-22 21:28:43', '2022-03-22 21:28:43'),
(19, 'waddsds', 1, 222, 0, 0, 3, '', 1, '2022-03-22 21:35:48', '2022-03-22 21:35:48'),
(20, 'ssss', 2, 10, 0, 0, 3, '', 1, '2022-03-22 22:19:01', '2022-03-22 22:19:01'),
(21, 'sss', 2, 10, 0, 0, 3, '', 1, '2022-03-22 22:25:35', '2022-03-22 22:25:35'),
(22, 'aaa', 2, 21, 0, 0, 3, '', 1, '2022-03-22 22:26:02', '2022-03-22 22:26:02'),
(23, 'aaaaa', 2, 21, 0, 0, 4, '', 1, '2022-03-23 05:44:20', '2022-03-23 05:44:20');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `shelters`
--

CREATE TABLE `shelters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shelter_name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `shelter_zip` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_city` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_street_address` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_phone` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_website` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_facebook` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `shelters`
--

INSERT INTO `shelters` (`id`, `shelter_name`, `shelter_zip`, `shelter_city`, `shelter_street_address`, `shelter_phone`, `shelter_website`, `shelter_facebook`, `created_at`, `updated_at`) VALUES
(1, 'Teszt Menhely', '0000', 'Teszt', 'Teszt utca 00', '+00 00 000 0000', 'tesztmenhely.lan', 'facebook.com/TesztMenhely', NULL, NULL),
(2, 'Fogadj Örökbe Budapest', '1000', 'Budapest', 'Szentendrei út 20', '+36 07 70 555 111', 'www.fogadjorokbe.hu', 'facebook.com/fogadjorokbe', NULL, NULL),
(3, 'Fogadj Örökbe Pestmegye', '2461', 'Tárnok', 'Hársfadűlő 5', '+36 06 70 555 111', 'www.fogadjorokbe.hu', 'facebook.com/fogadjorokbe', NULL, NULL),
(4, 'Az Állatokért Egyesület', '9030', 'Győr', 'Bécsi út 25665', '+36 05 70 555 111', 'www.allatokert.hu', 'facebook.com/allatokert', NULL, NULL),
(5, 'Paksi Állatmentők', '7030', 'Paks', 'Rétmező utca 1', '+36 11 22 444 222', 'www.allatmentokpaks.hu', 'facebook.com/allatmentokpaks', NULL, NULL),
(6, 'Pestmegyei Állatmentők', '2111', 'Érd', 'Róbert utca 1', '+36 00 22 2235', 'www.allatmentok.hu', 'facebook.com/allatmentok', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species`
--

CREATE TABLE `species` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sname` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `species`
--

INSERT INTO `species` (`id`, `sname`, `created_at`, `updated_at`) VALUES
(1, 'kutya', NULL, NULL),
(2, 'házi macska', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `birth` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `user`, `birth`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'admin', '1999-10-10', 'admin@admin.hu', NULL, 'admin', 1, NULL, NULL, NULL),
(5, 'admin2', '1999-10-10', 'admin2@admin.hu', NULL, 'admin2', 0, NULL, NULL, NULL),
(6, 'testJani2', '2000-10-10', 'jani@lan.hu', NULL, '$2y$10$y6S04PkbHmdPVOJbVy3ecO3l7WTQATjLvV3JIMhPIwo7aDDo9QwW.', NULL, NULL, '2022-03-22 20:10:30', '2022-03-22 20:10:30'),
(8, 'testJani', '2000-10-10', 'jani2@lan.hu', NULL, '$2y$10$ZK2qq5y1otVBbV5oSV15Te2BgDGYM8PIh/dOt/RIWd099LdODysN2', NULL, NULL, '2022-03-22 20:25:00', '2022-03-22 20:25:00'),
(9, 'testJani4', '2000-10-10', 'jani4@lan.hu', NULL, '$2y$10$GfhjhxNigx9drl9zDZaDo.YdUyfomP3NPudX/68i43xpdej/Nn11O', NULL, NULL, '2022-03-22 22:36:45', '2022-03-22 22:36:45'),
(11, 'testJani6', '2000-10-10', 'jani7@lan.hu', NULL, '$2y$10$iy6JHEtOeSwwAY8t3mTaN./bSZ/7TIu6LxznPOxb5sHl20z4Sg96.', NULL, NULL, '2022-03-22 22:37:22', '2022-03-22 22:37:22'),
(12, 'anyad', '1999-10-10', 'anyad@ggg.hu', NULL, '$2y$10$vVtparuT1d3TkypnpGIC9e15FOjE.cCHvv4whQ68kSm/1VC0LOv6q', NULL, NULL, '2022-03-22 22:40:15', '2022-03-22 22:40:15'),
(13, 'asasa', '1970-01-24', 'asasa@asa.hu', NULL, '$2y$10$t7e.QB.BdmZZFYzQoK7DsOns8sovI2b048OBSBikjkP5Ed7RiQ2My', NULL, NULL, '2022-03-23 00:06:54', '2022-03-23 00:06:54'),
(14, 'aaaaaa', '1970-08-23', 'aaa@gggg.hu', NULL, '$2y$10$hSGg.6DYdoj/UXcSpa1KR.yHcNj.4nM.jrC1dQ.WBII6qlSo04Kiy', NULL, NULL, '2022-03-23 00:21:27', '2022-03-23 00:21:27'),
(15, 'eeeee', '2022-03-09', 'eeee@ggg.hu', NULL, '$2y$10$J//qABySArtk5PiA5KjOreELCV.TfeE8KxRr.rXTcSZVW7A/ug3d2', NULL, NULL, '2022-03-23 00:23:52', '2022-03-23 00:23:52'),
(16, 'gggg', '2001-06-14', 'gg@ggg.hu', NULL, '$2y$10$UFSxH11itF0pTXXgKlw/2ecdjtlgwIydVLmkto6MUTmEAmrOSH/lK', NULL, NULL, '2022-03-23 05:45:42', '2022-03-23 05:45:42');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adoptions_pets_id_foreign` (`pets_id`),
  ADD KEY `adoptions_users_id_foreign` (`users_id`);

--
-- A tábla indexei `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `breeds_species_id_foreign` (`species_id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pets_breeds_id_foreign` (`breeds_id`),
  ADD KEY `pets_shelters_id_foreign` (`shelters_id`);

--
-- A tábla indexei `shelters`
--
ALTER TABLE `shelters`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_unique` (`user`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `pets`
--
ALTER TABLE `pets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT a táblához `shelters`
--
ALTER TABLE `shelters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `species`
--
ALTER TABLE `species`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_pets_id_foreign` FOREIGN KEY (`pets_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `adoptions_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `breeds`
--
ALTER TABLE `breeds`
  ADD CONSTRAINT `breeds_species_id_foreign` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`);

--
-- Megkötések a táblához `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_breeds_id_foreign` FOREIGN KEY (`breeds_id`) REFERENCES `breeds` (`id`),
  ADD CONSTRAINT `pets_shelters_id_foreign` FOREIGN KEY (`shelters_id`) REFERENCES `shelters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
