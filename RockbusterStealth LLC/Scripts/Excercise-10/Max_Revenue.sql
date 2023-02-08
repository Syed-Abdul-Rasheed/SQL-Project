SELECT A.title,SUM(amount) AS total_revenue
FROM Film A
INNER JOIN inventory B ON A.film_id=B.film_id
INNER JOIN rental C ON B.inventory_id=C.inventory_id
INNER JOIN payment D ON C.rental_id=D.rental_id
GROUP BY title
ORDER BY total_revenue DESC
LIMIT 5