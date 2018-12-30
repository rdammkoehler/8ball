import random
from datetime import datetime, timezone

from flask import Flask, jsonify, request

APP = Flask(__name__)

answers = [
    "It is certain.",
    "It is decidedly so.",
    "Without a doubt.",
    "Yes - definitely.",
    "You may rely on it.",
    "As I see it, yes.",
    "Most likely.",
    "Outlook good.",
    "Yes.",
    "Signs point to yes.",
    "Reply hazy, try again.",
    "Ask again later.",
    "Better not tell you now.",
    "Cannot predict now.",
    "Concentrate and ask again.",
    "Don't count on it.",
    "My reply is no.",
    "My sources say no.",
    "Outlook not so good.",
    "Very doubtful.",
]


@APP.route('/predict', methods=['GET'])
def get_predict():
    response = {
        'time': datetime.utcnow().replace(tzinfo=timezone.utc).isoformat(),
        'response': random.choice(answers)
    }
    if request.args.get('query'):
        response['query'] = request.args.get('query')
    return jsonify(response)


if __name__ == '__main__':
    APP.run()
