from django.http import Http404
from rest_framework import generics, status
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from Proyectos.serializer import *
from Login.serializer import *
from Login.models import *

"""
Views to obtain data related to the Projects table of the DB
"""


class GetAllProjectFromAnUser(APIView):
    """generics.ListAPIView"""

    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_usuario):
        try:
            user_tasks = TareasUsuarios.objects.filter(usuarios_idusuario=id_usuario)
            list_project = []
            for ut in user_tasks:
                if not list_project.__contains__(ut.tareas_idtarea):
                    # Si accedemos a tareas_idtarea no estamos accediendo al id de la tarea,
                    # sino a la tarea como objeto, es por ello que debemos acceder a su id añadiendo _id
                    task = Tarea.objects.get(idtarea=ut.tareas_idtarea_id)
                    list_project.append(task.proyectos_idproyecto_id)
        except Proyecto.DoesNotExist:
            raise Http404

        return Proyecto.objects.filter(idproyecto__in=list_project)

    def get(self, request, id_usuario, format=None):
        project = self.get_object(id_usuario)
        serializer = ProyectoSerializer(project, many=True)
        return Response(serializer.data)


class GetOneProjectFromAnUser(APIView):
    """Class to get one project of an user"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_usuario, id_proyecto):
        try:
            user_tasks = TareasUsuarios.objects.filter(usuarios_idusuario=id_usuario)
            for ut in user_tasks:
                task = Tarea.objects.get(idtarea=ut.tareas_idtarea_id)
                if task.proyectos_idproyecto_id == id_proyecto:
                    return Proyecto.objects.get(idproyecto=id_proyecto)

        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_usuario, id_proyecto, format=None):
        proyecto = self.get_object(id_usuario, id_proyecto)
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


class GetAllUsersFromAProject(APIView):
    """Retrieve all users from a project"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        try:
            users = TareasUsuarios.objects.all()
            users_list = []
            for us in users:
                task = Tarea.objects.get(idtarea=us.tareas_idtarea_id)
                if task.proyectos_idproyecto_id == id_project:
                    users_list.append(us.usuarios_idusuario_id)

            return Usuario.objects.filter(idusuario__in=users_list)

        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project, format=None):
        users = self.get_object(id_project)
        serializer = UsuarioSerializer(users, many=True)
        return Response(serializer.data)


class GetAllBlocksFromAProject(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        return Bloque.objects.filter(proyecto_idproyecto=id_project)

    def get(self, request, id_project, format=None):
        bloque = self.get_object(id_project)
        serializer = BloqueSerializer(bloque, many=True)
        return Response(serializer.data)


class GetAllTaskFromAProject(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_objetc(self, id_project):
        try:
            blocks = Bloque.objects.filter(proyecto_idproyecto=id_project)
            tasks_list = []
            for b in blocks:
                if not tasks_list.__contains__(b.idbloque):
                    tasks_list.append(b.idbloque)

            return Tarea.objects.filter(bloques_idbloque__in=tasks_list)
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project):
        blocks = self.get_objetc(id_project)
        serializer = TareaSerializer(blocks, many=True)
        return Response(serializer.data)


class GetAllTaskFromABlock(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_objetc(self, id_project, id_block):
        try:
            blocks = Bloque.objects.filter(proyecto_idproyecto=id_project)
            tasks_list = []
            for b in blocks:
                if b.idbloque == id_block:
                    if not tasks_list.__contains__(b.idbloque):
                        tasks_list.append(b.idbloque)

            return Tarea.objects.filter(bloques_idbloque__in=tasks_list)
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project, id_block, format=None):
        blocks = self.get_objetc(id_project, id_block)
        serializer = TareaSerializer(blocks, many=True)
        return Response(serializer.data)


class GetAllProject(APIView):
    """Class to obtain """

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

    def get(self, request, format=None):
        prioridades = self.get_object()
        serializer = PrioridadSerializer(prioridades, many=True)

        return Response(serializer.data)
