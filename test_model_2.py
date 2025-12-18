from llama_cpp import Llama

print("Загрузка модели...")
model = Llama(
    model_path=r"E:\Projects\MudMind\data\models\micro\mudreflex-core.gguf",
    n_gpu_layers=-1,
    n_ctx=4096,
    n_batch=512,
    verbose=True
)

print("\nГенерация теста...")

# Правильный чат-формат
output = model.create_chat_completion(
    messages=[
        {
            "role": "system",
            "content": "Ты полезный ассистент, отвечай на русском языке."
        },
        {
            "role": "user",
            "content": "Расскажи подробную историю про древнего дракона, который охранял забытый храм в горах. История на русском языке, около 200-300 слов."
        }
    ],
    max_tokens=500,
    temperature=0.7,
    top_p=0.9,
    stop=["<|im_end|>", "<|endoftext|>"]
)

print("\nОтвет модели:")
print(output["choices"][0]["message"]["content"])