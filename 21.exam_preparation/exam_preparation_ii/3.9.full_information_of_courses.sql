SELECT 
	ad.name,
	CASE
		WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
	        ELSE 'Night'
    END AS day_time,
	co.bill,
	cl.full_name,
	cr.make,
	cr.model,
	ca.name AS category_name
FROM
	courses AS co
LEFT JOIN
	clients AS cl	
		ON cl.id = co.client_id
LEFT JOIN
	cars AS cr
		ON cr.id = co.car_id
LEFT JOIN
	categories AS ca
		ON ca.id = cr.category_id
LEFT JOIN
	addresses AS ad
		ON ad.id = co.from_address_id
ORDER BY
	co.id ASC
;