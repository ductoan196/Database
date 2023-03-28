CREATE TABLE `rooms` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `location_id` int(11),
  `description` text,
  `price` decimal,
  `capacity` int(11),
  `status` varchar(255),
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `users` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `status` varchar(255),
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `bookings` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11),
  `total_price` decimal,
  `status` varchar(255),
  `check_in` date,
  `check_out` date,
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `bookings_detail` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `booking_id` int(11),
  `room_id` int(11),
  `menu_id` int(11),
  `total_price` decimal,
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `locations` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `address` varchar(255),
  `phone` varchar(255),
  `status` varchar(255),
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `services` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `menu_id` int(11),
  `room_id` int(11),
  `news_id` int(11),
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `menus` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `price` decimal,
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `vouchers` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `code` varchar(255),
  `room_id` int(11),
  `menu_id` int(11),
  `desctiption` text,
  `discount` int(11),
  `status` varchar(255),
  `start_at` timestamp,
  `end_at` timestamp
);

CREATE TABLE `news` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `title` text,
  `desctiption` text,
  `post_at` date,
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

CREATE TABLE `pricing` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `price` decimal,
  `room_id` int(11),
  `menu_id` int(11),
  `creat_at` timestamp,
  `update_at` timestamp,
  `delete_at` timestamp
);

ALTER TABLE `rooms` ADD FOREIGN KEY (`id`) REFERENCES `bookings_detail` (`room_id`);

ALTER TABLE `menus` ADD FOREIGN KEY (`id`) REFERENCES `bookings_detail` (`menu_id`);

ALTER TABLE `rooms` ADD FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

ALTER TABLE `services` ADD FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

ALTER TABLE `services` ADD FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

ALTER TABLE `services` ADD FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`id`) REFERENCES `bookings_detail` (`booking_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `vouchers` ADD FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

ALTER TABLE `vouchers` ADD FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

ALTER TABLE `pricing` ADD FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

ALTER TABLE `pricing` ADD FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`total_price`) REFERENCES `bookings_detail` (`total_price`);
