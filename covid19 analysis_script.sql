use covid19;
select * from covid_deaths;
select * from covid_vaccination;


SELECT *
FROM covid_deaths
order by  continent is Not Null asc;

#### Sorting the data based on Location and Date
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
WHERE continent IS NOT NULL
ORDER BY Location ,date;

####calculating Death percentage b
SELECT location, date, total_cases, total_deaths, round((Total_deaths/total_cases)*100,2) AS Death_Percent
FROM covid_deaths
WHERE location='India'
AND continent IS NOT NULL
ORDER BY 1, 2;
    

###What percentage of population got covid followed by dates accordingly
select location, date, total_cases, population, round((Total_cases/population)*100,2) AS cases_percentage from covid_deaths
where location="India" and continent is not null order by location,date;




### countries with high infection
SELECT location, population, MAX(total_cases) AS Infection_Count, round(MAX((total_cases/population))*100,2) AS Population_Infected_percentage
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY Population_Infected_percentage DESC; 
 
 
 ####Showing continents with the highest Death count per Population

SELECT continent, MAX(total_deaths) AS Total_Death_Count 
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Total_Death_Count DESC;


###Total Deaths Reported 
SELECT SUM(new_deaths) AS 'Total Reported Deaths'
FROM covid_deaths
WHERE continent IS NOT NULL;


####Top 10 Countries reported by covid cases
select location, sum(new_cases) as 'Total' from covid_deaths where continent is not null  group by location order by Total desc limit 10;



####top 10 countries that has highest percentage of infection rate 
SELECT  location, population, MAX(total_cases) AS total_cases, ROUND(MAX((total_cases/population))*100,2) AS Percent_infected
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY  location,population
ORDER BY Percent_infected DESC limit 10;

####Top 10 countries that had most deaths reported
SELECT location, MAX(total_deaths) AS Total_Death 
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY Total_Death DESC limit 10;

####Continent that had the most death reported
SELECT continent, MAX(total_deaths) AS Total_Death 
FROM covid_deaths
WHERE continent is not null
GROUP BY continent
ORDER BY Total_Death DESC;

##Probablity of Deaths from covid from India
SELECT location, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, ROUND(SUM(new_deaths)/SUM(new_cases)*100, 2) AS Death_Percentage
FROM covid_deaths
WHERE location='India'
AND continent IS NOT NULL;

#### How many total vaccination were reported
SELECT SUM(new_vaccinations) AS 'Total Reported Vaccinations'
FROM covid_vaccination
WHERE continent IS NOT NULL;


####Top 10 countries that had highest number of Vaccination
SELECT location, MAX(total_vaccinations) AS Total_Vaccinations 
FROM covid_vaccination
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY Total_Vaccinations DESC limit 10;


####continent that had highest percentage of covid test
SELECT continent, ROUND(AVG(positive_rate), 4) AS Avg_Positive_Rate
FROM covid_vaccination
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Avg_Positive_Rate DESC;