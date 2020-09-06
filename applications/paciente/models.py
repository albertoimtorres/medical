from django.contrib.postgres.fields.array import ArrayField
from django.contrib.postgres.fields import JSONField
from django.core.validators import RegexValidator
from django.db import models

from validators.paciente.json_field_schema import JSONFieldSchemaValidator
from helpers import get_schema

# Create your models here.
class Paciente(models.Model):

    no_expediente = models.IntegerField(
        'Número de expediente',
        validators=[
            RegexValidator(
                regex=r"^[0-9]+$",
                message='Solo números.'
            )
        ],
        unique=True
    )

    tipo_sangre = models.CharField(
        'Tipo de sangre',
        validators=[
            RegexValidator(
                regex=r"^(A|B|AB|O)[+-]$",
                message='Solo se admite el tipo de sangre.'
            )
        ],
        max_length=3
    )

    """
        Se implementa el validador custom en el campo JSONField
        y se pasa como parametro un Schema JSON valido, que realizara
        la comprobación de lo que guarde sea valido.
    """
    alergias = ArrayField(
        JSONField(
            validators=[
                JSONFieldSchemaValidator(
                    limit_value=get_schema.get_schema('schemas/alergias.json')
                )
            ]
        ),
        size=3
    )

    def __str__(self):
        return str(self.no_expediente) + ' - ' + self.tipo_sangre