-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2019 at 07:54 PM
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
-- Database: `dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_active_investment`
--

CREATE TABLE `tbl_active_investment` (
  `id` int(11) NOT NULL,
  `farm_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `number_of_rabbits` int(11) NOT NULL,
  `breed_type` varchar(255) NOT NULL,
  `cycle_id` int(11) NOT NULL,
  `end_of_investment` datetime NOT NULL,
  `is_active` int(1) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_messages`
--

CREATE TABLE `tbl_admin_messages` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `is_read` int(1) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_breeder_notification`
--

CREATE TABLE `tbl_breeder_notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_read` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `from` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rabbit_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `number_of_rabbits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contract`
--

CREATE TABLE `tbl_contract` (
  `contract_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` int(1) NOT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contract`
--

INSERT INTO `tbl_contract` (`contract_id`, `user_id`, `date_created`, `is_active`, `file`) VALUES
(10, 73, '2019-04-30 13:54:32', 1, '1556603665536-contract.pdf'),
(11, 73, '2019-04-30 14:18:05', 1, '1556605074103-contract.pdf'),
(12, 73, '2019-04-30 14:25:07', 1, '1556605499174-contract.pdf'),
(13, 73, '2019-04-30 14:32:39', 1, '1556605944345-contract.pdf'),
(14, 73, '2019-04-30 14:39:44', 1, '1556606379828-contract.pdf'),
(15, 73, '2019-04-30 14:47:45', 1, '1556606851058-contract.pdf'),
(16, 73, '2019-04-30 15:40:21', 1, '1556610015862-contract.pdf'),
(17, 73, '2019-04-30 21:55:00', 1, '1556632490092-contract.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contract_notification`
--

CREATE TABLE `tbl_contract_notification` (
  `notification_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_read` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `tbl_cycle`
--

INSERT INTO `tbl_cycle` (`cycle_id`, `date_from`, `date_to`, `date_created`, `is_active`) VALUES
(4, '2019-04-30 00:00:00', '2019-06-30 00:00:00', '2019-04-30 12:10:33', 1);

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
  `is_verify` int(1) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_farm`
--

INSERT INTO `tbl_farm` (`farm_id`, `user_id`, `farm_name`, `address`, `image`, `farm_size`, `date_created`, `is_active`, `is_verify`, `latitude`, `longitude`) VALUES
(28, 71, 'Jecson\'s Farm', 'Nasipit Talamban', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1556597101654-farm.png', 100, '2019-04-30 12:05:05', 1, 1, 10.3412867, 123.9426752),
(29, 71, 'Ailyn\'s Farm', 'Ormoc Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1556610773465-farm.jpg', 100, '2019-04-30 15:52:55', 1, 1, 10.2936244, 123.9917856);

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
  `farm_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_farm_expenses`
--

INSERT INTO `tbl_farm_expenses` (`farm_expenses_id`, `item`, `amount`, `description`, `date_added`, `farm_id`, `image`, `is_active`) VALUES
(16, 'Toothbrush', 20, '', '2019-04-30 15:43:29', 28, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1556610208430-expense.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_forgot_password`
--

CREATE TABLE `tbl_forgot_password` (
  `id` int(11) NOT NULL,
  `hashcode` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL
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

--
-- Dumping data for table `tbl_investment_cycle`
--

INSERT INTO `tbl_investment_cycle` (`investment_cycle_id`, `user_id`, `cycle_id`, `is_active`, `date_joined`) VALUES
(5, 71, 4, 1, '2019-04-30 12:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investor_notification`
--

CREATE TABLE `tbl_investor_notification` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `is_read` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `through` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `contact_number` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `reciept` varchar(255) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `date_sent` datetime NOT NULL,
  `date_created` datetime NOT NULL
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
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rabbit`
--

INSERT INTO `tbl_rabbit` (`rabbit_id`, `farm_id`, `breed_type`, `is_available`, `date_created`, `amount`, `user_id`, `is_active`, `image`, `quantity`, `total_quantity`) VALUES
(33, 28, 'Dutch', 1, '2019-04-30 12:10:01', 100, NULL, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1556597396625-rabbit.jpg', 0, 20),
(34, 28, 'French', 1, '2019-04-30 21:27:18', 200, NULL, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1556630829333-rabbit.jpg', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL,
  `hashcode` varchar(255) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_registration`
--

INSERT INTO `tbl_registration` (`id`, `hashcode`, `email`, `is_active`, `mobile`, `date_created`) VALUES
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3MSwiZW1haWwiOiJhcnlvbmdAZ21haWwuY29tIiwidXNlcl90eXBlIjoyLCJpc19hY3RpdmUiOjAsImlzX3ZlcmlmeSI6MCwiaWF0IjoxNTU2NTk2MjI3LCJleHAiOjE1NTY1OTk4Mjd9.Lh94PtdZ6yU3tH52R6UAlvlt7Lb21kKFSqsWuv6ELts', 'aryong@gmail.com', 0, '9229599246', '2019-04-30 11:50:26'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3MiwiZW1haWwiOiJtYXN0ZXJAZ21haWwuY29tIiwidXNlcl90eXBlIjoyLCJpc19hY3RpdmUiOjAsImlzX3ZlcmlmeSI6MCwiaWF0IjoxNTU2NTk2NDE0LCJleHAiOjE1NTY2MDAwMTR9.JKx3Q2KMqeeAwJMqxmPQO7h_Aa-MBPqrZImakVQE6f4', 'master@gmail.com', 1, '922599246', '2019-04-30 11:53:33'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3MywiZW1haWwiOiJ5aGVuQGdtYWlsLmNvbSIsInVzZXJfdHlwZSI6MSwiaXNfYWN0aXZlIjowLCJpc192ZXJpZnkiOjAsImlhdCI6MTU1NjU5Nzc2MCwiZXhwIjoxNTU2NjAxMzYwfQ.gOVg4M046PhSZA6MU4t_ATIyreIUEHx0MN0Lq79x1pc', 'yhen@gmail.com', 0, '9488616708', '2019-04-30 12:15:59');

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
  `is_verify` int(11) DEFAULT NULL,
  `is_banned` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `password`, `user_type`, `date_created`, `is_active`, `email`, `is_verify`, `is_banned`) VALUES
(71, 'ff2781a9e5c6805b54ca7dbe54eb6e07', 2, '2019-04-30 11:50:26', 1, 'aryong@gmail.com', 1, NULL),
(72, 'ff2781a9e5c6805b54ca7dbe54eb6e07', 0, '2019-04-30 11:53:33', 1, 'master@gmail.com', 0, NULL),
(73, 'c4eb3e282fcf46f210f15e77084c84d7', 1, '2019-04-30 12:15:59', 1, 'yhen@gmail.com', 0, NULL);

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
  `mobile` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `government_issued_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_profile`
--

INSERT INTO `tbl_user_profile` (`user_profile_id`, `first_name`, `last_name`, `address`, `address1`, `address2`, `mobile`, `avatar`, `user_id`, `zipcode`, `city`, `province`, `government_issued_id`) VALUES
(55, 'Aryong', 'Cute', 'Nasipit Road, Talamban,Cebu 6000 Samjung Building', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '9229599246', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/71-1556629638594.jpeg', 71, '6000', 'Cebu', 'Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/users/id/1556596220009-id.png'),
(56, 'Master', 'Master', 'Nasipit Road, Talamban,Cebu 6000 Samjung Building', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '922599246', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/breeder.png', 72, '6000', 'Cebu', 'Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/users/id/1556596412265-id.jpg'),
(57, 'Royena', 'Belda', 'Nasipit Road, Talamban,Cebu 6000 Samjung Building', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '9488616708', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/investor.png', 73, '6000', 'Cebu', 'Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/users/id/1556597755808-id.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vault_info`
--

CREATE TABLE `tbl_vault_info` (
  `vault_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invested_money` decimal(10,0) DEFAULT NULL,
  `profit` decimal(10,0) DEFAULT NULL,
  `unit_earnings` decimal(10,0) DEFAULT NULL,
  `reinvests` decimal(10,0) DEFAULT NULL,
  `withdrawn` decimal(10,0) DEFAULT NULL,
  `return` decimal(10,0) DEFAULT NULL,
  `active_investments` decimal(10,0) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_vault_info`
--

INSERT INTO `tbl_vault_info` (`vault_id`, `user_id`, `invested_money`, `profit`, `unit_earnings`, `reinvests`, `withdrawn`, `return`, `active_investments`, `balance`, `is_active`) VALUES
(6, 71, '0', '0', '0', '0', '0', '0', '0', '0', 1),
(7, 72, '0', '0', '0', '0', '0', '0', '0', '0', 1),
(8, 73, '0', '0', '0', '0', '0', '0', '0', '0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_active_investment`
--
ALTER TABLE `tbl_active_investment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farm_id` (`farm_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cycle_id` (`cycle_id`);

--
-- Indexes for table `tbl_admin_messages`
--
ALTER TABLE `tbl_admin_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_breeder_notification`
--
ALTER TABLE `tbl_breeder_notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `rabbit_id` (`rabbit_id`);

--
-- Indexes for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `user_id` (`user_id`);

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
  ADD KEY `cycle_id` (`cycle_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_investor_notification`
--
ALTER TABLE `tbl_investor_notification`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

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
-- Indexes for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  ADD PRIMARY KEY (`vault_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_active_investment`
--
ALTER TABLE `tbl_active_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_admin_messages`
--
ALTER TABLE `tbl_admin_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_breeder_notification`
--
ALTER TABLE `tbl_breeder_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_cycle`
--
ALTER TABLE `tbl_cycle`
  MODIFY `cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_farm`
--
ALTER TABLE `tbl_farm`
  MODIFY `farm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_farm_expenses`
--
ALTER TABLE `tbl_farm_expenses`
  MODIFY `farm_expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_investment_cycle`
--
ALTER TABLE `tbl_investment_cycle`
  MODIFY `investment_cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_rabbit`
--
ALTER TABLE `tbl_rabbit`
  MODIFY `rabbit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  MODIFY `user_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  MODIFY `vault_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_active_investment`
--
ALTER TABLE `tbl_active_investment`
  ADD CONSTRAINT `tbl_active_investment_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `tbl_farm` (`farm_id`),
  ADD CONSTRAINT `tbl_active_investment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_active_investment_ibfk_3` FOREIGN KEY (`cycle_id`) REFERENCES `tbl_cycle` (`cycle_id`);

--
-- Constraints for table `tbl_admin_messages`
--
ALTER TABLE `tbl_admin_messages`
  ADD CONSTRAINT `tbl_admin_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_breeder_notification`
--
ALTER TABLE `tbl_breeder_notification`
  ADD CONSTRAINT `tbl_breeder_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_cart_ibfk_2` FOREIGN KEY (`rabbit_id`) REFERENCES `tbl_rabbit` (`rabbit_id`);

--
-- Constraints for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  ADD CONSTRAINT `tbl_contract_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

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
  ADD CONSTRAINT `tbl_investment_cycle_ibfk_2` FOREIGN KEY (`cycle_id`) REFERENCES `tbl_cycle` (`cycle_id`),
  ADD CONSTRAINT `tbl_investment_cycle_ibfk_3` FOREIGN KEY (`cycle_id`) REFERENCES `tbl_cycle` (`cycle_id`),
  ADD CONSTRAINT `tbl_investment_cycle_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_investor_notification`
--
ALTER TABLE `tbl_investor_notification`
  ADD CONSTRAINT `tbl_investor_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_investor_notification_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

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
-- Constraints for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  ADD CONSTRAINT `tbl_vault_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
