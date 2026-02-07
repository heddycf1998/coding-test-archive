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