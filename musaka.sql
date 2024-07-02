-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2024 at 12:40 PM
-- Server version: 8.0.37-0ubuntu0.20.04.3
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('1302e4b3a638040ad124dbc2294a2e4b46d1911a', 'testclient', 'admin3', '2024-06-26 21:26:08', NULL),
('97101064b4ab8dc2ccd1fc434b2ba626248da78b', 'testclient', 'admin2', '2024-06-26 21:21:13', NULL),
('ad2a67895d96a646ab4bad4c6e91c893d4e0202f', 'testclient', 'rammstein', '2024-06-26 21:39:49', NULL),
('ae037918947c50ad0b6107bb25d287fdbf6fbf6e', 'testclient', 'admin3', '2024-06-29 08:10:40', NULL),
('c3218f57f1d5e3e919d2f8dd81941d3966b4416e', 'testclient', 'admin3', '2024-06-26 21:36:35', NULL),
('e2b93ec34f31475c287b72c4ee592f15a8a54c00', 'testclient', 'admin3', '2024-06-26 21:17:34', NULL),
('f45e6cc168bf6652e3f681201220fe07dfb93fa7', 'testclient', 'chole', '2024-06-27 10:41:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('testclient', 'testpass', 'https://musaka.stud.vts.su.ac.rs/oauth_callback.php', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_public_keys`
--

CREATE TABLE `oauth_public_keys` (
  `client_id` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('2df943bd52767d930e2b3ccd9f0b1784c8f71fa5', 'testclient', 'admin3', '2024-07-10 20:26:08', NULL),
('3577d509ed6e37b8ae2187db55ab8ce218b213b3', 'testclient', 'admin3', '2024-07-10 20:36:35', NULL),
('3eae553bdcfcf3f2f4b24b485f1b342ae5dc9e03', 'testclient', 'chole', '2024-07-11 09:41:46', NULL),
('753e02d63c4288da05f0e0f40df69b9076381b8d', 'testclient', 'admin2', '2024-07-10 20:21:13', NULL),
('a11a3bb32823d47f3d112d41b9c745d130f0fee6', 'testclient', 'admin3', '2024-07-10 20:17:34', NULL),
('f03cb98eacd671d9a7179198255de787a71f226b', 'testclient', 'rammstein', '2024-07-10 20:39:49', NULL),
('fc59f7f9df5593abc46de8a53492731180d5eb49', 'testclient', 'admin3', '2024-07-13 07:10:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_users`
--

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`, `email`) VALUES
('admin2', '$2y$10$fPfZggh.iq/g9XX.8GbE8ucfBK0XKGRoN9wx.sTRLmqunidtjOq4S', '', '', 'admin2@admin.com'),
('admin3', '$2y$10$.GGRHSVLwzyHlXzuTsV2AuOTN0Pjcqgo68msOAC7y6YYCxm7qhxBO', '', '', 'admin3@admin.com'),
('chole', '$2y$10$rfIFvtM32MECTIjvwoopBOLdpGupffB1lh9QNfRzqF86..buNxPbu', '', '', 'chole@chole.com'),
('rammstein', '$2y$10$IIQTA4tgqlnggSx9/eLRaeD3wIZ7XkJSmB22b7/2H1Lb25CeoQWA2', '', '', 'rammstein@rammstein.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(12, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(4, 'Pizza', 'Food_Category_790.jpg', 'No', 'Yes'),
(5, 'Burger', 'Food_Category_344.jpg', 'No', 'Yes'),
(9, 'Biriyani', 'Food_Category_385.jpg', 'No', 'Yes'),
(10, 'Chinese', 'Food_Category_697.jpg', 'Yes', 'Yes'),
(11, 'Arabic', 'Food_Category_447.jpg', 'Yes', 'Yes'),
(12, 'Indian', 'Food_Category_333.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(4, 'Best Burger', 'Burger with Ham and lots of Cheese,onion and sauce', 250.00, 'Food-Name-6340.jpg', 5, 'No', 'Yes'),
(5, 'Smoky BBQ Pizza', 'Best Firewood Pizza in Town made with thin cheese', 525.00, 'Food-Name-8298.jpg', 4, 'No', 'Yes'),
(10, 'Chicken Biriyani', 'Richly flavored aromatic rice layered with marinated chicken ', 120.00, 'Food-Name-6512.jpg', 9, 'Yes', 'Yes'),
(11, 'Hyderabadi Veg Biryani', 'Mixed vegetables inside layers of fluffy basmati rice', 110.00, 'Food-Name-306.jpg', 9, 'No', 'Yes'),
(12, 'Thalaserry Beef Biryani', 'Unlike other biryani dishes thalassery biryani is unique', 170.00, 'Food-Name-7044.jpg', 9, 'No', 'Yes'),
(13, 'Mutton Biriyani', 'Succulent pieces of mutton slow cooked on bed of aromatic rice', 300.00, 'Food-Name-114.jpg', 9, 'No', 'Yes'),
(15, 'Mediterranean Pizza', 'Pizza sauce, mozzarella, pesto and fresh mozzarella.', 325.00, 'Food-Name-1876.jpg', 4, 'No', 'Yes'),
(16, 'Classic Paneer Pizza', 'Multigrain base, yumm paneer tikka with thin crust', 308.00, 'Food-Name-5931.jpg', 4, 'No', 'Yes'),
(17, 'Pepper Al Faham', 'Al Faham is basically the Arabian barbecued chicken usually grilled', 230.00, 'Food-Name-4667.jpg', 11, 'Yes', 'Yes'),
(18, 'Schezwan Chicken Fried Rice', 'Wholesome stir-fried rice topped with juicy chicken chunks ', 225.00, 'Food-Name-5970.jpg', 10, 'Yes', 'Yes'),
(19, 'Butter Chicken', 'Perfectly cooked tendered pieces of chicken with a rich tomato and onion ', 255.00, 'Food-Name-5958.jpg', 12, 'Yes', 'Yes'),
(20, 'Chilly Chicken', 'Chicken marinated with herbs with batter and gravy made with Chinese sauces', 235.00, 'Food-Name-2105.jpg', 10, 'Yes', 'Yes'),
(21, ' Kanthari Al Faham', 'Kanthari alfaham chicken is one of the most spicy version of chicken Alfaham ', 245.00, 'Food-Name-7380.jpg', 11, 'No', 'Yes'),
(23, 'Peri Peri Alfaham Mandhi', 'Spicy peri peri alfaham alongs with kuzhimandhi with salad mayonise', 240.00, 'Food-Name-9164.jpg', 11, 'No', 'Yes'),
(24, 'Kuzhi Mandhi', 'A flavor-packed combo with mandi chicken , mandi rice and dips ', 199.00, 'Food-Name-6628.jpg', 11, 'Yes', 'Yes'),
(26, 'Chicken Tikka Masala', 'Chicken tikka masala served as a portion goes best with rice,breads.\r\n\r\n', 280.00, 'Food-Name-3204.jpg', 12, 'No', 'Yes'),
(27, 'Kadai Paneer', 'Delicious Indian delicacy made of paneer, thick gravy of cream', 157.00, 'Food-Name-2376.jpg', 12, 'No', 'Yes'),
(28, 'Chicken Fried Rice', 'A deliciously hearty combo of wholesome chicken fried rice.', 215.00, 'Food-Name-9721.jpg', 12, 'No', 'Yes'),
(29, 'Chicken Noodles', 'Chicken noodles served for one person from hygeinic kitchen of 12 to 12.', 215.00, 'Food-Name-1771.jpg', 10, 'No', 'Yes'),
(30, 'Chilli Gobi', 'A deliciously aromatic dish with deep-fried cauliflower', 122.00, 'Food-Name-6250.jpg', 10, 'No', 'Yes'),
(31, 'McChicken Burger', 'Tender and juicy chicken patty cooked to perfection with mayonnaise', 131.00, 'Food-Name-7625.jpg', 5, 'No', 'Yes'),
(32, 'Tandoori Zinger Burger', 'Chicken zinger with a delicious tandoori sauce', 199.00, 'Food-Name-3025.jpg', 5, 'No', 'Yes'),
(33, 'Cheese Shawarma Burger', 'kahif special big chicken cheese made with a cheesy twist', 333.00, 'Food-Name-391.jpg', 5, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `u_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `u_id`) VALUES
(27, 'Chicken Noodles', 215.00, 4, 860.00, '2024-06-25 13:10:13', 'Delivered', 26),
(28, 'Mutton Biriyani', 300.00, 1, 300.00, '2024-06-25 13:14:21', 'Delivered', 26),
(29, 'Chicken Fried Rice', 215.00, 1, 215.00, '2024-06-25 13:45:42', 'Delivered', 25),
(30, 'Chicken Fried Rice', 215.00, 1, 215.00, '2024-06-25 13:46:43', 'On Delivery', 25),
(31, 'Chilly Chicken', 235.00, 2, 470.00, '2024-06-25 13:46:52', 'Cancelled', 25),
(32, 'Smoky BBQ Pizza', 525.00, 5, 2625.00, '2024-06-25 14:05:41', 'Ordered', 26),
(33, 'Pepper Al Faham', 230.00, 1, 230.00, '2024-06-25 14:23:17', 'Cancelled', 28),
(34, 'Butter Chicken', 255.00, 2, 510.00, '2024-06-26 08:43:25', 'Ordered', 25),
(35, 'Mutton Biriyani', 300.00, 1, 300.00, '2024-06-26 18:14:26', 'Ordered', 30),
(36, 'Classic Paneer Pizza', 308.00, 3, 924.00, '2024-06-26 20:26:19', 'Ordered', 31),
(37, 'Tandoori Zinger Burger', 199.00, 2, 398.00, '2024-06-27 09:41:59', 'Delivered', 33);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_contact` bigint NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `customer_name`, `customer_email`, `customer_contact`, `customer_address`, `created_at`) VALUES
(25, 'musaka', '$2y$10$zRzcbzN44epJ2ft44fKR0.Kup8Ux/rwoiDV2ZiRpHdHIgtGcEeoAG', 'bojan djurdjic', 'bojan_djurdjic@yahoo.com', 631804466, 'Balkanska 44', '2024-06-25 00:51:11'),
(26, 'banana', '$2y$10$DL2TQa9OKrdZrAkcR6gpuOFlAax9qvQsV2dOTpAErW9Cyhwa2c4D6', 'Banana Man', 'banana@yahoo.com', 36704554545, 'Banana Street 5', '2024-06-25 13:09:46'),
(27, 'Valentina ', '$2y$10$xAghHEWiWYZaDyqP1nMizuWYJpVzODl7D2BXq8KEAABelnFG8sH.i', 'K', 'keresztesvalentina01@gmail.com', 616004034, '         ', '2024-06-25 14:17:00'),
(28, 'Valentina', '$2y$10$XXXomM3p8HqDcGFL6rgNt.GNJArj9LRUrdA9of4HKwlcn6jD0m.6m', 'K', 'keresztesvalentina01@gmail.com', 616004034, '         ', '2024-06-25 14:20:47'),
(29, 'admin1', '$2y$10$ToQfIXu9JM2IJ1Nan7Z7fu7SQ/CO42o/noj8tDxfGhX36dpuajQZi', 'admin jedan', 'admin@admin.com', 368080606, 'root 1337', '2024-06-26 17:54:09'),
(30, 'admin2', '$2y$10$fPfZggh.iq/g9XX.8GbE8ucfBK0XKGRoN9wx.sTRLmqunidtjOq4S', 'admin dva', 'admin2@admin.com', 154545454, 'root 1331', '2024-06-26 18:08:06'),
(31, 'admin3', '$2y$10$.GGRHSVLwzyHlXzuTsV2AuOTN0Pjcqgo68msOAC7y6YYCxm7qhxBO', 'admin3', 'admin3@admin.com', 384418154, 'Root 13', '2024-06-26 18:25:33'),
(32, 'rammstein', '$2y$10$IIQTA4tgqlnggSx9/eLRaeD3wIZ7XkJSmB22b7/2H1Lb25CeoQWA2', 'rammstein rammstein', 'rammstein@rammstein.com', 3458648654, 'rammstein 1', '2024-06-26 20:39:45'),
(33, 'chole', '$2y$10$rfIFvtM32MECTIjvwoopBOLdpGupffB1lh9QNfRzqF86..buNxPbu', 'chole king', 'chole@chole.com', 3574845245, 'Subotica 54', '2024-06-27 09:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id` int NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `region` varchar(10) DEFAULT NULL,
  `regionName` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lon` float DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `isp` varchar(50) DEFAULT NULL,
  `org` varchar(50) DEFAULT NULL,
  `as_info` varchar(100) DEFAULT NULL,
  `device_type` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`id`, `ip_address`, `status`, `country`, `countryCode`, `region`, `regionName`, `city`, `zip`, `lat`, `lon`, `timezone`, `isp`, `org`, `as_info`, `device_type`, `timestamp`) VALUES
(1, '::1', 'fail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'desktop', '2024-06-24 23:33:08'),
(2, '::1', 'fail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'desktop', '2024-06-24 23:34:30'),
(3, '::1', 'fail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'desktop', '2024-06-24 23:37:37'),
(4, '::1', 'fail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'desktop', '2024-06-25 08:53:35'),
(6, '::1', 'fail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'desktop', '2024-06-25 08:57:59'),
(36, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 13:50:30'),
(37, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 13:51:30'),
(38, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 13:58:14'),
(39, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 13:58:47'),
(40, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 13:59:38'),
(41, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 13:59:53'),
(42, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:01:53'),
(43, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:02:22'),
(44, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:05:42'),
(45, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Mobile', '2024-06-25 14:10:20'),
(46, '173.252.127.19', 'success', 'United States', 'US', 'NC', 'North Carolina', 'Forest City', '28043', 35.3266, -81.8341, 'America/New_York', 'Facebook, Inc.', 'Facebook, Inc.', 'AS32934 Facebook, Inc.', 'Desktop', '2024-06-25 14:10:42'),
(47, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:11:30'),
(48, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:12:05'),
(49, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Mobile', '2024-06-25 14:13:09'),
(50, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Mobile', '2024-06-25 14:13:31'),
(51, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Mobile', '2024-06-25 14:14:04'),
(52, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Mobile', '2024-06-25 14:14:43'),
(53, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:15:32'),
(54, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:17:52'),
(55, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:20:01'),
(56, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:20:14'),
(57, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:22:40'),
(58, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:22:47'),
(59, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:23:05'),
(60, '77.243.19.109', 'success', 'Serbia', 'RS', '00', 'Belgrade', 'Belgrade', '', 44.8046, 20.4637, 'Europe/Belgrade', 'A1 Serbia', '', 'AS44143 A1 Srbija d.o.o', 'Mobile', '2024-06-25 14:23:17'),
(61, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:23:35'),
(62, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Mobile', '2024-06-25 14:26:45'),
(63, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:31:15'),
(64, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:31:28'),
(65, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:31:30'),
(66, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 14:31:31'),
(67, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 15:21:20'),
(68, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 15:31:52'),
(69, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 15:32:40'),
(70, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 15:32:52'),
(71, '79.101.120.4', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-25 15:33:32'),
(72, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:45:45'),
(73, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:46:00'),
(74, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:48:17'),
(75, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:48:55'),
(76, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:50:45'),
(77, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:50:50'),
(78, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:50:52'),
(79, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:52:19'),
(80, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:52:22'),
(81, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:56:20'),
(82, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 07:59:53'),
(83, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 08:03:43'),
(108, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 08:43:25'),
(109, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 08:50:17'),
(110, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 08:53:01'),
(111, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 08:54:50'),
(112, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:14:20'),
(113, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:15:33'),
(114, '34.203.79.108', 'success', 'United States', 'US', 'VA', 'Virginia', 'Ashburn', '20149', 39.0438, -77.4874, 'America/New_York', 'Amazon.com, Inc.', 'AWS EC2 (us-east-1)', 'AS14618 Amazon.com, Inc.', 'Desktop', '2024-06-26 17:18:04'),
(115, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:47:49'),
(116, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:48:09'),
(117, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:49:09'),
(118, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:49:13'),
(119, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:49:53'),
(120, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:52:07'),
(121, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:53:33'),
(122, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:56:47'),
(123, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:56:54'),
(124, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:56:56'),
(125, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:58:21'),
(126, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:58:36'),
(127, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:58:38'),
(128, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:59:41'),
(129, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 17:59:43'),
(134, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 18:02:14'),
(151, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 18:24:50'),
(152, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 18:27:40'),
(153, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 18:33:38'),
(154, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 18:34:03'),
(155, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 18:34:05'),
(169, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 20:26:20'),
(170, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 20:33:18'),
(173, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 20:39:49'),
(174, '35.153.150.41', 'success', 'United States', 'US', 'VA', 'Virginia', 'Ashburn', '20149', 39.0438, -77.4874, 'America/New_York', 'Amazon Technologies Inc.', 'AWS EC2 (us-east-1)', 'AS14618 Amazon.com, Inc.', 'Desktop', '2024-06-26 21:35:09'),
(175, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 21:41:00'),
(176, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 21:42:24'),
(177, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 21:42:51'),
(178, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 21:42:54'),
(179, '79.101.120.27', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-26 21:43:51'),
(180, '79.101.120.96', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-27 09:41:01'),
(181, '79.101.120.96', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-27 09:41:47'),
(182, '79.101.120.96', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-27 09:42:00'),
(183, '79.101.120.96', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-27 09:47:26'),
(184, '79.101.120.117', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-29 07:10:13'),
(185, '79.101.120.117', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-29 07:10:40'),
(186, '79.101.120.117', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-29 07:13:43'),
(187, '79.101.120.117', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-06-29 10:49:52'),
(188, '79.101.120.40', 'success', 'Serbia', 'RS', 'VO', 'Vojvodina', 'Sremska Mitrovica', '', 44.9837, 19.6146, 'Europe/Belgrade', 'TELEKOM-SRBIJA', '', 'AS8400 TELEKOM SRBIJA a.d.', 'Desktop', '2024-07-01 09:18:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  ADD PRIMARY KEY (`scope`);

--
-- Indexes for table `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
