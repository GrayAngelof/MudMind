from llama_cpp import Llama

def test_load_model():
    # Путь к твоей модели (переименуй файл или укажи правильный)
    model_path = "data/models/micro/mudreflex-core.gguf"  # или какое у тебя имя файла

    print("Загрузка модели...")
    llm = Llama(
        model_path=model_path,
        n_gpu_layers=-1,      # -1 = все слои на GPU, если CUDA доступен; 0 = только CPU
        n_ctx=2048,           # Увеличили контекст для MUD (последние ~10-20 сообщений)
        verbose=True,         # Пока оставим, чтобы видеть логи
        n_batch=512,          # Стандартно
    )

    print("\nМодель загружена успешно!")
    print(f"Контекст: {llm.n_ctx}")
    print(f"Слоёв на GPU: {llm.n_gpu_layers if hasattr(llm, 'n_gpu_layers') else 'не поддерживается'}")

    print("\nТестируем генерацию...")
    prompt = """Ты — помощник в текстовых MUD-играх. 
Твоя задача: по описанию комнаты предложить 3 простых действия (команды).

Пример вывода:
1. look
2. get sword
3. north

Описание комнаты:
Ты в тёмной комнате. Выходы: north, south. На полу лежит меч.

Предложи 3 действия:"""

    output = llm(
        prompt,
        max_tokens=100,
        temperature=0.3,
        top_p=0.9,
        stop=["<|im_end|>", "<|endoftext|>"],  # Останавливаем на EOS токенах Qwen
        echo=False
    )

    print("\nОтвет модели:")
    print(output["choices"][0]["text"])

if __name__ == "__main__":
    test_load_model()