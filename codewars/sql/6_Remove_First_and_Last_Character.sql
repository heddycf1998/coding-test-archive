-- # write your SQL statement here: you are given a table 'removechar' with column 's', return a table with column 's' and your result in a column named 'res'.
SELECT
  s,
  CASE
    WHEN LENGTH(s) <= 2 THEN ''
    ELSE SUBSTR(s, 2, LENGTH(s) - 2)
  END AS res
FROM removechar