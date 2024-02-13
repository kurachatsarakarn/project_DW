-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 02:57 AM
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
-- Database: `mn`
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

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryNameTh`, `courseId`) VALUES
(112, 'วิชาเฉพาะด้าน', 141),
(113, 'วิชาเฉพาะพื้นฐาน', 141);

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

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `departmentId`, `nameCourseTh`, `nameCourseUse`, `planCourse`, `nameCourseEng`, `nameFullDegreeTh`, `nameFullDegreeEng`, `nameInitialsDegreeTh`, `nameInitialsDegreeEng`, `courseStartYear`, `courseEndYear`, `totalCredit`, `GeneralSubjectCredit`, `specificSubjectCredit`, `freeSubjectCredit`, `coreSubjectCredit`, `spacialSubjectCredit`, `selectSubjectCredit`, `happySubjectCredit`, `entrepreneurshipSubjectCredit`, `languageSubjectCredit`, `peopleSubjectCredit`, `aestheticsSubjectCredit`, `internshipHours`) VALUES
(140, 5, 'ทดสอบ', 'ทดสอบ', 'ทดสอบ', 'test', 'ทดสอบ', 'ัtest', 'ทส', 'ts', 1999, 2000, 100, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 2),
(141, 5, 'ทดสอบ', '60', 'ทดสอบ', 'test', 'ทดสอบ', 'ัtest', 'ทส', 'ts', 1999, 2000, 100, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 2);

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
(5, 'วิศวะกรรมศาสตร์'),
(6, 'ศิลปศาสตร์และวิทยาศาสตร์'),
(11, 'คอมพิวเตอร์');

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

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subjectId`, `subjectCode`, `subjectNameTh`, `subjectNameEng`, `subjectCredit`, `subjectAreasId`) VALUES
(13, '01208221', 'กลศาสตร์วิศวกรรม I ', 'Engineering Mechanics I', 3, 9),
(14, '01208222', 'กลศาสตร์วิศวกรรม I I', 'Engineering Mechanics II', 3, 9),
(15, '01208241', 'อุณหพลศาสตร์ I ', 'Thermodynamics I', 3, 9),
(16, '01208281', 'การฝึกงานโรงงาน', 'Workshop Practice', 1, 9),
(17, '01208381', 'ปฏิบัติการวิศวกรรมเครื่องกล', 'Mechanical Engineering Laboratory I', 1, 9),
(18, '02204221', 'พื้นฐานวิศวกรรมไฟฟ้า', 'Fundamentals of Electrical Engineering ', 3, 9),
(19, '02204222 ', 'ปฏิบัติการพื้นฐานทางวิศวกรรมไฟฟ้า', 'Fundamentals of Electrical Engineering Laboratory', 1, 9),
(20, '02206212', 'กระบวนการผลิต', 'Manufacturing Processes', 3, 9),
(21, '02206213', 'การศึกษาการงานอุตสาหกรรม', 'Industrial Work', 3, 9),
(22, '02206231', 'ความน่าจะเป็นและสถิติวิศวกรรม', 'Probabilyty And Engineering Statistics', 3, 9),
(23, '02206232', 'การวิจัยการดำเนินงานสำหรับวิศวกร', 'Operations Research for Engineers', 3, 9),
(24, '02206233', 'เศรษฐศาสตร์วิศวกรรม', 'Engineering Economy', 3, 9),
(25, '02206234', 'การควบคุมคุณภาพ', 'Quality Control', 3, 9),
(26, '02206314', 'การออกแบบโรงงานอุตสาหกรรม', 'Industrial Plant Design', 3, 9),
(27, '02206315', 'ความปลอดภัยในอุตสาหกรรม', 'Industrial Safety', 3, 9),
(28, '02206323', 'การออกแบบระบบขนถ่ายวัสดุ', 'Material Handling Systems Design', 3, 9),
(29, '02206337', 'โปรแกรมโลจิสติกส์เบื้องต้น', 'Introduction to Logistics Program', 3, 9),
(30, '02206351', 'การวางแผนและการควบคุมการผลิต', 'Production Planning and Control ', 3, 9),
(31, '02206361', 'การออกแบบโลจิสติกส์และโซ่อุปทาน', 'Design of Logistics and Supply Chain', 3, 9),
(32, '02206362', 'การขนส่งและการกระจายสินค้า', 'Transportation and Distribution', 3, 9),
(33, '02206363', 'กลยุทธ์การขนส่งต่อเนื่องหลายรูปแบบ', 'Multi-Modal Transportation Strategy', 3, 9),
(34, '02206364', 'การจัดการคลังสินค้าและสินค้าคงคลัง', 'Inventory and Warehouse Management', 3, 9),
(35, '02206381', 'ปฏิบัติการวิศวกรรมอุตสาหการ I ', 'Industrial Engineering Laboratory I', 1, 9),
(36, '02206438', 'การจำลองสถานการณ์ในการผลิตและโลจิสติกส์', 'Simulation in Production and Logistics', 3, 9),
(37, '02206482', 'ปฏิบัติการวิศวกรรมอุตสาหการ II', 'Industrial Engineering Laboratory II', 1, 9),
(38, '02206495', 'การเตรียมโครงงานวิศวกรรมอุตสาหการ-โลจิสติกส์', 'Industrial Engineering-Logistics Project Preparation', 1, 9),
(39, '02206497', 'สัมนา', 'Seminar', 1, 9),
(40, '02206499', 'โครงงานวิศวกรรมอุตสาหการ-โลจิสติกส์', 'Industrial Engineering-Logistics Project', 2, 9),
(41, '02206416', 'วิศวกรรมเครื่องมือ', 'Tool Engineering', 3, 10),
(42, '02206417', 'การออกแบบผลิตภัณฑ์', 'Product Design', 3, 10),
(43, '02206426', 'ระบบอัตโนมัติสำหรับการขนถ่ายวัสดุ', 'Automatic Systems for Material Handling', 3, 10),
(44, '02206427', 'การออกแบบการทำงานและการยศาสตร์', 'Workplace Design and Ergonomics', 3, 10),
(45, '02206428', 'การขนส่งวัตถุและของเสียอันตราย', 'Transportational of Hazadous Materials and Wastes', 3, 10),
(46, '02206336', 'วิศวกรรมซ่อมบำรุง', 'Maintenance Engineering', 3, 10),
(47, '02206441', 'คอมพิวเตอร์ประยุกต์สำหรับวิศวกรอุตสาหการ', 'Computer Applications for Industrial Engineers', 3, 10),
(48, '02206442', 'การออกแบบแผนการทดลองสำหรับวิศวกร', 'Experimental Design for Engineers', 3, 10),
(49, '02206443', 'วิศวกรรมระบบ', 'System Engineering', 3, 10),
(50, '02206444', 'การประกันคุณภาพทางอุตสหกรรม', 'Industrial Quality Assurance', 3, 10),
(51, '02206446', 'การจัดการอุตสาหกรรม', 'Industrial Management', 3, 10),
(52, '02206453', 'การศึกษาความเป็นไปได้ของโครงการอุตสาหกรรม', 'Industrial Project Feasibility Study', 3, 10),
(53, '02206455', 'ระบบการวางแผนทรัพยากรขององค์กร', 'Enterprise Resource Planning System ', 3, 10),
(54, '02206456', 'การจัดการโครงการ', 'Project Management', 3, 10),
(55, '02206457', 'ความรู้กฏหมายเบื้องต้นเพื่อการส่งออกและพิธีการทางศุลกากร', 'Fundamental Knowledges of Law and CustomsLaw', 3, 10),
(56, '02206369', 'การจัดการโลจิสติกส์และโซ่อุปทานระดับโลก', 'Global Logistics and Supply Chain Management', 3, 10),
(57, '02206461', 'เทคโนโลยีสารสนเทศสำหรับโลจิสติกส์และโซ่อุปทาน', 'Information Technology for Logistics and Supply Chain', 3, 10),
(58, '02206465', 'การจัดการพลังงานด้านโลจิสติกส์', 'Energy Management for Efficient Logistics', 3, 10),
(59, '02206466', 'การบิหารการจัดซื้อ', 'Purcashing Management', 3, 10),
(60, '02206467', 'ระบบบรรจุภัณฑ์', 'Packging System', 3, 10),
(61, '02206468', 'กฏหมายโลจิสติกส์และธุรกิจระหว่างประเทศ', 'Legal Aspect for Logistics and International Business', 3, 10),
(62, '01200490', 'สหกิจศึกษา', 'Co-Operative Education', 6, 10),
(63, '02206496', 'เรื่องเฉพาะทางวิศวกรรมอุตสาหการ-โลจิสติกส์', '', 3, 10),
(64, '02206498', 'ปัญหาพิเศษ', 'Special Problems', 3, 10),
(65, '01208111', 'การเขียนแบบวิศวกรรม', 'Engineering Drawing', 3, 11),
(66, '02204101', 'การเขียนโปรแกรมเบื้องต้น', 'Introduction to Programming', 3, 11),
(67, '02206111', 'วัศดุวิศวกรรม', 'Engineering Material', 3, 11),
(68, '01208221', 'กลศาสตร์วิศวกรรม I ', 'Engineering Mechanics I', 3, 9),
(69, '01208222', 'กลศาสตร์วิศวกรรม I I', 'Engineering Mechanics II', 3, 9),
(70, '01208241', 'อุณหพลศาสตร์ I ', 'Thermodynamics I', 3, 9),
(71, '01208281', 'การฝึกงานโรงงาน', 'Workshop Practice', 1, 9),
(72, '01208381', 'ปฏิบัติการวิศวกรรมเครื่องกล', 'Mechanical Engineering Laboratory I', 1, 9),
(73, '02204221', 'พื้นฐานวิศวกรรมไฟฟ้า', 'Fundamentals of Electrical Engineering ', 3, 9),
(74, '02204222 ', 'ปฏิบัติการพื้นฐานทางวิศวกรรมไฟฟ้า', 'Fundamentals of Electrical Engineering Laboratory', 1, 9),
(75, '02206212', 'กระบวนการผลิต', 'Manufacturing Processes', 3, 9),
(76, '02206213', 'การศึกษาการงานอุตสาหกรรม', 'Industrial Work', 3, 9),
(77, '02206231', 'ความน่าจะเป็นและสถิติวิศวกรรม', 'Probabilyty And Engineering Statistics', 3, 9),
(78, '02206232', 'การวิจัยการดำเนินงานสำหรับวิศวกร', 'Operations Research for Engineers', 3, 9),
(79, '02206233', 'เศรษฐศาสตร์วิศวกรรม', 'Engineering Economy', 3, 9),
(80, '02206234', 'การควบคุมคุณภาพ', 'Quality Control', 3, 9),
(81, '02206314', 'การออกแบบโรงงานอุตสาหกรรม', 'Industrial Plant Design', 3, 9),
(82, '02206315', 'ความปลอดภัยในอุตสาหกรรม', 'Industrial Safety', 3, 9),
(83, '02206323', 'การออกแบบระบบขนถ่ายวัสดุ', 'Material Handling Systems Design', 3, 9),
(84, '02206337', 'โปรแกรมโลจิสติกส์เบื้องต้น', 'Introduction to Logistics Program', 3, 9),
(85, '02206351', 'การวางแผนและการควบคุมการผลิต', 'Production Planning and Control ', 3, 9),
(86, '02206361', 'การออกแบบโลจิสติกส์และโซ่อุปทาน', 'Design of Logistics and Supply Chain', 3, 9),
(87, '02206362', 'การขนส่งและการกระจายสินค้า', 'Transportation and Distribution', 3, 9),
(88, '02206363', 'กลยุทธ์การขนส่งต่อเนื่องหลายรูปแบบ', 'Multi-Modal Transportation Strategy', 3, 9),
(89, '02206364', 'การจัดการคลังสินค้าและสินค้าคงคลัง', 'Inventory and Warehouse Management', 3, 9),
(90, '02206381', 'ปฏิบัติการวิศวกรรมอุตสาหการ I ', 'Industrial Engineering Laboratory I', 1, 9),
(91, '02206438', 'การจำลองสถานการณ์ในการผลิตและโลจิสติกส์', 'Simulation in Production and Logistics', 3, 9),
(92, '02206482', 'ปฏิบัติการวิศวกรรมอุตสาหการ II', 'Industrial Engineering Laboratory II', 1, 9),
(93, '02206495', 'การเตรียมโครงงานวิศวกรรมอุตสาหการ-โลจิสติกส์', 'Industrial Engineering-Logistics Project Preparation', 1, 9),
(94, '02206497', 'สัมนา', 'Seminar', 1, 9),
(95, '02206499', 'โครงงานวิศวกรรมอุตสาหการ-โลจิสติกส์', 'Industrial Engineering-Logistics Project', 2, 9),
(96, '02206416', 'วิศวกรรมเครื่องมือ', 'Tool Engineering', 3, 10),
(97, '02206417', 'การออกแบบผลิตภัณฑ์', 'Product Design', 3, 10),
(98, '02206426', 'ระบบอัตโนมัติสำหรับการขนถ่ายวัสดุ', 'Automatic Systems for Material Handling', 3, 10),
(99, '02206427', 'การออกแบบการทำงานและการยศาสตร์', 'Workplace Design and Ergonomics', 3, 10),
(100, '02206428', 'การขนส่งวัตถุและของเสียอันตราย', 'Transportational of Hazadous Materials and Wastes', 3, 10),
(101, '02206336', 'วิศวกรรมซ่อมบำรุง', 'Maintenance Engineering', 3, 10),
(102, '02206441', 'คอมพิวเตอร์ประยุกต์สำหรับวิศวกรอุตสาหการ', 'Computer Applications for Industrial Engineers', 3, 10),
(103, '02206442', 'การออกแบบแผนการทดลองสำหรับวิศวกร', 'Experimental Design for Engineers', 3, 10),
(104, '02206443', 'วิศวกรรมระบบ', 'System Engineering', 3, 10),
(105, '02206444', 'การประกันคุณภาพทางอุตสหกรรม', 'Industrial Quality Assurance', 3, 10),
(106, '02206446', 'การจัดการอุตสาหกรรม', 'Industrial Management', 3, 10),
(107, '02206453', 'การศึกษาความเป็นไปได้ของโครงการอุตสาหกรรม', 'Industrial Project Feasibility Study', 3, 10),
(108, '02206455', 'ระบบการวางแผนทรัพยากรขององค์กร', 'Enterprise Resource Planning System ', 3, 10),
(109, '02206456', 'การจัดการโครงการ', 'Project Management', 3, 10),
(110, '02206457', 'ความรู้กฏหมายเบื้องต้นเพื่อการส่งออกและพิธีการทางศุลกากร', 'Fundamental Knowledges of Law and CustomsLaw', 3, 10),
(111, '02206369', 'การจัดการโลจิสติกส์และโซ่อุปทานระดับโลก', 'Global Logistics and Supply Chain Management', 3, 10),
(112, '02206461', 'เทคโนโลยีสารสนเทศสำหรับโลจิสติกส์และโซ่อุปทาน', 'Information Technology for Logistics and Supply Chain', 3, 10),
(113, '02206465', 'การจัดการพลังงานด้านโลจิสติกส์', 'Energy Management for Efficient Logistics', 3, 10),
(114, '02206466', 'การบิหารการจัดซื้อ', 'Purcashing Management', 3, 10),
(115, '02206467', 'ระบบบรรจุภัณฑ์', 'Packging System', 3, 10),
(116, '02206468', 'กฏหมายโลจิสติกส์และธุรกิจระหว่างประเทศ', 'Legal Aspect for Logistics and International Business', 3, 10),
(117, '01200490', 'สหกิจศึกษา', 'Co-Operative Education', 6, 10),
(118, '02206496', 'เรื่องเฉพาะทางวิศวกรรมอุตสาหการ-โลจิสติกส์', '', 3, 10),
(119, '02206498', 'ปัญหาพิเศษ', 'Special Problems', 3, 10),
(120, '01208111', 'การเขียนแบบวิศวกรรม', 'Engineering Drawing', 3, 11),
(121, '02204101', 'การเขียนโปรแกรมเบื้องต้น', 'Introduction to Programming', 3, 11),
(122, '02206111', 'วัศดุวิศวกรรม', 'Engineering Material', 3, 11);

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
-- Dumping data for table `subject_areas`
--

INSERT INTO `subject_areas` (`subjectAreasId`, `subjectAreasNameTh`, `categoryId`) VALUES
(9, 'กลุ่มวิชาบังคับทางวิศวกรรม', 112),
(10, 'กลุ่มวิชาเลือกทางวิศวกรรม', 112),
(11, 'กลุ่มพื้นฐานทางด้านวิศวกรรมศาสตร์', 113);

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
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `subject_areas`
--
ALTER TABLE `subject_areas`
  MODIFY `subjectAreasId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
