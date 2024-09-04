/* Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table. */

SELECT id
FROM orders
WHERE gloss_qty > 4000 or poster_qty > 4000;

/* Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000. */

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 or poster_qty > 1000);

-- this is not correct yet
/* Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'. */

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
	AND ( (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
	AND primary_poc NOT LIKE '%eana%');
/* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */

select region.name as region_name, sales_reps.name as sales_rep_name, accounts.name as account_name
from sales_reps
JOIN region ON region.id = sales_reps.region_id JOIN accounts on accounts.sales_rep_id = sales_reps.id
ORDER BY 3;