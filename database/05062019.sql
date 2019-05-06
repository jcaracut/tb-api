-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2019 at 11:06 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farm_expenses`
--

CREATE TABLE `tbl_farm_expenses` (
  `farm_expenses_id` int(11) NOT NULL,
  `item` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `date_added` datetime NOT NULL,
  `farm_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `is_active` int(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD KEY `farm_id` (`farm_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_admin_messages`
--
ALTER TABLE `tbl_admin_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_breeder_notification`
--
ALTER TABLE `tbl_breeder_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_cycle`
--
ALTER TABLE `tbl_cycle`
  MODIFY `cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_farm`
--
ALTER TABLE `tbl_farm`
  MODIFY `farm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_farm_expenses`
--
ALTER TABLE `tbl_farm_expenses`
  MODIFY `farm_expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_investment_cycle`
--
ALTER TABLE `tbl_investment_cycle`
  MODIFY `investment_cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_rabbit`
--
ALTER TABLE `tbl_rabbit`
  MODIFY `rabbit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  MODIFY `user_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
--
-- AUTO_INCREMENT for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  MODIFY `vault_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
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
  ADD CONSTRAINT `tbl_rabbit_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `tbl_farm` (`farm_id`);

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
