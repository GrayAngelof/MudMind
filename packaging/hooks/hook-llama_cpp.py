from PyInstaller.utils.hooks import collect_dynamic_libs, copy_metadata

# Собираем нативные библиотеки (llama.dll и зависимости)
binaries = collect_dynamic_libs("llama_cpp")

# Если нужно метаданные пакета
datas = copy_metadata("llama_cpp")