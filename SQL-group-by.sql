--Challenge 1:
--Write query to give the total number of employees in each department as given by the department_id column in the hcm.employees table.
SELECT department_id, COUNT(*) AS count_of_emloyees
FROM hcm.employees
GROUP BY department_id


--Challenge 2:
--Write a query to give the average salary in each department as given by the department_id column in the hcm.employees table. Order the query result--by average salary from highest to lowest.Select department_id, AVG(salary) AS avg_salaryFROM hcm.employeesGroup BY department_idORDER BY avg_salary desc--Challenge 3:--Write a query to give the total number of products on hand at each warehouse as given by the warehouse_id column in the oes.inventories table. Also, limit the result
--to only warehouses which have greater than 5,000 product items on hand.

SELECT warehouse_id, SUM(quantity_on_hand) AS total_quantity
FROM oes.inventories
GROUP BY warehouse_id
HAVING SUM(quantity_on_hand) > 5000


--Challenge 4:
--What is the date of the most recent population count at each locality in the bird.antarctic_populations table?

SELECT MAX(date_of_count) AS most_recent_count, locality
FROM bird.antarctic_populations
GROUP BY locality


--Challenge:
--What is the date of the most recent population count for each species at each locality in the bird.antarctic_populations table?
SELECT MAX(date_of_count) AS most_recent_count, locality, species_id
FROM bird.antarctic_populations
GROUP BY locality, species_id
ORDER BY locality



