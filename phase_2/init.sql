CREATE SCHEMA CSI4142_Project;
SET search_path = "CSI4142_Project";

CREATE TABLE Country_Dimension(
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

CREATE TABLE Year_Dimension(
    year_key int primary key,
    year_num int,
    decade int
);

CREATE TABLE Population_Dimension(
    population_key int primary key,
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
    population_ages_65_and_above bigint
);

CREATE TABLE Event_Dimension(
    event_key int primary key,
    event_name varchar(255),
    event_description varchar(255),
    event_outcome varchar(255),
    event_start_date date,
    event_end_date date
);

CREATE TABLE Education_Dimension(
    education_key int primary key,
    public_spending_percent_of_gdp float,
    literacy_rate_adult_total float,
    literacy_rate_adult_male float,
    literacy_rate_adult_female float,
    primary_school_enrollment_percent_of_gross float,
    primary_school_enrollment_percent_of_net float,
    primary_completion_rate float,
    primary_completion_male float,
    primary_completion_female float,
    secondary_school_enrollment_percent_of_gross float,
    secondary_school_enrollment_percent_of_net float,
    tertiary_school_enrollment_percent_of_gross float
);

CREATE TABLE Life_Quality_Dimension(
    life_quality_key int primary key,
    basic_drinking_water_rate float,
    basic_drinking_water_rate_rural float,
    basic_drinking_water_rate_urban float,
    safe_drinking_water_rate float,
    safe_drinking_water_rate_rural float,
    safe_drinking_water_rate_urban float,
    basic_handwashing_facilities_rate float,
    basic_handwashing_facilities_rate_rural float,
    basic_handwashing_facilities_rate_urban float,
    open_defecation_rate float,
    open_defecation_rate_rural float,
    open_defecation_rate_urban float
);

CREATE TABLE Health_Dimension(
    health_key int primary key,
    capital_health_expenditure_percent_of_gdp float,
    current_health_expenditure_percent_of_gdp float,
    government_health_expenditure_percent_of_gdp float,
    community_health_workers_per_1000 int,
    prevalence_of_hiv float,
    prevalence_of_hiv_male float,
    prevalence_of_hiv_female float,
    adults_with_hiv int,
    children_with_hiv int,
    prevalence_of_overweight_adult float,
    prevalence_of_overweight_children_under_5 float,
    prevalence_of_severe_wasting_children_under_5 float,
    prevalence_of_stunting_children_under_5 float,
    prevalence_of_undernourishment float,
    hospital_beds_per_1000 float,
    physicians_per_1000 float,
    number_of_stillbirths int
);

CREATE TABLE FACT_TABLE(
    country_key int,
    year_key int,
    education_key int,
    health_key int,
    life_quality_key int,
    population_key int,
    event_key int,
    quality_of_life_index float,
    development_index int,
    human_development_index float
);
