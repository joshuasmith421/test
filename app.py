from flask import Flask


def create_app():
    app = Flask(__name__)
    app.config.from_object('flask_config')

    @app.route('/')
    async def t():
        return {'ok': 'y'}

    return app
