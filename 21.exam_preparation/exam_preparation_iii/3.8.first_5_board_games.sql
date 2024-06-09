SELECT
	bg.name,
	bg.rating,
	cat.name AS category_name
FROM
	board_games AS bg
LEFT JOIN players_ranges as pr
	ON pr.id = bg.players_range_id
LEFT JOIN categories AS cat
	ON cat.id = bg.category_id
WHERE
    bg.rating > 7.00
    AND (
        bg.name ILIKE '%a%' 
        OR bg.rating > 7.50
    )
    AND pr.min_players >= 2 
    AND pr.max_players <= 5
ORDER BY
	bg.name ASC,
	bg.rating DESC
LIMIT 5;