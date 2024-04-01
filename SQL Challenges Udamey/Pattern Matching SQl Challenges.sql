--Challenge 1: Select Countries from the hcm.countries table which start with the letter 'N'

SELECT *
FROM hcm.countries
WHERE country_name like 'n%'


--Challenge 2- Select the customers from the oes.customers table who have a gmail email address
SELECT *
FROM oes.customers
WHERE email like '%gmail%'

--Challenge 3: Select product names from the oes.products table which contain the word 'Mouse anywhere within the product name.

Select *
FROM oes.products
WHERE product_name like '%mouse%'

--Challenge 4: Select all product names which end in a number:

Select *
FROM oes.products
WHERE product_name like '%[0-9]'