-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2024 at 02:08 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zen_app`
--
CREATE DATABASE IF NOT EXISTS `zen_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `zen_app`;

-- --------------------------------------------------------

--
-- Table structure for table `stress_level`
--

CREATE TABLE `stress_level` (
  `userId` varchar(20) NOT NULL,
  `date_tested` datetime NOT NULL,
  `stress_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stress_level`
--

INSERT INTO `stress_level` (`userId`, `date_tested`, `stress_level`) VALUES
('031202070771', '2024-02-01 22:52:21', 'no stress'),
('031202070771', '2024-02-09 22:52:21', 'high stress'),
('031202070771', '2024-02-29 14:36:51', 'low stress'),
('031202070771', '2024-02-29 14:37:06', 'high stress'),
('031202070771', '2024-02-29 17:05:13', 'high stress'),
('031202070771', '2024-02-29 17:10:17', 'high stress'),
('031202070771', '2024-02-29 17:18:27', 'high stress'),
('031202070771', '2024-03-01 00:39:00', 'low stress'),
('031202070771', '2024-03-01 01:39:03', 'low stress'),
('031202070771', '2024-03-03 18:04:37', 'mid stress'),
('031202070771', '2024-03-04 01:01:45', 'mid stress'),
('031202070771', '2024-03-04 01:05:02', 'mid stress'),
('031202070771', '2024-03-04 01:11:43', 'mid stress'),
('031202070771', '2024-03-04 01:48:42', 'high stress'),
('031202070771', '2024-03-04 02:15:43', 'high stress'),
('031202070771', '2024-03-05 02:08:59', 'no stress'),
('031202070771', '2024-03-06 00:39:29', 'high stress'),
('031202070771', '2024-03-13 00:39:42', 'mid stress');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userName` varchar(40) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userBirthDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userName`, `userId`, `userEmail`, `userPassword`, `userBirthDate`) VALUES
('fraud', '000000110000', 'fraudwatch@gmail.com', '$2b$12$G4kOLF4CwKeMctF35WwtzutreNFjUzakY.4tUU4s3scEt0bnws..2', '2024-01-17'),
('abi', '031202070771', 'tinaabishegan1@gmail.com', '$2b$12$eLn2tXvXs.QmYb4ebHQWGO8laCxXJLOUu.0G/1WIRcHzZ4R8RYwsm', '2003-12-02'),
('abi22', '031202070777', 'tinaabisheganaa@gmail.com', '$2b$12$bKSiG3Zu2TBZ.HImYhps5Od4tfpQZByGtLVqhLaFiVhuSuX6Bf2V6', '2003-12-02'),
('tester', '123456789011', 'tester@gmail.com', '$2b$12$INghasqG255V55jEb/JVJOib54eoW2EqjqvjRdE03TTXX/con7Jii', '2015-12-14'),
('junkit', '123456789012', 'junkit', '$2b$12$PueulSET7aN97prQGv9Roe86V0v8nrM50S8T3rFjswB58/sKqhfga', '2024-01-11'),
('Chee Jun Kit', '12345679012', 'junkit@mountainbike.com', '$2b$12$1jb6Ymh5IxzhXXW6SCsB2eZ5/P8ODDnj6Q7BjnWglEPmuZNcqEfce', '2003-12-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stress_level`
--
ALTER TABLE `stress_level`
  ADD UNIQUE KEY `date_tested` (`date_tested`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stress_level`
--
ALTER TABLE `stress_level`
  ADD CONSTRAINT `stress_level_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
