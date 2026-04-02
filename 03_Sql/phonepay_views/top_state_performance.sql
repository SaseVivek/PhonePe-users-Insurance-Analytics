SELECT 
    u.state,
    SUM(u.registered_users) AS users,
    SUM(i.insurance_amount_crore) AS insurance,
    RANK() OVER (ORDER BY SUM(u.registered_users) DESC) AS rank_users
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.state;