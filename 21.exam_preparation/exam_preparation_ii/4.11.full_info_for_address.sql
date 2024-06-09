CREATE TABLE IF NOT EXISTS search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
	IN address_name VARCHAR(100)
)
AS
$$
	BEGIN
		TRUNCATE search_results;

		INSERT INTO search_results(
			address_name,
			full_name,
			level_of_bill,
			make,
			condition,
			category_name
		)
		SELECT
			ad.name AS address_name,
			cl.full_name,
			CASE
	            WHEN co.bill <= 20 THEN 'Low'
	            WHEN co.bill <= 30 THEN 'Medium'
            	ELSE 'High'
        	END AS level_of_bill,
			car.make,
			car.condition,
			cat.name AS category_name
		FROM
			courses AS co
		LEFT JOIN addresses AS ad
				ON ad.id = co.from_address_id
		LEFT JOIN clients AS cl
				ON cl.id = co.client_id
		LEFT JOIN cars AS car
			ON car.id = co.car_id
		LEFT JOIN categories as cat
			ON cat.id = car.category_id
		WHERE
			ad.name = address_name
		ORDER BY
			car.make ASC,
			cl.full_name ASC;	
	END;
$$
LANGUAGE plpgsql;