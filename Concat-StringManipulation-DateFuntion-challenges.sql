--Challenge 1:
--Concatenate the first name and last name of each
--employee. Include a single space between the first and
--last name. Name the new expression employee_name.
--Include:
--- employee_id
--- first_name
--- last_name
--- employee_name

SELECT
	employee_id,
	first_name,
	last_name,
	CONCAT(first_name, ' ', last_name) as employee_name
FROM hcm.employees;



--Challenge 2:
--Concatenate the first name, middle name, and last name
--of each employee. Include a single space between each
--of the names. Name the new expression employee_name.
--Include:
--- employee_id
--- first_name
--- last_name
--- employee_nameSELECT	employee_id,	first_name,	last_name,	CONCAT(first_name , ' ' + middle_name, ' ', last_name) as employee_nameFROM hcm.employees;--Using the + guarantees one one space between the names --Challenge 3:
--Extract the genus name from the scientific_name as
--given in the bird.antarctic_species table

SELECT
	scientific_name,
	LEFT(scientific_name, CHARINDEX( ' ', scientific_name) -1) AS Genus_name
FROM bird.antarctic_species;


--Challenge 4:
--Extract the species name from the scientific_name as
--given in the bird.antarctic_species table.
SELECT
	scientific_name,
	SUBSTRING(scientific_name, CHARINDEX( ' ', scientific_name) + 1, len(scientific_name)) AS species_name
FROM bird.antarctic_species;



--Challenge 5:
--Return the age in years for all employees. Name this
--expression as employee_age. Include:
--- employee_id
--- first_name
--- last_name
--- birth_date
--- employee_age



SELECT 
	employee_id,
	first_name,
	last_name,
	birth_date,
	DATEDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) as employee_age
FROM hcm.employees;




--Challenge 6:
--Assuming an estimated shipping date of 7 days after the
--order date, add a column expression called
--estimated_shipping_date for all unshipped orders.
--Include:
--- order_id
--- order_date
--- estimated_shipping_date

SELECT 
	order_id,
	order_date,
	DATEADD(DAY, 7, order_date) as estimated_shipping_date
FROM oes.orders
WHERE shipped_date is null;



--Challenge 7:
--Calculate the average number of days it takes each
--shipping company to ship an order. Call this expression
--avg_shipping_days. Include:
--- company_name
--- avg_shipping_daysSELECT 	s.company_name,	AVG( DATEDIFF(day, o.order_date, o.shipped_date)) as avg_shipping_daysFROM oes.orders o INNER JOIN oes.shippers sON o.shipper_id = s.shipper_idGROUP BY s.company_name;