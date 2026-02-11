SELECT
	d.DEPARTMENT_NAME AS 'Nama Department',
   	CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS 'Nama Manager',
   	CONCAT('Rp ' , FORMAT(e.SALARY, 0, 'id_ID')) AS 'Gaji',
    TIMESTAMPDIFF(YEAR, e.HIRE_DATE, CURDATE()) AS 'Masa Kerja (Tahun)'
FROM departments d
JOIN employees e ON d.MANAGER_ID = e.EMPLOYEE_ID
WHERE TIMESTAMPDIFF(YEAR, e.HIRE_DATE, CURDATE()) > 15;