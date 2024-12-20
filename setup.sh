#!/bin/bash

# Обновление репозиториев
echo "Обновляем репозитории..."
sudo apt update -y || sudo apt-get update -y

# Установка лёгкого браузера (Midori)
echo "Устанавливаем лёгкий браузер Midori..."
sudo apt install -y midori || sudo apt-get install -y midori

# Уведомление пользователя
echo "Midori установлен. Используй его для скачивания Python 3.13.1."

# Инструкция для установки Python после скачивания
echo "
Чтобы установить Python после скачивания архива через браузер:
1. Распакуй архив: tar -xf python-3.13.1.tar.xz
2. Перейди в директорию: cd Python-3.13.1
3. Выполни команды:
   ./configure --enable-optimizations
   make -j\$(nproc)
   sudo make altinstall
"
