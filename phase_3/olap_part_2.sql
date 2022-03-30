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
 * Compare the human development index of each country in Asia in 2015 with the
 * average and provide a rank.
 */
select C.country_name,
	C.continent,
	F.human_development_index,
    avg(F.human_development_index) over (partition by C.continent) as continent_avg_hdi,
	rank() over (partition by C.continent order by F.human_development_index desc)
from country_dimension as C,
    year_dimension as Y,
    Fact_Table as F
where F.year_key = Y.year_key
    and F.country_key = C.country_key
    and Y.year_num = 2015
group by (C.country_name, C.continent, F.human_development_index);

/**
 * Part 2. c. Using the Window clause
 * 
 */
