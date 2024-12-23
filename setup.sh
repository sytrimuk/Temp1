#!/bin/bash

# Проверка прав суперпользователя
if [ "$EUID" -ne 0 ]; then
    echo "Пожалуйста, запустите скрипт с правами суперпользователя (sudo)."
    exit 1
fi

echo "Обновление списка пакетов..."
sudo apt update

echo "Установка необходимых зависимостей..."
sudo apt install -y software-properties-common apt-transport-https wget curl

# Установка или обновление Python
echo "Обновление Python до последней версии..."
sudo apt install -y python3 python3-pip python3-venv
python3 --version
pip3 --version

# Обновление pip до последней версии
echo "Обновление pip до последней версии..."
python3 -m pip install --upgrade pip
pip3 --version

# Добавление ключа GPG Microsoft
echo "Добавление ключа GPG Microsoft..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/vscode.gpg

# Добавление репозитория Microsoft
echo "Добавление репозитория Microsoft..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

echo "Обновление списка пакетов после добавления репозитория..."
sudo apt update

# Установка Visual Studio Code
echo "Установка Visual Studio Code..."
sudo apt install -y code

# Проверка установки
if command -v code > /dev/null; then
    echo "Установка Visual Studio Code завершена успешно! Запустите редактор командой 'code'."
else
    echo "Что-то пошло не так. Проверьте вывод сообщений об ошибках."
fi

echo "Скрипт завершён."
