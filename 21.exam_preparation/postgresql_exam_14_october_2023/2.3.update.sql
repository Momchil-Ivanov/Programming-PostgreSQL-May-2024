UPDATE coaches AS c
SET salary = c.salary * c.coach_level
FROM players_coaches AS pc
WHERE
	c.first_name LIKE 'C%'
	AND c.id = pc.coach_id