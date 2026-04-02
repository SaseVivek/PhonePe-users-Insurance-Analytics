## facts
## user table

## total users
SELECT SUM(registered_users) AS total_users
FROM phonepe_users_aggregated;

##state wise users
SELECT state, SUM(registered_users) AS users
FROM phonepe_users_aggregated
GROUP BY state
ORDER BY users DESC
LIMIT 10;

##year wise user growth
SELECT year, SUM(registered_users) AS users
FROM phonepe_users_aggregated
GROUP BY year
ORDER BY year;

##quarter wise user trend
SELECT year, quarter, SUM(registered_users) AS users
FROM phonepe_users_aggregated
GROUP BY year, quarter
ORDER BY year, quarter;

##app engagment
SELECT 
    state,
    SUM(app_opens) AS total_opens,
    SUM(registered_users) AS users,
    SUM(app_opens)/SUM(registered_users) AS engagement_ratio
FROM phonepe_users_aggregated
GROUP BY state
ORDER BY engagement_ratio DESC;

## insurance table

##total insurance amount
SELECT SUM(insurance_amount_crore) AS total_insurance
FROM phonepe_insurance_aggregated_india;

##year wise insurance growth
SELECT year, SUM(insurance_amount_crore) AS insurance
FROM phonepe_insurance_aggregated_india
GROUP BY year
ORDER BY year;

##insurance type performance
SELECT insurance_type, SUM(policy_count) AS policies
FROM phonepe_insurance_aggregated_india
GROUP BY insurance_type
ORDER BY policies DESC;

##quarter wise insurance trend
SELECT year, quarter, SUM(insurance_amount_crore) AS insurance
FROM phonepe_insurance_aggregated_india
GROUP BY year, quarter
ORDER BY year, quarter;

##average policy value trend
SELECT year, AVG(avg_policy_value) AS avg_value
FROM phonepe_insurance_aggregated_india
GROUP BY year
ORDER BY year;
