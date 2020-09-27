from django.urls import path
from Proyectos.views import viewsProject, viewsBloc

urlpatterns = [
    # Bloques
    path('user/<int:id_user>', viewsBloc.GetAllBlocsFromAnUser().as_view(), name='listar_bloques_usuario'),
    path('<int:id_bloc>/user/<int:id_user>', viewsBloc.GetOneBlocFromAnUser().as_view(), name='obtener_bloque_usuario'),
    path('<int:id_bloc>', viewsBloc.GetOneBloc.as_view(), name='obtener_bloque'),
    path('project/<int:id_project>', viewsBloc.GetBlocsFromAProject.as_view(), name='bloques_proyecto'),
    path('project/<int:id_project>/blocs/<int:id_bloc>/tasks', viewsBloc.GetAllTaskFromABlock.as_view(),
         name='listar_tareas_bloque'),
]