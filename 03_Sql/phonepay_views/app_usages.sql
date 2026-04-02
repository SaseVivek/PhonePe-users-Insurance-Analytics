SELECT 
    year,
    SUM(app_opens) AS app_opens
FROM phonepe_users_aggregated
GROUP BY year;