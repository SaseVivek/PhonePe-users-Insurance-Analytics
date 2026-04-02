SELECT 
    u.state,
    SUM(u.registered_users) AS users,
    SUM(i.policy_count) AS policies,
    SUM(u.registered_users) - SUM(i.policy_count) AS opportunity
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.state;