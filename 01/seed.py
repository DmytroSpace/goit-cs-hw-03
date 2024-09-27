import psycopg2
from faker import Faker

                                                   # Підключення до бази даних taskmaster
conn = psycopg2.connect(
    dbname="taskmaster",                           # Назва бази даних
    user="postgres",                               # Ім'я користувача PostgreSQL
    password="1313",                               # Пароль для цього користувача
    host="localhost",                              # Хост (localhost, якщо база на локальній машині)
    port="5432"                                    # Порт PostgreSQL (за замовчуванням 5432)
)

cur = conn.cursor()

fake = Faker()

                                                   # Заповнення таблиці users випадковими даними
for _ in range(10):
    fullname = fake.name()
    email = fake.email()
    cur.execute("INSERT INTO users (fullname, email) VALUES (%s, %s)", (fullname, email))

                                                   # Заповнення таблиці status фіксованими статусами
statuses = ['new', 'in progress', 'completed']
for status in statuses:
    cur.execute("INSERT INTO status (name) VALUES (%s) ON CONFLICT (name) DO NOTHING", (status,))

                                                   # Заповнення таблиці tasks випадковими даними
for _ in range(20):
    title = fake.sentence(nb_words=4)
    description = fake.text()
    status_id = fake.random_int(min=1, max=3)
    user_id = fake.random_int(min=1, max=10)
    cur.execute("INSERT INTO tasks (title, description, status_id, user_id) VALUES (%s, %s, %s, %s)",
                (title, description, status_id, user_id))

                                                   # Застосування змін
conn.commit()

                                                   # Закриття курсора та з'єднання
cur.close()
conn.close()
