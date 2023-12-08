-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: coachstationsystem
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--
-- Kiểm tra nếu database tồn tại thì xóa
DROP DATABASE IF EXISTS `CoachStationSystem`;

-- Tạo mới database
CREATE DATABASE `CoachStationSystem`
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;
-- Sử dụng database vừa tạo
USE `CoachStationSystem`;

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `AccountID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `AccountStatus` varchar(20) DEFAULT NULL,
  `AccountType` varchar(20) DEFAULT NULL CHECK (`AccountType` in ('CoachEmployee','Passenger','TerminalEmployee')),
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'driver1','pass123','Active','CoachEmployee'),(2,'driver2','pass456','Active','CoachEmployee'),(3,'driver3','pass789','Active','CoachEmployee'),(4,'driver4','passpass','Active','CoachEmployee'),(5,'driver5','wordword','Active','CoachEmployee'),(6,'driver6','secure123','Active','CoachEmployee'),(7,'driver7','admin123','Active','CoachEmployee'),(8,'driver8','clerkpass','Active','CoachEmployee'),(9,'driver9','clerkword','Active','CoachEmployee'),(10,'driver10','admin456','Active','CoachEmployee'),(11,'supervisor1','clerksecure','Active','TerminalEmployee'),(12,'supervisor2','clerk567','Active','TerminalEmployee'),(13,'supervisor3','admin789','Active','TerminalEmployee'),(14,'supervisor4','clerk789','Active','TerminalEmployee'),(15,'supervisor5','clerkadmin','Active','TerminalEmployee'),(16,'supervisor6','hihi','Active','TerminalEmployee'),(17,'supervisor7','haha','Active','TerminalEmployee'),(18,'supervisor8','hoho','Active','TerminalEmployee'),(19,'supervisor9','hehe','Active','TerminalEmployee'),(20,'supervisor10','hjhj','Active','TerminalEmployee'),(21,'clerk1','jeje','Active','TerminalEmployee'),(22,'clerk2','gege','Active','TerminalEmployee'),(23,'clerk3','aloalo','Active','TerminalEmployee'),(24,'clerk4','hello','Active','TerminalEmployee'),(25,'clerk5','chohoi','Active','TerminalEmployee'),(26,'clerk6','aivay','Active','TerminalEmployee'),(27,'clerk7','tuine','Active','TerminalEmployee'),(28,'clerk8','chuai','Active','TerminalEmployee'),(29,'clerk9','1122','Active','TerminalEmployee'),(30,'clerk10','3344','Active','TerminalEmployee'),(31,'passenger1','5566','Active','Passenger'),(32,'passenger2','7788','Active','Passenger'),(33,'passenger3','8899','Active','Passenger'),(34,'passenger4','dtkdtk','Active','Passenger'),(35,'passenger5','tbptbp','Active','Passenger'),(36,'passenger6','nqtnqt','Active','Passenger'),(37,'passenger7','dqtdqt','Active','Passenger'),(38,'passenger8','ttdttd','Active','Passenger'),(39,'passenger9','lplp1','Active','Passenger'),(40,'passenger10','lplp2','Active','Passenger');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresscoachemployee`
--

DROP TABLE IF EXISTS `addresscoachemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresscoachemployee` (
  `CoachEmployeeID` int(11) NOT NULL,
  `HouseNumber` varchar(50) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `DistrictCity` varchar(100) NOT NULL,
  `ProvinceCity` varchar(100) NOT NULL,
  PRIMARY KEY (`CoachEmployeeID`,`HouseNumber`,`Street`,`DistrictCity`,`ProvinceCity`),
  CONSTRAINT `addresscoachemployee_ibfk_1` FOREIGN KEY (`CoachEmployeeID`) REFERENCES `coachemployee` (`CoachStaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresscoachemployee`
--

LOCK TABLES `addresscoachemployee` WRITE;
/*!40000 ALTER TABLE `addresscoachemployee` DISABLE KEYS */;
INSERT INTO `addresscoachemployee` VALUES (1,'772/49','Đường 21 tháng 9','Quận Gia Lâm','Hà Nội'),(2,'A8','Đường TMT2A','Quận 12','TPHCM'),(3,'41 ','Đường Hồ Xuân Hương','Quận 1','TPHCM'),(4,'222','Đường Lê Văn Việt','Quận 9','TPHCM'),(5,'21A','Đường Lý Thánh Tông','Quận Ba Đình','Hà Nội'),(6,'915B/20','Đường Võ Văn Kiệt','Quận 5','TPHCM'),(7,'179 ','Đường Lê Quang Đạo','Quận Ngô Quyền ','Hải Phòng'),(8,'25','Đường Lạc Long Quân','Quận Tây Hồ','Hà Nội'),(9,'90 ','Đường Hồng Thái','Quận 2','Đà nẵng'),(10,'453','Đường Hoàng Văn Thụ','Quận Tân Phú','TPHCM');
/*!40000 ALTER TABLE `addresscoachemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresspassenger`
--

DROP TABLE IF EXISTS `addresspassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresspassenger` (
  `HouseNumber` varchar(50) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `District_City` varchar(100) NOT NULL,
  `Province_City` varchar(100) NOT NULL,
  `PassengerSSN` varchar(20) NOT NULL,
  PRIMARY KEY (`HouseNumber`,`Street`,`District_City`,`Province_City`,`PassengerSSN`),
  KEY `PassengerSSN` (`PassengerSSN`),
  CONSTRAINT `addresspassenger_ibfk_1` FOREIGN KEY (`PassengerSSN`) REFERENCES `passenger` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresspassenger`
--

LOCK TABLES `addresspassenger` WRITE;
/*!40000 ALTER TABLE `addresspassenger` DISABLE KEYS */;
INSERT INTO `addresspassenger` VALUES ('122','Đường Cao Thắng','Quận Hải Châu','Đà Nẵng','666666666'),('191','Đường Phan Châu Chinh ','Quận 1 ','TPCHM','999999999'),('222','Đường Ngô Quyền','Quận Bình Thành','TPHCM','000000000'),('437','Đường Nguyễn Xuyển','Quận 9','TPCHM','333333333'),('556','Đường Hoàng Văn Thụ','Đường Hoàng Văn Thụ','TPCHM','111111111'),('654','Đường Trần Văn Hưởng','Quận 2','TPCHM','555555555'),('69','Đường Trần Duy Hưng','Quận Hà Đông ','Hà Nội','888888888'),('721','Đường Bùi Thị Xuân','Quận Tây Hồ','Hà Nội','444444444'),('90','Đường Lý Tự Trọng','Quận Thanh Khê ','Hải Phòng','777777777'),('990','Đường Lạc Long Quân','Quận Đống Đa','Hà Nội','222222222');
/*!40000 ALTER TABLE `addresspassenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressterminalemployee`
--

DROP TABLE IF EXISTS `addressterminalemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressterminalemployee` (
  `HouseNumber` varchar(50) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `District_City` varchar(100) NOT NULL,
  `Province_City` varchar(100) NOT NULL,
  `TerminalEmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`HouseNumber`,`Street`,`District_City`,`Province_City`,`TerminalEmployeeID`),
  KEY `TerminalEmployeeID` (`TerminalEmployeeID`),
  CONSTRAINT `addressterminalemployee_ibfk_1` FOREIGN KEY (`TerminalEmployeeID`) REFERENCES `terminalemployee` (`TerminalEmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressterminalemployee`
--

LOCK TABLES `addressterminalemployee` WRITE;
/*!40000 ALTER TABLE `addressterminalemployee` DISABLE KEYS */;
INSERT INTO `addressterminalemployee` VALUES ('121','Đường Trường Chinh','Quận Kiến An','Hải Phòng',4),('222','Đường Ngô Gia Tự ','Quận 7','TPCHM',9),('294','Đường Hoàng Văn Thụ','Quận 3 ','TPCHM',10),('311','Đường Võ Văn Kiệt','Quận 5','TPHCM',7),('328','Đường Hoài Thanh','Quận Ngũ Hành Sơn','Hải Phòng',6),('35','Đường Đại An','Quận Hà Đông','Hà Nội',1),('602','Đường Điện Biên Phủ','Quận 1','TPCHM',3),('65','Đường Sư Vạn Hạnh','Quận 3','TPCHM',2),('949','Đường Võ Thị Sáu','Quận Đống Đa','Hà Nội',5);
/*!40000 ALTER TABLE `addressterminalemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assist`
--

DROP TABLE IF EXISTS `assist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assist` (
  `TripID` int(11) NOT NULL,
  `AssistantID` int(11) NOT NULL,
  PRIMARY KEY (`TripID`,`AssistantID`),
  KEY `AssistantID` (`AssistantID`),
  CONSTRAINT `assist_ibfk_1` FOREIGN KEY (`TripID`) REFERENCES `trip` (`TripID`),
  CONSTRAINT `assist_ibfk_2` FOREIGN KEY (`AssistantID`) REFERENCES `coachemployee` (`CoachStaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assist`
--

LOCK TABLES `assist` WRITE;
/*!40000 ALTER TABLE `assist` DISABLE KEYS */;
INSERT INTO `assist` VALUES (1,6),(2,7),(3,8),(4,9),(5,10);
/*!40000 ALTER TABLE `assist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `CoachID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) DEFAULT NULL CHECK (`Status` in ('At station','In transit')),
  `CoachType` varchar(50) DEFAULT NULL,
  `LicensePlates` varchar(20) DEFAULT NULL,
  `NumberOfSeat` int(11) DEFAULT NULL,
  `CoachCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CoachID`),
  KEY `CoachCompanyID` (`CoachCompanyID`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`CoachCompanyID`) REFERENCES `coachcompany` (`CoachCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` (`Status`, `CoachType`, `LicensePlates`, `NumberOfSeat`, `CoachCompanyID`) VALUES ('At station','Limousine','51A-12345',35,1),('In transit','Standard','36B-67890',50,2),('At station','Luxury','92C-54321',35,3),('In transit','Limousine','34D-98765',35,4),('At station','Standard','29E-24680',50,5),('At station','Limousine','29E-24680',35,6),('At station','Luxury','39E-34325',35,7),('In transit','Limousine','81E-65766',35,8),('At station','Standard','39E-28786',50,9),('In transit','Luxury','19E-34256',35,10),('In transit','Standard','91E-97767',50,11),('In transit', 'Luxury', '12F-87654', 35, 1),('At station', 'Standard', '45G-54321', 50, 2),
('In transit', 'Luxury', '78H-12345', 35, 3),
('At station', 'Limousine', '67I-98765', 35, 4),
('In transit', 'Standard', '90J-23456', 50, 5),
('At station', 'Limousine', '23K-87654', 35, 6),
('In transit', 'Luxury', '56L-34567', 35, 7),
('At station', 'Standard', '89M-87654', 50, 8),
('In transit', 'Limousine', '01N-23456', 35, 9),
('At station', 'Standard', '23O-87654', 50, 10),
('In transit', 'Luxury', '45P-34567', 35, 11);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coachcompany`
--

DROP TABLE IF EXISTS `coachcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coachcompany` (
  `CoachCompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfContractRegistration` date DEFAULT NULL,
  `EndDateOfContract` date DEFAULT NULL,
  `CoachCompanyName` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL CHECK (`Status` in ('Action','Not Action')),
  PRIMARY KEY (`CoachCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coachcompany`
--

LOCK TABLES `coachcompany` WRITE;
/*!40000 ALTER TABLE `coachcompany` DISABLE KEYS */;
INSERT INTO `coachcompany` (`CoachCompanyID`, `DateOfContractRegistration`, `EndDateOfContract`, `CoachCompanyName`, `Status`) VALUES
(1, '2022-01-01', '2026-12-31', 'Phương Trang', 'Action'),
(2, '2022-02-01', '2024-11-30', 'Hoàng Long', 'Action'),
(3, '2022-03-01', '2022-10-31', 'Mai Linh', 'Not Action'),
(4, '2022-04-01', '2025-09-30', 'Thành Bưởi', 'Action'),
(5, '2022-05-01', '2022-08-31', 'Minh Thành Phát', 'Not Action'),
(6, '2022-11-18', '2025-11-18', 'Văn Minh', 'Action'),
(7, '2023-01-01', '2026-01-01', 'Kumho Samco', 'Action'),
(8, '2023-12-24', '2025-12-24', 'Kim Hoàng', 'Action'),
(9, '2023-11-12', '2025-11-12', 'Tuấn Hưng', 'Action'),
(10, '2023-08-09', '2025-08-09', 'Hùng Cường', 'Action'),
(11, '2024-01-01', '2026-01-01', 'Hoàng Nga', 'Action');
/*!40000 ALTER TABLE `coachcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coachemployee`
--

DROP TABLE IF EXISTS `coachemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coachemployee` (
  `CoachStaffId` int(11) NOT NULL AUTO_INCREMENT,
  `SSN` varchar(20) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `CoachEmployeeType` varchar(50) DEFAULT NULL CHECK (`CoachEmployeeType` in ('Driver','Assistant')),
  `LicenseNumber` varchar(50) DEFAULT NULL,
  `LicenseType` varchar(50) DEFAULT NULL,
  `CoachCompanyId` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CoachStaffId`),
  KEY `CoachCompanyId` (`CoachCompanyId`),
  KEY `FK_AccountID` (`AccountID`),
  CONSTRAINT `FK_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `coachemployee_ibfk_1` FOREIGN KEY (`CoachCompanyId`) REFERENCES `coachcompany` (`CoachCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coachemployee`
--

LOCK TABLES `coachemployee` WRITE;
/*!40000 ALTER TABLE `coachemployee` DISABLE KEYS */;
INSERT INTO `coachemployee` VALUES (1,'123456789','Nguyễn','Văn An','1980-05-15','M','Driver','30A-12345','D1',1,1),(2,'987654321','Trần','Thị Bưởi','1992-10-20','F','Driver','42B-67890','D1',2,2),(3,'456789012','Lê','Quang Cút','1985-03-08','M','Driver','77C-54321','D1',3,3),(4,'321654987','Phạm','Văn Dương','1990-07-25','M','Driver','59D-98765','D1',4,4),(5,'789012345','Đỗ','Thị Én','1988-02-18','F','Driver','72A-24680','D1',5,5),(6,'112233445','Dương ','Trọng Khôi','1995-01-22','M','Assistant','31A-32423','D1',6,6),(7,'223344556','Trần','Bảo Phúc','1994-12-03','M','Assistant','84A-32323','D1',7,7),(8,'334455667','Dương','Thị Phúc ','1996-08-08','F','Assistant','38B-38400','D1',8,8),(9,'445566778','Trần','Tiến Đạt','1993-09-09','M','Assistant','71C-93020','D1',9,9),(10,'556677889','Nguyễn ','Quốc Thắng','1992-05-18','M','Assistant','81-D-3828','D1',10,10);
/*!40000 ALTER TABLE `coachemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(100) DEFAULT NULL,
  `ManageEmployeeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `ManageEmployeeID` (`ManageEmployeeID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`ManageEmployeeID`) REFERENCES `terminalemployee` (`TerminalEmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Operation',1),(2,'Finance',4),(3,'Human Resources',2),(4,'Distribution',5),(5,'Production',6),(6,'Accounting',9),(7,'Marketing',7);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(100) DEFAULT NULL,
  `ProvinceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DistrictID`),
  KEY `FK_ProvinceID` (`ProvinceID`),
  CONSTRAINT `FK_ProvinceID` FOREIGN KEY (`ProvinceID`) REFERENCES `province_city` (`ProvinceID`),
  CONSTRAINT `district_ibfk_1` FOREIGN KEY (`ProvinceID`) REFERENCES `province_city` (`ProvinceID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'Quận 1',1),(2,'Quận 2',1),(3,'Quận Hoàn Kiếm',2),(4,'Quận Ba Đình',2),(5,'Quận Sơn Trà',3),(6,'Quận Ngũ Hành Sơn',3),(7,'Quận Sơn Trà',4),(8,'Quận Ngũ Hành Sơn',4);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailcoachemployee`
--

DROP TABLE IF EXISTS `emailcoachemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailcoachemployee` (
  `CoachEmployeeID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`CoachEmployeeID`,`Email`),
  CONSTRAINT `emailcoachemployee_ibfk_1` FOREIGN KEY (`CoachEmployeeID`) REFERENCES `coachemployee` (`CoachStaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailcoachemployee`
--

LOCK TABLES `emailcoachemployee` WRITE;
/*!40000 ALTER TABLE `emailcoachemployee` DISABLE KEYS */;
INSERT INTO `emailcoachemployee` VALUES (1,'annguyen@gmail.com'),(2,'buoitran@gmail.com'),(3,'cutle@gmail.com'),(4,'duongpham@gmail.com'),(5,'endo@gmail.com'),(6,'khoiduong@gmail.com'),(7,'phuctran@gmail.com'),(8,'phucduong@gmail.com'),(9,'dattran@gmail.com'),(10,'thangnguyen@gmail.com');
/*!40000 ALTER TABLE `emailcoachemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailpassenger`
--

DROP TABLE IF EXISTS `emailpassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailpassenger` (
  `Email` varchar(100) NOT NULL,
  `PassengerSSN` varchar(20) NOT NULL,
  PRIMARY KEY (`Email`,`PassengerSSN`),
  KEY `PassengerSSN` (`PassengerSSN`),
  CONSTRAINT `emailpassenger_ibfk_1` FOREIGN KEY (`PassengerSSN`) REFERENCES `passenger` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailpassenger`
--

LOCK TABLES `emailpassenger` WRITE;
/*!40000 ALTER TABLE `emailpassenger` DISABLE KEYS */;
INSERT INTO `emailpassenger` VALUES ('cutpham@gmail.com','111111111'),('dovo@gmail.com','222222222'),('duongnguyen@gmail.com','777777777'),('emnguyen@gmail.com','333333333'),('ganguyen@gmail.com','000000000'),('giale@gmail.com','555555555'),('luyenvo@gmail.com','666666666'),('maitran@gmail.com','444444444'),('nghianguyen@gmail.com','999999999'),('tienvu@gmail.com','888888888');
/*!40000 ALTER TABLE `emailpassenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailterminalemployee`
--

DROP TABLE IF EXISTS `emailterminalemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailterminalemployee` (
  `Email` varchar(100) NOT NULL,
  `TerminalEmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`Email`,`TerminalEmployeeID`),
  KEY `TerminalEmployeeID` (`TerminalEmployeeID`),
  CONSTRAINT `emailterminalemployee_ibfk_1` FOREIGN KEY (`TerminalEmployeeID`) REFERENCES `terminalemployee` (`TerminalEmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailterminalemployee`
--

LOCK TABLES `emailterminalemployee` WRITE;
/*!40000 ALTER TABLE `emailterminalemployee` DISABLE KEYS */;
INSERT INTO `emailterminalemployee` VALUES ('gianghoang@gmai.com',1),('hungtran@gmail.com',6),('huytran@gmail.com',2),('khanhnguyen@gmail.com',4),('linhtran@gmail.com',5),('quyenngo@gmail.com',8),('thaohoang@gmail.com',7),('thaole@gmail.com',3),('thaomai@gmail.com',10),('tuantran@gmail.com',9);
/*!40000 ALTER TABLE `emailterminalemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `TaxCode` varchar(50) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `PassengerSSN` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `PassengerSSN` (`PassengerSSN`),
  KEY `FK_AccountID_Invoice` (`AccountID`),
  CONSTRAINT `FK_AccountID_Invoice` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`PassengerSSN`) REFERENCES `passenger` (`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'ABC123',31,'000000000','2023-01-01','10:30:00'),(2,'XYZ456',32,'111111111','2023-02-15','12:45:00'),(3,'123DEF',33,'222222222','2023-03-20','15:00:00'),(4,'456GHI',34,'333333333','2023-04-10','14:30:00'),(5,'789JKL',35,'444444444','2023-05-25','11:00:00'),(6,'123FEE',36,'555555555','2023-06-20','15:11:00'),(7,'245WEF',37,'666666666','2023-07-20','17:28:00'),(8,'332KTO',38,'777777777','2023-08-20','19:30:00'),(9,'947JRK',39,'888888888','2023-09-20','08:13:00'),(10,'2213IE',40,'999999999','2023-10-20','09:22:00');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `SSN` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `BirthDay` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `FK_AccountID_Passenger` (`AccountID`),
  CONSTRAINT `FK_AccountID_Passenger` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES ('000000000','Nguyễn Thị Gà','1993-03-03','F',40),('111111111','Phạm Thị Cút','1990-02-28','F',31),('222222222','Võ Văn Dơ','1988-07-10','M',32),('333333333','Nguyễn Văn Em','1995-12-15','M',33),('444444444','Trần Thị Mai','1993-05-05','F',34),('555555555','Lê Văn Già','1985-11-12','M',35),('666666666','Võ Luyện','2000-11-18','M',36),('777777777','Nguyễn Hải Dương','1995-12-05','M',37),('888888888','Vũ Văn Tiến','2001-05-02','M',38),('999999999','Nguyễn Đức Nghĩa','2003-02-02','M',39);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumbercoachcompany`
--

DROP TABLE IF EXISTS `phonenumbercoachcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumbercoachcompany` (
  `PhoneNumber` varchar(20) NOT NULL,
  `CoachCompanyID` int(11) NOT NULL,
  PRIMARY KEY (`PhoneNumber`,`CoachCompanyID`),
  KEY `CoachCompanyID` (`CoachCompanyID`),
  CONSTRAINT `phonenumbercoachcompany_ibfk_1` FOREIGN KEY (`CoachCompanyID`) REFERENCES `coachcompany` (`CoachCompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumbercoachcompany`
--

LOCK TABLES `phonenumbercoachcompany` WRITE;
/*!40000 ALTER TABLE `phonenumbercoachcompany` DISABLE KEYS */;
INSERT INTO `phonenumbercoachcompany` VALUES ('02463734117',9),('02586338861',5),('02596873237',6),('04833453532',3),('04887338888',8),('04893567845',1),('04967338431',10),('05455255555',2),('08538852235',7),('08572847484',4);
/*!40000 ALTER TABLE `phonenumbercoachcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumbercoachemployee`
--

DROP TABLE IF EXISTS `phonenumbercoachemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumbercoachemployee` (
  `CoachEmployeeID` int(11) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`CoachEmployeeID`,`PhoneNumber`),
  CONSTRAINT `phonenumbercoachemployee_ibfk_1` FOREIGN KEY (`CoachEmployeeID`) REFERENCES `coachemployee` (`CoachStaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumbercoachemployee`
--

LOCK TABLES `phonenumbercoachemployee` WRITE;
/*!40000 ALTER TABLE `phonenumbercoachemployee` DISABLE KEYS */;
INSERT INTO `phonenumbercoachemployee` VALUES (1,'0244578962'),(2,'0147853256'),(3,'0896541258'),(4,'0364589571'),(5,'0236547895'),(6,'0256987415'),(7,'0258521475'),(8,'0364785417'),(9,'0485337525'),(10,'0457878616');
/*!40000 ALTER TABLE `phonenumbercoachemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumberpassenger`
--

DROP TABLE IF EXISTS `phonenumberpassenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumberpassenger` (
  `PhoneNumber` varchar(20) NOT NULL,
  `PassengerSSN` varchar(20) NOT NULL,
  PRIMARY KEY (`PhoneNumber`,`PassengerSSN`),
  KEY `PassengerSSN` (`PassengerSSN`),
  CONSTRAINT `phonenumberpassenger_ibfk_1` FOREIGN KEY (`PassengerSSN`) REFERENCES `passenger` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumberpassenger`
--

LOCK TABLES `phonenumberpassenger` WRITE;
/*!40000 ALTER TABLE `phonenumberpassenger` DISABLE KEYS */;
INSERT INTO `phonenumberpassenger` VALUES ('0215892269','111111111'),('0232559633','777777777'),('0246631530','444444444'),('0256314879','333333333'),('0297951232','666666666'),('0364215897','222222222'),('0365421894','555555555'),('0478965415','000000000'),('0651456684','999999999'),('0784115621','888888888');
/*!40000 ALTER TABLE `phonenumberpassenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumberterminalemployee`
--

DROP TABLE IF EXISTS `phonenumberterminalemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumberterminalemployee` (
  `PhoneNumber` varchar(20) NOT NULL,
  `TerminalEmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`PhoneNumber`,`TerminalEmployeeID`),
  KEY `TerminalEmployeeID` (`TerminalEmployeeID`),
  CONSTRAINT `phonenumberterminalemployee_ibfk_1` FOREIGN KEY (`TerminalEmployeeID`) REFERENCES `terminalemployee` (`TerminalEmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumberterminalemployee`
--

LOCK TABLES `phonenumberterminalemployee` WRITE;
/*!40000 ALTER TABLE `phonenumberterminalemployee` DISABLE KEYS */;
INSERT INTO `phonenumberterminalemployee` VALUES ('0212589892',2),('0245786541',1),('0263363311',8),('0335412326',9),('0365258995',5),('0369852144',3),('0546532336',7),('0585478541',4),('0599885666',10),('0963214555',6);
/*!40000 ALTER TABLE `phonenumberterminalemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_city`
--

DROP TABLE IF EXISTS `province_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_city` (
  `ProvinceID` int(11) NOT NULL AUTO_INCREMENT,
  `ProvinceCityName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProvinceID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_city`
--

LOCK TABLES `province_city` WRITE;
/*!40000 ALTER TABLE `province_city` DISABLE KEYS */;
INSERT INTO `province_city` VALUES (1,'Hồ Chí Minh'),(2,'Hà Nội'),(3,'Đà Nẵng'),(4,'Hải Phòng');
/*!40000 ALTER TABLE `province_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `RouteID` int(11) NOT NULL AUTO_INCREMENT,
  `StartDistrictID` int(11) DEFAULT NULL,
  `EndDistrictID` int(11) DEFAULT NULL,
  `CoachCompanyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RouteID`),
  KEY `CoachCompanyID` (`CoachCompanyID`),
  KEY `FK_StartDistrictID` (`StartDistrictID`),
  KEY `FK_EndDistrictID` (`EndDistrictID`),
  CONSTRAINT `FK_EndDistrictID` FOREIGN KEY (`EndDistrictID`) REFERENCES `district` (`DistrictID`),
  CONSTRAINT `FK_StartDistrictID` FOREIGN KEY (`StartDistrictID`) REFERENCES `district` (`DistrictID`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`CoachCompanyID`) REFERENCES `coachcompany` (`CoachCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` (`RouteID`, `StartDistrictID`, `EndDistrictID`, `CoachCompanyID`) VALUES
(1, 1, 3, 1),
(2, 1, 4, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 1, 6, 6),
(7, 1, 5, 7),
(8, 1, 6, 8),
(9, 1, 7, 9),
(10, 1, 8, 10),
(11, 1, 7, 11),
(12, 1, 8, 1),
(13, 1, 5, 2),
(14, 1, 6, 3),
(15, 1, 5, 4),
(16, 1, 6, 5),
(17, 1, 7, 6),
(18, 1, 8, 7),
(19, 1, 7, 8),
(20, 1, 8, 9),
(21, 1, 7, 10),
(22, 1, 8, 1),
(23, 1, 7, 2),
(24, 1, 8, 3);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routestop`
--

DROP TABLE IF EXISTS `routestop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routestop` (
  `RouteStopID` int(11) NOT NULL AUTO_INCREMENT,
  `RouteID` int(11) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `StopDistrictID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RouteStopID`),
  KEY `RouteID` (`RouteID`),
  KEY `FK_StopDistrictID` (`StopDistrictID`),
  CONSTRAINT `FK_StopDistrictID` FOREIGN KEY (`StopDistrictID`) REFERENCES `district` (`DistrictID`),
  CONSTRAINT `routestop_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routestop`
--

LOCK TABLES `routestop` WRITE;
/*!40000 ALTER TABLE `routestop` DISABLE KEYS */;
INSERT INTO `routestop` VALUES (1,1,50000.00,1),(2,1,70000.00,3),(3,2,80000.00,2),(4,2,100000.00,4),(5,3,90000.00,3),(6,3,60000.00,5),(7,4,100000.00,4),(8,4,95000.00,6),(9,5,120000.00,5),(10,5,110000.00,6),(11,8,100000.00,6),(12,9,110000.00,7),(13,10,50000.00,8),(14,11,80000.00,7),(15,12,110000.00,8),(16,13,90000.00,5),(17,14,110000.00,6),(18,15,110000.00,5),(19,16,150000.00,6),(20,17,80000.00,7),(21,18,110000.00,8),(22,19,70000.00,7),(23,20,110000.00,8),(24,21,80000.00,7),(25,22,110000.00,8),(26,23,110000.00,7),(27,24,110000.00,8),(28,7,90000.00,6),(29,7,110000.00,5);
/*!40000 ALTER TABLE `routestop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminalemployee`
--

DROP TABLE IF EXISTS `terminalemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminalemployee` (
  `TerminalEmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `SSN` varchar(20) DEFAULT NULL,
  `FName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `BirthDay` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `TerminalEmployeeType` varchar(50) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `SupervisorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TerminalEmployeeID`),
  KEY `SupervisorID` (`SupervisorID`),
  KEY `FK_AccountID_TerminalEmployee` (`AccountID`),
  CONSTRAINT `FK_AccountID_TerminalEmployee` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `terminalemployee_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `terminalemployee` (`TerminalEmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminalemployee`
--

LOCK TABLES `terminalemployee` WRITE;
/*!40000 ALTER TABLE `terminalemployee` DISABLE KEYS */;
INSERT INTO `terminalemployee` VALUES (1,'789012345','Hoàng Thị Hà','Giang','1982-06-22','F','Supervisor',1,11,5),(2,'345678901','Trần Văn Gia','Huy','1990-09-18','M','Supervisor',2,12,4),(3,'901234567','Lê Thị Huyền','Thảo','1988-04-05','F','Supervisor',2,13,3),(4,'234567890','Nguyễn Văn ','Khánh','1993-11-30','M','Supervisor',2,14,2),(5,'567890123','Trần Thị Khánh','Linh','1985-08-12','F','Supervisor',1,15,1),(6,'998866281','Trần Ngọc','Hùng','1993-02-02','M','Clerk',1,16,1),(7,'389327940','Võ Hoàng','Thao','1995-04-15','M','Clerk',2,17,2),(8,'804020421','Ngô','Quyền','1994-03-22','M','Clerk',1,18,3),(9,'323232312','Trần Quốc','Tuấn','1995-04-28','M','Clerk',1,19,4),(10,'228826775','Mai Thị','Thảo','1996-02-22','F','Clerk',1,20,5);
/*!40000 ALTER TABLE `terminalemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `TicketID` int(11) NOT NULL AUTO_INCREMENT,
  `SeatNumber` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `InvoiceID` int(11) DEFAULT NULL,
  `PassengerSSN` varchar(20) DEFAULT NULL,
  `TripID` int(11) DEFAULT NULL,
  `RouteStopID` int(11) DEFAULT NULL,
  `RouteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `TripID` (`TripID`),
  KEY `RouteStopID` (`RouteStopID`),
  KEY `RouteID` (`RouteID`),
  KEY `FK_Ticket_AccountID` (`AccountID`),
  KEY `FK_Ticket_InvoiceID` (`InvoiceID`),
  KEY `FK_DepartmentID_TerminalEmployee` (`PassengerSSN`),
  CONSTRAINT `FK_DepartmentID_TerminalEmployee` FOREIGN KEY (`PassengerSSN`) REFERENCES `passenger` (`SSN`),
  CONSTRAINT `FK_Ticket_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `FK_Ticket_InvoiceID` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`TripID`) REFERENCES `trip` (`TripID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`RouteStopID`) REFERENCES `routestop` (`RouteStopID`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,10,31,1,'111111111',1,1,1),(2,15,32,2,'222222222',2,2,2),(3,20,33,3,'333333333',3,3,3),(4,12,34,4,'444444444',4,4,4),(5,18,35,5,'555555555',5,5,5),(6,11,36,6,'666666666',6,6,6),(7,13,37,7,'777777777',7,7,7),(8,19,38,8,'888888888',8,8,8),(9,20,39,9,'999999999',9,9,9),(10,21,40,10,'000000000',10,10,10);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `TripID` int(11) NOT NULL AUTO_INCREMENT,
  `LimitOfSeat` int(11) DEFAULT NULL,
  `NumberOfReservedSeat` int(11) DEFAULT NULL,
  `NumberOfNoBookSeat` int(11) DEFAULT NULL,
  `CoachID` int(11) DEFAULT NULL,
  `RouteID` int(11) DEFAULT NULL,
  `DriverID` int(11) DEFAULT NULL,
  `Date_` date DEFAULT NULL,
  `Time_` time DEFAULT NULL,
  PRIMARY KEY (`TripID`),
  KEY `CoachID` (`CoachID`),
  KEY `DriverID` (`DriverID`),
  KEY `FK_RouteID` (`RouteID`),
  CONSTRAINT `FK_RouteID` FOREIGN KEY (`RouteID`) REFERENCES `route` (`RouteID`),
  CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`CoachID`) REFERENCES `coach` (`CoachID`),
  CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `coachemployee` (`CoachStaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
-- INSERT INTO `trip` VALUES (1,50,45,5,1,1,1,'2023-01-15','08:00:00'),(2,35,20,15,2,2,2,'2023-02-20','09:30:00'),(3,35,35,0,3,3,3,'2023-03-25','11:00:00'),(4,50,35,15,4,4,4,'2023-04-10','12:45:00'),(5,50,40,10,5,5,5,'2023-05-05','14:30:00'),(6,50,50,0,6,6,5,'2023-06-25','14:30:00'),(7,35,35,0,7,7,4,'2023-07-05','12:45:00'),(8,35,35,0,8,8,3,'2023-08-22','08:00:00'),(9,35,35,0,9,9,2,'2023-09-15','11:00:00'),(10,50,50,0,10,24,1,'2023-10-15','08:00:00');
INSERT INTO `trip` (`LimitOfSeat`, `NumberOfReservedSeat`, `NumberOfNoBookSeat`, `CoachID`, `RouteID`, `DriverID`, `Date_`, `Time_`)
VALUES
(50, 45, 5, 1, 1, 1, '2023-01-15', '08:00:00'),
(35, 20, 15, 2, 2, 2, '2023-02-20', '09:30:00'),
(35, 35, 0, 3, 3, 3, '2023-03-25', '11:00:00'),
(50, 35, 15, 4, 4, 4, '2023-04-10', '12:45:00'),
(50, 40, 10, 5, 5, 5, '2023-05-05', '14:30:00'),
(50, 50, 0, 6, 6, 5, '2023-06-25', '14:30:00'),
(35, 35, 0, 7, 6, 4, '2023-07-05', '12:45:00'),
(35, 35, 0, 8, 8, 3, '2023-08-22', '08:00:00'),
(35, 35, 0, 9, 8, 2, '2023-09-15', '11:00:00'),
(50, 50, 0, 10, 8, 1, '2023-10-15', '08:00:00'),
(50, 45, 5, 11, 11, 1, '2023-11-11', '08:30:00'),
(35, 20, 15, 1, 12, 2, '2023-12-12', '10:00:00'),
(50, 45, 5, 2, 13, 3, '2024-01-01', '09:00:00'),
(35, 20, 15, 3, 14, 4, '2024-02-14', '11:30:00'),
(35, 35, 0, 4, 15, 5, '2024-03-25', '13:00:00'),
(50, 45, 5, 5, 15, 1, '2024-04-04', '14:30:00'),
(35, 20, 15, 6, 15, 2, '2024-05-15', '16:00:00'),
(50, 45, 5, 7, 15, 3, '2024-06-26', '17:30:00'),
(35, 35, 0, 8, 19, 4, '2024-07-07', '18:45:00'),
(50, 45, 5, 9, 20, 5, '2024-08-08', '20:00:00'),
(35, 20, 15, 10, 21, 1, '2024-09-09', '21:15:00'),
(50, 45, 5, 11, 22, 2, '2024-10-10', '22:30:00'),
(35, 20, 15, 1, 23, 3, '2024-11-11', '23:45:00'),
(50, 45, 5, 2, 24, 4, '2024-12-12', '00:00:00');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 21:14:12

-- Tạo thủ tục tìm kiếm chuyến đi
DROP PROCEDURE IF EXISTS information_trip; -- Xóa procedure information_trip nếu tồn tại
DELIMITER $$

CREATE PROCEDURE information_trip(
    IN start_district VARCHAR(255),
    IN start_province VARCHAR(255),
    IN end_district VARCHAR(255),
    IN end_province VARCHAR(255),
    IN start_date DATE,
    IN start_time TIME,
    IN end_date DATE,
    IN end_time TIME,
    IN company_name VARCHAR(255),
    IN coach_type VARCHAR(255)
)
BEGIN
    WITH route_matching AS (
        SELECT DISTINCT R.RouteID, RS.Cost
        FROM route R
        INNER JOIN routestop RS ON R.RouteID = RS.RouteID
        INNER JOIN district D1 ON R.StartDistrictID = D1.DistrictID
        INNER JOIN province_city P1 ON D1.ProvinceID = P1.ProvinceID
        INNER JOIN district D2 ON RS.StopDistrictID = D2.DistrictID
        INNER JOIN province_city P2 ON D2.ProvinceID = P2.ProvinceID
        WHERE D1.DistrictName = start_district AND P1.ProvinceCityName = start_province
            AND ((D2.DistrictName = end_district AND P2.ProvinceCityName = end_province) )
    )
    
    SELECT DISTINCT T.TripID, CoC.CoachCompanyName, C.CoachType, T.Time_,T.Date_, RM.Cost, (T.LimitOfSeat - T.NumberOfReservedSeat) AS RemainingNoTicket
    FROM CoachCompany CoC
    INNER JOIN Coach C ON CoC.CoachCompanyID = C.CoachCompanyID
    INNER JOIN Trip T ON C.CoachID = T.CoachID
    INNER JOIN route_matching RM ON T.RouteID = RM.RouteID
    WHERE T.LimitOfSeat > T.NumberOfReservedSeat
        AND (company_name ='' OR CoC.CoachCompanyName = company_name)
        AND (coach_type ='' OR C.CoachType = coach_type)
        AND T.Date_ >= start_date AND T.Date_ <= end_date
        AND (
            T.Date_ > start_date AND T.Date_< end_date
            OR ((T.Date_ = start_date AND T.Date_ = end_date AND T.Time_ >= start_time AND T.Time_ <= end_time) OR (T.Date_ = start_date AND T.Time_ >= start_time) OR (T.Date_ = end_date AND T.Time_ <= end_time))
        );
END $$

DELIMITER ;

-- Tạo thủ tục tìm tuyến đường có nhiều hành khách đi nhất
DROP PROCEDURE IF EXISTS max_ticket_of_route; -- Xóa procedure max_ticket_of_route nếu tồn tại
DELIMITER $$

CREATE PROCEDURE max_ticket_of_route(
    IN start_day DATE,
    IN end_day DATE
)
BEGIN
    -- Create a temporary table to store the count of tickets
    CREATE TEMPORARY TABLE IF NOT EXISTS count_ticket AS (
        SELECT R.RouteID, COUNT(Ti.TicketID) AS no_ticket
        FROM trip T
        INNER JOIN route R ON R.RouteID = T.RouteID
        INNER JOIN ticket Ti ON T.TripID = Ti.TripID
        WHERE Ti.PassengerSSN IS NOT NULL AND T.Date_ BETWEEN start_day AND end_day
        GROUP BY R.RouteID
    );

    -- Select the route with the maximum ticket count
    SELECT R.RouteID, COUNT(Ti.TicketID) AS max_ticketcount
    FROM trip T
    INNER JOIN route R ON R.RouteID = T.RouteID
    INNER JOIN ticket Ti ON T.TripID = Ti.TripID
    WHERE Ti.PassengerSSN IS NOT NULL AND T.Date_ BETWEEN start_day AND end_day
    GROUP BY R.RouteID
    HAVING COUNT(Ti.TicketID) = (SELECT MAX(no_ticket) FROM count_ticket)
    ORDER BY R.RouteID;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS count_ticket;
END $$

DELIMITER ;
