-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Feb 2026 pada 08.57
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test_asih_putera`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `countries`
--

CREATE TABLE `countries` (
  `COUNTRY_ID` char(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `countries`
--

INSERT INTO `countries` (`COUNTRY_ID`, `COUNTRY_NAME`, `REGION_ID`) VALUES
('ID', 'Indonesia', 3),
('JP', 'Jepang', 3),
('UK', 'United Kingdom', 1),
('US', 'United States of America', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `DEPARTMENT_ID` int(11) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `LOCATION_ID`) VALUES
(10, 'Administration', 200, 1000),
(20, 'Marketing', 201, 1100),
(30, 'Purchasing', 202, 1200),
(40, 'Human Resources', 203, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) DEFAULT NULL,
  `SALARY` decimal(15,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(5,2) DEFAULT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
(100, 'Asih', 'Putera', 'asih@email.com', '0812345678', '2026-02-05', 'AD_PRES', 25000000.00, NULL, NULL, 10),
(101, 'Bibi', 'Siti', 'bibi@email.com', '0812999999', '2026-01-01', 'IT_PROG', 15000000.00, 0.10, 100, 20),
(103, 'Dedi', 'Kurniawan', 'dedi@mail.com', '081234567803', '2024-02-10', 'IT_PROG', 12000000.00, NULL, 101, 20),
(104, 'Eka', 'Sari', 'eka@mail.com', '081234567804', '2024-03-05', 'SA_REP', 7500000.00, 0.10, 100, 30),
(105, 'Fajar', 'Hidayat', 'fajar@mail.com', '081234567805', '2024-03-20', 'SA_REP', 8200000.00, 0.10, 100, 30),
(106, 'Gita', 'Permata', 'gita@mail.com', '081234567806', '2024-04-12', 'IT_PROG', 14500000.00, NULL, 101, 20),
(107, 'Hadi', 'Saputra', 'hadi@mail.com', '081234567807', '2024-05-01', 'SA_REP', 9800000.00, 0.10, 100, 30),
(108, 'Indah', 'Lestari', 'indah@mail.com', '081234567808', '2024-05-15', 'IT_PROG', 8500000.00, NULL, 101, 20),
(109, 'Joko', 'Susilo', 'joko@mail.com', '081234567809', '2024-06-01', 'SA_REP', 7200000.00, 0.05, 100, 30),
(110, 'Kiki', 'Amalia', 'kiki@mail.com', '081234567810', '2024-06-10', 'IT_PROG', 11000000.00, NULL, 101, 20),
(111, 'Lutfi', 'Hakim', 'lutfi@mail.com', '081234567811', '2024-07-01', 'IT_PROG', 13000000.00, NULL, 101, 20),
(112, 'Maya', 'Santi', 'maya@mail.com', '081234567812', '2024-07-20', 'SA_REP', 8800000.00, 0.15, 100, 30),
(113, 'Nanda', 'Putra', 'nanda@mail.com', '081234567813', '2024-08-05', 'IT_PROG', 10500000.00, NULL, 101, 20),
(114, 'Oky', 'Pratama', 'oky@mail.com', '081234567814', '2024-08-15', 'SA_REP', 7000000.00, 0.10, 100, 30),
(115, 'Putri', 'Utami', 'putri@mail.com', '081234567815', '2024-09-01', 'IT_PROG', 14000000.00, NULL, 101, 20),
(116, 'Qori', 'Anwar', 'qori@mail.com', '081234567816', '2024-09-10', 'SA_REP', 9500000.00, 0.05, 100, 30),
(117, 'Rian', 'Fauzi', 'rian@mail.com', '081234567817', '2024-10-01', 'IT_PROG', 9200000.00, NULL, 101, 20),
(118, 'Siska', 'Amel', 'siska@mail.com', '081234567818', '2024-10-15', 'SA_REP', 7800000.00, 0.20, 100, 30),
(119, 'Toni', 'Irawan', 'toni@mail.com', '081234567819', '2024-11-01', 'IT_PROG', 11500000.00, NULL, 101, 20),
(120, 'Umar', 'Said', 'umar@mail.com', '081234567820', '2024-11-20', 'SA_REP', 8400000.00, 0.10, 100, 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL,
  `JOB_TITLE` varchar(25) DEFAULT NULL,
  `MIN_SALARY` decimal(15,2) DEFAULT NULL,
  `MAX_SALARY` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`JOB_ID`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('AD_PRES', 'President', 15000000.00, 40000000.00),
('IT_PROG', 'IT Programmer', 8000000.00, 15000000.00),
('SA_REP', 'Sales Representative', 7000000.00, 10000000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_grades`
--

CREATE TABLE `job_grades` (
  `GRADE_LEVEL` varchar(2) NOT NULL,
  `LOWEST_SAL` decimal(15,2) DEFAULT NULL,
  `HIGHEST_SAL` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `job_grades`
--

INSERT INTO `job_grades` (`GRADE_LEVEL`, `LOWEST_SAL`, `HIGHEST_SAL`) VALUES
('A', 10000000.00, 20000000.00),
('B', 5000000.00, 9999999.00),
('C', 100000.00, 4999999.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_history`
--

CREATE TABLE `job_history` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date DEFAULT NULL,
  `JOB_ID` varchar(10) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `job_history`
--

INSERT INTO `job_history` (`EMPLOYEE_ID`, `START_DATE`, `END_DATE`, `JOB_ID`, `DEPARTMENT_ID`) VALUES
(100, '2025-02-05', '2026-02-03', 'AD_PRES', 10),
(101, '2025-02-05', '2025-12-27', 'IT_PROG', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `LOCATION_ID` int(11) NOT NULL,
  `STREET_ADDRESS` varchar(25) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(12) DEFAULT NULL,
  `COUNTRY_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `locations`
--

INSERT INTO `locations` (`LOCATION_ID`, `STREET_ADDRESS`, `POSTAL_CODE`, `CITY`, `STATE_PROVINCE`, `COUNTRY_ID`) VALUES
(1000, 'Jl Sudirman No 1', '12190', 'Jakarta', 'DKI Jakarta', 'ID'),
(1100, 'Ginza 4-chome', '104-0061', 'Tokyo', 'Tokyo', 'JP'),
(1200, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');

-- --------------------------------------------------------

--
-- Struktur dari tabel `regions`
--

CREATE TABLE `regions` (
  `REGION_ID` int(11) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `regions`
--

INSERT INTO `regions` (`REGION_ID`, `REGION_NAME`) VALUES
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asias'),
(4, 'Australia'),
(5, 'Middle East'),
(6, 'Afrika');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`COUNTRY_ID`),
  ADD KEY `fk_countries_regions` (`REGION_ID`);

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPARTMENT_ID`),
  ADD KEY `fk_department_locations` (`LOCATION_ID`);

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD KEY `fk_employees_jobs` (`JOB_ID`),
  ADD KEY `fk_employees_departments` (`DEPARTMENT_ID`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indeks untuk tabel `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`GRADE_LEVEL`);

--
-- Indeks untuk tabel `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  ADD KEY `fk_job_history_jobs` (`JOB_ID`),
  ADD KEY `fk_job_history_departments` (`DEPARTMENT_ID`);

--
-- Indeks untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LOCATION_ID`),
  ADD KEY `fk_locations_countries` (`COUNTRY_ID`);

--
-- Indeks untuk tabel `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`REGION_ID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `fk_countries_regions` FOREIGN KEY (`REGION_ID`) REFERENCES `regions` (`REGION_ID`);

--
-- Ketidakleluasaan untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_department_locations` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`LOCATION_ID`);

--
-- Ketidakleluasaan untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_departments` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`),
  ADD CONSTRAINT `fk_employees_jobs` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`);

--
-- Ketidakleluasaan untuk tabel `job_history`
--
ALTER TABLE `job_history`
  ADD CONSTRAINT `fk_job_history_departments` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`),
  ADD CONSTRAINT `fk_job_history_employees` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employees` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `fk_job_history_jobs` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`);

--
-- Ketidakleluasaan untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `fk_locations_countries` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `countries` (`COUNTRY_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
