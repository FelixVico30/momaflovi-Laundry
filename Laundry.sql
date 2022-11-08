-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2022 at 08:42 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `boking`
--

CREATE TABLE `boking` (
  `ID_Booking` varchar(15) NOT NULL,
  `Time` time(6) NOT NULL,
  `Date` date NOT NULL,
  `ID_Karyawan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `boking`
--

INSERT INTO `boking` (`ID_Booking`, `Time`, `Date`, `ID_Karyawan`) VALUES
('B0001', '10:00:00.000000', '2022-10-11', 'K0001'),
('B0002', '13:00:00.000000', '2022-10-11', 'K0001'),
('B0003', '10:00:00.000000', '2022-10-11', 'K0002');

-- --------------------------------------------------------

--
-- Table structure for table `informasi_pemesanan`
--

CREATE TABLE `informasi_pemesanan` (
  `Price` varchar(8) NOT NULL,
  `ID_Pelanggan` varchar(15) NOT NULL,
  `ID_Booking` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `informasi_pemesanan`
--

INSERT INTO `informasi_pemesanan` (`Price`, `ID_Pelanggan`, `ID_Booking`) VALUES
('45000', 'P0001', 'B0002'),
('45000', 'P0003', 'B0001'),
('60000', 'P0004', 'B0001');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID_Karyawan` varchar(15) NOT NULL,
  `Password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID_Karyawan`, `Password`) VALUES
('K0001', 'momaravi'),
('K0002', 'momaraco');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_Pelanggan` varchar(15) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `No_Telp` varchar(13) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Username` varchar(10) NOT NULL,
  `Password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_Pelanggan`, `Name`, `No_Telp`, `Address`, `Username`, `Password`) VALUES
('P0001', 'Felix Vico', '082180456657', 'Jln.Paingan', 'melione', 'melione3'),
('P0002', 'Flora Lebona', '08229385', 'Jln.Paingan', 'floka', 'floka63'),
('P0003', 'Marcelia Puttri', '085753485531', 'Jln. Paingan', 'puput', 'puput31'),
('P0004', 'Moses Amor', '087747878534', 'Jln. Paingan', 'moses', 'moses34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boking`
--
ALTER TABLE `boking`
  ADD PRIMARY KEY (`ID_Booking`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`);

--
-- Indexes for table `informasi_pemesanan`
--
ALTER TABLE `informasi_pemesanan`
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`),
  ADD KEY `ID_Booking` (`ID_Booking`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID_Karyawan`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_Pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boking`
--
ALTER TABLE `boking`
  ADD CONSTRAINT `boking_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `informasi_pemesanan`
--
ALTER TABLE `informasi_pemesanan`
  ADD CONSTRAINT `informasi_pemesanan_ibfk_1` FOREIGN KEY (`ID_Booking`) REFERENCES `boking` (`ID_Booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `informasi_pemesanan_ibfk_2` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
