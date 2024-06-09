CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(product_name VARCHAR(25))
RETURNS TABLE (
    customer_id INT,
    customer_name VARCHAR,
    feedback_description VARCHAR,
    feedback_rate NUMERIC(4, 2)
) AS
$$
BEGIN
    RETURN QUERY
        SELECT
            c.id AS customer_id,
            c.first_name AS customer_name,
            f.description AS feedback_description,
            f.rate AS feedback_rate
        FROM
            customers AS c
        LEFT JOIN feedbacks AS f
                ON c.id = f.customer_id
        LEFT JOIN products AS p
                ON p.id = f.product_id
        WHERE
            p.name = product_name
        ORDER BY
            c.id ASC;
END;
$$
LANGUAGE plpgsql;