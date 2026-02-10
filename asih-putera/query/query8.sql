SELECT
	CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS 'Nama Pegawai',
    j.JOB_TITLE,
    jh.START_DATE,
    jh.END_DATE,
    CONCAT('Rp ', FORMAT(e.SALARY, 0, 'id_ID')) AS GAJI
FROM employees e
JOIN job_history jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
JOIN jobs j ON jh.JOB_ID = j.JOB_ID
WHERE e.SALARY > 14500000;