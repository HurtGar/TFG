from django.http import Http404
from rest_framework import generics, status
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from Proyectos.serializer import *
from Login.models import *

# Create your views here.


"""Vistas para obtener datos relacionados con la tabla Proyectos de la BD"""


class ListarProyecto(APIView):
    """Clase para obtener los datos de un proyecto en concreto."""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, pk):
        """Función que obtiene los datos del proyecto con idproyecto = pk

            :arg pk --> Clave primaria del proyecto a buscar.

            :returns Objeto Proyecto con idproyecto = pk.

            :exception Error 404 si no existe el proyecto.
        """
        try:
            return Proyecto.objects.get(idproyecto=pk)
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        """Obtener datos del proyecto mediante el método GET"""
        proyecto = self.get_object(pk)
        serializer = ProyectoSerializer(proyecto)
        return Response(serializer.data)

    def post(self, request, format=None):
        """Insertar datos de un proyecto"""
        serializer = ProyectoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, pk, format=None):
        """Crear un nuevo elemento o reemplazar un proyecto."""
        proyecto = self.get_object(pk)
        serializer = ProyectoSerializer(proyecto, data=request.DATA)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        """Eliminar un proyecto con idproyecto = pk
            :arg pk --> Clave primaria del proyecto
            :returns Response --> Respuesta del servidor con código 204.
        """
        proyecto = self.get_object(pk)
        proyecto.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class ListarTodosLosProyectos(APIView):
    """generics.ListAPIView"""

    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self):
        """Función que obtiene los datos de todos los proyectos

            :returns Objeto Proyecto con todos los proyectos de la BD

            :exception Error 404 si no hay proyectos en la BD.
        """
        try:
            return Proyecto.objects.all()
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, format=None):
        proyectos = self.get_object()  # Obtener todos los datos de Proyecto.
        serializer = ProyectoSerializer(proyectos,
                                        many=True)  # Cuando llamamos a .all(), debemos habilitar many = True para indicar que
        # podemos recibir más de un resultado en el serializer
        return Response(serializer.data)


# class ListarProyectosDeUsuario(APIView):
#     """Clase para obtener todos los proyectos de un usuario"""
#
#     def get_object(self, pk_usuario):
#         try:
#             tareas = Tareasusuario.objects.all()
#             listaProyectos = []
#             for tarea in tareas:
#                 if tarea.objects.get(usuarios_idusuario_id=pk_usuario):
#                     bloque = Tarea.objects.get(idtarea=tarea.tareas_idtarea).bloques_idbloque
#                     proyecto_id = Proyecto.objects.get(idproyecto=Bloque.objects.get(idbloque=bloque))
#                     listaProyectos.append(proyecto_id)
#
#             return Response(listaProyectos)
#
#         except Tareasusuario.DoesNotExist:
#             raise Http404
#
#     def get(self, request, id_usuario, format=None):
#         proyectos = self.get_object(id_usuario)
#         serializer = ProyectoSerializer(proyectos, many=True)
#         return serializer.data

class ListarPrioridades(APIView):
    def get_object(self):
        try:
            return Prioridad.objects.all()
        except Prioridad.DoesNotExist:
            raise Http404

    def get(self, request, format = None):
        prioridades = self.get_object()
        serializer = PrioridadSerializer(prioridades, many=True)

        return Response(serializer.data)