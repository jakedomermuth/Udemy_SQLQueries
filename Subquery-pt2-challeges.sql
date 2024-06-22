--Background:
--The employee_id column in the oes.orders table gives the employee_id of the
--salesperson who made the sale.
--Challenge:
--Use the NOT IN operator to return all employees who have never been the
--salesperson for any customer order. Include the following columns from
--hcm.employees:
--- employee_id
--- first_name
--- last_nameSELECT employee_id, first_name, last_nameFROM hcm.employeesWHERE employee_id NOT IN(SELECT employee_id 	FROM oes.orders	WHERE employee_id IS NOT NULL )--Challenge:
--Return the same result as challenge 6, except use
--WHERE NOT EXISTS

SELECT e.employee_id, e.first_name, e.last_nameFROM hcm.employees eWHERE NOT EXISTS(SELECT employee_id 	FROM oes.orders o	WHERE o.employee_id = e.employee_id )--Challenge:
--Return unique customers who have ordered the 'PBX Smart Watch 4’.
--Include:
--- customer_id
--- first_name
--- last_name
--- emailSELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email
FROM oes.customers c
WHERE c.customer_id IN 
(SELECT 
	o.customer_id
	FROM oes.orders o
	JOIN oes.order_items oi
	ON oi.order_id = o.order_id
	JOIN oes.products p
	ON p.product_id = oi.product_id
	WHERE p.product_name = 'PBX Smart Watch 4');