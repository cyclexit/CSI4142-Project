import os

# NOTE: all schema names and table names are all in lower-case in postgresql
SCHEMA_NAME = "csi4142_project"
FACT_TABLE = "fact_table"
COUNTRY_DIMENSION = "country_dimension"
EDUCATION_DIMENSION = "education_dimension"
EVENT_DIMENSION = "event_dimension"
HEALTH_DIMENSION = "health_dimension"
LIFE_QUALITY_DIMENSION = "life_quality_dimension"
POPULATION_DIMENSION = "population_dimension"
YEAR_DIMENSION = "year_dimension"
POLITICAL_EVENT_DIMENSION = "political_event_dimension"

# csv relative file path
CSV_PATH_PREFIX = "../data/"
MEASURES_CSV = os.path.join(CSV_PATH_PREFIX, "measures.csv")
POPULATION_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, "population_dimension.csv")
YEAR_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, "year_dimension.csv")
COUNTRY_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, "country_dimension.csv")
<<<<<<< HEAD
POLITICAL_EVENT_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{POLITICAL_EVENT_DIMENSION}.csv")
=======
LIFE_QUALITY_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, "life_quality_dimension.csv")
>>>>>>> phase_2
