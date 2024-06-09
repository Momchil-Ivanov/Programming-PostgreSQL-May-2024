CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS varchar AS
$$
	BEGIN
		RETURN(
			SELECT
				COUNT(co.id)
			FROM
				clients AS cl
			LEFT JOIN courses AS co
				ON co.client_id = cl.id
			WHERE
				cl.phone_number = phone_num
			);
	END;
$$
LANGUAGE plpgsql
;

SELECT fn_courses_by_client('(803) 6386812');
SELECT fn_courses_by_client('(831) 1391236');
SELECT fn_courses_by_client('(704) 2502909')