from rest_framework import serializers

from projects.models import *


# Proyecto
class PrioridadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prioridad
        fields = '__all__'


class EstadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Estado
        fields = '__all__'


class ProyectoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proyecto
        fields = '__all__'


class BloqueSerializer(serializers.ModelSerializer):
    proyecto_idproyecto = ProyectoSerializer()
    class Meta:
        model = Bloque
        fields = '__all__'


class CreateBloqueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bloque
        fields = '__all__'


class UpdateBloqueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bloque
        fields = '__all__'


class BloqueUpdateSerializer(serializers.ModelSerializer):
    # proyecto_idproyecto = ProyectoSerializer()
    class Meta:
        model = Bloque
        fields = ['proyecto_idproyecto']


class TareaSerializer(serializers.ModelSerializer):
    bloques_idbloque = BloqueSerializer()
    proyectos_idproyecto = ProyectoSerializer()
    estados_idestado = EstadoSerializer()
    prioridades_idprioridad = PrioridadSerializer()

    class Meta:
        model = Tarea
        fields = '__all__'


class CreateTareaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tarea
        fields = '__all__'


class UpdateTareaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tarea
        fields = '__all__'


class HistorialModificacionesSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistorialModificaciones
        fields = '__all__'


class HistorialModificacionProyectoSerializer(serializers.ModelSerializer):
    historialModificaciones_idhistorial = HistorialModificacionesSerializer()
    proyectos_idproyecto = ProyectoSerializer()

    class Meta:
        model = HistorialModificacionProyecto
        fields = '__all__'


class HistorialModificacionBloqueSerializer(serializers.ModelSerializer):
    historialModificaciones_idhistorial = HistorialModificacionesSerializer()
    bloques_idbloque = BloqueSerializer()

    class Meta:
        model = HistorialModificacionBloque
        fields = '__all__'


class HistorialModificacionTareaSerializer(serializers.ModelSerializer):
    historialModificaciones_idhistorial = HistorialModificacionesSerializer()
    tareas_idtarea = TareaSerializer()

    class Meta:
        model = HistorialModificacionTarea
        fields = '__all__'


class HistorialTareaSerializer(serializers.ModelSerializer):
    class Meta:
        model = HistorialModificacionTarea
        fields = '__all__'


