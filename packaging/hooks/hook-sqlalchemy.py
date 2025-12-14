from PyInstaller.utils.hooks import collect_submodules, collect_data_files

# Сбор подмодулей для SQLAlchemy (это могут быть такие компоненты, как диалекты для работы с базами данных)
hiddenimports = collect_submodules('sqlalchemy')

# Сбор данных (например, конфигурационных файлов или других ресурсов, которые могут быть использованы SQLAlchemy)
datas = collect_data_files('sqlalchemy')

# В случае необходимости, можно добавить дополнительные ресурсы или файлы для SQLAlchemy
# Пример:
# datas += collect_data_files('sqlalchemy.dialects')

# Результат: возвращает hiddenimports и данные для использования PyInstaller
