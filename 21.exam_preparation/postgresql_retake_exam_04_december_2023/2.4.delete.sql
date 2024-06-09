-- Delete distributor and related records
DELETE FROM distributors
WHERE name LIKE 'L%';

-- Delete related records from ingredients table
DELETE FROM ingredients
WHERE distributor_id IN (
    SELECT id
    FROM distributors
    WHERE name LIKE 'L%'
);

-- Delete related records from products_ingredients table
DELETE FROM products_ingredients
WHERE ingredient_id IN (
    SELECT id
    FROM ingredients
    WHERE distributor_id IN (
        SELECT id
        FROM distributors
        WHERE name LIKE 'L%'
    )
);