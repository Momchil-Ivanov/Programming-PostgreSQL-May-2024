UPDATE animals
SET owner_id = (SELECT id FROM owners where name = 'Kaloqn Stoqnov')
WHERE owner_id IS NULL;