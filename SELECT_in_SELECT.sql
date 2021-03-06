 /*1. List each country name where the population is larger than that of 'Russia'.*/

SELECT name FROM world WHERE gdp/population > (SELECT gdp/population FROM world WHERE name ='Russia');


 /*2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/
 
SELECT name FROM world WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe';
 
 
 /*3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.*/
  
SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina','Australia')) ORDER BY name;
 
 
 /*4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.*/
  
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'canada') AND population < (SELECT population FROM world WHERE name = 'poland');


 /*5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.*/
 




 /*6. Which countries have a GDP greater than every country in Europe?*/
 
SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL);


 /*7. Find the largest country (by area) in each continent, show the continent, the name and the area:*/
 
SELECT continent, name, area FROM world WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent);


 /*8. List each continent and the name of the country that comes first alphabetically.*/
 
SELECT continent, MIN(name) FROM world GROUP BY continent;


 /*9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.*/

SELECT name, continent, population FROM world WHERE continent NOT IN (SELECT continent FROM world WHERE population > 25000000);


 /*10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.*/
 
 