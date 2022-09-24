import json
import sys

from app import create_app
sys.path.append('../')


def test_general():
    flask_app = create_app()
    with flask_app.test_client() as test_client:
        response = test_client.get('/').data.decode('utf-8')
        assert json.loads(response)['ok'] == 'y'


test_general()
