SELECT
	o.name AS owner,
	COUNT(a.name) AS count_of_animals
FROM
	owners AS o
LEFT JOIN
	animals AS a
ON
	o.id = a.owner_id
GROUP BY
	owner
ORDER BY
	count_of_animals DESC,
	owner ASC
LIMIT 5
;