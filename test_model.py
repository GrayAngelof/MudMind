from llama_cpp import Llama

model = Llama(
    model_path=r"E:\Projects\MudMind\data\models\micro\mudreflex-core.gguf",
    n_gpu_layers=-1,
    verbose=True,          # Вот это важно!
    n_ctx=2048             # Увеличьте контекст для теста
)

output = model("Привет! Расскажи короткую историю.", max_tokens=100)
print(output['choices'][0]['text'])