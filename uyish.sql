import sqlite3
import psycopg2
from psycopg2 import sql
try:
    connect = psycopg2.connect(
        database="autasalon",
        user="postgres",
        password="shoh7120",
        host = "localhost",
    )
connect = sqlite3.connect("company.db")
cursor = connect.cursor()
cursor.execute("""
CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary INTEGER NOT NULL,
    hire_date TEXT NOT NULL,
    department_id INTEGER NOT NULL
)
""")
cursor.execute("""
CREATE TABLE IF NOT EXISTS departments (
    id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL
)
""")
cursor.execute("""
CREATE TABLE IF NOT EXISTS projects (
    id INTEGER PRIMARY KEY,
    project_name TEXT NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT,
    budget INTEGER NOT NULL
)
""")
cursor.executemany("""
INSERT INTO employees (id, first_name, last_name, position, salary, hire_date, department_id)
VALUES (?, ?, ?, ?, ?, ?, ?)
""", [
    (1, "Asadbek", "Karimov", "Menager", 3000, "2020-03-15", 1),
    (2, "Nodirbek", "Toirov", "Dasturlash", 2500, "2021-05-10", 2),
    (3, "Shohjahon", "Abdulajanov", "Frontend", 2200, "2022-01-22", 3),
    (4, "Dilmurod", "Maksumov", "Bootcamp", 1800, "2019-11-11", 1),
    (5, "Jamshid", "Sadulayev", "Graphic Disagner", 2400, "2023-02-01", 2)
])

cursor.executemany("""
INSERT INTO departments (id, department_name)
VALUES (?, ?)
""", [
    (1, "Administrator"),
    (2, "It teacher"),
    (3, "Manager")
])

cursor.executemany("""
INSERT INTO projects (id, project_name, start_date, end_date, budget)
VALUES (?, ?, ?, ?, ?)
""", [
    (1, "Yangi dastur", "2023-01-10", "2023-06-30", 50000),
    (2, "Telefon programasi", "2022-08-15", "2023-03-20", 30000),
    (3, "Sysytem", "2024-02-01", None, 60000)
])
connect.commit()
cursor.execute("""
SELECT first_name || ' ' || last_name AS "Full Name" FROM employees
""")
print(cursor.fetchall())
cursor.execute("""
SELECT * FROM employees ORDER BY salary DESC
""")
print(cursor.fetchall())
SELECT * FROM employees WHERE salary > 2500
""")
print(cursor.fetchall())
cursor.execute("""
SELECT * FROM employees ORDER BY salary DESC LIMIT 3
""")
print(cursor.fetchall())
cursor.execute("""
SELECT * FROM employees WHERE salary IN (2400, 3000)
""")
print(cursor.fetchall())
SELECT * FROM employees WHERE salary BETWEEN 2000 AND 3000
"""
print(cursor.fetchall())
SELECT * FROM employees WHERE first_name LIKE '%a%'
""")
print(cursor.fetchall())

SELECT * FROM projects WHERE end_date IS NULL

SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id
"""
print(cursor.fetchall())

connect.close()
