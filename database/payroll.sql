-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2018 at 06:50 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE IF NOT EXISTS `accountant` (
  `id` varchar(15) NOT NULL,
  `salutation` varchar(5) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `middlename` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `level` int(1) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountant`
--

INSERT INTO `accountant` (`id`, `salutation`, `firstname`, `middlename`, `lastname`, `dob`, `phoneno`, `emailid`, `level`, `branch`, `department`) VALUES
('Ultiacc01', 'Mr.', 'Janitha', 'Chathu', 'Welipitiya', '1994-09-15', '+94775352384', 'jchathuweli@gmail.com', 0, 'Colombo', 'IT'),
('Ultiacc02', 'Mr.', 'Kasun', 'Chamara', 'Rathnayake', '1994-10-21', '+94778967564', 'kasunchama@gmail.com', 0, 'Colombo', 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `employeeID` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `workedHours` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`employeeID`, `date`, `workedHours`) VALUES
('Ultimate01', '2018-05-10', 9),
('Ultimate01', '2018-05-11', 9),
('Ultimate01', '2018-05-23', 7),
('Ultimate01', '2018-05-19', 8),
('Ultimate01', '2018-05-18', 7),
('Ultimate02', '2018-05-21', 8);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` varchar(15) NOT NULL,
  `salutation` varchar(5) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `middlename` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `designation` varchar(15) NOT NULL,
  `dateofjoin` date NOT NULL,
  `bankname` varchar(25) NOT NULL,
  `accno` int(20) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `department` varchar(20) NOT NULL,
  `basicsalary` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `salutation`, `firstname`, `middlename`, `lastname`, `dob`, `phoneno`, `emailid`, `designation`, `dateofjoin`, `bankname`, `accno`, `branch`, `department`, `basicsalary`) VALUES
('Ultimate01', 'Mr.', 'Janitha', 'Chathu', 'Welipitiya', '1995-09-15', '+94775645678', 'jchathuweli@gmail.com', 'IT Analyst', '2011-08-09', 'BOC', 2110, 'Colombo', 'IT', 27000),
('Ultimate02', 'Miss.', 'Chathuri', 'Supechala', 'perera', '1993-08-15', '+94714567832', 'chathusupee@yahoo.com', 'IT assistant', '2011-03-17', 'NSB', 2115, 'Colombo', 'IT', 20000),
('Ultimate03', 'Miss.', 'Pavithra', 'Sewwandi', 'Weerasinghe', '1992-07-14', '+947137946743', 'pavitha121@gmail.com', 'SE', '2011-02-15', 'NSB', 7865, 'Colombo', 'IT', 25000),
('Ultimate04', 'Miss.', 'Oshani', 'Navodya', 'Mudalige', '1992-08-10', '+94715647786', 'oshnavo@gmail.com', 'SE', '2011-09-05', 'Peoples bank', 1789, 'Colombo', 'IT', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE IF NOT EXISTS `hr` (
  `id` varchar(15) NOT NULL,
  `salutation` varchar(5) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `middlename` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hr`
--

INSERT INTO `hr` (`id`, `salutation`, `firstname`, `middlename`, `lastname`, `dob`, `phoneno`, `emailid`) VALUES
('Ultihr01', 'Mr.', 'Lasith', 'Malinga', 'perera', '1994-06-13', '+94714538789', 'malinga56@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE IF NOT EXISTS `leave` (
  `EL` int(3) NOT NULL,
  `SL` int(3) NOT NULL,
  `CL` int(3) NOT NULL,
  `month` varchar(10) NOT NULL,
  `year` int(5) NOT NULL,
  `employeeid` varchar(15) NOT NULL,
  PRIMARY KEY (`month`,`year`,`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`EL`, `SL`, `CL`, `month`, `year`, `employeeid`) VALUES
(3, 2, 2, 'JUNE', 2018, 'Ultimate01'),
(3, 2, 2, 'JUNE', 2018, 'Ultimate02'),
(3, 2, 2, 'JUNE', 2018, 'Ultimate03'),
(3, 2, 2, 'JUNE', 2018, 'Ultimate04');

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE IF NOT EXISTS `payslip` (
  `employeeid` varchar(15) NOT NULL,
  `month` varchar(10) NOT NULL,
  `year` int(5) NOT NULL,
  `basicsalary` float NOT NULL,
  `dayspaid` int(3) NOT NULL,
  PRIMARY KEY (`employeeid`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payslip`
--

INSERT INTO `payslip` (`employeeid`, `month`, `year`, `basicsalary`, `dayspaid`) VALUES
('Ultimate01', 'JUNE', 2018, 17000, 30),
('Ultimate02', 'JUNE', 2018, 20000, 30),
('Ultimate03', 'JUNE', 2018, 25000, 30),
('Ultimate04', 'JUNE', 2018, 35000, 30);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payslip`
--
ALTER TABLE `payslip`
  ADD CONSTRAINT `payslip_ibfk_1` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
