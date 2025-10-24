-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2025 at 10:17 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `equipment_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowing`
--

CREATE TABLE `borrowing` (
  `borrow_id` int(11) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `borrow_date` datetime NOT NULL,
  `expected_return_date` datetime NOT NULL,
  `actual_return_date` datetime DEFAULT NULL,
  `return_request_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `status` enum('borrowed','pending_return','returned','overdue') COLLATE utf8mb4_unicode_ci DEFAULT 'borrowed',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_on_return` enum('good','damaged','need_repair') COLLATE utf8mb4_unicode_ci DEFAULT 'good',
  `approved_by` int(11) DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borrowing`
--

INSERT INTO `borrowing` (`borrow_id`, `equipment_id`, `user_id`, `borrow_date`, `expected_return_date`, `actual_return_date`, `return_request_date`, `quantity`, `status`, `notes`, `return_notes`, `condition_on_return`, `approved_by`, `checked_by`, `created_at`) VALUES
(1, 1, 3, '2025-10-17 06:58:12', '2025-10-19 23:59:59', '2025-10-17 07:00:54', '2025-10-17 06:58:19', 1, 'returned', '', '', 'good', NULL, 2, '2025-10-17 04:58:12'),
(2, 1, 2, '2025-10-17 07:00:24', '2025-10-18 23:59:59', '2025-10-17 07:01:12', '2025-10-17 07:01:06', 1, 'returned', '', '', 'need_repair', NULL, 2, '2025-10-17 05:00:24'),
(3, 1, 2, '2025-10-17 07:00:39', '2025-10-18 23:59:59', '2025-10-17 07:15:48', '2025-10-17 07:03:09', 1, 'returned', '', '', 'need_repair', NULL, 1, '2025-10-17 05:00:39'),
(4, 1, 1, '2025-10-17 07:12:46', '2025-10-18 23:59:59', NULL, NULL, 1, 'borrowed', '', NULL, 'good', NULL, NULL, '2025-10-17 05:12:46'),
(5, 2, 3, '2025-10-17 07:18:21', '2025-10-25 23:59:59', '2025-10-17 07:44:58', '2025-10-17 07:44:26', 1, 'returned', '', '', 'damaged', NULL, 2, '2025-10-17 05:18:21'),
(6, 2, 3, '2025-10-17 07:50:14', '2025-10-18 23:59:59', '2025-10-17 07:51:07', '2025-10-17 07:50:43', 1, 'returned', '', '', 'need_repair', NULL, 1, '2025-10-17 05:50:14'),
(7, 1, 3, '2025-10-17 07:54:28', '2025-10-18 23:59:59', '2025-10-17 08:31:12', '2025-10-17 07:54:40', 1, 'returned', '', '', 'good', NULL, 1, '2025-10-17 05:54:28'),
(8, 18, 1, '2025-10-17 07:56:33', '2025-10-18 23:59:59', NULL, NULL, 1, 'borrowed', '', NULL, 'good', NULL, NULL, '2025-10-17 05:56:33'),
(9, 1, 1, '2025-10-17 08:31:32', '2025-10-25 23:59:59', NULL, NULL, 1, 'borrowed', '', NULL, 'good', NULL, NULL, '2025-10-17 06:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `equipment_id` int(11) NOT NULL,
  `equipment_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `equipment_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `available_quantity` int(11) DEFAULT 1,
  `status` enum('available','borrowed','maintenance','damaged') COLLATE utf8mb4_unicode_ci DEFAULT 'available',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`equipment_id`, `equipment_code`, `equipment_name`, `type_id`, `brand`, `model`, `quantity`, `available_quantity`, `status`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'NB001', 'Computer Notebook', 2, '', '', 5, 4, 'maintenance', '', 'uploads/equipments/68f1f832a8003.jpg', '2025-10-17 04:20:06', '2025-10-17 08:02:58'),
(2, 'ARM001', 'Robotic Arm', 3, 'Hiwonder', 'AiArm', 2, 2, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 05:51:07'),
(3, 'LIMO001', 'Mobile Robot', 4, 'AGILE X', 'Limo', 1, 1, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(4, 'SORT001', 'Autonomous AI Sorting System', 5, 'Hiwonder', 'Autonomous Al Sorting System', 1, 1, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(5, 'GRAV001', 'Electronics Board', 6, 'Gravitech', '', 3, 3, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(6, 'DISP001', 'Display 75 inches', 7, 'PULIN', '75 inches', 1, 1, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(7, 'CROW001', 'Crow Pi 2', 6, 'Elecrow', 'Crow Pi 2', 2, 2, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(8, 'SPEAK001', 'Speaker System', 8, 'Behringer', 'MPA40BT-PRO', 2, 2, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(9, 'ENC001', 'Enclosure SATA', 9, '', 'Nvem-SATA', 5, 5, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(10, 'ENC002', 'Enclosure M.2', 9, 'ORICO', 'TCM2-10G-C3-BP-HW Blue', 3, 3, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(11, 'HDMI001', 'Cable HDMI 5M', 10, 'UGREEN', 'V.1.4 M/M 5M', 10, 10, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(12, 'HDMI002', 'Cable HDMI 10M', 10, 'UGREEN', 'V.1.4 M/M 10M', 5, 5, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(13, 'PLUG001', 'ปลั๊กแยก 4 ทาง', 11, '', 'หัวเทียบทองเหลือง', 8, 8, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(14, 'PLUG002', 'ปลั๊กไฟ 5 เมตร', 11, '', '', 10, 10, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(15, 'IKON001', 'อุปกรณ์อิเล็กทรอนิกส์', 6, 'IKON', '2931', 2, 2, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(16, 'AMP001', 'เครื่องขยายเสียง', 8, '', '', 3, 3, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(17, 'NET001', 'Network Equipment', 12, '', '', 5, 5, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(18, 'IOT001', 'IOT Device', 13, '', '', 4, 3, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 05:56:33'),
(19, 'CAM001', 'กล้อง', 14, '', '', 3, 3, 'available', NULL, NULL, '2025-10-17 04:20:06', '2025-10-17 04:20:06'),
(20, 'NF101', 'กล้วย', 5, 'adf', 'dsfaf', 5, 4, 'available', '', 'uploads/equipments/68f1fa7fbc1f7.jpg', '2025-10-17 06:39:00', '2025-10-17 08:12:47'),
(21, 'N011', 'dsfdf', 2, 'asdf', 'dasf', 4, 4, 'available', 'sdafasdf', 'uploads/equipments/68f1fa777406d.jpg', '2025-10-17 08:12:39', '2025-10-17 08:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_types`
--

CREATE TABLE `equipment_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment_types`
--

INSERT INTO `equipment_types` (`type_id`, `type_name`, `description`, `created_at`) VALUES
(1, 'ทุกประเภท', 'อุปกรณ์ทั่วไป', '2025-10-17 04:20:06'),
(2, 'Computer Notebook', 'เครื่องคอมพิวเตอร์โน้ตบุ๊ค', '2025-10-17 04:20:06'),
(3, 'Robotic Arm', 'แขนกลหุ่นยนต์', '2025-10-17 04:20:06'),
(4, 'Mobile Robot', 'หุ่นยนต์เคลื่อนที่', '2025-10-17 04:20:06'),
(5, 'AI System', 'ระบบปัญญาประดิษฐ์', '2025-10-17 04:20:06'),
(6, 'Electronics', 'อุปกรณ์อิเล็กทรอนิกส์', '2025-10-17 04:20:06'),
(7, 'Display', 'อุปกรณ์แสดงผล', '2025-10-17 04:20:06'),
(8, 'Audio', 'อุปกรณ์เสียง', '2025-10-17 04:20:06'),
(9, 'Storage', 'อุปกรณ์จัดเก็บข้อมูล', '2025-10-17 04:20:06'),
(10, 'Cable', 'สายเคเบิล', '2025-10-17 04:20:06'),
(11, 'Power', 'อุปกรณ์ไฟฟ้า', '2025-10-17 04:20:06'),
(12, 'Network', 'อุปกรณ์เครือข่าย', '2025-10-17 04:20:06'),
(13, 'IOT', 'อุปกรณ์ IOT', '2025-10-17 04:20:06'),
(14, 'Camera', 'กล้อง', '2025-10-17 04:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `material_id` int(11) NOT NULL,
  `material_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `min_quantity` int(11) DEFAULT 10,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_url` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_id`, `material_code`, `material_name`, `type_id`, `unit`, `quantity`, `min_quantity`, `description`, `created_at`, `updated_at`, `image_url`) VALUES
(1, 'N001', 'กล้วย1', 5, 'ชิ้น', 29, 1, '0', '2025-10-17 06:18:40', '2025-10-17 07:42:00', 'uploads/materials/68f1f34846016.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `material_requisition`
--

CREATE TABLE `material_requisition` (
  `requisition_id` int(11) NOT NULL,
  `material_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `requisition_date` datetime NOT NULL,
  `status` enum('pending','approved','rejected','completed') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `purpose` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_requisition`
--

INSERT INTO `material_requisition` (`requisition_id`, `material_id`, `user_id`, `quantity`, `requisition_date`, `status`, `purpose`, `approved_by`, `notes`, `created_at`) VALUES
(1, 1, 1, 2, '2025-10-17 08:19:26', 'rejected', 'กิน', 1, NULL, '2025-10-17 06:19:26'),
(2, 1, 1, 1, '2025-10-17 08:26:50', 'approved', 'eat', 1, NULL, '2025-10-17 06:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','staff','user') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `phone`, `role`, `created_at`) VALUES
(1, 'admin', 'admin', 'ผู้ดูแลระบบ', 'admin@system.com', NULL, 'admin', '2025-10-17 04:20:06'),
(2, 'staff', 'staff', 'เจ้าหน้าที่', 'staff@system.com', NULL, 'staff', '2025-10-17 04:20:06'),
(3, 'user1', 'user1', 'นายภาณุวัฒน์  โออ่อน', 'panuwataoon@gmail.com', '091266626', 'user', '2025-10-17 04:47:53'),
(5, 'wuttichai', '', 'kk', 'kk@gmail.com', '0123456789', 'user', '2025-10-17 06:13:18'),
(8, 'wuttichai1', '$2y$10$MpKKCJQ2EZy95JyA8mXtDOP1XRNRRpE56JjOvRFQRvXRd9Y8lGO0G', '่าา', 'N@gmail.com', '01234654123', 'user', '2025-10-17 06:17:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `checked_by` (`checked_by`);

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`equipment_id`),
  ADD UNIQUE KEY `equipment_code` (`equipment_code`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `equipment_types`
--
ALTER TABLE `equipment_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`material_id`),
  ADD UNIQUE KEY `material_code` (`material_code`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `material_requisition`
--
ALTER TABLE `material_requisition`
  ADD PRIMARY KEY (`requisition_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowing`
--
ALTER TABLE `borrowing`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `equipment_types`
--
ALTER TABLE `equipment_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `material_requisition`
--
ALTER TABLE `material_requisition`
  MODIFY `requisition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`equipment_id`),
  ADD CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `borrowing_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `borrowing_ibfk_4` FOREIGN KEY (`checked_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `equipments`
--
ALTER TABLE `equipments`
  ADD CONSTRAINT `equipments_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `equipment_types` (`type_id`);

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `equipment_types` (`type_id`);

--
-- Constraints for table `material_requisition`
--
ALTER TABLE `material_requisition`
  ADD CONSTRAINT `material_requisition_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `materials` (`material_id`),
  ADD CONSTRAINT `material_requisition_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `material_requisition_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
