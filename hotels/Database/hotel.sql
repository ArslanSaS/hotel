-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 07 2025 г., 02:54
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `hotel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `additional_services` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','confirmed','canceled') DEFAULT 'pending',
  PRIMARY KEY (`booking_id`),
  KEY `room_id` (`room_id`),
  KEY `guest_id` (`guest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`booking_id`, `room_id`, `guest_id`, `check_in_date`, `check_out_date`, `additional_services`, `total_price`, `status`) VALUES
(21, 41, 1, '2025-04-01', '2025-04-05', '50.00', NULL, 'confirmed'),
(22, 42, 2, '2025-04-03', '2025-04-06', '0.00', NULL, 'pending'),
(23, 43, 3, '2025-04-02', '2025-04-07', '75.00', NULL, 'confirmed'),
(24, 44, 4, '2025-04-10', '2025-04-15', '100.00', NULL, 'confirmed'),
(25, 45, 5, '2025-04-08', '2025-04-12', '20.00', NULL, 'canceled'),
(26, 46, 6, '2025-04-05', '2025-04-09', '30.00', NULL, 'pending'),
(27, 47, 7, '2025-04-07', '2025-04-11', '0.00', NULL, 'confirmed'),
(28, 48, 8, '2025-04-12', '2025-04-16', '45.00', NULL, 'confirmed'),
(29, 49, 9, '2025-04-13', '2025-04-17', '60.00', NULL, 'pending'),
(30, 50, 10, '2025-04-15', '2025-04-18', '0.00', NULL, 'canceled');

-- --------------------------------------------------------

--
-- Структура таблицы `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passport_number` int(10) NOT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `guests`
--

INSERT INTO `guests` (`guest_id`, `firstname`, `lastname`, `phone`, `email`, `passport_number`) VALUES
(1, 'John', 'Doe', 1234567890, 'john.doe@example.com', 0),
(2, 'Jane', 'Smith', 1987654321, 'jane.smith@example.com', 0),
(3, 'Michael', 'Brown', 1112223333, 'michael.brown@example.com', 0),
(4, 'Emily', 'Davis', 2147483647, 'emily.davis@example.com', 0),
(5, 'David', 'Wilson', 2147483647, 'david.wilson@example.com', 0),
(6, 'Sarah', 'Miller', 2147483647, 'sarah.miller@example.com', 0),
(7, 'Robert', 'Taylor', 2147483647, 'robert.taylor@example.com', 0),
(8, 'Jessica', 'Anderson', 2147483647, 'jessica.anderson@example.com', 0),
(9, 'Daniel', 'Thomas', 2147483647, 'daniel.thomas@example.com', 0),
(10, 'Laura', 'Jackson', 2147483647, 'laura.jackson@example.com', 0),
(11, 'Kevin', 'White', 2147483647, 'kevin.white@example.com', 0),
(12, 'Olivia', 'Harris', 2147483647, 'olivia.harris@example.com', 0),
(13, 'Thomas', 'Martin', 2147483647, 'thomas.martin@example.com', 0),
(14, 'Emma', 'Thompson', 2147483647, 'emma.thompson@example.com', 0),
(15, 'Andrew', 'Scott', 2147483647, 'andrew.scott@example.com', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` enum('Cash','Credit Card','Bank Transfer','Online Payment') NOT NULL,
  `status` enum('Pending','Completed','Cancelled','Refunded') DEFAULT 'Pending',
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`, `status`) VALUES
(1, 21, '150.00', '2023-05-15 05:30:00', 'Credit Card', 'Completed'),
(2, 22, '200.50', '2023-05-16 09:45:00', 'Bank Transfer', 'Completed'),
(3, 23, '75.25', '2023-05-17 04:15:00', 'Cash', 'Pending'),
(4, 24, '300.00', '2023-05-18 11:20:00', 'Credit Card', 'Refunded'),
(5, 25, '125.75', '2023-05-19 06:00:00', '', 'Cancelled'),
(6, 26, '180.00', '2023-05-20 08:10:00', 'Bank Transfer', 'Completed'),
(7, 27, '90.50', '2023-05-21 03:45:00', 'Cash', 'Pending'),
(8, 28, '250.00', '2023-05-22 10:30:00', 'Credit Card', 'Completed'),
(9, 29, '60.00', '2023-05-23 05:20:00', '', 'Refunded'),
(10, 30, '175.25', '2023-05-24 07:00:00', 'Bank Transfer', 'Completed');

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `room_type` enum('Single','Double','Twin','Triple','Quadriple','Extra Bed') NOT NULL,
  `size` enum('Standard','Superior','Studio','Family room','Family Studio','Delux','Suite') NOT NULL,
  `location` enum('MB','Cabana','Cottage','BGL','BG','Villa') NOT NULL,
  `room_view` enum('GV','CV','DV','MV','RV','PV','BV','SV') NOT NULL,
  `meal_plan` enum('RO','AO','BO','BB','HB','FB','All Inclusive') NOT NULL,
  `status` enum('available','occupied','maintenance') DEFAULT 'available',
  `price` decimal(10,2) DEFAULT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_number` (`room_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_type`, `size`, `location`, `room_view`, `meal_plan`, `status`, `price`, `price_per_night`) VALUES
(41, '101A', 'Single', 'Standard', 'MB', 'GV', 'BB', 'available', '100.00', '0.00'),
(42, '102A', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '150.00', '0.00'),
(43, '103A', 'Twin', 'Studio', 'Cottage', 'MV', 'FB', 'available', '130.00', '0.00'),
(44, '104A', 'Triple', 'Family room', 'Cabana', 'CV', 'All Inclusive', 'available', '180.00', '0.00'),
(45, '105A', 'Quadriple', 'Delux', 'BGL', 'PV', 'BB', 'available', '200.00', '0.00'),
(46, '106A', 'Extra Bed', 'Suite', 'BG', 'BV', 'HB', 'available', '220.00', '0.00'),
(47, '107A', 'Double', 'Superior', 'Villa', 'SV', 'FB', 'available', '160.00', '0.00'),
(48, '108A', 'Single', 'Standard', 'Cottage', 'GV', 'RO', 'available', '90.00', '0.00'),
(49, '109A', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '140.00', '0.00'),
(50, '110A', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '170.00', '0.00'),
(51, '101B', 'Single', 'Standard', 'BG', 'GV', 'BB', 'available', '105.00', '0.00'),
(52, '102B', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '155.00', '0.00'),
(53, '103B', 'Twin', 'Studio', 'Cabana', 'MV', 'FB', 'available', '135.00', '0.00'),
(54, '104B', 'Triple', 'Family room', 'BGL', 'CV', 'All Inclusive', 'available', '185.00', '0.00'),
(55, '105B', 'Quadriple', 'Delux', 'MB', 'PV', 'BB', 'available', '205.00', '0.00'),
(56, '106B', 'Extra Bed', 'Suite', 'Cottage', 'BV', 'HB', 'available', '225.00', '0.00'),
(57, '107B', 'Double', 'Superior', 'BG', 'SV', 'FB', 'available', '165.00', '0.00'),
(58, '108B', 'Single', 'Standard', 'Villa', 'GV', 'RO', 'available', '95.00', '0.00'),
(59, '109B', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '145.00', '0.00'),
(60, '110B', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '175.00', '0.00'),
(61, '201A', 'Single', 'Standard', 'MB', 'GV', 'BB', 'available', '110.00', '0.00'),
(62, '202A', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '160.00', '0.00'),
(63, '203A', 'Twin', 'Studio', 'Cottage', 'MV', 'FB', 'available', '140.00', '0.00'),
(64, '204A', 'Triple', 'Family room', 'Cabana', 'CV', 'All Inclusive', 'available', '190.00', '0.00'),
(65, '205A', 'Quadriple', 'Delux', 'BGL', 'PV', 'BB', 'available', '210.00', '0.00'),
(66, '206A', 'Extra Bed', 'Suite', 'BG', 'BV', 'HB', 'available', '230.00', '0.00'),
(67, '207A', 'Double', 'Superior', 'Villa', 'SV', 'FB', 'available', '170.00', '0.00'),
(68, '208A', 'Single', 'Standard', 'Cottage', 'GV', 'RO', 'available', '100.00', '0.00'),
(69, '209A', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '150.00', '0.00'),
(70, '210A', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '180.00', '0.00'),
(71, '201B', 'Single', 'Standard', 'BG', 'GV', 'BB', 'available', '115.00', '0.00'),
(72, '202B', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '165.00', '0.00'),
(73, '203B', 'Twin', 'Studio', 'Cabana', 'MV', 'FB', 'available', '145.00', '0.00'),
(74, '204B', 'Triple', 'Family room', 'BGL', 'CV', 'All Inclusive', 'available', '195.00', '0.00'),
(75, '205B', 'Quadriple', 'Delux', 'MB', 'PV', 'BB', 'available', '215.00', '0.00'),
(76, '206B', 'Extra Bed', 'Suite', 'Cottage', 'BV', 'HB', 'available', '235.00', '0.00'),
(77, '207B', 'Double', 'Superior', 'BG', 'SV', 'FB', 'available', '175.00', '0.00'),
(78, '208B', 'Single', 'Standard', 'Villa', 'GV', 'RO', 'available', '105.00', '0.00'),
(79, '209B', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '155.00', '0.00'),
(80, '210B', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '185.00', '0.00'),
(81, '301A', 'Single', 'Standard', 'MB', 'GV', 'BB', 'available', '120.00', '0.00'),
(82, '302A', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '170.00', '0.00'),
(83, '303A', 'Twin', 'Studio', 'Cottage', 'MV', 'FB', 'available', '150.00', '0.00'),
(84, '304A', 'Triple', 'Family room', 'Cabana', 'CV', 'All Inclusive', 'available', '200.00', '0.00'),
(85, '305A', 'Quadriple', 'Delux', 'BGL', 'PV', 'BB', 'available', '220.00', '0.00'),
(86, '306A', 'Extra Bed', 'Suite', 'BG', 'BV', 'HB', 'available', '240.00', '0.00'),
(87, '307A', 'Double', 'Superior', 'Villa', 'SV', 'FB', 'available', '180.00', '0.00'),
(88, '308A', 'Single', 'Standard', 'Cottage', 'GV', 'RO', 'available', '110.00', '0.00'),
(89, '309A', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '160.00', '0.00'),
(90, '310A', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '190.00', '0.00'),
(91, '301B', 'Single', 'Standard', 'BG', 'GV', 'BB', 'available', '125.00', '0.00'),
(92, '302B', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '175.00', '0.00'),
(93, '303B', 'Twin', 'Studio', 'Cabana', 'MV', 'FB', 'available', '155.00', '0.00'),
(94, '304B', 'Triple', 'Family room', 'BGL', 'CV', 'All Inclusive', 'available', '205.00', '0.00'),
(95, '305B', 'Quadriple', 'Delux', 'MB', 'PV', 'BB', 'available', '225.00', '0.00'),
(96, '306B', 'Extra Bed', 'Suite', 'Cottage', 'BV', 'HB', 'available', '245.00', '0.00'),
(97, '307B', 'Double', 'Superior', 'BG', 'SV', 'FB', 'available', '185.00', '0.00'),
(98, '308B', 'Single', 'Standard', 'Villa', 'GV', 'RO', 'available', '115.00', '0.00'),
(99, '309B', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '165.00', '0.00'),
(100, '310B', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '195.00', '0.00'),
(101, '401A', 'Single', 'Standard', 'MB', 'GV', 'BB', 'available', '130.00', '0.00'),
(102, '402A', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '180.00', '0.00'),
(103, '403A', 'Twin', 'Studio', 'Cottage', 'MV', 'FB', 'available', '160.00', '0.00'),
(104, '404A', 'Triple', 'Family room', 'Cabana', 'CV', 'All Inclusive', 'available', '210.00', '0.00'),
(105, '405A', 'Quadriple', 'Delux', 'BGL', 'PV', 'BB', 'available', '230.00', '0.00'),
(106, '406A', 'Extra Bed', 'Suite', 'BG', 'BV', 'HB', 'available', '250.00', '0.00'),
(107, '407A', 'Double', 'Superior', 'Villa', 'SV', 'FB', 'available', '190.00', '0.00'),
(108, '408A', 'Single', 'Standard', 'Cottage', 'GV', 'RO', 'available', '120.00', '0.00'),
(109, '409A', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '170.00', '0.00'),
(110, '410A', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '200.00', '0.00'),
(111, '401B', 'Single', 'Standard', 'BG', 'GV', 'BB', 'available', '135.00', '0.00'),
(112, '402B', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '185.00', '0.00'),
(113, '403B', 'Twin', 'Studio', 'Cabana', 'MV', 'FB', 'available', '165.00', '0.00'),
(114, '404B', 'Triple', 'Family room', 'BGL', 'CV', 'All Inclusive', 'available', '215.00', '0.00'),
(115, '405B', 'Quadriple', 'Delux', 'MB', 'PV', 'BB', 'available', '235.00', '0.00'),
(116, '406B', 'Extra Bed', 'Suite', 'Cottage', 'BV', 'HB', 'available', '255.00', '0.00'),
(117, '407B', 'Double', 'Superior', 'BG', 'SV', 'FB', 'available', '195.00', '0.00'),
(118, '408B', 'Single', 'Standard', 'Villa', 'GV', 'RO', 'available', '125.00', '0.00'),
(119, '409B', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '175.00', '0.00'),
(120, '410B', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '205.00', '0.00'),
(121, '501A', 'Single', 'Standard', 'MB', 'GV', 'BB', 'available', '140.00', '0.00'),
(122, '502A', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '190.00', '0.00'),
(123, '503A', 'Twin', 'Studio', 'Cottage', 'MV', 'FB', 'available', '170.00', '0.00'),
(124, '504A', 'Triple', 'Family room', 'Cabana', 'CV', 'All Inclusive', 'available', '220.00', '0.00'),
(125, '505A', 'Quadriple', 'Delux', 'BGL', 'PV', 'BB', 'available', '240.00', '0.00'),
(126, '506A', 'Extra Bed', 'Suite', 'BG', 'BV', 'HB', 'available', '260.00', '0.00'),
(127, '507A', 'Double', 'Superior', 'Villa', 'SV', 'FB', 'available', '200.00', '0.00'),
(128, '508A', 'Single', 'Standard', 'Cottage', 'GV', 'RO', 'available', '130.00', '0.00'),
(129, '509A', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '180.00', '0.00'),
(130, '510A', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '210.00', '0.00'),
(131, '501B', 'Single', 'Standard', 'BG', 'GV', 'BB', 'available', '145.00', '0.00'),
(132, '502B', 'Double', 'Superior', 'Villa', 'SV', 'HB', 'available', '195.00', '0.00'),
(133, '503B', 'Twin', 'Studio', 'Cabana', 'MV', 'FB', 'available', '175.00', '0.00'),
(134, '504B', 'Triple', 'Family room', 'BGL', 'CV', 'All Inclusive', 'available', '225.00', '0.00'),
(135, '505B', 'Quadriple', 'Delux', 'MB', 'PV', 'BB', 'available', '245.00', '0.00'),
(136, '506B', 'Extra Bed', 'Suite', 'Cottage', 'BV', 'HB', 'available', '265.00', '0.00'),
(137, '507B', 'Double', 'Superior', 'BG', 'SV', 'FB', 'available', '205.00', '0.00'),
(138, '508B', 'Single', 'Standard', 'Villa', 'GV', 'RO', 'available', '135.00', '0.00'),
(139, '509B', 'Twin', 'Studio', 'Cabana', 'DV', 'BB', 'available', '185.00', '0.00'),
(140, '510B', 'Triple', 'Family Studio', 'BGL', 'RV', 'FB', 'available', '215.00', '0.00');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `availability` enum('Available','Unavailable') DEFAULT 'Available',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`service_id`, `name`, `description`, `price`, `availability`) VALUES
(1, 'Breakfast Buffet', 'A delicious breakfast buffet with a variety of hot and cold dishes.', '15.00', 'Available'),
(2, 'Spa Access', 'Full day access to the hotel spa and wellness center.', '50.00', 'Available'),
(3, 'Airport Shuttle', 'Private airport shuttle service to and from the hotel.', '30.00', 'Available'),
(4, 'Room Cleaning', 'Daily room cleaning and fresh towels.', '10.00', 'Available'),
(5, 'Laundry Service', 'Professional laundry service for your clothes.', '20.00', 'Available'),
(6, 'Massage Therapy', '1-hour relaxing full-body massage.', '60.00', 'Unavailable'),
(7, 'Mini Bar', 'Refreshments and snacks in the room mini bar.', '25.00', 'Available'),
(8, 'City Tour', 'Guided tour around the city attractions.', '40.00', 'Available'),
(9, 'Late Check-Out', 'Extend your stay until 4 PM.', '20.00', 'Available'),
(10, 'Pet Service', 'Pet-friendly accommodation service.', '15.00', 'Unavailable');

-- --------------------------------------------------------

--
-- Структура таблицы `service_orders`
--

CREATE TABLE IF NOT EXISTS `service_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `total_price` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `booking_id` (`booking_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `service_orders`
--

INSERT INTO `service_orders` (`order_id`, `booking_id`, `service_id`, `quantity`, `total_price`, `order_date`, `status`) VALUES
(1, 21, 5, 2, '150.00', '2023-06-10 04:15:00', 'Pending'),
(2, 22, 3, 1, '75.50', '2023-06-10 06:30:00', 'Pending'),
(3, 23, 7, 3, '225.00', '2023-06-11 09:45:00', 'Pending'),
(4, 24, 2, 1, '50.00', '2023-06-11 11:20:00', 'Pending'),
(5, 25, 8, 2, '180.00', '2023-06-12 05:00:00', 'Pending'),
(6, 26, 1, 4, '120.00', '2023-06-12 08:10:00', 'Pending'),
(7, 27, 6, 1, '95.75', '2023-06-13 03:30:00', 'Pending'),
(8, 28, 4, 2, '210.00', '2023-06-13 10:15:00', 'Pending'),
(9, 29, 9, 1, '65.25', '2023-06-14 07:00:00', 'Pending'),
(10, 30, 10, 3, '270.50', '2023-06-14 12:45:00', 'Pending');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`);

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `service_orders`
--
ALTER TABLE `service_orders`
  ADD CONSTRAINT `service_orders_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_orders_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
