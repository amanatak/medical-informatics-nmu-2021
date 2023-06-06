-- File: lab1_queries.sql
-- Last update: 28/10/2021
-- Author: Areti Manataki


-- This is another way of setting lab1 to be the default schema (instead of double-clicking)
USE lab1;


-- Q1: Return the details of all drugs
SELECT * FROM drug;

-- Q2: Return the dates of prescription for drugs with generic name "Minocycline"
SELECT GP.name, P.date 
FROM prescription AS P, drug as D
WHERE D.generic_name = 'Minocycline' AND D.id = P.d_id;
