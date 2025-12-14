from llama_cpp import Llama

def test_load_model():
    model_path = "data/models/micro/mudreflex-core.gguf"  # Placeholder
    llm = Llama(model_path=model_path, n_gpu_layers=-1)  # Use GPU if available
    output = llm("Test prompt: Hello", max_tokens=10)
    print(output['choices'][0]['text'])

if __name__ == "__main__":
    test_load_model()