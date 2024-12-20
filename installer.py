import subprocess
import sys
import os

# Список библиотек для установки
libraries = [
    "aiogram",       
    "aiohttp"
]

def install_pip():
    """Устанавливает pip, если он не установлен."""
    try:
        import pip
        print("pip уже установлен.")
    except ImportError:
        print("Устанавливаем pip...")
        # Команда для установки pip
        subprocess.check_call([sys.executable, "-m", "ensurepip", "--upgrade"])
        subprocess.check_call([sys.executable, "-m", "pip", "install", "--upgrade", "pip"])

def install(package):
    """Устанавливает указанный пакет через pip."""
    subprocess.check_call([sys.executable, "-m", "pip", "install", package])

def main():
    # Установка pip
    install_pip()
    
    # Установка библиотек
    for lib in libraries:
        print(f"Устанавливаем {lib}...")
        install(lib)

    print("Все библиотеки успешно установлены!")

if __name__ == "__main__":
    main()
