-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 25 2022 г., 22:54
-- Версия сервера: 5.7.33-log
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `aobu`
--
CREATE DATABASE IF NOT EXISTS `aobu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `aobu`;

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id_author` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `info_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Триггеры `authors`
--
DELIMITER $$
CREATE TRIGGER `authors_info_update_date` BEFORE UPDATE ON `authors` FOR EACH ROW BEGIN
    SET NEW.info_update_date = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `books_authors`
--

CREATE TABLE `books_authors` (
  `id_book` int(11) NOT NULL,
  `id_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_duration`
--

CREATE TABLE `books_duration` (
  `id_book` int(11) NOT NULL,
  `duration` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_from_websites`
--

CREATE TABLE `books_from_websites` (
  `id_book` int(11) NOT NULL,
  `book_title` int(10) UNSIGNED NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brief_content` text COLLATE utf8mb4_unicode_ci,
  `is_audio` tinyint(1) NOT NULL DEFAULT '0',
  `link` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Триггеры `books_from_websites`
--
DELIMITER $$
CREATE TRIGGER `books_from_websites_info_update_date` BEFORE UPDATE ON `books_from_websites` FOR EACH ROW BEGIN
    SET NEW.info_update_date = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `books_genres`
--

CREATE TABLE `books_genres` (
  `id_book` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_price`
--

CREATE TABLE `books_price` (
  `id_book` int(10) NOT NULL,
  `price` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_rating`
--

CREATE TABLE `books_rating` (
  `id_book` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_readers`
--

CREATE TABLE `books_readers` (
  `id_book` int(11) NOT NULL,
  `id_reader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `books_year`
--

CREATE TABLE `books_year` (
  `id_book` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `book_title`
--

CREATE TABLE `book_title` (
  `id_book_title` int(10) UNSIGNED NOT NULL,
  `book_title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cycle`
--

CREATE TABLE `cycle` (
  `id_cycle` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `cycle_name` int(10) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cycle_name`
--

CREATE TABLE `cycle_name` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `complaint` tinyint(1) NOT NULL DEFAULT '0',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  `receipt_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `number_pages`
--

CREATE TABLE `number_pages` (
  `id_book` int(11) NOT NULL,
  `number_pages` int(10) UNSIGNED NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `readers`
--

CREATE TABLE `readers` (
  `id_reader` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `surname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `info_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Триггеры `readers`
--
DELIMITER $$
CREATE TRIGGER `readers_info_update_date` BEFORE UPDATE ON `readers` FOR EACH ROW BEGIN
    SET NEW.info_update_date = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `sites`
--

CREATE TABLE `sites` (
  `id_site` int(11) NOT NULL,
  `name` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sites_genres`
--

CREATE TABLE `sites_genres` (
  `id_genre` int(11) NOT NULL,
  `id_site` int(11) NOT NULL,
  `genre` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `synonyms_titles`
--

CREATE TABLE `synonyms_titles` (
  `id_user` int(11) NOT NULL,
  `id_book_title` int(10) UNSIGNED NOT NULL,
  `synonym_title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` enum('User','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `last_login_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_books`
--

CREATE TABLE `user_books` (
  `id_user` int(11) NOT NULL,
  `id_book_title` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_books_not_found`
--

CREATE TABLE `user_books_not_found` (
  `id_user` int(11) NOT NULL,
  `book_title` char(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id_author`),
  ADD UNIQUE KEY `name` (`name`,`surname`),
  ADD UNIQUE KEY `nickname` (`nickname`);

--
-- Индексы таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_author` (`id_author`);

--
-- Индексы таблицы `books_duration`
--
ALTER TABLE `books_duration`
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `books_from_websites`
--
ALTER TABLE `books_from_websites`
  ADD PRIMARY KEY (`id_book`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `book_title_1` (`book_title`);

--
-- Индексы таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Индексы таблицы `books_price`
--
ALTER TABLE `books_price`
  ADD KEY `book_price` (`id_book`);

--
-- Индексы таблицы `books_rating`
--
ALTER TABLE `books_rating`
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `books_readers`
--
ALTER TABLE `books_readers`
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_reader` (`id_reader`);

--
-- Индексы таблицы `books_year`
--
ALTER TABLE `books_year`
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `book_title`
--
ALTER TABLE `book_title`
  ADD PRIMARY KEY (`id_book_title`),
  ADD UNIQUE KEY `book_title` (`book_title`);

--
-- Индексы таблицы `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`id_cycle`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `cycle_ibfk_2` (`cycle_name`);

--
-- Индексы таблицы `cycle_name`
--
ALTER TABLE `cycle_name`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `number_pages`
--
ALTER TABLE `number_pages`
  ADD KEY `id_book` (`id_book`);

--
-- Индексы таблицы `readers`
--
ALTER TABLE `readers`
  ADD PRIMARY KEY (`id_reader`),
  ADD UNIQUE KEY `name` (`name`,`surname`,`nickname`);

--
-- Индексы таблицы `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id_site`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Индексы таблицы `sites_genres`
--
ALTER TABLE `sites_genres`
  ADD PRIMARY KEY (`id_genre`),
  ADD UNIQUE KEY `id_site_2` (`id_site`,`genre`),
  ADD KEY `id_site` (`id_site`);

--
-- Индексы таблицы `synonyms_titles`
--
ALTER TABLE `synonyms_titles`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_book_title` (`id_book_title`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `user_books`
--
ALTER TABLE `user_books`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_book_title` (`id_book_title`);

--
-- Индексы таблицы `user_books_not_found`
--
ALTER TABLE `user_books_not_found`
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `books_from_websites`
--
ALTER TABLE `books_from_websites`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `book_title`
--
ALTER TABLE `book_title`
  MODIFY `id_book_title` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cycle`
--
ALTER TABLE `cycle`
  MODIFY `id_cycle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cycle_name`
--
ALTER TABLE `cycle_name`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `readers`
--
ALTER TABLE `readers`
  MODIFY `id_reader` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sites`
--
ALTER TABLE `sites`
  MODIFY `id_site` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sites_genres`
--
ALTER TABLE `sites_genres`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id_author`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_duration`
--
ALTER TABLE `books_duration`
  ADD CONSTRAINT `books_duration_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_from_websites`
--
ALTER TABLE `books_from_websites`
  ADD CONSTRAINT `book_title_1` FOREIGN KEY (`book_title`) REFERENCES `book_title` (`id_book_title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_genres`
--
ALTER TABLE `books_genres`
  ADD CONSTRAINT `books_genres_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `sites_genres` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_price`
--
ALTER TABLE `books_price`
  ADD CONSTRAINT `book_price` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_rating`
--
ALTER TABLE `books_rating`
  ADD CONSTRAINT `books_rating_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_readers`
--
ALTER TABLE `books_readers`
  ADD CONSTRAINT `books_readers_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_readers_ibfk_2` FOREIGN KEY (`id_reader`) REFERENCES `readers` (`id_reader`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `books_year`
--
ALTER TABLE `books_year`
  ADD CONSTRAINT `books_year_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cycle`
--
ALTER TABLE `cycle`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cycle_ibfk_2` FOREIGN KEY (`cycle_name`) REFERENCES `cycle_name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `number_pages`
--
ALTER TABLE `number_pages`
  ADD CONSTRAINT `number_pages_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books_from_websites` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sites_genres`
--
ALTER TABLE `sites_genres`
  ADD CONSTRAINT `sites_genres_ibfk_1` FOREIGN KEY (`id_site`) REFERENCES `sites` (`id_site`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `synonyms_titles`
--
ALTER TABLE `synonyms_titles`
  ADD CONSTRAINT `synonyms_titles_ibfk_1` FOREIGN KEY (`id_book_title`) REFERENCES `book_title` (`id_book_title`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `synonyms_titles_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_books`
--
ALTER TABLE `user_books`
  ADD CONSTRAINT `user_books_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_books_ibfk_2` FOREIGN KEY (`id_book_title`) REFERENCES `book_title` (`id_book_title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_books_not_found`
--
ALTER TABLE `user_books_not_found`
  ADD CONSTRAINT `user_books_not_found_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
