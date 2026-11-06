SELECT
    DISTINCT(CITY)
FROM
    STATION
WHERE 
    LEFT(CITY, 1) NOT IN ('a', 'i', 'u', 'e', 'o', 'A', 'I', 'U', 'E', 'O')
    OR
    RIGHT(CITY, 1) NOT IN ('a', 'i', 'u', 'e', 'o', 'A', 'I', 'U', 'E', 'O')
ORDER BY CITY ASC;