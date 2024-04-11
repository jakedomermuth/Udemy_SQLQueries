-- Challenge 1 Solution - Select employees from Seattle or Sydney:
SELECT *
FROM hcm.employees
WHERE city = 'Sydney' or state_province= 'Seattle';


--Challenge 2 Solution: Select employees who live in any of the following cities:
--- Seattle
--- Sydney
--- Ascot
--- Hillston

SELECT *
FROM hcm.employees
WHERE city IN('Seattle', 'Sydney', 'Ascot', 'Hillston')


-- Challenge 3 Solution
-- Select employees from Sydney who have a salary greater than $200,000:
SELECT *
FROM hcm.employees
WHERE city = 'Sydney' and salary > 200000


-- Challenge 4 Solution
-- Select employees who live in either Seattle or Sydney city and were hired 
-- on or after January 1st 2019:
SELECT *
FROM hcm.employees
WHERE (city = 'Seattle' or city ='Sydney') and hire_date >= '20190101'



-- Challenge 5 Solution - Select products that are not categories 1, 2 or 5:
Select *
FROM oes.product_categories
WHERE category_id NOT IN(1, 2, 5)