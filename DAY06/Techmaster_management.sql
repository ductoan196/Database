CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `class_id` varchar(255),
  `subject_id` varchar(255),
  `role` enum,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `class_id` varchar(255),
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `subject_id` varchar(255),
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher_id` varchar(255) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `is_present` TINYINT(1) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `lectures` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `homeworks` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

CREATE TABLE `homework_scores` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `updated_at` timestamp NOT NULL DEFAULT (current_timestamp()),
  `deleted_at` timestamp DEFAULT NULL
);

ALTER TABLE `classes` ADD FOREIGN KEY (`id`) REFERENCES `users` (`class_id`);

ALTER TABLE `subjects` ADD FOREIGN KEY (`id`) REFERENCES `users` (`subject_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `students` (`user_id`);

ALTER TABLE `classes` ADD FOREIGN KEY (`id`) REFERENCES `students` (`class_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `teachers` (`user_id`);

ALTER TABLE `subjects` ADD FOREIGN KEY (`id`) REFERENCES `teachers` (`subject_id`);

ALTER TABLE `teachers` ADD FOREIGN KEY (`id`) REFERENCES `subjects` (`teacher_id`);

ALTER TABLE `classes` ADD FOREIGN KEY (`id`) REFERENCES `subjects` (`class_id`);

ALTER TABLE `subjects` ADD FOREIGN KEY (`id`) REFERENCES `lessons` (`subject_id`);

ALTER TABLE `lessons` ADD FOREIGN KEY (`id`) REFERENCES `attendances` (`lesson_id`);

ALTER TABLE `teachers` ADD FOREIGN KEY (`id`) REFERENCES `attendances` (`teacher_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`id`) REFERENCES `attendances` (`student_id`);

ALTER TABLE `teachers` ADD FOREIGN KEY (`id`) REFERENCES `lectures` (`teacher_id`);

ALTER TABLE `lessons` ADD FOREIGN KEY (`id`) REFERENCES `lectures` (`lesson_id`);

ALTER TABLE `lessons` ADD FOREIGN KEY (`id`) REFERENCES `homeworks` (`lesson_id`);

ALTER TABLE `teachers` ADD FOREIGN KEY (`id`) REFERENCES `homeworks` (`teacher_id`);

ALTER TABLE `lessons` ADD FOREIGN KEY (`id`) REFERENCES `homework_scores` (`student_id`);

ALTER TABLE `homeworks` ADD FOREIGN KEY (`id`) REFERENCES `homework_scores` (`homework_id`);
