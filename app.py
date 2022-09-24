from flask import Flask


def create_app():
    app = Flask(__name__)
    app.config.from_object('flask_config')

    # from yourapplication.model import db
    # db.init_app(app)
    #
    # from yourapplication.views.admin import admin
    # from yourapplication.views.frontend import frontend
    # app.register_blueprint(admin)
    # app.register_blueprint(frontend)

    @app.route('/')
    async def t():
        return {'ok': 'yesnt'}

    return app
