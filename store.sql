-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2019 at 05:22 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `StoredProcedure` (IN `users` VARCHAR(255))  NO SQL
SELECT * FROM users WHERE users.name$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`) VALUES
(1, 'Cannon EOS', 36000),
(2, 'Sony DSLR', 40000),
(3, 'Sony DSLR', 50000),
(4, 'Olympus DSLR', 80000),
(5, 'Titan Model #301', 13000),
(6, 'Titan Model #201', 3000),
(7, 'HMT Milan', 8000),
(8, 'Favre Lueba #111', 18000),
(9, 'Raymond', 1500),
(10, 'Charles', 1000),
(11, 'HXR', 900),
(12, 'PINK', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `restore`
--

CREATE TABLE `restore` (
  `id` int(11) NOT NULL,
  `name` int(255) NOT NULL,
  `email` int(255) NOT NULL,
  `password` int(255) NOT NULL,
  `contact` int(255) NOT NULL,
  `city` int(255) NOT NULL,
  `address` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restore`
--

INSERT INTO `restore` (`id`, `name`, `email`, `password`, `contact`, `city`, `address`) VALUES
(1, 0, 0, 0, 2147483647, 0, 0),
(2, 0, 0, 5, 2147483647, 0, 0),
(3, 0, 0, 3437, 0, 0, 0),
(4, 0, 0, 140, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `contact`, `city`, `address`) VALUES
(3, 'MD ARIF', 'sweetarif71@gmail.com', 'd93241f9b7e21042ba466d849b1ff733', '7992411756', 'MOTIHARI', 'GUBBI'),
(4, 'TIPU', 'asldfjaf2@gmail.com', '5fd45184aebf49307e716e15fd1cdb41', '7767676767', 'tukuradsfasdf', 'asdfasdf'),
(5, 'tuipp', 'asdfasd@gmail.com', '3437d253502992d9be8e9c321b8557f4', 'asdfsafsaf', 'asdfsafsd', 'asdfsdfsf'),
(6, 'fasdf', 'tipu@gamail.com', '14e1b600b1fd579f47433b88e8d85291', 'adsfasd', 'asdfasdf', 'asdfasdf');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN 
INSERT INTO users_backup VALUES(new.id,new.name,new.email,new.password,new.contact,new.city,new.address);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `restore` BEFORE INSERT ON `users` FOR EACH ROW BEGIN 
INSERT INTO restore VALUES(new.id,new.name,new.email,new.password,new.contact,new.city,new.address);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_backup`
--

CREATE TABLE `users_backup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_backup`
--

INSERT INTO `users_backup` (`id`, `name`, `email`, `password`, `contact`, `city`, `address`) VALUES
(3, 'MD ARIF', 'sweetarif71@gmail.com', 'd93241f9b7e21042ba466d849b1ff733', '7992411756', 'MOTIHARI', 'GUBBI'),
(4, 'TIPU', 'asldfjaf2@gmail.com', '5fd45184aebf49307e716e15fd1cdb41', '7767676767', 'tukuradsfasdf', 'asdfasdf'),
(5, 'tuipp', 'asdfasd@gmail.com', '3437d253502992d9be8e9c321b8557f4', 'asdfsafsaf', 'asdfsafsd', 'asdfsdfsf'),
(6, 'fasdf', 'tipu@gamail.com', '14e1b600b1fd579f47433b88e8d85291', 'adsfasd', 'asdfasdf', 'asdfasdf');

-- --------------------------------------------------------

--
-- Table structure for table `users_items`
--

CREATE TABLE `users_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `status` enum('Added to cart','Confirmed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_items`
--

INSERT INTO `users_items` (`id`, `user_id`, `item_id`, `status`) VALUES
(21, 5, 3, 'Confirmed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restore`
--
ALTER TABLE `restore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_backup`
--
ALTER TABLE `users_backup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_items`
--
ALTER TABLE `users_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `restore`
--
ALTER TABLE `restore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_backup`
--
ALTER TABLE `users_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users_items`
--
ALTER TABLE `users_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_items`
--
ALTER TABLE `users_items`
  ADD CONSTRAINT `users_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
