from django.contrib.postgres.fields.array import ArrayField
from django.db import models

# Create your models here.
class Paciente(models.Model):
    no_expediente = models.IntegerField('Número de expediente', unique=True)
    tipo_sangre = models.CharField('Tipo de sangre', max_length=3)
    alergias = ArrayField(models.CharField(max_length=100), size=3)

    def __str__(self):
        return str(self.no_expediente) + ' - ' + self.tipo_sangre + ' - ' + " - ".join(self.alergias)