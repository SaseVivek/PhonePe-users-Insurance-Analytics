SELECT 
    u.state,
    u.year,
    SUM(u.registered_users) AS users,
    SUM(i.insurance_amount_crore) AS insurance
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.state, u.year;