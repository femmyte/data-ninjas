

# Question 1:
# Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. 
# Only include the id field in the resulting table.

SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

# Question 2:
#  Write a query that returns a list of orders where the standard_qty is zero and either
# the gloss_qty or poster_qty is over 1000.

SELECT *
FROM orders
WHERE standard_qty = 0 
  AND (gloss_qty > 1000 OR poster_qty > 1000);

# Question 3:
# Find all the company names that start with a 'C' or 'W', and where the primary contact
# contains 'ana' or 'Ana', but does not contain 'eana'.

SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
  AND primary_poc NOT LIKE '%eana%';

# Question 4:
# Provide a table that shows the region for each sales rep along with their associated 
# accounts. Your final table should include three columns: the region name, the sales rep 
# name, and the account name. Sort the accounts alphabetically (A-Z) by account name.

SELECT 
    r.name AS region_name,
    sr.name AS sales_rep_name,
    a.name AS account_name
FROM sales_reps sr
JOIN region r ON sr.region_id = r.id
JOIN accounts a ON sr.id = a.sales_rep_id
ORDER BY account_name;


#Insights
#Find the traffic source with the highest customers traffic
SELECT channel, COUNT(channel) 
FROM web_events
GROUP BY channel
ORDER BY 2 DESC;

#Find the region with the highest number of customers
SELECT COUNT(accounts.name) AS account_count, region.name AS region 
FROM accounts
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
GROUP BY region
ORDER BY account_count DESC;

#Find the top ten customers who brought in the highest sales
SELECT accounts.name, SUM(total) as totalAmount
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY accounts.name
ORDER BY totalAmount DESC
LIMIT 10;

#Find the top 10 buying customers
SELECT accounts.name, count(orders.id) as no_of_orders
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
GROUP BY accounts.name
ORDER BY no_of_orders DESC
LIMIT 10;