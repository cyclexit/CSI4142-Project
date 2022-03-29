set search_path = "csi4142_project";

/**
 * Part 2. a. Iceberg query
 * Top 3 countries with the highest average human development index in 2010's
 */
select C.country_name, Y.decade, avg(F.human_development_index) as avg_hdi
from country_dimension as C,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and Y.decade = 2010
group by (C.country_name, Y.decade)
order by avg(F.human_development_index) desc
limit 3;

/**
 * Part 2. b. Windowing query
 * 
 */


/**
 * Part 2. c. Using the Window clause
 * 
 */
