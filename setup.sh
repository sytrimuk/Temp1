#!/bin/bash

# Обновление репозиториев
echo "Обновляем репозитории..."
sudo apt update -y || sudo apt-get update -y

# Установка Google Chrome
echo "Устанавливаем Google Chrome..."
wget -qO- https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
sudo apt install ./chrome.deb -y || sudo dpkg -i chrome.deb
sudo apt-get install -f -y  # Исправление зависимостей

# Установка Python 3.13.1
echo "Устанавливаем Python 3.13.1..."
sudo apt install -y build-essential libssl-dev zlib1g-dev libncurses5-dev libnss3-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev
curl -O https://www.python.org/ftp/python/3.13.1/Python-3.13.1.tar.xz
tar -xf Python-3.13.1.tar.xz
cd Python-3.13.1 || exit
./configure --enable-optimizations
make -j$(nproc)
sudo make altinstall
cd .. || exit

# Клонирование репозитория
echo "Клонируем репозиторий..."
git clone https://github.com/sytrimuk/Temp1.git

echo "Установка завершена!"
