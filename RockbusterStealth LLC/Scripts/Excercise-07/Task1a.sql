SELECT  C.city,D.country,COUNT(A.customer_id) AS number_of_customers   
FROM customer A
INNER JOIN address B ON A.address_id=B.address_id
INNER JOIN city C ON B.city_id=C.city_id
INNER JOIN country D ON C.country_id=D.country_id
WHERE D.country IN ('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil','Russian Fedaration','Philipines')
GROUP BY C.city,D.country
ORDER BY COUNT(A.customer_id) DESC
LIMIT 10