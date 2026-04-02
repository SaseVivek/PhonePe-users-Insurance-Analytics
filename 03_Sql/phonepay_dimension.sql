SHOW TABLES;

## Dimension

#unique state and region
SELECT DISTINCT state, region
FROM phonepe_users_aggregated
ORDER BY state;

##unique years(users)
SELECT DISTINCT year
FROM phonepe_users_aggregated
ORDER BY year;

##unique years(insurance)
SELECT DISTINCT year
FROM phonepe_insurance_aggregated_india
ORDER BY year;

##combined years
SELECT DISTINCT year FROM phonepe_users_aggregated
UNION
SELECT DISTINCT year FROM phonepe_insurance_aggregated_india
ORDER BY year;

##unique quarter
SELECT DISTINCT quarter
FROM phonepe_users_aggregated
ORDER BY quarter;

##unique insurance type 
SELECT DISTINCT insurance_type
FROM phonepe_insurance_aggregated_india;

##region wise state count
SELECT region, COUNT(DISTINCT state) AS total_states
FROM phonepe_users_aggregated
GROUP BY region;

##time combination
SELECT DISTINCT year, quarter
FROM phonepe_users_aggregated
ORDER BY year, quarter;

##insurance type per year
SELECT year, COUNT(DISTINCT insurance_type) AS total_types
FROM phonepe_insurance_aggregated_india
GROUP BY year
ORDER BY year;

##time alignment
SELECT u.year, u.quarter
FROM phonepe_users_aggregated u
LEFT JOIN phonepe_insurance_aggregated_india i
ON u.year = i.year AND u.quarter = i.quarter
WHERE i.year IS NULL;