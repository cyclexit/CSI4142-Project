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

CREATE TABLE [IF NOT EXISTS] Event_Dimension(
    event_key int primary key,
    event_name varchar(255),
    event_description varchar(255),
    event_outcome varchar(255),
    event_start_date date,
    event_end_date date,
);

CREATE TABLE [IF NOT EXISTS] Education_Dimension(
    education_key int primary key,
    public_spending_percent_of_gdp float,
    literacy_rate_total float,
    literacy_rate_male float,
    literacy_rate_female float,
    primary_school_enrollment_percent_of_gross float,
    secondary_school_enrollment_percent_of_gross float,
    tertiary_school_enrollment_percent_of_gross float
);

