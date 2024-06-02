SELECT
	a.name,
	at.animal_type,
	TO_CHAR(a.birthdate::DATE, 'DD.MM.YYYY') AS birthdate
FROM
	animals AS a
LEFT JOIN
	animal_types AS at
ON
	a.animal_type_id = at.id
ORDER BY
	a.name ASC
;