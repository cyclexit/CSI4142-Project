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
FACT_TABLE_CSV = os.path.join(CSV_PATH_PREFIX, f"{FACT_TABLE}.csv")
POPULATION_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{POPULATION_DIMENSION}.csv")
YEAR_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{YEAR_DIMENSION}.csv")
COUNTRY_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{COUNTRY_DIMENSION}.csv")
POLITICAL_EVENT_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{POLITICAL_EVENT_DIMENSION}.csv")
LIFE_QUALITY_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{LIFE_QUALITY_DIMENSION}.csv")
EDUCATION_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{EDUCATION_DIMENSION}.csv")
HEALTH_DIMENSION_CSV = os.path.join(CSV_PATH_PREFIX, f"{HEALTH_DIMENSION}.csv")

# country list
COUNTRY_LIST = [
    "Canada", "United States", "Mexico",
    "India", "Indonesia", "Iran",
    "Egypt", "Kenya", "Nigeria"
]
