import pyodbc
import pandas as pd
import file_read
import sys
import ini
from azure.storage.queue import QueueServiceClient, QueueClient, BinaryBase64EncodePolicy, BinaryBase64DecodePolicy


server = ini.server 
database = ini.database
username = ini.username
password = ini.password 
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()
cursor.execute(f"CREATE TABLE dbo.weather(City varchar(50) NULL,Day varchar(50) NULL,Min_temp int NULL,Max_temp int NULL,Rain varchar(50) NULL)")
cnxn.commit()