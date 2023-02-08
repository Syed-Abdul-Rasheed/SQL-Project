SELECT AVG(Total_Amount_Paid) AS average
FROM 
(SELECT  A.customer_id,A.first_name,A.last_name,
		D.city,
		E.country,
		SUM(B.amount) AS Total_Amount_Paid   
FROM customer A
INNER JOIN payment B ON A.customer_id=B.customer_id
INNER JOIN address C ON A.address_id=C.address_id
INNER JOIN city D ON C.city_id=D.city_id
INNER JOIN country E ON D.country_id=E.country_id
WHERE D.city IN ('Aurora', 'Pingxiang', 'Nezahualcyotl', 'Kurashiki', 'Dhule(Dhulla)','Xintal', 'Adoni','Celaya','San Bernardino', 'Atlixco' )
GROUP BY A.customer_id, A.first_name, A.last_name, D.city, E.country
ORDER BY SUM(B.amount) DESC
LIMIT 5)AS Total_Amount_Paid
