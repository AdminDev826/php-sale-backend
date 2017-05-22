-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Mar 17, 2017 at 12:02 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mediacms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` bigint(20) NOT NULL,
  `image_file` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `category_ar_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_file` varchar(1024) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `is_parent` int(11) DEFAULT '0',
  `cat_order` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_ar_name`, `image_file`, `parent_id`, `is_parent`, `cat_order`) VALUES
(75, 'For Sell', 'Ù„Ù„Ø¨ÙŠØ¹ Ø¹Ù‚Ø§Ø±', 'http://autoigs.com/mediacms/admin/category_images/Sell_Home-512.png', 74, 0, 1),
(77, 'For Rent', 'Ù„Ù„Ø§ÙŠØ¬Ø§Ø± Ø¹Ù‚Ø§Ø±', 'http://autoigs.com/mediacms/admin/category_images/Rent_Home-512.png', 74, 0, 2),
(104, 'Property', 'Ø¹Ù‚Ø§Ø±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477679658_search.new.png', 0, 1, 1),
(106, 'Motors', 'Ø³ÙŠØ§Ø±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742299_car.new.png', 0, 1, 2),
(107, 'Teaching & Training', 'ØªØ¯Ø±ÙŠØ³ Ùˆ ØªØ¹Ù„ÙŠÙ…', 'http://s3-us-west-2.amazonaws.com/2sale/1477742320_teaching.new.png', 0, 1, 3),
(108, 'Health & Clinics', 'Ø¹ÙŠØ§Ø¯Ø§Øª Ø·Ø¨ÙŠØ© ÙˆØµØ­ØªÙƒ', 'http://s3-us-west-2.amazonaws.com/2sale/1477742331_health.new.png', 0, 1, 4),
(109, 'General Constracting', 'Ù…Ù‚Ø§ÙˆÙ„Ø§Øª ÙˆØ­Ø±Ù', 'http://s3-us-west-2.amazonaws.com/2sale/1477742344_cons.new.png', 0, 1, 5),
(110, 'Satellite', 'Ø³ØªÙ„Ø§ÙŠØªØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742357_sat.new.png', 0, 1, 6),
(111, 'Camping Equipments', 'Ø§Ø¯ÙˆØ§Øª Ø§Ù„Ø¨Ø± Ùˆ Ø§Ù„ÙƒØ´ØªØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477742370_camping2.new.png', 0, 1, 7),
(112, 'Samsung devices', 'Ø§Ø¬Ù‡Ø²Ø©  Ø´Ø±ÙƒØ© Ø³Ø§Ù…Ø³ÙˆÙ†Ø¬', 'http://s3-us-west-2.amazonaws.com/2sale/1477742383_samsung.new.png', 0, 1, 14),
(113, 'Apple devices', 'Ø§Ø¬Ù‡Ø²Ø© Ø´Ø±ÙƒØ© Ø§Ø¨Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477742395_Apple-2-128.png', 0, 1, 9),
(114, 'Electronics', 'Ø§Ù„Ø§Ù„ÙƒØªØ±ÙˆÙ†ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742408_electric2.new.png', 0, 1, 10),
(115, 'Mobiles', 'ØªÙ„ÙŠÙÙˆÙ†Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742419_mobile.new.png', 0, 1, 11),
(117, 'Computers', 'ÙƒÙ…Ø¨ÙŠÙˆØªØ±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742443_computer.new.png', 0, 1, 13),
(118, 'Salons & Health', 'ØµØ§Ù„ÙˆÙ†Ø§Øª Ùˆ Ø§Ù„ØµØ­Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477742464_salon.new.png', 0, 1, 18),
(119, 'Women needs', 'Ø¥Ø­ØªÙŠØ§Ø¬Ø§Øª Ø§Ù„Ù…Ø±Ø£Ù‡', 'http://s3-us-west-2.amazonaws.com/2sale/1477745197_arab.new.png', 0, 1, 15),
(120, 'Men needs', 'Ø¥Ø­ØªÙŠØ§Ø¬Ø§Øª Ø§Ù„Ø±Ø¬Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745208_arabman.new.png', 0, 1, 16),
(121, 'Furniture', 'Ø§Ø«Ø§Ø«', 'http://s3-us-west-2.amazonaws.com/2sale/1477742527_fur.new.png', 0, 1, 17),
(122, 'Pick & Move', 'Ù†Ù‚Ù„ Ø¹ÙØ´', 'http://s3-us-west-2.amazonaws.com/2sale/1477742659_pickanmove.png', 0, 0, 8),
(123, 'House keeping', 'Ø¹Ù…Ø§Ù„Ø© Ù…Ù†Ø²Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477742673_housekeeping.new.png', 0, 1, 19),
(124, 'Games', 'Ø§Ù„Ø§Ù„Ø¹Ø§Ø¨', 'http://s3-us-west-2.amazonaws.com/2sale/1477742686_games.png', 0, 1, 20),
(125, 'Pets & animals', 'Ø§Ù„Ø­ÙŠÙˆØ§Ù†Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742699_pets.new.png', 0, 1, 21),
(126, 'Birds', 'Ø§Ù„Ø·ÙŠÙˆØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477742712_birds.new.png', 0, 1, 22),
(127, 'Jobs', 'ÙˆØ¸Ø§Ø¦Ù ÙˆØ®Ø¯Ù…Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742723_job.new.png', 0, 1, 23),
(128, 'Food', 'Ø§Ù„Ù…Ø£ÙƒÙˆÙ„Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742733_food.png', 0, 1, 24),
(129, 'Gifts', 'Ø§Ù„Ù‡Ø¯Ø§ÙŠØ§ ÙˆØ§Ù„ÙƒÙ…Ø§Ù„ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742744_gift.new.png', 0, 1, 25),
(130, 'Random things', 'Ø§Ù„Ù…ØªÙØ±Ù‚Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477742755_random.new.png', 0, 1, 26),
(131, 'Babies needs', 'Ø§Ù„Ø§Ø·ÙØ§Ù„ Ùˆ Ø§Ù„Ø§Ø³ØªÙ‚Ø¨Ø§Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477742767_baby.new.png', 0, 0, 27),
(132, 'Travel and tourism', 'Ø§Ù„Ø³ÙŠØ§Ø­Ø© Ùˆ Ø§Ù„Ø³ÙØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477742776_travel.new.png', 0, 0, 28),
(134, 'Property for sale', 'Ù„Ù„Ø¨ÙŠØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477742786_sale.new.png', 104, 0, 1),
(135, 'Property for Rent', 'Ù„Ù„Ø§ÙŠØ¬Ø§Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477742808_rent.new.png', 104, 0, 2),
(136, 'Switch properties', 'Ù„Ù„ØªØ¨Ø¯ÙŠÙ„', 'http://s3-us-west-2.amazonaws.com/2sale/1477742818_switch.new.png', 104, 0, 3),
(137, 'Global Real Estate', 'Ø¹Ù‚Ø§Ø±Ø§Øª Ø¹Ø§Ù„Ù…ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477742829_global.new.png', 104, 0, 4),
(138, 'Shops for Sale', 'Ù…Ø­Ù„Ø§Øª Ù„Ù„Ø¨ÙŠØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477742839_shops.new.png', 104, 0, 5),
(139, 'Required properties', 'Ù…Ø·Ù„ÙˆØ¨ Ø¹Ù‚Ø§Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477742886_find.new.png', 104, 0, 6),
(140, 'Lands for Sale', 'Ø§Ø±Ø§Ø¶ÙŠ Ù„Ù„Ø¨ÙŠØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477742897_map.new.png', 104, 0, 7),
(141, 'Offices', 'Ù…ÙƒØ§ØªØ¨ ÙˆÙ…Ø­Ù„Ø§Øª Ù„Ù„Ø¨ÙŠØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477742908_office.new.png', 104, 0, 8),
(142, 'Daily/Monthy rental', 'Ø´Ù‚Ù‚ Ø§Ø¬Ø§Ø± ÙŠÙˆÙ…ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477742943_shega.new.png', 104, 0, 9),
(144, 'Chalet Rental', 'Ø´Ø§Ù„ÙŠÙ‡Ø§Øª Ù„Ù„Ø§ÙŠØ¬Ø§Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477742965_chaletrental.new.png', 104, 0, 11),
(145, 'Farms for Sale', 'Ù…Ø²Ø§Ø±Ø¹ Ù„Ù„Ø¨ÙŠØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477742976_farm.new.png', 104, 0, 12),
(146, 'Farms for Rent', 'Ù…Ø²Ø§Ø±Ø¹ Ù„Ù„Ø§ÙŠØ¬Ø§Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477742985_farmsrental.new.png', 104, 0, 13),
(150, 'Sharing house', 'Ù…Ø´Ø§Ø±ÙƒØ© Ø³ÙƒÙ†', 'http://s3-us-west-2.amazonaws.com/2sale/1477742995_sharing.new.png', 104, 0, 14),
(151, 'American Cars', 'Ø³ÙŠØ§Ø±Ø§Øª Ø§Ù…Ø±ÙŠÙƒÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743329_usa.new.png', 106, 0, 1),
(152, 'Europe car', 'Ø³ÙŠØ§Ø±Ø§Øª Ø§ÙˆØ±ÙˆØ¨ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743339_eu.new.png', 106, 0, 2),
(153, 'Asia Cars', 'Ø³ÙŠØ§Ø±Ø§Øª ÙŠØ§Ø¨Ø§Ù†ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1485741684_plainicon.com-47014-0f1d-512px.png', 106, 0, 3),
(154, 'Jet ski', 'Ø§Ù„Ø¬Øª Ø³ÙƒÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743365_jetskinew.png', 106, 0, 4),
(155, 'Motorcycle', 'Ø³ÙŠØ§ÙƒÙ„ ÙˆØ¨Ù‚ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743374_motorcycles.new.png', 106, 0, 5),
(156, 'Boats', 'Ø·Ø±Ø§Ø±ÙŠØ¯', 'http://s3-us-west-2.amazonaws.com/2sale/1477743382_boat.new.png', 106, 0, 6),
(157, 'Accessories & spare parts', 'Ù‚Ø·Ø¹ Ø§Ù„ØºÙŠØ§Ø± ÙˆØ§Ù„Ø§ÙƒØ³Ø³ÙˆØ§Ø±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743391_access.new.png', 106, 0, 7),
(158, 'Junk cars', 'Ø³ÙŠØ§Ø±Ø§Øª Ø³ÙƒØ±Ø§Ø¨', 'http://s3-us-west-2.amazonaws.com/2sale/1477743402_junk.new.png', 106, 0, 8),
(159, 'Heavy Equipments', 'Ù…Ø¹Ø¯Ø§Øª Ø«Ù‚ÙŠÙ„Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743415_heavy.new.png', 106, 0, 9),
(160, 'Car Service', 'Ø³ÙŠØ±ÙØ³ Ù„Ù„Ø³ÙŠØ§Ø±Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743425_service.new.png', 106, 0, 10),
(161, 'Classic cars', 'Ø³ÙŠØ§Ø±Ø§Øª ÙƒÙ„Ø§Ø³ÙŠÙƒÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743435_classic.png', 106, 0, 11),
(162, 'External shipping', 'Ø´Ø­Ù† Ø®Ø§Ø±Ø¬ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743457_shipping.new.png', 106, 0, 12),
(163, 'Driving lession', 'ØªØ¹Ù„ÙŠÙ… Ù‚ÙŠØ§Ø¯Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743469_driving.new.png', 106, 0, 13),
(164, 'Bus', 'Ø¨Ø§ØµØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743484_buses.new.png', 106, 0, 14),
(165, 'Taxi', 'ØªÙƒØ§Ø³ÙŠ ÙˆØªÙˆØµÙŠÙ„', 'http://s3-us-west-2.amazonaws.com/2sale/1477743495_taxi.new.png', 106, 0, 15),
(166, 'Mechanic', 'Ù…ÙƒØ§Ù†ÙŠÙƒÙŠ ÙˆÙƒÙ‡Ø±Ø¨Ø§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477743506_mec.new.png', 106, 0, 16),
(167, 'Trailer - Tow truck', 'Ø³Ø·Ø­Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743527_9a6.new.png', 106, 0, 17),
(168, 'Car insurance', 'Ø§Ù„ØªØ£Ù…ÙŠÙ†', 'http://s3-us-west-2.amazonaws.com/2sale/1477743538_insurance.new.png', 106, 0, 18),
(169, 'Remote programming', 'Ø¨Ø±Ù…Ø¬Ø© ÙˆØªØµÙ„ÙŠØ­ Ø±Ù…ÙˆØªØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743547_remote.new.png', 106, 0, 19),
(171, 'Arabic language teaching', 'ØªØ¯Ø±ÙŠØ³ Ø§Ù„Ù„ØºØ© Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743588_a.png', 107, 0, 1),
(172, 'English language teaching', 'ØªØ¯Ø±ÙŠØ³ Ø§Ù„Ù„ØºØ© Ø§Ù„Ø§Ù†Ø¬Ù„ÙŠØ²ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743613_eng.new.png', 107, 0, 2),
(173, 'University assigments', 'Ø®Ø¯Ù…Ø§Øª Ø¬Ø§Ù…Ø¹ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743622_university.new.png', 107, 0, 3),
(174, 'Mathematics teaching', 'ØªØ¯Ø±ÙŠØ³ Ø±ÙŠØ§Ø¶ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743631_mathmatics.new.png', 107, 0, 4),
(175, 'French language teaching', 'ØªØ¯Ø±ÙŠØ³ Ø§Ù„Ù„ØºØ© Ø§Ù„ÙØ±Ù†Ø³ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743640_french.new.png', 107, 0, 5),
(176, 'Science teaching ', 'ØªØ¯Ø±ÙŠØ³ Ø§Ù„Ø¹Ù„ÙˆÙ…', 'http://s3-us-west-2.amazonaws.com/2sale/1477743658_sience.new.png', 107, 0, 6),
(177, 'Physics teaching', 'ØªØ¯Ø±ÙŠØ³ Ø§Ù„ÙÙŠØ²ÙŠØ§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477743668_physics.new.png', 107, 0, 7),
(178, 'Other educational materials.  ', 'Ù…ÙˆØ§Ø¯ Ø¯Ø±Ø§Ø³ÙŠØ© Ù…Ø®ØªÙ„ÙØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743704_learn.new.png', 107, 0, 8),
(179, 'School tools', 'Ø§Ù„Ù„ÙˆØ§Ø²Ù… Ø§Ù„Ù…Ø¯Ø±Ø³ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743718_tools.new.png', 107, 0, 9),
(180, 'Books for sell', 'ÙƒØªØ¨ Ù„Ù„Ø¨ÙŠØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477743728_books.new.png', 107, 0, 10),
(181, 'Doctors', 'Ø§Ø·Ø¨Ø§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477743775_doctor.new.png', 108, 0, 1),
(182, 'Medical tools', 'Ø§Ø¬Ù‡Ø²Ø© Ø·Ø¨ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743790_toolz.new.png', 108, 0, 2),
(183, 'Disability', 'Ø°ÙˆÙŠ Ø§Ù„Ø§Ø­ØªÙŠØ§Ø¬Ø§Øª Ø§Ù„Ø®Ø§ØµØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743798_disable.new.png', 108, 0, 3),
(184, 'Faucet contractor', 'Ù…Ù‚Ø§ÙˆÙ„ ØµØ­ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743828_7an.new.png', 109, 0, 7),
(185, 'Locks contractor', 'ÙØªØ­ Ø§Ùˆ ØªØµÙ„ÙŠØ­ Ø§Ù‚ÙØ§Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477743836_lock.new.png', 109, 0, 2),
(186, 'Sewerage fixing', 'ØªØ³Ù„ÙŠÙƒ Ù…Ø¬Ø§Ø±ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743850_pip.new.png', 109, 0, 3),
(187, 'Building contractors', 'Ù…Ù‚Ø§ÙˆÙ„Ø§Øª Ø¨Ù†Ø§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477743870_con1.new.png', 109, 0, 4),
(188, 'Metal work', 'Ø­Ø¯Ø§Ø¯Ø© Ùˆ Ø£Ù„Ù…Ù†ÙŠÙˆÙ…', 'http://s3-us-west-2.amazonaws.com/2sale/1477743879_metal.new.png', 109, 0, 5),
(189, 'Clean services', 'Ø§Ù„ØªÙ†Ø¸ÙŠÙ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743887_cleanging.new.png', 109, 0, 6),
(190, 'Painting', 'Ø§ØµØ¨Ø§Øº', 'http://s3-us-west-2.amazonaws.com/2sale/1477743900_paint.new.png', 109, 0, 1),
(191, 'Decoration', 'Ø¯ÙŠÙƒÙˆØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477743908_decor.new.png', 109, 0, 8),
(192, 'Parks', 'Ù…Ø´Ø§ØªÙ„ ÙˆØ­Ø¯Ø§Ø¦Ù‚', 'http://s3-us-west-2.amazonaws.com/2sale/1477743919_park.new.png', 109, 0, 9),
(193, 'Water tanks', 'Ø®Ø²Ø§Ù†Ø§Øª Ù…ÙŠØ§Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477743928_watertank.new.png', 109, 0, 10),
(194, 'Air condition maintenance ', 'ØµÙŠØ§Ù†Ø© Ø§Ù„ØªÙƒÙŠÙŠÙ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743939_ac.new.png', 109, 0, 11),
(195, 'Anti bugs', 'Ù…ÙƒØ§ÙØ­Ø© Ø­Ø´Ø±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477743947_bugs.new.png', 109, 0, 12),
(196, 'Flooring and ceramic', 'Ø§Ø±Ø¶ÙŠØ§Øª Ùˆ Ø³ÙŠØ±Ø§Ù…ÙŠÙƒ', 'http://s3-us-west-2.amazonaws.com/2sale/1477743960_cer.new.png', 109, 0, 13),
(197, 'Mirros & Glass', 'ÙÙ†ÙŠ Ø²Ø¬Ø§Ø¬', 'http://s3-us-west-2.amazonaws.com/2sale/1477743971_mirror.new.png', 109, 0, 14),
(198, 'Electrics & lights', 'ÙÙ†ÙŠ ÙƒÙ‡Ø±Ø§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477743985_electric.new.png', 109, 0, 15),
(199, 'Carpenter', 'Ù†Ø¬Ø§Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477744014_najar.new.png', 109, 0, 16),
(200, 'Satelite - Ahmadi', 'Ø³ØªÙ„Ø§ÙŠØª Ù…Ø­Ø§ÙØ¸Ø© Ø§Ù„Ø§Ø­Ù…Ø¯ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744148_antena.new.png', 110, 0, 1),
(201, 'Satelite - Jahra', 'Ø³ØªÙ„Ø§ÙŠØª Ù…Ø­Ø§ÙØ¸Ø© Ø§Ù„Ø¬Ù‡Ø±Ø§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477744156_antena.new.png', 110, 0, 2),
(202, 'Satelite - Kuwait city', 'Ø³ØªÙ„Ø§ÙŠØª Ù…Ø­Ø§ÙØ¸Ø© Ø§Ù„Ø¹Ø§ØµÙ…Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744164_antena.new.png', 110, 0, 3),
(203, 'Satelite - Mubarak AlKabeer', 'Ø³ØªÙ„Ø§ÙŠØª Ù…Ø­Ø§ÙØ¸Ø© Ù…Ø¨Ø§Ø±Ùƒ Ø§Ù„ÙƒØ¨ÙŠØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477744172_antena.new.png', 110, 0, 4),
(204, 'Satelite - Farwaniya', 'Ø³ØªÙ„Ø§ÙŠØª Ù…Ø­Ø§ÙØ¸Ø© Ø§Ù„ÙØ±ÙˆØ§Ù†ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744179_antena.new.png', 110, 0, 5),
(205, 'Satelite - Ahmadi', 'Ø³ØªÙ„Ø§ÙŠØª Ù…Ø­Ø§ÙØ¸Ø© Ø­ÙˆÙ„ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744185_antena.new.png', 110, 0, 6),
(206, 'Camping equipments', 'Ø§ØºØ±Ø§Ø¶ Ø§Ù„Ù…Ø®ÙŠÙ…Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744228_f.new.png', 111, 0, 1),
(207, 'Games', 'Ø§Ù„Ø¹Ø§Ø¨ ÙˆÙ†Ø·Ø§Ø·ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744240_kite.new.png', 111, 0, 2),
(208, 'Tents', 'Ø§Ù„Ø®ÙŠØ§Ù…', 'http://s3-us-west-2.amazonaws.com/2sale/1477744249_tents.new.png', 111, 0, 3),
(209, 'Electrical generator', 'Ù…ÙˆÙ„Ø¯Ø§Øª ÙƒÙ‡Ø±Ø¨Ø§Ø¦ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744259_generator.new.png', 111, 0, 4),
(210, 'Camping cabins', 'ÙƒØ¨Ø§Ø¦Ù† Ù…ØªÙ†Ù‚Ù„Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744268_cabin.new.png', 111, 0, 5),
(211, 'Camps for rent', 'Ù…Ø®ÙŠÙ…Ø§Øª Ù„Ù„Ø§ÙŠØ¬Ø§Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477744276_ca.new.png', 111, 0, 6),
(212, 'Samsung computer', 'ÙƒÙ…Ø¨ÙŠÙˆØªØ±Ø§Øª Ø³Ø§Ù…Ø³ÙˆÙ†Ø¬', 'http://s3-us-west-2.amazonaws.com/2sale/1477744296_samcomp.png', 112, 0, 1),
(213, 'Samsung accessories', 'Ø§ÙƒØ³Ø³ÙˆØ§Ø±Ø§Øª Ø³Ø§Ù…Ø³ÙˆÙ†Ø¬', 'http://s3-us-west-2.amazonaws.com/2sale/1477744303_accessor.new.png', 112, 0, 2),
(214, 'Samsung note', 'Ø³Ø§Ù…Ø³ÙˆÙ†Ø¬ Ù†ÙˆØª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744329_samsungnote.png', 112, 0, 3),
(215, 'Samsung S', 'Ø³Ø§Ù…Ø³ÙˆÙ†Ø¬ Ø§Ø³', 'http://s3-us-west-2.amazonaws.com/2sale/1477744340_samsungs.new.png', 112, 0, 4),
(216, 'Samsung other devices', 'Ø§Ø¬Ù‡Ø²Ø© Ø³Ø§Ù…Ø³ÙˆÙ†Ø¬ Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477744362_android.new.png', 112, 0, 5),
(217, 'iPhone devices', 'Ø§Ø¬Ù‡Ø²Ø© Ø§ÙŠÙÙˆÙ†', 'http://s3-us-west-2.amazonaws.com/2sale/1477744384_iphone.new.png', 113, 0, 1),
(218, 'Mac devices', 'Ø§Ø¬Ù‡Ø²Ø© Ù…Ø§Ùƒ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744393_mac.new.png', 113, 0, 2),
(220, 'Apple watch', 'Ø³Ø§Ø¹Ø§Øª Ø§Ø¨Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477744403_applewatch2.png', 113, 0, 3),
(221, 'iPad devices', 'Ø§Ø¬Ù‡Ø²Ø© Ø§ÙŠ Ø¨Ø§Ø¯', 'http://s3-us-west-2.amazonaws.com/2sale/1477744417_ipad.new.png', 113, 0, 4),
(222, 'iPod devices', 'Ø§Ø¬Ù‡Ø²Ø© Ø§ÙŠ Ø¨ÙˆØ¯', 'http://s3-us-west-2.amazonaws.com/2sale/1477744428_ipods.png', 113, 0, 5),
(223, 'Apple accessories', 'Ø§ÙƒØ³Ø³ÙˆØ§Ø±Ø§Øª Ø§Ø¨Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477744438_applea.png', 113, 0, 6),
(225, 'Televisions', 'ØªÙ„ÙØ²ÙŠÙˆÙ†Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744456_tvnew.png', 114, 0, 1),
(226, 'Digital cameras', 'ÙƒØ§Ù…ÙŠØ±Ø§Øª Ø¯Ø¬ÙŠØªØ§Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477744469_camera.new.png', 114, 0, 2),
(227, 'Security CCTV', 'ÙƒØ§Ù…ÙŠØ±Ø§Øª Ù…Ø±Ø§Ù‚Ø¨Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744481_cctv.new.png', 114, 0, 3),
(228, 'Air-conditions', 'Ù…ÙƒÙŠÙØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744488_ac.new.png', 114, 0, 4),
(229, 'Navigation ', 'Ø§Ø¬Ù‡Ø²Ø© Ù…Ù„Ø§Ø­Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744527_nav.png', 114, 0, 5),
(230, 'Water filter', 'ÙÙ„Ø§ØªØ± Ù…ÙŠØ§Ù‡', 'http://s3-us-west-2.amazonaws.com/2sale/1477744540_waterhot.new.png', 114, 0, 6),
(231, 'Refrigerators', 'Ø«Ù„Ø§Ø¬Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744549_refrigerator.new.png', 114, 0, 7),
(232, 'Ovens', 'Ø·Ø¨Ø§Ø®Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744560_oven.new.png', 114, 0, 8),
(233, 'Washing machines', 'ØºØ³Ø§Ù„Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744575_wash.new.png', 114, 0, 9),
(234, 'Electric heaters', 'Ø³Ø®Ø§Ù†Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744594_heater.new.png', 114, 0, 10),
(235, 'Stand heaters', 'Ø¯ÙØ§ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744604_heater2.new.png', 114, 0, 11),
(236, 'Printers', 'Ø·Ø§Ø¨Ø¹Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744614_printer.new.png', 114, 0, 12),
(237, 'Electronics technician', 'ÙÙ†ÙŠ Ø§Ù„Ù„ÙƒØªØ±ÙˆÙ†ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744637_technician.new.png', 114, 0, 13),
(238, 'Printer paints', 'Ø§Ø­Ø¨Ø§Ø± Ø·Ø¨Ø§Ø¹Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744649_dots.new.png', 114, 0, 14),
(239, 'Other electronics ', 'Ø§Ø¬Ù‡Ø²Ø© ÙƒÙ‡Ø±Ø¨Ø§Ø¦ÙŠØ© Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477744667_otherele.png', 114, 0, 15),
(240, 'Nokia devices', 'Ø§Ø¬Ù‡Ø²Ø© Ù†ÙˆÙƒÙŠØ§', 'http://s3-us-west-2.amazonaws.com/2sale/1477744685_nokia.png', 115, 0, 1),
(241, 'Fix mobile devices', 'ØªØµÙ„ÙŠØ­ Ø§Ø¬Ù‡Ø²Ø© Ø§Ù„Ù…ÙˆØ¨Ø§ÙŠÙ„', 'http://s3-us-west-2.amazonaws.com/2sale/1477744693_fix.new.png', 115, 0, 2),
(242, 'Other mobile models', 'Ù„Ù„Ø¨ÙŠØ¹ Ù…ÙˆØ¨Ø§ÙŠÙ„Ø§Øª Ù…Ø®ØªÙ„ÙÙ‡', 'http://s3-us-west-2.amazonaws.com/2sale/1477744705_oldmobile.new.png', 115, 0, 3),
(243, 'Mobile accessories', 'Ø§ÙƒØ³Ø³ÙˆØ§Ø±Ø§Øª Ø§Ù„Ù…ÙˆØ¨Ø§ÙŠÙ„Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744519_earaccessnew.png', 114, 0, 4),
(245, 'Mobile accessories', 'Ø§ÙƒØ³Ø³ÙˆØ§Ø±Ø§Øª Ø§Ù„Ù…ÙˆØ¨Ø§ÙŠÙ„Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744727_accessor.new.png', 115, 0, 4),
(246, 'Mobile numbers', 'Ø§Ø±Ù‚Ø§Ù… Ù‡ÙˆØ§ØªÙ Ù…ØªÙ†ÙˆØ¹Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477744737_sim.png', 115, 0, 5),
(247, 'Internet routers', 'Ø±Ø§ÙˆØªØ±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477744746_routers.png', 115, 0, 6),
(248, 'Blackberry devices', 'Ø§Ø¬Ù‡Ø²Ø© Ø¨Ù„Ø§Ùƒ Ø¨ÙŠØ±ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744817_blackberries.png', 115, 0, 7),
(249, 'acer', 'ÙƒÙ…Ø¨ÙŠÙˆØ±Ø§Øª Ø§ÙŠØ³ÙŠØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477744835_acer.new.png', 117, 0, 1),
(250, 'Hp', 'ÙƒÙ…Ø¨ÙŠÙˆØªØ±Ø§Øª Ø§ØªØ¬ Ø¨ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744848_hp.png', 117, 0, 2),
(251, 'DELL', 'ÙƒÙ…Ø¨ÙŠÙˆØªØ±Ø§Øª Ø¯ÙŠÙ„', 'http://s3-us-west-2.amazonaws.com/2sale/1477744857_dell.png', 117, 0, 3),
(252, 'COMPAQ', 'ÙƒÙ…Ø¨ÙŠÙˆØªØ±Ø§Øª ÙƒÙˆÙ…Ø¨Ø§Ùƒ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744866_Compaq.png', 117, 0, 4),
(253, 'SONY', 'ÙƒÙ…Ø¨ÙŠÙˆØªØ±Ø§Øª Ø³ÙˆÙ†ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477744876_sony.png', 117, 0, 5),
(254, 'Computer accessories', 'Ø§ÙƒØ³Ø³ÙˆØ§Ø±Ø§Øª Ø§Ù„ÙƒÙ…Ø¨ÙŠÙˆØªØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477744900_computertools.new.png', 117, 0, 6),
(255, 'Computer technician', 'ÙÙ†ÙŠ ÙƒÙ…Ø¨ÙŠÙˆØªØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477744915_support.png', 117, 0, 7),
(256, 'Other computers', 'Ø§Ø¬Ù‡Ø²Ø© ÙƒÙ…Ø¨ÙŠÙˆØªØ± Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477744980_other.new.png', 117, 0, 8),
(257, 'Men salons', 'ØµØ§Ù„ÙˆÙ†Ø§Øª Ø±Ø¬Ø§Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745001_men.new.png', 118, 0, 1),
(258, 'fitness equipments', 'Ø§Ø¬Ù‡Ø²Ø© ØµØ­ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745019_gym.png', 118, 0, 2),
(259, 'Women salon', 'ØµØ§Ù„ÙˆÙ†Ø§Øª Ù†Ø³Ø§Ø¦ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745032_girl.new.png', 118, 0, 3),
(260, 'Kids Salon', 'ØµØ§Ù„ÙˆÙ†Ø§Øª Ø§Ø·ÙØ§Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745046_kinds.new.png', 118, 0, 4),
(261, 'Girls Gym and institutes ', 'Ù…Ø¹Ø§Ù‡Ø¯ ØµØ­ÙŠØ© Ù†Ø³Ø§Ø¦ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745064_girlsgym.new.png', 118, 0, 5),
(262, 'Salons equipments', 'Ù…Ø³ØªÙ„Ø²Ù…Ø§Øª Ø§Ù„ØµØ§Ù„ÙˆÙ†Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477745076_equ.new.png', 118, 0, 6),
(263, 'Sport equipments', 'Ù…Ø³ØªÙ„Ø²Ù…Ø§Øª Ø±ÙŠØ§Ø¶ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745085_sport.new.png', 118, 0, 7),
(264, 'Gold', 'Ø°Ù‡Ø¨ ÙˆÙØ¶ÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477745107_necklness.new.png', 119, 0, 1),
(265, 'Tailor', 'Ø®ÙŠØ§Ø·', 'http://s3-us-west-2.amazonaws.com/2sale/1477745116_tailor.new.png', 119, 0, 2),
(266, 'Shoe and Bags', 'Ø§Ø­Ø°ÙŠÙ‡ ÙˆØ´Ù†Ø·', 'http://s3-us-west-2.amazonaws.com/2sale/1477745124_shoe.new.png', 119, 0, 3),
(267, 'Bed covers', 'Ø§ØºØ·ÙŠØ© Ø³Ø±ÙŠØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477745133_bedcover.new.png', 119, 0, 4),
(268, 'Dresses', 'ÙØ³Ø§ØªÙŠÙ† Ù†Ø³Ø§Ø¦ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745141_dress.new.png', 119, 0, 5),
(269, 'Fabrics', 'Ø§Ù‚Ù…Ø´Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745151_fab.new.png', 119, 0, 6),
(270, 'Arab clothes', 'Ø¯Ø±Ø§Ø±ÙŠØ¹ ÙˆØ´ÙŠÙ„Ø§Øª ÙˆÙ…Ù„Ø§ÙØ¹', 'http://s3-us-west-2.amazonaws.com/2sale/1477745160_arab.new.png', 119, 0, 7),
(271, 'Women accessories', 'Ø§ÙƒØ³Ø³ÙˆØ±Ø§Ø±Ø§Øª Ù†Ø³Ø§Ø¦ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745169_access5.new.png', 119, 0, 8),
(272, 'Beauty tools', 'Ù…Ø³ØªØ­Ø¶Ø±Ø§Øª ØªØ¬Ù…ÙŠÙ„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745179_beauty.new.png', 119, 0, 9),
(273, 'Other women clothes', 'Ù…Ù„Ø§Ø¨Ø³ Ù†Ø³Ø§Ø¦ÙŠØ© Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477745223_lingerie.new.png', 119, 0, 10),
(274, 'Men shoes', 'Ø§Ø­Ø°ÙŠØ© Ø±Ø¬Ø§Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745237_shoes.new.png', 120, 0, 1),
(275, 'Men wallets', 'Ù…Ø­Ø§ÙØ¸ Ø±Ø¬Ø§Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745244_wallet.new.png', 120, 0, 2),
(276, 'For men only!', 'Ø®Ø§Øµ Ù„Ù„Ø±Ø¬Ø§Ù„ ÙÙ‚Ø·!', 'http://s3-us-west-2.amazonaws.com/2sale/1477745256_menonly.new.png', 120, 0, 3),
(277, 'Traditional clothes', 'Ø§Ø²ÙŠØ§Ø¡ ÙˆØ·Ù†ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745276_arabman.new.png', 120, 0, 4),
(278, 'Men clothes', 'Ù…Ù„Ø§Ø¨Ø³ Ø±Ø¬Ø§Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745301_menclothes.new.png', 120, 0, 5),
(279, 'Men tailors', 'Ø®ÙŠØ§Ø· Ø±Ø¬Ø§Ù„ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477745313_tailor2.new.png', 120, 0, 6),
(280, 'Men rings', 'Ø®ÙˆØ§ØªÙ… Ùˆ Ø§Ø­Ø¬Ø§Ø± ÙˆÙ…Ø³Ø§Ø¨ÙŠØ­', 'http://s3-us-west-2.amazonaws.com/2sale/1477745326_ring.png', 120, 0, 7),
(281, 'We buy furniture', 'Ù†Ø´ØªØ±ÙŠ Ø§Ù„Ø§Ø«Ø§Ø«', 'http://s3-us-west-2.amazonaws.com/2sale/1477745344_webuy.png', 121, 0, 1),
(282, 'Home furniture', 'Ø§Ø«Ø§Ø« Ù…Ù†Ø²Ù„ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477745353_furniture.new.png', 121, 0, 2),
(283, 'Curtains', 'Ø³ØªØ§Ø¦Ø±', 'http://s3-us-west-2.amazonaws.com/2sale/1477745376_satayer.new.png', 121, 0, 3),
(284, 'Desk furniture', 'Ø§Ø«Ø§Ø« Ù…ÙƒØªØ¨ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477745402_athath.new.png', 121, 0, 4),
(285, 'Kitches', 'Ù…Ø·Ø§Ø¨Ø®', 'http://s3-us-west-2.amazonaws.com/2sale/1477745417_ma6abekh.new.png', 121, 0, 5),
(286, 'Medical furniture', 'ÙØ±Ø´ Ø·Ø¨ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477745428_medicalbed.new.png', 121, 0, 6),
(287, 'Carpets', 'Ø§Ù„Ø³Ø¬Ø§Ø¯', 'http://s3-us-west-2.amazonaws.com/2sale/1477745450_sejad.new.png', 121, 0, 7),
(288, 'Lining', 'ØªÙ†Ø¬ÙŠØ¯', 'http://s3-us-west-2.amazonaws.com/2sale/1477745479_tanjed.new.png', 121, 0, 8),
(289, 'Home utilities', 'Ø§Ø¯ÙˆØ§Øª Ù…Ù†Ø²Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745488_welcome.new.png', 121, 0, 9),
(296, 'Home maid support', 'Ù…Ø¹Ø§Ù…Ù„Ø§Øª Ø®Ø¯Ù…', 'http://s3-us-west-2.amazonaws.com/2sale/1477745578_support2.new.png', 123, 0, 1),
(297, 'Kids maid', 'Ù…Ø±Ø¨ÙŠØ© Ø§Ø·ÙØ§Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745591_maid.new.png', 123, 0, 2),
(298, 'Home maids', 'Ø¹Ø§Ù…Ù„Ø§Øª Ù…Ù†Ø²Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745604_homemaid.new.png', 123, 0, 3),
(299, 'Chef', 'Ø·Ø¨Ø§Ø® ÙˆØ·Ø¨Ø§Ø®Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477745611_chef.new.png', 123, 0, 4),
(300, 'Drivers', 'Ø³Ø§Ø¦Ù‚', 'http://s3-us-west-2.amazonaws.com/2sale/1477745618_driver.new.png', 123, 0, 5),
(301, 'Nurse', 'Ù…Ù…Ø±Ø¶Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745625_nurse.new.png', 123, 0, 6),
(302, 'Other needs', 'Ù…Ø·Ù„ÙˆØ¨ Ø¹Ù…Ø§Ù„Ø© Ù…Ø®ØªÙ„ÙØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745638_otherthings.new.png', 123, 0, 7),
(303, 'Video games', 'Ø§Ù„Ø¹Ø§Ø¨ Ø§Ù„ÙÙŠØ¯ÙŠÙˆ', 'http://s3-us-west-2.amazonaws.com/2sale/1477745658_videogames.png', 124, 0, 1),
(304, 'Remote control games', 'Ø§Ù„Ø¹Ø§Ø¨ Ù„Ø§Ø³Ù„ÙƒÙŠÙ‡', 'http://s3-us-west-2.amazonaws.com/2sale/1477745671_rc.new.png', 124, 0, 2),
(305, 'Kids toys', 'Ø§Ù„Ø¹Ø§Ø¨ Ø§Ù„Ø§Ø·ÙØ§Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745685_kidstoys.new.png', 124, 0, 3),
(306, 'Other toys', 'Ø§Ù„Ø¹Ø§Ø¨ Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477745697_othertoys.new.png', 124, 0, 4),
(307, 'XBOX', 'Ø§ÙƒØ³ Ø¨ÙˆÙƒØ³', 'http://s3-us-west-2.amazonaws.com/2sale/1477745706_xbox.new.png', 124, 0, 5),
(308, 'PlayStation', 'Ø¨Ù„Ø§ÙŠ Ø³ØªÙŠØ´Ù†', 'http://s3-us-west-2.amazonaws.com/2sale/1477745715_playstation.png', 124, 0, 6),
(309, 'XBOX CDs', 'Ø³ÙŠØ¯ÙŠØ§Øª Ø§ÙƒØ³ Ø¨ÙˆÙƒØ³', 'http://s3-us-west-2.amazonaws.com/2sale/1477745725_xbox3.new.png', 124, 0, 7),
(310, 'PlayStation CDs', 'Ø³ÙŠØ¯ÙŠØ§Øª Ø¨Ù„ÙŠ Ø³ØªÙŠØ´Ù†', 'http://s3-us-west-2.amazonaws.com/2sale/1477745736_playstationcd.png', 124, 0, 8),
(311, 'Camels', 'Ø§Ù„Ø£Ø¨Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745758_camels.new.png', 125, 0, 1),
(312, 'Cats', 'Ù‚Ø·Ø·', 'http://s3-us-west-2.amazonaws.com/2sale/1477745766_cat.new.png', 125, 0, 2),
(313, 'Dogs', 'ÙƒÙ„Ø§Ø¨', 'http://s3-us-west-2.amazonaws.com/2sale/1477745779_dog.new.png', 125, 0, 3),
(314, 'Sheeps', 'Ø§Ù„Ù…Ø§Ø´ÙŠÙ‡', 'http://s3-us-west-2.amazonaws.com/2sale/1477745787_sheep.new.png', 125, 0, 4),
(315, 'Horse', 'Ø§Ù„Ø®ÙŠÙ„', 'http://s3-us-west-2.amazonaws.com/2sale/1477745796_horse.new.png', 125, 0, 5),
(316, 'Pet tools', 'Ù…Ø¹Ø¯Ø§Øª Ø§Ù„Ø­ÙŠÙˆØ§Ù†Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477745804_pettool.new.png', 125, 0, 6),
(317, 'Pets Care', 'Ø±Ø§Ø¹ÙŠØ© Ø§Ù„Ù…Ø§Ø´ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745812_petcare2.new.png', 125, 0, 7),
(318, 'Pet health', 'Ø®Ø¯Ù…Ø§Ø© Ø§Ù„Ù…Ø§Ø´ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745823_petcare3.new.png', 125, 0, 8),
(319, 'Pets food', 'Ø§Ù„Ø§Ø¹Ù„Ø§Ù', 'http://s3-us-west-2.amazonaws.com/2sale/1477745833_petsfood.new.png', 125, 0, 9),
(320, 'Talk birds', 'Ø·ÙŠÙˆØ± Ù†Ø§Ø·Ù‚Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745853_bird1.new.png', 126, 0, 1),
(321, 'Birds sings', 'Ø·ÙŠÙˆØ± Ù…ØºØ±Ø¯Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745873_birds.new.png', 126, 0, 2),
(322, 'Pigeons', 'Ø§Ù„Ø­Ù…Ø§Ù… Ø¨Ø§Ù†ÙˆØ§Ø¹Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477745882_pigeons.new.png', 126, 0, 3),
(323, 'Chicken', 'Ø§Ù„Ø¯ÙˆØ§Ø¬Ù† Ø¨Ø§Ù†ÙˆØ§Ø¹Ù‡', 'http://s3-us-west-2.amazonaws.com/2sale/1477745908_rooster.new.png', 126, 0, 4),
(324, 'Sharp birds', 'Ø§Ù„Ø·ÙŠÙˆØ± Ø§Ù„Ø¬Ø§Ø±Ø­Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746021_falconnew.png', 126, 0, 5),
(325, 'Birds tools', 'Ù…Ø¹Ø¯Ø§Øª Ø§Ù„Ø·ÙŠÙˆØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477746034_cage.new.png', 126, 0, 6),
(326, 'Secretary ', 'Ø³ÙƒØ±ØªØ§Ø±ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746058_secretary.new.png', 127, 0, 1),
(327, 'IT', 'ØªÙ‚Ù†ÙŠØ© Ø§Ù„Ù…Ø¹Ù„ÙˆÙ…Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477746068_internet.new.png', 127, 0, 2),
(328, 'Managers', 'Ù…Ø¯Ø±Ø§Ø¡', 'http://s3-us-west-2.amazonaws.com/2sale/1477746077_manager.new.png', 127, 0, 3),
(329, 'Graphic designer', 'Ù…ØµÙ…Ù…ÙŠÙ† Ø¬Ø±Ø§ÙÙŠÙƒ', 'http://s3-us-west-2.amazonaws.com/2sale/1477746089_graphic.new.png', 127, 0, 4),
(330, 'Memebers', 'Ø§Ø¯Ø§Ø±ÙŠÙŠÙ†', 'http://s3-us-west-2.amazonaws.com/2sale/1477746101_managers.new.png', 127, 0, 5),
(331, 'Online services', 'Ø®Ø¯Ù…Ø§Øª Ø§Ù„Ù„ÙƒØªØ±ÙˆÙ†ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746135_mobile2.new.png', 127, 0, 6),
(332, 'Engineers', 'Ù…Ù‡Ù†Ø¯Ø³ÙŠÙ†', 'http://s3-us-west-2.amazonaws.com/2sale/1477746153_engineer.new.png', 127, 0, 7),
(333, 'Lawyers', 'Ù…Ø­Ø§Ù…ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477746177_lawyer.new.png', 127, 0, 8),
(334, 'Finance', 'Ù…Ø­Ø§Ø³Ø¨Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746189_finance.new.png', 127, 0, 9),
(335, 'Other Jobs', 'ÙˆØ¸Ø§Ø¦Ù Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477746201_jobs.new.png', 127, 0, 10),
(336, 'Hairdresser', 'ÙƒÙˆØ§ÙÙŠØ± ÙˆØ­Ù„Ø§Ù‚', 'http://s3-us-west-2.amazonaws.com/2sale/1477746210_hairdresser.new.png', 127, 0, 11),
(337, 'Other deals', 'Ø®Ø¯Ù…Ø§Øª Ù…Ø®ØªÙ„ÙØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746220_deal.new.png', 127, 0, 12),
(338, 'Kuwaiti food', 'Ø§Ù„Ù…Ø·Ø¨Ø® Ø§Ù„ÙƒÙˆÙŠØªÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477746241_kuwait.new.png', 128, 0, 1),
(339, 'Arabian food', 'Ø§Ù„Ù…Ø·Ø¨Ø® Ø§Ù„Ø¹Ø±Ø¨ÙŠ', 'http://s3-us-west-2.amazonaws.com/2sale/1477746251_arabman.new.png', 128, 0, 2),
(340, 'Sweets', 'Ø§Ù„Ø­Ù„ÙˆÙŠØ§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477746262_sweet.new.png', 128, 0, 3),
(341, 'Honey', 'Ø§Ù„Ø¹Ø³Ù„', 'http://s3-us-west-2.amazonaws.com/2sale/1477746270_honey.new.png', 128, 0, 4),
(343, 'Sea food', 'Ø§Ù„Ø§Ø³Ù…Ø§Ùƒ', 'http://s3-us-west-2.amazonaws.com/2sale/1477746326_seafood.new.png', 128, 0, 6),
(344, 'Dates', 'Ø§Ù„ØªÙ…ÙˆØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477746318_dates.new.png', 128, 0, 5),
(345, 'Steak', 'Ø§Ù„Ù„Ø­ÙˆÙ…', 'http://s3-us-west-2.amazonaws.com/2sale/1477746334_steal.new.png', 128, 0, 7),
(346, 'Other food', 'Ø§Ø·Ø¹Ù…Ø© Ø§Ø®Ø±Ù‰', 'http://s3-us-west-2.amazonaws.com/2sale/1477746344_otherfood.new.png', 128, 0, 8),
(347, 'Incense', 'Ø§Ù„Ø¨Ø®ÙˆØ±', 'http://s3-us-west-2.amazonaws.com/2sale/1477746360_incense.new.png', 129, 0, 1),
(348, 'Female Perfumes', 'Ø¹Ø·ÙˆØ± Ù†Ø³Ø§Ø¦ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746388_perfume.new.png', 129, 0, 2),
(350, 'Men prefumes', 'Ø¹Ø·ÙˆØ±Ø§Øª Ø±Ø¬Ø§Ù„ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746399_menperfume.new.png', 129, 0, 3),
(351, 'Random gifts', 'Ù‡Ø¯Ø§ÙŠØ§ Ù…Ø®ØªÙ„ÙØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746408_gifts.new.png', 129, 0, 4),
(352, 'Female and male watches', 'Ø³Ø§Ø¹Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477746417_watch.new.png', 129, 0, 5),
(353, 'Bags', 'Ø¬Ù†Ø§Ø·', 'http://autoigs.com/mediacms/admin/category_images/bag.new.png', 129, 0, 6),
(354, 'Sunglasses', 'Ù†Ø¸Ø§Ø±Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477746433_sun.png', 129, 0, 7),
(355, 'Pen', 'Ø§Ù‚Ù„Ø§Ù…', 'http://s3-us-west-2.amazonaws.com/2sale/1477746444_pen.png', 129, 0, 8),
(356, 'Whole sale', 'Ù…Ø¨ÙŠØ¹Ø§Øª Ø§Ù„Ø¬Ù…Ù„Ø©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746465_wholesale.new.png', 130, 0, 1),
(357, 'Lost and found', 'Ø§Ù„Ù…ÙÙ‚ÙˆØ¯Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477746474_lost.new.png', 130, 0, 2),
(358, 'Art paint', 'Ù„ÙˆØ­Ø§Øª ÙÙ†ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746483_art.new.png', 130, 0, 3),
(359, 'Music equipments', 'Ø§Ø¯Ø§ÙˆØ§Øª Ù…ÙˆØ³ÙŠÙ‚ÙŠØ©', 'http://s3-us-west-2.amazonaws.com/2sale/1477746496_guitar.new.png', 130, 0, 4),
(360, 'Parties', 'Ù…Ø³ØªÙ„Ø²Ù…Ø§Øª Ø§Ù„Ø­ÙÙ„Ø§Øª', 'http://s3-us-west-2.amazonaws.com/2sale/1477675216_party.png', 0, 0, 29),
(361, 'dentist clinics', 'Ø¹ÙŠØ§Ø¯Ø§Øª Ø§Ø³Ù†Ø§Ù†', 'http://s3-us-west-2.amazonaws.com/2sale/1483192639_icon3.png', 108, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `comment_dt` datetime DEFAULT NULL,
  `item_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paiements`
--

CREATE TABLE `paiements` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `ref` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `payid` varchar(255) NOT NULL,
  `crdtype` varchar(255) NOT NULL,
  `trackid` varchar(255) NOT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `postimage`
--

CREATE TABLE `postimage` (
  `id` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `image_url` varchar(1024) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8961 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `title` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `post_dt` datetime NOT NULL,
  `image_url` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `post_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8 NOT NULL,
  `number` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `approved` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sticky` int(11) DEFAULT '0',
  `sticky_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `profile_id`, `title`, `content`, `post_dt`, `image_url`, `post_type`, `post_status`, `number`, `approved`, `category_id`, `price`, `sticky`, `sticky_date`) VALUES
(134, 598, 'Ø§Ù„Ù…Ø§Ø±ÙƒØ©: Ù„Ø§Ù†Ø¯ Ø±ÙˆÙØ±\nØ§Ù„Ù…ÙˆØ¯ÙŠÙ„: HSE 4.4\nØ§Ù„Ø³Ù†Ø©: 2015\nØ§Ù„Ø³Ø¹Ø±: Ø¥ØªØµÙ„\nØ§Ù„Ù…Ø§Ù„Ùƒ:66584448\nØ§Ù„Ù„ÙˆÙ†: Ø£Ø¨ÙŠØ¶\nØ§Ù„Ø¯ÙˆÙ„Ø©: Ø§Ù„ÙƒÙˆÙŠØªÂ \nØ§Ù„Ù…Ø³Ø§ÙØ©:\n17000 ÙƒÙ…Â \nØ§Ù„ÙˆØµÙ:Â \nÙƒØ§Ù…Ù„ Ø§Ù„Ù…ÙˆØ§ØµÙØ§Øª - ÙˆÙƒØ§Ù„Ø© Ø§Ù„ÙƒÙˆÙŠØª - F1 ØªÙŠØ¨ØªØ±ÙˆÙ†ÙŠÙƒ - Ø¨Ø­Ø§Ù„Ø© Ù…Ù…ØªØ§Ø²Ø© - Ø¬Ù„Ø¯ Ø¨ÙŠØ¬ - Ø«Ù…Ø§Ù†ÙŠØ© Ø³Ù„Ù†Ø¯Ø± - Ø´Ø§Ø´Ø© - ÙØªØ­Ø© - Ø³ÙŠ Ø¯ÙŠ - Ø¯ÙŠ ÙÙŠ Ø¯ÙŠ - Ù†Ø§ÙÙŠØ¬Ø´Ù† - Ø²Ù†ÙˆÙ† - Ø¨ØµÙ…Ø© - Ø¨Ù„ÙˆØªÙˆØ« -Ù…ÙŠÙ…ÙˆØ±ÙŠ - Ø³Ù†Ø³Ø± - ØªØ­ÙƒÙ… Ø³ÙƒØ§Ù† - Ø³ÙŠØ±ÙØ³ Ù…Ù†ØªØ¸Ù… - Ø§Ù„Ù…Ø§Ù„Ùƒ Ø§Ù„Ø§ØµÙ„ÙŠ - ØªØ£Ù…ÙŠÙ† Ø´Ø§Ù…Ù„ - ØªØ­Øª Ø§Ù„ÙƒÙØ§Ù„Ø© - ØµØ¨Øº Ø§Ù„ÙˆÙƒØ§Ù„Ø© - ÙƒØ§Ù…ÙŠØ±Ø§ - Ø¨Ø§Ù†ÙˆØ±Ø§Ù…Ø§ - Ø£Ø¨ÙˆØ§Ø¨ Ø´ÙØ· - ØªØ¸Ù„ÙŠÙ„ Ø­Ø±Ø§Ø±ÙŠ - Ø­Ù…Ø§ÙŠØ© - Ø´Ø§Ø´Ø© Ø«Ø±ÙŠ Ø¯ÙŠ - Ø±Ù†Ø¬Ø§Øª Ø£ØµÙ„ÙŠØ© 21 - Ø´Ø±Ø· Ø§Ù„ÙØ­Øµ - Ù„Ù„Ø¬Ø§Ø¯ÙŠÙ† ÙÙ‚Ø·', NULL, '2016-10-06 15:58:26', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475794657724.jpg', 'photo', 'active', '66584448', 0, 152, '0', 0, NULL),
(135, 598, 'ØªÙˆØ²ÙŠØ¹Ø§Øª Ø¹Ø·Ø±ÙŠØ© Ù…Ø±ÙƒØ²Ù‡ Ù„Ù„Ù…Ù†Ø§Ø³Ø¨Ø§Øª Ù„Ø¯Ù‰ Ø¹Ø¨Ù‚ Ù„Ù„Ø¹Ø·ÙˆØ±...', NULL, '2016-10-07 05:29:54', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475843393106.jpg', 'photo', 'active', '96739704', 1, 348, '12', 0, NULL),
(137, 0, 'Ø·ÙŠØ± Ù„ÙˆØ±ÙŠ Ø±ÙŠÙ†Ø¨Ùˆ Ù„Ù„Ø¨ÙŠØ¹', NULL, '2016-10-07 09:54:59', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475859270752.jpg', 'photo', 'active', '50209858', 1, 320, '135', 0, NULL),
(138, 598, 'BMW745Li  ÙƒØ§Ù…Ù„ Ù…ÙˆØ§ØµÙØ§Øª Ù…ÙˆØ¯ÙŠÙ„ 2004', NULL, '2016-10-07 09:56:45', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475859398751.jpg', 'photo', 'active', '50209858', 1, 152, '2150', 0, '2017-02-15 12:59:40'),
(139, 0, 'ØºØ±ÙØ© Ø¯Ø§Ø®Ù„ Ø§Ù„Ø´Ù‚Ø© Ù…Ø¤Ø«Ø«Ø© Ø¨Ø§Ù„ÙƒØ§Ù…Ù„ Ù„Ù„Ø§ÙŠØ¬Ø§Ø±. Ø­Ù…Ø§Ù… Ø®Ø§Øµ .Ù…Ø·Ù„ÙˆØ¨ ØºÙŠØ± Ù…Ø¯Ø®Ù† Ùˆ Ù…Ù„ØªØ²Ù… ', NULL, '2016-10-07 09:59:37', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475859554160.jpg', 'photo', 'active', '50209858', 1, 135, '135', 0, NULL),
(140, 0, 'Chevrolet', NULL, '2016-10-07 18:50:49', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475891447786.jpg', 'photo', 'active', '99115525', 1, 151, '5800', 0, NULL),
(141, 0, 'Ù†Ø´ØªØ±ÙŠ Ø§Ù„Ø§Ø«Ø§Ø« Ø§Ù„Ù…Ø³ØªØ¹Ù…Ù„ ÙˆØ¬Ø¯ÙŠØ¯ ', NULL, '2016-10-08 00:11:03', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475910658946.jpg', 'photo', 'active', '65657730', 1, 281, '000', 0, NULL),
(142, 0, 'Ø´Ø±Ø§Ø¡ Ø§Ù„Ø§Ø«Ø§Ø« Ø§Ù„Ù…Ø³ØªØ¹Ù…Ù„ ', NULL, '2016-10-08 00:12:18', 'http://autoigs.com/mediacms/admin/user_media/um_0_1475910734224.jpg', 'photo', 'active', '65657730', 1, 281, '000', 0, NULL),
(143, 0, 'Ù…Ù‚Ø§ÙˆÙ„ ØµØ­Ù‰', NULL, '2016-10-11 11:16:34', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476210350512.jpg', 'photo', 'active', '97104788', 1, 184, '00', 0, NULL),
(144, 0, 'ÙƒØ¨Ø¨ Ù„Ø¨Ù†Ø§Ù†ÙŠØ© 50 Ø­Ø¨Ø© ', NULL, '2016-10-12 03:01:26', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476266485278.jpg', 'photo', 'active', '99352510', 1, 345, '8', 0, NULL),
(145, 0, 'Ù†Ù€Ù‚Ù„ Ø¹ÙØ´ 65512014\nØ£Ø®ØµØ§Ø¦ÙŠÙˆÙ†\nÙÙ€Ùƒ ÙˆÙ†Ù€Ù‚Ù„ ÙˆØªØ±ÙƒÙ€Ù€Ù€Ù€Ù€ÙŠØ¨ ØªØºÙ„ÙŠÙ€Ù€Ù€Ù ÙˆÙ†Ù‚Ù„ Ø¯Ø§Ø®Ù„ Ø§Ù„Ù…Ù†Ø²Ù„\nØ¬Ù…ÙŠÙ€Ù€Ø¹ Ø§Ù†ÙˆØ§Ø¹ Ø§Ù„Ø§Ø«Ø§Ø« Ø§Ù„Ù…Ù†Ø²Ù„Ù‰ ÙˆØ§Ù„Ù…ÙƒØªØ¨Ù‰ ÙˆØºØ±Ù \nØ§Ù„Ù†ÙˆÙ…\nÙ†Ø¬Ø§Ø± Ø£ÙŠÙƒÙŠØ§- Ù…ÙŠØ¯Ø§Ø³- Ø§ÙˆØ±ÙˆØ¨Ù‰-ØµÙŠÙ†Ù‰- Ù…Ø­Ù„Ù‰\nØ®Ø¯Ù…Ø© 24 Ø³Ø§Ø¹Ø© Ø¯Ø§Ø®Ù„ Ø§Ù„Ù…Ù†Ø²Ù„ \npacking- moving-services', NULL, '2016-10-12 14:30:14', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476307812245.jpg', 'photo', 'active', '65512014', 1, 295, '00', 0, NULL),
(146, 0, 'Ø¨ÙŠØ¹ ÙˆØ´Ø±Ø§Ø¡ Ø§Ù„Ø§Ø«Ø§Ø« Ø§Ù„Ù…Ø³ØªØ¹Ù…Ù„ ', NULL, '2016-10-12 16:55:51', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476316548978.jpg', 'photo', 'active', '65657730', 1, 281, '100', 0, NULL),
(147, 0, 'ØªØ¹Ù„Ù† Ø´Ø±ÙƒØ© Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…Ø­Ø§ÙØ¸ Ø§Ù„Ø¹Ù‚Ø§Ø±ÙŠØ© Ø¹Ù† ØªÙˆÙØ± Ø´Ù‚Ù‡  Ù„Ù„Ø¥ÙŠØ¬Ø§Ø± ÙÙŠ Ø§Ù„Ø²Ù‡Ø±Ø§Ø¡ Ù…ÙƒÙˆÙ†Ù‡ Ù…Ù† 2 ØºØ±ÙØ© Ù†ÙˆÙ… Ùˆ 2 Ø­Ù…Ø§Ù… ÙˆÙ…Ø·Ø¨Ø® ÙˆØµØ§Ù„Ù‡ Ù„Ù„Ø§ØªØµØ§Ù„ Ø¨Ù†Ø§ : 55947200', NULL, '2016-10-13 04:02:25', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476356542865.jpg', 'photo', 'active', '55947200', 1, 77, '450', 0, NULL),
(148, 0, 'ØªØ¹Ù„Ù† Ø´Ø±ÙƒØ© Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…Ø­Ø§ÙØ¸ Ø§Ù„Ø¹Ù‚Ø§Ø±ÙŠØ© Ø¹Ù† Ø§Ø³ØªØ¹Ø¯Ø§Ø¯Ù‡Ø§ Ù„Ø¥Ø¯Ø§Ø±Ø© Ø¬Ù…ÙŠØ¹ Ø§Ù†ÙˆØ§Ø¹ Ø§Ù„Ø¹Ù‚Ø§Ø±Ø§Øª Ø¨Ø­Ø±ÙÙŠÙ‡ Ø¹Ø§Ù„ÙŠÙ‡ Ø§Ø³ØªØ«Ù…Ø§Ø±ÙŠ - ØªØ¬Ø§Ø±ÙŠ Ù„Ù„Ø§ØªØµØ§Ù„ Ø¨Ù†Ø§ : 55947200', NULL, '2016-10-13 04:07:57', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476356876936.jpg', 'photo', 'active', '55947200', 1, 337, '5', 0, NULL),
(149, 0, 'ÙÙ†ÙŠ ÙƒÙ‡Ø±Ø¨Ø§Ø¦ÙŠ Ù…Ù†Ø§Ø²Ù„ Ø¬Ù…ÙŠØ¹ Ø§Ø¹Ù…Ø§Ù„ Ø§Ù„ÙƒÙ‡Ø±Ø¨Ø§Ø¡ ØªÙ…Ø¯ÙŠØ¯..Ù…Ø­Ù„Ø§Øª .Ù…ÙƒØ§ØªØ¨.Ø´Ø§Ù„Ù‡ÙŠØ§Øª.ØºØ±Ù.Ù…Ù„Ø§Ø­Ù‚.Ù…Ø¬Ù…Ø¹Ø§Øª.Ù‚Ø³Ø§ÙŠÙ…..ØªØ±ÙƒÙŠØ¨ Ø¬Ù…ÙŠØ¹ Ø§Ù†ÙˆØ§Ø¹ Ø§Ù„Ù„Ù…Ø¨Ø§Øª ÙˆØ§Ù„ØªØ±ÙŠØ§Øª ÙˆØ§Ù„Ù…Ø®ÙÙŠ .ÙˆØ¹Ù…Ù„ Ø¬Ù…ÙŠØ¹ Ø§Ù†ÙˆØ§Ø¹ Ø§Ù„Ø´Ø¨ÙƒØ§Øª.Ø§Ù†ØªØ±Ø§Ù†Øª ÙƒØ§Ù…Ù„..Ø³ØªØ§Ù„Ø§ÙŠØª Ù…Ø±ÙƒØ²ÙŠ ÙˆØ¹Ø§Ø¯ÙŠ.ØªÙ„ÙŠÙÙˆÙ†Ø§Øª.Ø§Ù†ØªØ±Ø§ÙƒÙ….ÙƒØ§Ù…ÙŠØ±Ø§Øª.ÙˆØ§ØµÙ„Ø§Ø­ Ø¬Ù…ÙŠØ¹ Ø§Ù„Ø§Ø¹Ø·Ø§Ù„50079749', NULL, '2016-10-13 20:57:46', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476417468832.jpg', 'photo', 'active', '50079749', 1, 198, '50079749', 0, NULL),
(150, 0, 'Ø§ÙˆØ¯ÙŠ A8L Ø³Ù†Ù‡ Ù¢Ù Ù Ù¦', NULL, '2016-10-14 22:20:02', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476508777868.jpg', 'photo', 'active', '99292040', 1, 152, '1000', 0, NULL),
(151, 0, 'Ø§ÙˆØ¯ÙŠ Ù…Ø¯ÙŠÙ„ Ù¢Ù Ù Ù¦ ÙÙŠÙ‡Ø§ Ù…Øº Ø§Ù„Ø®ÙŠØ± ØªØ¹Ø¨Ø§Ù† ÙŠØ¹Ù†ÙŠ ØªØ¨ÙŠ Ù‚ÙŠØ± Ø¨Ø³ ', NULL, '2016-10-14 22:49:15', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476510530838.jpg', 'photo', 'active', '67776859', 1, 158, '1100', 0, NULL),
(152, 0, 'ÙÙ†Ù‰ ÙƒÙ‡Ø±Ø¨Ø§Ø¦Ù‰ Ù…Ù†Ø§Ø²Ù„ 24 Ø³Ø§Ø¹Ù‡ ØªØµÙ„ÙŠØ­ Ø§Ù„Ø§Ø¹Ø·Ø§Ù„ Ù†Ù‚ÙˆÙ… Ø¨Ø¬Ù…ÙŠØ¹ Ø§Ù„ØªÙ…Ø¯Ø§ÙŠØ¯Øª Ø§Ù„ÙƒÙ‡Ø±Ø¨Ø§Ø¦Ù‰ ÙˆØªØ±ÙƒÙŠØ¨ Ø¬Ù…ÙŠØ¹ Ø§Ù„Ø§Ø¶Ø§Ø¡ ', NULL, '2016-10-15 11:20:36', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476555635780.jpg', 'photo', 'active', '97548211', 1, 198, '97548211', 0, NULL),
(153, 0, 'ÙÙ†Ù‰ ÙƒÙ‡Ø±Ø¨Ø§Ø¦Ù‰ Ù…Ù†Ø§Ø²Ù„ 24 Ø³Ø§Ø¹Ù‡ ØªØµÙ„ÙŠØ­ Ø§Ù„Ø§Ø¹Ø·Ø§Ù„ ÙˆØªØ±ÙƒÙŠØ¨ Ø¬Ù…ÙŠØ¹ Ø§Ù„Ø§Ø¶Ø§Ø¡  ÙˆÙ†Ù‚ÙˆÙ… Ø¨Ø¬Ù…ÙŠØ¹ Ø§Ù„ØªÙ…Ø¯Ø§ÙŠØ¯ Ø§Ù„ÙƒÙ‡Ø±Ø¨Ø§Ø¦Ù‰ ', NULL, '2016-10-16 04:07:47', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476607540761.jpg', 'photo', 'active', '97548211', 1, 198, '00', 0, NULL),
(154, 0, 'Ù†Ù€Ù‚Ù„ Ø¹ÙØ´ 65512014 Ø§Ø¨ÙˆÙŠÙˆØ³Ù\nØ£Ø®ØµØ§Ø¦ÙŠÙˆÙ†\nÙÙ€Ùƒ*Ù†Ù€Ù‚Ù„*ØªØ±ÙƒÙ€Ù€Ù€Ù€Ù€ÙŠØ¨* ØªØºÙ„ÙŠÙ€Ù€Ù€Ù ÙˆÙ†Ù‚Ù„ Ø¯Ø§Ø®Ù„ Ø§Ù„Ù…Ù†Ø²Ù„\nØ¬Ù…ÙŠÙ€Ù€Ø¹ Ø§Ù†ÙˆØ§Ø¹ Ø§Ù„Ø§Ø«Ø§Ø« Ø§Ù„Ù…Ù†Ø²Ù„Ù‰ ÙˆØ§Ù„Ù…ÙƒØªØ¨Ù‰ ÙˆØºØ±Ù \nØ§Ù„Ù†ÙˆÙ…\nÙ†Ø¬Ø§Ø±\n( Ø£ÙŠÙƒÙŠØ§- Ù…ÙŠØ¯Ø§Ø³- Ø§ÙˆØ±ÙˆØ¨Ù‰-ØµÙŠÙ†Ù‰- Ù…Ø­Ù„Ù‰)\nØ®Ø¯Ù…Ø© 24 Ø³Ø§Ø¹Ø© Ø¯Ø§Ø®Ù„ Ø§Ù„Ù…Ù†Ø²Ù„ \nØ´Ø¹Ø§Ø±Ù†Ø§ Ù‡Ùˆ\nÙÙ€Ù€Ù€Ù€Ù€Ù€Ù€Ù€Ù€ÙƒØ± Ø¬Ø¯ÙŠÙ€Ù€Ù€Ù€Ø¯ + Ø§Ø¯Ø§Ø¡ Ù…ØªÙ…ÙŠØ²= Ø§Ø¨Ù€Ù€Ù€Ù€Ù€Ù€Ø¯Ø§Ø¹ \nÙ‡Ø¯ÙÙ†Ù€Ù€Ù€Ù€Ù€Ù€Ø§ Ø±Ø§Ø­ØªÙƒÙ… ÙˆØ³Ù„Ø§Ù…Ø© Ø§ØºØ±Ø§Ø¶ÙƒÙ… Ø¨Ø¹ÙˆÙ† \nØ§Ù„Ù„Ù€Ù€Ù€Ù€Ù€Ù€Ù€Ù€Ù‡ \nÙ‚Ø³Ù… Ø®Ø§Øµ Ù„Ù„ØªØºÙ„ÙŠÙ vib\nØ®Ø¯Ù…Ø§Øª Ø§Ù„Ù†Ù‚Ù„ ÙˆØ§Ù„ØªØºÙ„ÙŠÙ/\npacking- moving-services\nÙŠØ±Ø¬Ù‰ Ø§Ù„Ø§ØªØµØ§Ù„ Ø¹Ù„Ù‰ Ø§Ù„Ø®Ø· Ø§Ù„Ø³Ø§Ø®Ù† \n65512014', NULL, '2016-10-17 03:01:27', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476698486579.jpg', 'photo', 'active', '65512014', 1, 294, '00', 0, NULL),
(155, 0, 'Ø§Ø¯ÙˆØ§Øª ØµØ­ÙŠØ©', NULL, '2016-10-17 03:47:35', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476701252603.jpg', 'photo', 'active', '51088854', 1, 184, '0', 0, NULL),
(161, 0, 'Ù„Ù„Ø¨ÙŠØ¹ Ø§Ù„ØªÙŠÙ…Ø§ 2012 ÙƒØ§Ù…Ù„ Ø§Ù„Ù…ÙˆØ§ØµÙØ§Øª Ù…Ù† ØºÙŠØ± ÙØªØ­Ø© 9804767 Ù‚ÙŠØ± Ù…ÙƒÙŠÙ†Ø© Ø´Ø§ØµÙŠ Ø¨Ø­Ø§Ù„Ø© Ù…Ù…ØªØ§Ø²Ø© ', NULL, '2016-10-19 20:39:09', 'http://autoigs.com/mediacms/admin/user_media/um_0_1476934749373.jpg', 'photo', 'active', '+96598047676', 1, 153, '2500', 0, NULL),
(163, 0, 'Ù†Ù€Ù‚Ù„ Ø¹ÙØ´ 65512014\nØ£Ø®ØµØ§Ø¦ÙŠÙˆÙ†\nÙÙ€Ùƒ ÙˆÙ†Ù€Ù‚Ù„ ÙˆØªØ±ÙƒÙ€Ù€Ù€Ù€Ù€ÙŠØ¨ ØªØºÙ„ÙŠÙ€Ù€Ù€Ù ÙˆÙ†Ù‚Ù„ Ø¯Ø§Ø®Ù„ Ø§Ù„Ù…Ù†Ø²Ù„\nØ¬Ù…ÙŠÙ€Ù€Ø¹ Ø§Ù†ÙˆØ§Ø¹ Ø§Ù„Ø§Ø«Ø§Ø« Ø§Ù„Ù…Ù†Ø²Ù„Ù‰ ÙˆØ§Ù„Ù…ÙƒØªØ¨Ù‰ ÙˆØºØ±Ù \nØ§Ù„Ù†ÙˆÙ…\nÙ†Ø¬Ø§Ø± Ø£ÙŠÙƒÙŠØ§- Ù…ÙŠØ¯Ø§Ø³- Ø§ÙˆØ±ÙˆØ¨Ù‰-ØµÙŠÙ†Ù‰- Ù…Ø­Ù„Ù‰\nØ®Ø¯Ù…Ø© 24 Ø³Ø§Ø¹Ø© Ø¯Ø§Ø®Ù„ Ø§Ù„Ù…Ù†Ø²Ù„ \npacking- moving-services', NULL, '2016-10-22 01:18:05', 'http://autoigs.com/mediacms/admin/user_media/um_0_1477124283905.jpg', 'photo', 'active', '65512014', 1, 292, '00', 0, NULL),
(166, 0, 'router 4G can usr all kind of sim...\nØ±Ø§ÙˆØªØ± 4G ÙŠÙ‚Ø¨Ù„ Ø¬Ù…ÙŠØ¹ Ø§Ù„Ø´Ø¨ÙƒØ§Øª.', NULL, '2016-10-23 13:15:19', 'http://autoigs.com/mediacms/admin/user_media/um_0_1477253707999.jpg', 'photo', 'active', '67697705', 1, 247, '15', 0, NULL),
(169, 0, 'Ù¡- Ù„Ù„Ø¨ÙŠØ¹ Ø¨ÙŠØª Ø­ÙƒÙˆÙ…Ø© ÙÙŠ Ø§Ù„Ù‚Ø±ÙŠÙ† Ø¯ÙˆØ±ÙŠÙ† Ø¨Ø·Ù† ÙˆØ¸Ù‡Ø± ÙˆØ«ÙŠÙ‚Ø© Ø­Ø±Ø© ØªØ³Ù„ÙŠÙ… ÙÙˆØ±ÙŠ Ù¢- Ù„Ù„Ø¨ÙŠØ¹ Ù‚Ø³ÙŠÙ…Ø© ÙÙŠ Ø¬Ø§Ø¨Ø± Ø§Ù„Ø¹Ù„ÙŠ Ø¯ÙˆØ±ÙŠÙ† ÙˆÙ†Øµ ÙˆØ³Ø±Ø¯Ø§Ø¨ Ø¨Ø·Ù† ÙˆØ¸Ù‡Ø± Ø´Ø§Ø±Ø¹ Ø±Ø¦ÙŠØ³ÙŠ ÙˆØ«ÙŠÙ‚Ø© Ø­Ø±Ø© 65885007 Ø§Ù„Ù…Ø²Ø§Ø¯ Ø§Ù„Ø¹Ù‚Ø§Ø±ÙŠ', NULL, '2016-10-24 06:33:06', 'http://autoigs.com/mediacms/admin/user_media/14773002751002247585.jpg', 'photo', 'active', '65885007', 1, 134, '00', 0, NULL),
(171, 0, 'Ù„Ù„Ø¨ÙŠØ¹ Ø¬Ø§Ø¨Ø±Ø§Ù„Ø§Ø­Ù…Ø¯Ù‚Ù¡Ø¯ÙˆØ±ÙŠÙ† ÙˆÙ†Øµ Ø²Ø§ÙˆÙŠÙ‡ Ø¯Ø§Ø®Ù„ÙŠÙ‡ ØªØ´Ø·ÙŠØ¨ Ø¬Ø¯ÙŠØ¯ Ù…Ø¯Ø®Ù„ ÙˆÙ…Ø®Ø±Ø¬ Ø³Ù‡Ù„ Ù„Ù„Ø¨ÙŠØ¹ Ø§Ù„Ù†Ø³ÙŠÙ… Ù‚Ù¡Ø¨Ø·Ù† ÙˆØ¸Ù‡Ø±ÙˆÙ†Ø§ÙØ² Ø¯ÙˆØ±ÙŠÙ† ÙˆÙ…Ù„Ø­Ù‚ Ù…Ø¨Ù†ÙŠ Ø¯ÙˆØ±ÙŠÙ† Ø§Ù„Ù…Ù„Ø­Ù‚ Ù…Ø¤Ø¬Ø±Ø¹Ù„ÙŠ Ù¢Ù¥Ù  Ø§Ù„Ø¨ÙŠØª Ù†Ø¸ÙŠÙ Ø¬Ø¯Ø§ Ø³Ø§ÙƒÙ† Ø§Ù„Ù…Ø§Ù„Ùƒ Ù„Ù„Ø¨ÙŠØ¹ Ø§Ø³Ø·Ø¨Ù„ Ø¨Ø·Ù† ÙˆØ¸Ù‡Ø±Ø¹Ù„ÙŠ Ø´Ø§Ø±Ø¹ÙŠÙ† Ø§Ù„Ù…Ø³Ø§Ø­Ù‡ Ù¥Ù Ù  Ù…ØªØ± Ù…Ù‚Ø³Ù… Ø¹Ù„ÙŠ Ø§Ø±Ø¨Ø¹ Ø£Ù‚Ø³Ø§Ù… Ø¯ÙˆØ§ÙˆÙŠÙ† Ù…Ø¯Ø®ÙˆÙ„ Ù¥Ù¦Ù  Ù„Ù„Ø¨ÙŠØ¹ ÙÙŠ Ø§Ù„Ø¹ÙŠÙˆÙ† Ù‚Ù¢Ø¨ÙŠØª Ø±Ø§Ø³ Ø²Ø§ÙˆÙŠÙ‡ Ø¹Ù„ÙŠ ÙˆØ¶Ø¹Ù‡ Ø§Ù„Ø­ÙƒÙˆÙ…ÙŠ Ù¡Ù¦Ù¥ Ø§Ù„Ù Ø¨ÙˆØ­Ø¨ÙŠØ¨Ù‡ Ù©Ù©Ù£Ù§Ù©Ù§Ù¦Ù¢', NULL, '2016-10-24 06:46:15', 'http://d3cxve53lbqhxv.cloudfront.net/images/profile_images/1464689824498771195.jpg', 'photo', 'active', '99379762', 1, 134, '165', 0, NULL),
(172, 0, 'Ø´Ù‚Ø© Ø¬Ø§Ù‡Ø²Ø© Ù„ØªØ³Ù„ÙŠÙ… Ø¨Ø­ÙˆÙ„ÙŠ Ù…Ø¹ ÙˆØ«ÙŠÙ‚Ø© Ø­Ø±Ø© ÙˆØ§Ø³ØªØ«Ù…Ø§Ø± Ù…Ø¶Ù…ÙˆÙ†5Ø³Ù†ÙˆØ§Øª Ù‚Ø§Ø¨Ù„Ø© Ù„ØªØ¬Ø¯ÙŠØ¯/ Ø§Ù„Ù…Ø³Ø§Ø­Ø© 74Ù… /2Øº/2Ø­/Ù…Ø·Ø¨Ø® /ØµØ§Ù„Ø©/Ù…ÙˆØ§Ù‚Ù Ø³ÙŠØ§Ø±Ø§Øª Ù†Ø¸Ø§Ù… Ø§Ù„ÙƒØ§Ø±Øª Ø§Ù„Ù…Ù…ØºÙ†Ø· ÙˆÙ…ÙˆØ§Ù‚Ù Ø®Ø§Ø±Ø¬ÙŠØ© /ØªØ´Ø·ÙŠØ¨Ø§Øª Ø¹Ø§Ù„ÙŠØ© Ø§Ù„Ø¬ÙˆØ¯Ø©/Ø§Ù„Ø¹Ù…Ø§Ø±Ø© Ø¨Ù†ÙŠØ§Ù† ÙØ®Ù… ÙˆÙ…Ù…ÙŠØ²Ø§Øª Ù…ØªØ¹Ø¯Ø¯Ø©', NULL, '2016-10-24 06:48:48', 'http://d3cxve53lbqhxv.cloudfront.net/images/user_adv/resize1000/1476606157427236939.jpg', 'photo', 'active', '69019074', 1, 134, '00', 0, NULL),
(173, 0, 'Ø´Ù‚Ø© ØªÙ…Ù„ÙŠÙƒ Ø¨Ø§Ù„Ø±Ù‚Ø¹ÙŠ ØªØ³Ù„ÙŠÙ… ÙÙˆØ±ÙŠ Ù‚Ø±ÙŠØ¨Ø© Ù…Ù† Ù…Ø¬Ù…Ø¹ Ø§Ù„Ù…Ø­Ø§ÙƒÙ… Ø§Ù„Ù…Ø³Ø§Ø­Ø©62Ù… ØºØ±ÙØªÙŠÙ† Ø­Ù…Ø§Ù…ÙŠÙ† ÙˆÙ…Ø·Ø¨Ø® Ù…Ø¬Ù‡Ø² ÙˆØµØ§Ù„Ø© Ø§Ø³ØªØ«Ù…Ø§Ø± Ù…Ø¶Ù…ÙˆÙ† 5Ø³Ù†ÙˆØ§Øª Ù‚Ø§Ø¨Ù„Ø© Ù„ØªØ¬Ø¯ÙŠØ¯ 280Ø¯Ùƒ Ù…ÙˆØ§Ù‚Ù Ø³ÙŠØ§Ø±Ø§Øª Ù†Ø¸Ø§Ù… Ø§Ù„ÙƒØ§Ø±Øª Ø§Ù„Ù…Ù…ØºÙ†Ø· Ù…Ø¹ Ø¶Ù…Ø§Ù† Ø¬ÙˆØ¯Ø© ÙˆÙØ®Ø§Ù…Ø© Ø§Ù„ØªØ´Ø·ÙŠØ¨', NULL, '2016-10-24 06:49:37', 'http://d3cxve53lbqhxv.cloudfront.net/images/user_adv/resize1000/1476693060477913820.jpg', 'photo', 'active', '69019074', 1, 134, '00', 0, NULL),
(174, 0, 'ÙÙŠ Ø§Ù„Ù…Ù‡Ø¨ÙˆÙ„Ù‡ Ù‚Ù¢ Ù…Ø³Ø§Ø­Ø© Ù¡Ù¡Ù¤Ù… Ù…Ø·Ø§Ø¨Ù‚Ù‡ Ù„Ø´Ø±ÙˆØ· Ø¨Ù†Ùƒ Ø§Ù„Ø§Ø¦ØªÙ…Ø§Ù† Ù£ ØºØ±Ù ÙˆÙ£ Ø­Ù…Ø§Ù… ÙˆØµØ§Ù„Ù‡ ÙˆÙ…Ø·Ø¨Ø® ÙˆØºØ±ÙØ© Ø®Ø§Ø¯Ù…Ù‡ ØµÙØ§Ø© Ø§Ù„Ø³Ù„Ø§Ù… Ø§Ù„Ø¹Ù‚Ø§Ø±ÙŠÙ‡ Øª/ 66555826-97419541', NULL, '2016-10-24 06:51:21', 'http://d3cxve53lbqhxv.cloudfront.net/images/user_adv/resize1000/1477303458532825886.jpg', 'photo', 'active', '66555826', 1, 134, '00', 0, NULL),
(175, 0, 'Ù„Ù„Ø¨ÙŠØ¹ Ø§Ø±Ø¶ Ø¨Ø§Ù„ÙÙ†ÙŠØ·ÙŠØ³ Ù£Ù§Ù¥Ù… Ù…ÙˆÙ‚Ø¹ Ø´Ø§Ø±Ø¹ ÙˆØ§Ø­Ø¯ Ù…Ø¯Ø®Ù„ ÙˆÙ…Ø®Ø±Ø¬ Ø³Ù‡Ù„ Ù„Ù„ØºØ§ÙŠÙ‡ ÙˆØ§Ø¬Ù‡Ø§ Ø´Ø±Ù‚ÙŠÙ‡ Ù‚Ø±ÙŠØ¨Ù‡ Ù„Ù„Ø®Ø¯Ù…Ø§Øª ÙˆØ«ÙŠÙ‚Ù‡ Ø­Ø±Ù‡ Ù…Ø®Ø·Ø· Ø¨Ù†ÙŠØ§Ù† Ø¬Ø§Ù‡Ø² Ø«Ù„Ø§Ø« Ø§Ø¯ÙˆØ§Ø± ÙˆÙ†Øµ ÙˆÙ†Øµ Ø³Ø±Ø¯Ø§Ø¨ Ù‚Ù£ Ø§Ù„Ø³Ø¹Ø± Ù¡Ù©Ù¢ Ø§Ù„Ù Ù„Ù„Ø§Ø³ØªÙØ³Ø§Ø± 51077785 Ø§Ø¨Ùˆ Ø§Ø¯Ù…', NULL, '2016-10-24 06:52:31', 'http://d3cxve53lbqhxv.cloudfront.net/images/user_adv/resize1000/1477303431816142237.jpg', 'photo', 'active', '51077785', 1, 134, '00', 0, NULL),
(7100, 0, 'test', NULL, '2017-03-17 11:54:09', 'http://s3-us-west-2.amazonaws.com/2sale/1489751647_b9985528-b532-4c5c-ad84-401ce08ab95e.png', 'photo', 'active', '055600600', 0, 156, '44', 0, NULL),
(7101, 0, 'test2', NULL, '2017-03-17 11:56:17', 'http://localhost:8888/mediacms/admin/user_media/5a7d6cc8-59e7-4ea9-9f29-0377235a497c.png', 'photo', 'active', '1323123321', 0, 131, '123', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `device_os` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `free_posts` int(11) NOT NULL,
  `paied_posts` int(11) NOT NULL,
  `updated_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `lang` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3238 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postimage`
--
ALTER TABLE `postimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=362;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `postimage`
--
ALTER TABLE `postimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8961;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7102;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3238;