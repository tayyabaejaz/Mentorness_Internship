SELECT * FROM mentorness_task2.`corona virus dataset`;

-- Q1:Write a code to check NULL values--

SELECT *
FROM mentorness_task2.`corona virus dataset`
WHERE Province IS NULL
   OR Latitude IS NULL
   OR Date IS NULL
   OR Confirmed IS NULL
   OR Deaths IS NULL
   OR Recovered IS NULL
   OR Longitude IS NULL;  
   
-- Q2:If NULL values are present, update them with zeros for all columns.
-- there are no NULL values present in the dataset 

-- Q3. check total number of rows
SELECT COUNT(*) AS total_rows
FROM mentorness_task2.`corona virus dataset`;

-- Q4. Check what is start_date and end_date
SELECT  
MAX(date) AS start_date,
MIN(date) AS end_date
from mentorness_task2.`corona virus dataset`;


-- Q5. Number of month present in dataset
SELECT DISTINCT CONCAT(YEAR(Date), '-', MONTH(Date)) AS month
FROM mentorness_task2.`corona virus dataset`
ORDER BY month;

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM
    mentorness_task2.`corona virus dataset`
WHERE
    YEAR(Date) = 2020
GROUP BY
    YEAR(Date), MONTH(Date)
ORDER BY
    year, month;

-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT
    YEAR(Date) AS year,
    MIN(Confirmed) AS min_confirmed,
    MIN(Deaths) AS min_deaths,
    MIN(Recovered) AS min_recovered
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    YEAR(Date);
    
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT
    YEAR(Date) AS year,
    MAX(Confirmed) AS min_confirmed,
    MAX(Deaths) AS min_deaths,
    MAX(Recovered) AS min_recovered
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    YEAR(Date);

    
-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    SUM(Confirmed) AS total_confirmed,
    SUM(Deaths) AS total_deaths,
    SUM(Recovered) AS total_recovered
FROM
    mentorness_task2.`corona virus dataset`
WHERE
    YEAR(Date) = 2020 or 2021
GROUP BY
    YEAR(Date), MONTH(Date)
ORDER BY
    year, month;


-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
    Country,
    SUM(Confirmed) AS total_confirmed,
    AVG(Confirmed) AS avg_confirmed,
    VAR_SAMP(Confirmed) AS variance_confirmed,
    STDDEV_SAMP(Confirmed) AS stddev_confirmed
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    Country;



-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	YEAR(Date) AS year,
    MONTH(Date) AS month,
    SUM(Deaths) AS total_deaths,
    AVG(Deaths) AS avg_deaths,
    VAR_SAMP(Deaths) AS variance_deaths,
    STDDEV_SAMP(Deaths) AS stddev_deaths
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    YEAR(Date), MONTH(Date)
ORDER BY
    year, month;

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
    Country,
    SUM(Recovered) AS total_Recovered,
    AVG(Recovered) AS avg_Recovered,
    VAR_SAMP(Recovered) AS variance_Recovered,
    STDDEV_SAMP(Recovered) AS stddev_Recovered
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    Country;

-- Q14. Find Country having highest number of the Confirmed case
SELECT
    Country,
    SUM(Confirmed) AS total_confirmed
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    Country
ORDER BY
    total_confirmed DESC
LIMIT 1;

-- Q15. Find Country having lowest number of the death case
SELECT
    Country,
    SUM(Deaths) AS total_deaths
FROM
    mentorness_task2.`corona virus dataset`
GROUP BY
    Country
ORDER BY
    total_deaths ASC;





-- Q16. Find top 5 countries having highest recovered case
SELECT
    Country,
    Recovered
FROM
    mentorness_task2.`corona virus dataset`
ORDER BY
    Recovered DESC
LIMIT 4;

