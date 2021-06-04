from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView

from users.models import Rol, Permisos


class GetToken(APIView):
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        if username is None or password is None:
            return Response({'error': 'Username or password incorrect.'}, status=status.HTTP_404_NOT_FOUND)
        user = authenticate(username=username, password=password)

        if not user:
            return Response({'error': 'Invalid credentials.'}, status=status.HTTP_404_NOT_FOUND)

        token = Token.objects.get(user=user)
        return Response({'token': token.key}, status=status.HTTP_200_OK)


class GetAuthToken(APIView):
    def post(self, request):
        getUser = User.objects.get(username=request.data['email'])
        getRolUser = Rol.objects.filter(rolesusuarios__usuarios_idusuario=getUser.id)
        getPermissionUser = Permisos.objects.filter(permisos__roles_idrol__in=getRolUser)

        response_rol = []
        if getRolUser:
            for rol in getRolUser:
                #response_rol_object = {'rol': rol.nivelrol}
                response_rol.append(rol.nivelrol)

        response_permission = []
        if getPermissionUser:
            for permission in getPermissionUser:
                response_permission.append(permission.idcodigo)

        user = authenticate(username=getUser.username, password=request.data['password'])
        if user is None:
            return Response({'error': 'Email or password incorrect.'}, status=status.HTTP_401_UNAUTHORIZED)
        token = Token.objects.get(user=user)
        response = {'token': token.key, 'userId': getUser.id, 'superuser': getUser.is_superuser, 'roles': response_rol, 'permission':response_permission}
        return Response(
            response,
            status=status.HTTP_200_OK)
