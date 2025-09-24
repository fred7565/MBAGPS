import csv
import psycopg2

conn = psycopg2.connect(
    dbname="mbagps",
    user="n8n",
    password="n8npass",
    host="localhost",
    port=5432
)

cur = conn.cursor()

with open('./keywords/PaintingKeywords.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        cur.execute(
            "INSERT INTO keywords (keyword) VALUES (%s)",
            (row['keyword'],)
        )

conn.commit()
cur.close()
conn.close()

print("✅ Keywords imported successfully!")