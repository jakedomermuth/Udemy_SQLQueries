--Challenge 1:
--Write a query to return employee details for all employees as
--well as the first and last name of each employee's manager.
--Include the following columns:
-- employee_id
-- first_name
-- last_name
-- manager_first_name (alias for first_name)
-- manager_last_name (alias for last_name)

SELECT e.employee_id, 
e.first_name,
e.last_name,
e2.first_name as Manager_first_name,
e2.last_name as Manager_last_name
From hcm.employees e LEFT OUTER JOIN hcm.employees e2
ON e.manager_id = e2.employee_id


--Challenge 2:
--Write a query to return all the products at each warehouse.
--Include the following attributes:
--- product_id
--- product_name
--- warehouse_id
--- warehouse_name
--- quantity_on_hand


SELECT 
p.product_id,
p.product_name,
w.warehouse_id,
w.warehouse_name,
i.quantity_on_hand
FROM oes.products p
INNER JOIN oes.inventories i
ON i.product_id = p.product_id
INNER JOIN oes.warehouses w
ON w.warehouse_id = i.warehouse_id


--Challenge 3:
--Write a query to return the following attributes for all
--employees from Australia:
--- employee_id
--- first_name
--- last_name
--- department_name
--- job_title
--- state_province


SELECT
 e.employee_id,
 e.first_name,
 e.last_name,
 d.department_name,
 j.job_title,
 e.state_province
 FROM hcm.employees e 
 LEFT JOIN hcm.departments d
 ON e.department_id = d.department_id
 INNER JOIN hcm.jobs j
 ON e.job_id = j.job_id
 INNER JOIN hcm.countries c
 ON e.country_id =c.country_id
 WHERE c.country_name = 'Australia'


-- Challenge 4:
--Return the total quantity ordered of each product in each
--category. Do not include products which have never
--been ordered. Include the product name and category
--name in the query. Order the results by category name
--from A to Z and then within each category name order
--by product name from A to Z

SELECT 
sum(o.quantity) as total_quantity,
pc.category_name,
p.product_name
FROM oes.products p 
INNER JOIN oes.product_categories pc
ON p.category_id = pc.category_id
INNER JOIN oes.order_items o
ON p.product_id = o.product_id
WHERE quantity > 0
GROUP BY pc.category_name, p.product_name
ORDER BY category_name, product_name


--Challenge 5:
--Return the total quantity ordered of each product in each
--category. Include products which have never been
--ordered and give these a total quantity ordered of 0.
--Include the product name and category name in the
--query. Order the results by category name from A to Z
--and then within each category name order by product
--name from A to Z.


SELECT 
COALESCE(sum(o.quantity), 0),
pc.category_name,
p.product_name
FROM oes.products p 
LEFT OUTER JOIN oes.product_categories pc
ON p.category_id = pc.category_id
LEFT OUTER JOIN oes.order_items o
ON p.product_id = o.product_id
WHERE quantity > 0
GROUP BY pc.category_name, p.product_name
ORDER BY category_name, product_name
