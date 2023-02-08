SELECT  D.country,COUNT(DISTINCT A.customer_id) AS all_customer_count,
		COUNT(DISTINCT top_5_customers.customer_id) AS top_customer_count
FROM country D
INNER JOIN city C ON D.country_id=C.country_id
INNER JOIN address B ON C.city_id=B.city_id
INNER JOIN customer A ON B.address_id=A.address_id
LEFT JOIN (SELECT A.customer_id,A.first_name,A.last_name, C.city, D.country,
SUM(E.amount) AS total_Amount_Paid    
FROM customer A
INNER JOIN address B ON A.address_id=B.address_id
INNER JOIN city C ON B.city_id=C.city_id
INNER JOIN country D ON C.country_id=D.country_id
INNER JOIN payment E ON A.customer_id=E.customer_id		   
WHERE C.city IN ('Aurora', 'Pingxiang', 'Nezahualcyotl', 'Kurashiki', 'Dhule(Dhulla)','Xintal', 'Adoni','Celaya','San Bernardino', 'Atlixco' )
GROUP BY A.customer_id, A.first_name, A.last_name, C.city, D.country
ORDER BY  total_Amount_Paid DESC
LIMIT 5)AS top_5_customers
ON D.country= top_5_customers.country
GROUP BY D.country, top_5_customers.country
ORDER BY top_customer_count DESC
LIMIT 5



