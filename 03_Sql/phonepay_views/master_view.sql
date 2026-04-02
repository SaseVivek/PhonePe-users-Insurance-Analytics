SELECT 
    u.year,
    u.state,
    u.region,
    SUM(u.registered_users) AS users,
    SUM(u.app_opens) AS app_opens,
    SUM(i.policy_count) AS policies,
    SUM(i.insurance_amount_crore) AS insurance
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.year, u.state, u.region;