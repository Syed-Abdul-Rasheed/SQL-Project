WITH category_name_cte(film_id, rating, category_name) AS
(SELECT A.film_id,
       A.rating,
       C.name
FROM film A
LEFT JOIN film_category B ON A.film_id = B.film_id
LEFT JOIN category C ON B.category_id = C.category_id)
SELECT rating,
       category_name,
	   COUNT(film_id)AS cnts
FROM category_name_cte
GROUP BY 1,
		 2
ORDER BY rating,
         cnts DESC

