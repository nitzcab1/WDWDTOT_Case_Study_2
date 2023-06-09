-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2023 at 01:48 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wdwdtot_case_study_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People\'s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'ES', 'Spain'),
(203, 'LK', 'Sri Lanka'),
(204, 'SH', 'St. Helena'),
(205, 'PM', 'St. Pierre and Miquelon'),
(206, 'SD', 'Sudan'),
(207, 'SR', 'Suriname'),
(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
(209, 'SZ', 'Swaziland'),
(210, 'SE', 'Sweden'),
(211, 'CH', 'Switzerland'),
(212, 'SY', 'Syrian Arab Republic'),
(213, 'TW', 'Taiwan'),
(214, 'TJ', 'Tajikistan'),
(215, 'TZ', 'Tanzania, United Republic of'),
(216, 'TH', 'Thailand'),
(217, 'TG', 'Togo'),
(218, 'TK', 'Tokelau'),
(219, 'TO', 'Tonga'),
(220, 'TT', 'Trinidad and Tobago'),
(221, 'TN', 'Tunisia'),
(222, 'TR', 'Turkey'),
(223, 'TM', 'Turkmenistan'),
(224, 'TC', 'Turks and Caicos Islands'),
(225, 'TV', 'Tuvalu'),
(226, 'UG', 'Uganda'),
(227, 'UA', 'Ukraine'),
(228, 'AE', 'United Arab Emirates'),
(229, 'GB', 'United Kingdom'),
(230, 'US', 'United States'),
(231, 'UM', 'United States minor outlying islands'),
(232, 'UY', 'Uruguay'),
(233, 'UZ', 'Uzbekistan'),
(234, 'VU', 'Vanuatu'),
(235, 'VA', 'Vatican City State'),
(236, 'VE', 'Venezuela'),
(237, 'VN', 'Vietnam'),
(238, 'VG', 'Virgin Islands (British)'),
(239, 'VI', 'Virgin Islands (U.S.)'),
(240, 'WF', 'Wallis and Futuna Islands'),
(241, 'EH', 'Western Sahara'),
(242, 'YE', 'Yemen'),
(243, 'ZR', 'Zaire'),
(244, 'ZM', 'Zambia'),
(245, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `personprofile`
--

CREATE TABLE `personprofile` (
  `profileid` int(11) NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personprofile`
--

INSERT INTO `personprofile` (`profileid`, `firstname`, `middlename`, `lastname`, `gender`, `address`) VALUES
(3, 'John Liebnitz', 'Omega', 'Cabaluna', 'F', 'Catalina Amparo Nagac Street123124124'),
(4, 'John Liebnitz', 'Omega', 'Cabaluna', 'M', 'Catalina Amparo Nagac Street123123'),
(5, 'John', 'Liebnitz', 'Cabaluna', 'M', '1127, Catalina Amparo Nagac Street, Zone 1 Punta Bonbon, Cagayan de Oro, Misamis Oriental, 9000, Philippines'),
(7, 'John Liebnitz', 'Omega', 'Cabaluna', '', 'Catalina Amparo Nagac Street');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_temp` decimal(11,2) NOT NULL,
  `diagnosed` int(1) NOT NULL DEFAULT 0,
  `encounter` int(1) NOT NULL DEFAULT 0,
  `vacinated` int(1) NOT NULL DEFAULT 0,
  `country_id` int(11) DEFAULT 174 COMMENT 'DEFAULT 174 for PHILIPPINES',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `name`, `gender`, `age`, `mobile`, `body_temp`, `diagnosed`, `encounter`, `vacinated`, `country_id`, `date_created`, `date_updated`) VALUES
(1, 'West Mountain', 'M', 55, '9980226848', '36.15', 1, 1, 1, 158, '2023-03-30 12:13:36', '2023-03-30 12:13:36'),
(2, 'Calhan', 'F', 25, '9947116588', '37.10', 1, 1, 0, 241, '2023-03-30 12:13:36', '2023-03-30 12:13:36'),
(3, 'Waycross', 'F', 24, '9018189329', '37.20', 0, 1, 1, 81, '2023-03-30 12:13:36', '2023-03-30 12:13:36'),
(4, 'Napakiak', 'F', 4, '9431615105', '37.50', 1, 0, 0, 119, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(5, 'Sturbridge', 'F', 49, '9927892023', '37.10', 0, 1, 0, 143, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(6, 'Chaffee', 'M', 42, '9121596500', '38.65', 1, 0, 0, 176, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(7, 'Turlock', 'M', 6, '9731830431', '37.40', 0, 0, 0, 142, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(8, 'Panacea', 'F', 41, '9117537178', '37.55', 0, 1, 1, 14, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(9, 'Channing', 'F', 33, '9861895205', '37.40', 0, 1, 0, 93, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(10, 'Leroy', 'M', 85, '9170215227', '36.70', 0, 1, 0, 159, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(11, 'Tyronza', 'F', 54, '9500493713', '36.60', 0, 1, 0, 187, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(12, 'Ponderay', 'F', 47, '9294062650', '38.40', 1, 0, 0, 158, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(13, 'Mount Hebron', 'M', 13, '9560664472', '36.20', 1, 1, 0, 67, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(14, 'Luis Llorens Torres', 'M', 63, '9277131721', '37.75', 0, 1, 0, 235, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(15, 'Alda', 'F', 55, '9529040005', '37.15', 1, 1, 1, 6, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(16, 'Beardstown', 'F', 37, '9903871865', '36.45', 1, 1, 1, 189, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(17, 'Dakota', 'M', 52, '9284267001', '35.30', 1, 1, 1, 245, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(18, 'Blain', 'F', 46, '9437014335', '37.15', 0, 1, 1, 66, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(19, 'Airport Drive', 'F', 86, '9106852729', '37.25', 0, 0, 1, 143, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(20, 'Finley', 'F', 10, '9664973886', '36.60', 0, 0, 0, 118, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(21, 'Quarryville', 'F', 31, '9069152144', '38.15', 1, 0, 1, 224, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(22, 'Kosciusko', 'F', 84, '9515830122', '38.25', 1, 1, 0, 68, '2023-03-30 12:13:37', '2023-03-30 12:13:37'),
(23, 'Mazomanie', 'F', 21, '9475133736', '37.25', 1, 1, 1, 196, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(24, 'Tonsina', 'F', 32, '9927300713', '37.05', 1, 1, 1, 207, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(25, 'Rillito', 'F', 33, '9912040135', '38.40', 0, 0, 0, 86, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(26, 'Rankin', 'F', 47, '9392221107', '36.55', 0, 0, 1, 78, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(27, 'Fennville', 'M', 84, '9025908158', '35.25', 1, 0, 1, 149, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(28, 'Monett', 'M', 29, '9491890486', '36.85', 0, 1, 0, 74, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(29, 'White Bird', 'F', 33, '9122806357', '36.95', 0, 0, 0, 86, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(30, 'Seagrove', 'F', 16, '9188372344', '36.00', 0, 1, 1, 35, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(31, 'Talbotton', 'M', 35, '9899602808', '36.00', 1, 1, 0, 71, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(32, 'Gem Lake', 'F', 8, '9080535651', '35.15', 0, 1, 1, 34, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(33, 'Penn Lake Park', 'F', 2, '9300837282', '36.20', 1, 1, 0, 222, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(34, 'Potala Pastillo', 'M', 27, '9322505407', '38.35', 0, 0, 0, 144, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(35, 'Ovilla', 'F', 19, '9646990745', '38.05', 1, 0, 1, 134, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(36, 'Newfolden', 'M', 26, '9377645810', '36.25', 1, 0, 1, 17, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(37, 'Blythe', 'F', 24, '9032545016', '38.10', 0, 0, 0, 202, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(38, 'Snow Lake Shores', 'F', 48, '9638143671', '36.40', 0, 0, 0, 243, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(39, 'Lookingglass', 'F', 35, '9714703562', '37.95', 0, 0, 1, 179, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(40, 'Yorkville', 'M', 80, '9212516809', '36.30', 0, 1, 0, 28, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(41, 'Ayrshire', 'M', 9, '9136062587', '37.85', 0, 0, 1, 66, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(42, 'Rumbly', 'M', 74, '9742106428', '38.50', 0, 1, 1, 165, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(43, 'Beardstown', 'M', 74, '9947185638', '35.50', 1, 1, 0, 74, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(44, 'Auburn Hills', 'M', 57, '9205138524', '37.65', 1, 0, 0, 21, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(45, 'Judith Gap', 'M', 65, '9342223292', '38.30', 1, 1, 0, 133, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(46, 'Brookford', 'M', 58, '9331202671', '35.90', 1, 1, 1, 229, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(47, 'Alda', 'F', 81, '9471289448', '37.50', 0, 1, 1, 146, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(48, 'McConnell', 'F', 7, '9145420017', '36.70', 1, 1, 0, 166, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(49, 'Loco Hills', 'M', 58, '9857395541', '39.00', 0, 0, 0, 220, '2023-03-30 12:13:38', '2023-03-30 12:13:38'),
(50, 'North Royalton', 'F', 67, '9898589631', '36.50', 0, 1, 0, 197, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(51, 'Sierra City', 'M', 21, '9339070083', '36.50', 0, 1, 0, 166, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(52, 'West Falls Church', 'M', 21, '9513489628', '36.65', 1, 1, 0, 190, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(53, 'Mamers', 'F', 24, '9482560883', '37.15', 1, 0, 1, 43, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(54, 'Beaver Falls', 'F', 38, '9200751452', '38.35', 0, 0, 1, 61, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(55, 'Collbran', 'F', 1, '9701405936', '37.35', 1, 1, 0, 20, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(56, 'Lodge', 'M', 39, '9005624242', '38.65', 1, 1, 1, 128, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(57, 'Jollyville', 'F', 12, '9831139746', '36.10', 1, 0, 0, 50, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(58, 'Honea Path', 'M', 45, '9061399829', '37.35', 1, 1, 1, 9, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(59, 'Mercer', 'M', 65, '9216191682', '38.65', 1, 0, 0, 143, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(60, 'Sumter', 'F', 51, '9276925724', '36.70', 1, 0, 1, 41, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(61, 'Dailey', 'F', 61, '9902194635', '38.45', 1, 0, 0, 114, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(62, 'Poughkeepsie', 'M', 64, '9012359298', '35.55', 0, 0, 0, 97, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(63, 'Olivette', 'F', 49, '9653885186', '37.35', 1, 0, 1, 228, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(64, 'Connersville', 'F', 48, '9632883256', '37.50', 0, 0, 0, 241, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(65, 'Rialto', 'F', 7, '45645644456', '38.75', 0, 1, 0, 174, '2023-03-30 12:13:39', '2023-03-30 23:05:48'),
(66, 'Scurry', 'F', 31, '9499658977', '35.25', 0, 0, 1, 76, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(67, 'Channing', 'M', 71, '9337318685', '38.60', 0, 1, 0, 211, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(68, 'Griggstown', 'F', 15, '9970315042', '38.60', 0, 0, 1, 153, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(69, 'Trout Valley', 'F', 5, '9786634307', '39.00', 0, 0, 0, 154, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(70, 'Sanborn', 'M', 29, '9844571315', '36.40', 1, 0, 0, 111, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(71, 'Hepzibah', 'M', 84, '9731218201', '36.45', 1, 0, 1, 73, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(72, 'North Pekin', 'F', 35, '9154302567', '36.60', 1, 1, 0, 9, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(73, 'El Quiote', 'M', 17, '9013910296', '37.45', 1, 1, 0, 176, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(74, 'Notus', 'M', 66, '9879909992', '38.25', 1, 0, 1, 109, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(75, 'Cutler Bay', 'M', 28, '9042348758', '38.15', 1, 0, 1, 20, '2023-03-30 12:13:39', '2023-03-30 12:13:39'),
(76, 'Chaffee', 'F', 38, '9886570878', '35.90', 1, 0, 0, 237, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(77, 'Collbran', 'F', 39, '9824049838', '38.50', 1, 1, 1, 39, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(78, 'South Highpoint', 'F', 16, '9976056942', '37.45', 1, 1, 0, 82, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(79, 'Rockwell', 'F', 35, '9394182270', '36.95', 1, 0, 0, 89, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(80, 'Melvern', 'F', 53, '9284154288', '35.20', 1, 1, 1, 27, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(81, 'Manson', 'F', 65, '9053823559', '37.20', 0, 0, 1, 139, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(82, 'Otway', 'F', 28, '9761650918', '36.45', 0, 1, 0, 169, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(83, 'Middlebrook', 'F', 83, '9240347089', '39.00', 1, 0, 0, 67, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(84, 'Sheridan', 'F', 23, '9840137257', '37.00', 0, 1, 0, 198, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(85, 'Lucerne Valley', 'F', 42, '9903874813', '35.45', 1, 0, 1, 29, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(86, 'Hickam Housing', 'F', 83, '9217421543', '36.35', 0, 1, 0, 154, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(87, 'Sparkman', 'F', 71, '9802251242', '38.20', 0, 1, 0, 188, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(88, 'Sells', 'M', 7, '9101851860', '37.65', 1, 1, 1, 207, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(89, 'Central Park', 'F', 82, '9658147529', '36.85', 1, 1, 1, 77, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(90, 'Atlantis', 'M', 62, '9874744101', '38.60', 0, 1, 0, 151, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(91, 'Luis Llorens Torres', 'F', 53, '9761798972', '36.20', 1, 0, 0, 156, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(92, 'Oriole Beach', 'F', 38, '9413098446', '35.25', 0, 0, 1, 194, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(93, 'South Highpoint', 'M', 12, '9117216088', '35.65', 1, 0, 0, 53, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(94, 'Wickes', 'M', 60, '9967311646', '35.20', 0, 1, 1, 219, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(95, 'Whitefish', 'M', 55, '9826367021', '37.80', 1, 1, 1, 95, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(96, 'Stinnett', 'M', 27, '9219728307', '37.75', 0, 1, 1, 194, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(97, 'Hopedale', 'M', 47, '9490364444', '38.30', 1, 0, 1, 177, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(98, 'Nathalie', 'M', 52, '9494354074', '36.30', 1, 1, 0, 210, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(99, 'Holly Ridge', 'M', 29, '9609342479', '35.75', 1, 1, 0, 143, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(100, 'Sidon', 'M', 26, '9994326319', '36.95', 0, 1, 0, 72, '2023-03-30 12:13:40', '2023-03-30 12:13:40'),
(101, 'Belle Prairie City', 'M', 12, '9182205471', '37.90', 0, 1, 0, 98, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(102, 'Redwood City', 'F', 13, '9062691509', '37.25', 1, 0, 1, 245, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(103, 'Berry Creek', 'M', 53, '9824058057', '36.75', 0, 0, 1, 76, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(104, 'North Royalton', 'F', 37, '9907820127', '38.90', 0, 0, 1, 68, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(105, 'Marana', 'F', 46, '9056601525', '38.75', 0, 0, 0, 177, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(106, 'Kingstowne', 'F', 29, '9156106490', '36.85', 1, 0, 0, 22, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(107, 'Talbotton', 'F', 10, '9278274697', '35.35', 1, 1, 0, 9, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(108, 'Mountain Lake', 'M', 64, '9634298467', '38.45', 1, 1, 0, 47, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(109, 'Ragland', 'F', 31, '9307172856', '35.30', 0, 0, 1, 15, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(110, 'Fairmount Heights', 'F', 29, '9937933711', '38.15', 1, 0, 0, 122, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(111, 'McCordsville', 'M', 53, '9134750048', '39.00', 1, 1, 1, 222, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(112, 'Cowiche', 'F', 18, '9530635818', '35.80', 0, 0, 0, 225, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(113, 'Chaffee', 'F', 21, '9963103875', '37.70', 0, 1, 1, 213, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(114, 'Lost Lake Woods', 'M', 37, '9043733634', '38.65', 0, 0, 1, 36, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(115, 'Bunkie', 'F', 14, '9345321531', '35.80', 0, 0, 0, 113, '2023-03-30 12:14:52', '2023-03-30 12:14:52'),
(116, 'Abbott', 'F', 59, '9478714270', '35.20', 0, 1, 0, 242, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(117, 'Ramah', 'M', 13, '9146460298', '37.65', 0, 0, 1, 41, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(118, 'Shippingport', 'F', 11, '9132880526', '36.50', 0, 1, 0, 129, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(119, 'Roberts', 'F', 84, '9703092322', '37.65', 0, 0, 1, 21, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(120, 'Twinsburg', 'M', 48, '9809677681', '36.75', 0, 1, 1, 170, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(121, 'Simsbury Center', 'M', 25, '9498079880', '37.75', 1, 0, 0, 106, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(122, 'Tangipahoa', 'M', 19, '9720718566', '36.60', 1, 1, 1, 79, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(123, 'Solvang', 'F', 2, '9352107631', '38.40', 1, 0, 1, 235, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(124, 'Judith Gap', 'M', 45, '9826599838', '35.75', 1, 0, 1, 119, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(125, 'Pikeville', 'M', 22, '9596171683', '35.55', 0, 0, 0, 160, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(126, 'Beasley', 'F', 34, '9011479277', '35.80', 0, 1, 1, 85, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(127, 'Two Rivers', 'F', 49, '9533627324', '36.20', 0, 1, 1, 231, '2023-03-30 12:14:53', '2023-03-30 12:14:53'),
(128, 'Starrucca', 'M', 49, '9336556260', '37.00', 0, 1, 1, 99, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(129, 'Marfa', 'F', 79, '9132273002', '36.80', 0, 1, 1, 144, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(130, 'Cleveland', 'M', 57, '9007491307', '35.55', 1, 0, 1, 114, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(131, 'Ovilla', 'F', 2, '9502638518', '38.65', 0, 1, 1, 164, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(132, 'Deer Grove', 'M', 77, '9644187132', '37.25', 0, 1, 1, 77, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(133, 'Savoy', 'F', 71, '9340116618', '35.95', 0, 0, 1, 203, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(134, 'Abbott', 'M', 27, '9232904269', '39.00', 0, 1, 1, 147, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(135, 'Dakota', 'F', 73, '9436704358', '38.35', 0, 0, 0, 124, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(136, 'Craigmont', 'F', 61, '9866048520', '36.35', 1, 0, 0, 86, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(137, 'Canutillo', 'F', 63, '9594702026', '35.95', 0, 0, 0, 219, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(138, 'Marysville', 'M', 8, '9847372355', '38.70', 1, 1, 1, 222, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(139, 'Pebble Creek', 'F', 20, '9108254606', '36.00', 1, 1, 0, 171, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(140, 'Whidbey Island Station', 'M', 38, '9557566737', '36.35', 1, 0, 1, 36, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(141, 'Payson', 'F', 18, '9510749509', '38.05', 0, 1, 0, 42, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(142, 'Taneyville', 'M', 58, '9683224320', '38.45', 0, 0, 0, 197, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(143, 'Red Hill', 'F', 76, '9806152977', '38.75', 1, 1, 1, 189, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(144, 'Congerville', 'M', 85, '9211118508', '38.20', 0, 1, 0, 4, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(145, 'Minersville', 'F', 2, '9701112195', '37.20', 0, 0, 1, 197, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(146, 'Spur', 'F', 48, '9988206007', '37.75', 0, 1, 1, 229, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(147, 'Starrucca', 'F', 67, '9285319733', '35.85', 1, 0, 0, 107, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(148, 'Cleone', 'F', 84, '9770314276', '38.40', 0, 0, 1, 163, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(149, 'Jewell', 'M', 29, '9204983645', '35.20', 1, 1, 1, 212, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(150, 'Channing', 'M', 85, '9604727017', '36.10', 0, 0, 0, 110, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(151, 'Caruthersville', 'M', 23, '9271225656', '37.75', 0, 0, 1, 241, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(152, 'Knowles', 'M', 33, '9480377123', '36.20', 1, 1, 1, 71, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(153, 'Camp Verde', 'F', 36, '9077486804', '35.90', 0, 0, 1, 236, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(154, 'Fairmount Heights', 'F', 76, '9741706837', '36.25', 1, 0, 1, 242, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(155, 'Wood Heights', 'M', 51, '9440436509', '38.80', 0, 0, 1, 150, '2023-03-30 12:14:54', '2023-03-30 12:14:54'),
(156, 'Gem Lake', 'M', 8, '9361702421', '38.90', 1, 0, 1, 29, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(157, 'Downey', 'F', 32, '9436649103', '36.25', 0, 1, 0, 79, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(158, 'Mildred', 'F', 80, '9976580750', '35.40', 0, 1, 1, 212, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(159, 'Barnett', 'M', 28, '9476517671', '36.05', 0, 0, 1, 140, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(160, 'Meridian Station', 'F', 73, '9916805060', '35.70', 0, 0, 0, 125, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(161, 'Bear Rocks', 'F', 22, '9975542625', '36.70', 1, 0, 0, 122, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(162, 'Maumee', 'F', 74, '9729471080', '37.35', 1, 0, 1, 20, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(163, 'Judith Gap', 'M', 40, '9990580631', '38.50', 0, 0, 0, 129, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(164, 'Highlands Baywood Park', 'F', 39, '9491733123', '36.35', 0, 0, 0, 156, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(165, 'Barnett', 'F', 28, '9962634661', '36.60', 0, 1, 0, 141, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(166, 'McConnell', 'M', 32, '9028968088', '35.30', 1, 1, 1, 191, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(167, 'Montezuma', 'M', 52, '9841431325', '38.35', 0, 0, 1, 213, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(168, 'Spencer', 'M', 25, '9314307730', '35.35', 0, 1, 1, 27, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(169, 'Campton', 'F', 44, '9366864987', '37.70', 1, 0, 0, 109, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(170, 'Tonsina', 'F', 77, '9038803496', '35.65', 1, 1, 0, 110, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(171, 'Maribel', 'M', 10, '9508440775', '36.10', 0, 1, 0, 78, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(172, 'Sedgewickville', 'M', 41, '9964244294', '35.20', 1, 1, 1, 240, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(173, 'Roann', 'M', 36, '9919052477', '38.75', 0, 1, 1, 47, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(174, 'Norton', 'M', 5, '9044712577', '38.60', 0, 1, 0, 160, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(175, 'Kosciusko', 'F', 84, '9608891116', '36.20', 1, 1, 1, 179, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(176, 'Luis Llorens Torres', 'F', 63, '9544569424', '36.75', 0, 1, 1, 175, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(177, 'Pittsburg', 'M', 82, '9229404362', '36.05', 0, 0, 1, 11, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(178, 'Angle Inlet', 'M', 25, '9067862858', '37.45', 0, 0, 1, 186, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(179, 'Christie', 'M', 9, '9380475948', '37.15', 1, 0, 0, 133, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(180, 'Martinton', 'F', 52, '9302736016', '37.85', 0, 0, 1, 85, '2023-03-30 12:14:55', '2023-03-30 12:14:55'),
(181, 'Hasty', 'M', 26, '9507215754', '37.45', 0, 0, 0, 38, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(182, 'Brainard', 'F', 18, '9897157046', '37.90', 0, 0, 1, 135, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(183, 'Northmoor', 'M', 77, '9440893323', '37.00', 1, 0, 0, 215, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(184, 'Brundage', 'M', 83, '9512267548', '37.95', 0, 0, 0, 53, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(185, 'Barberton', 'M', 81, '9018941983', '36.75', 1, 0, 1, 227, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(186, 'Connersville', 'M', 37, '9052449653', '36.45', 0, 0, 1, 231, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(187, 'Valdez', 'F', 81, '9366351729', '38.00', 1, 0, 0, 37, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(188, 'Camp Springs', 'F', 14, '9690129582', '37.75', 0, 0, 1, 169, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(189, 'Shattuck', 'F', 40, '9645371961', '35.45', 0, 0, 0, 228, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(190, 'Forest Hill', 'M', 44, '9799699090', '35.50', 1, 1, 1, 182, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(191, 'Cactus Forest', 'M', 4, '9711212479', '37.40', 1, 1, 0, 118, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(192, 'Otterbein', 'F', 74, '9258081408', '36.00', 1, 1, 0, 78, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(193, 'Barry', 'F', 80, '9764954575', '36.05', 0, 0, 0, 241, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(194, 'Point of Rocks', 'F', 69, '9943612815', '38.55', 0, 0, 0, 198, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(195, 'Hokendauqua', 'F', 53, '9545717254', '35.65', 1, 0, 1, 128, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(196, 'Lisle', 'M', 61, '9940389964', '38.25', 0, 1, 0, 112, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(197, 'Spencer', 'F', 7, '9394214618', '38.25', 1, 0, 1, 29, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(198, 'Copper Center', 'M', 35, '9779934241', '35.65', 1, 1, 1, 86, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(199, 'Griggstown', 'F', 88, '9235587667', '37.35', 1, 0, 0, 24, '2023-03-30 12:14:56', '2023-03-30 23:09:38'),
(200, 'Merrionette Park', 'F', 56, '9335180278', '36.35', 1, 0, 1, 3, '2023-03-30 12:14:56', '2023-03-30 12:14:56'),
(207, 'John Liebnitz Omega Cabaluna', 'F', 23, '09365948119', '35.10', 0, 1, 1, 159, '2023-03-30 22:57:38', '2023-03-30 23:05:15'),
(208, 'John Liebnitz Omega Cabaluna', 'M', 23, '09365948119', '33.10', 1, 0, 0, 174, '2023-03-30 22:58:11', '2023-03-30 22:58:11'),
(209, 'John Liebnitz Omega Cabaluna123213', 'M', 23, '09365948119', '33.10', 1, 0, 0, 174, '2023-03-30 22:58:51', '2023-03-30 22:58:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personprofile`
--
ALTER TABLE `personprofile`
  ADD PRIMARY KEY (`profileid`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `personprofile`
--
ALTER TABLE `personprofile`
  MODIFY `profileid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
