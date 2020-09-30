from django.http import Http404
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from Login.serializer import *
from Proyectos.serializer import *

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

    # getOneTaskFromAnUser
    # getAllUsersFromATask
    # getTasksBetweenTwoDates
    # getCreatedTasksBetweenTwoDates
    # getLastUpdatedTask
    # getRecordsFromATask
    # getHoursFromATask
    # getTasksWithAState
    # getTasksWithAPriority
    # updateAssignmentTask
    # createTask
    # updateTask
    # deleteTask
