SELECT 
    year,
    SUM(insurance_amount_crore) AS insurance,
    LAG(SUM(insurance_amount_crore)) OVER (ORDER BY year) AS prev,
    (SUM(insurance_amount_crore) - LAG(SUM(insurance_amount_crore)) OVER (ORDER BY year)) AS growth
FROM phonepe_insurance_aggregated_india
GROUP BY year;