from django.http import Http404
from rest_framework.response import Response
from rest_framework.views import APIView

from Proyectos.serializer import *

"""View for obtain all possible states of tasks."""


class GetAllStates(APIView):
    @staticmethod
    def get_object(self):
        try:
            return Estado.objects.all()
        except Estado.DoesNotExist:
            raise Http404

    def get(self, request):
        states = self.get_object(self)
        serializer = EstadoSerializer(states, many=True)
        return Response(serializer.data)


class GetStateWithId(APIView):
    def get_object(self, id_state):
        try:
            return Estado.objects.get(idestado=id_state)
        except Estado.DoesNotExist:
            raise Http404

    def get(self, request, id_state):
        state = self.get_object(id_state)
        serializer = EstadoSerializer(state)
        return Response(serializer.data)
