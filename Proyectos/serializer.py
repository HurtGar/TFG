from Proyectos.models import *
from rest_framework import serializers


# Proyecto
class ProyectoSerializer(serializers.ModelSerializer):

    # En class Meta: definimos los cambos que queremos y la configuración del serializador.
    class Meta:
        model = Proyecto
        # Debemos indicar los campos que queremos serializar. Se debe crear una lista.
        # Si queremos serializar todos los campos debemos usar __all__, sin listas.
        fields = '__all__'
