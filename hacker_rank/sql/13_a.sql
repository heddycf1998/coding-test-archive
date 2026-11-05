SELECT
    DISTINCT(CITY)
FROM
    STATION
WHERE 
    LEFT(CITY, 1) IN ('a', 'i', 'u', 'e', 'o', 'A', 'I', 'U', 'E', 'O')
    AND
    RIGHT(CITY, 1) IN ('a', 'i', 'u', 'e', 'o', 'A', 'I', 'U', 'E', 'O')
ORDER BY CITY ASC;