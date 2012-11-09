-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2012 at 12:25 AM
-- Server version: 5.1.65
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shaastra_2013_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3585 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'air_show', '', '', 'air_show@shaastra.org', 'pbkdf2_sha256$10000$jJH5gDKYJkTE$lkj7Bw75wvWflW+iLKpsGaGKYkFpZlQLkYg3y62pLqI=', 0, 1, 0, '2012-10-28 23:33:19', '2012-07-26 00:02:33'),
(2, 'wright_design', '', '', 'wright_design@shaastra.org', 'pbkdf2_sha256$10000$mfBjGgMxunGN$CoMPjodRoQBwjwGL/7/8VH/FvONkTp8Ks55EeN/3tp8=', 0, 1, 0, '2012-11-07 20:49:26', '2012-07-26 00:02:33'),
(3, 'paper_planes', '', '', 'paper_planes@shaastra.org', 'pbkdf2_sha256$10000$QbuCtBG1XdDx$DvkJy1t+Gmmh2ulStDj0m0wI1krvS+/1PqnMemt6vW8=', 0, 1, 0, '2012-09-30 17:32:46', '2012-07-26 00:02:33'),
(4, 'aerobotics', '', '', 'aerobotics@shaastra.org', 'pbkdf2_sha256$10000$TqsNLTyRP0du$NqgvqF4eKVA1mPzAYFTY65B5yN8Ey0Bs2lTuvl1houE=', 0, 1, 0, '2012-11-07 08:48:00', '2012-07-26 00:02:33'),
(5, 'hackfest', '', '', 'hackfest@shaastra.org', 'pbkdf2_sha256$10000$O8u7UkesH9KX$43z88vqRzvgc8l1z3XHwpyfYNymRJFx0Sr4XqB3FVzc=', 0, 1, 0, '2012-11-09 19:48:57', '2012-07-26 00:02:33'),
(6, 'opc', '', '', 'opc@shaastra.org', 'pbkdf2_sha256$10000$vJKmiFijaYZL$oNr/P7/JvWY9IRjh8zP0nAvyrBnOFmNU2vtX8NAWnyI=', 0, 1, 0, '2012-10-01 03:32:01', '2012-07-26 00:02:33'),
(7, 'reverse_coding', '', '', 'reverse_coding@shaastra.org', 'pbkdf2_sha256$10000$bBZPxM37acW4$AKVHBjGqut0VM7DAYyb4NWXnmT6+Ia2ZHHP/IhsWwV4=', 0, 1, 0, '2012-10-25 21:51:25', '2012-07-26 00:02:33'),
(8, 'robowars', '', '', 'robowars@shaastra.org', 'pbkdf2_sha256$10000$wyyl3esv2QMz$ynSg2KejeQ+90S63a7Y8u9Det5XPkigW79ftuH9MShw=', 0, 1, 0, '2012-11-07 17:33:50', '2012-07-26 00:02:33'),
(9, 'contraption', '', '', 'contraption@shaastra.org', 'pbkdf2_sha256$10000$i6mUwJhpQSBI$mx7tndINDgilhx69BY2vvn6IvxagNrN7h8xKQarBSxU=', 0, 1, 0, '2012-11-09 15:46:32', '2012-07-26 00:02:33'),
(10, 'fire_n_ice', '', '', 'fire_n_ice@shaastra.org', 'pbkdf2_sha256$10000$5Id50QHLw1mV$EAILU1Jhxk6CX+hD6Lef0VRZMdIq2fWsHwnuH1NvWHA=', 0, 1, 0, '2012-11-07 18:46:19', '2012-07-26 00:02:33'),
(11, 'robotics', '', '', 'robotics@shaastra.org', 'pbkdf2_sha256$10000$hOqgJ9p7Qowo$wSO15MWIQ+OZPieNFM0Jj6mJFMdpoQR7ZrPY8tZkjPs=', 0, 1, 0, '2012-11-09 18:49:03', '2012-07-26 00:02:33'),
(12, 'junkyard_wars', '', '', 'junkyard_wars@shaastra.org', 'pbkdf2_sha256$10000$Qzla7TTRpsA4$whwxx8/hzp9fCOFKOkCeZ72QevBc/SEfIzYfPz/NXsI=', 0, 1, 0, '2012-10-02 02:01:58', '2012-07-26 00:02:33'),
(13, 'ultimate_engineer', '', '', 'ultimate_engineer@shaastra.org', 'pbkdf2_sha256$10000$yPBnjXidCFhm$U3mNsV0qqya3QmN/6sVWyE1xAoH3zJGfVMGZEeVWVP0=', 0, 1, 0, '2012-10-02 02:47:51', '2012-07-26 00:02:33'),
(14, 'project_x', '', '', 'project_x@shaastra.org', 'pbkdf2_sha256$10000$uPvHBBXgvxh3$II9yQT3/DW61b3Fiucil/2IBsBcQ7qFHOSmEiu5GLQs=', 0, 1, 0, '2012-10-02 22:05:58', '2012-07-26 00:02:33'),
(15, 'shaastra_cube_open', '', '', 'shaastra_cube_open@shaastra.org', 'pbkdf2_sha256$10000$d52marUfSY64$24eB3UzhOsN+oByNawD/uVHBvwAyxVDJQCZ5/fuQaMc=', 0, 1, 0, '2012-10-13 21:34:57', '2012-07-26 00:02:33'),
(16, 'puzzle_champ', '', '', 'puzzle_champ@shaastra.org', 'pbkdf2_sha256$10000$BXpSL35esKPO$BvvTUm5qcwWOzN4rcl/BdELA8jcQxWXK4mBycUT6yko=', 0, 1, 0, '2012-10-23 20:25:23', '2012-07-26 00:02:33'),
(17, 'math_modelling', '', '', 'math_modelling@shaastra.org', 'pbkdf2_sha256$10000$1oBjA1rk28td$cnNQewKyKzyPoSzm1jlr20i/I4j/MBx8RjqEM74XCs8=', 0, 1, 0, '2012-10-20 23:51:28', '2012-07-26 00:02:33'),
(18, 'fox_hunt', '', '', 'fox_hunt@shaastra.org', 'pbkdf2_sha256$10000$PQUI43wmuVff$57VDVzUfZeVBpJWF36yv4bduOLucpisbXyWZX6mj6TQ=', 0, 1, 0, '2012-10-24 21:49:29', '2012-07-26 00:02:33'),
(19, 'shaastra_main_quiz', '', '', 'shaastra_main_quiz@shaastra.org', 'pbkdf2_sha256$10000$X4DJyNKm4n9C$rY64QzvjvYPBd2Cl4eQO1DJKPFQ/OggkWFCA6699N8E=', 0, 1, 0, '2012-10-01 03:57:43', '2012-07-26 00:02:33'),
(20, 'htw', '', '', 'htw@shaastra.org', 'pbkdf2_sha256$10000$cHkLngN0cbIt$FhQGJgs43Iq2on5QiJ276qDRmK3lPIglBSFVE8Q5vxc=', 0, 1, 0, '2012-10-01 03:30:07', '2012-07-26 00:02:33'),
(21, 'auto_quiz', '', '', 'auto_quiz@shaastra.org', 'pbkdf2_sha256$10000$JzGPB1KCnV1O$k/R4LB+mm8ti6E3ntzler1pJL0ZjufGtgS/5sYW5Sy8=', 0, 1, 0, '2012-10-05 23:03:14', '2012-07-26 00:02:33'),
(22, 'shaastra_junior_quiz', '', '', 'shaastra_junior_quiz@shaastra.org', 'pbkdf2_sha256$10000$XipZtX6AFuHz$UJmyLGX0DbNzCS4Pf6YpGAkVF8MD1P5yKmHm02NCwvk=', 0, 1, 0, '2012-10-01 02:05:11', '2012-07-26 00:02:33'),
(23, 'online_events', '', '', 'online_events@shaastra.org', 'pbkdf2_sha256$10000$dFewNpYaGVtb$DdKueVURrCGDEhtlKJ042eAtryqRx0vqYeHhS841w5o=', 0, 1, 0, '2012-11-09 18:27:34', '2012-07-26 00:02:33'),
(24, 'desmod', '', '', 'desmod@shaastra.org', 'pbkdf2_sha256$10000$TmsK7D8VCuaS$EUweYqhK+QQwycl04o1R2ZrJtc9394uufzZoFKEcQjo=', 0, 1, 0, '2012-11-06 21:39:20', '2012-07-26 00:02:33'),
(25, 'scdc', '', '', 'scdc@shaastra.org', 'pbkdf2_sha256$10000$t5JETuiW5BK3$3yaNfP/X1y1QPsgLdEG7fg/PgUpAwKeszvMoKpJyaaM=', 0, 1, 0, '2012-11-03 14:27:19', '2012-07-26 00:02:33'),
(26, 'robo-oceana', '', '', 'robo-oceana@shaastra.org', 'pbkdf2_sha256$10000$JYAVl88LYGvv$Ft9HMdCHH/sn5KNCFUsyamjmEHq0rAd2iq+pcxVj6b0=', 0, 1, 0, '2012-11-03 14:12:53', '2012-07-26 00:02:33'),
(27, 'game_drome', '', '', 'game_drome@shaastra.org', 'pbkdf2_sha256$10000$KjGgL4bm7Vdg$c2RX7oDES2jEmG0E6/ollLZjNHicB4weAf/ixu3pZt8=', 0, 1, 0, '2012-10-05 03:28:49', '2012-07-26 00:02:33'),
(28, 'idp', '', '', 'idp@shaastra.org', 'pbkdf2_sha256$10000$HjzpTrs6l8Jt$mGCYvD6P07wUeaE1duOLcTD9n+A4/atBuJx4Yd9iMw4=', 0, 1, 0, '2012-10-02 19:57:50', '2012-07-26 00:02:33'),
(29, 'shaastra_junior', '', '', 'shaastra_junior@shaastra.org', 'pbkdf2_sha256$10000$Mf1I3VR2iF4N$8PuLJYfFUuRFx1wRfWiS9DSAiw6Eo4ZQ7P3X1N7fMBY=', 0, 1, 0, '2012-10-01 03:28:44', '2012-07-26 00:02:33'),
(30, 'sustainable_cityscape', '', '', 'sustainable_cityscape@shaastra.org', 'pbkdf2_sha256$10000$jfHPNltuNsxF$Tp9gZ8nQDZvQPnyJnSEkneYmFaaocby3tHkp15UEWzI=', 0, 1, 0, '2012-11-08 17:26:34', '2012-07-26 00:02:33'),
(31, 'case_study', '', '', 'case_study@shaastra.org', 'pbkdf2_sha256$10000$jUVxM6XH7qRm$To5PH//pEfHUk66lhEd+ZZooR5oXojb5SBC58DqNqRc=', 0, 1, 0, '2012-10-25 15:06:54', '2012-07-26 00:02:33'),
(32, 'magic', '', '', 'magic@shaastra.org', 'pbkdf2_sha256$10000$DiT6rrafy3YE$4yQEQpCxdbg52oa7ervpE+tQoqjqSXI9G7MKECQzZQo=', 0, 1, 0, '2012-10-01 23:37:06', '2012-07-26 00:02:33'),
(57, 'B_Sampark_Quiz', '', '', 'Bengaluru_Sampark_Quiz@shaastra.org', 'pbkdf2_sha256$10000$iZXVYtF9jdPQ$1XGkWYdRmRC85BK3+nWUIidjIQdkjKE9TD2T4KOQgXk=', 0, 1, 0, '2012-08-08 23:24:37', '2012-08-08 23:04:26'),
(34, 'face_off', '', '', 'face_off@shaastra.org', 'pbkdf2_sha256$10000$2EEl3PlTvTzv$E3vGK2B8/SoD1KutZtTqvrhdqkjL8C1/C1Pnn+YQblE=', 0, 1, 0, '2012-11-07 14:23:18', '2012-07-26 00:02:33'),
(35, 'sketch_it', '', '', 'sketch_it@shaastra.org', 'pbkdf2_sha256$10000$FWE4Z5RCV0Y6$NK9V/CURFUkAD2JRm9OoezsfGBS22krR+RO+6L546I4=', 0, 1, 0, '2012-10-28 10:45:21', '2012-07-26 00:02:33'),
(36, 'pilot_training', '', '', 'pilot_training@shaastra.org', 'pbkdf2_sha256$10000$8RRrhrsYkG1R$rvdrIe4Xl+sZwIJcLkrYArfNRuy8ATLXKnIS4mWT/RI=', 0, 1, 0, '2012-10-24 23:42:52', '2012-07-26 00:02:33'),
(37, 'hovercraft', '', '', 'hovercraft@shaastra.org', 'pbkdf2_sha256$10000$WFbCo0pHpVNX$/mKYR1FZuUrxNiSNnNfBHwyHMSF7sxtTvzYWlls9/0E=', 0, 1, 0, '2012-11-08 17:33:04', '2012-07-26 00:02:33'),
(38, 'research_expo', '', '', 'research_expo@shaastra.org', 'pbkdf2_sha256$10000$hZWgdVyCGtQD$B2p0JwLOhX9ubWfyceaWxKmEy20ACHhzK0+LeS7l4tQ=', 0, 1, 0, '2012-09-30 17:16:45', '2012-07-26 00:02:33'),
(39, 'lectures', '', '', 'lectures@shaastra.org', 'pbkdf2_sha256$10000$npqM05QHSGdG$jWeKKCbvxE6RaQLN7SWpzSaPuvRoNOTvlF7NXsDokuM=', 0, 1, 0, '2012-10-24 22:11:12', '2012-07-26 00:02:33'),
(40, 'shaastra', '', '', 'webmaster@shaastra.org', 'pbkdf2_sha256$10000$rkP0257nBX4F$yZNAo8+K1XEutbI04h8XzTya7esoaJgVSJYffWkgd6I=', 0, 1, 1, '2012-10-12 13:36:14', '2012-07-26 00:02:33'),
(41, 'eventscore', '', '', 'tanuj1411@gmail.com', 'pbkdf2_sha256$10000$cZMbWfxdPt9v$ZjkwkFFdBvlY4bjQlvyQNhnhJXIVLSLhKXHwp6iI83I=', 0, 1, 0, '2012-11-07 22:33:27', '2012-07-26 00:02:33'),
(2192, 'vivek2609', 'vivek', 'e', 'kingofkings.vivek@gmail.com', 'pbkdf2_sha256$10000$DZeA5ozPSDKg$+0T0KHYR5jMkojXfuInV5UnECc+vWtXrhmAyBkMMmYA=', 0, 1, 0, '2012-10-26 06:37:05', '2012-10-26 06:32:45'),
(45, 'triathalon', '', '', 'triathalon@shaastra.org', 'pbkdf2_sha256$10000$DGIcy1EMoYjv$qLHBCJLyDXF0GGEvN2RSNVx/GEYE/cmaTg6C/RNaV5o=', 0, 1, 0, '2012-11-07 18:46:28', '2012-07-28 12:29:57'),
(52, 'vigneshp', 'vignesh', 'p', 'vicky.rps.46@gmail.com', 'pbkdf2_sha256$10000$Nnk31U9P20pZ$2sk0YGqyNMb5laviwK8XTKC2NiXQARPf5CS5bzlM0g4=', 0, 0, 0, '2012-08-04 08:49:30', '2012-08-04 08:49:30'),
(47, 'senthilnathan254', 'senthilnathan', 'R', 'senthilnathan254@gmail.com', 'pbkdf2_sha256$10000$7farhcIT7s29$TIPaQzZ8hLP60hioNGO2NyyyiP1nO6Qh1QPmeWcJxJM=', 0, 0, 0, '2012-08-02 09:58:17', '2012-07-31 15:44:54'),
(48, 'vigneshprabhakara', 'vignesh', 'p', 'vigneshprabhakara@gmail.com', 'pbkdf2_sha256$10000$Ut77EDfskYoa$Ih9Gya1uJcag4V1W5xgICwcPf4/uAzj6lOTNcNlBIus=', 0, 0, 0, '2012-08-01 12:59:26', '2012-08-01 12:59:26'),
(49, 'uma', 'Uma', 'Naganathan', 'uma.naganathan@gmail.com', 'pbkdf2_sha256$10000$B7LnZsUGppyu$y2Qz2JkEm6L6C6fhVJP/V+zap+QF8pK38KVNNSPhVmc=', 0, 0, 0, '2012-08-03 21:54:25', '2012-08-03 21:54:25'),
(56, 'B_Puzzle_Champ', '', '', 'puzzle_champ@shaastra.org ', 'pbkdf2_sha256$10000$43InWBTkpslp$WBh4uGEqmvyurNi1Ah9ZRRstn/1WJe1L/KsDnb4M/V0=', 0, 1, 0, '2012-08-08 23:24:15', '2012-08-08 23:02:33'),
(50, 'arijit91', 'Arijit', 'Banerjee', 'arijit91@gmail.com', 'pbkdf2_sha256$10000$43YGU0R6y4jN$2uExUB7Hw5QbEz6N8j3QcYUovKQxSX3DN2LctdQbwZY=', 0, 0, 0, '2012-08-03 22:36:31', '2012-08-03 22:36:31'),
(51, 'chetanbademi', 'Chetan', 'Bademi', 'chetanbademi@gmail.com', 'pbkdf2_sha256$10000$i3ArKtG5uMlb$ZhMXzdlAdYQzIZfzJqC92sA86YC7pDvaU1fwZt+TOAI=', 0, 1, 0, '2012-10-07 06:33:54', '2012-08-04 00:44:03'),
(53, 'smit.patoliya', 'Smit', 'Patoliya', 'swastik_mastiguru@yahoo.com', 'pbkdf2_sha256$10000$dGpzsJGK5mr5$6Q9ec9ZO0+Mt4TiEc0M1ojPegbgURsySA8MRPDAtOqs=', 0, 1, 0, '2012-08-04 11:36:35', '2012-08-04 11:36:35'),
(54, 'surajy123', 'Suraj', 'Yerramilli', 'surajy123@gmail.com', 'pbkdf2_sha256$10000$khHgvQAGeoQT$Fiz8ZrIIXoVWWGSUFKg6WOkcgrxqm8NVPcs7Ayze5YM=', 0, 1, 0, '2012-11-05 01:57:34', '2012-08-05 16:09:08'),
(55, 'suraj.harikumar', 'Suraj', 'Harikumar', 'suri.suraj_93@yahoo.co.in', 'pbkdf2_sha256$10000$7CLRkgsBYypD$iKidcx5qVusKklQfs/P85iLn9vM1Rk8gHzEVJlNUqvM=', 0, 1, 0, '2012-08-12 22:12:02', '2012-08-06 17:42:01'),
(58, 'B_Desmod', '', '', 'desmod@shaastra.org ', 'pbkdf2_sha256$10000$LEmyD6a8d55a$qPCeal8SyXfEavhEbZ0WahWFGwrT70NpFAAfVh2/uT0=', 0, 1, 0, '2012-08-09 20:54:44', '2012-08-08 23:04:53'),
(59, 'B_Sustainable_Cityscape', '', '', 'sustainable_cityscape@shaastra.org ', 'pbkdf2_sha256$10000$64hEgBs8qhOx$uLJUP39m0GEuKOVZzHi7c0qf1N3kZg+Ytw+N0aWWSXY=', 0, 1, 0, '2012-08-08 23:28:42', '2012-08-08 23:05:37'),
(60, 'H_Project_X', '', '', 'project_x@shaastra.org ', 'pbkdf2_sha256$10000$9zTqlh0uzMnQ$wxRncJvhSssiWn4NTuYkBtpJS3NpSwc9ppa6zzBkoz0=', 0, 1, 0, '2012-08-08 23:06:15', '2012-08-08 23:06:15'),
(61, 'H_Auto_Quiz', '', '', 'auto_quiz@shaastra.org ', 'pbkdf2_sha256$10000$AyJEhldrW8We$AJdSsi+8+T3M8LJ2rMnSS3clvWoIiTLoE2+r1fTjHHw=', 0, 1, 0, '2012-08-08 23:07:31', '2012-08-08 23:07:31'),
(62, 'H_Autonomous_Robotics', '', '', 'robotics@shaastra.org ', 'pbkdf2_sha256$10000$2EpQTFbDwQiX$+ItVbQ5+j9zjD8xUFL5y7WF/NwuYNgd764SJaJcmhQE=', 0, 1, 0, '2012-08-08 23:07:59', '2012-08-08 23:07:59'),
(63, 'H_Contraptions', '', '', 'contraption@shaastra.org ', 'pbkdf2_sha256$10000$vxJ0uPXQq6zi$5tE+TcpY0E3Dnf9/ugClSZ065bgupEUxK1CJomCKTw8=', 0, 1, 0, '2012-08-08 23:08:49', '2012-08-08 23:08:49'),
(632, 'lohitbsne', 'lohit', 'bsne', 'lohitbsne@gmail.com', 'pbkdf2_sha256$10000$MLrmnWJ3rzZq$fb2s1BOPOACRE+HRHOszOPme6U/6RD7znPebfUpDUjI=', 0, 0, 0, '2012-10-02 00:15:19', '2012-10-02 00:15:19'),
(65, 'P_How_Things_Work', '', '', 'htw@shaastra.org ', 'pbkdf2_sha256$10000$e3Y4fJ0QxGqu$EbgOcXL3M82Izv9Uj5A9sX+seftWmyNu12OKu5E8WLk=', 0, 1, 0, '2012-08-08 23:09:42', '2012-08-08 23:09:42'),
(84, 'C_Auto_Quiz', '', '', 'C_Auto_Quiz@shaastra.org', 'pbkdf2_sha256$10000$tE4eAsTSlBHl$U695O622UMMbnIF3nd0tSJRLqoddv6BG9rmjLRJf0zA=', 0, 1, 0, '2012-08-28 05:32:17', '2012-08-28 05:32:17'),
(85, 'C_Sustainable_Cityscape', '', '', 'C_Sustainable_Cityscape@shaastra.org', 'pbkdf2_sha256$10000$bKYudaLydk3k$jmuYdVr5GaqQBvw2dGdVV8pqCeqRUqn5bAaMUn+bNXI=', 0, 1, 0, '2012-08-28 05:32:52', '2012-08-28 05:32:52'),
(69, 'manaswi.mishra', 'Manaswi', 'Mishra', 'manaswimishra@hotmail.com', 'pbkdf2_sha256$10000$YuQe7fVMkIUe$EiKY4lf+fK7ZObrz8bMsXEken5HWvT2KeapEI46PcWw=', 0, 1, 0, '2012-08-11 19:32:59', '2012-08-11 19:32:58'),
(70, 'Manikandasriram', 'Manikandasriram', 'Ramana Gopal', 'srmanikandasriram@gmail.com', 'pbkdf2_sha256$10000$XiLQlhKpCxKu$M1dSMzA8teZwpTT5ZuQiPQI+nl5SuMQZSaT5yv+kFuQ=', 0, 0, 0, '2012-08-11 20:22:25', '2012-08-11 20:22:25'),
(71, 'anusheel.pareek', 'Anusheel', 'Pareek', 'pareekanusheel@gmail.com', 'pbkdf2_sha256$10000$yaNqxr1XAwO8$AU9l4PIqy6atmqX8sxdwxB26tCYbhrxbDDe6/dPoiNw=', 0, 1, 0, '2012-08-11 22:01:14', '2012-08-11 21:58:57'),
(2191, 'mofeezalam', 'mofeezalam', 'mohammad', 'mofeezalam786@gmail.com', 'pbkdf2_sha256$10000$cALWMAJ7bF3o$3Wg2/tcTOQbLDrBPAaM481NvRmxTY1iIcqYh7xipGIo=', 0, 1, 0, '2012-11-03 14:17:31', '2012-10-26 01:45:19'),
(73, 'skyler1029384756', 'Suraj', 'kumar', 'skyler1029384756@gmail.com', 'pbkdf2_sha256$10000$oK7HEltD8dFz$Iq7Xbq+6a7X/hhn+Oa73HXWBipfpbG2aR1rjykmltAM=', 0, 0, 0, '2012-08-12 22:19:02', '2012-08-12 22:19:02'),
(75, 'IITM_Ideas_Challenge', '', '', 'IITM_Ideas_Challenge@shaastra.org', 'pbkdf2_sha256$10000$FsjRRSC8Kb2j$ZbWDNw3qdx1UYVHzKTjrTXdxMgue2rJL0ejZmfu6dnM=', 0, 1, 0, '2012-10-19 21:36:20', '2012-08-18 01:55:39'),
(78, 'Shaastra_Nights', '', '', 'Shaastra_Nights@shaastra.org', 'pbkdf2_sha256$10000$ordkVJ9SQqKS$9pFemGzgWDLOk5ctRtogjQAbCtp4LnxzmPaJsB+ci/g=', 0, 1, 0, '2012-08-21 04:31:36', '2012-08-18 02:39:09'),
(79, 'Shaastra_Exhibitions', '', '', 'Shaastra_Exhibitions@shaastra.org', 'pbkdf2_sha256$10000$AqKqg4AYcPVg$ycRt9D0jQvGGCC6ZUL/4VK4QOzDgCzh9yV6s0fxER8c=', 0, 1, 0, '2012-08-21 04:25:35', '2012-08-18 02:42:01'),
(1337, 'ktksubhash', 'TULASI KRISHNA SUBHASH', 'KARANKI', 'ktksubhash@gmail.com', 'pbkdf2_sha256$10000$sw1ITsZ2cwrM$/NJ3cp3+FdrvjOZNnSmKJyWzBd91S/LwJoD2Pz4J7f4=', 0, 1, 0, '2012-11-05 21:54:15', '2012-10-11 18:00:09'),
(81, 'tanuj1411', 'Tanuj', 'Jhunjhunwala', 'me09b097@smail.iitm.ac.in', 'pbkdf2_sha256$10000$Ayx7ksVmhX8O$kZd6v0x8C+pgX0G3atV0vbasLlVJp3iIl1ircTTsAuE=', 0, 0, 0, '2012-08-19 01:13:55', '2012-08-19 01:13:55'),
(82, 'Topgun', '', '', 'Topgun@shaastra.org', 'pbkdf2_sha256$10000$UAHwBOVxeDzy$E3yskA505etlaBAYIRdVHaBGL6p8stfNTVqstX7BWRE=', 0, 1, 0, '2012-11-08 19:01:35', '2012-08-27 18:39:54'),
(83, 'C_Project_X', '', '', 'C_Project_X@shaastra.org', 'pbkdf2_sha256$10000$FHIxUkDpmp24$J43lGfvlN49PnQax1E0MMCSyrYrUTE9E6Icx7Pn1ENU=', 0, 1, 0, '2012-08-28 05:30:23', '2012-08-28 05:30:23'),
(86, 'C_Robotics_Session', '', '', 'C_Robotics_Session@shaastra.org', 'pbkdf2_sha256$10000$B2b2tabyHQke$SmrSbJsT8+AQNYR7LRT7FXBzCuPYMwoHDPnSGTn3XoU=', 0, 1, 0, '2012-09-30 18:04:38', '2012-08-28 05:33:48'),
(87, 'H_Cubing_Workshop', '', '', 'H_Cubing_Workshop@shaastra.org', 'pbkdf2_sha256$10000$DPeqqGs5MgXk$uYFcnmyityjpN9iZZ6SA4VfmxDLPx5vLaX7VqtZkVps=', 0, 1, 0, '2012-09-05 03:20:43', '2012-09-05 03:20:43'),
(88, 'testone', 'Test', 'One', 'test1@gmail.com', 'pbkdf2_sha256$10000$GSr7TBTp40eh$0lQHojkkSiEqokRYyutkkulme5A2A8zapxeEV7lTAjw=', 0, 0, 0, '2012-09-13 02:14:00', '2012-09-13 02:14:00'),
(89, 'C_Hovercraft_Session', '', '', 'C_Hovercraft_Session@shaastra.org', 'pbkdf2_sha256$10000$Ct8pPcKTzSpb$ql9KLiLj06171pa6gLBD+UW5TN+99L0NSYfJr8dcI8g=', 0, 1, 0, '2012-09-19 15:26:22', '2012-09-19 15:26:22'),
(90, 'C_Paper_Planes', '', '', 'C_Paper_Planes@shaastra.org', 'pbkdf2_sha256$10000$G6wjRFomdGZh$8ELc6Rf8UfkUFbs/WwM3wHJ747D+RT2aD6QjMoATS0o=', 0, 1, 0, '2012-09-19 15:26:43', '2012-09-19 15:26:43'),
(91, 'eshwar', 'Lokeshwaran', 'Nagaraj', 'aeroesh@gmail.com', 'pbkdf2_sha256$10000$EDq0AYz7tw67$r/YBv/dBZdoknNDQFv+zIrGSTdEKcMod+eTW/UkrEmk=', 0, 1, 0, '2012-10-07 04:28:35', '2012-09-20 03:05:33'),
(92, 'srivishnuloka', 'Sri Vishnu', 'Loka', 'srivishnuloka@gmail.com', 'pbkdf2_sha256$10000$ETWqmoQQtlsN$vMSePby2MNP46K38WhYb2lmec7bkLhqL5Dv0WyoBTjo=', 0, 1, 0, '2012-09-20 03:15:39', '2012-09-20 03:15:39'),
(93, 'Vachu', 'Thiyagarajan', 'Kamaraj', 'kamarajvachu@gmail.com', 'pbkdf2_sha256$10000$cqaOpaNJWqyW$TJ6hB67tBY6oeGMA9r5ZlLPe5WsJZEdghiLYfUCEhDw=', 0, 0, 0, '2012-09-20 04:18:28', '2012-09-20 04:18:28'),
(94, 'Maddy', 'Thiyagarajan', 'Kamaraj', 'maddyhotdesire@gmail.com', 'pbkdf2_sha256$10000$7XyncanWs3ui$F3yJS27Ot0sIG9KF7YIBbwbp5ov+jisMX0turhgBu68=', 0, 0, 0, '2012-09-20 04:27:07', '2012-09-20 04:27:07'),
(95, 'arbindo', 'ARBINDO', 'GHOSH', 'Arbindo007@gmail.com', 'pbkdf2_sha256$10000$EmhEUepVtlJU$frhKzdfFft5BzEHPhhYdg+kdngdSsHcXScy9FJeTzlI=', 0, 1, 0, '2012-09-20 04:43:50', '2012-09-20 04:43:50'),
(96, 'Ankuaravind', 'Anku', 'Aravind', 'anku.aravind@gmail.com', 'pbkdf2_sha256$10000$FPijpEc5wB9I$XQHjK8PlO2fK/aWupuoYxjuwwG+mhtiix1ENSA+HVK4=', 0, 1, 0, '2012-09-20 09:19:32', '2012-09-20 09:15:18'),
(97, 'gabbaranand', 'anand', 'venkatesh', 'coolnandy15@gmail.com', 'pbkdf2_sha256$10000$yGcJaprp7F0r$uOh5y+3BJY99p1oJQ2uki3kw5+f6883suC5bpuiC8wc=', 0, 1, 0, '2012-10-22 10:44:26', '2012-09-20 11:30:16'),
(98, 'Sarathkumar', 'Sarath', 'Kumar', 'r.sarathkumar2009@gmail.com', 'pbkdf2_sha256$10000$hmlGFbWBbGEO$F2Gd82X2kecd3stNtN5im1WKz/7V6ZkGEqsmKJJU5F4=', 0, 0, 0, '2012-09-20 13:07:46', '2012-09-20 13:07:46'),
(99, 'RAJESHKURRA', 'RAJESH', 'KURRA', 'rajesh2urheartbeat@gmail.com', 'pbkdf2_sha256$10000$kQa4MQ1fSnER$QS6J+E4FS3i9mJZ2mt+pujCYsc0ox6PQDgEuYdKYbCU=', 0, 0, 0, '2012-09-20 13:49:24', '2012-09-20 13:49:24'),
(100, 'kurrarajeshchowdary', 'Rajesh', 'Nani', 'rajeshfromkurra@gmail.com', 'pbkdf2_sha256$10000$36KdnPdsf3WG$gjYAMFNE5w/jVVnPkyNjJItobeDJFkyCcyz2M8XS6bo=', 0, 1, 0, '2012-09-20 13:52:40', '2012-09-20 13:52:40'),
(101, 'rohit8792', 'rohit', 'konusu', 'rohit8792@gmail.com', 'pbkdf2_sha256$10000$nuCvwyfvm1dT$wIzMnbORX5y7KzxQD7bLQeyhEx9GxnHdR8XPNNo6RLs=', 0, 0, 0, '2012-09-20 14:20:31', '2012-09-20 14:20:31'),
(102, 'bharat4u', 'vadapalli', 'bharat', 'bharatvadapalli@gmail.com', 'pbkdf2_sha256$10000$GxDW6R8rmFs3$NGfMWe24JWMckcK6gwpf3y9MNhV3koMUDYq6HT43Gd8=', 0, 0, 0, '2012-09-20 15:25:48', '2012-09-20 15:25:48'),
(103, 'harkishan', 'harikishan', 'puchalapalli', 'pharikishan2312@gmail.com', 'pbkdf2_sha256$10000$IkKCGgfyaasR$L/xmi19i1R/garNn9t12VzK9K02dcsYPKIF3ubw/4Rk=', 0, 0, 0, '2012-09-20 15:52:22', '2012-09-20 15:52:22'),
(104, 'thimmaraju', 'THIMMARAJU', 'govindappagari', 'thimmaraju418@gmail.com', 'pbkdf2_sha256$10000$M6SUhCwMRDZx$3M+wqb56e94xm18pyjY1ttzfnjE0W923SMuelWm7pBs=', 0, 0, 0, '2012-09-20 15:57:03', '2012-09-20 15:57:03'),
(105, 'srinivas', 'pusapati umasankar', 'srinivas varma', 'pusrinivas@gmail.com', 'pbkdf2_sha256$10000$iiG11t0xXRip$Mxx1s8uhrKZmj/Oe5H0H1C0z7lhzALrokggn5CtHVy4=', 0, 0, 0, '2012-09-20 15:58:28', '2012-09-20 15:58:28'),
(106, 'thimmarajubhagath', 'Thimmaraju', 'govindappagari', 'thimmaraju418@yahoo.com', 'pbkdf2_sha256$10000$7pZLORYPmhGq$ZdYA8FrIwrksFCIjD1TK4YA4QBfUMj3EAqFSjjuAt9o=', 0, 1, 0, '2012-09-20 16:05:00', '2012-09-20 16:05:00'),
(107, 'mirzabaig', 'MIRZA AHTESHAM ALI ', 'BAIG', 'mirzabaig_eee@yahoo.com', 'pbkdf2_sha256$10000$N5nni17wJDy9$V7Z23bNEe2/xs+6mexwh195XzZhCOrB1Nioll/2zWUg=', 0, 1, 0, '2012-11-04 02:50:16', '2012-09-20 16:30:12'),
(108, 'sandeepsandy', 'sandeep', 'uriti', 'sundeepyadav143@gmail.com', 'pbkdf2_sha256$10000$hm0NPQLHw5Sv$yRHcZpMpemu2ftnEkv26pJkio5QafALjGZ1yRJVc/3U=', 0, 1, 0, '2012-10-05 17:51:33', '2012-09-20 16:46:13'),
(109, 'karthikkashyap94', 'karthik', 'kashyap', 'karthikkashyap94@gmail.com', 'pbkdf2_sha256$10000$l8diUE02DFhn$FpZgHC4/sea48Gd+yc9hNHyOXyAOZR2NWBzNr7qjcFY=', 0, 0, 0, '2012-09-20 16:52:56', '2012-09-20 16:52:56'),
(110, 'Satvik', 'Sai', 'Satvik', 'ksatvik.sai@gmail.com', 'pbkdf2_sha256$10000$7yvt8lOxj7oV$4Pi1xuQdSF6OAOozj6ocBNX0pfjvdTTQgrG/k/SRUKw=', 0, 0, 0, '2012-09-20 17:19:55', '2012-09-20 17:19:55');
