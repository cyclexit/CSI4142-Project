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
select C.continent, Y.year_num, SUM(P.total_population)
from country_dimension as C,
    population_dimension as P,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and F.population_key = P.population_key
group by (C.continent, Y.year_num)
order by (C.continent, Y.year_num);