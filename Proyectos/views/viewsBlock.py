from django.http import Http404
from django.db.models import Sum
from rest_framework import status
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
    def get_object(self, id_user, id_block):
        try:
            block = Bloque.objects.filter(bloque__tareasusuarios__usuarios_idusuario_id=id_user, idbloque=id_block).distinct()
            return block
        except Bloque.DoesNotExist:
            raise Http404("Bloque no existe.")

    def get(self, request, id_user, id_block):
        blocks = self.get_object(self,id_user, id_block)
        serializer = BloqueSerializer(blocks, many=True)
        return Response(serializer.data)



class GetUsersFromABlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_block):
        try:
            return Usuario.objects.raw('''select distinct(idusuario) from gestion.usuarios u 
                        inner join gestion.tareas_usuario tu on u.idusuario = tu.usuarios_idusuario_id 
                        inner join gestion.tareas t on t.idtarea = tu.tareas_idtarea_id 
                        inner join gestion.bloques b on t.proyectos_idproyecto = b.idbloque where b.idbloque = %s order by idusuario''',
                                       [id_block])
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request, id_block):
        users = self.get_object(self,id_block)
        serializer = UsuarioSerializer(users, many = True)
        return Response(serializer.data)


class GetAllTaskFromABlock(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_objetc(self, id_block):
        try:
            return Tarea.objects.filter(bloques_idbloque=id_block)
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_block, format=None):
        blocks = self.get_objetc(id_block)
        serializer = TareaSerializer(blocks, many=True)
        return Response(serializer.data)


class GetHoursFromABlock(APIView):

    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return Tarea.objects.filter(bloques_idbloque=id_block).aggregate(horasestimacion=Sum('horasestimacion'), horasactuales=Sum('horasactuales'))
        except Bloque.DoesNotExist:
            raise Http404

    def get(self, request, id_block):
        hours = self.get_object(id_block)
        return Response(hours)


class GetBlocksBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def post(request):
        try:
            blocks = Bloque.objects.filter(iniciobloque__gt=request.data['init_date'], finbloque__lt=request.data['end_date'])
            serializer = BloqueSerializer(blocks, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Bloque.DoesNotExist:
            raise Http404()


class GetCreatedBlocksBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def post(request):
        try:
            blocks = Bloque.objects.filter(fechacreacion__gte=request.data['init_date'],
                                              fechacreacion__lte=request.data['end_date'])
            serializer = BloqueSerializer(blocks, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Bloque.DoesNotExist:
            raise Http404


class GetRecordsChangesFromProject(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return HistorialModificacionBloque.objects.filter(bloques_idbloque=id_block)
        except HistorialModificacionBloque.DoesNotExist:
            raise Http404

    def get(self, request, id_block, format=None):
        records = self.get_object(id_block)
        serializer = HistorialModificacionBloqueSerializer(records, many=True)
        return Response(serializer.data)


class SetBlockToAProject(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return Bloque.objects.get(idbloque=id_block)
        except Bloque.DoesNotExist:
            raise Http404

    def put(self, request,id_block):
        block = self.get_object(id_block)
        try:
            project = Proyecto.objects.get(idproyecto=request.data['proyecto_idproyecto'])
            serializer = BloqueUpdateSerializer(block, request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
        except Proyecto.DoesNotExist:
            return Http404("El proyecto no existe.",status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CreateBlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, format=None):
        """Insertar datos de un proyecto"""
        serializer = BloqueSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UpdateBlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return Bloque.objects.get(idbloque=id_block)
        except Bloque.DoesNotExist:
            raise Http404

    def put(self, request, id_block, format=None):
        """Crear un nuevo elemento o reemplazar un proyecto."""
        block = self.get_object(id_block)
        serializer = BloqueSerializer(block, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeleteBlock(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return Bloque.objects.get(idbloque=id_block)
        except Bloque.DoesNotExist:
            raise Http404

    def delete(self, request, id_block, format=None):
        """ Remove a project with de id = id_project
            :param id_project: Unique identifier of the project
            :param request:
            :returns Response --> Respuesta del servidor con código 204.
        """
        block = self.get_object(id_block)
        block.delete()
        return Response(status=status.HTTP_200_OK)
