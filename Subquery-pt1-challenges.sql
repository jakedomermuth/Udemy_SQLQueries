--Challenge 1:
--Return the following product details for the cheapest
--product(s) in the oes.products table:
--- product_id
--- product_name
--- list_price
--- category_id


SELECT product_id,
	product_name,
	list_price,
	category_id
FROM oes.products
WHERE list_price IN (SELECT MIN(list_price) as min_price
					FROM oes.products
					Group By category_id)
Order BY list_price




--Challenge 2:
--Use a correlated subquery to return the following product
--details for the cheapest product(s) in each product category
--as given by the category_id column:
--- product_id
--- product_name
--- list_price
--- category_id
--Return the same result as challenge 2 i.e. the cheapest
--product(s) in each product category except this time by
--using an inner join to a derived table.



SELECT p1.product_id,
	p1.product_name,
	p1.list_price,
	p1.category_id
FROM oes.products p1
INNER JOIN (SELECT MIN(list_price) as min_price, 
					category_id
			FROM oes.products
			Group By category_id) p2
ON p1.category_id = p2.category_id
AND p1.list_price = p2.min_price



--Challenge 4:
--Return the same result as challenge 2 and 3 i.e. the
--cheapest product(s) in each product category except this
--time by using a common table expression.