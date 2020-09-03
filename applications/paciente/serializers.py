from rest_framework import serializers
from .views import Paciente

class PacienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paciente
        fields = (
            'id',
            'no_expediente',
            'tipo_sangre',
            'alergias'
        )