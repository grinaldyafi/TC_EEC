-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2021 at 07:36 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technocorner`
--

-- --------------------------------------------------------

--
-- Table structure for table `eec_answer`
--

CREATE TABLE `eec_answer` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answer`)),
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eec_answer`
--

INSERT INTO `eec_answer` (`id`, `team_id`, `answer`, `time`) VALUES
(1, 123, '{\"0\":\"\",\"1\":\"B\",\"2\":\"A\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"\",\"9\":\"\",\"10\":\"\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"14\":\"\",\"15\":\"\",\"16\":\"\",\"17\":\"\",\"18\":\"\",\"19\":\"\",\"20\":\"\",\"21\":\"\",\"22\":\"\",\"23\":\"\",\"24\":\"\",\"25\":\"\",\"26\":\"\",\"27\":\"\",\"28\":\"\",\"29\":\"\",\"30\":\"\",\"31\":\"\",\"32\":\"\",\"33\":\"\",\"34\":\"\",\"35\":\"\",\"36\":\"\",\"37\":\"\",\"38\":\"\",\"39\":\"\",\"40\":\"\",\"41\":\"\",\"42\":\"\",\"43\":\"\",\"44\":\"\",\"45\":\"\",\"46\":\"\",\"47\":\"\",\"48\":\"\",\"49\":\"\",\"50\":\"\",\"51\":\"\",\"52\":\"\",\"53\":\"\",\"54\":\"\",\"55\":\"\",\"56\":\"\",\"57\":\"\",\"58\":\"\",\"59\":\"\",\"60\":\"\",\"61\":\"\",\"62\":\"\",\"63\":\"\",\"64\":\"\",\"65\":\"\",\"66\":\"\",\"67\":\"\",\"68\":\"\",\"69\":\"\",\"70\":\"\",\"71\":\"\",\"72\":\"\",\"73\":\"\",\"74\":\"\",\"75\":\"\",\"76\":\"\",\"77\":\"\",\"78\":\"\",\"79\":\"\",\"80\":\"\",\"81\":\"\",\"82\":\"\",\"83\":\"\",\"84\":\"\",\"85\":\"\",\"86\":\"\",\"87\":\"\",\"88\":\"\",\"89\":\"\",\"90\":\"\",\"91\":\"\",\"92\":\"\",\"93\":\"\",\"94\":\"\",\"95\":\"\",\"96\":\"\",\"97\":\"\",\"98\":\"\",\"99\":\"\"}', '0000-00-00 00:00:00'),
(2, 320, '{\"0\":\"\",\"1\":\"B\",\"2\":\"A\",\"3\":\"\",\"4\":\"\",\"5\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"\",\"9\":\"\",\"10\":\"\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"14\":\"\",\"15\":\"\",\"16\":\"\",\"17\":\"\",\"18\":\"\",\"19\":\"\",\"20\":\"\",\"21\":\"\",\"22\":\"\",\"23\":\"\",\"24\":\"\",\"25\":\"\",\"26\":\"\",\"27\":\"\",\"28\":\"\",\"29\":\"\",\"30\":\"\",\"31\":\"\",\"32\":\"\",\"33\":\"\",\"34\":\"\",\"35\":\"\",\"36\":\"\",\"37\":\"\",\"38\":\"\",\"39\":\"\",\"40\":\"\",\"41\":\"\",\"42\":\"\",\"43\":\"\",\"44\":\"\",\"45\":\"\",\"46\":\"\",\"47\":\"\",\"48\":\"\",\"49\":\"\",\"50\":\"\",\"51\":\"\",\"52\":\"\",\"53\":\"\",\"54\":\"\",\"55\":\"\",\"56\":\"\",\"57\":\"\",\"58\":\"\",\"59\":\"\",\"60\":\"\",\"61\":\"\",\"62\":\"\",\"63\":\"\",\"64\":\"\",\"65\":\"\",\"66\":\"\",\"67\":\"\",\"68\":\"\",\"69\":\"\",\"70\":\"\",\"71\":\"\",\"72\":\"\",\"73\":\"\",\"74\":\"\",\"75\":\"\",\"76\":\"\",\"77\":\"\",\"78\":\"\",\"79\":\"\",\"80\":\"\",\"81\":\"\",\"82\":\"\",\"83\":\"\",\"84\":\"\",\"85\":\"\",\"86\":\"\",\"87\":\"\",\"88\":\"\",\"89\":\"\",\"90\":\"\",\"91\":\"\",\"92\":\"\",\"93\":\"\",\"94\":\"\",\"95\":\"\",\"96\":\"\",\"97\":\"\",\"98\":\"\",\"99\":\"\"}', '2021-04-14 20:47:36');

-- --------------------------------------------------------

--
-- Table structure for table `eec_final`
--

CREATE TABLE `eec_final` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eec_final`
--

INSERT INTO `eec_final` (`id`, `username`, `user_id`, `admin`) VALUES
(1, 'alphonsusjovian@gmail.com', 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(256) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lomba`
--

CREATE TABLE `lomba` (
  `id` int(11) NOT NULL,
  `nama_lomba` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `deskripsi` varchar(512) NOT NULL,
  `anggota_team` int(11) NOT NULL,
  `image` varchar(128) NOT NULL,
  `daftar_url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lomba`
--

INSERT INTO `lomba` (`id`, `nama_lomba`, `title`, `deskripsi`, `anggota_team`, `image`, `daftar_url`) VALUES
(1, 'linefollower', 'Line Follower', 'Line Follower merupakan cabang lomba robot di mana setiap robot peserta digerakkan secara otomatis (bergerak sendiri). Pada kompetisi ini, peserta diberikan arena untuk mencapai finish dengan melewati berbagai jalur tertentu. Nantinya, tiap jalur akan memiliki bobot point tertentu. Dalam kompetisi ini, point menjadi hal utama. Apabila ada tim yang memiliki point yang sama, maka tim yang menang adalah tim yang mencapai finish dengan waktu tercepat.', 2, 'logo-linefollower.png', 'menu/daftarRobotik'),
(2, 'transporter', 'Transporter', 'Transporter merupakan cabang lomba robot di mana peserta dapat menggerakkan robotnya dengan remote untuk memindahkan beberapa kotak yang disediakan ke area biru dan area hijau (opsional) untuk mendapatkan point dalam waktu 4 menit. Kotak dapat dipindahkkan ke area hijau setelah kotak diteruskan dari area biru. Dalam kompetisi ini, point menjadi hal utama. Apabila ada tim yang memiliki point yang sama, maka tim yang menang adalah tim yang menyelesaikan misi dengan waktu tercepat.', 3, 'logo-transporter.png', 'menu/daftarRobotik'),
(3, 'eec', 'EEC', 'EEC merupakan sebuah kometisi di bidang matematika, fisika, dan komputer. Format kompetisi ini beregu, di mana tiap regu/tim terdiri dari 3 orang siswa SMA/sederajat se-Indonesia. Kompetisi ini dilaksanakan dalam 3 babak, yaitu penyisihan, semifinal, dan final. Penyisihan dilaksanakan secara daring dalam waktu yang bersamaan. 15 tim terbaik akan melaju ke babak semifinal yang diselenggarakan secara daring.', 3, 'logo-eec.png', 'menu/daftar/eec'),
(4, 'iot', 'IoT Dev', 'Internet of Things Development Competition (IoT Development Compeitition) merupakan kompetisi pengembangan perangkat berbasis Internet of Things pada rangkai acara Technocorner 2021. IoT Development Competition diharapkan dapat menghasilkan inovasi-inovasi yang bermanfaat, khususnya di kehidupan sehari-hari. IoT Development Competition terbuka untuk masyarakat umum yang ingin menuangkan idenya untuk mengatasi permasalah sehari-hari melalui perangkat berbasis Internet of Things.', 3, 'logo-iot.png', 'menu/daftarIot');

-- --------------------------------------------------------

--
-- Table structure for table `lomba_agenda`
--

CREATE TABLE `lomba_agenda` (
  `id` int(11) NOT NULL,
  `lomba_id` int(11) NOT NULL,
  `nama_agenda` varchar(128) NOT NULL,
  `jadwal_agenda` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lomba_agenda`
--

INSERT INTO `lomba_agenda` (`id`, `lomba_id`, `nama_agenda`, `jadwal_agenda`) VALUES
(1, 1, 'Pendaftaran Online', '7 Maret 2021 - 1 April 2021'),
(2, 1, 'Pelaksanaan Lomba', '15 April 2021'),
(3, 3, 'Pendaftaran Online dan Pengumpulan Proposal', '7 Maret 2021 - 28 Maret 2021'),
(4, 3, 'Batas Akhir Pengumpulan Proposal', '28 Maret 2021'),
(5, 3, 'Pengumuman Tim Lolos Seleksi Proposal', '4 April 2021'),
(6, 3, 'Pembuatan Alat dan Video Demonstrasi', '4 April 2021 - 2 Mei 2021'),
(7, 3, 'Pengumuman Finalis', '16 Mei 2021'),
(8, 3, 'Technical Meeting Grand Final', '23 Mei 2021'),
(9, 3, 'Grand Final IoT Development Competition', '30 Mei 2021'),
(10, 4, 'Pendaftaran Online', '14 Maret 2021 - 17 April 2021'),
(11, 4, 'Babak Penyisihan Online', '8 Mei 2021'),
(12, 4, 'Babak Semifinal', '29 Mei 2021'),
(13, 4, 'Babak Grandfinal', '30 Mei 2021'),
(14, 2, 'Pendaftaran Online', '14 Maret 2021 - 27 April 2021'),
(15, 2, 'Pelaksanaan Lomba', '5 Juni 2021');

-- --------------------------------------------------------

--
-- Table structure for table `lomba_kategori`
--

CREATE TABLE `lomba_kategori` (
  `id` int(11) NOT NULL,
  `lomba_id` int(11) NOT NULL,
  `kategori_header` varchar(128) NOT NULL,
  `kategori_detail` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lomba_kategori`
--

INSERT INTO `lomba_kategori` (`id`, `lomba_id`, `kategori_header`, `kategori_detail`) VALUES
(1, 1, 'Terbuka Untuk Umum', 'Tim terdiri dari 2-3 orang'),
(2, 2, 'Terbuka Untuk Mahasiswa/Siswa', 'Tim terdiri dari 2-3 orang'),
(3, 3, 'Terbuka untuk mahasiswa sarjana atau pelajar, serta SMA/SMK/sederajat', 'Satu tim maksimal beranggotakan 3 orang dari universitas/sekolah yang sama'),
(4, 4, 'Terbuka untuk pelajar SMA/sederajat', 'Tim terdiri dari 3 orang');

-- --------------------------------------------------------

--
-- Table structure for table `lomba_kontak`
--

CREATE TABLE `lomba_kontak` (
  `id` int(11) NOT NULL,
  `lomba_id` int(11) NOT NULL,
  `nama_kontak` varchar(128) NOT NULL,
  `kontak_line` varchar(128) NOT NULL,
  `kontak_wa` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lomba_kontak`
--

INSERT INTO `lomba_kontak` (`id`, `lomba_id`, `nama_kontak`, `kontak_line`, `kontak_wa`) VALUES
(1, 1, 'Rifqi Dwi', 'rifqids1809', '081319071856'),
(2, 2, 'Yusron Izza', 'ardian27801', '082323858260'),
(3, 3, 'Ferdyan', 'ferdyansetyap', '085643394555'),
(4, 4, 'Raihan Rahmanda', 'raihan_rah', '085156570260'),
(5, 4, 'Lingga Ara Hiwang', 'linggaara01', '081225092501');

-- --------------------------------------------------------

--
-- Table structure for table `member_team`
--

CREATE TABLE `member_team` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(256) NOT NULL,
  `ktm` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_team`
--

INSERT INTO `member_team` (`id`, `team_id`, `name`, `image`, `ktm`) VALUES
(29, 21, 'Jabari', '', '21_Jabari.png'),
(30, 21, 'Paker', '', '21_Paker.png'),
(31, 22, 'budi', '', '22_budi.'),
(32, 22, 'anduk basah', '', '22_anduk basah.'),
(33, 22, 'budi', '', '22_budi.jpg'),
(34, 23, '1', '', '23_1.'),
(35, 23, '2', '', '23_2.'),
(36, 24, 'Test 1', '', '24_Test 1.jpg'),
(37, 24, 'Test 2', '', '24_Test 2.jpg'),
(38, 24, 'Test 3', '', '24_Test 3.jpg'),
(39, 24, '', '', '24_.'),
(40, 25, 'iu', '', '25_iu.jpg'),
(41, 25, 'iuu', '', '25_iuu.jpg'),
(42, 25, 'iuuu', '', '25_iuuu.jpg'),
(43, 26, 'Joko', '', '26_Joko.jpg'),
(44, 26, 'Oook', '', '26_Oook.jpg'),
(45, 27, 'sdfsdfsdf', 'aesedfwsefwse', 'apl-Copy of Page-1 (1).png'),
(46, 27, 'sdfqawfefsdf', 'werefsdgsdfd', 'apl-Copy of Page-1.png'),
(47, 23, '3', '', '23_3.'),
(48, 28, '123', '123', 'Picture1.png'),
(49, 28, '123', '123', 'Picture1.png'),
(50, 29, '123', '123', 'Picture1.png'),
(51, 29, '123', '123', 'Picture1.png'),
(52, 29, '3', '', '29_3.png'),
(53, 30, 'member 1', '123', 'Picture1.png'),
(54, 30, 'member  2', '123', 'Picture1.png'),
(55, 30, 'member 3', '123', 'Picture1.png');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menu`, `title`, `url`, `icon`) VALUES
(1, 'dashboard user', 'Dashboard', 'menu/dashboard', 'nav-icon fas fa-tachometer-alt'),
(2, 'dashboard admin', 'Dashboard', 'menu/dashboard', 'nav-icon fas fa-tachometer-alt'),
(3, 'Kelola profile', 'My Profile', 'menu/profile', 'nav-icon fas fa-user-circle'),
(4, 'Management user', 'User Management', 'menu/manageuser', 'nav-icon fas fa-users'),
(5, 'Kelola team', 'Manage Team', 'menu/manageteam', 'nav-icon fas fa-users'),
(6, 'Kelola Pemberitahuan', 'Manage Notification', 'menu/managepemberitahuan', 'nav-icon fas fa-bullhorn');

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(11) NOT NULL,
  `judul` varchar(128) NOT NULL,
  `isi` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `judul`, `isi`) VALUES
(1, 'Tesstt', 'aa'),
(2, 'Tesstt', 'pemberitahuan 1'),
(3, 'Halo', 'hehe'),
(4, 'Tsets ', 'EMailsdasda Radio gaga'),
(5, 'Tsets ', 'xxxx'),
(6, 'Tesstt baceprot', 'woi baceprot'),
(7, 'Segera Kirim Proposal', 'Harap bagi peserta IOT competition untuk mengirim proposal ke technocorner2021@gmail.com'),
(8, 'Segera Kirim Proposal', 'Harap bagi peserta IOT competition untuk mengirim proposal ke technocorner2021@gmail.com'),
(9, 'Segera Kirim Proposal', 'Harap bagi peserta IOT competition untuk mengirim proposal ke technocorner2021@gmail.com'),
(10, 'Segera Kirim Proposal', 'Harap bagi peserta IOT competition untuk mengirim proposal ke technocorner2021@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lomba_id` int(11) NOT NULL,
  `team_name` varchar(128) NOT NULL,
  `institusi` varchar(128) NOT NULL,
  `image_payment` varchar(128) DEFAULT NULL,
  `is_paid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `user_id`, `lomba_id`, `team_name`, `institusi`, `image_payment`, `is_paid`) VALUES
(30, 21, 4, '123', '123', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_robot`
--

CREATE TABLE `team_robot` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `nama_robot` varchar(128) NOT NULL,
  `foto_robot` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `asal_kampus` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `asal_kampus`, `image`, `role_id`, `is_active`, `created_at`, `updated_at`) VALUES
(19, 'Grinaldy Yafi\' Rasyad', 'grinaldy.yafirasyad@gmail.com', '$2y$10$D5SJ.kQwjzHDBq3TCrORMuJhvJZhtAVQB/meckzJykO4/dA2TxZ5a', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(20, 'Betbet', 'btarifatma1410@gmail.com', '$2y$10$bWG7Ajspg/Sp4BOZkCsBvejNxEXn5lXoHncV3FjiEBrfvCw8Lgr1O', 'yujiem', 'tumblr_a246614d3bf9adeb5f59b081874b456f_08ff47cf_250.gif', 2, 1, '0000-00-00', '0000-00-00'),
(21, 'Jovian Reynaldo', 'alphonsusjovian@gmail.com', '$2y$10$xyGEvrMNHCa4Lda2njh9s.Ts7APNS43wp.jascxYT4tZWbF0TxVbC', 'yujiem', 'one7art-20191024-0006.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(22, 'Fiorella Averina Gunawan', 'mfiorellaag@gmail.com', '$2y$10$GNSmQIhHDCm4OnoMw4jLGuYknx2yFTqzrE9l/FlSjzH7xfk564aKG', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(23, 'Lingga Ara Hiwang', 'lingga.arahiwang@gmail.com', '$2y$10$woEqDFsWnFEfrI9O57A7bOrI3TZxkwu7B6qfJHifgB6cPBK42nG5C', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(24, 'Si Abang Jago', 'anandauzumaki2@gmail.com', '$2y$10$zKto9hil5bFdZAyAEIxAJeutELC1L78R99cycK5kxCx/QKfeInPRa', 'Universitas Gagal Moveon', '639573_620.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(25, 'Rg Dimas', 'radend35@gmail.com', '$2y$10$hzLOylGH/l7CPedHcxFf.OsYtX.BWuGs04.gArZJDxBKd49Tfxuoi', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(26, 'Orang Yang Bersedih', 'anandauzumaki3@gmail.com', '$2y$10$EoAYqOXRPZaUpR6CRlAHdOd2tbkhJcZwc9n9AcqQZqLl4qwyfNWp.', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(27, 'Anak Yang Tertinggal', 'ann.jati2@gmail.com', '$2y$10$IkkY/DqokNm3SHaHKvpWEOZnxkZE2VthsTpmb0kCJoJjw3ihWdp.a', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(28, 'Percobaan Ke - 4', 'anandauzumaki6@gmail.com', '$2y$10$ALt/9p1kmL/5mYc8dWoFiOTDK5nKWgRWxTtz7.vVDmEIjqr8Ihzgy', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(29, 'Thoriq FY', 'thoriqfy@gmail.com', '$2y$10$zDJVd1ZOhedGGaV/GYFeouSnUZVE6bJpZ1RA.A3SamraudXMsdoj2', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(30, 'Samatha Marhaendra Putra', 'sam.marhaendrap@gmail.com', '$2y$10$0Vyol0OPWu.urhW/AoB2deXKq0URq8KF9kZecY6mTjHxLCezKTm3i', 'Universitas Gadjah Mada', '1589540927739.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(32, 'Rizkal', 'rizkalaliamdyharits@gmail.com', '$2y$10$kNUWV9.Givqh9pKdSBjGhuSGQiFQBdGtnXRN2mXuY4.7SnPasUC2G', 'UGM', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(33, 'Dicky Muhammad', 'dicky.m.r@mail.ugm.ac.id', '$2y$10$OESxU9gm6wP2jsxO12e.ROBORTp4Wpd1xMwvpUXwXwZug7ZB8y2FW', 'Universitas Gadjah Mada', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(34, 'Rizki Puji', 'rizkipuji2020@mail.ugm.ac.id', '$2y$10$ipZQSWPRQQZAKUt1OGfineT709bV3h4kYVUmMNnJnq4CkBXBIim4G', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(35, 'Technocorner', 'technocorner2020@gmail.com', '$2y$10$spVa04nKFpdmITe5Ej/bretMgDporgC3cZZf/jrvKMvNhgQp62eNG', 'Universitas Gadjah Mada', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(36, 'Fawwaztra Haidar Nuruddin', 'haidarnurudin@gmail.com', '$2y$10$Mfr/xDvCp18Gv7KhiT/F..x3mBDbwYra0oV3mkWm1NppY26zWglZW', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(37, 'Faizah Bestiyana Darmawati', 'faizahbestyana@gmail.com', '$2y$10$XGDediFNLfptT63FqzLfCegLQBT6yhypW0hqCUfWs8bXKLuwsmVtW', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(38, 'agustina', 'putriagustina94@gmail.com', '$2y$10$LRYibZtRPOG6Mzo3HkXXOeMNfo6lFxy7ja9dQx6iq.F1x5N6kn23C', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(39, 'Jabari yok', 'ranjau010401@gmail.com', '$2y$10$Jv7lJJAe014JkLXpGsCL2u2jnzr2G38P7btzLMmczLsGO4u5Hz9Ya', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00'),
(40, 'Joko', 'haritsrizkal@mail.ugm.ac.id', '$2y$10$sqPhEu1pBnnJ7I4sB9NVLO7GtwMwp675XYkHxqniSdeLXYtauw/iS', '', 'default.jpg', 2, 1, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id`, `role_id`, `menu_id`) VALUES
(2, 1, 2),
(3, 2, 1),
(4, 2, 3),
(5, 1, 4),
(6, 1, 5),
(7, 1, 7),
(9, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_pemberitahuan`
--

CREATE TABLE `user_pemberitahuan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pemberitahuan_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `lomba_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_pemberitahuan`
--

INSERT INTO `user_pemberitahuan` (`id`, `user_id`, `pemberitahuan_id`, `type`, `lomba_id`, `created_at`) VALUES
(2, 1, 2, 2, 1, '2021-02-17 05:57:16'),
(3, 1, 3, 3, NULL, '2021-02-24 06:03:06'),
(4, 10, 3, 3, NULL, '2021-02-24 06:03:06'),
(5, 11, 3, 3, NULL, '2021-02-24 06:03:06'),
(6, 12, 3, 3, NULL, '2021-02-24 06:03:06'),
(7, 13, 3, 3, NULL, '2021-02-24 06:03:06'),
(8, 14, 3, 3, NULL, '2021-02-24 06:03:06'),
(9, 17, 5, 3, NULL, '2021-02-27 11:22:56'),
(10, 18, 5, 3, NULL, '2021-02-27 11:22:56'),
(11, 17, 6, 2, 3, '2021-02-27 11:26:49'),
(12, 29, 7, 1, NULL, '2021-03-06 00:36:22'),
(13, 21, 8, 1, NULL, '2021-03-08 14:52:40'),
(14, 21, 9, 1, NULL, '2021-03-08 14:55:33'),
(15, 21, 10, 1, NULL, '2021-03-08 15:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `resetToken` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `resetToken`) VALUES
(1, 'ranjau010401@gmail.com', 'YGyNGEu85Dy4V4eZhOQuGmY50696k0O2vVwtu/tg3YM=', NULL),
(2, 'haritsrizkal@mail.ugm.ac.id', 'sSaXyLYTSRNg/7ljZ3OouyMhnSv65EaMoehUi4VwloU=', NULL),
(3, 'rizkalaliamdyharits@gmail.com', 'LKo3SphiAIkcCJG5Uky3haolTp1QADdhWqutd+8VnK4=', NULL),
(4, 'rizkalaliamdyharits@gmail.com', 'KRPuB79SBxvU0tdARe2QIPBXETZ1coSD0qopJmkaIps=', NULL),
(5, 'rizkalaliamdyharits@gmail.com', 'WLndbsCwMVuhqvIfJQfg+pHyCLqPKh8n2e2L5Ly6MNA=', NULL),
(6, 'rizkalaliamdyharits@gmail.com', 'aLMudVdzCfbkwzFJzNbMpxMwhSrYqEl3jHqgZMIXLyk=', NULL),
(7, 'rizkalaliamdyharits@gmail.com', 'ypORtg/r+U/PzFpGXLbpsPV0PmPzeivKf07GJP6oXjs=', NULL),
(8, 'rizkalaliamdyharits@gmail.com', 'yMkT2r4Y9KmAHSZCCEUSPmt+N6diPPKU1rLGrZhtqrw=', NULL),
(9, 'rizkalaliamdyharits@gmail.com', 'BPm+al9eayXVbQTlfb4tTS0L9O9Fhg3FPXZ2CRuzfdI=', NULL),
(10, 'rizkalaliamdyharits@gmail.com', 'CvHiekbz1nFpVDnrIi1DZsPYLsU1jYSuplBdVgxcMH4=', NULL),
(11, 'haritsrizkal@mail.ugm.ac.id', '4xbmnj4hwb2DcgRfpRxHX78rLwjDh+BToOrrkc5BeqA=', NULL),
(12, 'grinaldy.yafi@mail.ugm.ac.id', 'xJjGvI7txOiM3Q6W4IDXwqN+8AxqGaUxJYPE6+LKiU0=', NULL),
(13, 'btarifatma1410@gmail.com', 'PtNwfn04OlowaWe+hxm7LrGyqwtSnDJSE06ZK84jZDk=', ''),
(14, 'alphonsusjovian@gmail.com', 'tuRijQ7GhsyoxfHzGdiobfsReH7hSCGTnSoks1O00vU=', NULL),
(15, 'haritsrizkal@mail.ugm.ac.id', 'wS98DXvvS1DSTimvb00qa+I1n1tzn8j+G2++iLWltD8=', NULL),
(16, 'ranjau010401@gmail.com', 'C7oZvJ/btnENqFzCjj07KXnYvnlAcv/jfrIDNPaPTs8=', NULL),
(17, 'ranjau010401@gmail.com', 'JYMeiMJiCQdZwkHHggxqMcho+2sN/5XDpd40+mXanms=', NULL),
(18, 'rizkalaliamdyharits@gmail.com', '5jnr1oUHstH6k+ybE9yH17j3dYqiEPg9+NmEllWnNDg=', NULL),
(19, 'grinaldy.yafirasyad@gmail.com', 'EfMyK3bBWwc0vDmp2Hg/3SugckcuIPMA1BMLf3+pvKY=', NULL),
(20, 'btarifatma1410@gmail.com', 'AtSSfmc85up5ZrE/667w66myPwDcTTys16tpxVlKwtk=', ''),
(21, 'alphonsusjovian@gmail.com', 'roNMwEtZ4uEtqRNpm+xY9Ppm2aS5k2qB4FO85a18Vwc=', NULL),
(22, 'mfiorellaag@gmail.com', 'gKwd98IaV7EY4Le2LjfTU4k8oUWwVmLi4jm5AU/s/DY=', ''),
(23, 'lingga.arahiwang@gmail.com', 'G97VY4hi0dM+39LCxAKu8a8pjCTWSLoOftAcx62Pvxw=', NULL),
(24, 'anandauzumaki2@gmail.com', 'w8cpIT4T9W1eVdWJOz0MCWipN236ltN7Kiw5HDeubOY=', NULL),
(25, 'radend35@gmail.com', 'VDs+/cpAN+I3bygBihYIEcRK3cIGm26YDUBrnTDdtdw=', NULL),
(26, 'anandauzumaki3@gmail.com', '6sd4CyPml/eA+m+BnlBcnbugBAOgq4dogakob3GWZW4=', NULL),
(27, 'ann.jati2@gmail.com', 'XtWh4quEN09BJHQB2FTN3mSmDMfPGQ/9uRznJJSeAmg=', NULL),
(28, 'anandauzumaki6@gmail.com', 'mpJgmCvS6UaiVxCIdHQnymZEaSuKn6d44UPut353xhY=', NULL),
(29, 'thoriqfy@gmail.com', 'WQmGRrZRrdrtIXsUCwzuug9jQV3szvD3m1FuigYUAS0=', NULL),
(30, 'sam.marhaendrap@gmail.com', 'oV5E0essbzoWU5QQ6CXIXzKXGziu1wtdWtrQQMJEHn0=', ''),
(31, 'haritsrizkal@mail.ugm.ac.id', 'yNmBVDMgNcwG36K+kpAB6ibcwzfvyYAqKJiOBCS6qW4=', NULL),
(32, 'rizkalaliamdyharits@gmail.com', 'ZJ7JliI4085PGilI0TuUXRjy8pvynHSRcL2WfUQWjzo=', NULL),
(33, 'dicky.m.r@mail.ugm.ac.id', 'jET+sSHH/0uZP2nrPEgxu4xWG4JqnJ9AO4o6FIXfkpk=', NULL),
(34, 'rizkipuji2020@mail.ugm.ac.id', 'S876/5E4hHpWT9fRzDxoijjB07IussH15eUaK+ycTlo=', NULL),
(35, 'technocorner2020@gmail.com', '+qzUGgOPCCa60x7429Egif1QtzMz0O8O1kRcriW+xVQ=', NULL),
(36, 'haidarnurudin@gmail.com', 'E4o/al+gcBEyNrf15/eSRtLPogalkqMa3aGXbIUVOMU=', NULL),
(37, 'faizahbestyana@gmail.com', 'vmmPTJ9I15oKPfp3Hj2/xITU6Wg84TK8WI2u0udZ6PE=', NULL),
(38, 'putriagustina94@gmail.com', 'mCSDx24iLeV9P++5lrm2KiPdHNfe/AGgUQWVD1ntLCA=', NULL),
(39, 'ranjau010401@gmail.com', 'ENzGaDvLwVWh2V6PoN0b1I0l7Jn5iem6Mam6olzQXfg=', NULL),
(40, 'haritsrizkal@mail.ugm.ac.id', 'tcoztm6b83IqERXLMcPn9RnPnD8Sfd21otbVXOibK8g=', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eec_answer`
--
ALTER TABLE `eec_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eec_final`
--
ALTER TABLE `eec_final`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lomba`
--
ALTER TABLE `lomba`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_team`
--
ALTER TABLE `member_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_robot`
--
ALTER TABLE `team_robot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_pemberitahuan`
--
ALTER TABLE `user_pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eec_answer`
--
ALTER TABLE `eec_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `eec_final`
--
ALTER TABLE `eec_final`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lomba`
--
ALTER TABLE `lomba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `member_team`
--
ALTER TABLE `member_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `team_robot`
--
ALTER TABLE `team_robot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_pemberitahuan`
--
ALTER TABLE `user_pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
