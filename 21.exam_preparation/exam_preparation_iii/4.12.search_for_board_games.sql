CREATE TABLE IF NOT EXISTS search_results (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    release_year INT,
    rating FLOAT,
    category_name VARCHAR(50),
    publisher_name VARCHAR(50),
    min_players VARCHAR(50),
    max_players VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE usp_search_by_category(
	IN category VARCHAR(50)
)
AS
$$
	BEGIN
		TRUNCATE search_results;

		INSERT INTO search_results(
			name,
			release_year,
			rating,
			category_name,
			publisher_name,
			min_players,
			max_players
		)

		SELECT
			bg.name,
			bg.release_year,
			bg.rating,
			cat.name AS category_name,
			pub.name,
			pr.min_players || ' people' AS min_players,
			pr.max_players || ' people' AS max_players
		FROM
			board_games AS bg
		LEFT JOIN publishers AS pub
			ON pub.id = bg.publisher_id
		LEFT JOIN categories AS CAT
			ON CAT.id = bg.category_id
		LEFT JOIN players_ranges AS pr
			ON pr.id = bg.players_range_id
		WHERE
			cat.name = category
		ORDER BY
			pub.name ASC,
			bg.release_year DESC;
		RETURN;
	END;
$$
LANGUAGE plpgsql;