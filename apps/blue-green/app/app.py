import flask

app = flask.Flask(__name__)


@app.route('/')
def index():
    return "Blue-Green 1.0"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5656,debug=True)
