
-- 1. Retrieve top 5 IPOs with highest listing gain
SELECT company_name, listing_gain
FROM ipo_data
ORDER BY listing_gain DESC
LIMIT 5;

-- 2. Average subscription rate per sector
SELECT sector, ROUND(AVG(subscription_rate), 2) AS avg_subscription
FROM ipo_data
GROUP BY sector
ORDER BY avg_subscription DESC;

-- 3. IPOs listed after 2020 with listing gain > 20%
SELECT company_name, listing_date, listing_gain
FROM ipo_data
WHERE listing_date >= '2020-01-01'
AND listing_gain > 20
ORDER BY listing_gain DESC;

-- 4. Sector with highest average listing gain
SELECT sector, ROUND(AVG(listing_gain), 2) AS avg_gain
FROM ipo_data
GROUP BY sector
ORDER BY avg_gain DESC
LIMIT 1;

-- 5. Count IPOs per year
SELECT YEAR(listing_date) AS year, COUNT(*) AS total_ipos
FROM ipo_data
GROUP BY YEAR(listing_date)
ORDER BY year DESC;

-- 6. Companies with issue price above sector average
SELECT company_name, sector, issue_price
FROM ipo_data
WHERE issue_price > (
    SELECT AVG(issue_price)
    FROM ipo_data AS sub
    WHERE sub.sector = ipo_data.sector
)
ORDER BY sector, issue_price DESC;

-- 7. Find IPOs with highest oversubscription ratio
SELECT company_name, ROUND(subscription_rate, 2) AS subscription
FROM ipo_data
ORDER BY subscription DESC
LIMIT 5;

-- 8. Average listing gain per year
SELECT YEAR(listing_date) AS year, ROUND(AVG(listing_gain), 2) AS avg_gain
FROM ipo_data
GROUP BY YEAR(listing_date)
ORDER BY year DESC;

-- 9. IPOs with issue size above overall average
SELECT company_name, issue_size
FROM ipo_data
WHERE issue_size > (SELECT AVG(issue_size) FROM ipo_data)
ORDER BY issue_size DESC;

-- 10. Sector-wise total funds raised
SELECT sector, ROUND(SUM(issue_size), 2) AS total_funds
FROM ipo_data
GROUP BY sector
ORDER BY total_funds DESC;
