SELECT 
    state,
    SUM(registered_users) AS users,
    SUM(app_opens) AS app_opens,
    SUM(app_opens)/SUM(registered_users) AS engagement_ratio
FROM phonepe_users_aggregated
GROUP BY state;