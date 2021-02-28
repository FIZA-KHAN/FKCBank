-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2021 at 11:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `current_balance` int(20) NOT NULL,
  `gender` int(1) NOT NULL,
  `city` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `fname`, `lname`, `email`, `phone`, `current_balance`, `gender`, `city`) VALUES
(1, 'Fiza', 'Khan', 'fiza@gmail.com', 2147483647, 502000, 0, 'Mumbai'),
(2, 'Adith', 'Patil', 'adith@gmail.com', 1456728393, 99990, 1, 'Thane'),
(3, 'Azhar', 'Ahmed', 'azhar@gmail.com', 1695741582, 150020, 1, 'Mumbai'),
(4, 'Mahesh', 'Bhatt', 'bhatt@gmail.com', 1452789635, 700010, 1, 'Delhi'),
(5, 'Pooja', 'Mishra', 'pooja@gmail.com', 452163879, 200010, 0, 'Thane'),
(6, 'Dhanashree', 'Sakpal', 'sakpal@gmail.com', 985714268, 399810, 0, 'Mumbai'),
(7, 'Anand', 'Mauli', 'anand@gmail.com', 78541269, 998010, 1, 'Thane'),
(8, 'Trupti', 'Patel', 'patelt@gmail.com', 45217869, 59990, 0, 'Andheri'),
(9, 'Jhon', 'Fernandis', 'ferjhon@gmail.com', 5214786, 500200, 1, 'Mumbai'),
(10, 'Khushi', 'Ansari', 'ansarik@gmail.com', 415278693, 869980, 0, 'Mumbai'),
(11, 'Dipali', 'Gurav', 'dipali@gmail.com', 74182695, 539980, 0, 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `customer_id` int(11) NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`customer_id`, `sender_name`, `receiver_name`, `amount`, `date`) VALUES
(1, 'Fiza', 'Adith', 100, '2021-02-26 20:18:44'),
(2, 'Adith', 'Fiza', 100, '2021-02-26 20:20:46'),
(3, 'Anand', 'Fiza', 1000, '2021-02-26 20:26:10'),
(5, 'Dhanashree', 'Jhon', 100, '2021-02-26 20:32:49'),
(10, 'Dipali', 'Azhar', 20, '2021-02-27 20:10:30'),
(11, 'Azhar', 'Dipali', 40, '2021-02-27 20:14:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
