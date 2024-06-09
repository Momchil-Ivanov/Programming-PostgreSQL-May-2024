CREATE OR REPLACE FUNCTION fn_creator_with_board_games(first_name_input VARCHAR(30))
RETURNS VARCHAR AS
$$
	BEGIN
		RETURN(
			SELECT
				COUNT(cbg.board_game_id)
			FROM
				creators AS cre
			LEFT JOIN creators_board_games AS cbg
				ON cre.id = cbg.creator_id
			WHERE
				cre.first_name = first_name_input
			);
	END;
$$
LANGUAGE plpgsql
;

SELECT fn_creator_with_board_games('Bruno')