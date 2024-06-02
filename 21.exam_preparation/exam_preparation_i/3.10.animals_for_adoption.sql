SELECT
	a.name AS animal,
	TO_CHAR(a.birthdate::DATE,'YYYY') AS birth_year,
	at.animal_type
FROM
	animals AS a
JOIN
	animal_types AS at
ON
	a.animal_type_id = at.id
WHERE
	a.owner_id IS NULL
AND
	at.animal_type NOT LIKE 'Birds'
AND
	a.birthdate BETWEEN '01/01/2017' AND '12/31/2022'
ORDER BY
	a.name ASC
;