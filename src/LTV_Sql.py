import sqlite3
from sqlite3 import Error
import json
import os
from pathlib import Path


def create_tables(db_file):
    # create a database connection to a SQLite database
    try:
        conn = sqlite3.connect(db_file)
        print('Sqlite version --> {}'.format(sqlite3.version))
        c = conn.cursor()

        # Drop table if exists ( Testing purpose only )
        c.execute('''DROP TABLE IF EXISTS CUSTOMER''')
        c.execute('''DROP TABLE IF EXISTS SITE_VISIT''')
        c.execute('''DROP TABLE IF EXISTS IMAGE''')
        c.execute('''DROP TABLE IF EXISTS ORDER_TBL''')

        # Create CUSTOMER table
        c.execute('''CREATE TABLE IF NOT EXISTS CUSTOMER ( type text
                                                             ,verb text 
                                                             ,customer_id text
                                                             ,event_time text
                                                             ,last_name text
                                                             ,adr_city text
                                                             ,adr_state text )''')
        # Create SITE_VISIT table
        c.execute('''CREATE TABLE IF NOT EXISTS SITE_VISIT ( type text
                                                             ,verb text 
                                                             ,page_id text
                                                             ,event_time text
                                                             ,customer_id text
                                                             ,tags text)''')
        # Create IMAGE table
        c.execute('''CREATE TABLE IF NOT EXISTS IMAGE ( type text
                                                            ,verb text 
                                                            ,image_id text
                                                            ,event_time text
                                                            ,customer_id text
                                                            ,camera_make text
                                                            ,camera_model text)''')

        # # Create ORDER table
        c.execute('''CREATE TABLE IF NOT EXISTS ORDER_TBL ( type text
                                                            ,verb text
                                                            ,order_id text
                                                            ,event_time text
                                                            ,customer_id text
                                                            ,total_amount text)''')

        # Save (commit) the changes
        conn.commit()

        # We can also close the connection if we are done with it.
        # Just be sure any changes have been committed or they will be lost.

        conn.close()
    except Error as e:
        print(e)
    finally:
        conn.close()


def load_json(json_file, db_file):

    conn = sqlite3.connect(db_file)
    c = conn.cursor()
    data = json.load(open(json_file))
    cust_records = []
    site_records = []
    order_records = []

    if len(data) > 0:
        for i in range(len(data)):
            if data[i]['type'] == 'CUSTOMER':
                columns = ['type', 'verb', 'key', 'event_time', 'last_name', 'adr_city', 'adr_state']
                record = [data[i][c] for c in columns]
                cust_records.append(tuple(record))

            elif data[i]['type'] == 'SITE_VISIT':
                #print(data[i])
                columns = ['type', 'verb', 'key', 'event_time', 'customer_id', 'tags']
                record = []
                for j in columns:
                    if j == 'tags':
                        record.append(data[i][j][0]['some key'])  # can process json with loop to get all elements
                    else:
                        record.append(data[i][j])
                site_records.append(tuple(record))
            elif data[i]['type'] == 'ORDER':
                # print(data[i])
                columns = ['type', 'verb', 'key', 'event_time', 'customer_id', 'total_amount']
                record = [data[i][c] for c in columns]
                order_records.append(tuple(record))

    c.executemany("INSERT INTO CUSTOMER VALUES (?,?,?,?,?,?,?)", cust_records)
    c.executemany("INSERT INTO SITE_VISIT VALUES (?,?,?,?,?,?)", site_records)
    c.executemany("INSERT INTO ORDER_TBL VALUES (?,?,?,?,?,?)", order_records)
    conn.commit()

    print(order_records)
    for row in c.execute('select * from CUSTOMER'):
        print(row)
    for row in c.execute('select * from SITE_VISIT'):
        print(row)
    for row in c.execute('select * from ORDER_TBL'):
        print(row)


    for row in c.execute('''select 
                         o.customer_id 
                         ,c.last_name
                         ,sum(o.total_amount) tot
                          from ORDER_TBL o
                          left join CUSTOMER c
                          on o.customer_id = c.customer_id GROUP BY o.customer_id order by tot desc'''):
        print(row)


if __name__ == '__main__':
    create_tables('ltv_sqlite_db.db')
    json_file_path = str(Path(__file__).parent.parent) + '/input/events.txt'
    load_json(json_file_path, 'ltv_sqlite_db.db')
