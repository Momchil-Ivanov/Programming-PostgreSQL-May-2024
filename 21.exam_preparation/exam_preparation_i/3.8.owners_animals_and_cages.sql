SELECT
	v.name as volunteers,
	v.phone_number,
	TRIM(SPLIT_PART(v.address, ', ', 2)) as address
FROM
	volunteers AS v
LEFT JOIN
	volunteers_departments AS vd
ON
	v.department_id = vd.id
WHERE
	vd.department_name = 'Education program assistant'
AND
	v.address LIKE '%Sofia%'
ORDER BY
	volunteers ASC
;