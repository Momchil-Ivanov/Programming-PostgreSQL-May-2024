SELECT
	CONCAT_WS(' ', cre.first_name, cre.last_name) AS full_name,
	cre.email,
	MAX(bg.rating) AS rating
FROM
	creators AS cre
LEFT JOIN creators_board_games as cbg
	ON cbg.creator_id = cre.id
LEFT JOIN board_games AS bg
	ON bg.id = cbg.board_game_id
WHERE
    cre.email LIKE '%.com'
		AND
	bg.rating IS NOT NULL
GROUP BY
	full_name,
	cre.email
ORDER BY
	full_name ASC;