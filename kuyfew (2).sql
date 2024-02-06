-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 06:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuyfew`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `categoryNameTh` varchar(100) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `nameCourseTh` varchar(150) NOT NULL,
  `nameCourseUse` varchar(50) NOT NULL,
  `planCourse` varchar(50) NOT NULL,
  `nameCourseEng` varchar(150) NOT NULL,
  `nameFullDegreeTh` varchar(150) NOT NULL,
  `nameFullDegreeEng` varchar(150) NOT NULL,
  `nameInitialsDegreeTh` varchar(100) NOT NULL,
  `nameInitialsDegreeEng` varchar(100) NOT NULL,
  `courseStartYear` int(11) NOT NULL,
  `courseEndYear` int(11) NOT NULL,
  `totalCredit` int(11) NOT NULL,
  `GeneralSubjectCredit` int(11) NOT NULL,
  `specificSubjectCredit` int(11) NOT NULL,
  `freeSubjectCredit` int(11) NOT NULL,
  `coreSubjectCredit` int(11) NOT NULL,
  `spacialSubjectCredit` int(11) NOT NULL,
  `selectSubjectCredit` int(11) NOT NULL,
  `happySubjectCredit` int(11) NOT NULL,
  `entrepreneurshipSubjectCredit` int(11) NOT NULL,
  `languageSubjectCredit` int(11) NOT NULL,
  `peopleSubjectCredit` int(11) NOT NULL,
  `aestheticsSubjectCredit` int(11) NOT NULL,
  `internshipHours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL,
  `departmentNameTh` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `departmentNameTh`) VALUES
(5, 'dsad'),
(6, 'adsasd');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectId` int(11) NOT NULL,
  `subjectCode` varchar(100) NOT NULL,
  `subjectNameTh` varchar(100) NOT NULL,
  `subjectNameEng` varchar(100) NOT NULL,
  `subjectCredit` int(11) NOT NULL,
  `subjectAreasId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_areas`
--

CREATE TABLE `subject_areas` (
  `subjectAreasId` int(11) NOT NULL,
  `subjectAreasNameTh` varchar(100) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectId`),
  ADD KEY `subjectAreas` (`subjectAreasId`);

--
-- Indexes for table `subject_areas`
--
ALTER TABLE `subject_areas`
  ADD PRIMARY KEY (`subjectAreasId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subject_areas`
--
ALTER TABLE `subject_areas`
  MODIFY `subjectAreasId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`subjectAreasId`) REFERENCES `subject_areas` (`subjectAreasId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject_areas`
--
ALTER TABLE `subject_areas`
  ADD CONSTRAINT `subject_areas_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
