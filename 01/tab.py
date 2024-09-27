import psycopg2

                                                                  # Підключення до бази даних taskmaster
conn = psycopg2.connect(
    dbname="taskmaster",                                          # Назва бази даних
    user="postgres",                                              # Ім'я користувача PostgreSQL
    password="1313",                                              # Пароль користувача
    host="localhost",                                             # Хост (localhost, якщо база на локальній машині)
    port="5432"                                                   # Порт PostgreSQL (за замовчуванням 5432)
)

cur = conn.cursor()

                                                                  # SQL-запит для створення таблиць
create_users_table = """
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(100),
    email VARCHAR(100) UNIQUE
);
"""
cur.execute(create_users_table)

create_status_table = """
CREATE TABLE IF NOT EXISTS status (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);
"""
cur.execute(create_status_table)

create_tasks_table = """
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    status_id INTEGER REFERENCES status(id),
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);      
"""
cur.execute(create_tasks_table)

                                                                # Застосування змін
conn.commit()

                                                                # Закриття курсора та з'єднання
cur.close()
conn.close()
