import mysql.connector

dataBase = mysql.connector.connect(
    host="localhost",
    port=3306,
    user="root",
    passwd="root",
    database="littleexplorer"
)
cursor = dataBase.cursor()

# example to check if it works:
cursor.execute("select * from kindergarten")
print(cursor.fetchall())

cursor.close()