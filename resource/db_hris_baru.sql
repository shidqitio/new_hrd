-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_kepegawaian
CREATE DATABASE IF NOT EXISTS `db_kepegawaian` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_kepegawaian`;

-- Dumping structure for table db_kepegawaian.ref_agama
CREATE TABLE IF NOT EXISTS `ref_agama` (
  `kode_agama` char(2) NOT NULL,
  `nama_agama` varchar(25) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_anjab_ihtisar
CREATE TABLE IF NOT EXISTS `ref_anjab_ihtisar` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan_unit_kerja` varchar(25) NOT NULL,
  `ihtisar` text NOT NULL,
  `status` varchar(1) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `kode_unit_kerja_kode_jabatan_unit_kerja` (`kode_unit_kerja`,`kode_jabatan_unit_kerja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_bank
CREATE TABLE IF NOT EXISTS `ref_bank` (
  `kode_bank` char(3) NOT NULL,
  `nama_bank` varchar(50) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_eselon
CREATE TABLE IF NOT EXISTS `ref_eselon` (
  `kode_eselon` char(1) NOT NULL,
  `nama_eselon` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_eselon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_fakultas
CREATE TABLE IF NOT EXISTS `ref_fakultas` (
  `kode_fakultas` char(1) NOT NULL,
  `nama_fakultas` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_golongan_ruang
CREATE TABLE IF NOT EXISTS `ref_golongan_ruang` (
  `kode_golongan_ruang` varchar(10) NOT NULL,
  `keterangan_pangkat` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NOT NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_golongan_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_hukuman
CREATE TABLE IF NOT EXISTS `ref_hukuman` (
  `kode_hukuman` char(2) NOT NULL,
  `nama_hukuman` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_hukuman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_ihtisar_jabatan
CREATE TABLE IF NOT EXISTS `ref_ihtisar_jabatan` (
  `kode_jabatan_unit_kerja` varchar(25) NOT NULL,
  `kode_unit_kerja` varchar(25) NOT NULL,
  `ihtisar` text NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` datetime DEFAULT NULL,
  `udch` datetime DEFAULT NULL,
  PRIMARY KEY (`kode_jabatan_unit_kerja`,`kode_unit_kerja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jabatan_pegawai
CREATE TABLE IF NOT EXISTS `ref_jabatan_pegawai` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan_unit_kerja` varchar(25) NOT NULL,
  `status_aktif` char(1) NOT NULL DEFAULT '1',
  `nama_jabatan_unit_kerja` varchar(255) DEFAULT NULL,
  `beban_kerja` decimal(18,2) DEFAULT NULL,
  `kebutuhan_pegawai` decimal(18,2) NOT NULL,
  `isi_data` decimal(18,2) NOT NULL,
  `jumlah_pegawai` decimal(18,0) NOT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_unit_kerja`,`status_aktif`,`kode_jabatan_unit_kerja`) USING BTREE,
  CONSTRAINT `FK_ref_jabatan_pegawai_trx_unit_kerja` FOREIGN KEY (`kode_unit_kerja`) REFERENCES `trx_unit_kerja` (`kode_unit_kerja`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jabatan_pengadaan
CREATE TABLE IF NOT EXISTS `ref_jabatan_pengadaan` (
  `kode_jabatan_pengadaan` char(2) NOT NULL,
  `nama_jabatan_pengadaan` varchar(100) DEFAULT NULL,
  `status` tinyint(1) unsigned zerofill DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jabatan_pengadaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jabatan_pengadaan_detail
CREATE TABLE IF NOT EXISTS `ref_jabatan_pengadaan_detail` (
  `kode_jabatan_pengadaan` char(2) DEFAULT NULL,
  `kode_jabatan_pengadaan_detail` char(6) NOT NULL,
  `nama_jabatan_pengadaan_detail` varchar(255) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jabatan_pengadaan_detail`),
  KEY `FK_ref_jabatan_pengadaan_detail_ref_jabatan_pengadaan` (`kode_jabatan_pengadaan`),
  CONSTRAINT `FK_ref_jabatan_pengadaan_detail_ref_jabatan_pengadaan` FOREIGN KEY (`kode_jabatan_pengadaan`) REFERENCES `ref_jabatan_pengadaan` (`kode_jabatan_pengadaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jabatan_struktural
CREATE TABLE IF NOT EXISTS `ref_jabatan_struktural` (
  `kode_jabatan_struktural` char(3) NOT NULL,
  `nama_jabatan` varchar(50) DEFAULT NULL,
  `kode_eselon` char(1) DEFAULT NULL,
  `status_jabatan_struktural` enum('0','1') DEFAULT NULL COMMENT '0 : Jabatan Tidak Aktif, 3 : Jabatan Aktif',
  `kelas` char(2) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jabatan_struktural`),
  KEY `ref_jabatan_struktural_FK` (`kode_eselon`),
  CONSTRAINT `ref_jabatan_struktural_FK` FOREIGN KEY (`kode_eselon`) REFERENCES `ref_eselon` (`kode_eselon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jafung
CREATE TABLE IF NOT EXISTS `ref_jafung` (
  `kode_jenis_fungsional` varchar(2) NOT NULL,
  `kode_jafung` char(5) NOT NULL,
  `nama_jafung` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jafung`),
  KEY `ref_jafung_FK` (`kode_jenis_fungsional`),
  CONSTRAINT `ref_jafung_FK` FOREIGN KEY (`kode_jenis_fungsional`) REFERENCES `ref_jenis_fungsional` (`kode_jenis_fungsional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jafung_pangkat
CREATE TABLE IF NOT EXISTS `ref_jafung_pangkat` (
  `kode_jafung` char(5) NOT NULL,
  `kode_jafung_pangkat` char(8) NOT NULL,
  `nama_jafung_pangkat` varchar(100) DEFAULT NULL,
  `kode_golongan_ruang` varchar(10) DEFAULT NULL,
  `angka_kredit` int(3) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jafung_pangkat`),
  KEY `ref_jafung_pangkat_kode_jafung_IDX` (`kode_jafung`,`kode_jafung_pangkat`) USING BTREE,
  KEY `ref_jafung_pangkat_FK_1` (`kode_golongan_ruang`),
  CONSTRAINT `FK_ref_jafung_pangkat_ref_jafung` FOREIGN KEY (`kode_jafung`) REFERENCES `ref_jafung` (`kode_jafung`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ref_jafung_pangkat_FK_1` FOREIGN KEY (`kode_golongan_ruang`) REFERENCES `ref_golongan_ruang` (`kode_golongan_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jenis_absensi
CREATE TABLE IF NOT EXISTS `ref_jenis_absensi` (
  `kode_jenis_absensi` char(2) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jenis_absensi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jenis_dokumen
CREATE TABLE IF NOT EXISTS `ref_jenis_dokumen` (
  `kode_jenis_dokumen` varchar(5) NOT NULL,
  `nama_jenis_dokumen` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jenis_dokumen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Jenis Dokmen Tambahan';

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jenis_fungsional
CREATE TABLE IF NOT EXISTS `ref_jenis_fungsional` (
  `kode_jenis_fungsional` char(2) NOT NULL,
  `nama_jenis_fungsional` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jenis_fungsional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jenis_karya_tulisan
CREATE TABLE IF NOT EXISTS `ref_jenis_karya_tulisan` (
  `kode_jenis_karya_tulis` char(2) NOT NULL,
  `nama_jenis_karya_tulis` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jenis_karya_tulis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_jurusan
CREATE TABLE IF NOT EXISTS `ref_jurusan` (
  `kode_program_studi` varchar(3) DEFAULT NULL,
  `kode_jurusan` varchar(6) NOT NULL,
  `nama_jurusan` varchar(255) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_jurusan`),
  KEY `FK_ref_jurusan_ref_program_studi` (`kode_program_studi`),
  CONSTRAINT `FK_ref_jurusan_ref_program_studi` FOREIGN KEY (`kode_program_studi`) REFERENCES `ref_program_studi` (`kode_program_studi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_kartu
CREATE TABLE IF NOT EXISTS `ref_kartu` (
  `kode_kartu` char(2) DEFAULT NULL,
  `nama_kartu` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_kegiatan_jafung
CREATE TABLE IF NOT EXISTS `ref_kegiatan_jafung` (
  `kode_unsur_utama` char(4) NOT NULL,
  `kode_kegiatan` char(7) NOT NULL,
  `nama_kegiatan` varchar(300) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_kegiatan`),
  KEY `ref_kegiatan_jafung_kode_unsur_utama_IDX` (`kode_unsur_utama`,`kode_kegiatan`) USING BTREE,
  CONSTRAINT `ref_kegiatan_jafung_FK` FOREIGN KEY (`kode_unsur_utama`) REFERENCES `ref_unsur_utama` (`kode_unsur_utama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_kegiatan_sub1_jafung
CREATE TABLE IF NOT EXISTS `ref_kegiatan_sub1_jafung` (
  `kode_kegiatan` char(7) NOT NULL,
  `kode_kegiatan_sub1` char(10) NOT NULL,
  `nama_kegiatan_sub1` varchar(150) DEFAULT NULL COMMENT 'Jika ditulis Idem, maka nama kegiatan mengikuti ref. diatasnya',
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_kegiatan_sub1`),
  KEY `ref_kegiatan_sub1_jafung_kode_kegiatan_IDX` (`kode_kegiatan`,`kode_kegiatan_sub1`) USING BTREE,
  CONSTRAINT `ref_kegiatan_sub1_jafung_FK` FOREIGN KEY (`kode_kegiatan`) REFERENCES `ref_kegiatan_jafung` (`kode_kegiatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_kegiatan_sub2_jafung
CREATE TABLE IF NOT EXISTS `ref_kegiatan_sub2_jafung` (
  `kode_jafung` char(5) DEFAULT NULL,
  `kode_kegiatan_sub1` char(10) NOT NULL,
  `kode_kegiatan_sub2` char(13) NOT NULL,
  `nama_kegiatan_sub2` varchar(150) DEFAULT NULL COMMENT 'Jika Idem, mengikut nama kegiatan ref diatasnya',
  `bukti_kegiatan` varchar(100) DEFAULT NULL,
  `batas_maks` varchar(60) DEFAULT NULL,
  `angka_kredit` decimal(5,2) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_kegiatan_sub2`),
  KEY `ref_kegiatan_sub2_jafung_kode_kegiatan_sub1_IDX` (`kode_kegiatan_sub1`,`kode_kegiatan_sub2`) USING BTREE,
  KEY `ref_kegiatan_sub2_jafung_kode_jafung_IDX` (`kode_jafung`) USING BTREE,
  CONSTRAINT `FK_ref_kegiatan_sub2_jafung_ref_jafung` FOREIGN KEY (`kode_jafung`) REFERENCES `ref_jafung` (`kode_jafung`),
  CONSTRAINT `ref_kegiatan_sub2_jafung_FK` FOREIGN KEY (`kode_kegiatan_sub1`) REFERENCES `ref_kegiatan_sub1_jafung` (`kode_kegiatan_sub1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_kelas
CREATE TABLE IF NOT EXISTS `ref_kelas` (
  `kelas` char(2) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kelas`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_keluarga
CREATE TABLE IF NOT EXISTS `ref_keluarga` (
  `kode_keluarga` varchar(2) NOT NULL,
  `nama_keluarga` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_keluarga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_pegawai
CREATE TABLE IF NOT EXISTS `ref_pegawai` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `nidn` varchar(10) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan','Lain-lain') DEFAULT NULL,
  `kode_agama` varchar(2) DEFAULT NULL,
  `tmt_cpns` date DEFAULT NULL,
  `tmt_pns` date DEFAULT NULL,
  `ktp` varchar(20) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `nomor_telp` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status_nikah` enum('Nikah','Belum Nikah') DEFAULT NULL,
  `status_pegawai` enum('Aktif','Pensiun','Diberhentikan','Meninggal') DEFAULT 'Aktif',
  `foto_pegawai` varchar(100) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_pegawai`) USING BTREE,
  KEY `ref_pegawai_FK_1` (`kode_agama`),
  CONSTRAINT `ref_pegawai_FK_1` FOREIGN KEY (`kode_agama`) REFERENCES `ref_agama` (`kode_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_pegawai_nip
CREATE TABLE IF NOT EXISTS `ref_pegawai_nip` (
  `kode_pegawai` char(9) NOT NULL,
  `nip_pegawai` char(20) NOT NULL,
  `status_aktif` tinyint(4) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_pegawai`,`nip_pegawai`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_pegawai_non_ut
CREATE TABLE IF NOT EXISTS `ref_pegawai_non_ut` (
  `nip` char(20) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `nidn` varchar(10) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan','Lain-lain') DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `nomor_telp` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nomor_rekening` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_program_studi
CREATE TABLE IF NOT EXISTS `ref_program_studi` (
  `kode_fakultas` char(1) NOT NULL,
  `kode_program_studi` varchar(3) NOT NULL,
  `nama_program_studi` varchar(255) DEFAULT NULL,
  `kode_prgram_studi_dikti` char(5) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_program_studi`),
  KEY `ref_program_studi_FK` (`kode_fakultas`),
  CONSTRAINT `ref_program_studi_FK` FOREIGN KEY (`kode_fakultas`) REFERENCES `ref_fakultas` (`kode_fakultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_sub_kelas
CREATE TABLE IF NOT EXISTS `ref_sub_kelas` (
  `kode_kelas` char(2) DEFAULT NULL,
  `kode_sub_kelas` char(4) NOT NULL,
  `gaji` decimal(20,6) DEFAULT NULL,
  `tunjangan` decimal(20,6) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_sub_kelas`),
  KEY `FK_ref_sub_kelas_ref_kelas` (`kode_kelas`),
  CONSTRAINT `FK_ref_sub_kelas_ref_kelas` FOREIGN KEY (`kode_kelas`) REFERENCES `ref_kelas` (`kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_tingkat_pendidikan
CREATE TABLE IF NOT EXISTS `ref_tingkat_pendidikan` (
  `kode_tingkat_pendidikan` char(2) NOT NULL,
  `nama_tingkat_pendidikan` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NOT NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_tingkat_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_unit
CREATE TABLE IF NOT EXISTS `ref_unit` (
  `kode_unit` char(16) NOT NULL,
  `revisi_ke` int(11) NOT NULL DEFAULT 0,
  `nama_unit` varchar(255) DEFAULT NULL,
  `induk_unit` char(6) DEFAULT NULL,
  `status_aktif_unit` enum('0','1') DEFAULT '1' COMMENT '0 : Tidak Aktif; 1 : Aktif',
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_unit`,`revisi_ke`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_unit_induk
CREATE TABLE IF NOT EXISTS `ref_unit_induk` (
  `id_unit_induk` char(4) NOT NULL,
  `nama_unit_induk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_unit_induk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.ref_unsur_utama
CREATE TABLE IF NOT EXISTS `ref_unsur_utama` (
  `kode_jenis_fungsional` char(2) NOT NULL,
  `kode_unsur_utama` char(4) NOT NULL,
  `nama_unsur_utama` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_unsur_utama`),
  KEY `ref_unsur_utama_kode_jenis_fungsional_IDX` (`kode_jenis_fungsional`,`kode_unsur_utama`) USING BTREE,
  CONSTRAINT `ref_unsur_utama_FK` FOREIGN KEY (`kode_jenis_fungsional`) REFERENCES `ref_jenis_fungsional` (`kode_jenis_fungsional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_absensi
CREATE TABLE IF NOT EXISTS `trx_absensi` (
  `kode_jenis_absensi` char(2) DEFAULT NULL,
  `kode_absen` int(11) NOT NULL AUTO_INCREMENT,
  `kode_user` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nip` char(20) DEFAULT NULL,
  `jam` varchar(50) NOT NULL,
  `action` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `location` text NOT NULL,
  `alasan` text DEFAULT NULL,
  `bukti` text DEFAULT NULL,
  `sanksi` time DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_absen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_form_a
CREATE TABLE IF NOT EXISTS `trx_anjab_form_a` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan_unit_kerja` varchar(25) NOT NULL,
  `no_urut_01` varchar(5) NOT NULL,
  `tugas_pokok` text NOT NULL,
  `no_urut_02` varchar(5) NOT NULL,
  `no_urut_02_sub` varchar(5) NOT NULL,
  `sub_tugas_pokok` text NOT NULL,
  `status_urjab_form_a` varchar(25) NOT NULL,
  `a3` varchar(50) NOT NULL,
  `a4` decimal(18,2) NOT NULL,
  `b4` decimal(18,2) NOT NULL,
  `a5` decimal(18,2) NOT NULL,
  `a6` decimal(18,2) NOT NULL,
  `a7` decimal(18,2) NOT NULL,
  `a8` decimal(18,2) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `kode_unit_kerja` (`kode_unit_kerja`,`kode_jabatan_unit_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_form_b
CREATE TABLE IF NOT EXISTS `trx_anjab_form_b` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan_unit_kerja` varchar(25) NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pendidikan` varchar(255) NOT NULL,
  `gol` varchar(10) NOT NULL,
  `jumlah` decimal(18,0) NOT NULL,
  `ket` varchar(255) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `kode_unit_kerja` (`kode_unit_kerja`),
  KEY `kode_jabatan` (`kode_jabatan_unit_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_form_d
CREATE TABLE IF NOT EXISTS `trx_anjab_form_d` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan_unit_kerja` varchar(25) NOT NULL,
  `beban_kerja` decimal(18,2) NOT NULL,
  `butuh_pegawai` decimal(18,2) NOT NULL,
  `butuh_pegawai_real` decimal(18,2) NOT NULL,
  `isi_data` decimal(18,2) NOT NULL,
  `jumlah_pegawai` decimal(18,0) NOT NULL,
  `plus_minus` decimal(18,2) NOT NULL,
  `EJ` decimal(18,2) NOT NULL,
  `EP` varchar(2) NOT NULL,
  `predikat` varchar(15) NOT NULL,
  `status` varchar(1) NOT NULL,
  `kode_kategori` varchar(2) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `kode_unit_kerja_kode_jabatan` (`kode_unit_kerja`,`kode_jabatan_unit_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_form_e
CREATE TABLE IF NOT EXISTS `trx_anjab_form_e` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `beban_kerja` decimal(18,2) NOT NULL,
  `butuh_pegawai` decimal(18,2) NOT NULL,
  `butuh_pegawai_real` decimal(18,2) NOT NULL,
  `isi_data` decimal(18,2) NOT NULL,
  `jumlah_pegawai` decimal(18,0) NOT NULL,
  `plus_minus` decimal(18,2) NOT NULL,
  `EJ` decimal(18,2) NOT NULL,
  `EP` varchar(2) NOT NULL,
  `predikat` varchar(15) NOT NULL,
  `status` varchar(1) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `kode_unit_kerja` (`kode_unit_kerja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_hasil_kerja
CREATE TABLE IF NOT EXISTS `trx_anjab_hasil_kerja` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `hasil_kerja` text NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_keadaan_tempat_kerja
CREATE TABLE IF NOT EXISTS `trx_anjab_keadaan_tempat_kerja` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `keadaan_tempat_kerja` text NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `status` varchar(15) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_sub_tugas_pokok
CREATE TABLE IF NOT EXISTS `trx_anjab_sub_tugas_pokok` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `sub_tugas_pokok` text NOT NULL,
  `no_urut_01` decimal(18,0) NOT NULL,
  `no_urut_02` decimal(18,0) NOT NULL,
  `status` varchar(1) NOT NULL,
  `no_urut_02_sub` varchar(5) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_tanggung_jawab
CREATE TABLE IF NOT EXISTS `trx_anjab_tanggung_jawab` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `tanggung_jawab` text NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `kode_unit_kerja_kode_jabatan` (`kode_unit_kerja`,`kode_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_tugas_pokok
CREATE TABLE IF NOT EXISTS `trx_anjab_tugas_pokok` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `tugas_pokok` text NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_tugas_tambahan
CREATE TABLE IF NOT EXISTS `trx_anjab_tugas_tambahan` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `tugas_tambahan` text NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_anjab_wewenang
CREATE TABLE IF NOT EXISTS `trx_anjab_wewenang` (
  `kode_unit_kerja` varchar(25) NOT NULL,
  `kode_jabatan` varchar(25) NOT NULL,
  `wewenang` text NOT NULL,
  `no_urut` decimal(18,0) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ucr` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `uch` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_bank
CREATE TABLE IF NOT EXISTS `trx_bank` (
  `kode_bank` char(4) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `no_rekening` varchar(50) NOT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_bank`,`nip`,`no_rekening`) USING BTREE,
  CONSTRAINT `FK_trx_bank_ref_bank` FOREIGN KEY (`kode_bank`) REFERENCES `ref_bank` (`kode_bank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_dokumen
CREATE TABLE IF NOT EXISTS `trx_dokumen` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_jenis_dokumen` char(5) NOT NULL,
  `nomor_dokumen` varchar(100) DEFAULT NULL,
  `keterangan_dokumen` varchar(100) DEFAULT NULL,
  `folder_dokumen` varchar(100) DEFAULT NULL,
  `nama_file_dokumen` varchar(100) DEFAULT NULL,
  `tahun` char(4) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_jenis_dokumen`),
  KEY `t_jenis_dok_FK` (`kode_jenis_dokumen`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `t_dokumen_FK` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`),
  CONSTRAINT `t_dokumen_FK_1` FOREIGN KEY (`kode_jenis_dokumen`) REFERENCES `ref_jenis_dokumen` (`kode_jenis_dokumen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_dok_pendidikan
CREATE TABLE IF NOT EXISTS `trx_dok_pendidikan` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_tingkat_pendidikan` char(2) NOT NULL,
  `kode_dok_pendidikan` enum('Ijazah','Surat Ket. Pendamping Ijazah','Transkrip','Sertifikat','Lain-lain') NOT NULL,
  `kode_jenis_dokumen` char(5) NOT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_tingkat_pendidikan`,`kode_dok_pendidikan`,`kode_jenis_dokumen`),
  KEY `t_dok_pendidikan_FK_1` (`kode_tingkat_pendidikan`),
  KEY `t_dok_pendidikan_FK_2` (`nip`,`kode_jenis_dokumen`),
  KEY `Index 4` (`kode_pegawai`),
  CONSTRAINT `t_dok_pendidikan_FK` FOREIGN KEY (`nip`, `kode_tingkat_pendidikan`) REFERENCES `trx_pendidikan` (`nip`, `kode_tingkat_pendidikan`),
  CONSTRAINT `t_dok_pendidikan_FK_1` FOREIGN KEY (`kode_tingkat_pendidikan`) REFERENCES `ref_tingkat_pendidikan` (`kode_tingkat_pendidikan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_hukuman
CREATE TABLE IF NOT EXISTS `trx_hukuman` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_hukuman` char(2) NOT NULL,
  `tanggal_surat_hukuman` date DEFAULT NULL,
  `nomor_surat_hukuman` varchar(100) DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `folder_surat_hukuman` varchar(100) DEFAULT NULL,
  `nama_file_surat_hukuman` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_hukuman`),
  KEY `t_hukuman_FK_1` (`kode_hukuman`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `t_hukuman_FK` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`),
  CONSTRAINT `t_hukuman_FK_1` FOREIGN KEY (`kode_hukuman`) REFERENCES `ref_hukuman` (`kode_hukuman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_jabatan_fungsional
CREATE TABLE IF NOT EXISTS `trx_jabatan_fungsional` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_jenis_fungsional` char(2) NOT NULL,
  `kode_jafung` char(5) NOT NULL,
  `kode_jafung_pangkat` char(8) NOT NULL,
  `kode_sub_kelas` char(4) DEFAULT NULL,
  `tmt_awal` date DEFAULT NULL,
  `tmt_akhir` date DEFAULT NULL,
  `nomor_sk_jafung` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_jafung_pangkat`) USING BTREE,
  KEY `FK_trx_jabatan_fungsional_ref_jenis_fungsional` (`kode_jenis_fungsional`),
  KEY `FK_trx_jabatan_fungsional_ref_jafung` (`kode_jafung`),
  KEY `FK_trx_jabatan_fungsional_ref_jafung_pangkat` (`kode_jafung_pangkat`),
  KEY `Index 5` (`kode_pegawai`),
  CONSTRAINT `FK_trx_jabatan_fungsional_ref_jafung` FOREIGN KEY (`kode_jafung`) REFERENCES `ref_jafung` (`kode_jafung`),
  CONSTRAINT `FK_trx_jabatan_fungsional_ref_jafung_pangkat` FOREIGN KEY (`kode_jafung_pangkat`) REFERENCES `ref_jafung_pangkat` (`kode_jafung_pangkat`),
  CONSTRAINT `FK_trx_jabatan_fungsional_ref_jenis_fungsional` FOREIGN KEY (`kode_jenis_fungsional`) REFERENCES `ref_jenis_fungsional` (`kode_jenis_fungsional`),
  CONSTRAINT `t_jabatan_fungsional_FK` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_jabatan_pengadaan
CREATE TABLE IF NOT EXISTS `trx_jabatan_pengadaan` (
  `kode_jabatan_pengadaan_detail` char(6) DEFAULT NULL,
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `periode` int(2) NOT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`periode`) USING BTREE,
  KEY `FK_t_jabatan_pengadaan_ref_jabatan_pengadaan_detail` (`kode_jabatan_pengadaan_detail`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `FK_t_jabatan_pengadaan_ref_jabatan_pengadaan_detail` FOREIGN KEY (`kode_jabatan_pengadaan_detail`) REFERENCES `ref_jabatan_pengadaan_detail` (`kode_jabatan_pengadaan_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_jabatan_struktural
CREATE TABLE IF NOT EXISTS `trx_jabatan_struktural` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_jabatan_struktural` char(3) NOT NULL,
  `periode` enum('1','2') NOT NULL DEFAULT '1',
  `kelas` char(2) DEFAULT NULL,
  `tmt_awal` date DEFAULT NULL,
  `tmt_akhir` date DEFAULT NULL,
  `nomor_sk_jabatan_struktural` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_jabatan_struktural`,`periode`),
  KEY `t_jabatan_struktural_FK_1` (`kode_jabatan_struktural`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `t_jabatan_struktural_FK` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`),
  CONSTRAINT `t_jabatan_struktural_FK_1` FOREIGN KEY (`kode_jabatan_struktural`) REFERENCES `ref_jabatan_struktural` (`kode_jabatan_struktural`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_kartu
CREATE TABLE IF NOT EXISTS `trx_kartu` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_kartu` char(2) NOT NULL,
  `nomor_kartu` varchar(20) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_kartu`,`nip`) USING BTREE,
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_karya_tulis_pegawai
CREATE TABLE IF NOT EXISTS `trx_karya_tulis_pegawai` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_jenis_karya_tulis` char(2) NOT NULL,
  `kode_karya_tulis` int(11) NOT NULL,
  `judul_karya_tulis` varchar(255) DEFAULT NULL,
  `penerbit_karya_tulis` varchar(100) DEFAULT NULL,
  `nomor_isbn_doi` varchar(100) DEFAULT NULL,
  `penulis_ke` int(2) DEFAULT NULL,
  `tahun_karya_tulis` char(4) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_jenis_karya_tulis`,`kode_karya_tulis`),
  KEY `t_karya_tulis_pegawai_FK_1` (`kode_jenis_karya_tulis`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `t_karya_tulis_pegawai_FK` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`),
  CONSTRAINT `t_karya_tulis_pegawai_FK_1` FOREIGN KEY (`kode_jenis_karya_tulis`) REFERENCES `ref_jenis_karya_tulisan` (`kode_jenis_karya_tulis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_keluarga
CREATE TABLE IF NOT EXISTS `trx_keluarga` (
  `nip` varchar(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_keluarga` char(2) NOT NULL,
  `nama_keluarga` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `status_nikah` enum('Nikah','Belum Nikah') DEFAULT NULL,
  `folder_akte_kelahiran` varchar(100) DEFAULT NULL,
  `nama_file_akte_kelahiran` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_keluarga`),
  KEY `t_keluarga_FK_1` (`kode_keluarga`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `t_keluarga_FK` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`),
  CONSTRAINT `t_keluarga_FK_1` FOREIGN KEY (`kode_keluarga`) REFERENCES `ref_keluarga` (`kode_keluarga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_koleksi_angka_kredit_detail
CREATE TABLE IF NOT EXISTS `trx_koleksi_angka_kredit_detail` (
  `nip` char(20) DEFAULT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `koleksi_ke` int(3) DEFAULT NULL,
  `kode_kegiatan_sub2` char(13) DEFAULT NULL,
  `bukti_ke` int(4) DEFAULT NULL,
  `tanggal_bukti` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `nama_folder_bukti` varchar(300) DEFAULT NULL,
  `nama_file_bukti` varchar(100) DEFAULT NULL,
  `status_serta` varchar(1) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `t_koleksi_angka_kredit_detail_FK` (`nip`,`koleksi_ke`),
  KEY `t_koleksi_angka_kredit_detail_FK_1` (`kode_kegiatan_sub2`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `t_koleksi_angka_kredit_detail_FK` FOREIGN KEY (`nip`, `koleksi_ke`) REFERENCES `trx_koleksi_angka_kredit_header` (`nip`, `koleksi_ke`),
  CONSTRAINT `t_koleksi_angka_kredit_detail_FK_1` FOREIGN KEY (`kode_kegiatan_sub2`) REFERENCES `ref_kegiatan_sub2_jafung` (`kode_kegiatan_sub2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_koleksi_angka_kredit_header
CREATE TABLE IF NOT EXISTS `trx_koleksi_angka_kredit_header` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `koleksi_ke` int(3) NOT NULL,
  `status_penilaian` char(1) DEFAULT NULL COMMENT '0: Belum dinilai, 1: Sementara dinilai, 2: Sudah dinilai, 3: Pengajuan ke Kepegawaian, 4: Proses Ke DIKTI, 5: Selesai',
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`koleksi_ke`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_organisasi
CREATE TABLE IF NOT EXISTS `trx_organisasi` (
  `nip` varchar(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_organisasi` int(9) NOT NULL,
  `periode` char(9) DEFAULT NULL,
  `nama_organisasi` varchar(200) DEFAULT NULL,
  `kedudukan_diorganisasi` varchar(200) DEFAULT NULL,
  `domisili_organisasi` varchar(100) DEFAULT NULL,
  `pimpinan_organisasi` varchar(100) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `uch` varchar(100) DEFAULT NULL,
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_organisasi`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_pelatihan_diklat
CREATE TABLE IF NOT EXISTS `trx_pelatihan_diklat` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_jenis_dokumen` char(5) NOT NULL,
  `kode_pelatihan_diklat` char(3) NOT NULL,
  `nama_pelatihan_diklat` varchar(100) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `penyelenggara` varchar(100) DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `nomor_sertifikat` varchar(100) DEFAULT NULL,
  `tanggal_sertifikat` date DEFAULT NULL,
  `jumlah_jam` int(11) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_jenis_dokumen`,`kode_pelatihan_diklat`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_pendidikan
CREATE TABLE IF NOT EXISTS `trx_pendidikan` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_tingkat_pendidikan` char(2) NOT NULL,
  `nama_sekolah` varchar(200) DEFAULT NULL,
  `jurusan` varchar(200) DEFAULT NULL,
  `tahun_lulus` varchar(4) DEFAULT NULL,
  `lokasi_sekolah` varchar(100) DEFAULT NULL,
  `nama_pimpinan_sekolah` varchar(255) DEFAULT NULL,
  `nomor_ijazah` varchar(100) DEFAULT NULL,
  `judul_skripsi` text DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_tingkat_pendidikan`),
  KEY `t_pendidikan_FK_1` (`kode_tingkat_pendidikan`),
  KEY `Index 3` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_penghargaan
CREATE TABLE IF NOT EXISTS `trx_penghargaan` (
  `nip` varchar(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_penghargaan` int(9) NOT NULL,
  `tanggal_penghargaan` date DEFAULT NULL,
  `nama_penghargaa` varchar(200) DEFAULT NULL,
  `pemberi_penghargaan` varchar(200) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_penghargaan`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_penilai_jafung_detail
CREATE TABLE IF NOT EXISTS `trx_penilai_jafung_detail` (
  `kode_tim_penilai` char(8) NOT NULL,
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `posisi_penilai` enum('Ketua','Wakil Ketua','Anggota','Sendiri') DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_tim_penilai`,`nip`),
  KEY `t_penilai_jafung_detail_FK` (`nip`),
  KEY `Index 3` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_penilai_jafung_header
CREATE TABLE IF NOT EXISTS `trx_penilai_jafung_header` (
  `kode_jenis_fungsional` char(2) DEFAULT NULL,
  `kode_tim_penilai` char(8) NOT NULL,
  `nomor_sk` varchar(100) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_tim_penilai`),
  KEY `t_penilai_jafung_header_kode_jenis_fungsional_IDX` (`kode_jenis_fungsional`,`kode_tim_penilai`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_penilai_langsung
CREATE TABLE IF NOT EXISTS `trx_penilai_langsung` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `tahun` char(4) NOT NULL,
  `nip_penilai_langsung_sem_1` char(20) DEFAULT NULL,
  `nip_penilai_langsung_sem_2` char(2) DEFAULT NULL,
  `nip_ttd_ppkp_sem_1` char(20) DEFAULT NULL,
  `nip_ttd_ppkp_sem_2` char(20) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`tahun`),
  KEY `t_penilai_langsung_FK_1` (`nip_penilai_langsung_sem_1`),
  KEY `t_penilai_langsung_FK_2` (`nip_ttd_ppkp_sem_1`),
  KEY `t_penilai_langsung_FK_3` (`nip_penilai_langsung_sem_2`),
  KEY `t_penilai_langsung_FK_4` (`nip_ttd_ppkp_sem_2`),
  KEY `Index 6` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_poin
CREATE TABLE IF NOT EXISTS `trx_poin` (
  `nip` char(50) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kegiatan` varchar(255) DEFAULT NULL,
  `nomor_sk` varchar(40) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `status_poin` int(11) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_program_studi_pegawai
CREATE TABLE IF NOT EXISTS `trx_program_studi_pegawai` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_fakultas` char(1) DEFAULT NULL,
  `kode_program_studi` varchar(3) NOT NULL,
  `kode_jurusan` varchar(6) NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `kode_pindah` int(3) NOT NULL,
  `status_aktif` enum('Aktif','Tidak Aktif') DEFAULT 'Aktif',
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_program_studi`,`kode_jurusan`,`kode_pindah`) USING BTREE,
  KEY `FK_t_program_studi_pegawai_ref_jurusan` (`kode_program_studi`,`kode_jurusan`),
  KEY `FK_trx_program_studi_pegawai_ref_fakultas` (`kode_fakultas`),
  KEY `Index 4` (`kode_pegawai`),
  CONSTRAINT `FK_trx_program_studi_pegawai_ref_fakultas` FOREIGN KEY (`kode_fakultas`) REFERENCES `ref_fakultas` (`kode_fakultas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_trx_program_studi_pegawai_ref_pegawai` FOREIGN KEY (`nip`) REFERENCES `ref_pegawai` (`nip`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_trx_program_studi_pegawai_ref_program_studi` FOREIGN KEY (`kode_program_studi`) REFERENCES `ref_program_studi` (`kode_program_studi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_seminar
CREATE TABLE IF NOT EXISTS `trx_seminar` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `kode_jenis_dokumen` char(5) NOT NULL,
  `kode_seminar` char(3) NOT NULL,
  `nama_seminar` varchar(100) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `penyelenggara` varchar(100) DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `nomor_sertifikat` varchar(100) DEFAULT NULL,
  `tanggal_sertifikat` date DEFAULT NULL,
  `jumlah_jam` int(11) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`kode_jenis_dokumen`,`kode_seminar`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_target_realisasi_skp_pegawai
CREATE TABLE IF NOT EXISTS `trx_target_realisasi_skp_pegawai` (
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `tahun` char(4) NOT NULL,
  `kode_skp` char(10) NOT NULL,
  `nama_skp_kegiatan` text NOT NULL,
  `target_qty_sem_1` int(4) NOT NULL DEFAULT 0,
  `target_qty_sem_2` int(4) NOT NULL DEFAULT 0,
  `target_total_qty_sem` int(4) NOT NULL DEFAULT 0,
  `target_qlty_sem_1` float(5,2) NOT NULL DEFAULT 0.00,
  `target_qlty_sem_2` float(5,2) NOT NULL DEFAULT 0.00,
  `target_qlty_sem` float(5,2) NOT NULL DEFAULT 0.00,
  `target_waktu_sem_1` float(5,2) NOT NULL DEFAULT 0.00,
  `target_waktu_sem_2` float(5,2) NOT NULL DEFAULT 0.00,
  `real_qty_sem_1` int(4) NOT NULL DEFAULT 0,
  `real_qty_sem_2` int(4) NOT NULL DEFAULT 0,
  `real_total_qty_sem` int(4) NOT NULL DEFAULT 0,
  `real_qlty_sem_1` float(5,2) NOT NULL DEFAULT 0.00,
  `real_qlty_sem_2` float(5,2) NOT NULL DEFAULT 0.00,
  `real_waktu_sem_1` float(5,2) NOT NULL DEFAULT 0.00,
  `real_waktu_sem_2` float(5,2) NOT NULL DEFAULT 0.00,
  `target_real_satuan_qty_sem` varchar(50) DEFAULT '0',
  `target_real_satuan_waktu` enum('Jam','Hari','Minggu','Bulan') DEFAULT NULL,
  `hitungan_sem_1` float(5,2) DEFAULT NULL,
  `hitungan_sem_2` float(5,2) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`nip`,`tahun`,`kode_skp`),
  KEY `Index 2` (`kode_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_unit_kerja
CREATE TABLE IF NOT EXISTS `trx_unit_kerja` (
  `kode_unit` char(16) DEFAULT NULL,
  `kode_unit_kerja` varchar(25) NOT NULL,
  `nama_unit_kerja` varchar(255) DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_unit_kerja`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table db_kepegawaian.trx_unit_kerja_pegawai
CREATE TABLE IF NOT EXISTS `trx_unit_kerja_pegawai` (
  `kode_unit` char(16) NOT NULL,
  `nip` char(20) NOT NULL,
  `kode_pegawai` char(20) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `ucr` varchar(100) DEFAULT NULL,
  `uch` varchar(100) DEFAULT NULL,
  `udcr` timestamp NULL DEFAULT current_timestamp(),
  `udch` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`kode_unit`,`nip`),
  KEY `Index 3` (`kode_pegawai`),
  CONSTRAINT `FK_trx_unit_kerja_pegawai_ref_unit` FOREIGN KEY (`kode_unit`) REFERENCES `ref_unit` (`kode_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
