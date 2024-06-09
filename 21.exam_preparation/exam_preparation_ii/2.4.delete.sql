DELETE FROM clients
WHERE LENGTH(full_name) > 3
AND id not IN (
    SELECT client_id FROM courses
);