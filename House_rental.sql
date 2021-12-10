-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2021 at 05:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accommodation_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `adverts_advert`
--

CREATE TABLE `adverts_advert` (
  `id` bigint(20) NOT NULL,
  `rent` double NOT NULL,
  `area` varchar(30) NOT NULL,
  `bond_year` varchar(10) NOT NULL,
  `bond_amount` double NOT NULL,
  `other_charges` double NOT NULL,
  `address` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` varchar(100) NOT NULL,
  `manager_id` bigint(20) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adverts_advert`
--

INSERT INTO `adverts_advert` (`id`, `rent`, `area`, `bond_year`, `bond_amount`, `other_charges`, `address`, `description`, `image`, `manager_id`, `active`) VALUES
(8, 1000, 'Bronx', '2021', 1000, 200, '503 North Carolina', 'This is the best cube in the building.', 'media/h1_aH2kada.jpg', 3, 1),
(9, 299, 'London', '2', 2000, 100, '503 West London', 'This is a fully furnished cube.', 'media/h1_Q2Q0D2G.jpg', 3, 1),
(10, 5505, 'Milwakee', '5', 2000, 500, '102 Milwakee', 'This is a furnished hostel.', 'media/h4_o2HM5OO.jpg', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add landlord', 7, 'add_landlord'),
(26, 'Can change landlord', 7, 'change_landlord'),
(27, 'Can delete landlord', 7, 'delete_landlord'),
(28, 'Can view landlord', 7, 'view_landlord'),
(29, 'Can add student', 8, 'add_student'),
(30, 'Can change student', 8, 'change_student'),
(31, 'Can delete student', 8, 'delete_student'),
(32, 'Can view student', 8, 'view_student'),
(33, 'Can add advert', 9, 'add_advert'),
(34, 'Can change advert', 9, 'change_advert'),
(35, 'Can delete advert', 9, 'delete_advert'),
(36, 'Can view advert', 9, 'view_advert'),
(37, 'Can add chat', 10, 'add_chat'),
(38, 'Can change chat', 10, 'change_chat'),
(39, 'Can delete chat', 10, 'delete_chat'),
(40, 'Can view chat', 10, 'view_chat'),
(41, 'Can add answer', 11, 'add_answer'),
(42, 'Can change answer', 11, 'change_answer'),
(43, 'Can delete answer', 11, 'delete_answer'),
(44, 'Can view answer', 11, 'view_answer'),
(45, 'Can add question', 12, 'add_question'),
(46, 'Can change question', 12, 'change_question'),
(47, 'Can delete question', 12, 'delete_question'),
(48, 'Can view question', 12, 'view_question'),
(49, 'Can add moderator', 13, 'add_moderator'),
(50, 'Can change moderator', 13, 'change_moderator'),
(51, 'Can delete moderator', 13, 'delete_moderator'),
(52, 'Can view moderator', 13, 'view_moderator'),
(53, 'Can add book', 14, 'add_book'),
(54, 'Can change book', 14, 'change_book'),
(55, 'Can delete book', 14, 'delete_book'),
(56, 'Can view book', 14, 'view_book');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book_visit_book`
--

CREATE TABLE `book_visit_book` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `advert_id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_visit_book`
--

INSERT INTO `book_visit_book` (`id`, `date`, `advert_id`, `email`) VALUES
(1, '2021-04-28', 8, 'user1@gmail.com'),
(2, '2021-04-28', 8, 'user1@gmail.com'),
(3, '2021-04-28', 8, 'user1@gmail.com'),
(4, '2021-04-28', 8, 'user1@gmail.com'),
(5, '2021-04-28', 9, 'user1@gmail.com'),
(6, '2021-04-28', 8, 'user1@gmail.com'),
(7, '2021-04-28', 8, 'user1@gmail.com'),
(8, '2021-04-28', 8, 'user1@gmail.com'),
(9, '2021-04-28', 8, 'user1@gmail.com'),
(10, '2021-04-28', 9, 'user1@gmail.com'),
(11, '2021-04-28', 8, 'user1@gmail.com'),
(12, '2021-04-28', 9, 'user1@gmail.com'),
(13, '2021-04-28', 9, 'user1@gmail.com'),
(14, '2021-04-28', 8, 'user1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `chat_answer`
--

CREATE TABLE `chat_answer` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(500) NOT NULL,
  `query_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_answer`
--

INSERT INTO `chat_answer` (`id`, `answer`, `query_id`) VALUES
(3, 'more like 30days', 24),
(4, 'Yes that would depend how much you would like to throw in.', 25),
(5, 'Take a bus from the Michigan rail station.', 49),
(6, 'We have a fenced perimeter wall.', 50);

-- --------------------------------------------------------

--
-- Table structure for table `chat_question`
--

CREATE TABLE `chat_question` (
  `id` bigint(20) NOT NULL,
  `question` varchar(500) NOT NULL,
  `advert_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_question`
--

INSERT INTO `chat_question` (`id`, `question`, `advert_id`) VALUES
(24, 'How long is the processing of the ownership docs?', 8),
(25, 'Is it possible to have the place by tomorrow?', 8),
(47, 'Hello, is possible for two?', 8),
(49, 'How can I get there?', 9),
(50, 'How secure is the building?', 8);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'adverts', 'advert'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(14, 'book_visit', 'book'),
(11, 'chat', 'answer'),
(10, 'chat', 'chat'),
(12, 'chat', 'question'),
(5, 'contenttypes', 'contenttype'),
(7, 'login', 'landlord'),
(13, 'login', 'moderator'),
(8, 'login', 'student'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-24 08:57:59.491353'),
(2, 'auth', '0001_initial', '2021-04-24 08:58:07.694033'),
(3, 'admin', '0001_initial', '2021-04-24 08:58:09.581399'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-04-24 08:58:09.625264'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-24 08:58:09.658438'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-04-24 08:58:11.301904'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-04-24 08:58:12.148121'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-04-24 08:58:12.246790'),
(9, 'auth', '0004_alter_user_username_opts', '2021-04-24 08:58:12.272266'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-04-24 08:58:12.717107'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-04-24 08:58:12.752746'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-04-24 08:58:12.795715'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-04-24 08:58:12.871330'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-04-24 08:58:12.977600'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-04-24 08:58:13.091894'),
(16, 'auth', '0011_update_proxy_permissions', '2021-04-24 08:58:13.145503'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-04-24 08:58:13.286581'),
(18, 'sessions', '0001_initial', '2021-04-24 08:58:13.766480'),
(19, 'login', '0001_initial', '2021-04-24 16:33:14.453901'),
(20, 'adverts', '0001_initial', '2021-04-27 09:16:42.189218'),
(21, 'adverts', '0002_alter_advert_address', '2021-04-27 12:51:20.202154'),
(22, 'chat', '0001_initial', '2021-04-27 12:51:20.578231'),
(23, 'chat', '0002_auto_20210427_1606', '2021-04-27 13:06:23.132653'),
(24, 'chat', '0003_auto_20210427_1659', '2021-04-27 13:59:26.469258'),
(25, 'chat', '0004_delete_answer', '2021-04-27 16:24:49.138551'),
(26, 'chat', '0005_answer', '2021-04-27 16:25:51.857918'),
(27, 'chat', '0006_rename_advert_answer_query', '2021-04-27 16:27:12.143026'),
(28, 'adverts', '0003_advert_active', '2021-04-27 20:51:32.410779'),
(29, 'adverts', '0004_alter_advert_active', '2021-04-27 20:57:52.349776'),
(30, 'adverts', '0005_remove_advert_active', '2021-04-27 20:59:38.942762'),
(31, 'adverts', '0006_advert_active', '2021-04-27 21:00:14.123279'),
(32, 'login', '0002_moderator', '2021-04-28 08:30:40.694119'),
(33, 'book_visit', '0001_initial', '2021-04-28 13:30:28.267606'),
(34, 'book_visit', '0002_alter_book_date', '2021-04-28 13:31:26.662188'),
(35, 'book_visit', '0003_auto_20210428_1641', '2021-04-28 13:41:44.745111');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('i3jq90x17ayyy6sz2ubbqalwtnkqc7ve', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInR5cGUiOiJtb2RlcmF0b3IiLCJhZGRfaWQiOjl9:1lbjT7:5wYrD9T9WiMrmvfqduI6gmekIT8cYvS87y4vS2luSQg', '2021-05-12 12:39:05.146388'),
('md15pdi2y5zwp5mu4ecmtwnarb2vx3v2', 'eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInR5cGUiOiJtb2RlcmF0b3IiLCJhZGRfaWQiOjEwfQ:1lblzW:L5Yi-q2R2YUZMNHMLC32o50dj2sMG73lmwF2Gkdf7q8', '2021-05-12 15:20:42.837696');

-- --------------------------------------------------------

--
-- Table structure for table `login_landlord`
--

CREATE TABLE `login_landlord` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_landlord`
--

INSERT INTO `login_landlord` (`id`, `email`, `password`) VALUES
(1, 'manager@gmail.com', 'pbkdf2_sha256$260000$sIWtgNqukliBk3GkVjQJ0c$ajrjAZNOGAQHahdOsBjdt1aWmeRb+8lEJPnHNK1UuCY='),
(2, 'manager2@gmail.com', 'pbkdf2_sha256$260000$Tf6fKejJlw7seqNdWc7HiB$itsso3pdZJr64LTpYEdnYJa2l47kwOFcI0ho/cKZJ90='),
(3, 'manager3@gmail.com', 'pbkdf2_sha256$260000$gs97X8Vgub2VMPmLCU5EWC$Zc6nG3N9O+PHIEliBQkO9W1bsFyVKcTdjeaJDXjFjs8=');

-- --------------------------------------------------------

--
-- Table structure for table `login_moderator`
--

CREATE TABLE `login_moderator` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_moderator`
--

INSERT INTO `login_moderator` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'pbkdf2_sha256$260000$PZbZ1gbN0ToUrSAXCKuxeR$1FU6noEHKyqM/wAH/kbHE8BfseYiFvpdfwN8Ue7wuUE=');

-- --------------------------------------------------------

--
-- Table structure for table `login_student`
--

CREATE TABLE `login_student` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_student`
--

INSERT INTO `login_student` (`id`, `email`, `password`) VALUES
(1, 'user1@gmail.com', 'pbkdf2_sha256$260000$gfwMtyZ90hM8SND0vUYpkN$/66gtxoK1lJ5Lj0TpdygHNg91BFthuBsFrORjxgMB+8='),
(6, 'user2@gmail.com', 'pbkdf2_sha256$260000$dcbwC4hWTiix1PkF6oROxu$Cs6OjsqnOvJADU+rZm87gWbStmBsPeDG3Lg/JOoCGk0='),
(7, 'user3@gmail.com', 'pbkdf2_sha256$260000$bZFg8WVuIMcD6Fgl7S6RUu$Gf38/pHjrBw8dILVRqS1jA+Og/1wj8wYGhmhHYQ+fuE=');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adverts_advert`
--
ALTER TABLE `adverts_advert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adverts_advert_manager_id_2479e594_fk_login_landlord_id` (`manager_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `book_visit_book`
--
ALTER TABLE `book_visit_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_visit_book_advert_id_5713f217_fk_adverts_advert_id` (`advert_id`);

--
-- Indexes for table `chat_answer`
--
ALTER TABLE `chat_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_answer_query_id_cf820f99_fk_chat_question_id` (`query_id`);

--
-- Indexes for table `chat_question`
--
ALTER TABLE `chat_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_question_advert_id_1c4117cd_fk_adverts_advert_id` (`advert_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `login_landlord`
--
ALTER TABLE `login_landlord`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_moderator`
--
ALTER TABLE `login_moderator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_student`
--
ALTER TABLE `login_student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adverts_advert`
--
ALTER TABLE `adverts_advert`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_visit_book`
--
ALTER TABLE `book_visit_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `chat_answer`
--
ALTER TABLE `chat_answer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_question`
--
ALTER TABLE `chat_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `login_landlord`
--
ALTER TABLE `login_landlord`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_moderator`
--
ALTER TABLE `login_moderator`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_student`
--
ALTER TABLE `login_student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adverts_advert`
--
ALTER TABLE `adverts_advert`
  ADD CONSTRAINT `adverts_advert_manager_id_2479e594_fk_login_landlord_id` FOREIGN KEY (`manager_id`) REFERENCES `login_landlord` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `book_visit_book`
--
ALTER TABLE `book_visit_book`
  ADD CONSTRAINT `book_visit_book_advert_id_5713f217_fk_adverts_advert_id` FOREIGN KEY (`advert_id`) REFERENCES `adverts_advert` (`id`);

--
-- Constraints for table `chat_answer`
--
ALTER TABLE `chat_answer`
  ADD CONSTRAINT `chat_answer_query_id_cf820f99_fk_chat_question_id` FOREIGN KEY (`query_id`) REFERENCES `chat_question` (`id`);

--
-- Constraints for table `chat_question`
--
ALTER TABLE `chat_question`
  ADD CONSTRAINT `chat_question_advert_id_1c4117cd_fk_adverts_advert_id` FOREIGN KEY (`advert_id`) REFERENCES `adverts_advert` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
