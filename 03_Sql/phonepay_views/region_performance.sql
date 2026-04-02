SELECT 
    u.region,
    SUM(u.registered_users) AS users,
    SUM(i.insurance_amount_crore) AS insurance,
    SUM(i.policy_count) AS policies
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.region;