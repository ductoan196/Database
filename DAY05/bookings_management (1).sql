-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 28, 2023 lúc 10:23 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookings_management`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `total_price`, `status`, `check_in`, `check_out`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '500.00', 'confirmed', '2023-04-15', '2023-04-20', '2023-03-28 07:37:04', '2023-03-28 07:37:04', NULL),
(2, 2, '1000.00', 'pending', '2023-05-10', '2023-05-15', '2023-03-28 07:37:04', '2023-03-28 07:37:04', NULL),
(3, 3, '750.00', 'confirmed', '2023-06-20', '2023-06-25', '2023-03-28 07:37:04', '2023-03-28 07:37:04', NULL),
(4, 4, '1200.00', 'canceled', '2023-07-01', '2023-07-06', '2023-03-28 07:37:04', '2023-03-28 07:37:04', NULL),
(5, 5, '800.00', 'confirmed', '2023-08-10', '2023-08-15', '2023-03-28 07:37:04', '2023-03-28 07:37:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_details`
--

CREATE TABLE `booking_details` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_details`
--

INSERT INTO `booking_details` (`id`, `booking_id`, `room_id`, `menu_id`, `total_price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '500000.00', '2023-03-28 07:41:21', '2023-03-28 07:41:42', NULL),
(2, 2, 2, 2, '1000000.00', '2023-03-28 07:41:21', '2023-03-28 07:42:28', NULL),
(3, 3, 3, 3, '750000.00', '2023-03-28 07:41:21', '2023-03-28 07:42:28', NULL),
(4, 5, 5, 5, '1200000.00', '2023-03-28 07:41:21', '2023-03-28 07:42:28', NULL),
(5, 5, 5, 4, '800000.00', '2023-03-28 07:41:21', '2023-03-28 07:42:28', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`, `phone`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dịch Vọng Hậu', '16 Dịch Vọng Hậu, Cầu Giấy, Hà Nội', '000000000', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(2, 'Hoàng Quốc Việt', '135 Hoàng Quốc Việt, Cầu Giấy, Hà Nội', '092353531', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(3, 'Hai Bà Trưng', '12 Hai Bà Trưng, Hoàn Kiếm, HN', '0383538329', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(4, 'Hà Đông', '163 Quang Trung, Hà Đông, HN', '0358365836', 'close', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(5, 'Cầu Diễn', '102 Cầu Diễn, Bắc Từ Liêm, HN', '098353353', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(6, 'Nhổn', 'Số 2 phố Nhồn, Đại học công nghiệp', '0903535232', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(7, 'Lê Văn Lương', 'tòa Golden Palm số 12 Lê Văn Lương, Thanh Xuân, HN', '032623834', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(8, 'Minh Khai', '240 Minh khai, Hai Bà trưng, HN', '0925928353', 'close', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(9, 'Hoàng Mai', 'Tòa CT1 Linh Đàm, Hoàng Mai, HN', '0392835324', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL),
(10, 'Trần Thái Tông', 'Số 1 Trần Thái Tông, Cầu Giấy, HN', '0983572834', 'open', '2023-03-28 04:22:17', '2023-03-28 04:22:17', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'TRADITIONAL', 'Món ăn truyền thống Việt Nam', '1000000.00', '2023-03-28 07:11:56', '2023-03-28 07:11:56', NULL),
(2, 'THAIFOOD', 'Món ăn phong cách Thái Lan', '800000.00', '2023-03-28 07:11:56', '2023-03-28 07:11:56', NULL),
(3, 'CHINAFOOD', 'Món ăn phong cách Trung Quốc', '900000.00', '2023-03-28 07:11:56', '2023-03-28 07:11:56', NULL),
(4, 'EUFOOD', 'Món ăn phong cách Châu Âu', '1500000.00', '2023-03-28 07:11:56', '2023-03-28 07:11:56', NULL),
(5, 'INDIAN', 'Món ăn phong cách Ấn Độ', '1200000.00', '2023-03-28 07:13:56', '2023-03-28 07:13:56', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sự kiện khai trương', 'Khách sạn chúng tôi rất vui mừng được đón tiếp các sự kiện của quý khách tại cơ sở mới 13 Dịch Vọng Hậu, Cầu Giấy, Hà Nội. Với trang thiết bị hiện đại và đội ngũ nhân viên chuyên nghiệp, chúng tôi sẽ mang đến cho quý khách những trải nghiệm tuyệt vời.', '2023-03-28 07:32:30', '2023-03-28 07:32:30', NULL),
(2, 'Khuyến mãi rực rỡ chào xuân', 'Chào mừng mùa hè, khách sạn của chúng tôi đang có chương trình khuyến mãi đặc biệt dành cho các phòng đơn. Quý khách hàng sẽ được giảm giá 30% cho mỗi đêm nghỉ tại khách sạn. Hãy nhanh chân đặt phòng để không bỏ lỡ cơ hội tuyệt vời này!', '2023-03-28 07:32:30', '2023-03-28 07:32:30', NULL),
(3, 'Thông báo nghỉ lễ', 'Khách sạn chúng tôi thông báo nghỉ lễ 30/4, 1/5 như sau: Khách sạn sẽ tạm ngừng cung cấp dịch vụ trong thời gian từ ngày 30/4/2023 đến ngày 2/5/2023. Trân trọng', '2023-03-28 07:32:30', '2023-03-28 07:32:30', NULL),
(4, 'Tuyển dụng nhân viên fulltime', 'Khách sạn chúng tôi cần tuyển một nhân viên chính thức fulltime làm việc tại cơ sở Dịch Vọng Hậu với mức lương hấp dẫn từ 15tr- 20tr/tháng. Ai có nhu cầu xin vui lòng liên hệ: toandeptrai@gmai.com. Trân trọng', '2023-03-28 07:32:30', '2023-03-28 07:32:30', NULL),
(5, 'Tặng quà tri ân', 'Chúng tôi xin gửi món quà trị giá 1tr đồng cho tất cả các khách hàng thân thiết của chúng tôi khi thanh toán hóa đơn trên 10tr trong ngày 28/3/2023', '2023-03-28 07:32:30', '2023-03-28 07:32:30', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `location_id`, `description`, `price`, `capacity`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Grand Ballroom', 1, 'Phòng sự kiện có diện tích lớn, phù hợp cho các sự kiện lớn như đám cưới, liên hoan, hội nghị,...', '5000000.00', 100, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(2, 'Sapphire Conference Room', 2, 'Phòng sự kiện trang trí đẹp mắt, phù hợp cho các sự kiện như sinh nhật, kỷ niệm, họp nhóm,...', '3000000.00', 50, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(3, 'Diamond Hall', 3, 'Phòng sự kiện với thiết kế hiện đại, có âm thanh, ánh sáng chất lượng, phù hợp cho các sự kiện âm nhạc, biểu diễn, ...', '7000000.00', 150, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(4, 'Topaz Boardroom', 4, 'Phòng sự kiện được trang bị đầy đủ thiết bị âm thanh, ánh sáng, phù hợp cho các sự kiện như đại hội, hội thảo, triển lãm, ...', '8000000.00', 200, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(5, 'Emerald Terrace', 5, 'Phòng sự kiện trang trí đơn giản nhưng tinh tế, phù hợp cho các buổi tiệc gia đình, họp nhóm, gặp gỡ bạn bè,...', '1500000.00', 30, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(6, 'Ruby Meeting Room', 1, 'Phòng sự kiện tối đa hóa việc sử dụng ánh sáng, phù hợp cho các sự kiện âm nhạc, vũ đạo, ...', '6000000.00', 120, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(7, 'Opal Banquet Room', 2, 'Phòng sự kiện với không gian mở rộng, phù hợp cho các sự kiện tiệc nướng, sinh nhật ngoài trời, ...', '4000000.00', 70, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(8, 'Jade Lounge', 3, 'Phòng sự kiện với không gian nhỏ xinh, phù hợp cho các sự kiện như tốt nghiệp, lễ khai trương, ...', '2000000.00', 20, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(9, 'Amethyst Salon', 4, 'Phòng sự kiện được trang bị đầy đủ thiết bị phục vụ cho các buổi họp, hội thảo, phù hợp với các doanh nghiệp.', '5000000.00', 80, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL),
(10, 'Pearl Function Room', 5, 'Phòng sự kiện được thiết kế sang trọng, phù hợp cho các sự kiện cao cấp như tiệc cưới, khai trương, ...', '10000000.00', 300, 'Available', '2023-03-28 04:04:35', '2023-03-28 04:04:35', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Đức Toàn', 'johndoe@example.com', 'password123', 'active', '2023-03-28 04:10:12', '2023-03-28 04:10:12', NULL),
(2, 'Tài Đào', 'janedoe@example.com', 'password456', 'active', '2023-03-28 04:10:12', '2023-03-28 04:10:12', NULL),
(3, 'Xuân Anh', 'marksmith@example.com', 'password789', 'inactive', '2023-03-28 04:10:12', '2023-03-28 04:10:12', NULL),
(4, 'Thành Long', 'sarajohnson@example.com', 'password10', 'active', '2023-03-28 04:10:12', '2023-03-28 04:10:12', NULL),
(5, 'Bình Trọng', 'peterwilliams@example.com', 'password11', 'active', '2023-03-28 04:10:12', '2023-03-28 04:10:12', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`id`, `code`, `description`, `discount`, `menu_id`, `room_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SPRING10', 'Giảm 10% cho đơn hàng trên 500,000đ', '0.00', NULL, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(2, 'SUMMER20', 'Giảm 20% cho đơn hàng trên 1,000,000đ', '0.00', NULL, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(3, 'FALL30', 'Giảm 30% cho đơn hàng trên 1,500,000đ', '0.00', NULL, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(4, 'WINTER40', 'Giảm 40% cho đơn hàng trên 2,000,000đ', '0.00', NULL, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(5, 'MEMBER50', 'Giảm 50% cho thành viên VIP', '0.00', NULL, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(6, 'ROOM10', 'Giảm 10% cho đặt phòng', '0.00', NULL, 1, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(7, 'ROOM20', 'Giảm 20% cho đặt phòng trên 5 ngày', '0.00', NULL, 2, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(8, 'MENU5', 'Giảm 5% cho đặt bàn trên 2 người', '0.00', 1, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(9, 'MENU10', 'Giảm 10% cho đặt bàn trên 4 người', '0.00', 2, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL),
(10, 'FIRSTTIME', 'Giảm 20% cho khách hàng đặt lần đầu', '0.00', NULL, NULL, '2023-03-28 05:52:37', '2023-03-28 05:52:37', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bookings_users` (`user_id`);

--
-- Chỉ mục cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_details_bookings` (`booking_id`);

--
-- Chỉ mục cho bảng `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rooms_locations` (`location_id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_services_rooms` (`room_id`),
  ADD KEY `fk_services_menus` (`menu_id`),
  ADD KEY `fk_services_news` (`news_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vouchers_rooms` (`room_id`),
  ADD KEY `fk_vouchers_menus` (`menu_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_bookings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `fk_booking_details_bookings` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Các ràng buộc cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_rooms_locations` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Các ràng buộc cho bảng `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `fk_services_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `fk_services_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Các ràng buộc cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `fk_vouchers_menus` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `fk_vouchers_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
