SELECT
	CONCAT_WS(' ' || REPEAT('-', 3) || REPEAT ('>', 2) || ' ', elevation, peak_name) AS "Elevation -->> Peak Name"
FROM peaks
WHERE elevation >= 4884;