CELERY_BROKER_URL = 'amqp://localhost'
CELERY_RESULT_BACKEND = 'mongodb://localhost:27017/celery'
MONGO_URI = 'mongodb://localhost:27017/maind'
CP = 'COP'
CELERYBEAT_SCHEDULE = {
    'sync': {
        'task': 'app.sync_task',
        'schedule': 10
    },
}
