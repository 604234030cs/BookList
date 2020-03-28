-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2020 at 10:24 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorID` int(11) NOT NULL,
  `AuthorName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `AuthorName`) VALUES
(1, 'Haruki Murakami'),
(2, 'Malcolm Gladwell'),
(3, 'Meg Jay'),
(4, 'นายแพทย์จางเหวินหง'),
(5, 'Charles Duhigg'),
(6, 'Higashino Keigo'),
(7, 'Matthew Walker');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookId` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL DEFAULT 0,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `BookName` varchar(200) DEFAULT NULL,
  `BookDescription` varchar(1000) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT 0,
  `BookStatus` tinyint(1) DEFAULT 0,
  `BookISBN` varchar(255) DEFAULT NULL,
  `BookNumPages` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookId`, `CategoryID`, `AuthorID`, `PublisherID`, `BookName`, `BookDescription`, `BookPrice`, `BookStatus`, `BookISBN`, `BookNumPages`) VALUES
(1, 0, 0, 0, 'ชายไร้สีกับปีแสวงบุญ', 'ทำไมคุณถึงถูกเพื่อนสี่คนตัดสัมพันธ์อย่างไม่เหลือเยื่อใย ต้องทำกันขนาดนั้นเชียวหรือ ฉันคิดว่าคุณน่าจะค้นหาสาเหตุของเรื่องนี้ให้กระจ่างชัดโดยตัวคุณเอง\r\n\r\nผมฟังเพลงของลิซต์ ชุด ‘ปีแสวงบุญ’ และเพลง เลอ มาล ดู เปอี ติดอยู่ในใจของผม ดังนั้นผมจึงอยากเขียนอะไรสักอย่างเกี่ยวกับเพลงนั้น', 297, NULL, '9786165630023', NULL),
(2, 0, 0, 0, 'คาฟกา วิฬาร์ นาคาตา', 'หนังสือเล่มนี้มีปริศนาใส่รหัสมากมาย แต่ไม่มีวิธีถอดรหัสให้สิ่งที่มีให้คือ ปริศนาเหล่านี้หลายข้อผสมผสานกันและจากการมีปฏิสัมพันธ์กัน ความเป็นไปได้ในการถอดรหัสก็ก่อร่างขึ้นสำหรับผู้อ่านแต่ละคนรูปแบบของการถอดรหัสจะแตกต่างกันออกไป พูดอีกอย่างหนึ่งได้ว่าปริศนาทำหน้าที่เป็นส่วนหนึ่งของการถอดรหัสอธิบายยาก แต่เป็นนวนิยายประเภทหนึ่งที่ผมพยายามเขียน\r\n\r\nผมฟังเพลงของลิซต์ ชุด ‘ปีแสวงบุญ’ และเพลง เลอ มาล ดู เปอี ติดอยู่ในใจของผม ดังนั้นผมจึงอยากเขียนอะไรสักอย่างเกี่ยวกับเพลงนั้น', 477, 0, '9786167591995', NULL),
(3, 0, 0, 0, 'เกร็ดความคิดบนก้าววิ', 'หนังสือเล่มนี้พูดถึงการวิ่ง หาใช่สารนิพนธ์ว่าด้วยการฝึกให้ร่างกายแข็งแกร่ง ผมไม่พยายามจะสอนว่า \"ลุกขึ้นมาได้แล้ว ทุกคนเลย ออไปวิ่งทุกเช้าเพื่อสุขภาพสมบูรณ์แข็งแรง\" ไม่เลยครับ หนังสือเล่มนี้รวบรวมเกร็ดความคิดของผม ที่การวิ่งให้ความหมายต่อผมในฐานะมนุษย์คนหนึ่ง เป็นแต่เพียงหนังสือที่ผมวิเคราะห์ครุ่นคิดเรื่องที่อยู่ในหัว และคิดออกมาดังๆ\r\n\r\nผมฟังเพลงของลิซต์ ชุด ‘ปีแสวงบุญ’ และเพลง เลอ มาล ดู เปอี ติดอยู่ในใจของผม ดังนั้นผมจึงอยากเขียนอะไรสักอย่างเกี่ยวกับเพลงนั้น', 198, 0, '9786167591988', NULL),
(4, 2, 3, 1, 'ราตรีมหัศจรรย', 'ตอนที่ผมเขียนนวนิยายเรื่องนี้ ทำนองเพลง \'ไฟว์สป็อตอาฟเตอร์ดาร์ก\' ของเคอร์ทิส ฟุลเลอร์ เล่นวนอยู่ในหัวผม\r\n\r\nผมฟังเพลงของลิซต์ ชุด ‘ปีแสวงบุญ’ และเพลง เลอ มาล ดู เปอี ติดอยู่ในใจของผม ดังนั้นผมจึงอยากเขียนอะไรสักอย่างเกี่ยวกับเพลงนั้น', 207, 0, '9786167591971', NULL),
(6, 0, 0, 0, 'สัมฤทธิ์พิศวง (OUTLIERS', NULL, 250, 1, NULL, NULL),
(7, 1, 1, 3, ' (THE TIPPING POINT))', 'อาาาาาาikkkk\r\n          ', 305, 0, '14553654677', 124),
(8, 0, 0, 0, 'วี(Blink)', '            อาราวี\"\r\n          ', 301, 0, '159456', 123),
(9, 2, 2, 2, 'เห็นในสิ่งที่คนอื่นไม่เห็น (What the Dog Saw)', 'แค่รู้ว่าจะมองอย่างไร...\r\n\r\nคุณก็จะพบว่าสิ่งที่อยู่ตรงหน้า อาจมี \'อะไร\' มากกว่าที่ตาเห็น', 350, 1, '9786162870149', 440),
(10, 2, 3, 2, 'ตลอดชีวิตจะดีหรือร้าย อยู่ที่ว่าคุณคิดอย่างไรในวัย 20', 'จากประสบการณ์การให้คำปรึกษาปัญหาชีวิตนานหลายสิบปี \r\n\r\nMeg Jay นักจิตวิทยาชื่อดังค้นพบว่า ช่วงชีวิตในวัย 20 ไม่เพียงเป็นวัยของการก่อร่างสร้างตัว แต่ยังเป็นวัยที่จะกำหนดชีวิตที่เหลือของคนเราด้วย ไม่ว่าจะเป็นเรื่องงาน ความรัก เงินทอง หรือครอบครัว', 228, 1, '9786162873416', 264),
(11, 3, 4, 3, 'คู่มือเอาตัวรอดจาก COVID-19', 'วิธีเอาตัว (ให้) รอด จากภัยที่มองไม่เห็น จากสงคราม ที่ไม่มีเปลวเพลิง...', 204, 0, '9786161834722', 56),
(12, 2, 5, 2, 'พลังแห่งความเคยชิน', 'ทำไมคนเราถึง “ทำ” หรือ “ไม่ทำ” บางสิ่งจนเป็นอัตโนมัติ', 280, 1, '9786162873539', 360),
(13, 2, 2, 2, 'ปาฏิหาริย์ร้านชำของคุณนามิยk', NULL, 281, NULL, NULL, NULL),
(14, 3, 7, 5, 'Why We Sleep : นอนเปลี่ยนชีวิต', '\"การนอนหลับ\" คือกลไกอัศจรรย์ที่ธรรมชาติรังสรรค์ให้มนุษย์ และเป็นหนึ่งในสามเสาหลักแห่งสุขภาพดี ควบคู่กับอาหารและการออกกำลังกาย ทว่าน้อยคนจะเข้าใจปริศนาเบื้องหลังการนอนหลับและการฝัน และมักมองข้ามกิจวัตรยามค่ำคืนอันแสนสำคัญ ซึ่งเป็นกุญแจสู่คุณภาพชีวิตและอายุขัยที่ยืนยาว', 395, 1, '9786168221303', 504);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'นิยาย'),
(2, 'จิตวิทยา/พัฒนาตนเอง'),
(3, 'อาหารและสุขภาพ');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `PublisherID` int(11) NOT NULL,
  `PublisherName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`PublisherID`, `PublisherName`) VALUES
(1, 'สำนักพิมพ์กำมะหยี่'),
(2, 'สำนักพิมพ์วีเลิร์น'),
(3, 'สำนักพิมพ์ Amarin Health'),
(4, 'น้ำพุสำนักพิมพ์'),
(5, 'บุ๊คสเคป');

-- --------------------------------------------------------

--
-- Table structure for table `statusb`
--

CREATE TABLE `statusb` (
  `BookStatus` int(5) NOT NULL,
  `status_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statusb`
--

INSERT INTO `statusb` (`BookStatus`, `status_name`) VALUES
(0, 'เลือกจำหน่าย'),
(1, 'ปกติ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookId`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`PublisherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `BookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `PublisherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
