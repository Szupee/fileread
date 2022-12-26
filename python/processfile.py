import pyodbc
import pandas as pd
import file_read
import sys
import ini
from azure.storage.queue import QueueServiceClient, QueueClient, BinaryBase64EncodePolicy, BinaryBase64DecodePolicy



def checking_queue():
    queue = QueueClient.from_connection_string(conn_str=ini.connectionstringblob, queue_name="uploadfiles")
    response = queue.receive_messages()
    for message in response:
        string = message.content
        print(string)
        tosql(string)
        queue.delete_message(message)
  


def tosql(filename):

    file_read.blob_to_file('files', filename)
    data = pd.read_csv (ini.filelocation)   
    df = pd.DataFrame(data)
    values = df.iloc[0].values.tolist()
    print(type(values))
    stringtosql = "'"+"', '".join(str(x) for x in values)+ "'"
    print(stringtosql)
    server = ini.server 
    database = ini.database
    username = ini.username
    password = ini.password 
    cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
    cursor = cnxn.cursor()
    cursor.execute(f"INSERT INTO dbo.weather (City,Day,Min_temp,Max_temp,Rain) VALUES ({stringtosql});")
    cnxn.commit()

while True:
    checking_queue()
