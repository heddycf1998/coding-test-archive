SELECT * FROM 

(
    SELECT
		e.EMPLOYEE_ID,
        e.SALARY,
        DENSE_RANK() OVER (ORDER BY e.SALARY DESC) AS Peringkat

        FROM employees e
) AS ranking

WHERE Peringkat <= 10;