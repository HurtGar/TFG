# Archivo para serializar mis modelos de django a JSON.
# Con esto permitimos que cualquier aplicación, sea cual sea el lenguaje
# que utilice, pueda consumir nuestra API.

# Debemos instalar dos paquetes: pip install djangorestframework && pip install django-cors-headers
from rest_framework import serializers
from Login.models import *


# Proyecto
class ProyectoSerializer(serializers.ModelSerializer):
    # En class Meta: definimos los cambos que queremos y la configuración del serializador.
    class Meta:
        model = Proyecto
        # Debemos indicar los campos que queremos serializar. Se debe crear una lista.
        # Si queremos serializar todos los campos debemos usar __all__, sin listas.
        fields = '__all__'


# Usuarios
class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'