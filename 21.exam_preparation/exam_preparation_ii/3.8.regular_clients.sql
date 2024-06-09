SELECT 
	cl.full_name,
	COUNT(co.car_id) AS count_of_cars,
	ROUND(SUM(co.bill), 2) AS total_sum
FROM
	clients AS cl
LEFT JOIN
	courses AS co
		ON co.client_id = cl.id
WHERE
	SUBSTRING(full_name FROM 2 FOR 1) = 'a'
GROUP BY
	cl.full_name
HAVING
	COUNT(co.car_id) > 1
ORDER BY
	cl.full_name
;