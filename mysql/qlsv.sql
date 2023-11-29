-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2023 lúc 12:14 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlsv`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2023-11-11 10:30:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'T-CLC', 2, '1', '2023-11-11 10:30:57', '2023-11-11 10:30:57'),
(2, 'CA-CLC', 2, '1', '2023-11-11 10:30:57', '2023-11-11 10:30:57'),
(4, 'CA-CLC', 3, '2', '2023-11-11 10:30:57', '2023-11-11 10:30:57'),
(5, 'CA-CLC', 4, '3', '2023-11-11 10:30:57', '2023-11-11 10:30:57'),
(6, 'CA-CLC', 1, '4', '2023-11-11 10:30:57', '2023-11-11 10:30:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `noticeDetails` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notice`
--

INSERT INTO `notice` (`id`, `noticeTitle`, `noticeDetails`, `postingDate`) VALUES
(5, 'Tất cả trường được nghỉ ngày hôm nay', 'Hôm nay là một ngày đẹp trời tất cả được nghỉ', '2023-11-29 06:41:03'),
(6, 'Cả trường được nghỉ tết từ bây giờ', 'Nghỉ.', '2023-11-30 12:51:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `result`
--

INSERT INTO `result` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(38, 16, 1, 15, 100, '2023-11-29 11:05:01', NULL),
(39, 16, 1, 15, 100, '2023-11-29 11:05:01', NULL),
(40, 16, 1, 14, 100, '2023-11-29 11:05:01', NULL),
(41, 16, 1, 13, 100, '2023-11-29 11:05:01', NULL),
(42, 16, 1, 16, 100, '2023-11-29 11:05:01', NULL),
(43, 16, 1, 18, 100, '2023-11-29 11:05:01', NULL),
(44, 16, 1, 17, 100, '2023-11-29 11:05:01', NULL),
(45, 17, 1, 15, 100, '2023-11-29 11:07:15', NULL),
(46, 17, 1, 15, 100, '2023-11-29 11:07:15', NULL),
(47, 17, 1, 14, 100, '2023-11-29 11:07:15', NULL),
(48, 17, 1, 13, 100, '2023-11-29 11:07:15', NULL),
(49, 17, 1, 16, 100, '2023-11-29 11:07:15', NULL),
(50, 17, 1, 18, 100, '2023-11-29 11:07:15', NULL),
(51, 17, 1, 17, 100, '2023-11-29 11:07:15', NULL),
(52, 18, 2, 13, 80, '2023-11-29 11:07:36', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `RollId` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `DOB`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(16, 'Phan Tiến Đạt', '22024529', '22024529@vnu.edu.vn', 'Male', '2004-06-01', 1, '2023-11-29 10:46:23', NULL, 1),
(17, 'Nguyễn Mai Trang', '11226415', 'trangnguyen3165@gmail.com', 'Female', '2004-05-06', 1, '2023-11-29 11:06:18', NULL, 1),
(18, 'Nguyễn Văn Tí', '22024539', '32452345@gmail.com', 'Male', '2004-04-04', 2, '2023-11-29 11:06:43', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjectcombination`
--

CREATE TABLE `subjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subjectcombination`
--

INSERT INTO `subjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(41, 1, 13, 1, '2023-11-29 10:57:18', NULL),
(42, 1, 14, 1, '2023-11-29 10:57:22', NULL),
(43, 1, 15, 1, '2023-11-29 10:57:25', NULL),
(44, 1, 16, 1, '2023-11-29 10:57:28', NULL),
(45, 1, 17, 1, '2023-11-29 10:57:33', NULL),
(46, 1, 18, 1, '2023-11-29 10:57:37', NULL),
(47, 2, 13, 1, '2023-11-29 10:57:57', NULL),
(48, 4, 13, 1, '2023-11-29 10:58:01', NULL),
(49, 1, 15, 1, '2023-11-29 10:58:04', '2023-11-29 11:04:36'),
(50, 5, 16, 1, '2023-11-29 10:58:08', NULL),
(51, 6, 13, 1, '2023-11-29 10:58:12', NULL),
(52, 5, 16, 1, '2023-11-29 10:58:16', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects`
--

INSERT INTO `subjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(13, 'Kiến trúc máy tính', 'INT2202', '2023-11-29 10:45:43', NULL),
(14, 'Cơ sở dữ liệu', 'INT2211E', '2023-11-29 10:55:15', '2023-11-29 10:55:26'),
(15, 'Cấu trúc dữ liệu và giải thuật', 'INT2210', '2023-11-29 10:55:52', NULL),
(16, 'Lập trình nâng cao ', 'INT2215', '2023-11-29 10:56:06', NULL),
(17, 'Xác suất thống kê', 'MAT1101', '2023-11-29 10:56:44', NULL),
(18, 'Tư tưởng Hồ Chí Minh', 'POL1001', '2023-11-29 10:57:03', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_result_student` (`StudentId`),
  ADD KEY `fk_result_class` (`ClassId`),
  ADD KEY `fk_result_subject` (`SubjectId`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentId`),
  ADD KEY `fk_students_class` (`ClassId`);

--
-- Chỉ mục cho bảng `subjectcombination`
--
ALTER TABLE `subjectcombination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_subjectcombination_class` (`ClassId`),
  ADD KEY `fk_subjectcombination_subject` (`SubjectId`);

--
-- Chỉ mục cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE `students`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `subjectcombination`
--
ALTER TABLE `subjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `fk_result_class` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fk_result_student` FOREIGN KEY (`StudentId`) REFERENCES `students` (`StudentId`),
  ADD CONSTRAINT `fk_result_subject` FOREIGN KEY (`SubjectId`) REFERENCES `subjects` (`id`);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_class` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`id`);

--
-- Các ràng buộc cho bảng `subjectcombination`
--
ALTER TABLE `subjectcombination`
  ADD CONSTRAINT `fk_subjectcombination_class` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fk_subjectcombination_subject` FOREIGN KEY (`SubjectId`) REFERENCES `subjects` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
