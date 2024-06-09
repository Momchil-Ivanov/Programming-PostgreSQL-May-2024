BEGIN;

-- Delete dependent rows in the board_games table
DELETE FROM board_games
WHERE publisher_id IN (
    SELECT id FROM publishers
    WHERE address_id IN (
        SELECT id FROM addresses
        WHERE town LIKE 'L%'
    )
);

-- Delete dependent rows in the publishers table
DELETE FROM publishers
WHERE address_id IN (
    SELECT id FROM addresses
    WHERE town LIKE 'L%'
);

-- Delete rows from the addresses table
DELETE FROM addresses
WHERE town LIKE 'L%';

COMMIT;