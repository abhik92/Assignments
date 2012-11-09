-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2012 at 10:19 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `coordinator`
--

CREATE TABLE IF NOT EXISTS `coordinator` (
  `coord_id` int(11) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`coord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `deptno` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `active_dates` datetime DEFAULT NULL,
  `event` varchar(30) DEFAULT NULL,
  `head` int(11) DEFAULT NULL,
  PRIMARY KEY (`deptno`),
  KEY `event` (`event`),
  KEY `head` (`head`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `name` varchar(30) NOT NULL,
  `cost` float DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_name` varchar(30) NOT NULL,
  `time` datetime DEFAULT NULL,
  `venue` varchar(30) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `equipment_id` varchar(30) DEFAULT NULL,
  `coordinator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_name`),
  KEY `coordinator_id` (`coordinator_id`),
  KEY `equipment_id` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  KEY `residents` (`residents`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  KEY `core` (`core`),
  KEY `coordinator` (`coordinator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Constraints for dumped tables
--

--
-- Constraints for table `attending_events`
--
ALTER TABLE `attending_events`
  ADD CONSTRAINT `attending_events_ibfk_3` FOREIGN KEY (`event`) REFERENCES `event` (`event_name`),
  ADD CONSTRAINT `attending_events_ibfk_1` FOREIGN KEY (`visitor`) REFERENCES `visitors` (`visitor_id`),
  ADD CONSTRAINT `attending_events_ibfk_2` FOREIGN KEY (`event`) REFERENCES `event` (`event_name`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`head`) REFERENCES `core` (`core_id`),
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`event`) REFERENCES `event` (`event_name`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`name`),
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`coordinator_id`) REFERENCES `coordinator` (`coord_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`name`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`residents`) REFERENCES `visitors` (`visitor_id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`coordinator`) REFERENCES `coordinator` (`coord_id`),
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`core`) REFERENCES `core` (`core_id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`coordinator`) REFERENCES `coordinator` (`coord_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
