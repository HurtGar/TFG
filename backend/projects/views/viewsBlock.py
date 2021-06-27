from django.http import Http404
from django.db.models import Sum
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from projects.serializer import *
from users.serializer import *

"""
Views to obtain data related to the Blocs table of the DB
"""


class GetAllBlocsFromAnUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_user):

        try:
            return Bloque.objects.filter(bloquesusuarios__usuarios_idusuario=id_user).distinct()
        except Bloque.DoesNotExist:
            raise Http404

    def get(self, request, id_user):
        blocs = self.get_object(self, id_user)
        serializer = BloqueSerializer(blocs, many=True)
        return Response(serializer.data)


class GetOneBlocFromAnUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_user, id_block):
        try:
            block = Bloque.objects.filter(bloquesusuarios__usuarios_idusuario=id_user, idbloque=id_block).distinct()
            return block
        except Bloque.DoesNotExist:
            raise Http404("Bloque no existe.")

    def get(self, request, id_user, id_block):
        blocks = self.get_object(self, id_user, id_block)
        serializer = BloqueSerializer(blocks, many=True)
        return Response(serializer.data)


class GetUsersFromABlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_block):
        try:
            # return Usuario.objects.raw('''select distinct(idusuario) from gestion.usuarios u
            #             inner join gestion.tareas_usuario tu on u.idusuario = tu.usuarios_idusuario_id
            #             inner join gestion.tareas t on t.idtarea = tu.tareas_idtarea_id
            #             inner join gestion.bloques b on t.proyectos_idproyecto = b.idbloque where b.idbloque = %s order by idusuario''',
            #                            [id_block])
            return Usuario.objects.filter(bloquesusuarios__bloques_idbloque=id_block)
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request, id_block):
        users = self.get_object(self, id_block)
        serializer = UsuarioSerializer(users, many=True)
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
            return Tarea.objects.filter(bloques_idbloque=id_block).aggregate(horasestimacion=Sum('horasestimacion'),
                                                                             horasactuales=Sum('horasactuales'))
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
            blocks = Bloque.objects.filter(iniciobloque__gte=request.data['init_date'],
                                           finbloque__lte=request.data['end_date'])
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


class GetLastModificationFromABlock(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return HistorialModificaciones.objects.raw('''
                SELECT hm.* FROM gestion.historial_modificacion_bloque hmp 
                inner join gestion.historial_modificaciones hm on hmp."historialModificaciones_idhistorial_id" = hm.idhistorico
                WHERE hmp.bloques_idbloque_id = %s order by hm.fechahistorico desc limit 1''', [id_block])
        except HistorialModificaciones.DoesNotExist:
            raise Http404

    def get(self, request, id_block):
        block = self.get_object(id_block)
        serializer = HistorialModificacionesSerializer(block, many=True)
        return Response(serializer.data)


class SetBlockToAProject(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return Bloque.objects.get(idbloque=id_block)
        except Bloque.DoesNotExist:
            raise Http404

    def put(self, request, id_block):
        block = self.get_object(id_block)
        try:
            project = Proyecto.objects.get(idproyecto=request.data['proyecto_idproyecto'])
            serializer = BloqueUpdateSerializer(block, request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_200_OK)
        except Proyecto.DoesNotExist:
            return Http404("El proyecto no existe.", status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CreateBlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, format=None):
        """Insertar datos de un proyecto"""
        serializer = CreateBloqueSerializer(data=request.data)
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
        serializer = UpdateBloqueSerializer(block, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeleteAssignmentBlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return BloquesUsuarios.objects.filter(bloques_idbloque_id=id_block)
        except BloquesUsuarios.DoesNotExist:
            raise Http404

    def delete(self, request, id_block):
        block = self.get_object(id_block)
        block.delete()
        return Response(status=status.HTTP_200_OK)


class DeleteBlock(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_block):
        try:
            return Bloque.objects.get(idbloque=id_block)
        except Bloque.DoesNotExist:
            raise Http404

    def delete_object(self, id_block):
        try:
            return HistorialModificacionBloque.objects.get(bloques_idbloque_id=id_block)
        except HistorialModificacionBloque.DoesNotExist:
            raise Http404

    def delete(self, request, id_block, format=None):
        """ Remove a project with de id = id_project
            :param id_project: Unique identifier of the project
            :param request:
            :returns Response --> Respuesta del servidor con código 204.
        """
        history = self.delete_object(id_block)
        history.delete()
        block = self.get_object(id_block)
        block.delete()
        return Response(status=status.HTTP_200_OK)


class InsertRecord(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, id_block):
        try:
            block = Bloque.objects.get(idbloque=id_block)
            record = HistorialModificaciones(fechahistorico=request.data['fechahistorico'],
                                             motivo=request.data['motivo'], deschistorico=request.data['deschistorico'],
                                             usuarios_idusuario=request.data['usuarios_idusuario'])
            if record:
                record.save()
                rec_hist = HistorialModificacionBloque(bloques_idbloque_id=block.idbloque,
                                                       historialModificaciones_idhistorial_id=record.idhistorico)
                rec_hist.save()
                return Response(status=status.HTTP_200_OK)
            else:
                return Response({'error': 'No se ha podido guardar el proyecto en el historial.'},
                                status=status.HTTP_400_BAD_REQUEST)

        except Bloque.DoesNotExist:
            raise Http404


class GetLastInsertedBlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            return Bloque.objects.latest('idbloque')
        except Bloque.DoesNotExist:
            raise Http404

    def get(self, request):
        block = self.get_object()
        serializer = BloqueSerializer(block)
        return Response(serializer.data)


class CreateAssignmentBlock(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        assignment = BloquesUsuarios(bloques_idbloque_id=request.data['idbloque'],
                                     usuarios_idusuario_id=request.data['idusuario'])
        if assignment:
            assignment.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response({'error': 'Error al asignar bloque-usuario.'}, status=status.HTTP_400_BAD_REQUEST)
