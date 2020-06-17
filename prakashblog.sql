-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2020 at 11:52 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prakashblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(52) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'First post', 'test@domain.com', '1111111111', 'Hello world', '2020-06-14 00:37:09'),
(2, 'Prakaash dahal', 'pkd@gmail.com', '981111111111', 'Hi i am prakash this is my first message', '2020-06-14 10:12:08'),
(3, 'Raghib', 'abc@gmail.com', '7777777777', 'Hi i am raghib ', '2020-06-14 10:14:09'),
(4, 'Test 2', 'test@domain.com', '9811139398', 'Hello bro', '2020-06-14 11:29:12'),
(5, 'fasdf', 'ffasd@fasd.ff', '22222', 'fsadfsad', '2020-06-14 11:54:26'),
(6, 'fasdf', 'ffasd@fasd.ff', '22222', 'fsadfsad', '2020-06-14 11:55:09'),
(7, 'fasdf', 'ffasd@fasd.ff', '22222', 'fsadfsad', '2020-06-14 11:55:25'),
(8, 'fasdf', 'ffasd@fasd.ff', '22222', 'fsadfsad', '2020-06-14 12:00:19'),
(9, 'fasdf', 'ffasd@fasd.ff', '22222', 'fsadfsad', '2020-06-14 12:04:43'),
(10, 'Ravi', 'ravi@gmail.com', '981111111111', 'Hi i am ravi', '2020-06-14 12:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tagline` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(2, 'Second edited', 'Next', 'second-post', 'Dell edited is an American multinational computer technology company that develops, sells, repairs, and supports computers and related products and services. Named after its founder, Michael Dell, the company is one of the largest technological corporations in the world, employing more than 165,000 people in the U.S. and around the world (Annual report 2020).', '', '2020-06-16 20:22:28'),
(3, 'Third post', 'Next and every wow', 'third-post', 'The National Aeronautics and Space Administration (NASA; /?næs?/) is an independent agency of the United States Federal Government responsible for the civilian space program, as well as aeronautics and space research.[note 1]\r\n\r\nNASA was established in 1958, succeeding the National Advisory Committee for Aeronautics (NACA). The new agency was to have a distinctly civilian orientation, encouraging peaceful applications in space science.[8][9][10] Since its establishment, most US space exploration efforts have been led by NASA, including the Apollo Moon landing missions, the Skylab space station, and later the Space Shuttle. NASA is supporting the International Space Station and is overseeing the development of the Orion Multi-Purpose Crew Vehicle, the Space Launch System, and Commercial Crew vehicles. The agency is also responsible for the Launch Services Program, which provides oversight of launch operations and countdown management for uncrewed NASA launches.\r\n\r\nNASA science is focused on better understanding Earth through the Earth Observing System;[11] advancing heliophysics through the efforts of the Science Mission Directorate\'s Heliophysics Research Program;[12] exploring bodies throughout the Solar System with advanced robotic spacecraft missions such as New Horizons;[13] and researching astrophysics topics, such as the Big Bang, through the Great Observatories and associated programs', '', '2020-06-14 13:54:37'),
(5, 'Fifty post', 'fifth', 'fifth-post', 'The National Aeronautics and Space Administration (NASA; /?næs?/) is an independent agency of the United States Federal Government responsible for the civilian space program, as well as aeronautics and space research.[note 1]\r\n\r\nNASA was established in 1958, succeeding the National Advisory Committee for Aeronautics (NACA). The new agency was to have a distinctly civilian orientation, encouraging peaceful applications in space science.[8][9][10] Since its establishment, most US space exploration efforts have been led by NASA, including the Apollo Moon landing missions, the Skylab space station, and later the Space Shuttle. NASA is supporting the International Space Station and is overseeing the development of the Orion Multi-Purpose Crew Vehicle, the Space Launch System, and Commercial Crew vehicles. The agency is also responsible for the Launch Services Program, which provides oversight of launch operations and countdown management for uncrewed NASA launches.\r\n\r\nNASA science is focused on better understanding Earth through the Earth Observing System;[11] advancing heliophysics through the efforts of the Science Mission Directorate\'s Heliophysics Research Program;[12] exploring bodies throughout the Solar System with advanced robotic spacecraft missions such as New Horizons;[13] and researching astrophysics topics, such as the Big Bang, through the Great Observatories and associated programs', '', '2020-06-14 13:56:20'),
(6, 'Sixth post', 'sixth', 'sixth-slug', 'The National Aeronautics and Space Administration (NASA; /?næs?/) is an independent agency of the United States Federal Government responsible for the civilian space program, as well as aeronautics and space research.[note 1]\r\n\r\nNASA was established in 1958, succeeding the National Advisory Committee for Aeronautics (NACA). The new agency was to have a distinctly civilian orientation, encouraging peaceful applications in space science.[8][9][10] Since its establishment, most US space exploration efforts have been led by NASA, including the Apollo Moon landing missions, the Skylab space station, and later the Space Shuttle. NASA is supporting the International Space Station and is overseeing the development of the Orion Multi-Purpose Crew Vehicle, the Space Launch System, and Commercial Crew vehicles. The agency is also responsible for the Launch Services Program, which provides oversight of launch operations and countdown management for uncrewed NASA launches.\r\n\r\nNASA science is focused on better understanding Earth through the Earth Observing System;[11] advancing heliophysics through the efforts of the Science Mission Directorate\'s Heliophysics Research Program;[12] exploring bodies throughout the Solar System with advanced robotic spacecraft missions such as New Horizons;[13] and researching astrophysics topics, such as the Big Bang, through the Great Observatories and associated programs', '', '2020-06-14 13:56:42'),
(7, 'AI Workflow', 'Hello ', 'new-post', 'hi', 'img.png', '2020-06-15 20:35:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
