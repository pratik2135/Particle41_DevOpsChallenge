from flask import Flask, request, jsonify
from datetime import datetime, timezone
app = Flask(__name__)

@app.route('/',methods=["GET"])
def get_time_and_ip():

    ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    timestamp = datetime.now(timezone.utc)
    return jsonify({
        "timestamp": timestamp,
        "ip": ip
    })


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
