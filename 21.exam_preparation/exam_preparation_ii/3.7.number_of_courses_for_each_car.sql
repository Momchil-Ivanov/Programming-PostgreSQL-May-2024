SELECT 
	c.id,
	c.make,
	c.mileage,
	COUNT(co.car_id) AS count_of_courses,
	ROUND(AVG(co.bill), 2) AS average_bill
FROM
	cars AS c
LEFT JOIN
	courses AS co
		ON co.car_id = c.id
GROUP BY
	c.id
HAVING
	COUNT(co.car_id) != 2
ORDER BY
	count_of_courses DESC,
	c.id
;