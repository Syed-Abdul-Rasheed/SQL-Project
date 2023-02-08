SELECT  A.customer_id,
	    A.first_name,
		A.last_name,
		D.city,
		E.country,
		COUNT(C.amount) AS Total Amount Paid   
FROM customer A
INNER JOIN payment B ON A.customer_id=B.customer_id
INNER JOIN address C ON A.address_id=C.address_id
INNER JOIN city D ON C.city_id=D.city_id
INNER JOIN country E ON D.country_id=E.country_id
WHERE D.country IN ('India', 'China', 'United States', 'Japan', 'Mexico')
GROUP BY C.city,D.country
ORDER BY COUNT(A.customer_id) DESC
LIMIT 10