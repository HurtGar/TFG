from django.http import Http404
from rest_framework import status
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from django.db.models import Sum
from Login.models import *
from Login.serializer import *
from Proyectos.serializer import *

"""
Views to obtain data related to the Projects table of the DB
"""


class GetAllProjectFromAnUser(APIView):
    """Get all projects from user"""

    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_user):
        """
        Get all the user's projects with id = user_id

        :param id_user: Unique identifier of the user
        :return: Projects where the user is
        """
        try:
            return Proyecto.objects.filter(proyecto_tarea__tareasusuarios__usuarios_idusuario=id_user).distinct()
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_user, format=None):
        """
        GET request to get user projects

        :param request: Request details
        :param id_user: Unique identifier of the user
        :param format: None
        :return: Object retrieved from call
        """
        project = self.get_object(id_user)
        serializer = ProyectoSerializer(project, many=True)
        return Response(serializer.data)


class GetOneProjectFromAnUser(APIView):
    """Class to get one project of an user"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_user, id_project):
        """
         Get one project with idusuario = id_usuario and idproyecto = id_proyecto

        :param id_user: Unique identifier of the user
        :param id_project: Unique identifier of the project
        :return: One project
        """
        try:
            return Proyecto.objects.filter(proyecto_tarea__tareasusuarios__usuarios_idusuario=id_user,
                                           idproyecto=id_project).distinct()

        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_user, id_project, format=None):
        """
        Get one project with idusuario = id_usuario and idproyecto = id_project

        :param request:
        :param id_user: Unique identifier of the user
        :param id_project: Unique identifier of the project
        :param format: None
        :return: One project
        """
        proyecto = self.get_object(id_user, id_project)
        serializer = ProyectoSerializer(proyecto, many=True)
        return Response(serializer.data)


class GetAllUsersFromAProject(APIView):
    """Retrieve all users from a project"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        """
        Get all user from a project where idproyecto = id_project

        :param id_project: Unique identifier of the project
        :return: A list of users of the project
        """
        # También se puede usar queries directamente con el código de BD usando .raw(query).
        try:
            return Usuario.objects.raw('''select distinct(idusuario) from gestion.usuarios u 
            inner join gestion.tareas_usuario tu on u.idusuario = tu.usuarios_idusuario_id 
            inner join gestion.tareas t on t.idtarea = tu.tareas_idtarea_id 
            inner join gestion.proyectos p on t.proyectos_idproyecto = p.idproyecto where p.idproyecto = %s order by idusuario''',
                                       [id_project])

        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project, format=None):
        """
        :param request:
        :param id_project:
        :param format:
        :return:
        """
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
            return Tarea.objects.filter(proyectos_idproyecto=id_project)
        except Proyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project):
        blocks = self.get_objetc(id_project)
        serializer = TareaSerializer(blocks, many=True)
        return Response(serializer.data)


class GetTotalHoursFromAProject(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def get_object(self, id_project):
        try:
            return Tarea.objects.filter(proyectos_idproyecto=id_project).aggregate(horasestimacion=Sum('horasestimacion'), horasactuales=Sum('horasactuales'))
        except Proyecto.DoesNotExist:
            raise Http404
        except Exception:
            raise Exception

    def get(self, request, id_project):
        #Cuando queremos hacer llamadas a funciones que no devuelven un objeto serializado,
        #no hace falta hacer el serializer, devolvemos la respuesta directamente.
        hours = self.get_object(self, id_project)
        #Devolvemos horas actuales y horas estimación, las horas restantes las calcularemos en función de horasestimacion-horasactuales
        return Response(hours)


class GetProjectBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def post(request):
        try:
            project = Proyecto.objects.filter(inicioproyecto__gte=request.data['init_date'], finproyecto__lte=request.data['end_date'])
            serializer = ProyectoSerializer(project, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Proyecto.DoesNotExist:
            raise Http404()


class GetCreatedProjectBetweenTwoDates(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    @staticmethod
    def post(request):
        try:
            project = Proyecto.objects.filter(fechacreacion__gte=request.data['init_date'], fechacreacion__lte=request.data['end_date'])
            serializer = ProyectoSerializer(project, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Proyecto.DoesNotExist:
            raise Http404


class GetRecordsChangesFromProject(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        try:
            return HistorialModificacionProyecto.objects.filter(proyectos_idproyecto=id_project)
        except HistorialModificacionProyecto.DoesNotExist:
            raise Http404

    def get(self, request, id_project, format=None):
        records = self.get_object(id_project)
        serializer = HistorialModificacionProyectoSerializer(records, many=True)
        return Response(serializer.data)


class CreateProject(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request, format=None):
        """Insertar datos de un proyecto"""
        serializer = ProyectoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UpdateProject(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        try:
            return Proyecto.objects.get(idproyecto=id_project)
        except Proyecto.DoesNotExist:
            raise Http404

    def put(self, request, id_project, format=None):
        """Crear un nuevo elemento o reemplazar un proyecto."""
        proyecto = self.get_object(id_project)
        serializer = ProyectoSerializer(proyecto, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DeleteProject(APIView):
    """"""
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get_object(self, id_project):
        try:
            return Proyecto.objects.get(idproyecto=id_project)
        except Proyecto.DoesNotExist:
            raise Http404

    def delete(self, request, id_project, format=None):
        """ Remove a project with de id = id_project
            :param id_project: Unique identifier of the project
            :param request:
            :returns Response --> Respuesta del servidor con código 204.
        """
        proyecto = self.get_object(id_project)
        proyecto.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
