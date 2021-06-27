from django.urls import path
from projects.views import viewsProject

urlpatterns = [
    # Proyectos
    path('user/<int:id_user>', viewsProject.GetAllProjectFromAnUser.as_view(), name='proyectos_usuario'),
    path('user/<int:id_user>/<int:id_project>', viewsProject.GetOneProjectFromAnUser.as_view(), name='listar_proyecto'),
    path('<int:id_project>/list-users', viewsProject.GetAllUsersFromAProject.as_view(), name='listar_usuarios'),
    path('<int:id_project>/blocs', viewsProject.GetAllBlocksFromAProject.as_view(),
         name='listar_bloques_proyecto'),
    path('<int:id_project>/user/<int:id_user>/blocks', viewsProject.GetAllBlocksFromAProjectAndUser.as_view(),
         name='bloques_proyecto_usuario'),
    path('<int:id_project>/tasks', viewsProject.GetAllTaskFromAProject.as_view(),
         name='listar_tareas_proyecto'),
    path('<int:id_project>/hours', viewsProject.GetTotalHoursFromAProject.as_view(), name='obtener_horas'),
    path('search', viewsProject.GetProjectBetweenTwoDates.as_view(), name='buscar_proyecto'),
    path('search/created_date', viewsProject.GetCreatedProjectBetweenTwoDates.as_view(), name='buscar_fecha_creacion'),
    path('<int:id_project>/records', viewsProject.GetRecordsChangesFromProject.as_view(),
         name='historico_proyecto'),
    path('create', viewsProject.CreateProject.as_view(), name='crear_proyecto'),
    path('update/<int:id_project>', viewsProject.UpdateProject.as_view(), name='actualizar_proyecto'),
    path('delete/<int:id_project>', viewsProject.DeleteProject.as_view(), name='borrar_proyecto'),
    path('insert_record/<int:id_project>', viewsProject.InsertRecord.as_view(), name='insertar_historico'),
    path('<int:id_project>/last_modification', viewsProject.GetLastModificationFromAProject.as_view(),
         name='last_modification_record'),
    path('last_inserted', viewsProject.GetLastInsertedProject.as_view(), name='ultima_insercion'),
    path('assignment', viewsProject.CreateAssignmentProject.as_view(), name='asignar_proyecto'),
    path('users', viewsProject.GetAllUsers.as_view(), name='usuarios_app'),
    path('delete/assignment/<int:id_project>', viewsProject.DeleteProjectAssignment.as_view(), name='eliminar_asignacion'),

]
