USE covid;

#Selecting first 10 rows of all columns
SELECT * FROM coviddeaths
limit 10;

#Getting the data types of all the columns
DESCRIBE coviddeaths;

SHOW COLUMNS FROM coviexcess_deathsddeaths;

#checking the null values
SELECT COUNT(*) AS amount_of_null_data
FROM coviddeaths 
WHERE start_date IS NULL OR end_date IS NULL OR population IS NULL;

#drop the column region_code 
ALTER TABLE coviddeaths
DROP COLUMN region_code;

#Show top 5 weeks with highest covid_deaths in 2020.
SELECT * FROM coviddeaths 
WHERE country = 'Australia' and year = 2020;

#Show top 5 weeks with highest covid_deaths in 2020.
SELECT week, total_deaths
FROM coviddeaths
WHERE total_deaths>5000;

SELECT week, total_deaths
FROM coviddeaths 
ORDER BY covid_deaths DESC LIMIT 5;

#Listing all unique countries in the dataset.
SELECT DISTINCT country 
FROM coviddeaths;

#Find total covid_deaths in Australia for 2020.
SELECT Sum(total_deaths) as sum_of_total_deaths_in_Australia
FROM coviddeaths
WHERE year = 2020;

#Deaths per country, only if > 50,000
SELECT DISTINCT country, sum(total_deaths)
FROM coviddeaths
GROUP BY country
HAVING Sum(total_deaths)> 50000
ORDER BY sum(total_deaths) DESC;

#Countries starting with A or B
SELECT country
FROM coviddeaths
WHERE country LIKE 'A%'
UNION
SELECT country
FROM coviddeaths
WHERE country LIKE 'B%';

SELECT country, SUM(total_deaths) AS deaths
FROM coviddeaths
group by country 
HAVING SUM(total_deaths)>
(
  SELECT AVG(total_deaths)
  FROM coviddeaths
  ); 
  
#Sometimes population comes in 3E+07 (scientific notation).CAST converts it into a standard integer for calculations.
SELECT country, CAST(population AS UNSIGNED) AS clean_population
FROM coviddeaths;

#Cumulative covid deaths over time (per country)
SELECT country, year, week,
       SUM(covid_deaths) OVER (PARTITION BY country ORDER BY year, week) AS cumulative_deaths
FROM coviddeaths;

#Covid vs non-covid deaths in 2020
SELECT country,
       SUM(covid_deaths) AS total_covid_deaths,
       SUM(non_covid_deaths) AS total_non_covid_deaths,
       CASE
           WHEN SUM(covid_deaths) > SUM(non_covid_deaths) THEN 'More Covid Deaths'
           ELSE 'More Non-Covid Deaths'
       END AS comparison
FROM coviddeaths
WHERE year = 2020
GROUP BY country;

#Average excess deaths % change per region (2020)
SELECT region,
       ROUND(AVG(excess_deaths_pct_change), 2) AS avg_excess_pct
FROM coviddeaths
WHERE year = 2020
GROUP BY region
ORDER BY avg_excess_pct DESC;

#Countries where expected deaths > actual total deaths (2020)
SELECT country,
       SUM(total_deaths) AS total_actual,
       SUM(expected_deaths) AS total_expected
FROM coviddeaths
WHERE year = 2020
GROUP BY country
HAVING SUM(expected_deaths) > SUM(total_deaths);

#Mortality rate per 100,000 in 2020 (top 10 countries)
SELECT country,
       (SUM(covid_deaths) / population) * 100000 AS mortality_rate_per_100k
FROM coviddeaths
WHERE year = 2020
GROUP BY country, population
ORDER BY mortality_rate_per_100k DESC
LIMIT 10;

