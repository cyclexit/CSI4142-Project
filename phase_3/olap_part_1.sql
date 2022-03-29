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
 * 
 */
