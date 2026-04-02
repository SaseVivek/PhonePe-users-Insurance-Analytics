CREATE DATABASE phonepe_project;
USE phonepe_project;

SHOW TABLES;

#########staging
### user data


## null check 

SELECT *
FROM phonepe_users_aggregated
WHERE state IS NULL 
   OR year IS NULL 
   OR registered_users IS NULL;
   
## duplicate check

SELECT state, year, quarter, COUNT(*) AS duplicates
FROM phonepe_users_aggregated
GROUP BY state, year, quarter
HAVING COUNT(*) > 1;

## negative or invalid data

SELECT *
FROM phonepe_users_aggregated
WHERE registered_users < 0 OR app_opens < 0;

## data range validation

SELECT MIN(year) AS min_year, MAX(year) AS max_year
FROM phonepe_users_aggregated;




### insurance
## null check

SELECT *
FROM phonepe_insurance_aggregated_india
WHERE insurance_type IS NULL 
   OR policy_count IS NULL 
   OR insurance_amount_crore IS NULL;
   
## duplicate check 
SELECT year, quarter, insurance_type, COUNT(*) AS duplicates
FROM phonepe_insurance_aggregated_india
GROUP BY year, quarter, insurance_type
HAVING COUNT(*) > 1;

## negative data check 
SELECT *
FROM phonepe_insurance_aggregated_india
WHERE policy_count < 0 OR insurance_amount_crore < 0;

##data range validation 
SELECT MIN(year) AS min_year, MAX(year) AS max_year
FROM phonepe_insurance_aggregated_india;