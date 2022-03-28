set search_path = "csi4142_project";

/**
 * Part 1. a. Drill down and roll up
 * Drill down query.
 * Get the minimum population growth rate of each country during 2005-2020
 * Drill down on the hierarchy country - region - continent
 */
select C.country_name, MIN(P.growth_rate)
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
 * Drill down query.
 * Get the minimum population growth rate of each country during 2005-2020
 * Drill down on the hierarchy country - region - continent
 */
