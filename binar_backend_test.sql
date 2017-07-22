-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 22, 2017 at 08:13 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binar_backend_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_pengguna`
--

CREATE TABLE `data_pengguna` (
  `id_pengguna` int(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `privilege` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pengguna`
--

INSERT INTO `data_pengguna` (`id_pengguna`, `nama`, `alamat`, `telepon`, `tempat_lahir`, `tanggal_lahir`, `privilege`) VALUES
(1, 'Bambang', 'Jogja', '083840007972', 'Jogja', '1987-07-04', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_ujian`
--

CREATE TABLE `jawaban_ujian` (
  `id_soal` int(10) NOT NULL,
  `id_pengguna` int(10) NOT NULL,
  `jawaban_pengguna` enum('a','b','c','d') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jawaban_ujian`
--

INSERT INTO `jawaban_ujian` (`id_soal`, `id_pengguna`, `jawaban_pengguna`) VALUES
(1, 1, 'd');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ujian`
--

CREATE TABLE `jenis_ujian` (
  `id_jenis_ujian` int(10) NOT NULL,
  `jenis_ujian` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_ujian`
--

INSERT INTO `jenis_ujian` (`id_jenis_ujian`, `jenis_ujian`) VALUES
(1, 'UAS'),
(2, 'UTS');

-- --------------------------------------------------------

--
-- Table structure for table `soal_ujian`
--

CREATE TABLE `soal_ujian` (
  `id_soal` int(10) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_a` varchar(25) NOT NULL,
  `pilihan_b` varchar(25) NOT NULL,
  `pilihan_c` varchar(25) NOT NULL,
  `pilihan_d` varchar(25) NOT NULL,
  `jawaban` enum('a','b','c','d') NOT NULL,
  `id_jenis_ujian` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal_ujian`
--

INSERT INTO `soal_ujian` (`id_soal`, `soal`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `jawaban`, `id_jenis_ujian`) VALUES
(1, 'Apakah arti dari kata \"table\" dalam bahasa Indonesia?', 'kursi', 'pintu', 'jendela', 'meja', 'd', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `jawaban_ujian`
--
ALTER TABLE `jawaban_ujian`
  ADD KEY `id_soal` (`id_soal`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `jenis_ujian`
--
ALTER TABLE `jenis_ujian`
  ADD PRIMARY KEY (`id_jenis_ujian`);

--
-- Indexes for table `soal_ujian`
--
ALTER TABLE `soal_ujian`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `id_jenis_ujian` (`id_jenis_ujian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  MODIFY `id_pengguna` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jenis_ujian`
--
ALTER TABLE `jenis_ujian`
  MODIFY `id_jenis_ujian` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `soal_ujian`
--
ALTER TABLE `soal_ujian`
  MODIFY `id_soal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `jawaban_ujian`
--
ALTER TABLE `jawaban_ujian`
  ADD CONSTRAINT `jawaban_ujian_ibfk_1` FOREIGN KEY (`id_soal`) REFERENCES `soal_ujian` (`id_soal`),
  ADD CONSTRAINT `jawaban_ujian_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `data_pengguna` (`id_pengguna`);

--
-- Constraints for table `soal_ujian`
--
ALTER TABLE `soal_ujian`
  ADD CONSTRAINT `soal_ujian_ibfk_1` FOREIGN KEY (`id_jenis_ujian`) REFERENCES `jenis_ujian` (`id_jenis_ujian`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
