@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo Создание полной структуры проекта MudMind в строгом соответствии с FileList.txt...
echo В каждый файл добавлены подробные комментарии с описанием назначения.
echo.

rem === Папка environments (локальная, не в Git) ===
mkdir environments\mudmind-dev\conda-meta
mkdir environments\mudmind-dev\Scripts
mkdir environments\mudmind-dev\Library
mkdir environments\mudmind-dev\etc
echo # ЛОКАЛЬНЫЕ ОКРУЖЕНИЯ CONDA - НЕ в Git > environments\README.txt
echo # Папка mudmind-dev - основное окружение разработки >> environments\README.txt

rem === Папка src\mudmind ===
mkdir src\mudmind\domain
mkdir src\mudmind\core\ai\models
mkdir src\mudmind\core\reflex
mkdir src\mudmind\gui
mkdir src\mudmind\utils

echo # ИСХОДНЫЙ КОД - коммитим в Git, войдет в EXE > src\README.txt

echo Создание src\mudmind\__init__.py
echo # Инициализация пакета, экспорт API > src\mudmind\__init__.py
echo # Здесь экспортируются основные классы и функции для удобного импорта >> src\mudmind\__init__.py

echo Создание src\mudmind\__main__.py
echo # Точка входа: python -m mudmind > src\mudmind\__main__.py
echo # Запуск основного приложения отсюда >> src\mudmind\__main__.py

rem === domain ===
echo Создание src\mudmind\domain\__init__.py
echo # Экспорт доменных классов > src\mudmind\domain\__init__.py

echo Создание src\mudmind\domain\events.py
echo # Классы событий ^(MudOutputReceived и др.^) > src\mudmind\domain\events.py
echo # Доменные события для EventBus >> src\mudmind\domain\events.py

echo Создание src\mudmind\domain\state.py
echo # Состояние сессии ^(SessionState, Location^) > src\mudmind\domain\state.py

echo Создание src\mudmind\domain\commands.py
echo # Команды пользователя и ИИ > src\mudmind\domain\commands.py

echo Создание src\mudmind\domain\mud_models.py
echo # Модели MUD мира ^(NPC, Item, Quest^) > src\mudmind\domain\mud_models.py

echo Создание src\mudmind\domain\exceptions.py
echo # Доменные исключения > src\mudmind\domain\exceptions.py

echo Создание src\mudmind\domain\rules.py
echo # Правила доменной модели + PriorityLevel > src\mudmind\domain\rules.py
echo # Формализация пользовательских правил как Python-объектов >> src\mudmind\domain\rules.py

echo Создание src\mudmind\domain\priority_levels.py
echo # Константы/Enum приоритетов ^(CRITICAL, HIGH, MEDIUM, LOW^) > src\mudmind\domain\priority_levels.py

rem === core ===
echo Создание src\mudmind\core\__init__.py
echo # Экспорт core модулей > src\mudmind\core\__init__.py

echo Создание src\mudmind\core\event_bus.py
echo # Шина событий - связующее звено между компонентами > src\mudmind\core\event_bus.py

echo Создание src\mudmind\core\mud_client.py
echo # TCP клиент для подключения к MUD серверу > src\mudmind\core\mud_client.py

echo Создание src\mudmind\core\state_manager.py
echo # Менеджер состояния с событиями обновления > src\mudmind\core\state_manager.py

echo Создание src\mudmind\core\knowledge_base.py
echo # Управление базой знаний ^(SQLite + ChromaDB^) > src\mudmind\core\knowledge_base.py

rem === core\ai ===
echo Создание src\mudmind\core\ai\__init__.py
echo # Экспорт AI компонентов > src\mudmind\core\ai\__init__.py

echo Создание src\mudmind\core\ai\orchestrator.py
echo # Тонкий фасад-координатор ^(связывает компоненты^) > src\mudmind\core\ai\orchestrator.py

echo Создание src\mudmind\core\ai\model_router.py
echo # Выбор модели ^(micro/external^) по сложности задачи > src\mudmind\core\ai\model_router.py

echo Создание src\mudmind\core\ai\mode_controller.py
echo # Управление режимами ^(советник/исполнитель/стенограф^) > src\mudmind\core\ai\mode_controller.py

echo Создание src\mudmind\core\ai\context_manager.py
echo # Формирование промптов, истории, контекста для LLM > src\mudmind\core\ai\context_manager.py

echo Создание src\mudmind\core\ai\decision_maker.py
echo # Принятие финальных решений на основе анализа > src\mudmind\core\ai\decision_maker.py

echo Создание src\mudmind\core\ai\strategy_executor.py
echo # Выполнение стратегий ^(autopilot, сбор предметов^) > src\mudmind\core\ai\strategy_executor.py

echo Создание src\mudmind\core\ai\prompt_builder.py
echo # Построение оптимизированных промптов для моделей > src\mudmind\core\ai\prompt_builder.py

echo Создание src\mudmind\core\ai\fallback_handler.py
echo # Обработка сбоев AI, fallback-эвристики > src\mudmind\core\ai\fallback_handler.py

echo Создание src\mudmind\core\ai\models\__init__.py
echo # Экспорт модельных классов > src\mudmind\core\ai\models\__init__.py

echo Создание src\mudmind\core\ai\models\micro_model.py
echo # Обертка микро-модели ^(быстрая, вшитая^) > src\mudmind\core\ai\models\micro_model.py

echo Создание src\mudmind\core\ai\models\external_model.py
echo # Обертка внешней модели ^(большая, опциональная^) > src\mudmind\core\ai\models\external_model.py

echo Создание src\mudmind\core\ai\models\model_wrapper.py
echo # Базовый класс модели ^(абстракция^) > src\mudmind\core\ai\models\model_wrapper.py

rem === core\reflex ===
echo Создание src\mudmind\core\reflex\__init__.py
echo # Экспорт reflex модулей > src\mudmind\core\reflex\__init__.py

echo Создание src\mudmind\core\reflex\pipeline.py
echo # Оркестратор пайплайна ^(вызов стадий по порядку^) > src\mudmind\core\reflex\pipeline.py

echo Создание src\mudmind\core\reflex\parser.py
echo # Парсинг текста MUD ^(regex, извлечение сущностей^) > src\mudmind\core\reflex\parser.py

echo Создание src\mudmind\core\reflex\classifier.py
echo # Классификация ситуации ^(комната/бой/диалог^) > src\mudmind\core\reflex\classifier.py

echo Создание src\mudmind\core\reflex\suggester.py
echo # Генерация предложений ^(интеграция с LLM^) > src\mudmind\core\reflex\suggester.py

echo Создание src\mudmind\core\reflex\executor.py
echo # Автоматическое выполнение команд ^(auto-look^) > src\mudmind\core\reflex\executor.py

echo Создание src\mudmind\core\reflex\cache.py
echo # Кэширование результатов парсинга > src\mudmind\core\reflex\cache.py

echo Создание src\mudmind\core\reflex\fallback.py
echo # Fallback-эвристики если LLM недоступен > src\mudmind\core\reflex\fallback.py

echo Создание src\mudmind\core\reflex\rule_engine.py
echo # Загрузка и применение пользовательских правил ^(CRITICAL и т.д.^) > src\mudmind\core\reflex\rule_engine.py

echo Создание src\mudmind\core\reflex\command_sequencer.py
echo # Управление очередью команд ^(таймауты, прерывания, FIFO^) > src\mudmind\core\reflex\command_sequencer.py

rem === gui ===
echo Создание src\mudmind\gui\__init__.py
echo # Экспорт GUI модулей > src\mudmind\gui\__init__.py

echo Создание src\mudmind\gui\main_window.py
echo # Главное окно приложения ^(макет, меню^) > src\mudmind\gui\main_window.py

echo Создание src\mudmind\gui\widgets.py
echo # Переиспользуемые элементы GUI ^(кнопки, поля^) > src\mudmind\gui\widgets.py

echo Создание src\mudmind\gui\event_handlers.py
echo # Обработчики событий ^(подписка на EventBus^) > src\mudmind\gui\event_handlers.py

echo Создание src\mudmind\gui\themes.py
echo # Темы оформления ^(цвета, шрифты^) > src\mudmind\gui\themes.py

rem === utils ===
echo Создание src\mudmind\utils\__init__.py
echo # Экспорт утилит > src\mudmind\utils\__init__.py

echo Создание src\mudmind\utils\paths.py
echo # КРИТИЧНО: работа с путями в EXE и разработке > src\mudmind\utils\paths.py

echo Создание src\mudmind\utils\config.py
echo # Загрузка и сохранение конфигурации > src\mudmind\utils\config.py

echo Создание src\mudmind\utils\parsers.py
echo # Утилиты парсинга ^(цвета ANSI, форматы^) > src\mudmind\utils\parsers.py

echo Создание src\mudmind\utils\logging.py
echo # Настройка логирования > src\mudmind\utils\logging.py

echo Создание src\mudmind\utils\validators.py
echo # Валидация входных данных > src\mudmind\utils\validators.py

rem === data ===
mkdir data\models\micro
mkdir data\models\external
mkdir data\configs
mkdir data\databases\vector_store

echo # ДАННЫЕ ПРИЛОЖЕНИЯ - НЕ в Git, войдет в EXE > data\README.txt

type nul > data\models\micro\mudreflex-core.gguf
echo # Основная микро-модель ^(~500MB^) - бинарный файл > data\models\micro\README.txt

echo # Пользователь добавляет свои модели > data\models\external\README.txt

echo Создание data\configs\default_settings.json
echo { > data\configs\default_settings.json
echo   "_comment": "Настройки по умолчанию" >> data\configs\default_settings.json
echo } >> data\configs\default_settings.json

echo Создание data\configs\mud_servers.json
echo { > data\configs\mud_servers.json
echo   "_comment": "Список MUD серверов" >> data\configs\mud_servers.json
echo } >> data\configs\mud_servers.json

echo Создание data\configs\ai_profiles.json
echo { > data\configs\ai_profiles.json
echo   "_comment": "Профили поведения ИИ" >> data\configs\ai_profiles.json
echo } >> data\configs\ai_profiles.json

echo Создание data\configs\default_rules.json
echo { > data\configs\default_rules.json
echo   "_comment": "Шаблон пользовательских правил по умолчанию" >> data\configs\default_rules.json
echo } >> data\configs\default_rules.json

echo Создание data\configs\user_rules.json
echo { > data\configs\user_rules.json
echo   "_comment": "Пользовательские правила ^(CRITICAL условия и действия^)" >> data\configs\user_rules.json
echo } >> data\configs\user_rules.json

type nul > data\databases\knowledge.db
type nul > data\databases\sessions.db
echo # SQLite: знания о мире MUD > data\databases\knowledge.db
echo # SQLite: история сессий > data\databases\sessions.db

rem === resources ===
mkdir resources\icons
mkdir resources\fonts
mkdir resources\themes

type nul > resources\icons\app_icon.ico
type nul > resources\icons\mud_icon.png
type nul > resources\icons\ai_icon.png

type nul > resources\fonts\monospace.ttf

echo Создание resources\themes\dark.json
echo { "_comment": "Темная тема ^(цвета, отступы^)" } > resources\themes\dark.json

echo Создание resources\themes\light.json
echo { "_comment": "Светлая тема" } > resources\themes\light.json

echo Создание resources\themes\classic.json
echo { "_comment": "Классическая ^(зеленый на черном^)" } > resources\themes\classic.json

rem === tools ===
mkdir tools\dataset_tools
mkdir tools\model_tools
mkdir tools\mud_simulator\test_scripts
mkdir tools\dev_utils
mkdir tools\analysis

echo Создание tools\dataset_tools\collect_logs.py
echo # Сбор логов из реальных MUD сессий > tools\dataset_tools\collect_logs.py

echo Создание tools\dataset_tools\label_ui.py
echo # Графический интерфейс для разметки данных > tools\dataset_tools\label_ui.py

echo Создание tools\dataset_tools\validate_dataset.py
echo # Проверка качества датасета > tools\dataset_tools\validate_dataset.py

echo Создание tools\model_tools\train_lora.py
echo # Скрипт дообучения моделей ^(LoRA^) > tools\model_tools\train_lora.py

echo Создание tools\model_tools\quantize_gguf.py
echo # Квантование моделей в GGUF формат > tools\model_tools\quantize_gguf.py

echo Создание tools\model_tools\evaluate_model.py
echo # Оценка качества модели > tools\model_tools\evaluate_model.py

echo Создание tools\model_tools\export_for_runtime.py
echo # Подготовка модели для runtime > tools\model_tools\export_for_runtime.py

echo Создание tools\mud_simulator\fake_server.py
echo # Фейковый MUD сервер для тестов > tools\mud_simulator\fake_server.py

echo Создание tools\mud_simulator\scenario_player.py
echo # Воспроизведение сценариев > tools\mud_simulator\scenario_player.py

echo Создание tools\analysis\analyze_logs.py
echo # Анализ логов работы приложения > tools\analysis\analyze_logs.py

rem === packaging ===
mkdir packaging\hooks
mkdir packaging\resources
mkdir packaging\installers

echo Создание packaging\mudmind.spec
echo # КОНФИГ PyInstaller - что включать в EXE > packaging\mudmind.spec

echo Создание packaging\hooks\hook-llama_cpp.py
echo # Хук для llama-cpp-python ^(библиотеки^) > packaging\hooks\hook-llama_cpp.py

echo Создание packaging\hooks\hook-dearpygui.py
echo # Хук для Dear PyGui ^(ресурсы^) > packaging\hooks\hook-dearpygui.py

echo Создание packaging\hooks\hook-sqlalchemy.py
echo # Хук для SQLAlchemy ^(диалекты^) > packaging\hooks\hook-sqlalchemy.py

type nul > packaging\resources\mudmind.ico
type nul > packaging\resources\splash.png
echo # Информация о версии для Windows > packaging\resources\version_info.txt

echo Создание packaging\installers\inno_setup.iss
echo ; Скрипт для Inno Setup ^(Windows^) > packaging\installers\inno_setup.iss

echo Создание packaging\installers\nsis_script.nsi
echo ; Скрипт для NSIS ^(альтернатива^) > packaging\installers\nsis_script.nsi

rem === experiments ===
echo Создание experiments\micro_model_tests.ipynb
echo { "cells": [ { "cell_type": "markdown", "source": ["# Jupyter: тестирование микро-модели"] } ] } > experiments\micro_model_tests.ipynb

echo Создание experiments\prompt_engineering.ipynb
echo { "cells": [ { "cell_type": "markdown", "source": ["# Jupyter: эксперименты с промптами"] } ] } > experiments\prompt_engineering.ipynb

echo.
echo Готово! Создана полная структура проекта MudMind с комментариями в каждом файле.
echo Скрипт учитывает все файлы и папки из FileList.txt.
pause