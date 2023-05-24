-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2021 at 08:15 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectx`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'draft'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'dimsum'),
(2, 'berries'),
(3, 'meat');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL,
  `img_path` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `category_id`, `active`, `price`, `img_path`) VALUES
(7, 'Siopao', '6 pieces per pack', 1, 1, 150, 'images/siopao.png'),
(8, 'Siomai', '20 pieces per pack', 1, 1, 99, 'images/siomai.png'),
(9, 'Sharksfin', '20 pieces per pack', 1, 1, 150, 'images/sharksfin.png'),
(10, 'Strawberry', '1 kilogram per pack', 2, 1, 299, 'images/strawberry.jpg'),
(11, 'Cranberry', '1 kilogram per pack', 2, 1, 299, 'images/cranberry.jpg'),
(12, 'Blueberry', '1 kilogram per pack', 2, 1, 299, 'images/blueberry.jpg'),
(13, 'Raspberry', '1 kilogram per pack', 2, 1, 299, 'images/raspberry.jpg'),
(14, 'Mixed Berries', '1 kilogram per pack', 2, 1, 299, 'images/mixedberries.jpg'),
(15, 'Bacon', '1 kilogram per pack', 3, 1, 299, 'images/bacon.jpg'),
(16, 'Beef Bangers', '4 pieces per pack', 3, 1, 299, 'images/beef-bangers.jpg'),
(17, 'All-beef Bratwurst', '4 pieces per pack', 3, 1, 299, 'images/all-beef-bratwurst.png'),
(18, 'Chicken Sausage', '4 pieces per pack', 3, 1, 299, 'images/chicken-sausage.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sale_order`
--

CREATE TABLE `sale_order` (
  `id` int(11) NOT NULL,
  `so_number` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_order_line`
--

CREATE TABLE `sale_order_line` (
  `id` int(11) NOT NULL,
  `so_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_quant`
--

CREATE TABLE `stock_quant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_quant`
--

INSERT INTO `stock_quant` (`id`, `product_id`, `qty`) VALUES
(1, 7, 14),
(2, 8, 56),
(3, 9, 21),
(4, 10, 27),
(5, 11, 18),
(6, 12, 42),
(7, 13, 11),
(8, 14, 13),
(9, 15, 16),
(10, 16, 19),
(11, 17, 13),
(12, 18, 9);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(16) NOT NULL,
  `is_customer` tinyint(1) NOT NULL DEFAULT 1,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile_number` bigint(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `is_customer`, `address`, `gender`, `mobile_number`, `email`) VALUES
(4, 'Administrator', 'admin', 'admin', 0, 'Antipolo City', 'Male', 9558568576, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_order`
--
ALTER TABLE `sale_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_order_line`
--
ALTER TABLE `sale_order_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_quant`
--
ALTER TABLE `stock_quant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sale_order`
--
ALTER TABLE `sale_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `sale_order_line`
--
ALTER TABLE `sale_order_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `stock_quant`
--
ALTER TABLE `stock_quant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
