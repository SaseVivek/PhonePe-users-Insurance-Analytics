SELECT 
    year,
    SUM(registered_users) AS users,
    LAG(SUM(registered_users)) OVER (ORDER BY year) AS prev_users,
    (SUM(registered_users) - LAG(SUM(registered_users)) OVER (ORDER BY year)) AS growth
FROM phonepe_users_aggregated
GROUP BY year;