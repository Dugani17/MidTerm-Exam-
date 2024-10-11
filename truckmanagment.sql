-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2024 at 03:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `truckmanagment`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber1` varchar(20) DEFAULT NULL,
  `PhoneNumber2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Address`, `PhoneNumber1`, `PhoneNumber2`) VALUES
(1, 'Prasad', 'guelph', '5197318942', '3452221111'),
(2, 'mounika', 'waterloo', '5197318955', '7485961203'),
(3, 'manisha', 'kitchner', '9645781203', '3674851298'),
(4, 'sing', 'milton', '5674123985', '2574896310');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `DriverID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`DriverID`, `EmployeeID`, `Category`) VALUES
(1, 2, 'Class b'),
(2, 1, 'Class A'),
(3, 3, 'Class A'),
(4, 4, 'Class c');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Surname` varchar(100) DEFAULT NULL,
  `Seniority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `Name`, `Surname`, `Seniority`) VALUES
(1, 'Prasad, 'Dugani', 4),
(2, 'Mounika', 'gundu', 5),
(3, 'Manisha', 'D', 3),
(4, 'sing', 'king', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `MechanicID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `SpecializedBrand` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`MechanicID`, `EmployeeID`, `SpecializedBrand`) VALUES
(1, 1, 'Honda'),
(2, 2, 'hyundai'),
(3, 3, 'mazda'),
(4, 4, 'toyato');

-- --------------------------------------------------------

--
-- Table structure for table `repairs`
--

CREATE TABLE `repairs` (
  `RepairID` int(11) NOT NULL,
  `TruckID` int(11) DEFAULT NULL,
  `MechanicID` int(11) DEFAULT NULL,
  `EstimatedRepairTimeDays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repairs`
--

INSERT INTO `repairs` (`RepairID`, `TruckID`, `MechanicID`, `EstimatedRepairTimeDays`) VALUES
(1, 1, 1, 3),
(2, 2, 2, 2),
(3, 3, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `ShipmentID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL,
  `Value` decimal(10,2) DEFAULT NULL,
  `Origin` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`ShipmentID`, `CustomerID`, `Weight`, `Value`, `Origin`, `Destination`) VALUES
(1, 1, 200.00, 1000.00, 'guelph', 'waterloo'),9
(2, 2, 268.00, 801.00, 'guelph', 'kitchner'),
(3, 3, 200.00, 600.00, 'kitchner', 'brampton'),
(4, 4, 350.00, 1200.00, 'brampton', 'guelph');

-- --------------------------------------------------------

--
-- Table structure for table `tripdrivers`
--

CREATE TABLE `tripdrivers` (
  `TripID` int(11) DEFAULT NULL,
  `DriverID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tripdrivers`
--

INSERT INTO `tripdrivers` (`TripID`, `DriverID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tripshipments`
--

CREATE TABLE `tripshipments` (
  `TripID` int(11) DEFAULT NULL,
  `ShipmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tripshipments`
--

INSERT INTO `tripshipments` (`TripID`, `ShipmentID`) VALUES
(1, 2),
(2, 2),
(3, 3),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `TruckID` int(11) NOT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  `Load_1` decimal(10,2) DEFAULT NULL,
  `Capacity` decimal(10,2) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `NumberOfRepairs` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`TruckID`, `Brand`, `Load_1`, `Capacity`, `Year`, `NumberOfRepairs`) VALUES
(1, 'volvo1', 7000.00, 1234.00, 2024, 4),
(2, 'Honda', 7000.00, 20000.00, 2023, 3),
(3, 'Toyota', 4000.00, 15000.00, 2022, 2),
(11, 'suzuki2', 12001.00, 50001.00, 2021, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trucktrips`
--

CREATE TABLE `trucktrips` (
  `TripID` int(11) NOT NULL,
  `TruckID` int(11) DEFAULT NULL,
  `RouteFrom` varchar(255) DEFAULT NULL,
  `RouteTo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trucktrips`
--

INSERT INTO `trucktrips` (`TripID`, `TruckID`, `RouteFrom`, `RouteTo`) VALUES
(1, 1, 'milton', 'doon'),
(2, 2, 'brampton', 'oakville'),
(3, 3, 'waterloo', 'brampton');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`DriverID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`MechanicID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `repairs`
--
ALTER TABLE `repairs`
  ADD PRIMARY KEY (`RepairID`),
  ADD KEY `TruckID` (`TruckID`),
  ADD KEY `MechanicID` (`MechanicID`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`ShipmentID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `tripdrivers`
--
ALTER TABLE `tripdrivers`
  ADD KEY `TripID` (`TripID`),
  ADD KEY `DriverID` (`DriverID`);

--
-- Indexes for table `tripshipments`
--
ALTER TABLE `tripshipments`
  ADD KEY `TripID` (`TripID`),
  ADD KEY `ShipmentID` (`ShipmentID`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`TruckID`);

--
-- Indexes for table `trucktrips`
--
ALTER TABLE `trucktrips`
  ADD PRIMARY KEY (`TripID`),
  ADD KEY `TruckID` (`TruckID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `repairs`
--
ALTER TABLE `repairs`
  MODIFY `RepairID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `ShipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `TruckID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trucktrips`
--
ALTER TABLE `trucktrips`
  MODIFY `TripID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Constraints for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD CONSTRAINT `mechanics_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Constraints for table `repairs`
--
ALTER TABLE `repairs`
  ADD CONSTRAINT `repairs_ibfk_1` FOREIGN KEY (`TruckID`) REFERENCES `trucks` (`TruckID`),
  ADD CONSTRAINT `repairs_ibfk_2` FOREIGN KEY (`MechanicID`) REFERENCES `mechanics` (`EmployeeID`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `tripdrivers`
--
ALTER TABLE `tripdrivers`
  ADD CONSTRAINT `tripdrivers_ibfk_1` FOREIGN KEY (`TripID`) REFERENCES `trucktrips` (`TripID`),
  ADD CONSTRAINT `tripdrivers_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`EmployeeID`);

--
-- Constraints for table `tripshipments`
--
ALTER TABLE `tripshipments`
  ADD CONSTRAINT `tripshipments_ibfk_1` FOREIGN KEY (`TripID`) REFERENCES `trucktrips` (`TripID`),
  ADD CONSTRAINT `tripshipments_ibfk_2` FOREIGN KEY (`ShipmentID`) REFERENCES `shipments` (`ShipmentID`);

--
-- Constraints for table `trucktrips`
--
ALTER TABLE `trucktrips`
  ADD CONSTRAINT `trucktrips_ibfk_1` FOREIGN KEY (`TruckID`) REFERENCES `trucks` (`TruckID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
