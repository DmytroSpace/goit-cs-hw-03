from pymongo import MongoClient
from pymongo.errors import PyMongoError, ConnectionFailure

                                                                     # Підключення до MongoDB
try:
    client = MongoClient("mongodb://localhost:27017/")                
    db = client["pet_database"]                                      # Назва бази даних
    collection = db["cats"]                                          # Назва колекції
    client.admin.command('ismaster')
    print("MongoDB підключено успішно")
except ConnectionFailure:
    print("Не вдалося підключитися до MongoDB, перевірте з'єднання")


def create_document(name, age, features):                            # Функція для створення документа
    try:
        document = {
            "name": name,
            "age": age,
            "features": features
        }
        collection.insert_one(document)
        print("Документ створено.")
    except PyMongoError as e:
        print(f"Помилка при роботі з MongoDB: {e}")


def read_all_documents():                                            # Функція для читання всіх документів
    try:
        documents = collection.find()
        for doc in documents:
            print(doc)
    except PyMongoError as e:
        print(f"Помилка при читанні документів: {e}")


def read_document_by_name(name):                                     # Функція для читання документа за ім'ям
    try:
        document = collection.find_one({"name": name})
        if document:
            print(document)
        else:
            print(f"Документ з ім'ям '{name}' не знайдено.")
    except PyMongoError as e:
        print(f"Помилка при пошуку документа: {e}")


def update_document_age(name, new_age):                              # Функція для оновлення віку кота               
    try:
        result = collection.update_one({"name": name}, {"$set": {"age": new_age}})
        if result.modified_count > 0:
            print(f"Вік кота '{name}' оновлено на {new_age}.")
        else:
            print(f"Кота з ім'ям '{name}' не знайдено.")
    except PyMongoError as e:
        print(f"Помилка при оновленні віку: {e}")


def add_feature_to_document(name, feature):                          # Функція для додавання характеристики до кота
    try:
        result = collection.update_one({"name": name}, {"$addToSet": {"features": feature}})
        if result.modified_count > 0:
            print(f"Характеристика '{feature}' додано до кота '{name}'.")
        else:
            print(f"Кота з ім'ям '{name}' не знайдено.")
    except PyMongoError as e:
        print(f"Помилка при додаванні характеристики: {e}")


def delete_document(name):                                           # Функція для видалення документа
    try:
        result = collection.delete_one({"name": name})
        if result.deleted_count > 0:
            print(f"Документ з ім'ям '{name}' видалено.")
        else:
            print(f"Кота з ім'ям '{name}' не знайдено.")
    except PyMongoError as e:
        print(f"Помилка при видаленні документа: {e}")


def delete_all_documents():                                          # Функція для видалення всіх документів
    try:
        collection.delete_many({})
        print("Всі документи видалено.")
    except PyMongoError as e:
        print(f"Помилка при видаленні документів: {e}")


def main():                                                         # Головна функція
    while True:
        print("\nДоступні дії:")
        print("1 - Створити запис про кота")
        print("2 - Показати всі записи")
        print("3 - Пошук запису за ім'ям кота")
        print("4 - Оновити вік кота")
        print("5 - Додати особливість до кота")
        print("6 - Видалити запис про кота")
        print("7 - Видалити всі записи")
        print("8 - Вийти")
        choice = input("Виберіть дію: ")

        if choice == "1":
            name = input("Введіть ім'я кота: ")
            age = int(input("Введіть вік кота: "))
            features = input("Введіть особливості через кому: ").split(", ")
            create_document(name, age, features)
        elif choice == "2":
            read_all_documents()
        elif choice == "3":
            name = input("Введіть ім'я кота: ")
            read_document_by_name(name)
        elif choice == "4":
            name = input("Введіть ім'я кота: ")
            new_age = int(input("Введіть новий вік: "))
            update_document_age(name, new_age)
        elif choice == "5":
            name = input("Введіть ім'я кота: ")
            feature = input("Введіть характеристику: ")
            add_feature_to_document(name, feature)
        elif choice == "6":
            name = input("Введіть ім'я кота для видалення: ")
            delete_document(name)
        elif choice == "7":
            delete_all_documents()
        elif choice == "8":
            break
        else:
            print("Некоректний вибір. Спробуйте ще раз.")

if __name__ == "__main__":
    main()
