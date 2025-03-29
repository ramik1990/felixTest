-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 29 2025 г., 17:07
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `felixtest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `carts`
--

INSERT INTO `carts` (`id`, `session_id`, `is_paid`, `created_at`, `updated_at`) VALUES
(1, 'BfHnYeX4dcJ25lCrPRhUbzhGVUcgaEvbcmKG7Q65', 0, '2025-03-29 08:04:33', '2025-03-29 08:04:33');

-- --------------------------------------------------------

--
-- Структура таблицы `cart_knife`
--

CREATE TABLE `cart_knife` (
  `id` bigint UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `knife_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart_knife`
--

INSERT INTO `cart_knife` (`id`, `session_id`, `cart_id`, `knife_id`, `quantity`, `created_at`, `updated_at`) VALUES
(9, 'BfHnYeX4dcJ25lCrPRhUbzhGVUcgaEvbcmKG7Q65', 1, 7, 3, NULL, NULL),
(10, 'BfHnYeX4dcJ25lCrPRhUbzhGVUcgaEvbcmKG7Q65', 1, 6, 2, NULL, NULL),
(11, 'BfHnYeX4dcJ25lCrPRhUbzhGVUcgaEvbcmKG7Q65', 1, 5, 2, NULL, NULL),
(13, 'BfHnYeX4dcJ25lCrPRhUbzhGVUcgaEvbcmKG7Q65', 1, 2, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `knives`
--

CREATE TABLE `knives` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `knives`
--

INSERT INTO `knives` (`id`, `title`, `description`, `price`, `imageUrl`, `created_at`, `updated_at`) VALUES
(1, 'Bowie Knife (нож Боуи)', 'Нож Боуи был впервые добавлен в игру в 2016 году вместе с кейсом Дикое Пламя. И хотя первые Bowie Knife были созданы еще в 19 веке, именно версия из CS:GO сделана по образу современного Aitor Oso Negro, военного ножа разведки Испании, который переводится как Черный Медведь. Дешевый Bowie Knife можно достать чуть дешевле сотни долларов (варианты Rust Coat, Safari Mesh, Scorched, Urban Masked и Borean Forest). А вот самый дорогой нож Боуи обойдется Doppler Saphire в несколько тысяч за версию со StatTrak. Интересный факт: всемирно известный музыкант Дэвид Боуи взял свой псевдоним в честь именно этого ножа.', 123, 'knifes/FPccqZCJBo4y78UaReylj69ZVUnMPdRYbjQBGQWn.png', '2025-03-29 03:50:55', '2025-03-29 03:50:55'),
(2, 'Shadow Daggers (тычковые ножи)', 'Тычковые ножи выделяются из списка всех ножей в CS:GO именно тем, что их два (по одному в каждую руку) и по форме напоминают скорее кастеты, чем лезвия. Несмотря на это, Shadow Daggers – один из самых дешевых типов ножей, их можно купить за 85+ долларов. В игру их добавили в 2015 году. Bright Water, Damascus Steel и Black Laminate выглядят просто сногсшибательно для ножей в районе ста долларов, так что рекомендуем присмотреться. Кстати, на нашем сайте купить шэдоу даггеры в неплохом состоянии можно за $110!', 5234, 'knifes/8HDOctA6ZDyCIam4qm3tuYXNlfBRIGiaJmtiNs8H.png', '2025-03-29 03:53:59', '2025-03-29 03:53:59'),
(3, 'Falchion Knife (Фальшион)', 'Нож Фальшион в CS:GO добавили в 2015 году. Он сразу обрел популярность и до сих поря является одним из самых востребованных ножей в игре. Купить Falchion может обойтись в копейку, ведь это не самый дешевый нож, а стартовые цены на рынке – от 140 долларов даже за Safari Mesh, Urban Masked и Rust Coat. Уникальность ножа в том, что у него две анимации просмотра: стандартная и редкая, когда руки игрока пытаются балансировать нож вертикально.', 234, 'knifes/n8JLTsTTKIYwchWJQPL5gEFQX6AtWx7kdATuIv5T.png', '2025-03-29 03:57:23', '2025-03-29 03:57:23'),
(4, 'Butterfly Knife (нож-бабочка)', 'Рынок скинов перевернулся в 2014 году, когда в CS:GO добавили нож-бабочку. С тех пор – это один из самых популярных скинов на нож в игре. Butterfly Knife очень дорогой, стартовые цены – от 700 долларов минимум, а самый дорогой может перевалить за 15 тысяч! Это как купить машину! Кстати, у него две анимации выбора, правда, ни одна из них не ультра-редкая. Зато целых три анимации просмотра! С этими ножами хочет бегать каждый второй игрок в КС, а коллекционеры стараются найти самые редкие флоуты для дорогущих паттернов. Воистину легендарный скин на нож!', 423, 'knifes/ocH0GMFqxR3jC1JWK11S4eooCorz9D5cb9xfIJj1.png', '2025-03-29 03:58:32', '2025-03-29 03:58:32'),
(5, 'Huntsman Knife (охотничий нож)', 'Современный, стильный и многофункциональный нож. Купить охотничий нож в CS:GO можно за примерно 150 долларов в нормальном состоянии расцветки Ubran Masked и чуть-чуть дороже за красивый цветной нож Freehand. В игру его впервые добавили в мае 2014 года. Дизайн Huntsman Knife основан на популярном американском ноже MTECH USA XTREME MX-8054.', 2345, 'knifes/G33q4SuNEXfGoy2wm5oIhAAJNq3OaVDbjjpN82mt.png', '2025-03-29 04:57:25', '2025-03-29 04:57:25'),
(6, 'M9 Bayonet (штык-нож М9)', 'Еще один очень дорогой и очень красивый нож. Купить M9 Bayonet можно минимум за 550 долларов, а максимальные цены достигают, как и нож-бабочка, полутора десятков тысяч. Это один из первых ножей в CS:GO, появившийся в 2013 году вместе с обновлением The Arms Deal (кейс включал первые пять скинов ножей в игре). Основан дизайн скина на ноже от Smith & Wesson – известного производителя огнестрельного оружия.', 523, 'knifes/b6lTYioIbr9f64Fg1EuRmD2tRsCJ1mT0OQznf3zG.png', '2025-03-29 05:00:28', '2025-03-29 05:00:28'),
(7, 'Bayonet (штык-нож)', 'Чем Bayonet отличается M9 Bayonet? У версии М9 есть зубчатые части и она основана на современном ноже, в то время как классический Байонет создавался по образу ножа 1993 года. Тем не менее, обычный Bayonet стоит сразу на 150 долларов дешевле M9-версии. Кроме того, у этого ножа очень эпичная и минималистичная анимация выбора, чем он покоряет сердца многих игроков в CS:GO. Также, один из пятерки первых ножей в CS:GO, вместе с M9.', 2344, 'knifes/R6FsDsTvCnoq7c9a9vbuKYL0yixOW4GQymuDbVzZ.png', '2025-03-29 05:00:50', '2025-03-29 05:00:50'),
(8, '777', 'Вернемся к ножам, которые можно купить дешево. Gut Knife стоит чуть больше 110 долларов, но его дизайн – на любителя. Это самый дешевый нож из обновления Arms Deal от 2013 года. Кстати, на нем вырезана надпись CSGO 2013. Мы советуем присмотреться к паттернам Night и Freehand (от 150 долларов) и Black Laminate (от $300).', 777, 'knifes/77LhV6CQeyJ0J52BwW2tn5VzZqZRo2aes35FqsWi.png', '2025-03-29 09:07:00', '2025-03-29 09:07:00');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_03_29_075426_create_knives_table', 2),
(8, '2025_03_29_101310_create_carts_table', 3),
(9, '2025_03_29_101634_create_cart_knife_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(21, 'App\\Models\\User', 1, 'auth_token', 'c93464371770980af01692d1995d7caf15b77e9120cddefea2bf28ab581ee53f', '[\"*\"]', NULL, NULL, '2025-03-29 09:00:23', '2025-03-29 09:00:23');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Рамик', 'ramikshudabaev@gmail.com', '2025-03-28 20:15:42', '$2y$12$3gEdIQwhz8TGF4lcxfh/UOinTmZZHjv4ruCkiMgW33T3B/E0O1eTG', NULL, '2025-03-28 15:12:01', '2025-03-28 15:12:01');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart_knife`
--
ALTER TABLE `cart_knife`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_knife_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_knife_knife_id_foreign` (`knife_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `knives`
--
ALTER TABLE `knives`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cart_knife`
--
ALTER TABLE `cart_knife`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `knives`
--
ALTER TABLE `knives`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart_knife`
--
ALTER TABLE `cart_knife`
  ADD CONSTRAINT `cart_knife_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_knife_knife_id_foreign` FOREIGN KEY (`knife_id`) REFERENCES `knives` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
