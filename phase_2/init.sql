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
)