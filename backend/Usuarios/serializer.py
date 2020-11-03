# Archivo para serializar mis modelos de django a JSON.
# Con esto permitimos que cualquier aplicación, sea cual sea el lenguaje
# que utilice, pueda consumir nuestra API.

# Debemos instalar dos paquetes: pip install djangorestframework && pip install django-cors-headers
from rest_framework import serializers
from backend.Usuarios.models import *
from backend.Proyectos.serializer import ProyectoSerializer, BloqueSerializer, TareaSerializer


# Usuarios

class PermisosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permisos
        fields = ['idpermiso', 'nombrepermiso', 'codigonombre']


class RolesSerializer(serializers.ModelSerializer):
    permisos = PermisosSerializer(many=True, read_only=True)

    class Meta:
        model = Rol
        fields = ['idrol', 'descrol', 'nivelrol', 'permisos']


class UsuarioSerializer(serializers.ModelSerializer):
    roles = RolesSerializer(many=True, read_only=True)
    proyectos = ProyectoSerializer(many=True, read_only=True)

    class Meta:
        model = Usuario
        fields = '__all__'


class PermisosRolesSerializer(serializers.ModelSerializer):
    permisos = PermisosSerializer(many=True, read_only=True)
    roles = RolesSerializer(many=True, read_only=True)

    class Meta:
        model = PermisosRoles
        fields = ['id', 'permisos', 'roles']


class RolesUsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = RolesUsuarios
        fields = '__all__'


class TareasUsuariosSerializer(serializers.ModelSerializer):
    proyectos_idproyecto = ProyectoSerializer()
    usuarios_idusuario = UsuarioSerializer()
    bloques_idbloque = BloqueSerializer()
    tareas_idtarea = TareaSerializer()

    class Meta:
        model = TareasUsuarios
        fields = '__all__'


class RegistroEntradaUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegistroEntradaUsuario
        fields = '__all__'
