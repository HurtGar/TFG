from django.urls import path
from Proyectos.views import viewsProject

urlpatterns = [
    # Proyectos
    path('user/<int:id_user>/', viewsProject.GetAllProjectFromAnUser.as_view(), name='proyectos_usuario'),
    path('<int:id_project>/user/<int:id_user>', viewsProject.GetOneProjectFromAnUser.as_view(), name='listar_proyecto'),
    path('<int:id_project>/list_users', viewsProject.GetAllUsersFromAProject.as_view(), name='listar_usuarios'),
    path('<int:id_project>/blocs', viewsProject.GetAllBlocksFromAProject.as_view(),
         name='listar_bloques_proyecto'),
    path('<int:id_project>/tasks', viewsProject.GetAllTaskFromAProject.as_view(),
         name='listar_tareas_proyecto'),
    path('<int:id_project>/hours', viewsProject.GetTotalHoursFromAProject.as_view(), name='obtener_horas'),
    path('search', viewsProject.GetProjectBetweenTwoDates.as_view(), name='buscar_proyecto'),
    path('search/created_date', viewsProject.GetCreatedProjectBetweenTwoDates.as_view(), name='buscar_fecha_creacion'),
    path('<int:id_project>/records', viewsProject.GetRecordsChangesFromProject.as_view(),
         name='historico_proyecto'),
    path('create', viewsProject.CreateProject.as_view(), name='crear_proyecto'),
    path('<int:id_project>/update', viewsProject.UpdateProject.as_view(), name='actualizar_proyecto'),
    path('delete/<int:id_project>', viewsProject.DeleteProject.as_view(), name='borrar_proyecto'),

]
