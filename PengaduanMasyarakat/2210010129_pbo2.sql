-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 04:35 PM
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
-- Database: `2210010129_pbo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `hasil`
--

CREATE TABLE `hasil` (
  `Id_hasil` int(25) NOT NULL,
  `Id_pelapor` int(25) NOT NULL,
  `Id_laporan` int(25) NOT NULL,
  `Hasil_laporan` text NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hasil`
--

INSERT INTO `hasil` (`Id_hasil`, `Id_pelapor`, `Id_laporan`, `Hasil_laporan`, `Status`) VALUES
(1, 1, 1, '1', 'ditangani');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `Id` int(25) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Thumbnail` int(50) NOT NULL,
  `Text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`Id`, `Title`, `Thumbnail`, `Text`) VALUES
(21, 'arsyad', 1, 'laporan');

-- --------------------------------------------------------

--
-- Table structure for table `pelapor`
--

CREATE TABLE `pelapor` (
  `Kode` varchar(25) NOT NULL,
  `Nik` varchar(25) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Tempat_lahir` varchar(50) NOT NULL,
  `Tanggal_lahir` varchar(50) NOT NULL,
  `Pekerjaan` varchar(100) NOT NULL,
  `Kebangsaan` varchar(50) NOT NULL,
  `Agama` varchar(25) NOT NULL,
  `Alamat` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `No_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelapor`
--

INSERT INTO `pelapor` (`Kode`, `Nik`, `Nama`, `Tempat_lahir`, `Tanggal_lahir`, `Pekerjaan`, `Kebangsaan`, `Agama`, `Alamat`, `Email`, `No_hp`) VALUES
('5N', '987654321', 'Arsyad', 'sahurai', '16 september 2003', 'BOSS Limau', 'Indonesia', 'Islam', 'Banjarmasin', 'No@gmail.com', '08987654321');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `Kode` varchar(25) NOT NULL,
  `Kode_user` varchar(25) NOT NULL,
  `Masalah` varchar(50) NOT NULL,
  `Terduga` varchar(100) NOT NULL,
  `Bukti` varchar(100) NOT NULL,
  `Lokasi` varchar(50) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`Kode`, `Kode_user`, `Masalah`, `Terduga`, `Bukti`, `Lokasi`, `Deskripsi`, `Status`, `Pesan`) VALUES
('123', '5N', 'Kemalingan', 'Arsyad', 'ktp', 'Banjar', 'laki-laki', 'Ditangani', 'semoga ketangkap');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`Id_hasil`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pelapor`
--
ALTER TABLE `pelapor`
  ADD PRIMARY KEY (`Kode`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`Kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
