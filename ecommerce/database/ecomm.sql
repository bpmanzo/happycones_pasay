-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2021 at 02:44 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(6, 'Half Gallon', '');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 11, 2, 1),
(22, 12, 1, 1),
(23, 13, 33, 1),
(24, 14, 33, 1),
(25, 14, 34, 1),
(26, 15, 34, 2),
(27, 15, 33, 1),
(28, 16, 35, 1),
(29, 16, 34, 3),
(30, 17, 33, 1),
(31, 17, 35, 2),
(32, 18, 33, 2),
(33, 18, 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `stock`, `photo`, `date_view`, `counter`) VALUES
(33, 6, 'Chocolate', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed purus accumsan, tempor sapien non, fermentum neque. Fusce rhoncus nunc lobortis erat convallis, interdum finibus purus rutrum.</p>\r\n', 'chocolate', 275, 0, 'chocolate.jpeg', '2020-11-09', 1),
(34, 6, 'Double Dutch', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed purus accumsan, tempor sapien non, fermentum neque. Fusce rhoncus nunc lobortis erat convallis, interdum finibus purus rutrum.</p>\r\n', 'double-dutch', 275, 0, 'double-dutch.jpeg', '2020-11-09', 1),
(35, 6, 'Strawberry', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed purus accumsan, tempor sapien non, fermentum neque. Fusce rhoncus nunc lobortis erat convallis, interdum finibus purus rutrum.</p>\r\n', 'strawberry', 275, 0, 'strawberry.jpeg', '2020-11-08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(13, 19, 'PAYID-L6NN27I5E005905KN8168330', '2020-10-29'),
(14, 19, 'PAYID-L6SYBOA6GC72185AD4119519', '2020-11-06'),
(15, 19, 'PAYID-L6TEVUI9EM31481RD495811R', '2020-11-07'),
(16, 19, 'PAYID-L6TKV6A4TM99766GN0570546', '2020-11-07'),
(17, 21, 'PAYID-L6TZWNY2P492608AX491551H', '2020-11-08'),
(18, 22, 'PAYID-L6UNKLI26P930962E173800D', '2020-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@happycones.com', '$2y$10$nocjnndscQwvYg08d2StLeYjRBJ20tNu2jLuEpJGxH0caO4i.9dn6', 1, 'Brent Millen', 'Manzo', '', '', 'admin.jpg', 1, '', '', '2018-05-01'),
(18, 'millen.brent@gmail.com', '$2y$10$APLvFqlz8DloliopY3YGaO63VqNLFTb2cPQ5V26XyyhSCrAdCEo.O', 0, 'Brent', 'User', 'Taguig City', '09776487410', '', 1, '9y48lnVgca6S', '7ZeOiQSAgRrX1cH', '2020-10-15'),
(19, 'rcbance@student.apc.edu.ph', '$2y$10$w4yhXoxHIBWXPnDqjw9MnOAbTUApHuvqHS5VmRmZ3gQe6GTLNRQfm', 0, 'Thirdy', 'Bance', '', '', '', 1, 'OwXmCorHnNGk', '', '2020-10-19'),
(21, 'aarongardon@test.com', '$2y$10$aRyObfrQSiEyZsvMvimEhOGBY14KS8QN3D84nNE56GDrrqqagoUle', 0, 'Aaron', 'Gardon', 'Taguig City', '0999999999', '', 1, '3mnd2pIOclVJ', '', '2020-11-08'),
(22, 'aarongardon@trial.com', '$2y$10$VI68IMVF56q0YspZE6AMy.XFfNSLDBP3oe7V10BzmIQ8r79.tg8Jy', 0, 'Aaron', 'Gardon', '', '', '', 1, '9QHaAg2mhINe', '', '2020-11-09');

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
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
