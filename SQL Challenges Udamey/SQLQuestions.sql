--Challenge 1

Select *
From oes.products
WHERE list_price > 100;


--Challenge 2:

SELECT *
FROM oes.orders
WHERE shipped_date IS NULL



--Challenge 3
SELECT *
FROM oes.orders
WHERE order_date = '2020-02-26'


---Fourth Challenge

SELECT *
FROM oes.orders
WHERE order_date >= '20200101'