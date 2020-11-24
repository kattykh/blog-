-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2020 at 06:47 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `topic_id`, `title`, `image`, `body`, `published`, `created_at`) VALUES
(13, 23, 1, 'One day your life flash before your eyes', '1602917352_8FF.jpg', 'This is a sample post nnhhh', 1, '2020-09-04 20:41:22'),
(14, 23, 3, 'Wedding is simple', '1602917359_24I.jpg', 'sampleand', 1, '2020-09-04 20:44:58'),
(15, 23, 5, 'Updated section', '1602917368_33182_wallpaper280.jpg', 'samp', 1, '2020-09-04 20:45:17'),
(16, 23, 6, 'Fruits', '1602917376_25.jpg', 'addd', 1, '2020-09-04 20:45:33'),
(17, 23, 4, 'Testing', '1602917383_6.JPG', 'dreee', 1, '2020-09-04 20:45:54'),
(18, 23, 1, 'Character', '1602917397_47M.jpg', 'sample oneand1234ghfgg', 1, '2020-09-05 11:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`) VALUES
(1, 'Life', 'test hhhhjhg'),
(3, 'Quotes', 'data'),
(4, 'Fiction', 'data'),
(5, 'Biography', 'data'),
(6, 'Motivation', 'data'),
(7, 'Inspiration', 'GKLKK'),
(8, 'abi', 'sda');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created_at`) VALUES
(22, 1, 'John Carter', 'jc9787@ja.com', '$2y$10$OeaKJKjAD6zn7tL386Q7ReTjAoTgefuOJ33AeGROuT7Y.2oyjnA2a', '2020-09-05 07:27:44'),
(23, 1, 'Dev', 'dev65@gmail.com', '$2y$10$Nxp839huX9vhBrSPwzjDs.Yeow2adJgyjiBrDIHs8YYDMZNM6VLAW', '2020-09-05 07:40:28'),
(24, 0, 'Jay', 'jaycc@h.com', '$2y$10$1P8Zfa0lbo8q/i9.1LOnuOAp9JHO/JbEEA0UxaHG7DKA9a3JKxr5m', '2020-09-07 15:25:55');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
