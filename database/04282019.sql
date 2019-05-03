-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2019 at 05:22 PM
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
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_active_investment`
--

INSERT INTO `tbl_active_investment` (`id`, `farm_id`, `user_id`, `date_started`, `number_of_rabbits`, `breed_type`, `cycle_id`, `end_of_investment`, `is_active`, `amount`, `status`) VALUES
(1, 26, 55, '2019-04-28 22:52:08', 1, 'French', 1, '2019-04-28 22:52:08', 1, '100', NULL),
(2, 22, 55, '2019-04-28 23:14:56', 1, 'Rabbit Ni', 1, '2019-04-28 23:14:56', 1, '200', NULL),
(3, 22, 55, '2019-04-28 23:14:56', 1, 'Basta', 1, '2019-04-28 23:14:56', 1, '20', NULL);

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

--
-- Dumping data for table `tbl_admin_messages`
--

INSERT INTO `tbl_admin_messages` (`id`, `subject`, `message`, `date_added`, `is_read`, `is_active`, `user_id`) VALUES
(8, 'sample', 'sample', '2019-04-22 04:54:10', 0, 1, 55),
(9, 'bunny', 'qwertyuiosdfghjkasdfghjksadfghjjqwertsdfgsdfghgfdghjsadfgfhgjasdfgfh', '2019-04-22 06:37:46', 0, 1, 55),
(10, 'qwerty', 'asdasfsasdada', '2019-04-23 14:58:00', 0, 1, 55),
(11, 'qwerty', 'asdasfsasdada', '2019-04-23 14:58:16', 0, 1, 55),
(12, 'sample ', 'axZXZX', '2019-04-23 20:21:52', 0, 1, 55),
(13, 'asdasdas', 'asd', '2019-04-23 20:24:52', 0, 1, 55),
(14, 'asdasd', 'asdsadas', '2019-04-23 20:25:30', 0, 1, 55),
(15, 'asdasd', 'asdasdasd', '2019-04-24 21:42:35', 0, 1, 55),
(16, 'Sample', 'test', '2019-04-25 00:28:14', 0, 1, 55),
(17, 'Annieboang', 'annie ikay boang', '2019-04-25 15:34:11', 0, 1, 55);

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

--
-- Dumping data for table `tbl_breeder_notification`
--

INSERT INTO `tbl_breeder_notification` (`notification_id`, `user_id`, `message`, `subject`, `date_created`, `is_read`, `is_active`, `from`) VALUES
(1, 52, 'Please upload a clear image of your id.', 'ID is blurred', '2019-04-16 00:00:00', 0, 1, NULL),
(2, 52, 'Your acount is not veirified.', 'ID is blurred', '2019-04-16 00:00:00', 0, 1, NULL),
(3, 52, 'New cycle has been opened, please verify your account to join.', 'New Cycle', '2019-04-17 00:00:00', 1, 1, NULL),
(5, 52, 'bunney kigol', 'liki', '2019-04-22 00:00:00', 0, 1, NULL),
(6, 52, 'test', 'test', '2019-04-23 00:00:00', 0, 1, NULL),
(7, 8, 'sample', 'sample', '2019-04-24 16:12:37', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rabbit_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cart_id`, `user_id`, `rabbit_id`, `date_added`) VALUES
(1, 52, 1, '2019-04-18 00:00:00'),
(2, 52, 3, '2019-04-18 00:00:00');

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
(1, 55, '2019-04-23 20:55:32', 1, '1556024122378-contract.pdf'),
(2, 55, '2019-04-23 20:56:18', 1, '1556024172098-contract.pdf'),
(3, 55, '2019-04-23 20:57:20', 1, '1556024233275-contract.pdf'),
(4, 55, '2019-04-28 22:52:20', 1, '1556463128495-contract.pdf'),
(5, 55, '2019-04-28 23:15:11', 1, '1556464497034-contract.pdf');

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
(1, '2019-04-01 00:00:00', '2019-05-01 00:00:00', '2019-05-25 17:43:40', 1);

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
(1, 10, 'Farm Ville', 'Silicon Valley, LA', '', 100, '2019-03-11 00:00:00', 1, 1, NULL, NULL),
(2, 8, 'Farmer', 'Nasipit, Borbon, Cebu', '', 120, '2019-03-11 00:00:00', 0, 1, NULL, NULL),
(9, 52, 'Farm Lang', 'Argao, Cebu', 'farming', 100, '2019-03-22 04:01:52', 0, 1, NULL, NULL),
(10, 8, 'Farmela One', 'San Roque, Asturias, Cebu', 'farming', 100, '2019-04-02 05:30:16', 1, 1, NULL, NULL),
(11, 8, 'Jeki Farm', 'San Roque, Asturias, Cebu', 'farming', 100, '2019-04-02 05:38:01', 0, 1, 123, 22),
(12, 8, 'asd', 'asd', 'farming', 100, '2019-04-02 05:43:00', 0, 1, 123, 12),
(13, 8, 'ewqrqwr', 'asdsadasd', 'farming', 100, '2019-04-02 05:43:19', 0, 0, NULL, NULL),
(14, 52, 'Farm ni', 'Dalaguete', 'farming', 100, '2019-04-08 12:52:45', 0, 1, NULL, NULL),
(15, 52, 'Farm On', 'San Roque, Asturias, Cebu', 'farming', 100, '2019-04-09 06:02:28', 1, 1, NULL, NULL),
(16, 53, 'Amaw', 'asdfghjkl;', 'farming', 100, '2019-04-09 11:30:46', 1, 1, NULL, NULL),
(22, 52, 'Annie\'s Farm', 'test', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1554907193324-expense.jpg', 100, '2019-04-10 14:39:58', 1, 1, 10.3365713, 123.9083653),
(23, 52, 'test 2', 'Nasipit Talamban', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1555145713712-farm.jpg', 100, '2019-04-13 08:55:17', 1, 1, 0, 0),
(24, 52, 'Jecson\'s Farm', 'Nasipit Talamban', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1555145773529-farm.jpg', 100, '2019-04-13 08:56:15', 1, 1, 0, 0),
(25, 64, 'Jecson\'s Farm', 'Nasipit Talamban', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1555223342934-farm.jpg', 100, '2019-04-14 06:29:07', 1, 1, 0, 0),
(26, 52, 'Bahyen\'s Farm', 'Nasipit Talamban', '//s3.amazonaws.com/bunney/assets/uploads/images/farms/image/1555417218170-farm.jpg', 100, '2019-04-16 12:20:22', 1, 1, 9.827371, 123.5450726);

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
(7, 'test', 20, 'test', '2019-04-10 13:38:11', 15, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1554903491828-expense.jpg', 1),
(8, 'test 2', 20, 'brush brush', '2019-04-10 13:47:11', 15, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1554904030189-expense.jpg', 1),
(9, 'cute boy', 20, 'brush brush teeth', '2019-04-10 13:47:38', 15, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1554904057020-expense.PNG', 1),
(10, 'Carrots', 100, 'Food', '2019-04-11 05:59:54', 22, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1554962391872-expense.png', 1),
(11, 'Food', 20, 'Kaon', '2019-04-12 14:48:07', 22, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1555080482381-expense.png', 1),
(12, 'kanding', 20, '', '2019-04-22 06:56:53', 22, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1555916213217-expense.png', 1),
(13, 'Food', 100, '', '2019-04-24 20:06:58', 9, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1556107614631-expense.jpg', 1),
(14, 'Toothbrush', 20, '', '2019-04-24 22:23:27', 9, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1556115788443-expense.jpg', 1),
(15, 'Toothbrush', 20, '', '2019-04-25 20:14:12', 26, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/reciepts/1556194436835-expense.jpg', 1);

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
(3, 52, 1, 1, '2019-04-28 22:23:55');

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

--
-- Dumping data for table `tbl_investor_notification`
--

INSERT INTO `tbl_investor_notification` (`notification_id`, `user_id`, `message`, `date_created`, `is_read`, `is_active`, `subject`) VALUES
(0, 52, 'Please upload a clear image of your id.', '0000-00-00 00:00:00', 0, 1, 'ID is blurred'),
(1, 52, 'Please upload a clear image of your id.', '0000-00-00 00:00:00', 0, 1, 'ID is blurred'),
(0, 55, 'test', '2019-04-22 00:00:00', 0, 1, 'sample');

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
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rabbit`
--

INSERT INTO `tbl_rabbit` (`rabbit_id`, `farm_id`, `breed_type`, `is_available`, `date_created`, `amount`, `user_id`, `is_active`, `image`) VALUES
(1, 2, 'Dutch', 1, '2019-03-21 00:00:00', 0, 11, 0, NULL),
(2, 2, 'French', 1, '2019-03-21 00:00:00', 10, 11, 0, NULL),
(3, 2, 'Pinoy', 1, '2019-03-22 00:00:00', 1000, 11, 0, NULL),
(19, 22, 'Test', 1, '2019-04-11 05:54:48', 20, NULL, 0, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1554962088125-expense.png'),
(20, 22, 'test', 1, '2019-04-11 05:57:41', 120, NULL, 0, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1554962253276-expense.png'),
(21, 22, 'Askal', 1, '2019-04-19 03:51:05', 2000, NULL, 0, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1555645864731-rabbit.jpg'),
(22, 22, 'Basta', 0, '2019-04-19 11:31:10', 20, 55, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1555673469756-rabbit.jpg'),
(23, 22, 'Rabbit Ni', 0, '2019-04-19 11:36:02', 200, 55, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1555673761835-rabbit.png'),
(24, 26, 'French', 0, '2019-04-22 00:36:16', 100, 55, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1555893375818-rabbit.jpg'),
(25, 26, 'Austt', 0, '2019-04-22 20:05:41', 200, NULL, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1555934734934-rabbit.png'),
(26, 9, 'Yep yep', 0, '2019-04-24 18:37:21', 100, NULL, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1556102233494-rabbit.jpg'),
(27, 26, 'Tera', 0, '2019-04-24 19:17:38', 100, NULL, 1, '//s3.amazonaws.com/bunney/assets/uploads/images/farms/rabbits/1556104655067-rabbit.jpg');

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
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2MiwiZW1haWwiOiJtaWNvY2FyYWN1dEBnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjIsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUxMzk1NzcsImV4cCI6MTU1NTE0MzE3N30.Q071trhrQv522fSJ0WyPqVUWJQSaiMrJ8wDyrq_JrHw', 'micocaracut@gmail.com', 0, NULL, NULL),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2MywiZW1haWwiOiJtaWNvY2FyYWN1dEBnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjIsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUxNDQ4NTUsImV4cCI6MTU1NTE0ODQ1NX0.cl_KjPMRpS3TwbnoiZ8s-e-ngjhPWMfd5KiosdddFjM', 'micocaracut@gmail.com', 1, NULL, NULL),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2NCwiZW1haWwiOiJtaWNvY2FyYWN1dEBnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjIsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUyMjI2NzEsImV4cCI6MTU1NTIyNjI3MX0.RUOOQ1dxMvUkMl4xk3qRDzotpJVEMZ3iXYMQmZQRfMo', 'micocaracut@gmail.com', 0, '9226899308', NULL),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2NSwiZW1haWwiOiJyZ2FsbGFub0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjEsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUzOTE0MTYsImV4cCI6MTU1NTM5NTAxNn0.N9h-EzmxPwwN7GsV-vaJz4f6X4YN1UKwRzc8Wy2qBe4', 'rgallano@gmail.com', 1, '9123456789', NULL),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2NiwiZW1haWwiOiJyZ2FsbGFub0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjIsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUzOTE1NjAsImV4cCI6MTU1NTM5NTE2MH0.LeQ3I4vk0GLGu82VSZ4qw7Zk7qSkeXeykVXOacO1VQk', 'rgallano@gmail.com', 1, '9223330022', NULL),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2NywiZW1haWwiOiJyZ2FsbGFub0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjIsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUzOTE2MjMsImV4cCI6MTU1NTM5NTIyM30.5D47LqYpOOAf1MK4vHuZfW6mFKzelnHVglH1t5aQZsI', 'rgallano@gmail.com', 1, '9334423233', NULL),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2OCwiZW1haWwiOiJyZ2FsbGFub0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjEsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUzOTE3ODQsImV4cCI6MTU1NTM5NTM4NH0.8e1tX2ZxaGWoGx7H5bUTllaFMXiEKviDi6L9hV0HiDs', 'rgallano@gmail.com', 1, '9343255324', NULL),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo2OSwiZW1haWwiOiJyZ2FsbGFub0BnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjEsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTUzOTIwODksImV4cCI6MTU1NTM5NTY4OX0.bWK6xx951lUoAWMI_viqLGY3ogYSyUE8hWGzRlbqMv8', 'rgallano@gmail.com', 1, '9453234234', NULL),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo3MCwiZW1haWwiOiJ5ZW5uYUBnbWFpbC5jb20iLCJ1c2VyX3R5cGUiOjIsImlzX2FjdGl2ZSI6MCwiaXNfdmVyaWZ5IjowLCJpYXQiOjE1NTYyMDExMjcsImV4cCI6MTU1NjIwNDcyN30.-yKVdIXm2mememqCNfaJOc29b6GYTUDaYn21idrUlZ8', 'yenna@gmail.com', 0, '9364575107', '2019-04-25 22:05:26');

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
(7, 'asd', 1, '2019-03-06 10:44:15', 1, 'jcaracut@gmail.com', 1, NULL),
(8, '7815696ecbf1c96e6894b779456d330e', 2, '2019-03-07 01:50:00', 1, 'aryong@gmail.com', 0, NULL),
(10, 'test', 1, '2019-03-08 05:44:11', 0, 'dindin@gmail.com', 1, NULL),
(11, '7815696ecbf1c96e6894b779456d330e', 1, '2019-03-11 13:35:27', 1, 'blue@gmail.com', 1, NULL),
(52, '7815696ecbf1c96e6894b779456d330e', 2, '2019-04-08 12:47:48', 1, 'jeki@gmail.com', 1, 0),
(53, '81dc9bdb52d04dc20036dbd8313ed055', 2, '2019-04-09 11:27:21', 1, 'yen@gmail.com', 1, NULL),
(54, '7815696ecbf1c96e6894b779456d330e', 0, '2019-04-11 06:50:16', 1, 'master@gmail.com', 1, NULL),
(55, '7815696ecbf1c96e6894b779456d330e', 1, '2019-04-12 15:07:26', 1, 'investor@gmail.com', 1, NULL),
(56, '912ec803b2ce49e4a541068d495ab570', 1, '2019-04-12 15:19:30', 0, 'pototko56@gmail.com', 0, NULL),
(57, '827ccb0eea8a706c4c34a16891f84e7b', 2, '2019-04-12 15:31:43', 0, 'aninipot@gmail.com', 0, NULL),
(64, '7815696ecbf1c96e6894b779456d330e', 2, '2019-04-14 06:17:50', 1, 'micocaracut@gmail.com', 1, NULL),
(69, '7815696ecbf1c96e6894b779456d330e', 1, '2019-04-16 05:21:29', 0, 'rgallano@gmail.com', 0, NULL),
(70, 'bff29fe2c3269812851d6fda69b3472d', 2, '2019-04-25 22:05:26', 1, 'yenna@gmail.com', 0, NULL);

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
(5, 'Aryong', 'Cute', '{\"address1\":\"Nasipit\",\"address2\":\"Talamban\"}', 'Nasipit', 'Talamban', '9229599247', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/liza.jpg', 8, '6000', 'Cebu', 'Cebu', NULL),
(36, 'Jecson', 'Caracut', 'Samjung Building, Nasipit Road, Talamban, Cebu 6000', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '9229599778', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/52-1556351451660.jpg', 52, NULL, NULL, NULL, NULL),
(37, 'Yen', 'belda', 'Samjung Building Nasipit Road, Talamban,Cebu 6000', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '9488616708', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/53-1554809337081.jpg', 53, NULL, NULL, NULL, NULL),
(38, 'Master', 'Butin', 'Bahala ka Secret,Secret basta', 'Secret,Secret basta', 'Bahala ka', '2222222222', '', 54, NULL, NULL, NULL, NULL),
(39, 'Jan Bel', 'Debalucos', 'Samjung Building,Cebu 6000 Nasipit Road, Talamban', 'Samjung Building,Cebu 6000', 'Nasipit Road, Talamban', '9120955102', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/55-1556280219961.jpg', 55, '6000', 'Cebu', 'Cebu', ''),
(40, NULL, 'Caracut', 'samjung,cwbu 6000 nasipit', 'samjung,cwbu 6000', 'nasipit', '9755138231', '', 56, '6000', 'cwbu', 'cebu', ''),
(41, 'Jecson', 'Jeki', 'Samjung Building,Cebu 6000 Nasipit Road, Talamban', 'Samjung Building,Cebu 6000', 'Nasipit Road, Talamban', '9504497140', '', 57, '6000', 'Cebu', 'Cebu', ''),
(48, 'test', 'test', 'Samjung Building,Cebu 6000 Nasipit Road, Talamban', 'Samjung Building,Cebu 6000', 'Nasipit Road, Talamban', '9226899308', '', 64, '6000', 'Cebu', 'Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/users/id/1555222669574-id.jpg'),
(53, 'test', 'Jeki', 'asd,Cebu 6000 Nasipit Road, Talamban', 'asd,Cebu 6000', 'Nasipit Road, Talamban', '9453234234', '', 69, '6000', 'Cebu', 'Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/users/id/1555392089030-id.png'),
(54, 'Royena', 'Gamboa', 'Nasipit Road, Talamban,Cebu 6000 Samjung Building', 'Nasipit Road, Talamban,Cebu 6000', 'Samjung Building', '9364575107', '//s3.amazonaws.com/bunney/assets/uploads/images/users/avatar/breeder.png', 70, '6000', 'Cebu', 'Cebu', '//s3.amazonaws.com/bunney/assets/uploads/images/users/id/1556201124923-id.jpg');

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
(3, 69, '0', '0', '0', '0', '0', '0', '0', '0', 1),
(4, 55, '0', '0', '0', '0', '0', '0', '0', '100', 1),
(5, 70, '0', '0', '0', '0', '0', '0', '0', '0', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_contract`
--
ALTER TABLE `tbl_contract`
  MODIFY `contract_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cycle`
--
ALTER TABLE `tbl_cycle`
  MODIFY `cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_farm`
--
ALTER TABLE `tbl_farm`
  MODIFY `farm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_farm_expenses`
--
ALTER TABLE `tbl_farm_expenses`
  MODIFY `farm_expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_investment_cycle`
--
ALTER TABLE `tbl_investment_cycle`
  MODIFY `investment_cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_rabbit`
--
ALTER TABLE `tbl_rabbit`
  MODIFY `rabbit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `tbl_user_profile`
--
ALTER TABLE `tbl_user_profile`
  MODIFY `user_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_vault_info`
--
ALTER TABLE `tbl_vault_info`
  MODIFY `vault_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
