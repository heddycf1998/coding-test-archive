-- you will be given a table 'kata' with columns 'id', 'base', and 'factor'. 
-- return the 'id' and your result in a column named 'res'.
SELECT
  id,
  CASE
    WHEN base % factor = 0 THEN true
    ELSE false
  END AS res
FROM kata