from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/health")
def health():
    data = {"message": "Hello World!"}
    return jsonify(data), 200
