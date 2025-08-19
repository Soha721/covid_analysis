🦠 COVID-19 SQL Analysis

This project is an end-to-end SQL analysis of COVID-19 deaths and mortality trends using MySQL. It focuses on exploring global death patterns, comparing covid vs non-covid deaths, and calculating metrics like mortality rate and excess deaths.

📂 Dataset

Data contains columns such as:

country – country name

region – region name

start_date, end_date, year, week – time-related info

population – country’s population

total_de – total deaths

covid_de – covid deaths

expected_de – expected deaths (baseline)

excess_de – excess deaths (difference between actual and expected)

non_covid_de – deaths not caused by covid

excess_deaths_pct_change – percentage change of excess deaths

⚠️ Dataset source: [Add source here – e.g., WHO / Kaggle link]

📝 Questions Answered

The SQL queries cover a wide range of analysis:

Show first 10 rows and dataset structure

Check column names and data types

Count missing/null values

Drop unnecessary column (region_code)

Show top 5 weeks with highest covid deaths

List all unique countries

Find total covid deaths in Australia (2020)

Deaths per country (only if > 50,000)

Countries starting with A or B

Countries with deaths higher than the global average

Clean population column (remove scientific notation)

Cumulative covid deaths over time (per country)

Covid vs Non-Covid deaths (comparison)

Average excess deaths % change per region (2020)

Countries where expected deaths > actual deaths (2020)

Mortality rate per 100,000 (Top 10 countries)

📊 Example Insights

Some countries had higher non-covid deaths than covid deaths.

Excess mortality varied widely by region, with some reporting negative excess deaths.

Mortality rate per 100k revealed unexpectedly high rates in smaller population countries.

🚀 How to Run

Import the dataset into MySQL:

USE covid;


Run queries from covid_analysis.sql.

Modify queries for your own exploration.

📌 Project Files

covid_analysis.sql → SQL queries for analysis

coviddeaths.csv → dataset (if included, otherwise link in README)

README.md → documentation

📈 Skills Demonstrated

SQL basics (SELECT, WHERE, GROUP BY, HAVING, ORDER BY)

Window functions (cumulative sums)

Data cleaning (handling nulls, casting types)

Aggregation and filtering

Real-world analysis on global health data
