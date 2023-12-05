-- Kiểm tra nếu database tồn tại thì xóa
DROP DATABASE IF EXISTS CoachStationSystem;

-- Tạo mới database
CREATE DATABASE CoachStationSystem
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

-- Sử dụng database vừa tạo
USE CoachStationSystem;

-- Tạo bảng CoachCompany
CREATE TABLE CoachCompany (
    CoachCompanyID INT AUTO_INCREMENT PRIMARY KEY,
    DateOfContractRegistration DATE,
    EndDateOfContract DATE,
    CoachCompanyName VARCHAR(255),
    Status VARCHAR(255) CHECK (Status IN ('Action', 'Not Action'))
);

-- Tạo bảng PhoneNumberCoachCompany
CREATE TABLE PhoneNumberCoachCompany (
    PhoneNumber VARCHAR(20) NOT NULL,
    CoachCompanyID INT NOT NULL,
    PRIMARY KEY (PhoneNumber, CoachCompanyID),
    FOREIGN KEY (CoachCompanyID) REFERENCES CoachCompany(CoachCompanyID)
);

-- Tạo bảng Coach
CREATE TABLE Coach (
    CoachID INT AUTO_INCREMENT PRIMARY KEY,
    Status VARCHAR(255) CHECK (Status IN ('At station', 'In transit')),
    CoachType VARCHAR(50),
    LicensePlates VARCHAR(20),
    NumberOfSeat INT,
    CoachCompanyID INT,
    FOREIGN KEY (CoachCompanyID) REFERENCES CoachCompany(CoachCompanyID)
);

-- Tạo bảng CoachEmployee
CREATE TABLE CoachEmployee (
    CoachStaffId INT AUTO_INCREMENT PRIMARY KEY,
    SSN VARCHAR(20),
    FName VARCHAR(50),
    Lname VARCHAR(50),
    Birthday DATE,
    Gender CHAR(1),
    CoachEmployeeType VARCHAR(50) CHECK (CoachEmployeeType IN ('Driver', 'Assistant')),
    LicenseNumber VARCHAR(50),
    LicenseType VARCHAR(50),
    CoachCompanyId INT,
    AccountID INT,
    FOREIGN KEY (CoachCompanyId) REFERENCES CoachCompany(CoachCompanyID)
);

-- Tạo bảng PhoneNumberCoachEmployee
CREATE TABLE PhoneNumberCoachEmployee (
    CoachEmployeeID INT NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (CoachEmployeeID, PhoneNumber),
    FOREIGN KEY (CoachEmployeeID) REFERENCES CoachEmployee(CoachStaffId)
);

-- Tạo bảng EmailCoachEmployee
CREATE TABLE EmailCoachEmployee (
    CoachEmployeeID INT NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY (CoachEmployeeID, Email),
    FOREIGN KEY (CoachEmployeeID) REFERENCES CoachEmployee(CoachStaffId)
);

-- Tạo bảng AddressCoachEmployee
CREATE TABLE AddressCoachEmployee (
    CoachEmployeeID INT NOT NULL,
    HouseNumber VARCHAR(50) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    DistrictCity VARCHAR(100) NOT NULL,
    ProvinceCity VARCHAR(100) NOT NULL,
    PRIMARY KEY (CoachEmployeeID, HouseNumber, Street, DistrictCity, ProvinceCity),
    FOREIGN KEY (CoachEmployeeID) REFERENCES CoachEmployee(CoachStaffId)
);

-- Tạo bảng Trip
CREATE TABLE Trip (
    TripID INT AUTO_INCREMENT PRIMARY KEY,
    LimitOfSeat INT,
    NumberOfReservedSeat INT,
    NumberOfNoBookSeat INT,
    CoachID INT,
    RouteID INT,
    DriverID INT,
    Date_ DATE,
    Time_ TIME,
    FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
    FOREIGN KEY (DriverID) REFERENCES CoachEmployee(CoachStaffId)
);

-- Tạo bảng Assist
CREATE TABLE Assist (
    TripID INT NOT NULL,
    AssistantID INT NOT NULL,
    PRIMARY KEY (TripID, AssistantID),
    FOREIGN KEY (TripID) REFERENCES Trip(TripID),
    FOREIGN KEY (AssistantID) REFERENCES CoachEmployee(CoachStaffId)
);

-- Tạo bảng Route
CREATE TABLE Route (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    StartDistrictID INT,
    EndDistrictID INT,
    CoachCompanyID INT,
    FOREIGN KEY (CoachCompanyID) REFERENCES CoachCompany(CoachCompanyID)
);

-- Tạo bảng RouteStop
CREATE TABLE RouteStop (
    RouteStopID INT AUTO_INCREMENT PRIMARY KEY,
    RouteID INT,
    Cost DECIMAL(10, 2),
    StopDistrictID INT,
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

-- Tạo bảng Province_City
CREATE TABLE Province_City (
    ProvinceID INT AUTO_INCREMENT PRIMARY KEY,
    ProvinceCityName VARCHAR(100)
);

-- Tạo bảng District
CREATE TABLE District (
    DistrictID INT AUTO_INCREMENT PRIMARY KEY,
    DistrictName VARCHAR(100),
    ProvinceID INT,
    FOREIGN KEY (ProvinceID) REFERENCES Province_City(ProvinceID)
);

-- Tạo bảng Ticket
CREATE TABLE Ticket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    SeatNumber INT,
    AccountID INT,
    InvoiceID INT,
    PassengerSSN VARCHAR(20),
    TripID INT,
    RouteStopID INT,
    RouteID INT,
    FOREIGN KEY (TripID) REFERENCES Trip(TripID),
    FOREIGN KEY (RouteStopID) REFERENCES RouteStop(RouteStopID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

-- Tạo bảng Passenger
CREATE TABLE Passenger (
    SSN VARCHAR(20) NOT NULL PRIMARY KEY,
    Name VARCHAR(100),
    BirthDay DATE,
    Gender CHAR(1),
    AccountID INT
);

-- Tạo bảng PhoneNumberPassenger
CREATE TABLE PhoneNumberPassenger (
    PhoneNumber VARCHAR(20) NOT NULL,
    PassengerSSN VARCHAR(20) NOT NULL,
    PRIMARY KEY (PhoneNumber, PassengerSSN),
    FOREIGN KEY (PassengerSSN) REFERENCES Passenger(SSN)
);

-- Tạo bảng EmailPassenger
CREATE TABLE EmailPassenger (
    Email VARCHAR(100) NOT NULL,
    PassengerSSN VARCHAR(20) NOT NULL,
    PRIMARY KEY (Email, PassengerSSN),
    FOREIGN KEY (PassengerSSN) REFERENCES Passenger(SSN)
);

-- Tạo bảng AddressPassenger
CREATE TABLE AddressPassenger (
    HouseNumber VARCHAR(50) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    District_City VARCHAR(100) NOT NULL,
    Province_City VARCHAR(100) NOT NULL,
    PassengerSSN VARCHAR(20) NOT NULL,
    PRIMARY KEY (HouseNumber, Street, District_City, Province_City, PassengerSSN),
    FOREIGN KEY (PassengerSSN) REFERENCES Passenger(SSN)
);

-- Tạo bảng Invoice
CREATE TABLE Invoice (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    TaxCode VARCHAR(50),
    AccountID INT,
    PassengerSSN VARCHAR(20),
    Date DATE,
    Time TIME,
    FOREIGN KEY (PassengerSSN) REFERENCES Passenger(SSN)
);

-- Tạo bảng TerminalEmployee
CREATE TABLE TerminalEmployee (
    TerminalEmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    SSN VARCHAR(20),
    FName VARCHAR(50),
    LName VARCHAR(50),
    BirthDay DATE,
    Gender CHAR(1),
    TerminalEmployeeType VARCHAR(50),
    DepartmentID INT,
    AccountID INT,
    SupervisorID INT,
    FOREIGN KEY (SupervisorID) REFERENCES TerminalEmployee(TerminalEmployeeID)
);

-- Tạo bảng Department
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    ManageEmployeeID INT,
    FOREIGN KEY (ManageEmployeeID) REFERENCES TerminalEmployee(TerminalEmployeeID)
);

-- Tạo bảng PhoneNumberTerminalEmployee
CREATE TABLE PhoneNumberTerminalEmployee (
    PhoneNumber VARCHAR(20) NOT NULL,
    TerminalEmployeeID INT NOT NULL,
    PRIMARY KEY (PhoneNumber, TerminalEmployeeID),
    FOREIGN KEY (TerminalEmployeeID) REFERENCES TerminalEmployee(TerminalEmployeeID)
);

-- Tạo bảng EmailTerminalEmployee
CREATE TABLE EmailTerminalEmployee (
    Email VARCHAR(100) NOT NULL,
    TerminalEmployeeID INT NOT NULL,
    PRIMARY KEY (Email, TerminalEmployeeID),
    FOREIGN KEY (TerminalEmployeeID) REFERENCES TerminalEmployee(TerminalEmployeeID)
);

-- Tạo bảng AddressTerminalEmployee
CREATE TABLE AddressTerminalEmployee (
    HouseNumber VARCHAR(50) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    District_City VARCHAR(100) NOT NULL,
    Province_City VARCHAR(100) NOT NULL,
    TerminalEmployeeID INT NOT NULL,
    PRIMARY KEY (HouseNumber, Street, District_City, Province_City, TerminalEmployeeID),
    FOREIGN KEY (TerminalEmployeeID) REFERENCES TerminalEmployee(TerminalEmployeeID)
);

-- Tạo bảng Account
CREATE TABLE Account (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50),
    Password VARCHAR(50),
    AccountStatus VARCHAR(20),
    AccountType VARCHAR(20) CHECK (AccountType IN ('CoachEmployee', 'Passenger', 'TerminalEmployee'))
);

-- Chỉnh sửa ràng buộc
ALTER TABLE CoachEmployee
ADD CONSTRAINT FK_AccountID FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE Trip
ADD CONSTRAINT FK_RouteID FOREIGN KEY (RouteID) REFERENCES Route(RouteID);

ALTER TABLE RouteStop
ADD CONSTRAINT FK_StopDistrictID FOREIGN KEY (StopDistrictID) REFERENCES District(DistrictID);

ALTER TABLE District
ADD CONSTRAINT FK_ProvinceID FOREIGN KEY (ProvinceID) REFERENCES Province_City(ProvinceID);

ALTER TABLE Ticket
ADD CONSTRAINT FK_Ticket_AccountID FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE Ticket
ADD CONSTRAINT FK_Ticket_InvoiceID FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID);

ALTER TABLE Passenger
ADD CONSTRAINT FK_AccountID_Passenger FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE Invoice
ADD CONSTRAINT FK_AccountID_Invoice FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE TerminalEmployee
ADD CONSTRAINT FK_AccountID_TerminalEmployee FOREIGN KEY (AccountID) REFERENCES Account(AccountID);

ALTER TABLE Ticket
ADD CONSTRAINT FK_DepartmentID_TerminalEmployee FOREIGN KEY (PassengerSSN) REFERENCES Passenger(SSN);

-- No check constraint
SET foreign_key_checks = 0;

-- Thêm dữ liệu vào bảng Province_City
INSERT INTO Province_City (ProvinceCityName)
VALUES ('Hồ Chí Minh'), ('Hà Nội'), ('Đà Nẵng'), ('Hải Phòng'), ('Cần Thơ'), ('Hải Dương');

-- Thêm dữ liệu vào bảng District
INSERT INTO District (DistrictName, ProvinceID)
VALUES 
    ('Quận 1', 1), ('Quận 2', 1), ('Quận 3', 1), ('Quận 10', 1),
    ('Quận Hoàn Kiếm', 2), ('Quận Ba Đình', 2),
    ('Quận Sơn Trà', 3), ('Quận Ngũ Hành Sơn', 3),
    ('Quận Hải An', 4), ('Quận Lê Chân', 4),
    ('Quận Ninh Kiều', 5), ('Quận Bình Thủy', 5),
    ('Quận Hải An', 6), ('Quận Kiến An', 6);

-- Thêm dữ liệu vào bảng CoachCompany
INSERT INTO CoachCompany (DateOfContractRegistration, EndDateOfContract, CoachCompanyName, Status)
VALUES 
    ('2022-01-01', '2026-12-31', 'Xe Khách ABC', 'Action'),
    ('2022-02-01', '2024-11-30', 'Xe Khách XYZ', 'Action'),
    ('2022-03-01', '2022-10-31', 'Xe Khách 123', 'Not Action'),
    ('2022-04-01', '2025-09-30', 'Xe Khách 456', 'Action'),
    ('2022-05-01', '2022-08-31', 'Xe Khách UVW', 'Not Action');

-- Thêm dữ liệu vào bảng Coach
INSERT INTO Coach (Status, CoachType, LicensePlates, NumberOfSeat, CoachCompanyID)
VALUES 
    ('At station', 'Limousine', '51A-12345', 45, 1),
    ('In transit', 'Standard', '36B-67890', 30, 2),
    ('At station', 'Luxury', '92C-54321', 50, 3),
    ('In transit', 'Limousine', '34D-98765', 40, 4),
    ('At station', 'Standard', '29E-24680', 35, 5);

-- Thêm dữ liệu vào bảng CoachEmployee
INSERT INTO CoachEmployee (SSN, FName, LName, Birthday, Gender, CoachEmployeeType, LicenseNumber, LicenseType, CoachCompanyId, AccountID)
VALUES 
    ('123456789', 'Nguyễn', 'Văn A', '1980-05-15', 'M', 'Driver', '30A-12345', 'D1', 1, 1),
    ('987654321', 'Trần', 'Thị B', '1992-10-20', 'F', 'Assistant', '42B-67890', 'D1', 2, 2),
    ('456789012', 'Lê', 'Quang C', '1985-03-08', 'M', 'Driver', '77C-54321', 'D1', 3, 3),
    ('321654987', 'Phạm', 'Văn D', '1990-07-25', 'M', 'Driver', '59D-98765', 'D1', 4, 4),
    ('789012345', 'Đỗ', 'Thị E', '1988-02-18', 'F', 'Assistant', '72A-24680', 'D1', 5, 5);

-- Thêm dữ liệu vào bảng Route
INSERT INTO Route (StartDistrictID, EndDistrictID, CoachCompanyID)
VALUES 
    (1, 2, 1),
    (2, 4, 2),
    (3, 5, 3),
    (4, 6, 4),
    (5, 6, 5);

-- Thêm dữ liệu vào bảng RouteStop
INSERT INTO RouteStop (RouteID, Cost, StopDistrictID)
VALUES 
    (1, 50000, 1),
    (1, 70000, 2),
    (2, 80000, 2),
    (2, 100000, 4),
    (3, 60000, 3),
    (3, 90000, 5),
    (4, 75000, 4),
    (4, 95000, 6),
    (5, 70000, 5),
    (5, 110000, 6);

-- Thêm dữ liệu vào bảng Passenger
INSERT INTO Passenger (SSN, Name, BirthDay, Gender, AccountID)
VALUES 
    ('111111111', 'Phạm Thị C', '1990-02-28', 'F', 6),
    ('222222222', 'Võ Văn D', '1988-07-10', 'M', 7),
    ('333333333', 'Nguyễn Văn E', '1995-12-15', 'M', 8),
    ('444444444', 'Trần Thị F', '1993-05-05', 'F', 9),
    ('555555555', 'Lê Văn G', '1985-11-12', 'M', 10);

-- Thêm dữ liệu vào bảng Ticket
INSERT INTO Ticket (SeatNumber, AccountID, InvoiceID, PassengerSSN, TripID, RouteStopID, RouteID)
VALUES 
    (10, 6, 1, '111111111', 1, 1, 1),
    (15, 7, 2, '222222222', 2, 3, 2),
    (20, 8, 3, '333333333', 3, 5, 3),
    (12, 9, 4, '444444444', 4, 7, 4),
    (18, 10, 5, '555555555', 5, 9, 5);

-- Thêm dữ liệu vào bảng Invoice
INSERT INTO Invoice (TaxCode, AccountID, PassengerSSN, Date, Time)
VALUES 
    ('ABC123', 6, '111111111', '2023-01-01', '10:30:00'),
    ('XYZ456', 7, '222222222', '2023-02-15', '12:45:00'),
    ('123DEF', 8, '333333333', '2023-03-20', '15:00:00'),
('456GHI', 9, '444444444', '2023-04-10', '14:30:00'),
('789JKL', 10, '555555555', '2023-05-25', '11:00:00');

-- Thêm dữ liệu vào bảng TerminalEmployee
INSERT INTO TerminalEmployee (SSN, FName, LName, Birthday, Gender, TerminalEmployeeType, DepartmentID, AccountID, SupervisorID)
VALUES
('789012345', 'Hoàng Thị F', 'Giang', '1982-06-22', 'F', 'Supervisor', 1, 11, NULL),
('345678901', 'Trần Văn G', 'Huy', '1990-09-18', 'M', 'Clerk', 2, 12, 11),
('901234567', 'Lê Thị H', 'Thảo', '1988-04-05', 'F', 'Clerk', 2, 13, 11),
('234567890', 'Nguyễn Văn I', 'Khánh', '1993-11-30', 'M', 'Supervisor', 2, 14, NULL),
('567890123', 'Trần Thị K', 'Linh', '1985-08-12', 'F', 'Clerk', 1, 15, 14);

-- Thêm dữ liệu vào bảng Department
INSERT INTO Department (DepartmentName, ManageEmployeeID)
VALUES
('Operation', 1),
('Finance', 4),
('Human Resources', 2);

-- Thêm dữ liệu vào bảng Account
INSERT INTO Account (UserName, Password, AccountStatus, AccountType)
VALUES
('driver1', 'pass123', 'Active', 'CoachEmployee'),
('assistant1', 'pass456', 'Active', 'CoachEmployee'),
('driver2', 'pass789', 'Active', 'CoachEmployee'),
('passenger1', 'passpass', 'Active', 'Passenger'),
('passenger2', 'wordword', 'Active', 'Passenger'),
('passenger3', 'secure123', 'Active', 'Passenger'),
('supervisor1', 'admin123', 'Active', 'TerminalEmployee'),
('clerk1', 'clerkpass', 'Active', 'TerminalEmployee'),
('clerk2', 'clerkword', 'Active', 'TerminalEmployee'),
('supervisor2', 'admin456', 'Active', 'TerminalEmployee'),
('clerk3', 'clerksecure', 'Active', 'TerminalEmployee'),
('clerk4', 'clerk567', 'Active', 'TerminalEmployee'),
('supervisor3', 'admin789', 'Active', 'TerminalEmployee'),
('clerk5', 'clerk789', 'Active', 'TerminalEmployee'),
('clerk6', 'clerkadmin', 'Active', 'TerminalEmployee');

-- Thêm dữ liệu vào bảng Assist
INSERT INTO Assist (TripID, AssistantID)
VALUES
(1, 2),
(2, 5),
(3, 3),
(4, 5),
(5, 4);

-- Thêm dữ liệu vào bảng Trip
INSERT INTO Trip (LimitOfSeat, NumberOfReservedSeat, CoachID, RouteID, DriverID, Date_, Time_)
VALUES
(50, 30, 1, 1, 1, '2023-01-15', '08:00:00'),
(40, 20, 2, 2, 2, '2023-02-20', '09:30:00'),
(60, 40, 3, 3, 3, '2023-03-25', '11:00:00'),
(55, 35, 4, 4, 4, '2023-04-10', '12:45:00'),
(45, 25, 5, 5, 5, '2023-05-05', '14:30:00');

-- Kích hoạt lại ràng buộc sau khi thêm dữ liệu
SET foreign_key_checks = 1;

