SELECT
	cre.last_name,
	CEIL(AVG(bg.rating)),
	pub.name AS publisher_name
FROM
	creators AS cre
LEFT JOIN creators_board_games as cbg
	ON cbg.creator_id = cre.id
LEFT JOIN board_games AS bg
	ON bg.id = cbg.board_game_id
LEFT JOIN publishers AS pub
	ON pub.id = bg.publisher_id
WHERE
    cbg.board_game_id IS NOT NULL
		AND
	pub.name = 'Stonemaier Games'
GROUP BY
	cre.last_name,
	publisher_name
ORDER BY
	AVG(bg.rating) DESC;