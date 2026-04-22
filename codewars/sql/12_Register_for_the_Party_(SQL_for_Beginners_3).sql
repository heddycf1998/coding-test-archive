INSERT INTO participants (name, age, attending)
VALUES
  ('Neel', 21, true),
  ('Kems', 23, false),
  ('Posi', 30, false),
  ('Noki', 17, true),  
  ('Pikl', 20, true);

SELECT 
  * 
FROM participants 
WHERE age >= 21 AND attending = true;