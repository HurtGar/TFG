from django.urls import path

from Proyectos.views import viewsState

urlpatterns = [
    path('list_states', viewsState.GetAllStates.as_view(), name='listar_estados'),
    path('<int:id_state>', viewsState.GetStateWithId.as_view(), name='listar_estado_id'),
]
