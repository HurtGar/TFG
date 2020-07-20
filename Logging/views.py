from django.shortcuts import render
from rest_framework import viewsets
from Logging.models import *
from Logging.serializer import *
# Create your views here.

class ProyectoViewSet(viewsets.ModelViewSet):
    serializer_class = ProyectoSerializer
    queryset = Proyecto.objects.all()   #Obtener todos los datos de Proyecto.