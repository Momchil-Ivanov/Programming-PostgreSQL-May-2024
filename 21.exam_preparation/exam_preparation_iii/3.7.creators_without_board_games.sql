SELECT
	cre.id,
	CONCAT_WS(' ', cre.first_name, cre.last_name) AS creator_name,
	cre.email
FROM
	creators as cre
LEFT JOIN creators_board_games as cbg
	ON cre.id = cbg.creator_id
WHERE
	cbg.board_game_id IS NULL
ORDER BY
	creator_name ASC;