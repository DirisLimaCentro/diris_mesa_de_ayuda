import os
from pathlib import Path
import pymysql

pymysql.install_as_MySQLdb()

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'a4-kdyji*masrj#n7)w^+0)u24&s1xag^@@a#^9bue@@ietb2v'

DEBUG = True

ALLOWED_HOSTS = [
    'app6.dirislimacentro.gob.pe',
    '10.0.0.8',
    'localhost'
]

CSRF_TRUSTED_ORIGINS = [
    "https://app6.dirislimacentro.gob.pe",
]

SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True

# Reverse proxy configuration
FORCE_SCRIPT_NAME = '/MesaDeAyuda'
USE_X_FORWARDED_HOST = True
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

CORS_ORIGIN_ALLOW_ALL = True


INSTALLED_LIBRARIES = [
    'setup',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'django_filters',
    'widget_tweaks',
    'django_select2',
]

INSTALLED_MODULES = [
    'apps.templates',
    'apps.util',
    'apps.util.generic_filters',
    'apps.util.dropdown_list',
    'apps.index',
    'apps.localizations',
    'apps.reclamo',
    'apps.reclamo_administrador',
    'apps.evaluacion_entidad',
    'apps.reportes',
    'apps.trama_txt',
]

INSTALLED_APPS = INSTALLED_LIBRARIES + INSTALLED_MODULES


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'apps.middlewares.request.AppRequestMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'diris_mesa_de_ayuda',
        'USER': 'root',
        'PASSWORD': 'Administrador@123',
        'HOST': '127.0.0.1',
        'PORT': '3306',
        'OPTIONS': {
            'sql_mode': 'traditional',
        }
    }
}


ROOT_URLCONF = 'main.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(BASE_DIR, '..', 'templates')
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'builtins': [
                'apps.util.generic_filters.templatetags.paginator',
                'apps.util.generic_filters.templatetags.updateurl',
                'apps.util.generic_filters.templatetags.utils',
            ],
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.template.context_processors.i18n',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.media',
            ],
        },
    },
]


WSGI_APPLICATION = 'main.wsgi.application'


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
        'OPTIONS': {
            'min_length': 6,
        },
    },
]


REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly'
    ],
    'DEFAULT_FILTER_BACKENDS': ['django_filters.rest_framework.DjangoFilterBackend'],
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 50
}


LANGUAGE_CODE = 'es-PE'
TIME_ZONE = 'America/Lima'

USE_I18N = True
USE_L10N = True
USE_TZ = True


EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'desarrollo.dirislimacentro@gmail.com'
EMAIL_HOST_PASSWORD = "mgcrigvkgtuuqluw"
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER


# MEDIA FILES
MEDIA_URL = '/MesaDeAyuda/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')


# STATIC FILES
STATIC_URL = '/MesaDeAyuda/staticfiles/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static'),
]


AUTH_USER_MODEL = 'setup.usuario'

AUTHENTICATION_BACKENDS = [
    'setup.backends.ActiveDirectoryBackend',
    'django.contrib.auth.backends.ModelBackend',
]


LOGIN_URL = '/MesaDeAyuda/login/'
LOGIN_REDIRECT_URL = '/MesaDeAyuda/'
LOGOUT_REDIRECT_URL = '/MesaDeAyuda/login/'