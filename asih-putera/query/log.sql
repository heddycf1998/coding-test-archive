CREATE TABLE regions (
    REGION_ID INT PRIMARY KEY,
    REGION_NAME VARCHAR(25)
);
   
INSERT INTO regions VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');
INSERT INTO regions VALUES (3, 'Asias');
INSERT INTO regions VALUES (4, 'Australia');
INSERT INTO regions VALUES (5, 'Middle East');
INSERT INTO regions VALUES (6, 'Afrika');



CREATE TABLE jobs (
	JOB_ID VARCHAR(10),
    JOB_TITLE VARCHAR(25),
    MIN_SALARY DECIMAL(15, 2),
    MAX_SALARY DECIMAL(15, 2)
);

INSERT INTO jobs VALUES ('AD_PRES', 'President', 15000000, 40000000);
INSERT INTO jobs VALUES ('IT_PROG', 'IT Programmer', 8000000, 15000000);
INSERT INTO jobs VALUES ('SA_REP', 'Sales Representative', 7000000, 10000000);


ALTER TABLE jobs ADD PRIMARY KEY (JOB_ID)


CREATE TABLE countries (
	COUNTRY_ID CHAR(2) PRIMARY KEY,
    COUNTRY_NAME VARCHAR(40),
    REGION_ID INT,
    
    CONSTRAINT fk_countries_regions FOREIGN KEY (REGION_ID) REFERENCES regions(REGION_ID)
);

INSERT INTO countries VALUES ('ID', 'Indonesia', '3');
INSERT INTO countries VALUES ('JP', 'Jepang', '3');
INSERT INTO countries VALUES ('US', 'United States of America', '2');
INSERT INTO countries VALUES ('UK', 'United Kingdom', '1');



CREATE TABLE locations (
	LOCATION_ID INT PRIMARY KEY,
    STREET_ADDRESS VARCHAR(25),
    POSTAL_CODE VARCHAR(12),
    CITY VARCHAR(30) NOT NULL,
    STATE_PROVINCE VARCHAR(12),
    COUNTRY_ID CHAR(2),
    
    CONSTRAINT fk_locations_countries FOREIGN KEY (COUNTRY_ID) REFERENCES countries(COUNTRY_ID)
);

INSERT INTO locations VALUES (1000, 'Jl Sudirman No 1', '12190', 'Jakarta', 'DKI Jakarta', 'ID');
INSERT INTO locations VALUES (1100, 'Ginza 4-chome', '104-0061', 'Tokyo', 'Tokyo', 'JP');
INSERT INTO locations VALUES (1200, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');



CREATE TABLE departments (
	DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(30) NOT NULL,
    MANAGER_ID INT,
    LOCATION_ID INT,
    
    CONSTRAINT fk_department_locations FOREIGN KEY (LOCATION_ID) REFERENCES locations(LOCATION_ID)
);

INSERT INTO departments VALUES (10, 'Administration', 200, 1000);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1100);
INSERT INTO departments VALUES (30, 'Purchasing', 202, 1200);
INSERT INTO departments VALUES (40, 'Human Resources', 203, 1000);



CREATE TABLE employees (
	EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(25) NOT NULL,
    EMAIL VARCHAR(25) NOT NULL,
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR(10),
    SALARY DECIMAL(15, 2),
    COMMISSION_PCT DECIMAL(5, 2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT,
    
    CONSTRAINT fk_employees_jobs FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
    
    CONSTRAINT fk_employees_departments FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID)
);

INSERT INTO employees VALUES (100, 'Asih', 'Putera', 'asih@email.com', '0812345678', '2026-02-05', 'AD_PRES', '25000000', NULL, NULL, 10);
INSERT INTO employees VALUES (101, 'Bibi', 'Siti', 'bibi@email.com', '0812999999', '2026-01-01', 'IT_PROG', '15000000', 0.1, 100, 20);



SELECT 
    e.FIRST_NAME,
    e.LAST_NAME,
    j.JOB_ID,
    d.DEPARTMENT_ID
FROM employees e
JOIN jobs j ON e.JOB_ID = j.JOB_ID
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID



SELECT
	e.FIRST_NAME,
    e.LAST_NAME,
    j.JOB_TITLE,
    j.MIN_SALARY,
    d.DEPARTMENT_NAME
FROM employees e
JOIN jobs j ON e.JOB_ID = j.JOB_ID
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID



CREATE TABLE job_history (
	EMPLOYEE_ID INT,
    START_DATE DATE,
    END_DATE DATE,
    JOB_ID VARCHAR(10),
    DEPARTMENT_ID INT,
    
    PRIMARY KEY (EMPLOYEE_ID, START_DATE),
    
    CONSTRAINT fk_job_history_employees FOREIGN KEY (EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID),
    CONSTRAINT fk_job_history_jobs FOREIGN KEY (JOB_ID) REFERENCES jobs(JOB_ID),
    CONSTRAINT fk_job_history_departments FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID)
);

INSERT INTO job_history VALUES (100, '2025-02-05', '2026-02-03', 'AD_PRES', 10);
INSERT INTO job_history VALUES (101, '2025-02-05', '2025-12-27', 'IT_PROG', 20);

INSERT INTO employees 
(
    EMPLOYEE_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EMAIL, 
    PHONE_NUMBER, 
    HIRE_DATE, 
    JOB_ID, 
    SALARY, 
    COMMISSION_PCT, 
    MANAGER_ID, 
    DEPARTMENT_ID
) 
VALUES
(103, 'Dedi', 'Kurniawan', 'dedi@mail.com', '081234567803', '2024-02-10', 'IT_PROG', 12000000, NULL, 101, 20),
(104, 'Eka', 'Sari', 'eka@mail.com', '081234567804', '2024-03-05', 'SA_REP', 7500000, 0.1, 100, 30),
(105, 'Fajar', 'Hidayat', 'fajar@mail.com', '081234567805', '2024-03-20', 'SA_REP', 8200000, 0.1, 100, 30),
(106, 'Gita', 'Permata', 'gita@mail.com', '081234567806', '2024-04-12', 'IT_PROG', 14500000, NULL, 101, 20),
(107, 'Hadi', 'Saputra', 'hadi@mail.com', '081234567807', '2024-05-01', 'SA_REP', 9800000, 0.1, 100, 30),
(108, 'Indah', 'Lestari', 'indah@mail.com', '081234567808', '2024-05-15', 'IT_PROG', 8500000, NULL, 101, 20),
(109, 'Joko', 'Susilo', 'joko@mail.com', '081234567809', '2024-06-01', 'SA_REP', 7200000, 0.05, 100, 30),
(110, 'Kiki', 'Amalia', 'kiki@mail.com', '081234567810', '2024-06-10', 'IT_PROG', 11000000, NULL, 101, 20),
(111, 'Lutfi', 'Hakim', 'lutfi@mail.com', '081234567811', '2024-07-01', 'IT_PROG', 13000000, NULL, 101, 20),
(112, 'Maya', 'Santi', 'maya@mail.com', '081234567812', '2024-07-20', 'SA_REP', 8800000, 0.15, 100, 30),
(113, 'Nanda', 'Putra', 'nanda@mail.com', '081234567813', '2024-08-05', 'IT_PROG', 10500000, NULL, 101, 20),
(114, 'Oky', 'Pratama', 'oky@mail.com', '081234567814', '2024-08-15', 'SA_REP', 7000000, 0.1, 100, 30),
(115, 'Putri', 'Utami', 'putri@mail.com', '081234567815', '2024-09-01', 'IT_PROG', 14000000, NULL, 101, 20),
(116, 'Qori', 'Anwar', 'qori@mail.com', '081234567816', '2024-09-10', 'SA_REP', 9500000, 0.05, 100, 30),
(117, 'Rian', 'Fauzi', 'rian@mail.com', '081234567817', '2024-10-01', 'IT_PROG', 9200000, NULL, 101, 20),
(118, 'Siska', 'Amel', 'siska@mail.com', '081234567818', '2024-10-15', 'SA_REP', 7800000, 0.2, 100, 30),
(119, 'Toni', 'Irawan', 'toni@mail.com', '081234567819', '2024-11-01', 'IT_PROG', 11500000, NULL, 101, 20),
(120, 'Umar', 'Said', 'umar@mail.com', '081234567820', '2024-11-20', 'SA_REP', 8400000, 0.1, 100, 30)

INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(121, 'Vina', 'Pandu', 'vina@mail.com', '081234567821', '2024-12-05', 'IT_PROG', 13800000, NULL, 101, 20),
(122, 'Agus', 'Prasetyo', 'agus@mail.com', '081234567822', '2025-01-20', 'IT_PROG', 11000000, NULL, 101, 20),
(123, 'Bambang', 'Sutedjo', 'bambang@mail.com', '081234567823', '2025-01-25', 'SA_REP', 8500000, 0.1, 100, 30),
(124, 'Citra', 'Lestari', 'citra@mail.com', '081234567824', '2025-02-05', 'IT_PROG', 14200000, NULL, 101, 20),
(125, 'Dewi', 'Anggraini', 'dewi@mail.com', '081234567825', '2025-02-15', 'SA_REP', 7200000, 0.15, 100, 30),
(126, 'Endang', 'Suryani', 'endang@mail.com', '081234567826', '2025-03-01', 'IT_PROG', 9800000, NULL, 101, 20),
(127, 'Farhan', 'Maulana', 'farhan@mail.com', '081234567827', '2025-03-10', 'SA_REP', 9100000, 0.1, 100, 30),
(128, 'Gilang', 'Ramadhan', 'gilang@mail.com', '081234567828', '2025-03-25', 'IT_PROG', 12500000, NULL, 101, 20),
(129, 'Hana', 'Fadhilah', 'hana@mail.com', '081234567829', '2025-04-05', 'SA_REP', 7800000, 0.1, 100, 30),
(130, 'Irfan', 'Bachdim', 'irfan@mail.com', '081234567830', '2025-04-15', 'IT_PROG', 14000000, NULL, 101, 20),
(131, 'Joni', 'Iskandar', 'joni@mail.com', '081234567831', '2025-05-01', 'SA_REP', 8900000, 0.2, 100, 30),
(132, 'Kania', 'Putri', 'kania@mail.com', '081234567832', '2025-05-12', 'IT_PROG', 10200000, NULL, 101, 20),
(133, 'Lucky', 'Perdana', 'lucky@mail.com', '081234567833', '2025-05-20', 'SA_REP', 7400000, 0.1, 100, 30),
(134, 'Momon', 'Sulaeman', 'momon@mail.com', '081234567834', '2025-06-05', 'IT_PROG', 11800000, NULL, 101, 20),
(135, 'Nina', 'Zatulini', 'nina@mail.com', '081234567835', '2025-06-15', 'SA_REP', 9600000, 0.15, 100, 30),
(136, 'Oman', 'Abdurahman', 'oman@mail.com', '081234567836', '2025-07-01', 'IT_PROG', 8700000, NULL, 101, 20),
(137, 'Pandu', 'Winata', 'pandu@mail.com', '081234567837', '2025-07-10', 'SA_REP', 8100000, 0.1, 100, 30),
(138, 'Qia', 'Salsabila', 'qia@mail.com', '081234567838', '2025-07-20', 'IT_PROG', 14800000, NULL, 101, 20),
(139, 'Raka', 'Bumigora', 'raka@mail.com', '081234567839', '2025-08-05', 'SA_REP', 7000000, 0.05, 100, 30),
(140, 'Santi', 'Ariyani', 'santi@mail.com', '081234567840', '2025-08-15', 'IT_PROG', 12200000, NULL, 101, 20),
(141, 'Tegar', 'Septian', 'tegar@mail.com', '081234567841', '2025-09-01', 'SA_REP', 9900000, 0.2, 100, 30),
(142, 'Uli', 'Herdiansyah', 'uli@mail.com', '081234567842', '2025-09-10', 'IT_PROG', 13000000, NULL, 101, 20),
(143, 'Vicky', 'Nitinegoro', 'vicky@mail.com', '081234567843', '2025-09-20', 'SA_REP', 7600000, 0.1, 100, 30),
(144, 'Wawan', 'Gunawan', 'wawan@mail.com', '081234567844', '2025-10-05', 'IT_PROG', 9400000, NULL, 101, 20),
(145, 'Xena', 'Warrior', 'xena@mail.com', '081234567845', '2025-10-15', 'SA_REP', 8800000, 0.15, 100, 30),
(146, 'Yadi', 'Sembako', 'yadi@mail.com', '081234567846', '2025-11-01', 'IT_PROG', 11500000, NULL, 101, 20),
(147, 'Zizi', 'Zubir', 'zizi@mail.com', '081234567847', '2025-11-10', 'SA_REP', 7300000, 0.1, 100, 30),
(148, 'Asep', 'Surasep', 'asep@mail.com', '081234567848', '2025-11-20', 'IT_PROG', 10800000, NULL, 101, 20),
(149, 'Bejo', 'Mulyono', 'bejo@mail.com', '081234567849', '2025-12-05', 'SA_REP', 9200000, 0.1, 100, 30),
(150, 'Cici', 'Paramida', 'cici@mail.com', '081234567850', '2025-12-15', 'IT_PROG', 14500000, NULL, 101, 20);


UPDATE departments 
SET DEPARTMENT_NAME = 'IT' 
WHERE DEPARTMENT_ID = 20;



DROP TRIGGER IF EXISTS log_job_history;

DELIMITER //

CREATE TRIGGER log_job_history
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
	IF OLD.JOB_ID <> NEW.JOB_ID OR OLD.DEPARTMENT_ID <> NEW.DEPARTMENT_ID THEN
    	INSERT INTO job_history (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)
    	VALUES (OLD.EMPLOYEE_ID, OLD.HIRE_DATE, CURDATE(), OLD.JOB_ID, OLD.DEPARTMENT_ID);
    END IF;
END;// 

DELIMITER ;


UPDATE employees
SET DEPARTMENT_ID = 20
WHERE EMPLOYEE_ID = 102;

SELECT * FROM job_history;


UPDATE employees
SET JOB_ID = 'SA_REP'
WHERE EMPLOYEE_ID = 106



INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID) VALUES
(151, 'Bambang', 'Sutedjo', 'bambang.s@email.com', '081122334455', '2024-01-10', 'IT_PROG', 8500000, 10),
(152, 'Siti', 'Aminah', 'siti.a@email.com', '081122334456', '2024-01-12', 'IT_PROG', 8000000, 10),
(153, 'Eko', 'Prasetyo', 'eko.p@email.com', '081122334457', '2024-01-15', 'SA_REP', 7000000, 10),
(154, 'Dewi', 'Lestari', 'dewi.l@email.com', '081122334458', '2024-01-20', 'IT_PROG', 8200000, 10),
(155, 'Rian', 'Hidayat', 'rian.h@email.com', '081122334459', '2024-02-01', 'SA_REP', 7500000, 10),
(156, 'Ayu', 'Wulandari', 'ayu.w@email.com', '081122334460', '2024-02-05', 'IT_PROG', 8100000, 10),
(157, 'Dimas', 'Anggara', 'dimas.a@email.com', '081122334461', '2024-02-10', 'SA_REP', 7200000, 10),
(158, 'Fitri', 'Handayani', 'fitri.h@email.com', '081122334462', '2024-02-15', 'IT_PROG', 7900000, 10),
(159, 'Budi', 'Santoso', 'budi.s@email.com', '081122334463', '2024-02-20', 'SA_REP', 7300000, 10),
(160, 'Siska', 'Amalia', 'siska.a@email.com', '081122334464', '2024-03-01', 'IT_PROG', 8400000, 10),
(161, 'Andi', 'Wijaya', 'andi.w@email.com', '081223344501', '2024-03-05', 'IT_PROG', 8000000, 10),
(162, 'Maya', 'Sari', 'maya.s@email.com', '081223344502', '2024-03-10', 'SA_REP', 7200000, 10),
(163, 'Gilang', 'Permana', 'gilang.p@email.com', '081223344503', '2024-03-15', 'SA_REP', 7600000, 10),
(164, 'Indah', 'Permatasari', 'indah.p@email.com', '081223344504', '2024-03-20', 'IT_PROG', 8300000, 10),
(165, 'Reza', 'Rahadian', 'reza.r@email.com', '081223344505', '2024-04-01', 'IT_PROG', 9000000, 10),
(166, 'Putri', 'Marino', 'putri.m@email.com', '081223344506', '2024-04-05', 'SA_REP', 7500000, 10),
(167, 'Adipati', 'Dolken', 'adipati.d@email.com', '081223344507', '2024-04-10', 'SA_REP', 7800000, 10),
(168, 'Vanesha', 'Prescilla', 'vanesha.p@email.com', '081223344508', '2024-04-15', 'IT_PROG', 8400000, 10),
(169, 'Iqbaal', 'Ramadhan', 'iqbaal.r@email.com', '081223344509', '2024-04-20', 'IT_PROG', 8800000, 10),
(170, 'Angga', 'Yunanda', 'angga.y@email.com', '081223344510', '2024-05-01', 'SA_REP', 7100000, 10),
(171, 'Zara', 'Adhisty', 'zara.a@email.com', '081223344511', '2024-05-05', 'SA_REP', 7400000, 10),
(172, 'Jefri', 'Nichol', 'jefri.n@email.com', '081223344512', '2024-05-10', 'IT_PROG', 8250000, 10),
(173, 'Amanda', 'Rawles', 'amanda.r@email.com', '081223344513', '2024-05-15', 'IT_PROG', 8100000, 10),
(174, 'Bryan', 'Domani', 'bryan.d@email.com', '081223344514', '2024-05-20', 'SA_REP', 7300000, 10),
(175, 'Mawar', 'de Jongh', 'mawar.j@email.com', '081223344515', '2024-06-01', 'SA_REP', 7700000, 10),
(176, 'Kevin', 'Sanjaya', 'kevin.s@email.com', '081223344516', '2024-06-05', 'IT_PROG', 8150000, 10),
(177, 'Marcus', 'Gideon', 'marcus.g@email.com', '081223344517', '2024-06-10', 'IT_PROG', 8300000, 10),
(178, 'Jonatan', 'Christie', 'jojo.c@email.com', '081223344518', '2024-06-15', 'SA_REP', 7400000, 10),
(179, 'Anthony', 'Ginting', 'ginting.a@email.com', '081223344519', '2024-06-20', 'SA_REP', 7900000, 10),
(180, 'Fajar', 'Alfian', 'fajar.a@email.com', '081223344520', '2024-07-01', 'IT_PROG', 8350000, 10),
(181, 'Rian', 'Ardianto', 'rian.a@email.com', '081223344521', '2024-07-05', 'IT_PROG', 8250000, 10),
(182, 'Apriyani', 'Rahayu', 'apri.r@email.com', '081223344522', '2024-07-10', 'SA_REP', 7600000, 10),
(183, 'Greysia', 'Polii', 'greys.p@email.com', '081223344523', '2024-07-15', 'SA_REP', 8000000, 10),
(184, 'Tontowi', 'Ahmad', 'owi.a@email.com', '081223344524', '2024-07-20', 'IT_PROG', 8450000, 10),
(185, 'Liliyana', 'Natsir', 'butet.n@email.com', '081223344525', '2024-08-01', 'IT_PROG', 9200000, 10),
(186, 'Hendra', 'Setiawan', 'hendra.s@email.com', '081223344526', '2024-08-05', 'SA_REP', 7700000, 10),
(187, 'Mohammad', 'Ahsan', 'ahsan.m@email.com', '081223344527', '2024-08-10', 'SA_REP', 8100000, 10),
(188, 'Praveen', 'Jordan', 'praveen.j@email.com', '081223344528', '2024-08-15', 'IT_PROG', 8550000, 10),
(189, 'Melati', 'Daeva', 'melati.d@email.com', '081223344529', '2024-08-20', 'IT_PROG', 8400000, 10),
(190, 'Gloria', 'Widjaja', 'gloria.w@email.com', '081223344530', '2024-09-01', 'SA_REP', 7150000, 10),
(191, 'Taufik', 'Hidayat', 'taufik.h@email.com', '081334455601', '2024-09-05', 'SA_REP', 8000000, 10),
(192, 'Susi', 'Susanti', 'susi.s@email.com', '081334455602', '2024-09-10', 'IT_PROG', 9500000, 10),
(193, 'Alan', 'Budikusuma', 'alan.b@email.com', '081334455603', '2024-09-15', 'SA_REP', 7800000, 10),
(194, 'Rudy', 'Hartono', 'rudy.h@email.com', '081334455604', '2024-09-20', 'SA_REP', 8200000, 10),
(195, 'Liem', 'Swie King', 'liem.s@email.com', '081334455605', '2024-10-01', 'IT_PROG', 8600000, 10),
(196, 'Ade', 'Rai', 'ade.r@email.com', '081334455606', '2024-10-05', 'IT_PROG', 8600000, 10),
(197, 'Chris', 'John', 'chris.j@email.com', '081334455607', '2024-10-10', 'SA_REP', 7350000, 10),
(198, 'Daud', 'Yordan', 'daud.y@email.com', '081334455608', '2024-10-15', 'SA_REP', 7750000, 10),
(199, 'Bambang', 'Pamungkas', 'bepe.p@email.com', '081334455609', '2024-10-20', 'IT_PROG', 8700000, 10),
(200, 'Boaz', 'Solossa', 'boaz.s@email.com', '081334455610', '2024-11-01', 'IT_PROG', 8700000, 10);


INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, DEPARTMENT_ID) VALUES
(201, 'Evan', 'Dimas', 'evan.d@email.com', '081334455611', '2024-11-05', 'SA_REP', 7250000, 10),
(202, 'Egy', 'Maulana', 'egy.m@email.com', '081334455612', '2024-11-10', 'SA_REP', 7650000, 10),
(203, 'Witan', 'Sulaeman', 'witan.s@email.com', '081334455613', '2024-11-15', 'IT_PROG', 8100000, 10),
(204, 'Pratama', 'Arhan', 'arhan.p@email.com', '081334455614', '2024-11-20', 'IT_PROG', 8150000, 10),
(205, 'Asnawi', 'Mangkualam', 'asnawi.m@email.com', '081334455615', '2024-12-01', 'SA_REP', 7450000, 10),
(206, 'Elkan', 'Baggott', 'elkan.b@email.com', '081334455616', '2024-12-05', 'SA_REP', 8050000, 10),
(207, 'Ricky', 'Kambuaya', 'ricky.k@email.com', '081334455617', '2024-12-10', 'IT_PROG', 8200000, 10),
(208, 'Rachmat', 'Irianto', 'rian.i@email.com', '081334455618', '2024-12-15', 'IT_PROG', 8350000, 10),
(209, 'Nadeo', 'Argawinata', 'nadeo.a@email.com', '081334455619', '2024-12-20', 'SA_REP', 7150000, 10),
(210, 'Irfan', 'Jaya', 'irfan.j@email.com', '081334455620', '2025-01-01', 'SA_REP', 7550000, 10),
(211, 'Dedik', 'Setiawan', 'dedik.s@email.com', '081445566701', '2025-01-05', 'IT_PROG', 8050000, 10),
(212, 'Fachruddin', 'Aryanto', 'fachru.a@email.com', '081445566702', '2025-01-10', 'IT_PROG', 8550000, 10),
(213, 'Rizky', 'Ridho', 'ridho.r@email.com', '081445566703', '2025-01-15', 'SA_REP', 7350000, 10),
(214, 'Marselino', 'Ferdinan', 'lino.f@email.com', '081445566704', '2025-01-20', 'SA_REP', 7850000, 10),
(215, 'Ramadhan', 'Sananta', 'sananta.r@email.com', '081445566705', '2025-02-01', 'IT_PROG', 8150000, 10),
(216, 'Ernando', 'Ari', 'nando.a@email.com', '081445566706', '2025-02-05', 'IT_PROG', 8250000, 10),
(217, 'Yakob', 'Sayuri', 'yakob.s@email.com', '081445566707', '2025-02-10', 'SA_REP', 7050000, 10),
(218, 'Yance', 'Sayuri', 'yance.s@email.com', '081445566708', '2025-02-15', 'SA_REP', 7050000, 10),
(219, 'Saddil', 'Ramdani', 'saddil.r@email.com', '081445566709', '2025-02-20', 'IT_PROG', 8250000, 10),
(220, 'Shayne', 'Pattynama', 'shayne.p@email.com', '081445566710', '2025-03-01', 'IT_PROG', 8950000, 10),
(221, 'Sandy', 'Walsh', 'sandy.w@email.com', '081445566711', '2025-03-05', 'SA_REP', 7650000, 10),
(222, 'Jordi', 'Amat', 'jordi.a@email.com', '081445566712', '2025-03-10', 'SA_REP', 7950000, 10),
(223, 'Rafael', 'Struick', 'rafael.s@email.com', '081445566713', '2025-03-15', 'IT_PROG', 8350000, 10),
(224, 'Ivar', 'Jenner', 'ivar.j@email.com', '081445566714', '2025-03-20', 'IT_PROG', 8450000, 10),
(225, 'Justin', 'Hubner', 'justin.h@email.com', '081445566715', '2025-04-01', 'SA_REP', 7550000, 10),
(226, 'Thom', 'Haye', 'thom.h@email.com', '081445566716', '2025-04-05', 'SA_REP', 7550000, 10),
(227, 'Ragnar', 'Oratmangoen', 'ragnar.o@email.com', '081445566717', '2025-04-10', 'IT_PROG', 8450000, 10),
(228, 'Nathan', 'Tjoe-A-On', 'nathan.t@email.com', '081445566718', '2025-04-15', 'IT_PROG', 8150000, 10),
(229, 'Maarten', 'Paes', 'maarten.p@email.com', '081445566719', '2025-04-20', 'SA_REP', 7250000, 10),
(230, 'Calvin', 'Verdonk', 'calvin.v@email.com', '081445566720', '2025-05-01', 'SA_REP', 7850000, 10),
(231, 'Jay', 'Idzes', 'jay.i@email.com', '081556677801', '2025-05-05', 'IT_PROG', 8150000, 10),
(232, 'Rizky', 'Pora', 'pora.r@email.com', '081556677802', '2025-05-10', 'IT_PROG', 8050000, 10),
(233, 'Hansamu', 'Yama', 'yama.h@email.com', '081556677803', '2025-05-15', 'SA_REP', 7250000, 10),
(234, 'Zulfiandi', 'Z', 'zulfi.z@email.com', '081556677804', '2025-05-20', 'SA_REP', 7950000, 10),
(235, 'Febri', 'Hariyadi', 'febri.h@email.com', '081556677805', '2025-06-01', 'IT_PROG', 8550000, 10),
(236, 'Septian', 'David', 'david.s@email.com', '081556677806', '2025-06-05', 'IT_PROG', 8150000, 10),
(237, 'Hanif', 'Sjahbandi', 'hanif.s@email.com', '081556677807', '2025-06-10', 'SA_REP', 7150000, 10),
(238, 'Bagastafa', 'K', 'bagas.k@email.com', '081556677808', '2025-06-15', 'SA_REP', 7750000, 10),
(239, 'Bagas', 'Kaffa', 'kaffa.b@email.com', '081556677809', '2025-06-20', 'IT_PROG', 8250000, 10),
(240, 'Bagus', 'Kahfi', 'kahfi.b@email.com', '081556677810', '2025-07-01', 'IT_PROG', 8250000, 10),
(241, 'Syahrian', 'Abimanyu', 'abi.s@email.com', '081556677811', '2025-07-05', 'SA_REP', 7350000, 10),
(242, 'Osvaldo', 'Haay', 'valdo.h@email.com', '081556677812', '2025-07-10', 'SA_REP', 7850000, 10),
(243, 'Todd', 'Ferre', 'todd.f@email.com', '081556677813', '2025-07-15', 'IT_PROG', 8150000, 10),
(244, 'Marlan', 'Sandi', 'marlan.s@email.com', '081556677814', '2025-07-20', 'IT_PROG', 8050000, 10),
(245, 'Gunawan', 'Dwi', 'gunawan.d@email.com', '081556677815', '2025-08-01', 'SA_REP', 7150000, 10),
(246, 'Hamka', 'Hamzah', 'hamka.h@email.com', '081556677816', '2025-08-05', 'SA_REP', 8150000, 10),
(247, 'Cristian', 'Gonzales', 'el_loco@email.com', '081556677817', '2025-08-10', 'IT_PROG', 8850000, 10),
(248, 'Firman', 'Utina', 'firman.u@email.com', '081556677818', '2025-08-15', 'IT_PROG', 8650000, 10),
(249, 'Ponaryo', 'Astaman', 'ponaryo.a@email.com', '081556677819', '2025-08-20', 'SA_REP', 7450000, 10),
(250, 'Kurnia', 'Meiga', 'meiga.k@email.com', '081556677820', '2025-09-01', 'SA_REP', 8050000, 10);