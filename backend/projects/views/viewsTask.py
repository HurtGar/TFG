from django.db.models import Sum
from django.http import Http404
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from django.db import connection

from users.serializer import *
from projects.serializer import *

""""""


class GetAllTasksFromAnUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_user):
        try:
            return Tarea.objects.filter(tareasusuarios__usuarios_idusuario=id_user)
        except Usuario.DoesNotExist:
            raise Http404()

    def get(self, request, id_user):
        tasks = self.get_object(id_user)
        serializer = TareaSerializer(tasks, many=True)
        return Response(serializer.data)


class GetOneTaskFromAnUser(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_user, id_task):
        try:
            return Tarea.objects.filter(tareasusuarios__usuarios_idusuario=id_user,
                                        tareasusuarios__tareas_idtarea=id_task).distinct()

        except Tarea.DoesNotExist:
            raise Http404

    def get(self, request, id_user, id_task):
        task = self.get_object(id_user, id_task)
        serializer = TareaSerializer(task, many=True)
        return Response(serializer.data)


class GetAllUsersFromATask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_task):
        try:
            return Usuario.objects.filter(tareasusuarios__tareas_idtarea_id=id_task)
        except Usuario.DoesNotExist:
            raise Http404

    def get(self, request, id_task):
        users = self.get_object(id_task)
        serializer = UsuarioSerializer(users, many=True)
        return Response(serializer.data)


class GetTotalHoursFromATask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_task):
        try:
            return Tarea.objects.filter(idtarea=id_task).aggregate(horasestimacion=Sum('horasestimacion'),
                                                                   horasactuales=Sum('horasactuales'))
        except Tarea.DoesNotExist:
            raise Http404
        except Exception:
            raise Exception

    def get(self, request, id_task):
        # Cuando queremos hacer llamadas a funciones que no devuelven un objeto serializado,
        # no hace falta hacer el serializer, devolvemos la respuesta directamente.
        hours = self.get_object(self, id_task)
        # Devolvemos horas actuales y horas estimación, las horas restantes las calcularemos en función de horasestimacion-horasactuales
        return Response(hours)


class GetTasksBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def post(request):
        try:
            tasks = Tarea.objects.filter(fechainicio__gte=request.data['init_date'],
                                         fechafin__lte=request.data['end_date'])
            serializer = TareaSerializer(tasks, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Tarea.DoesNotExist:
            raise Http404()


class GetCreatedTasksBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def post(request):
        try:
            tasks = Tarea.objects.filter(fechacreacion__gte=request.data['init_date'],
                                         fechacreacion__lte=request.data['end_date'])
            serializer = TareaSerializer(tasks, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Tarea.DoesNotExist:
            raise Http404


class GetLastUpdatedTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            return Tarea.objects.latest('fechaactualizacion')
        except Tarea.DoesNotExist:
            raise Http404

    def get(self, request):
        task = self.get_object()
        serializer = TareaSerializer(task)
        return Response(serializer.data)


class GetLastInsertedTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        try:
            cursor = connection.cursor()
            cursor.execute('''SELECT last_value from "gestion".tareas_idtarea_seq''')
            return cursor
        except Tarea.DoesNotExist:
            raise Http404

    def get(self, request):
        task = self.get_object()
        for i in task:
            for j in i:
                if j == 1:
                    return Response(0)
                else:
                    return Response(j)



class GetRecordsFromATask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        try:
            return HistorialModificacionTarea.objects.filter(tareas_idtarea=id_project)
        except HistorialModificacionTarea.DoesNotExist:
            raise Http404

    def get(self, request, id_task):
        records = self.get_object(id_task)
        serializer = HistorialModificacionTareaSerializer(records, many=True)
        return Response(serializer.data)


class GetLastModificationFromATask(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_task):
        try:
            return HistorialModificaciones.objects.raw('''
                SELECT hm.* FROM gestion.historial_modificacion_tarea hmp 
                inner join gestion.historial_modificaciones hm on hmp."historialModificaciones_idhistorial_id" = hm.idhistorico
                WHERE hmp.tareas_idtarea_id = %s order by hm.fechahistorico desc limit 1''', [id_task])
        except HistorialModificaciones.DoesNotExist:
            raise Http404

    def get(self, request, id_task):
        task = self.get_object(id_task)
        serializer = HistorialModificacionesSerializer(task, many=True)
        return Response(serializer.data)


class GetTasksWithAState(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_state):
        try:
            return Tarea.objects.filter(estados_idestado=id_state)
        except Tarea.DoesNotExist:
            raise Http404

    def get(self, request, id_state):
        tasks = self.get_object(id_state)
        serializer = TareaSerializer(tasks, many=True)
        return Response(serializer.data)


class GetTasksWithAPriority(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_priority):
        try:
            return Tarea.objects.filter(prioridades_idprioridad=id_priority)
        except Tarea.DoesNotExist:
            raise Http404

    def get(self, request, id_priority):
        tasks = self.get_object(self, id_priority)
        serializer = TareaSerializer(tasks, many=True)
        return Response(serializer.data)


class GetTaskByPriorityIdAndStateId(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        try:
            tasks = Tarea.objects.filter(prioridades_idprioridad_id=request.data['prioridades_idprioridad'],
                                         estados_idestado_id=request.data['estados_idestado'])
            if tasks:
                serializer = TareaSerializer(tasks, many=True)
                return Response(serializer.data, status=status.HTTP_200_OK)
            else:
                return Response(status=status.HTTP_404_NOT_FOUND)
        except Tarea.DoesNotExist:
            raise Http404


class CreateATaskAssignment(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        try:
            if not TareasUsuarios.objects.filter(tareas_idtarea_id=request.data['tareas_idtarea'],
                                                 usuarios_idusuario_id=request.data['usuarios_idusuario']):
                assignment = TareasUsuarios(usuarios_idusuario_id=request.data['usuarios_idusuario'],
                                            tareas_idtarea_id=request.data['tareas_idtarea'])
                assignment.save()
                return Response(status=status.HTTP_201_CREATED)
            else:
                return Response({'error': 'Usuario ya asignado a la tarea.'}, status=status.HTTP_400_BAD_REQUEST)
        except Exception:
            raise Exception


class UpdateAssignmentTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, id_task):
        try:
            # Obtener si el usuario ya tiene asignada dicha tarea.
            task = TareasUsuarios.objects.filter(tareas_idtarea_id=id_task,
                                                 usuarios_idusuario_id=request.data['usuarios_idusuario'])
            old_assignment = TareasUsuarios.objects.filter(tareas_idtarea_id=id_task,
                                                           usuarios_idusuario_id=request.data['old_usuarios_idusuario'])

            # Si no la tiene asignada, haremos la asignación
            if not task:
                if old_assignment:
                    old_assignment.update(usuarios_idusuario_id=request.data['usuarios_idusuario'])
                    return Response(status=status.HTTP_200_OK)
                else:
                    return Response({'Error': 'Asignación no encontrada.'}, status=status.HTTP_404_NOT_FOUND)
            else:  # Si ya la tiene asignada, devolvemos un error.
                return Response({'error': 'El usuario ya está asignado a la tarea.'},
                                status=status.HTTP_400_BAD_REQUEST)

        except Tarea.DoesNotExist:
            raise Http404()


class DeleteATaskAssignment(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def delete(self, request):
        try:
            task = TareasUsuarios.objects.filter(tareas_idtarea_id=request.data['tareas_idtarea'],
                                                 usuarios_idusuario_id=request.data['usuarios_idusuario'])
            if task:
                task.delete()
                return Response(status=status.HTTP_200_OK)
            else:
                return Response({'error': 'No existe esta asignación'}, status=status.HTTP_400_BAD_REQUEST)
        except TareasUsuarios.DoesNotExist:
            raise Http404


class CreateTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        serializer = CreateTareaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UpdateTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_task):
        try:
            return Tarea.objects.get(idtarea=id_task)
        except Tarea.DoesNotExist:
            raise Http404

    def put(self, request, id_task, format=None):
        """Crear un nuevo elemento o reemplazar un proyecto."""
        task = self.get_object(id_task)
        serializer = UpdateTareaSerializer(task, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeleteTask(APIView):
    """"""

    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_task):
        try:
            return Tarea.objects.get(idtarea=id_task)
        except Tarea.DoesNotExist:
            raise Http404

    def delete_object(self, id_task):
        try:
            return HistorialModificacionTarea.objects.get(tareas_idtarea_id=id_task)
        except HistorialModificacionTarea.DoesNotExist:
            raise Http404

    def delete(self, request, id_task, format=None):
        """ Remove a task with de id = id_task
            :param id_task: Unique identifier of the task
            :param request:
            :returns Response --> Respuesta del servidor con código 204.
        """
        history = self.delete_object(id_task)
        history.delete()
        task = self.get_object(id_task)
        task.delete()
        return Response(status=status.HTTP_200_OK)


class DeleteAssignmentTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_task):
        try:
            return TareasUsuarios.objects.filter(tareas_idtarea_id=id_task)
        except TareasUsuarios.DoesNotExist:
            raise Http404

    def delete(self, request, id_task):
        task = self.get_object(id_task)
        task.delete()
        return Response(status=status.HTTP_200_OK)


class InsertRecord(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, id_task):
        try:
            task = Tarea.objects.get(idtarea=id_task)
            record = HistorialModificaciones(fechahistorico=request.data['fechahistorico'],
                                             motivo=request.data['motivo'], deschistorico=request.data['deschistorico'],
                                             usuarios_idusuario=request.data['usuarios_idusuario'])
            if record:
                record.save()
                rec_hist = HistorialModificacionTarea(tareas_idtarea_id=task.idtarea,
                                                      historialModificaciones_idhistorial_id=record.idhistorico)
                rec_hist.save()
                return Response(status=status.HTTP_200_OK)
            else:
                return Response({'error': 'No se ha podido guardar la tarea en el historial.'},
                                status=status.HTTP_400_BAD_REQUEST)

        except Tarea.DoesNotExist:
            raise Http404


class RegisterHoursTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, id_task):
        task = Tarea.objects.get(idtarea=id_task)

        if task.horasactuales is None or task.horasrestantes is None:
            task.horasactuales = 0
            task.horasrestantes = 0
            task.save()

        task.horasestimacion = int(request.data['horasestimacion'])
        task.horasactuales += int(request.data['horasactuales'])
        task.horasrestantes = task.horasestimacion - task.horasactuales

        if task:
            task.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response({'error': 'No se han podido registrar las horas.'},
                            status=status.HTTP_400_BAD_REQUEST)


class CreateAssignmentTask(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        assignment = TareasUsuarios(tareas_idtarea_id=request.data['tareas_idtarea'],
                                     usuarios_idusuario_id=request.data['usuarios_idusuario'])
        if assignment:
            assignment.save()
            return Response(status=status.HTTP_200_OK)
        else:
            return Response({'error': 'Error al asignar tarea-usuario.'}, status=status.HTTP_400_BAD_REQUEST)
