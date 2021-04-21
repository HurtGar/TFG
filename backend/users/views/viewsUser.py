from django.contrib.auth import login, authenticate
from django.contrib.auth.models import User
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
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from users.models import Usuario, Rol

from users.serializer import *


# INDEX DE PRUEBA
def index(request):
    return render(request, '../templates/index.html')


"""Views for retrieving user data"""


class ListAllUsers(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            return Usuario.objects.all()
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request):
        users = self.get_object()
        serializer = TodosUsuariosSerializer(users, many=True)
        return Response(serializer.data)


class GetUserById(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, user_id):
        try:
            return Usuario.objects.filter(idusuario=user_id)
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request, user_id):
        user = self.get_object(user_id)
        serializer = UsuarioSerializer(user, many=True)
        return Response(serializer.data)


class GetUserByState(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_objetc(self, state):
        try:
            return Usuario.objects.filter(estado__exact=state)
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request, state):
        users = self.get_objetc(state)
        serializer = UsuarioSerializer(users, many=True)
        return Response(serializer.data)


class CreateUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):

        if self.validateIfUserExists(request.data['email']):
            self.createUser(request)
            self.createUsuario(request)

            if Usuario.objects.get(email=request.data['email']):
                self.assignRol(request.data['rol'], Usuario.objects.get(email=request.data['email']).idusuario)
                user_id = User.objects.get(username__exact=request.data['email'])
                token = Token.objects.create(user=user_id)
                return Response({'token': token.key}, status=status.HTTP_201_CREATED)
            else:
                return Response({'error': 'Usuario no insertado.'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'El usuario ya existe.'}, status=status.HTTP_400_BAD_REQUEST)

    def createUsuario(self, request):
        usuario = Usuario()
        setattr(usuario, 'nombre', request.data['nombre'])
        setattr(usuario, 'primerapellido', request.data['primerapellido'])
        if 'segundoapellido' in request.data:
            setattr(usuario, 'segundoapellido', request.data['segundoapellido'])
        setattr(usuario, 'email', request.data['email'])
        if 'telefono' in request.data:
            setattr(usuario, 'telefono', request.data['telefono'])
        setattr(usuario, 'fecharegistro', request.data['fecharegistro'])
        setattr(usuario, 'password', User.objects.get(username=request.data['email']).password)
        if request.data['activar'] is True:
            setattr(usuario, 'estado', 1)
        else:
            setattr(usuario, 'estado', 0)

        if usuario.save() is not None:
            return Response({'error': 'Usuario no guardado.'}, status=status.HTTP_400_BAD_REQUEST)

    def createUser(self, request):
        user = User()
        setattr(user, 'username', request.data['email'])
        setattr(user, 'first_name', request.data['nombre'])
        setattr(user, 'last_name', request.data['primerapellido'])
        setattr(user, 'email', request.data['email'])
        user.set_password(request.data['password'])
        if request.data['activar'] is True:
            user.is_active = True
        else:
            user.is_active = False

        if request.data['administrador'] is True:
            user.is_superuser = True
        else:
            user.is_superuser = False

        user.is_staff = False
        if user.save() is not None:
            return Response({'error': 'Usuario no guardado.'}, status=status.HTTP_400_BAD_REQUEST)

    def assignRol(self, idrol, idusuario):
        roles_user = RolesUsuarios()
        setattr(roles_user, 'roles_idrol', Rol.objects.get(idrol__exact=idrol))
        setattr(roles_user, 'usuarios_idusuario',Usuario.objects.get(idusuario__exact=idusuario))
        if roles_user.save() is not None:
            return Response({'error': 'Rol no asignado.'}, status=status.HTTP_400_BAD_REQUEST)

    def validateIfUserExists(self, email):

        try:
            user = User.objects.get(username=email)
        except User.DoesNotExist:
            user = None

        try:
            usuario = Usuario.objects.get(email=email)
        except Usuario.DoesNotExist:
            usuario = None

        if user is None and usuario is None:
            return True
        else:
            return False


class UpdateUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def getUsuario(self, user_id):
        try:
            return Usuario.objects.get(idusuario=user_id)
        except Usuario.DoesNotExist:
            raise Http404

    def getUser(self, user_id):
        try:
            return User.objects.get(id=user_id)
        except User.DoesNotExist:
            raise Http404

    def updateUser(self, request, user_id):
        user = self.getUser(user_id)
        setattr(user, 'username', request.data['email'])
        setattr(user, 'first_name', request.data['nombre'])
        setattr(user, 'last_name', request.data['primerapellido'])
        setattr(user, 'email', request.data['email'])
        if user.save() is not None:
            return Response({'error': 'Usuario no guardado.'}, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, user_id):
        """Crear un nuevo elemento o reemplazar un proyecto."""

        self.updateUser(request, user_id)

        usuario = self.getUsuario(user_id)

        serializer = UsuarioSerializer(usuario, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeleteUser(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def getUsuario(self, user_id):
        try:
            return Usuario.objects.get(idusuario=user_id)
        except Usuario.DoesNotExist:
            raise Http404

    def getUser(self, user_id):
        try:
            return User.objects.get(id=user_id)
        except Usuario.DoesNotExist:
            raise Http404

    def delete(self, request, user_id):

        usuario = self.getUsuario(user_id)
        user = self.getUser(user_id)
        if usuario.delete() and user.delete():
            return Response(status=status.HTTP_200_OK)
        else:
            return Response({'error': 'Error al eliminar usuario.'}, status=status.HTTP_400_BAD_REQUEST)


# REGISTRO DE ACCESO DE LOS USUARIOS
class GetAccessBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        try:
            access = RegistroEntradaUsuario.objects.filter(fechaacceso__gte=request.data['fechaInicio'],
                                                           fechaacceso__lte=request.data['fechaFin'])
            serializer = RegistroEntradaUsuarioSerializer(access, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except RegistroEntradaUsuario.DoesNotExist:
            raise Http404


class GetAccessByDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        try:
            access = RegistroEntradaUsuario.objects.filter(fechaacceso__year=request.data['year'],
                                                           fechaacceso__month=request.data['month'],
                                                           fechaacceso__day=request.data['day'])
            serializer = RegistroEntradaUsuarioSerializer(access, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except RegistroEntradaUsuario.DoesNotExist:
            raise Http404


class GetAccessByIp(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        try:
            access = RegistroEntradaUsuario.objects.filter(ipacceso__exact=request.data['ip'])
            serializer = RegistroEntradaUsuarioSerializer(access, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except RegistroEntradaUsuario.DoesNotExist:
            raise Http404


class GetAccessByUserId(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, user_id):
        try:
            return RegistroEntradaUsuario.objects.filter(usuario_idusuario__idusuario=user_id)
        except RegistroEntradaUsuario.DoesNotExist:
            raise Http404

    def get(self, request, user_id):
        access = self.get_object(user_id)
        serializer = RegistroEntradaUsuarioSerializer(access, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class ListarPermisosRoles(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            return PermisosRoles.objects.all()
        except PermisosRoles.DoesNotExist:
            raise Http404

    def get(self, request):

        permisos_roles = self.get_object()
        serializer = PermisosRolesSerializer(permisos_roles, many=True)
        return Response(serializer.data)


class ListarPermisos(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            return Permisos.objects.all()
        except Permisos.DoesNotExist:
            raise Http404

    def get(self, request):
        permisos = self.get_object()
        serializer = PermisosSerializer(permisos, many=True)
        return Response(serializer.data)


class ListarRoles(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            return Rol.objects.all()
        except Rol.DoesNotExist:
            raise Http404

    def get(self, request):
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


class RegisterNewUser(APIView):

    def post(self, request):

        if self.validateIfUserExists(request.data['email']):
            self.createUser(request)

            serializer = UsuarioRegistroSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()

                userId = User.objects.get(username__exact=request.data['email'])
                token = Token.objects.create(user=userId)
                return Response({'token': token.key}, status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error': 'El usuario ya existe.'}, status=status.HTTP_400_BAD_REQUEST)

    def createUser(self, request):
        user = User()
        setattr(user, 'username', request.data['email'])
        setattr(user, 'first_name', request.data['nombre'])
        setattr(user, 'last_name', request.data['primerapellido'])
        setattr(user, 'email', request.data['email'])
        user.set_password(request.data['password'])
        user.is_active = True
        user.is_staff = False
        if user.save() is not None:
            return Response({'error': 'Usuario no guardado.'}, status=status.HTTP_400_BAD_REQUEST)

    def validateIfUserExists(self, email):

        try:
            user = User.objects.get(username=email)
        except User.DoesNotExist:
            user = None

        try:
            usuario = Usuario.objects.get(email=email)
        except Usuario.DoesNotExist:
            usuario = None

        if user is None and usuario is None:
            return True
        else:
            return False


class Logout(APIView):
    def get(self, request):
        request.user.auth_token.delete()
        return Response(status=status.HTTP_200_OK)
