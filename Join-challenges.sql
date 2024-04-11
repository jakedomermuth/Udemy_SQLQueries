--Challenge 1: Write a query to return the following attributes for employees who belong to a department:
--- employee_id
--- first_name
--- last_name
--- salary
--- department_name

SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.employees e INNER JOIN hcm.departments d
ON e.department_id = d.department_id


--Challenge 2:Write a query to return the following attributes for all employees, including employees who do not belong to a department:
--- employee_id
--- first_name
--- last_name
--- salary
--- department_name

SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON e.department_id = d.department_id


--Challenge 3: Write a query to return the total number of employees in each department. Include the department_name in the query result. Also, include employees who have not been
--assigned to a department

SELECT COUNT(e.employee_id) as emp_count, d.department_name
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
