-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2018 at 11:54 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kos`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE IF NOT EXISTS `kamar` (
  `kode_kamar` varchar(3) NOT NULL,
  `harga_sewa` int(6) NOT NULL,
  `lantai` int(3) NOT NULL,
  `status_kamar` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Kamar Terisi, 0 = Kamar Kosong',
  PRIMARY KEY (`kode_kamar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`kode_kamar`, `harga_sewa`, `lantai`, `status_kamar`) VALUES
('A02', 250000, 2, 0),
('A03', 250000, 1, 1),
('A04', 250000, 1, 0),
('A05', 500000, 1, 1),
('A06', 250000, 1, 0),
('A07', 250000, 1, 0),
('A09', 250000, 1, 0),
('B01', 350000, 2, 1),
('B02', 350000, 2, 0),
('B03', 350000, 2, 0),
('B04', 350000, 2, 0),
('B05', 350000, 2, 0),
('B06', 9876454, 2, 0),
('B10', 300000, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `katering`
--

CREATE TABLE IF NOT EXISTS `katering` (
  `kode_katering` varchar(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  PRIMARY KEY (`kode_katering`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengurus`
--

CREATE TABLE IF NOT EXISTS `pengurus` (
  `id_pengurus` varchar(5) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`id_pengurus`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengurus`
--

INSERT INTO `pengurus` (`id_pengurus`, `username`, `password`, `nama`, `no_hp`, `alamat`) VALUES
('AD001', 'admin', '123', 'ADMIN', '-', 'INSIDE DATABASE');

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE IF NOT EXISTS `penyewa` (
  `id_penyewa` varchar(5) NOT NULL,
  `kode_kamar` varchar(3) DEFAULT NULL,
  `lama_sewa` int(10) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `nama` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`id_penyewa`),
  UNIQUE KEY `username` (`username`),
  KEY `kode_kamar` (`kode_kamar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `kode_kamar`, `lama_sewa`, `tanggal_masuk`, `nama`, `username`, `password`, `no_hp`, `alamat`) VALUES
('PE006', NULL, NULL, NULL, 'Rutlima', 'rut', 'rut5', '0878767674733', 'Jln. Pangeran Senopati, Bandar Lampung'),
('PE007', 'A05', 5, '2018-05-03', 'Aziz Wijaya', 'wijaya5', 'wijaya5', '0895606560673', 'Perum Korpri Blok B2 No. 16 Bandar Lampung'),
('PE008', 'A03', 5, '2018-05-05', 'hamzah', 'hamzah5', 'hamzah5', '091234567', 'jln. di Bandar Lampung'),
('PE009', 'B01', 5, '2018-05-22', 'Andi Ariyandi', 'andii', 'andii', '089646476711', 'Jln. Utama Desa Way Galih, Lampung Selatan');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE IF NOT EXISTS `tagihan` (
  `kode_tagihan` varchar(3) NOT NULL,
  `id_penyewa` varchar(5) NOT NULL,
  `total_tagihan` int(10) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'BELUM BAYAR',
  PRIMARY KEY (`kode_tagihan`),
  KEY `id_penyewa` (`id_penyewa`),
  KEY `id_penyewa_2` (`id_penyewa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`kode_tagihan`, `id_penyewa`, `total_tagihan`, `status`) VALUES
('T08', 'PE007', 2500000, 'BELUM BAYAR'),
('T09', 'PE008', 1250000, 'LUNAS'),
('T10', 'PE009', 1750000, 'BELUM BAYAR');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD CONSTRAINT `penyewa_ibfk_1` FOREIGN KEY (`kode_kamar`) REFERENCES `kamar` (`kode_kamar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
