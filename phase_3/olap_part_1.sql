set search_path = "csi4142_project";

/**
 * Part 1. a. Drill down and roll up
 * Drill down query.
 * Get the minimum population growth rate of each country during 2005-2020
 * Drill down on the hierarchy country - region - continent
 */
select C.country_name, MIN(P.growth_rate) as min_growth_rate
from population_dimension as P,
    country_dimension as C,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.population_key = P.population_key
group by (C.country_name)
order by (C.country_name);

/**
 * Part 1. a. Drill down and roll up
 * Roll up query.
 * Get the sum of population of the countries in each continent in each year
 * Roll up on the hierarchy country - region - continent
 */
select C.continent, Y.year_num, SUM(P.total_population) as total_population_of_selected_countries
from country_dimension as C,
    population_dimension as P,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.population_key = P.population_key
group by (C.continent, Y.year_num)
order by (C.continent, Y.year_num);

/**
 * Part 1. b. Slice
 * The basic drinking water accessibility rate of each country in each year.
 * Slice on the life quality dimension. Only choose basic_drinking_water_rate.
 */
select C.country_name, Y.year_num, LQ.basic_drinking_water_rate
from country_dimension as C,
    life_quality_dimension as LQ,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.life_quality_key = LQ.life_quality_key
group by (C.country_name, Y.year_num, LQ.life_quality_key)
order by (C.country_name, Y.year_num);

/**
 * Part 1. c. Dice
 * The first Dice query.
 * The male and female life expectancies in Canada and Mexico in each year.
 * Dice on the population dimension (female and male life expectancies) and country dimension (Canada and Mexico).
 */
select C.country_name, Y.year_num, P.life_expectancy_male, P.life_expectancy_female
from country_dimension as C,
    population_dimension as P,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.population_key = P.population_key
    and C.country_name in ('Canada', 'Mexico')
group by (C.country_name, Y.year_num, P.population_key)
order by (C.country_name, Y.year_num);

/**
 * Part 1. c. Dice
 * The second Dice query.
 * The government health expenditure percentage of gdp in Canada, United States and Mexico
 * between 2010 and 2015.
 * Dice on the health dimension, country dimension and year dimension.
 */
select C.country_name, Y.year_num, H.government_health_expenditure_percent_of_gdp
from country_dimension as C,
    health_dimension as H,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.health_key = H.health_key
    and C.country_name in ('Canada', 'Mexico', 'United States')
    and Y.year_num between 2010 and 2015
group by (C.country_name, Y.year_num, H.health_key)
order by (C.country_name, Y.year_num);

/**
 * Part 1. d. Combining OLAP operations
 * 1st query: Dice and roll-up.
 * The average birth rate in United States and Mexico in 2010's.
 */
select C.country_name, Y.decade, avg(P.birth_rate) as avg_birth_rate
from country_dimension as C,
    population_dimension as P,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.population_key = P.population_key
    and C.country_name in ('Mexico', 'United States')
    and Y.decade = 2010
group by (C.country_name, Y.decade)
order by (C.country_name, Y.decade);

/**
 * Part 1. d. Combining OLAP operations
 * 2nd query: Dice and drill-down
 * The open defecation rate in India and United Stated in each year
 */
select C.country_name, Y.year_num, LQ.open_defecation_rate
from country_dimension as C,
    life_quality_dimension as LQ,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.life_quality_key = LQ.life_quality_key
    and C.country_name in ('India', 'United States')
group by (C.country_name, Y.year_num, LQ.life_quality_key)
order by (C.country_name, Y.year_num, LQ.life_quality_key);


/**
 * Part 1. d. Combining OLAP operations
 * 3rd query: Dice and roll-up
 * The average adult prevalence of overweight in Asia and Americas between 2005 and 2009.
 */
select C.continent, Y.year_num, avg(H.prevalence_of_overweight_adult) as avg_prevalence_of_overweight_adult
from country_dimension as C,
    health_dimension as H,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.health_key = H.health_key
    and C.continent in ('Americas', 'Asia')
    and Y.year_num between 2005 and 2009
group by (C.continent, Y.year_num)
order by (C.continent, Y.year_num);

/**
 * Part 1. d. Combining OLAP operations
 * 4th query:
 * 
 */
