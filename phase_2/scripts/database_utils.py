from configparser import ConfigParser
import psycopg2
import pandas as pd

def db_config(filename='database.ini', section='postgresql'):
    '''
        This function reads the database config file.
    '''
    # create a parser
    parser = ConfigParser()
    # read config file
    parser.read(filename)

    # get section, default to postgresql
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))
    return db

def db_connect():
    '''
        Connect to the PostgreSQL database server.
    '''
    try:
        # read connection parameters
        db_params = db_config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        db_conn = psycopg2.connect(**db_params)

        # create a cursor
        db_cur = db_conn.cursor()

        # return database instances
        return db_conn, db_cur
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)

def insert_table_from_csv(file_path, table_name, cursor):
    data = pd.read_csv(file_path)
    data.drop(["Country Code", "Year"])
    data = [tuple(x) for x in data.to_numpy()]
    print(data[0])
    template = ','.join(['%s'] * len(data))
    query = 'INSERT INTO ' + table_name +' VALUES {}'.format(template)
    cursor.execute(query, data)
