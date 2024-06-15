CREATE OR REPLACE PROCEDURE udp_modify_account(
    IN address_street VARCHAR(30),
    IN address_town VARCHAR(30)
)
LANGUAGE plpgsql
AS
$$
DECLARE
    account_id INTEGER;
    current_job_title VARCHAR(40);
    new_job_title VARCHAR(40);
BEGIN
    SELECT
		a.id
	INTO
		account_id
    FROM
		accounts AS a
    JOIN addresses AS ad
		ON a.id = ad.account_id
    WHERE ad.street = address_street
      AND ad.town = address_town;

    IF account_id IS NOT NULL THEN
        SELECT
			job_title
		INTO
			current_job_title
        FROM
			accounts
        WHERE
			id = account_id;

        new_job_title := '(Remote) ' || current_job_title;

        UPDATE accounts
        SET job_title = new_job_title
        WHERE
			id = account_id;
    END IF;
END;
$$
;