-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2019 at 05:14 PM
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
('-3WtquIRrHy7imKkBtxmvd1IgPCVmxQf', 1554019439, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:03:58.600Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('121ngal5aOmIwWz_uZB01Bsi6JA3Dy-m', 1554019490, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:49.639Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('2bGgvJmXEn7hLH0lkH6jqJ55IFPW9-vf', 1554019165, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:59:25.342Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('6Swcp4_7-dZWBMd2MfLk-oYWMcz_uN7W', 1554019284, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:01:24.414Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('7pjwEPcoCwZXnELXbwGSqqTtkRDfnAtr', 1554019543, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:05:42.745Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('A6vaR52pnJ-IbvRDNlyr81ZVjyFMIne-', 1554019165, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:59:25.414Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Ah_a7IEkmiptUCscZqhORGCwNFXMrY4K', 1554019225, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:00:25.431Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Dd9eAAubIlLTOfkZDKbnvcoXUvR5D09d', 1554018911, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:55:11.111Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('H3tMTbmOELRMlr2mUartO8KsnMNn3X34', 1554019167, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:59:26.882Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('IJbEsn2wHRU2hIdZ9C4Gin57cmqSWGqf', 1554019323, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:02:03.210Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('JRIijCZBGAB5BvxDPIrJjcdcJ_kAimWC', 1554019442, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:02.449Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Jk5bVdJcdD3mAke7926-5HL7TFsKBUxK', 1554019547, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:05:47.201Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('O9N_P2goD-CkGel6BQZ_LBjOR-iGKlEc', 1554019375, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:02:54.540Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('RGV8Ro94Saqi4w_RgyLQkylAefygjdeN', 1554019058, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:57:38.209Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('SnnLRf29-8wtBl0sK5UCdI7KFfaabYc_', 1554018692, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:51:32.333Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('UaE8P4u1gr0yYVm9Ff5bMqBq3cpSQhPH', 1554019439, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:03:58.812Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('VM7Q_v-PlQgbedC1zy0TuvGoo65qSpsn', 1554018692, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:51:32.137Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('YKRxr-obsCimd-3mPX6idgpIE2G38PxM', 1554019482, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:42.127Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('Z1h_0tvOioKixm9Zbq4q3wGjyNsudVAp', 1554019026, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:57:06.403Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Z5kC_SgwNu0wMsNbpZiLpatBjHSlQYCl', 1554018603, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:50:02.726Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('Zf9pgyZwA2mFa0J2f_j6tZaihoLdCceC', 1554019374, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:02:54.305Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('_6Tw4kRb2mBUmE5wc2HkE5syo4bfSb8f', 1554018602, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:50:02.499Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('bIFlgf5w9K9Vz4o0fBeCrqRTPuQ6N_hH', 1554018483, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:48:02.580Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('bISMGGFm-qdjJT6yUCwinzgzcAlNN6cJ', 1554019488, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:48.201Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('f20AW9Nvm18fIGbME0TLqYXQe6gpt__E', 1554019026, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:57:06.157Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('fkQ6jx2jDigOtqHEZoQXKCI3LKrFMUuh', 1554018974, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:56:13.975Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('hEMHKuTch3vgHE_1XdGoav4Qo03fCVCA', 1554019482, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:42.370Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('kspRbnx0adw5S05-GPNYZZjiMCzwqYsL', 1554019225, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:00:25.202Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('n5JKvfz7H5suuclsH5NPSXgNacvafkUz', 1554019484, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:44.135Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('qDy1q1QaqcieKjiOojtyJyMMevfxz9DG', 1554018974, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:56:13.751Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('sv9sAYVd_qj4nk2yHuR12OikEt_FmTQN', 1554018911, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:55:11.297Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('tXv07zh1ren_mHnCxyfDHWbS2XcEW4Se', 1554019323, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:02:03.014Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('te59VIsYtXujjN7EY6i494jbEqkBjhaX', 1554019379, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:02:59.385Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('txykwi9rakanzH5OFQOOrCIRjhxeG6Tg', 1554019285, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:01:24.610Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('uoZ5LQlUCtVE7_Ll5K1ysV3iL8g8DsG_', 1554019058, '{\"cookie\":{\"originalMaxAge\":3599999,\"expires\":\"2019-03-31T07:57:38.448Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}'),
('v-WsGDVFSnL2sfAgqrrSWNTsvvXhQgwq', 1554018482, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T07:48:01.695Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"email\":\"aryong@gmail.com\",\"loggedIn\":true,\"user\":8,\"authy\":false,\"ph_verified\":true}'),
('vqg65hmwkXEhN0k1k2SyUBk5ocQ3Ao5f', 1554019490, '{\"cookie\":{\"originalMaxAge\":3600000,\"expires\":\"2019-03-31T08:04:49.801Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}');

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
  `coordinates` varchar(55) DEFAULT NULL,
  `is_verify` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_farm`
--

INSERT INTO `tbl_farm` (`farm_id`, `user_id`, `farm_name`, `address`, `image`, `farm_size`, `date_created`, `is_active`, `coordinates`, `is_verify`) VALUES
(1, 10, 'Farm Ville', 'Silicon Valley, LA', '', 100, '2019-03-11 00:00:00', 1, NULL, 1),
(2, 8, 'Farmer', 'Nasipit, Borbon, Cebu', '', 120, '2019-03-11 00:00:00', 0, NULL, 1),
(9, 8, 'Farm Lang', 'Argao, Cebu', 'farming', 100, '2019-03-22 04:01:52', 0, '{}', 0),
(10, 8, 'Farmela One', 'San Roque, Asturias, Cebu', 'farming', 100, '2019-04-02 05:30:16', 0, '{}', 0),
(11, 8, 'Jeki Farm', 'San Roque, Asturias, Cebu', 'farming', 100, '2019-04-02 05:38:01', 0, '{}', 0),
(12, 8, 'asd', 'asd', 'farming', 100, '2019-04-02 05:43:00', 0, '{}', 0),
(13, 8, 'ewqrqwr', 'asdsadasd', 'farming', 100, '2019-04-02 05:43:19', 0, '{}', 0),
(14, 52, 'Farm ni', 'Dalaguete', 'farming', 100, '2019-04-08 12:52:45', 0, '{}', 1);

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
  `image_path` varchar(255) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farm_notification`
--

CREATE TABLE `tbl_farm_notification` (
  `notification_id` int(11) NOT NULL,
  `farm_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `is_read` int(11) NOT NULL
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
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rabbit`
--

INSERT INTO `tbl_rabbit` (`rabbit_id`, `farm_id`, `breed_type`, `is_available`, `date_created`, `amount`, `user_id`, `is_active`) VALUES
(1, 1, 'Dutch', 1, '2019-03-21 00:00:00', 0, 11, 1),
(2, 2, 'French', 1, '2019-03-21 00:00:00', 10, 11, 0),
(3, 2, 'Pinoy', 1, '2019-03-22 00:00:00', 1000, 11, 0),
(15, 2, 'dalagang filipina', 1, '2019-04-03 16:18:54', 1222, NULL, NULL),
(16, 2, 'Yeah', 1, '2019-04-03 16:20:13', 12222, NULL, 0),
(17, 2, 'Dutch', 1, '2019-04-05 10:19:21', 100, NULL, 0),
(18, 2, 'Eloise', 1, '2019-04-06 01:12:32', 10000, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL,
  `hashcode` varchar(255) NOT NULL,
  `email` varchar(55) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
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
(7, 'asd', 0, '2019-03-06 10:44:15', 0, 'jcaracut@gmail.com', 0),
(8, 'qwe', 2, '2019-03-07 01:50:00', 1, 'aryong@gmail.com', 1),
(10, 'test', 2, '2019-03-08 05:44:11', 1, 'dindin@gmail.com', 1),
(11, 'qwerty', 1, '2019-03-11 13:35:27', 1, 'blue@gmail.com', 1),
(12, 'amaw', 1, '2019-03-12 03:10:12', 1, 'pototko56@gmail.com', 1),
(52, 'ff2781a9e5c6805b54ca7dbe54eb6e07', 2, '2019-04-08 12:47:48', 1, 'jeki@gmail.com', 1);

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
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_profile`
--

INSERT INTO `tbl_user_profile` (`user_profile_id`, `first_name`, `last_name`, `address`, `address1`, `address2`, `mobile`, `avatar`, `user_id`) VALUES
(4, 'Jecson', 'Caracut', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599245', '/assets/avatars/default.jpg', 7),
(5, 'Aryong', 'Cute', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599247', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/liza.jpg', 8),
(7, 'Dindin', 'Yeah', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599123', '/assets/avatars/default.jpg', 10),
(8, 'Jecson', 'Caracut', '{\"address1\":\"Ormoc ,Cebu,Cebu 6000\",\"address2\":\"Samjong Bilding\"}', 'Ormoc ,Cebu,Cebu 6000', 'Samjong Bilding', '12345678901', '/assets/avatars/default.jpg', 11),
(36, 'Jecson', 'Caracut', 'Nasipit Road, Talamban,Cebu 6000 Samjung Building', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '9229599246', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/liza.jpg', 52);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vault_info`
--

CREATE TABLE `tbl_vault_info` (
  `vault_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invested_money` double DEFAULT NULL,
  `profit` double DEFAULT NULL,
  `unit_earnings` double DEFAULT NULL,
  `reinvests` double DEFAULT NULL,
  `withdrawn` double DEFAULT NULL,
  `return` double DEFAULT NULL,
  `active_investments` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_vault_info`
--

INSERT INTO `tbl_vault_info` (`vault_id`, `user_id`, `invested_money`, `profit`, `unit_earnings`, `reinvests`, `withdrawn`, `return`, `active_investments`, `balance`, `is_active`) VALUES
(1, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Indexes for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  ADD PRIMARY KEY (`vault_id`),
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
  MODIFY `farm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `rabbit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  MODIFY `user_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  MODIFY `vault_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  ADD CONSTRAINT `tbl_vault_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
