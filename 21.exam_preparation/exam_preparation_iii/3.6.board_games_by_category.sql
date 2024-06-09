SELECT
	bg.id,
	bg.name,
	bg.release_year,
	cat.name AS category_name
FROM
	board_games AS bg
LEFT JOIN categories as cat
	ON cat.id = bg.category_id
WHERE
	cat.name = 'Strategy Games' OR cat.name = 'Wargames'
ORDER BY
	release_year DESC;