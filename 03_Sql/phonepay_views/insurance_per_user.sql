SELECT 
    u.year,
    SUM(i.insurance_amount_crore)/SUM(u.registered_users) AS insurance_per_user
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.year;