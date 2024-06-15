SELECT
    p.id AS photo_id,
    capture_date,
    description,
    COUNT(c.id) AS comments_count
FROM
    photos AS p
LEFT JOIN
    comments AS c
ON p.id = c.photo_id
WHERE
    description IS NOT NULL
GROUP BY
    p.id,
	p.capture_date,
	p.description
ORDER BY
    comments_count DESC,
	photo_id ASC
LIMIT 3;