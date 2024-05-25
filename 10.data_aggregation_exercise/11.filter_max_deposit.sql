SELECT
	magic_wand_creator,
	MAX(deposit_amount) AS max_deposit_amount
FROM
	wizard_deposits
WHERE
	deposit_amount < 20000 OR deposit_amount > 40000
GROUP BY
	magic_wand_creator, deposit_amount
ORDER BY
	deposit_amount DESC
LIMIT 3;