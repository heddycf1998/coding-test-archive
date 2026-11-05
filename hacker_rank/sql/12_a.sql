SELECT
    DISTINCT(CITY)
FROM
    STATION
WHERE RIGHT(CITY, 1) IN ('a', 'i', 'u', 'e', 'o', 'A', 'I', 'U', 'E', 'O')
ORDER BY CITY ASC