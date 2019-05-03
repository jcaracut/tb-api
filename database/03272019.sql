-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2019 at 10:24 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bunney`
--

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('5HBKnECQqil_3POUZr9ovMjAXsYW5wde', 1553681694, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-27T10:14:54.218Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('u2Q655hwMsk7049h6ifvy9hoh0cKoXzY', 1553681700, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-27T10:14:59.988Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cycle`
--

CREATE TABLE `tbl_cycle` (
  `cycle_id` int(11) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farm`
--

CREATE TABLE `tbl_farm` (
  `farm_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `farm_name` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `farm_size` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `coordinates` varchar(55) DEFAULT NULL,
  `is_verify` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_farm`
--

INSERT INTO `tbl_farm` (`farm_id`, `user_id`, `farm_name`, `address`, `image`, `farm_size`, `date_created`, `is_active`, `coordinates`, `is_verify`) VALUES
(1, 10, 'Farm Ville', 'Silicon Valley, LA', '', 100, '2019-03-11 00:00:00', 1, NULL, 0),
(2, 8, 'Farmer', 'Nasipit, Borbon, Cebu', '', 120, '2019-03-11 00:00:00', 1, NULL, 0),
(9, 8, 'Farm Lang', 'Argao, Cebu', 'farming', 100, '2019-03-22 04:01:52', 0, '{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farm_expenses`
--

CREATE TABLE `tbl_farm_expenses` (
  `farm_expenses_id` int(11) NOT NULL,
  `item` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `farm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_cycle`
--

CREATE TABLE `tbl_investment_cycle` (
  `investment_cycle_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cycle_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rabbit`
--

CREATE TABLE `tbl_rabbit` (
  `rabbit_id` int(11) NOT NULL,
  `farm_id` int(11) NOT NULL,
  `breed_type` varchar(55) NOT NULL,
  `is_available` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rabbit`
--

INSERT INTO `tbl_rabbit` (`rabbit_id`, `farm_id`, `breed_type`, `is_available`, `date_created`, `amount`, `user_id`) VALUES
(1, 1, 'Dutch', 1, '2019-03-21 00:00:00', 0, NULL),
(2, 2, 'French', 1, '2019-03-21 00:00:00', 0, NULL),
(3, 1, 'Pinoy', 1, '2019-03-22 00:00:00', 1000, NULL),
(4, 9, 'Bisaya', 1, '2019-03-22 00:00:00', 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL,
  `hashcode` varchar(255) NOT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status_code` int(2) NOT NULL,
  `status_description` varchar(255) NOT NULL,
  `transaction_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `is_verify` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `password`, `user_type`, `date_created`, `is_active`, `email`, `is_verify`) VALUES
(7, 'asd', 0, '2019-03-06 10:44:15', 1, 'jcaracut@gmail.com', 1),
(8, 'qwe', 2, '2019-03-07 01:50:00', 1, 'aryong@gmail.com', 1),
(10, 'test', 2, '2019-03-08 05:44:11', 1, 'dindin@gmail.com', 1),
(11, 'qwerty', 1, '2019-03-11 13:35:27', 1, 'blue@gmail.com', 1),
(12, 'amaw', 1, '2019-03-12 03:10:12', 1, 'pototko56@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_profile`
--

CREATE TABLE `tbl_user_profile` (
  `user_profile_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_profile`
--

INSERT INTO `tbl_user_profile` (`user_profile_id`, `first_name`, `last_name`, `address`, `address1`, `address2`, `mobile`, `avatar`, `user_id`) VALUES
(4, 'Jecson', 'Caracut', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599246', '/assets/avatars/default.jpg', 7),
(5, 'Aryong', 'Cute', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599123', '/assets/avatars/default.jpg', 8),
(7, 'Dindin', 'Yeah', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599123', '/assets/avatars/default.jpg', 10),
(8, 'Jecson', 'Caracut', '{\"address1\":\"Ormoc ,Cebu,Cebu 6000\",\"address2\":\"Samjong Bilding\"}', 'Ormoc ,Cebu,Cebu 6000', 'Samjong Bilding', '12345678901', '/assets/avatars/default.jpg', 11),
(9, 'Aninipot', 'Manzano', '{\"address1\":\"Binlod,Cebu,Cebu City 6000\",\"address2\":\"Argao\"}', 'Binlod,Cebu,Cebu City 6000', 'Argao', '955138231', '/assets/avatars/default.jpg', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet`
--

CREATE TABLE `tbl_wallet` (
  `wallet_id` int(11) NOT NULL,
  `credit_total` double NOT NULL,
  `credit_used` double NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wallet`
--

INSERT INTO `tbl_wallet` (`wallet_id`, `credit_total`, `credit_used`, `user_id`) VALUES
(1, 1510, 20, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `tbl_cycle`
--
ALTER TABLE `tbl_cycle`
  ADD PRIMARY KEY (`cycle_id`);

--
-- Indexes for table `tbl_farm`
--
ALTER TABLE `tbl_farm`
  ADD PRIMARY KEY (`farm_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_farm_expenses`
--
ALTER TABLE `tbl_farm_expenses`
  ADD PRIMARY KEY (`farm_expenses_id`),
  ADD KEY `farm_id` (`farm_id`);

--
-- Indexes for table `tbl_investment_cycle`
--
ALTER TABLE `tbl_investment_cycle`
  ADD PRIMARY KEY (`investment_cycle_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cycle_id` (`cycle_id`);

--
-- Indexes for table `tbl_rabbit`
--
ALTER TABLE `tbl_rabbit`
  ADD PRIMARY KEY (`rabbit_id`),
  ADD KEY `farm_id` (`farm_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  ADD PRIMARY KEY (`user_profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  ADD PRIMARY KEY (`wallet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cycle`
--
ALTER TABLE `tbl_cycle`
  MODIFY `cycle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_farm`
--
ALTER TABLE `tbl_farm`
  MODIFY `farm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_farm_expenses`
--
ALTER TABLE `tbl_farm_expenses`
  MODIFY `farm_expenses_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_cycle`
--
ALTER TABLE `tbl_investment_cycle`
  MODIFY `investment_cycle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rabbit`
--
ALTER TABLE `tbl_rabbit`
  MODIFY `rabbit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  MODIFY `user_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_farm`
--
ALTER TABLE `tbl_farm`
  ADD CONSTRAINT `tbl_farm_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_farm_expenses`
--
ALTER TABLE `tbl_farm_expenses`
  ADD CONSTRAINT `tbl_farm_expenses_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `tbl_farm` (`farm_id`);

--
-- Constraints for table `tbl_investment_cycle`
--
ALTER TABLE `tbl_investment_cycle`
  ADD CONSTRAINT `tbl_investment_cycle_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_investment_cycle_ibfk_2` FOREIGN KEY (`cycle_id`) REFERENCES `tbl_cycle` (`cycle_id`);

--
-- Constraints for table `tbl_rabbit`
--
ALTER TABLE `tbl_rabbit`
  ADD CONSTRAINT `tbl_rabbit_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `tbl_farm` (`farm_id`),
  ADD CONSTRAINT `tbl_rabbit_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  ADD CONSTRAINT `tbl_user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_wallet`
--
ALTER TABLE `tbl_wallet`
  ADD CONSTRAINT `tbl_wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
