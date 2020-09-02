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

class BloqueSerializer(serializers.ModelSerializer):
    proyecto_idproyecto = ProyectoSerializer()

    class Meta:
        model = Bloque
        fields = '__all__'


class HistorialTareaSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistorialModificacionTarea
        fields = '__all__'


class PrioridadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prioridad
        fields = '__all__'


class EstadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Estado
        fields = '__all__'


class TareaSerializer(serializers.ModelSerializer):
    # bloque = BloqueSerializer(many=True, read_only=True)
    # estado = EstadoSerializer(many=True, read_only=True)
    # prioridad = PrioridadSerializer(many=True, read_only=True)

    bloques_idbloque = BloqueSerializer()
    estados_idestado = EstadoSerializer()
    prioridades_idprioridad = PrioridadSerializer()

    class Meta:
        model = Tarea
        fields = '__all__'
