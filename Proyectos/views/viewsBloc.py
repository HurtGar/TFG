from django.http import Http404
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from Proyectos.serializer import *
from Login.serializer import *

"""
Views to obtain data related to the Blocs table of the DB
"""


class GetAllBlocsFromAnUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_user):

        try:
            return Bloque.objects.filter(bloque__tareasusuarios__usuarios_idusuario_id=id_user).distinct()
        except Bloque.DoesNotExist:
            raise Http404

    def get(self, request, id_user):
        blocs = self.get_object(self,id_user)
        serializer = BloqueSerializer(blocs, many=True)
        return Response(serializer.data)


class GetOneBlocFromAnUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_user, id_bloc):
        try:
            bloc = Bloque.objects.filter(bloque__tareasusuarios__usuarios_idusuario_id=id_user, idbloque=id_bloc).distinct()
            return bloc
        except Bloque.DoesNotExist:
            raise Http404("Bloque no existe.")

    def get(self, request, id_user, id_bloc):
        blocs = self.get_object(self,id_user, id_bloc)
        serializer = BloqueSerializer(blocs, many=True)
        return Response(serializer.data)


class GetOneBloc(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_bloc):
        try:
            return Bloque.objects.get(idbloque=id_bloc)
        except Bloque.DoesNotExist:
            raise Http404

    def get(self, request, id_bloc):
        bloc = self.get_object(self,id_bloc)
        serialize = BloqueSerializer(bloc)
        return Response(serialize.data)


class GetBlocsFromAProject(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_project):
        try:
            return Bloque.objects.filter(proyecto_idproyecto=id_project)
        except Bloque.DoesNotExist:
            raise Http404

    def get(self, request, id_project):
        blocs = self.get_object(self,id_project)
        serializer = BloqueSerializer(blocs, many = True)
        return Response(serializer.data)


class GetAllTaskFromABlock(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_objetc(self, id_project, id_bloc):
        try:
            return Tarea.objects.filter(bloques_idbloque=id_bloc, proyectos_idproyecto=id_project)
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project, id_bloc, format=None):
        blocks = self.get_objetc(id_project, id_bloc)
        serializer = TareaSerializer(blocks, many=True)
        return Response(serializer.data)
