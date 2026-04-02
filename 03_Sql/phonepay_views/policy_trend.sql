SELECT 
    year,
    SUM(policy_count) AS policies
FROM phonepe_insurance_aggregated_india
GROUP BY year;