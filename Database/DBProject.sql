-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2012 at 01:23 AM
-- Server version: 5.5.24
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DBProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `attending_events`
--

CREATE TABLE IF NOT EXISTS `attending_events` (
  `visitor` int(11) NOT NULL DEFAULT '0',
  `event` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`visitor`),
  KEY `event` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attending_events`
--

INSERT INTO `attending_events` (`visitor`, `event`) VALUES
(77, 'Aerobotics'),
(92, 'Aerobotics'),
(31, 'Air Show'),
(27, 'Fire n Ice'),
(26, 'Paper Plane'),
(75, 'Puzzle Champ'),
(38, 'Reverse Coding'),
(45, 'Triathlon'),
(44, 'Wright Design');

-- --------------------------------------------------------

--
-- Table structure for table `coordinator`
--

CREATE TABLE IF NOT EXISTS `coordinator` (
  `coord_id` int(11) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `event` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`coord_id`),
  KEY `event` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coordinator`
--

INSERT INTO `coordinator` (`coord_id`, `phone`, `email`, `name`, `event`) VALUES
(1, '6867636106', 'ajay@shaastra.org', 'Ajay Kumar Bilare', 'Aerobotics'),
(2, '6641045805', 'akhil@shaastra.org', 'Akhil Ramesh', 'Air Show'),
(3, '1716111303', 'antony@shaastra.org', 'Antony Thomas', 'Ambience'),
(4, '7312817169', 'arjun@shaastra.org', 'Arjun C', 'Case Study'),
(5, '6943270352', 'aswin@shaastra.org', 'Aswin Manoj S A', 'Catering'),
(6, '9346518363', 'chengala@shaastra.org', 'Chengala Akshay Raj', 'Computer Literacy For All'),
(7, '7487787217', 'chinta@shaastra.org', 'Chinta U M Manikanta Sai Chara', 'Contraptions'),
(8, '4344036173', 'dharanipragada@shaastra.org', 'Dharanipragada Pavan', 'Creative Design'),
(9, '2011870400', 'gurram@shaastra.org', 'Gurram Niharika', 'Desmod'),
(10, '7129384740', 'hindoriya@shaastra.org', 'Hindoriya Sagar Mukund', 'Equipment'),
(11, '2023010796', 'jobin@shaastra.org', 'Jobin K J', 'Exhibitions'),
(12, '2805890317', 'karnati@shaastra.org', 'Karnati Harish Kumar', 'Face Off'),
(13, '8478155211', 'manohar@shaastra.org', 'Manohar Reddy Y P', 'Fire n Ice'),
(14, '8019998951', 'nallu@shaastra.org', 'Nallu Harshavardhan', 'Fox Hunt'),
(15, '3708556227', 'nimmakayala@shaastra.org', 'Nimmakayala Prasanth Kumar Red', 'Gamedrome'),
(16, '2053741737', 'raja@shaastra.org', 'Raja Keshav Jayakrishnan', 'GA PA Materials'),
(17, '6600549120', 'ravi@shaastra.org', 'Ravi Kumar Bisoi', 'Graphic Design'),
(18, '6790221887', 'saurabh@shaastra.org', 'Saurabh Kumar Sonkar', 'Hackfest'),
(19, '9197385808', 'shahbaz@shaastra.org', 'Shahbaz Khalid', 'Hospitality'),
(20, '5028048499', 'shaik@shaastra.org', 'Shaik Abdul Riyaz', 'Hovercraft'),
(21, '2266533533', 'surya@shaastra.org', 'Surya Teja D', 'IDP'),
(22, '1895217294', 'syed@shaastra.org', 'Syed Ashruf', 'IITM Ideas Challenge'),
(23, '1560274106', 'umesh@shaastra.org', 'Umesh Kumar', 'Junkyard Wars'),
(24, '8274044234', 'vankayala@shaastra.org', 'Vankayala Achuta Murali Karthi', 'Lectures and VCs'),
(25, '8343062313', 'vasireddy@shaastra.org', 'Vasireddy Saiashwin', 'Magic Materials'),
(26, '5030696629', 'vennela@shaastra.org', 'Vennela D', 'Math Modelling'),
(27, '6260241885', 'vivek@shaastra.org', 'Vivek Subramaniam', 'MobOps'),
(28, '2884222154', 'srinikethan@shaastra.org', 'Srinikethan S', 'Newsletter and PR'),
(29, '1180437965', 'aakash@shaastra.org', 'Aakash Sharan', 'Online Events'),
(30, '2772664063', 'abhinav@shaastra.org', 'Abhinav Gopal', 'OPC'),
(31, '9788649774', 'aditya@shaastra.org', 'Aditya Sriganesh', 'Paper Plane'),
(32, '9726567433', 'amit@shaastra.org', 'Amit Agrawal', 'Photography'),
(33, '5113305159', 'anirudh@shaastra.org', 'Anirudh Aggarwal', 'Pilot Training'),
(34, '9074632766', 'chetan@shaastra.org', 'Chetan S', 'Prize and Prize Money'),
(35, '9340471744', 'chinta@shaastra.org', 'Chinta Navya', 'Production'),
(36, '1441939512', 'chitiprolu@shaastra.org', 'Chitiprolu Maneka', 'Project X'),
(37, '5247517178', 'deepanjali@shaastra.org', 'Deepanjali D', 'Publicity'),
(38, '9596414208', 'garlapati@shaastra.org', 'Garlapati Shashank', 'Puzzle Champ'),
(39, '7594547348', 'govind@shaastra.org', 'Govind Krishna Joshi', 'QMS'),
(40, '9392309981', 'kanakiya@shaastra.org', 'Kanakiya Jay Nitesh', 'Reverse Coding'),
(41, '1781539433', 'kontham@shaastra.org', 'Kontham Spandana', 'Robo-Oceana'),
(42, '7620311674', 'loukya@shaastra.org', 'Loukya Reddy Garlapati', 'Robotics'),
(43, '3888701534', 'monish@shaastra.org', 'Monish R', 'Robowars'),
(44, '8093336290', 'naladimmu@shaastra.org', 'Naladimmu Sreelakshmi', 'Sales and Distribution'),
(45, '2755656884', 'nayan@shaastra.org', 'Nayan Jain', 'SCDC'),
(46, '2354139625', 'nishita@shaastra.org', 'Nishita Srivastava', 'Shaastra Cube Open'),
(47, '2955195191', 'pavan@shaastra.org', 'Pavan Kumar Allada', 'Shaastra Junior'),
(48, '3856208168', 'purnima@shaastra.org', 'Purnima P', 'Shaastra Main Quiz'),
(49, '4385822256', 'raghavendran@shaastra.org', 'Raghavendran P', 'Shaastra Nights'),
(50, '5954839018', 'revanth@shaastra.org', 'Revanth Dodla', 'Sketch It'),
(51, '9600197515', 'sitra@shaastra.org', 'Sitra Akand', 'Spons Creative'),
(52, '7363222311', 'sumedha@shaastra.org', 'Sumedha Pareek', 'Sponsorship and PR'),
(53, '2673306445', 'vishnu@shaastra.org', 'Vishnu Nair', 'Spons Publicity'),
(54, '7923413560', 'vivek@shaastra.org', 'Vivek P', 'Sustainable Cityscape'),
(55, '9690117680', 'vivek@shaastra.org', 'Vivek Sathvic G', 'Symposium'),
(56, '9442962371', 'kanikarla@shaastra.org', 'Kanikarla Rachana', 'Triathlon'),
(57, '5531817902', 'rathi@shaastra.org', 'Rathi Suraj Shivprakash', 'Ultimate Engineer'),
(58, '9874967771', 'shruthy@shaastra.org', 'Shruthy Suresh', 'Videography'),
(59, '4665879550', 'singanamalla@shaastra.org', 'Singanamalla Sai Kalyan Ranga', 'VIP Care'),
(60, '5564988495', 'satuluri@shaastra.org', 'Satuluri Anusha', 'Vishesh'),
(61, '7821269923', 'addagatla@shaastra.org', 'Addagatla Jayadheer', 'WebOps'),
(62, '5791453863', 'aditya@shaastra.org', 'Aditya K', 'Wright Design'),
(63, '9656218943', 'angadi@shaastra.org', 'Angadi Praveen Kumar', 'Aerobotics'),
(64, '8877786852', 'anoop@shaastra.org', 'Anoop Sonker', 'Air Show'),
(65, '6827849132', 'a@shaastra.org', 'A Aravind', 'Ambience'),
(66, '2295541576', 'avneesh@shaastra.org', 'Avneesh Pal', 'Case Study'),
(67, '7593132543', 'bethanavel@shaastra.org', 'Bethanavel K', 'Catering'),
(68, '8909811287', 'bonigila@shaastra.org', 'Bonigila Chinna Raidu', 'Computer Literacy For All'),
(69, '8344547235', 'chunduru@shaastra.org', 'Chunduru Prasanthkumar', 'Contraptions'),
(70, '3455565041', 'deepak@shaastra.org', 'Deepak Sahoo', 'Creative Design'),
(71, '9797021041', 'deepthi@shaastra.org', 'Deepthi Sen', 'Desmod'),
(72, '1697862987', 'devireddy@shaastra.org', 'Devireddy Saiprashanthreddy', 'Equipment'),
(73, '8449151380', 'dharitri@shaastra.org', 'Dharitri Narjaree', 'Exhibitions'),
(74, '4268429883', 'eshu@shaastra.org', 'Eshu Middha', 'Face Off'),
(75, '3010860013', 'gangireddygari@shaastra.org', 'Gangireddygari Harshavardhan R', 'Fire n Ice'),
(76, '6359872842', 'gaugin@shaastra.org', 'Gaugin Gyanendra Singh', 'Fox Hunt'),
(77, '3661509813', 'gootam@shaastra.org', 'Gootam Manoj Kumar', 'Gamedrome'),
(78, '4901970889', 'gopalakrishna@shaastra.org', 'Gopalakrishna K S V', 'GA PA Materials'),
(79, '1247116302', 'govind@shaastra.org', 'Govind Menon', 'Graphic Design'),
(80, '2323500172', 'gudapati@shaastra.org', 'Gudapati Naga Venkata Chaitany', 'Hospitality'),
(81, '6928229291', 'joshiba@shaastra.org', 'Joshiba A V', 'Hackfest'),
(82, '5934607714', 'kartik@shaastra.org', 'Kartik Shandilya', 'Paper Plane'),
(83, '9965903491', 'kartikeya@shaastra.org', 'Kartikeya Kabra', 'WebOps'),
(84, '6382273880', 'katakam@shaastra.org', 'Katakam Manojkumar', 'Creative Design'),
(85, '6882040442', 'krishna@shaastra.org', 'Krishna Dheeraj Yagalla', 'Math Modelling'),
(86, '5463778581', 'maley@shaastra.org', 'Maley Sahithi', 'VIP Care'),
(87, '2743817396', 'maneesh@shaastra.org', 'Maneesh Kumar Chintalapudi', 'GA PA Materials'),
(88, '6059480976', 'marella@shaastra.org', 'Marella Lokeswara Reddy', 'Fox Hunt'),
(89, '7615092798', 'mylarisettigopikrishna@shaastr', 'Mylarisettigopikrishna', 'Robo-Oceana'),
(90, '7590169871', 'nagabandi@shaastra.org', 'Nagabandi Nirup Kumar', 'WebOps'),
(91, '3028398226', 'nagileti@shaastra.org', 'Nagileti Yeswanth', 'Shaastra Cube Open'),
(92, '9917188120', 'narasingam@shaastra.org', 'Narasingam Abhinav', 'Robowars'),
(93, '6807613088', 'nikhil@shaastra.org', 'Nikhil Dosi', 'Project X'),
(94, '4475547819', 'pankaj@shaastra.org', 'Pankaj B', 'Pilot Training'),
(95, '2840847153', 'parikshit@shaastra.org', 'Parikshit Prakash Inala', 'Prize and Prize Money'),
(96, '7304258270', 'pavan@shaastra.org', 'Pavan Kumar Reddy A', 'Paper Plane'),
(97, '2768917649', 'polireddy@shaastra.org', 'Polireddy Srikanth', 'Sketch It'),
(98, '6159428852', 'potluri@shaastra.org', 'Potluri Mallikharjuna', 'Reverse Coding'),
(99, '1160577257', 'pradeep@shaastra.org', 'Pradeep Kankani', 'Triathlon');

-- --------------------------------------------------------

--
-- Table structure for table `core`
--

CREATE TABLE IF NOT EXISTS `core` (
  `core_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`core_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `core`
--

INSERT INTO `core` (`core_id`, `name`, `phone`, `email`) VALUES
(1, 'Chetan Bademi', '9665478987', 'chetanbademi@shaastra.org'),
(2, 'David', '9876556789', 'gasser@shaastra.org'),
(3, 'Karthik Abinav', '9003246639', 'kabinav@shaastra.org'),
(4, 'Smit Mehta', '9478412487', 'smit.meh@gmail.com'),
(5, 'Abhiram R', '7898745654', 'abhiram@shaastra.org'),
(6, 'Pankaj', '8789143517', 'panks@shaastra.org'),
(7, 'Mycroft Holmes', '9456712345', 'programminggod@shaastra.org'),
(8, 'Aircraft Naran', '9566634670', 'sabarinaran@shaastra.org'),
(9, 'Petr Mitrichekov', '9445466550', 'petr@shaastra.org'),
(10, 'Gennady Keratkovich', '8555600010', 'tourist@shaastra.org');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `deptno` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `active_dates` varchar(30) DEFAULT NULL,
  `head` int(11) DEFAULT NULL,
  PRIMARY KEY (`deptno`),
  KEY `department_ibfk_2` (`head`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptno`, `name`, `active_dates`, `head`) VALUES
(1, 'QMS', 'Both', 1),
(2, 'WebOperations', 'Before', 2),
(3, 'Hospitality', 'During', 3),
(4, 'Publicity', 'Before', 4),
(5, 'Design', 'Both', 5),
(6, 'Events', 'During', 6),
(7, 'General Arrangement', 'During', 7),
(8, 'Catering', 'During', 8),
(9, 'Finance', 'During', 9),
(10, 'Sponsorship and PR', 'Before', 10);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `name` varchar(30) NOT NULL,
  `cost` float DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`name`, `cost`) VALUES
('carpets', 2500),
('chair', 400),
('laptop', 50000),
('marker', 30),
('microphone', 300),
('pen', 10),
('pendrive', 900),
('projector', 4000),
('speakers', 2000),
('whiteboard', 600);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `r_unique_id` int(11) NOT NULL,
  `hostel` varchar(30) DEFAULT NULL,
  `roomno` varchar(30) DEFAULT NULL,
  `residents` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_unique_id`),
  KEY `rooms_ibfk_1` (`residents`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`r_unique_id`, `hostel`, `roomno`, `residents`) VALUES
(1, ' Hostel 9', '651', 30),
(2, ' Hostel 8', '905', 56),
(3, ' Hostel 4', '970', 57),
(4, ' Hostel 4', '981', 73),
(5, ' Hostel 9', '461', 77),
(6, ' Hostel 7', '105', 69),
(7, ' Hostel 4', '646', 88),
(8, ' Hostel 2', '921', 38),
(9, ' Hostel 6', '942', 58),
(10, ' Hostel 7', '578', 83),
(11, ' Hostel 5', '179', 78),
(12, ' Hostel 7', '520', 28),
(13, ' Hostel 6', '289', 28),
(14, ' Hostel 8', '161', 63),
(15, ' Hostel 6', '619', 87),
(16, ' Hostel 6', '515', 33),
(17, ' Hostel 1', '408', 85),
(18, ' Hostel 2', '100', 80),
(19, ' Hostel 2', '296', 87),
(20, ' Hostel 4', '172', 47),
(21, ' Hostel 6', '421', 15),
(22, ' Hostel 2', '506', 80),
(23, ' Hostel 5', '701', 91),
(24, ' Hostel 1', '639', 35),
(25, ' Hostel 6', '466', 44),
(26, ' Hostel 9', '892', 83),
(27, ' Hostel 2', '216', 51),
(28, ' Hostel 6', '692', 42),
(29, ' Hostel 5', '328', 12),
(30, ' Hostel 8', '920', 50),
(31, ' Hostel 5', '771', 90),
(32, ' Hostel 8', '699', 68),
(33, ' Hostel 9', '247', 91),
(34, ' Hostel 4', '316', 42),
(35, ' Hostel 2', '378', 31),
(36, ' Hostel 7', '740', 37),
(37, ' Hostel 9', '424', 56),
(38, ' Hostel 4', '731', 17),
(39, ' Hostel 3', '273', 75),
(40, ' Hostel 8', '906', 46),
(41, ' Hostel 3', '244', 71),
(42, ' Hostel 2', '578', 43),
(43, ' Hostel 1', '567', 39),
(44, ' Hostel 5', '743', 62),
(45, ' Hostel 3', '822', 23),
(46, ' Hostel 2', '215', 65),
(47, ' Hostel 3', '992', 76),
(48, ' Hostel 1', '757', 47),
(49, ' Hostel 3', '403', 68),
(50, ' Hostel 8', '598', 68),
(51, ' Hostel 9', '603', 36),
(52, ' Hostel 3', '523', 11),
(53, ' Hostel 9', '855', 85),
(54, ' Hostel 7', '492', 98),
(55, ' Hostel 1', '892', 12),
(56, ' Hostel 8', '812', 21),
(57, ' Hostel 4', '851', 95),
(58, ' Hostel 4', '972', 83),
(59, ' Hostel 8', '670', 76),
(60, ' Hostel 5', '578', 96),
(61, ' Hostel 2', '266', 52),
(62, ' Hostel 3', '553', 68),
(63, ' Hostel 9', '496', 69),
(64, ' Hostel 6', '772', 54),
(65, ' Hostel 3', '164', 34),
(66, ' Hostel 5', '479', 99),
(67, ' Hostel 3', '835', 70),
(68, ' Hostel 9', '485', 19),
(69, ' Hostel 8', '690', 71),
(70, ' Hostel 5', '713', 67),
(71, ' Hostel 5', '854', 17),
(72, ' Hostel 2', '180', 55),
(73, ' Hostel 5', '941', 66),
(74, ' Hostel 2', '631', 69),
(75, ' Hostel 4', '529', 33),
(76, ' Hostel 8', '678', 46),
(77, ' Hostel 8', '188', 37),
(78, ' Hostel 3', '930', 54),
(79, ' Hostel 5', '196', 82),
(80, ' Hostel 3', '774', 39),
(81, ' Hostel 7', '102', 79),
(82, ' Hostel 3', '882', 31),
(83, ' Hostel 4', '525', 31),
(84, ' Hostel 3', '371', 15),
(85, ' Hostel 3', '839', 23),
(86, ' Hostel 7', '611', 87),
(87, ' Hostel 3', '941', 66),
(88, ' Hostel 3', '948', 63),
(89, ' Hostel 2', '331', 12),
(90, ' Hostel 9', '137', 68),
(91, ' Hostel 6', '751', 76),
(92, ' Hostel 9', '431', 33),
(93, ' Hostel 1', '350', 92),
(94, ' Hostel 3', '690', 41),
(95, ' Hostel 3', '318', 72),
(96, ' Hostel 3', '849', 15),
(97, ' Hostel 6', '526', 78),
(98, ' Hostel 3', '891', 90),
(99, ' Hostel 3', '527', 85);

-- --------------------------------------------------------

--
-- Table structure for table `subdepartment`
--

CREATE TABLE IF NOT EXISTS `subdepartment` (
  `event_name` varchar(30) NOT NULL,
  `time` datetime DEFAULT NULL,
  `venue` varchar(30) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `equipment_id` varchar(30) DEFAULT NULL,
  `department` int(11) NOT NULL,
  PRIMARY KEY (`event_name`),
  KEY `event_ibfk_4` (`department`),
  KEY `event_ibfk_3` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subdepartment`
--

INSERT INTO `subdepartment` (`event_name`, `time`, `venue`, `money`, `equipment_id`, `department`) VALUES
('Aerobotics', '0000-00-00 00:00:00', 'Venue 6', 573, 'carpets', 6),
('Air Show', '0000-00-00 00:00:00', 'Venue 8', 992, 'chair', 6),
('Ambience', '0000-00-00 00:00:00', 'Venue 8', 625, 'laptop', 5),
('Case Study', '0000-00-00 00:00:00', 'Venue 5', 467, 'marker', 6),
('Catering', '0000-00-00 00:00:00', 'Venue 5', 296, 'microphone', 8),
('Computer Literacy For All', '0000-00-00 00:00:00', 'Venue 4', 554, 'pen', 6),
('Contraptions', '0000-00-00 00:00:00', 'Venue 5', 893, 'pendrive', 6),
('Creative Design', '0000-00-00 00:00:00', 'Venue 9', 234, 'projector', 5),
('Desmod', '0000-00-00 00:00:00', 'Venue 8', 866, 'speakers', 6),
('Equipment', '0000-00-00 00:00:00', 'Venue 3', 801, 'whiteboard', 7),
('Exhibitions', '0000-00-00 00:00:00', 'Venue 6', 785, 'carpets', 6),
('Face Off', '0000-00-00 00:00:00', 'Venue 3', 318, 'pen', 6),
('Fire n Ice', '0000-00-00 00:00:00', 'Venue 6', 715, 'speakers', 6),
('Fox Hunt', '0000-00-00 00:00:00', 'Venue 3', 129, 'pendrive', 6),
('GA PA Materials', '0000-00-00 00:00:00', 'Venue 4', 955, 'pendrive', 7),
('Gamedrome', '0000-00-00 00:00:00', 'Venue 6', 580, 'projector', 6),
('Graphic Design', '0000-00-00 00:00:00', 'Venue 2', 575, 'projector', 5),
('Hackfest', '0000-00-00 00:00:00', 'Venue 6', 324, 'carpets', 6),
('Hospitality', '0000-00-00 00:00:00', 'Venue 2', 166, 'projector', 3),
('Hovercraft', '0000-00-00 00:00:00', 'Venue 3', 244, 'whiteboard', 6),
('IDP', '0000-00-00 00:00:00', 'Venue 4', 162, 'marker', 6),
('IITM Ideas Challenge', '0000-00-00 00:00:00', 'Venue 1', 376, 'pendrive', 6),
('Junkyard Wars', '0000-00-00 00:00:00', 'Venue 6', 996, 'speakers', 6),
('Lectures and VCs', '0000-00-00 00:00:00', 'Venue 9', 987, 'chair', 6),
('Magic Materials', '0000-00-00 00:00:00', 'Venue 2', 216, 'laptop', 6),
('Math Modelling', '0000-00-00 00:00:00', 'Venue 6', 360, 'marker', 6),
('MobOps', '0000-00-00 00:00:00', 'Venue 5', 355, 'speakers', 2),
('Newsletter and PR', '0000-00-00 00:00:00', 'Venue 9', 674, 'carpets', 10),
('Online Events', '0000-00-00 00:00:00', 'Venue 6', 154, 'chair', 6),
('OPC', '0000-00-00 00:00:00', 'Venue 2', 360, 'pen', 6),
('Paper Plane', '0000-00-00 00:00:00', 'Venue 2', 847, 'pen', 6),
('Photography', '0000-00-00 00:00:00', 'Venue 6', 882, 'marker', 5),
('Pilot Training', '0000-00-00 00:00:00', 'Venue 5', 493, 'microphone', 6),
('Prize and Prize Money', '0000-00-00 00:00:00', 'Venue 4', 660, 'carpets', 9),
('Production', '0000-00-00 00:00:00', 'Venue 3', 854, 'chair', 7),
('Project X', '0000-00-00 00:00:00', 'Venue 7', 185, 'laptop', 6),
('Publicity', '0000-00-00 00:00:00', 'Venue 7', 454, 'speakers', 4),
('Puzzle Champ', '0000-00-00 00:00:00', 'Venue 9', 328, 'speakers', 6),
('QMS', '0000-00-00 00:00:00', 'Venue 9', 982, 'microphone', 1),
('Reverse Coding', '0000-00-00 00:00:00', 'Venue 1', 140, 'laptop', 6),
('Robo-Oceana', '0000-00-00 00:00:00', 'Venue 5', 284, 'whiteboard', 6),
('Robotics', '0000-00-00 00:00:00', 'Venue 9', 497, 'chair', 6),
('Robowars', '0000-00-00 00:00:00', 'Venue 4', 752, 'marker', 6),
('Sales and Distribution', '0000-00-00 00:00:00', 'Venue 9', 520, 'pen', 9),
('SCDC', '0000-00-00 00:00:00', 'Venue 3', 856, 'projector', 6),
('Shaastra Cube Open', '0000-00-00 00:00:00', 'Venue 6', 774, 'speakers', 6),
('Shaastra Junior', '0000-00-00 00:00:00', 'Venue 5', 421, 'whiteboard', 6),
('Shaastra Main Quiz', '0000-00-00 00:00:00', 'Venue 2', 777, 'chair', 6),
('Shaastra Nights', '0000-00-00 00:00:00', 'Venue 7', 340, 'microphone', 6),
('Sketch It', '0000-00-00 00:00:00', 'Venue 6', 773, 'whiteboard', 6),
('Spons Creative', '0000-00-00 00:00:00', 'Venue 5', 325, 'chair', 10),
('Spons Publicity', '0000-00-00 00:00:00', 'Venue 2', 106, 'pendrive', 10),
('Sponsorship and PR', '0000-00-00 00:00:00', 'Venue 9', 148, 'projector', 10),
('Sustainable Cityscape', '0000-00-00 00:00:00', 'Venue 4', 856, 'carpets', 6),
('Symposium', '0000-00-00 00:00:00', 'Venue 3', 980, 'microphone', 6),
('Triathlon', '0000-00-00 00:00:00', 'Venue 8', 667, 'projector', 6),
('Ultimate Engineer', '0000-00-00 00:00:00', 'Venue 1', 753, 'chair', 6),
('Videography', '0000-00-00 00:00:00', 'Venue 5', 440, 'projector', 5),
('VIP Care', '0000-00-00 00:00:00', 'Venue 9', 956, 'carpets', 8),
('Vishesh', '0000-00-00 00:00:00', 'Venue 5', 499, 'whiteboard', 10),
('WebOps', '0000-00-00 00:00:00', 'Venue 3', 230, 'microphone', 2),
('Wright Design', '0000-00-00 00:00:00', 'Venue 8', 476, 'carpets', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `core` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `coordinator` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `tasks_ibfk_1` (`core`),
  KEY `tasks_ibfk_3` (`coordinator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`core`, `task_id`, `deadline`, `coordinator`) VALUES
(3, 1, '2012-08-20 00:00:00', 63),
(1, 2, '2012-07-03 00:00:00', 76),
(1, 3, '2012-08-30 00:00:00', 53),
(9, 4, '2012-03-09 00:00:00', 57),
(6, 5, '2012-01-27 00:00:00', 47),
(5, 6, '2012-07-05 00:00:00', 66),
(2, 7, '2012-04-03 00:00:00', 47),
(8, 8, '2012-04-12 00:00:00', 27),
(5, 9, '2012-08-19 00:00:00', 98),
(9, 10, '2012-01-16 00:00:00', 41),
(3, 11, '2012-09-06 00:00:00', 44),
(9, 12, '2012-04-07 00:00:00', 66),
(3, 13, '2012-03-23 00:00:00', 89),
(9, 14, '2012-03-29 00:00:00', 82),
(7, 15, '2012-11-05 00:00:00', 17),
(2, 16, '2012-03-29 00:00:00', 65),
(1, 17, '2012-09-16 00:00:00', 28),
(2, 18, '2012-01-09 00:00:00', 23),
(8, 19, '2012-04-10 00:00:00', 67),
(7, 20, '2012-09-29 00:00:00', 56),
(3, 21, '2012-07-15 00:00:00', 13),
(7, 22, '2012-09-30 00:00:00', 65),
(3, 23, '2012-07-27 00:00:00', 14),
(5, 24, '2012-04-16 00:00:00', 23),
(6, 25, '2012-02-06 00:00:00', 64),
(3, 26, '2012-04-24 00:00:00', 48),
(9, 27, '2012-02-22 00:00:00', 45),
(4, 28, '2012-07-02 00:00:00', 55),
(5, 29, '2012-02-14 00:00:00', 91),
(1, 30, '2012-10-24 00:00:00', 33),
(9, 31, '2012-05-11 00:00:00', 92),
(3, 32, '2012-05-29 00:00:00', 86),
(7, 33, '2012-08-11 00:00:00', 15),
(2, 34, '2012-03-15 00:00:00', 11),
(3, 35, '2012-02-15 00:00:00', 26),
(4, 36, '2012-01-06 00:00:00', 66),
(1, 37, '2012-04-07 00:00:00', 77),
(7, 38, '2012-10-21 00:00:00', 59),
(8, 39, '2012-02-07 00:00:00', 92),
(6, 40, '2012-04-03 00:00:00', 77),
(9, 41, '2012-03-01 00:00:00', 53),
(6, 42, '2012-02-09 00:00:00', 53),
(3, 43, '2012-03-10 00:00:00', 13),
(9, 44, '2012-04-09 00:00:00', 51),
(5, 45, '2012-02-12 00:00:00', 68),
(5, 46, '2012-10-15 00:00:00', 71),
(5, 47, '2012-04-27 00:00:00', 37),
(8, 48, '2012-03-08 00:00:00', 23),
(8, 49, '2012-05-29 00:00:00', 23),
(7, 50, '2012-05-18 00:00:00', 12),
(7, 51, '2012-08-07 00:00:00', 50),
(8, 52, '2012-04-20 00:00:00', 92),
(7, 53, '2012-02-10 00:00:00', 30),
(6, 54, '2012-02-08 00:00:00', 12),
(3, 55, '2012-05-03 00:00:00', 30),
(5, 56, '2012-09-11 00:00:00', 60),
(2, 57, '2012-05-30 00:00:00', 77),
(3, 58, '2012-09-29 00:00:00', 78),
(9, 59, '2012-01-15 00:00:00', 74),
(7, 60, '2012-10-22 00:00:00', 46),
(7, 61, '2012-07-22 00:00:00', 70),
(9, 62, '2012-03-06 00:00:00', 86),
(4, 63, '2012-02-24 00:00:00', 40),
(1, 64, '2012-01-07 00:00:00', 51),
(3, 65, '2012-05-14 00:00:00', 99),
(6, 66, '2012-05-15 00:00:00', 64),
(6, 67, '2012-10-16 00:00:00', 29),
(9, 68, '2012-02-14 00:00:00', 54),
(5, 69, '2012-04-10 00:00:00', 75),
(6, 70, '2012-03-21 00:00:00', 44),
(4, 71, '2012-09-07 00:00:00', 48),
(3, 72, '2012-06-30 00:00:00', 12),
(9, 73, '2012-09-30 00:00:00', 64),
(7, 74, '2012-06-18 00:00:00', 32),
(2, 75, '2012-05-19 00:00:00', 18),
(7, 76, '2012-05-21 00:00:00', 98),
(4, 77, '2012-05-24 00:00:00', 55),
(4, 78, '2012-06-13 00:00:00', 77),
(9, 79, '2012-04-03 00:00:00', 37),
(4, 80, '2012-09-25 00:00:00', 42),
(8, 81, '2012-08-11 00:00:00', 90),
(8, 82, '2012-06-06 00:00:00', 41),
(5, 83, '2012-03-08 00:00:00', 63),
(6, 84, '2012-10-13 00:00:00', 89),
(4, 85, '2012-10-12 00:00:00', 85),
(8, 86, '2012-10-10 00:00:00', 15),
(1, 87, '2012-07-19 00:00:00', 57),
(7, 88, '2012-04-30 00:00:00', 58),
(7, 89, '2012-09-06 00:00:00', 53),
(7, 90, '2012-06-20 00:00:00', 47),
(2, 91, '2012-07-03 00:00:00', 56),
(6, 92, '2012-08-24 00:00:00', 24),
(2, 93, '2012-04-22 00:00:00', 56),
(8, 94, '2012-03-11 00:00:00', 75),
(7, 95, '2012-08-02 00:00:00', 60),
(4, 96, '2012-03-17 00:00:00', 61),
(5, 97, '2012-08-20 00:00:00', 62),
(3, 98, '2012-03-16 00:00:00', 83),
(2, 99, '2012-09-12 00:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE IF NOT EXISTS `visitors` (
  `visitor_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `college` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`visitor_id`, `name`, `phone`, `email`, `college`) VALUES
(1, 'Delta-Gravitation', '4770118024', 'delta-gravitation@gmail.com', 'College 50'),
(2, 'subhash', '6067277992', 'subhash@gmail.com', 'College 19'),
(3, 'parvulus rapidus', '6896056713', 'parvulus@gmail.com', 'College 47'),
(4, 'intendo', '1253658612', 'intendo@gmail.com', 'College 43'),
(5, 'gvpe mighty mech', '9672399321', 'gvpe@gmail.com', 'College 47'),
(6, 'HTTP', '8783419073', 'http@gmail.com', 'College 19'),
(7, 'gvpe mighty mech', '8453163694', 'gvpe@gmail.com', 'College 74'),
(8, 'Spark', '8871155333', 'spark@gmail.com', 'College 94'),
(9, 'destructors', '4263059255', 'destructors@gmail.com', 'College 44'),
(10, 'codebreakers', '9787911812', 'codebreakers@gmail.com', 'College 13'),
(11, 'ultimator', '9127071741', 'ultimator@gmail.com', 'College 50'),
(12, 'trs', '4641839481', 'trs@gmail.com', 'College 51'),
(13, 'FULLMETAL', '5325917033', 'fullmetal@gmail.com', 'College 43'),
(14, 'BlitzkreigSSN', '7869176600', 'blitzkreigssn@gmail.com', 'College 84'),
(15, 'PROLOGUE', '5178461916', 'prologue@gmail.com', 'College 61'),
(16, 'Raju', '8619689150', 'raju@gmail.com', 'College 64'),
(17, 'VSB', '4622299950', 'vsb@gmail.com', 'College 19'),
(18, 'dashers', '3930316151', 'dashers@gmail.com', 'College 85'),
(19, 'dirigeants', '4139827032', 'dirigeants@gmail.com', 'College 86'),
(20, 'Test Team', '7008202791', 'test@gmail.com', 'College 64'),
(21, 'rockstars', '1204386311', 'rockstars@gmail.com', 'College 38'),
(22, 'Back Benchers', '8960996709', 'back@gmail.com', 'College 89'),
(23, 'The Ultimates', '7004636463', 'the@gmail.com', 'College 41'),
(24, 'Instrumentation engineers', '9783592829', 'instrumentation@gmail.com', 'College 54'),
(25, 'chargers', '9144208495', 'chargers@gmail.com', 'College 47'),
(26, 'Ares', '2161382154', 'ares@gmail.com', 'College 44'),
(27, 'rminitt', '3014695319', 'rminitt@gmail.com', 'College 97'),
(28, 'IIIT-N', '6086087829', 'iiit-n@gmail.com', 'College 92'),
(29, 'MEGATON', '8260617785', 'megaton@gmail.com', 'College 73'),
(30, 'the sting', '8495613025', 'the@gmail.com', 'College 91'),
(31, 'Zodiac', '8381929291', 'zodiac@gmail.com', 'College 83'),
(32, 'Team Mandak', '8030635478', 'team@gmail.com', 'College 41'),
(33, 'GANADORES', '7957485594', 'ganadores@gmail.com', 'College 49'),
(34, 'robomod', '3801208051', 'robomod@gmail.com', 'College 71'),
(35, 'CRR SPICE', '4248289165', 'crr@gmail.com', 'College 12'),
(36, 'Ballista', '8118135090', 'ballista@gmail.com', 'College 62'),
(37, 'TAGORE ', '9729559300', 'tagore@gmail.com', 'College 54'),
(38, 'sakura', '7949685407', 'sakura@gmail.com', 'College 70'),
(39, 'Test ', '1915684600', 'test@gmail.com', 'College 91'),
(40, 'RCmonsters', '1839102748', 'rcmonsters@gmail.com', 'College 18'),
(41, 'trailblazzers', '8014930433', 'trailblazzers@gmail.com', 'College 35'),
(42, 'SIMPLE', '9633513936', 'simple@gmail.com', 'College 62'),
(43, 'ROCK ON', '2453104993', 'rock@gmail.com', 'College 48'),
(44, 'vignesh', '3272264307', 'vignesh@gmail.com', 'College 84'),
(45, 'vignesh', '7711710947', 'vignesh@gmail.com', 'College 27'),
(46, 'vignesh', '1640859756', 'vignesh@gmail.com', 'College 39'),
(47, 'autobots', '6676857531', 'autobots@gmail.com', 'College 19'),
(48, 'Instrumentation engineers', '2161632845', 'instrumentation@gmail.com', 'College 92'),
(49, 'Enovators', '5403033256', 'enovators@gmail.com', 'College 21'),
(50, 'Spartans', '3234005248', 'spartans@gmail.com', 'College 84'),
(51, 'war', '5561597378', 'war@gmail.com', 'College 30'),
(52, 'kingmakers', '1129799543', 'kingmakers@gmail.com', 'College 30'),
(53, 'ICY Infernos', '9771968204', 'icy@gmail.com', 'College 12'),
(54, 'Supernova', '7512672493', 'supernova@gmail.com', 'College 78'),
(55, 'Nautilus', '6983315078', 'nautilus@gmail.com', 'College 68'),
(56, 'mecadrianz', '6844719929', 'mecadrianz@gmail.com', 'College 51'),
(57, 'sanshodhaks', '1304165518', 'sanshodhaks@gmail.com', 'College 99'),
(58, 'Eureka v2.0', '3870928222', 'eureka@gmail.com', 'College 65'),
(59, 'kathiravan J', '2360868861', 'kathiravan@gmail.com', 'College 91'),
(60, 'admiral', '5655137683', 'admiral@gmail.com', 'College 90'),
(61, 'Aalhad Parulekar', '4272227459', 'aalhad@gmail.com', 'College 20'),
(62, 'sara92', '6900464001', 'sara92@gmail.com', 'College 77'),
(63, 'Jugaad', '3613702646', 'jugaad@gmail.com', 'College 53'),
(64, 'Pirates', '6165776325', 'pirates@gmail.com', 'College 79'),
(65, 'Akash Pandey', '7476755968', 'akash@gmail.com', 'College 35'),
(66, 'Saranathan', '7247310196', 'saranathan@gmail.com', 'College 52'),
(67, 'Nex Gen', '6693228921', 'nex@gmail.com', 'College 52'),
(68, 'Nex Gen', '9380578448', 'nex@gmail.com', 'College 49'),
(69, 'ICY Infernos', '3386055964', 'icy@gmail.com', 'College 12'),
(70, 'EXPLORERS', '9039728214', 'explorers@gmail.com', 'College 78'),
(71, 'PRANJAL KATARA', '8742690700', 'pranjal@gmail.com', 'College 15'),
(72, 'akatsuki', '5447218366', 'akatsuki@gmail.com', 'College 74'),
(73, 'Velociraptor', '6566763682', 'velociraptor@gmail.com', 'College 81'),
(74, 'Innovators', '5361812460', 'innovators@gmail.com', 'College 70'),
(75, 'ablaze', '5768194786', 'ablaze@gmail.com', 'College 32'),
(76, 'XXX', '7796688138', 'xxx@gmail.com', 'College 25'),
(77, 'Team 7', '6371064842', 'team@gmail.com', 'College 39'),
(78, 'ecolectra', '3466231280', 'ecolectra@gmail.com', 'College 51'),
(79, 'Achilles ', '9519539774', 'achilles@gmail.com', 'College 56'),
(80, 'ELO', '9424790208', 'elo@gmail.com', 'College 11'),
(81, 'NEBULA', '4667325321', 'nebula@gmail.com', 'College 33'),
(82, 'Twinkle', '7376731085', 'twinkle@gmail.com', 'College 43'),
(83, 'Battle Ship 004', '2443676469', 'battle@gmail.com', 'College 16'),
(84, 'dynamites', '9943767564', 'dynamites@gmail.com', 'College 83'),
(85, 'dynamites', '1299986318', 'dynamites@gmail.com', 'College 98'),
(86, 'dynamites', '3286470412', 'dynamites@gmail.com', 'College 76'),
(87, 'EXCALIBUR', '3279497363', 'excalibur@gmail.com', 'College 23'),
(88, 'PRADYUMNA', '9834194770', 'pradyumna@gmail.com', 'College 24'),
(89, 'dynamites', '6519197539', 'dynamites@gmail.com', 'College 16'),
(90, 'MATRIX', '2297378682', 'matrix@gmail.com', 'College 91'),
(91, 'iCreate', '8047630899', 'icreate@gmail.com', 'College 65'),
(92, 'Johnson Tellis', '1023919316', 'johnson@gmail.com', 'College 81'),
(93, 'THEJUS', '6632743685', 'thejus@gmail.com', 'College 98'),
(94, 'FOXTROT', '5617518158', 'foxtrot@gmail.com', 'College 83'),
(95, 'THREADERS', '3792141030', 'threaders@gmail.com', 'College 19'),
(96, 'CRYSIS', '1010893242', 'crysis@gmail.com', 'College 38'),
(97, 'Circuit Masters', '3543211967', 'circuit@gmail.com', 'College 10'),
(98, 'sastra pirates', '7759423171', 'sastra@gmail.com', 'College 50'),
(99, 'Test', '9074216041', 'test@gmail.com', 'College 90');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attending_events`
--
ALTER TABLE `attending_events`
  ADD CONSTRAINT `attending_events_ibfk_5` FOREIGN KEY (`event`) REFERENCES `subdepartment` (`event_name`),
  ADD CONSTRAINT `attending_events_ibfk_2` FOREIGN KEY (`event`) REFERENCES `subdepartment` (`event_name`),
  ADD CONSTRAINT `attending_events_ibfk_4` FOREIGN KEY (`visitor`) REFERENCES `visitors` (`visitor_id`);

--
-- Constraints for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD CONSTRAINT `coordinator_ibfk_2` FOREIGN KEY (`event`) REFERENCES `subdepartment` (`event_name`),
  ADD CONSTRAINT `coordinator_ibfk_1` FOREIGN KEY (`event`) REFERENCES `subdepartment` (`event_name`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`head`) REFERENCES `core` (`core_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`residents`) REFERENCES `visitors` (`visitor_id`);

--
-- Constraints for table `subdepartment`
--
ALTER TABLE `subdepartment`
  ADD CONSTRAINT `subdepartment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`name`),
  ADD CONSTRAINT `subdepartment_ibfk_3` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`name`),
  ADD CONSTRAINT `subdepartment_ibfk_4` FOREIGN KEY (`department`) REFERENCES `department` (`deptno`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`core`) REFERENCES `core` (`core_id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`coordinator`) REFERENCES `coordinator` (`coord_id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`coordinator`) REFERENCES `coordinator` (`coord_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
