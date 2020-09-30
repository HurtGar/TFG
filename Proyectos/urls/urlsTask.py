from django.urls import path

from Proyectos.views import viewsTask

urlpatterns = [
    # Bloques
    path('user/<int:id_user>', viewsTask.GetAllTasksFromAnUser().as_view(), name='listar_tareas_usuario'),

]
