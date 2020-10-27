from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import AuthenticationForm
from django.http import Http404
from django.http import HttpResponseRedirect
# Paquetes necesarios para el loging y logout con Token
from django.shortcuts import render
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect
from django.views.generic.edit import FormView
from rest_framework import generics, status
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from Usuarios.serializer import *


# INDEX DE PRUEBA
def index(request):
    return render(request, '../templates/index.html')

""""""

class ListarUsuarios(APIView):
    """INSERTAR COMENTARIOS"""
    def get_object(self):
        try:
            return Usuario.objects.all()
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request, format = None):
        usuarios = self.get_object()
        serializer = UsuarioSerializer(usuarios, many = True)

        return Response(serializer.data)

class ListarPermisosRoles(APIView):
    def get_object(self):
        try:
            return PermisosRoles.objects.all()
        except PermisosRoles.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

        permisos_roles = self.get_object()
        serializer = PermisosRolesSerializer(permisos_roles, many=True)
        return Response(serializer.data)


class ListarPermisos(APIView):
    def get_object(self):
        try:
            return Permisos.objects.all()
        except Permisos.DoesNotExist:
            raise Http404

    def get(self, request, format=None):
        permisos = self.get_object()
        serializer = PermisosSerializer(permisos, many=True)
        return Response(serializer.data)


class ListarRoles(APIView):
    def get_object(self):
        try:
            return Rol.objects.all()
        except Rol.DoesNotExist:
            raise Http404

    def get(self, request, format=None):
        rol = self.get_object()
        serializer = RolesSerializer(rol, many=True)
        return Response(serializer.data)


class Login(FormView):
    template_name = "login.html"
    form_class = AuthenticationForm
    # En reverse_lazy debemos definir el nombre que hayamos dado en el archivo URL a dicha ruta.
    # Con la llamada a list_proyectos, estaremos cargando la URL /proyectos/
    success_url = reverse_lazy('list_usuarios')

    # Buscar que es esto. El middleware CSRF y la etiqueta de plantilla proporcionan una protección fácil de usar
    # contra falsificaciones de solicitudes entre sitios. Este tipo de ataque ocurre cuando un sitio web malicioso
    # contiene un enlace, un botón de formulario o algún JavaScript que está destinado a realizar alguna acción en su
    # sitio web, utilizando las credenciales de un usuario conectado que visita el sitio malicioso en su navegador.
    # También se cubre un tipo de ataque relacionado, 'iniciar sesión CSRF', donde un sitio atacante engaña al
    # navegador de un usuario para que inicie sesión en un sitio con las credenciales de otra persona.
    @method_decorator(csrf_protect)  # CSRF = Cross Site Request Forgery
    @method_decorator(never_cache)  # Protección de la caché del navegador
    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return HttpResponseRedirect(self.get_success_url())  # Con este parámetro volvemos a la dirección definida
            # en success_url
        else:
            # Si no está autentificado, se vuelve a llamar a la función dispatch de la clase Usuarios
            return super(Login, self).dispatch(request, *args, *kwargs)

    def form_valid(self, form):  # Aquí aplicamos los filtros necesarios para poder realizar el logueo.
        # form es el form que estamos indicando en el objeto form_class. cleaned_data es un diccionario que guarda las
        # peticiones del form. Podemos acceder a él indicando el nombre del campo que queremos leer.
        user = authenticate(username=form.cleaned_data['username'], password=form.cleaned_data['password'])

        # Ahora debemos buscar el token asociado al usuario. Si no existe el token, se crea.
        token, _ = Token.objects.get_or_create(user=user)
        if token:
            login(self.request, form.get_user())
            return super(Login, self).form_valid(form)


class Logout(APIView):
    def get(self, request, format=None):
        request.user.auth_token.delete()
        return Response(status=status.HTTP_200_OK)
