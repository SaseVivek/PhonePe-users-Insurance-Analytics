SELECT 
    insurance_type,
    SUM(policy_count) AS policies,
    SUM(insurance_amount_crore) AS insurance,
    AVG(avg_policy_value) AS avg_value
FROM phonepe_insurance_aggregated_india
GROUP BY insurance_type;