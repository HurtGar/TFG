from django.http import Http404
from rest_framework.response import Response
from rest_framework.views import APIView

from Proyectos.serializer import *

"""
Views to obtain data related to the priority table of the DB
"""


class GetPriorities(APIView):

    def get_object(self):
        try:
            return Prioridad.objects.all()
        except Prioridad.DoesNotExist:
            raise Http404

    def get(self, request):
        priorities = self.get_object()
        serializer = PrioridadSerializer(priorities, many=True)
        return Response(serializer.data)


class GetPriorityById(APIView):

    def get_object(self, id_priority):
        try:
            return Prioridad.objects.get(idprioridad=id_priority)
        except Prioridad.DoesNotExist:
            raise Http404

    def get(self, request, id_priority):
        priority = self.get_object(id_priority)
        serializer = PrioridadSerializer(priority)
        return Response(serializer.data)
