import psycopg2
import csv
from Patient import Patient

def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(host="localhost", database="i2b2", user="i2b2", password="i2b2")

        # create a cursor
        cur = conn.cursor()

   # execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)

       # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')

def execute(command):
    conn = None
    try:
        # connect to the PostgreSQL server
        conn = psycopg2.connect(host="localhost", database="i2b2", user="i2b2", password="i2b2")
        cur = conn.cursor()
        # create table one by one
        cur.execute(command)
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

def selectQuery(sql):
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(host="localhost", database="i2b2", user="i2b2", password="i2b2")

        # create a cursor
        cur = conn.cursor()
        cur.execute(sql)

        # display the PostgreSQL database server version
        row = cur.fetchone()
        while row is not None:
            print(row)
            row = cur.fetchone()

       # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')

def readFile(file):
    loaded = []
    with open(file) as csvFile:
        reader = csv.reader(csvFile, delimiter = '|')
        l = 0
        for row in reader:
            if l == 0:
                print(f'columns ==>  {", ".join(row)}')
            else:
                if row[0] not in loaded:
                    pat = Patient(row[0],row[1],row[2])
                    loaded.append(row[0])
                    pat.printPatient()
                    loadPatient(pat)
            l += 1
            print(l)

def loadPatient(patient):
    command = """
        INSERT INTO i2b2demodata.TEST
            (patient_num, patient_gender, birthdate)
            VALUES(
                    {patientNum},
                    {gender},
                    DATE '{birthDate}'
            )
    """.format(patientNum = patient.patient_num, gender = patient.gender, birthDate = patient.birthdate)
    print (command)

    execute(command)

if __name__ == '__main__':
    connect()

    sql = "SELECT * from i2b2demodata.patient_dimension"


    command = """
        CREATE TABLE IF NOT EXISTS i2b2demodata.TEST (patient_num INTEGER , patient_gender VARCHAR(2), BIRTHDATE DATE)
    """
    execute(command)

    command = """
        TRUNCATE TABLE i2b2demodata.TEST
    """
    execute(command)

    readFile('data/PMSI.txt')
