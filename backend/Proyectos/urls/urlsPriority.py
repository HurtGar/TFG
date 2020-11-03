from django.urls import path

from backend.Proyectos.views import viewsPriority

urlpatterns = [
    path('list_priorities', viewsPriority.GetPriorities.as_view(), name='listar_prioridades'),
    path('<int:id_priority>', viewsPriority.GetPriorityById.as_view(), name='listar_prioridad_id'),
]