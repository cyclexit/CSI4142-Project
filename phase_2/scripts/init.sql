CREATE SCHEMA IF NOT EXISTS csi4142_project;
SET search_path = "csi4142_project";

CREATE TABLE IF NOT EXISTS Country_Dimension(
    country_key int primary key,
    country_name varchar(255),
    country_code varchar(3),
    two_alpha_code varchar(2),
    capital varchar(255),
    region varchar(255),
    continent varchar(255),
    currency varchar(255),
    income_group varchar(255),
    system_of_trade varchar(255),
    government_accounting_concept varchar(255),
    balance_of_payments_manual_in_use varchar(255),
    IMF_data_dissemination_standard	varchar(255)
);

CREATE TABLE IF NOT EXISTS Year_Dimension(
    year_key int primary key,
    year_num int,
    decade int
);

CREATE TABLE IF NOT EXISTS Population_Dimension(
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

CREATE TABLE IF NOT EXISTS Event_Dimension(
    event_key int primary key,
    system varchar(255),
    finite_term_in_office boolean,
    years_in_power int,
    party_orientation varchar(255),
    party_name varchar(255),
    years_since_party_formation int,
    control_all_houses boolean,
    election_in_year boolean,
    total_seats int
);

CREATE TABLE IF NOT EXISTS Education_Dimension(
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

CREATE TABLE IF NOT EXISTS Life_Quality_Dimension(
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

CREATE TABLE IF NOT EXISTS Health_Dimension(
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

CREATE TABLE IF NOT EXISTS Fact_Table(
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

ALTER TABLE Fact_Table ADD FOREIGN KEY(country_key) references Country_Dimension(country_key) ON DELETE CASCADE;
ALTER TABLE Fact_Table ADD FOREIGN KEY(year_key) references Year_Dimension(year_key) ON DELETE CASCADE;
ALTER TABLE Fact_Table ADD FOREIGN KEY(education_key) references Education_Dimension(education_key) ON DELETE CASCADE;
ALTER TABLE Fact_Table ADD FOREIGN KEY(health_key) references Health_Dimension(health_key) ON DELETE CASCADE;
ALTER TABLE Fact_Table ADD FOREIGN KEY(life_quality_key) references Life_Quality_Dimension(life_quality_key) ON DELETE CASCADE;
ALTER TABLE Fact_Table ADD FOREIGN KEY(population_key) references Population_Dimension(population_key) ON DELETE CASCADE;
ALTER TABLE Fact_Table ADD FOREIGN KEY(event_key) references Event_Dimension(event_key) ON DELETE CASCADE;
