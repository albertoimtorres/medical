from .base import *

"""
    Configuración para el ambiente de desarrollo (local).
    Esta configuración es unica para este entorno.

    Para ejecutar el proyecto de manera local
    ejecutar el siguiiente comando.

    python manage.py runserver --settings=medical.settings.local
"""

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'pacientes', # os.path.join(BASE_DIR, 'db.sqlite3'),
        'USER': 'admin',
        'PASSWORD': 'admin',
        'HOST': '127.0.0.1',
        'PORT': '5432'
    }
}


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

STATIC_URL = '/static/'
