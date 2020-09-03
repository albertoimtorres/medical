from .views import (
    Index,
    Registro,
    Listar,
    obtener_paciente,
    crear_paciente
)

"""paciente URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views

"""
    Index.as_view() permite crear una url por default al momento
    de abrir la ruta del servidor de desarrollo en el navegador
"""
urlpatterns = [
    path('paciente/', Index.as_view(), name='index'),
    path('paciente/registro', Registro.as_view(), name='registro'),
    path('paciente/listado', Listar.as_view(), name='listado'),
    path('paciente/v1/records/<int:id>', obtener_paciente, name='obtener_paciente'),
    path('paciente/v1/records', crear_paciente, name='records')
]
