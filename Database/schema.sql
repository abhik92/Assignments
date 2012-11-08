
-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5+lenny1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2012 at 08:57 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6-1+lenny9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `DBProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `core`
--

CREATE TABLE IF NOT EXISTS `core` (
  `core_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) default NULL,
  `email` varchar(20) default NULL,
  `task_id` int(11) default NULL,
  `headed_by` int(11) default NULL,
  PRIMARY KEY  (`core_id`),
  KEY `task_id` (`task_id`),
  KEY `headed_by` (`headed_by`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `core`
--


-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `active_dates` date NOT NULL,
  `headed_by` int(11) NOT NULL,
  PRIMARY KEY  (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `department`
--


-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE IF NOT EXISTS `Tasks` (
  `task_id` int(11) NOT NULL,
  `core` int(11) default NULL,
  `deadline` datetime default NULL,
  `coordinator` int(11) default NULL,
  PRIMARY KEY  (`task_id`),
  KEY `core` (`core`),
  KEY `coordinator` (`coordinator`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tasks`
--
