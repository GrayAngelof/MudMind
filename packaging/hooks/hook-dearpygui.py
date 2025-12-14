from PyInstaller.utils.hooks import collect_data_files, collect_submodules

# Собираем все дополнительные файлы (например, графику, ресурсы и т. д.)
datas = collect_data_files('dearpygui')

# Собираем все подмодули для библиотеки
hiddenimports = collect_submodules('dearpygui')
