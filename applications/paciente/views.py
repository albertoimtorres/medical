from django.shortcuts import render
from django.urls import reverse
from django.http.response import JsonResponse
from django.views.generic import (
    TemplateView,
    CreateView,
    ListView
)

from .models import Paciente

# Django REST Framework
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.parsers import JSONParser

# Serializers
from .serializers import PacienteSerializer

"""
    Implementación de vistas genericas.
"""
# Create your views here.
class Index(TemplateView):
    template_name = 'paciente/index.html'

class Registro(CreateView):
    model = Paciente
    template_name = 'paciente/registro.html'
    fields = ['no_expediente', 'tipo_sangre', 'alergias']

    def get_success_url(self):
        return reverse('listado')

class Listar(ListView):
    model = Paciente
    template_name = 'paciente/listado.html'
    context_object_name = 'pacientes'

# Implementando Django REST Framework
"""
    Metodo GET - vista basada con funciones regulares.
    Dentro del path se recibe el id del paciente, que
    pasado como parametro dentro de la función.

    Se realiza la busqueda con el metodo get que permite
    obtener un solo objeto con el id proporcionado.

    Al ser encontrado el registro se serializa para ser
    devuelto en una estructura JSON.

    En caso de algun error la excepción cachara el error
    y lo resolvera con el mensaje y el status de la petición.
    
"""
@api_view(['GET'])
def obtener_paciente(request, id):
    try:
        paciente = Paciente.objects.get(pk=id)
        serializer = PacienteSerializer(paciente)
        return JsonResponse({'codigo': status.HTTP_200_OK, 'menaje': 'success', 'payload': serializer.data})
    except Paciente.DoesNotExist as err:
        return JsonResponse(({'codigo': status.HTTP_404_NOT_FOUND, 'mensaje': 'El id de paciente no existe.'}), status=status.HTTP_404_NOT_FOUND)

"""
    Metodo POST - vista basada con funciones regulares.
    Se reliza el envio de la estructura JSON paciente.
    
    JSONParser().parse(request)
    Analiza el JSON contenido de la solicitud.

    Al obtener el body de la solicitud, se para a la
    clase PacienteSerializer serializadora para validar
    si la estructura es valida con respecto al modelo.

    Si es valida se tranforma en un objeto valido para
    ser guardo en la base con el metodo save.

    En caso de algun error la excepción cachara el error
    y lo resolvera con el mensaje y el status de la petición.
    
"""
@api_view(['POST'])
def crear_paciente(request):
    paciente_data = JSONParser().parse(request)
    serializer = PacienteSerializer(data=paciente_data)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
    return JsonResponse(({'codigo': status.HTTP_400_BAD_REQUEST, 'mensaje': serializer.errors}), status=status.HTTP_400_BAD_REQUEST)
