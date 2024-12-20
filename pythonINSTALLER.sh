#!/bin/bash

# Обновление пакетов
echo "Обновляем репозитории..."
sudo apt update -y || sudo apt-get update -y

# Установка Python (если не установлен)
echo "Проверяем наличие Python..."
if ! command -v python3 &>/dev/null; then
    echo "Python не найден. Устанавливаем Python..."
    sudo apt install -y python3 python3-pip
else
    echo "Python уже установлен."
fi

# Установка pip (если не установлен)
echo "Проверяем наличие pip..."
if ! command -v pip3 &>/dev/null; then
    echo "pip не найден. Устанавливаем pip..."
    sudo apt install -y python3-pip
else
    echo "pip уже установлен."
fi

# Запуск Python-скрипта для установки библиотек
echo "Запускаем Python-скрипт для установки библиотек..."
python3 install_python_packages.py

echo "Готово!"
