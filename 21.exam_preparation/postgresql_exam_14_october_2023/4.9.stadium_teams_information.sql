CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))
RETURNS TABLE (fn_stadium_team_name VARCHAR) AS
$$
	BEGIN
		RETURN QUERY
			SELECT
				t.name AS fn_stadium_team_name
			FROM
				stadiums AS s
			LEFT JOIN teams AS t
					ON s.id = t.stadium_id
			WHERE
				s.name = stadium_name
			ORDER BY
				t.name ASC;
	END;
$$
LANGUAGE plpgsql
;