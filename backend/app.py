from flask import Flask, request, jsonify
from transformers import pipeline
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
generator = pipeline("text-generation", model="gpt2")

@app.route("/chat", methods=["POST"])
def chat():
    user_input = request.json.get("input", "")
    prompt = f"Q: {user_input}\nA:"
    result = generator(prompt, max_length=100, num_return_sequences=1)
    return jsonify({"response": result[0]["generated_text"]})

app.run(host="0.0.0.0", port=5000)
