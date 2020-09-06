from django.core.validators import BaseValidator
from django.core.exceptions import ValidationError
from jsonschema import validate

class JSONFieldSchemaValidator(BaseValidator):

    """
        Validador personalizado el cual se encarga de
        verificar que el diccionario que vas a guardar
        en el campo JSONField sea correcto.

        Al realizar un cambio dentro del Schema JSON
        Siempre se debe realizar un makemigrations y
        un migrate.

        $ python manage.py makemigrations

        $ python manage.py migrate

        Si se importa el ValidationError de parte Django
        se configura de la siguiente manera
        from django.core.exceptions import ValidationError

        raise ValidationError(
            _('%(value)s failed JSON schema check', params={'value': a})
        )

        Si la validación se realiza con 
        from jsonschema.exceptions import ValidationError

        Se configura el ValidationError de la siguiente forma

        return ValidationError(
            message=err.message,
            cause=err.cause,
            context=err.context,
            schema=err.schema,
            validator=err.validator
        )
    """

    def compare(self, a, b):
        try:
            validate(a, b)
        except ValidationError as err:
            raise ValidationError(
                _('%(value)s failed JSON schema check', params={'value': a})
            )