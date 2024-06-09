SELECT
	CONCAT_WS(' ', c.first_name, c.last_name) AS coach_full_name,
	CONCAT_WS(' ', p.first_name, p.last_name) AS player_full_name,
	t.name AS team_name,
	sd.passing,
	sd.shooting,
	sd.speed
FROM
	coaches AS c
LEFT JOIN players_coaches AS pc
		ON c.id = pc.coach_id
LEFT JOIN players AS p
		ON p.id = pc.player_id
LEFT JOIN skills_data AS sd
		ON sd.id = p.skills_data_id
LEFT JOIN teams AS t
		ON t.id = p.team_id
WHERE
	t.name IS NOT NULL
ORDER BY
	coach_full_name ASC,
	player_full_name DESC;