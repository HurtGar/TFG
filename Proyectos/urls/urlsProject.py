from django.urls import path
from Proyectos.views import viewsProject, viewsBloc

urlpatterns = [
    # Proyectos
    path('user/<int:id_user>/', viewsProject.GetAllProjectFromAnUser.as_view(), name='proyectos_usuario'),
    path('<int:id_project>/user/<int:id_user>', viewsProject.GetOneProjectFromAnUser.as_view(), name='listar_proyecto'),
    path('list_users/<int:id_project>', viewsProject.GetAllUsersFromAProject.as_view(), name='listar_usuarios'),
    path('project/<int:id_project>/blocks', viewsProject.GetAllBlocksFromAProject.as_view(),
         name='listar_bloques_proyecto'),
    path('project/<int:id_project>/tasks', viewsProject.GetAllTaskFromAProject.as_view(),
         name='listar_tareas_proyecto'),
    path('project/<int:id_project>/blocs/<int:id_bloc>/tasks', viewsProject.GetAllTaskFromABlock.as_view(),
         name='listar_tareas_bloque'),
    path('project/<int:id_project>/records', viewsProject.GetRecordsChangesFromProject.as_view(),
         name='historico_proyecto'),
    path('project/create', viewsProject.CreateProject.as_view(), name='crear_proyecto'),
    path('project/<int:id_project>/update', viewsProject.UpdateProject.as_view(), name='actualizar_proyecto'),
    path('project/delete/<int:id_project>', viewsProject.DeleteProject.as_view(), name='borrar_proyecto'),

]
