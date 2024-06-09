SELECT
	i.name AS ingredient_name,
	p.name AS product_name,
	d.name AS distributor_name
FROM
	ingredients AS i
LEFT JOIN distributors AS d
		ON d.id = i.distributor_id
LEFT JOIN products_ingredients AS pi
		ON i.id = pi.ingredient_id
LEFT JOIN products AS p
		ON p.id = pi.product_id
WHERE
	i.name ILIKE 'mustard'
		AND
	d.country_id = 16
ORDER BY
	product_name ASC;