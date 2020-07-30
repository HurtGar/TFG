from django.urls import path

from Proyectos import views

urlpatterns = [
    path('viewall/', views.ListarTodosLosProyectos.as_view(), name='listar_todos_proyectos'),
    path('proyecto/<int:pk>/', views.ListarProyecto.as_view(), name='listar_proyecto')
]
