## views

## master yearly kpi 

SELECT 
    u.year,
    SUM(u.registered_users) AS total_users,
    SUM(u.app_opens) AS total_app_opens,
    SUM(i.policy_count) AS total_policies,
    SUM(i.insurance_amount_crore) AS total_insurance,
    SUM(i.insurance_amount_crore)/SUM(u.registered_users) AS insurance_per_user,
    SUM(u.app_opens)/SUM(u.registered_users) AS engagement_ratio
FROM phonepe_users_aggregated u
JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
GROUP BY u.year;