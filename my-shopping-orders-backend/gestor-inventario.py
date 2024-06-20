import csv
import mysql.connector

# Conexión a la base de datos compartida
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="my_shopping_shared"
)

cursor = db.cursor()

# Leer archivo CSV
with open('nuevas_ordenes.csv', 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        # Asegúrate de que los nombres de las columnas coincidan con los del CSV
        producto_id = int(row['producto_id'])
        cantidad = int(row['cantidad'])
        
        cursor.execute("UPDATE productos SET stock = stock - %s WHERE id = %s", (cantidad, producto_id))

db.commit()
cursor.close()
db.close()

print("Inventario actualizado correctamente.")
