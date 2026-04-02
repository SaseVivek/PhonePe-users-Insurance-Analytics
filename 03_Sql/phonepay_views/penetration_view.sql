SELECT 
    u.year,
    SUM(i.policy_count)/SUM(u.registered_users) AS penetration_rate
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.year;