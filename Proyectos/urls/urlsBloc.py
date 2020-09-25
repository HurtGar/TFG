from django.urls import path
from Proyectos.views import viewsProject, viewsBloc

urlpatterns = [
    # Bloques
    path('user/<int:id_user>', viewsBloc.GetAllBlocsFromAnUser().as_view(), name='listar_bloques_usuario'),
    path('<int:id_bloc>/user/<int:id_user>', viewsBloc.GetOneBlocFromAnUser().as_view(), name='obtener_bloque_usuario'),

]
