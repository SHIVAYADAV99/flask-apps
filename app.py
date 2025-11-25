from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Flask + Gunicorn + Nginx is working!"

if __name__ == "__main__":
    app.run()
