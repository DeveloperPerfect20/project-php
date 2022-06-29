-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2022 at 08:29 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `post_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `picture` text NOT NULL,
  `create_at` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `text`, `picture`, `create_at`, `user_id`) VALUES
(6, 'thcxgjdgkll,,njkol.lnn', '6290ffbc2a8a59.51535139-face.png', '2022-05-27 18:43:40', 2),
(7, 'thcxgjdgkll,,njkol.lnn', '629101e0cd8954.49783269-face.png', '2022-05-27 18:52:48', 2),
(8, 'thcxgjdgkll,,njkol.lnn', '629102241480e1.48682462-face.png', '2022-05-27 18:53:56', 2),
(9, 'the rtgjl;ccjwwertuio', '629104780e62c3.72060202--d.png', '2022-05-27 19:03:52', 2),
(10, 'the rtgjl;ccjwwertuio', '629104d3233419.77981522--d.png', '2022-05-27 19:05:23', 2),
(11, 'rtul;cvbnm,./ghjkl;kl;./', '629104e7b5b723.04603034--c.png', '2022-05-27 19:05:43', 2),
(12, 'rtul;cvbnm,./ghjkl;kl;./', '6291051ee09e47.53165364--c.png', '2022-05-27 19:06:38', 2),
(13, 'rtul;cvbnm,./ghjkl;kl;./', '62910540d97408.57548984--c.png', '2022-05-27 19:07:12', 2),
(14, 'rtul;cvbnm,./ghjkl;kl;./', '62910570ae3fe0.58664474--c.png', '2022-05-27 19:08:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `picture`) VALUES
(1, 'sdghjkloigftyuio', 'ghjiuhg@gmail.com', '78266654444444444', '628e8ec8a507b4.53957815--c.png'),
(2, 'donia alaa', 'donia@gmail.com', '123456789', '6290bda6a47af3.56805149-face.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
