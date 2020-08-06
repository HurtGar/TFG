# Archivo para serializar mis modelos de django a JSON.
# Con esto permitimos que cualquier aplicación, sea cual sea el lenguaje
# que utilice, pueda consumir nuestra API.

# Debemos instalar dos paquetes: pip install djangorestframework && pip install django-cors-headers
from rest_framework import serializers
from Login.models import *


# Usuarios
class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = '__all__'


class PermisosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permisos
        fields = '__all__'


class RolesSerializer(serializers.ModelSerializer):
    permisos = PermisosSerializer(many= True, read_only=True)

    class Meta:
        model = Rol
        fields = ['idrol','descrol','nivelrol','permisos']


class PermisosRolesSerializer(serializers.ModelSerializer):
    permisos = serializers.StringRelatedField(many=True, read_only=True)
    roles = serializers.StringRelatedField(many=True, read_only=True)

    class Meta:
        model = PermisosRoles
        fields = ['id','permisos_idpermiso','roles_idrol','permisos','roles']


class RolesUsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = RolesUsuarios
        fields = '__all__'


class TareasUsuariosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tareasusuario
        fields = '__all__'


class RegistroEntradaUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegistroEntradaUsuario
        fields = '__all__'
