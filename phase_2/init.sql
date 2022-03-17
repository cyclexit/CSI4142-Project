CREATE SCHEMA [IF NOT EXISTS] CSI4142-Project;
SET search_path = "CSI4142-Project";

CREATE TABLE [IF NOT EXISTS] Country_Dimension(
    country_key int primary key,
    region varchar(255),
    continent varchar(255),
    currency varchar(255),
    capital varchar(255),
    labor_force bigint,
    unemployment_rate float,
    unemployment_rate_female float,
    unemployment_rate_male float,
    poverty_headcount_ratio float,
    age_dependency_ratio float,
    age_dependency_ratio_old float,
    age_dependency_ratio_young float,
    hci float,
    hci_female float,
    hci_male float,
    gni_per_capita_usd float
);

CREATE TABLE [IF NOT EXISTS] Year_Dimension(
    year_key int primary key,
    year_num int,
    decade int
);

CREATE TABLE [IF NOT EXISTS] Population_Dimension(
    population_key int primary,
    life_expectancy_male int,
    life_expectancy_female int,
    birth_rate float,
    death_rate float,
    growth_rate float,
    fertility_rate float,
    total_population bigint,
    urban_population bigint,
    rural_population bigint,
    population_ages_0_to_14 bigint,
    population_ages_15_to_64 bigint,
    population_ages_65_and_above bigint,
);
