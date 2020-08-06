from django.urls import path

from Proyectos import views

urlpatterns = [
    path('', views.ListarTodosLosProyectos.as_view(), name='listar_todos_proyectos'),
    path('proyecto/<int:pk>/', views.ListarProyecto.as_view(), name='listar_proyecto'),
    #path('usuario/<int:id_usuario>/', views.ListarProyectosDeUsuario.as_view(), name='proyectos_usuario'),
    path('prioridades/', views.ListarPrioridades.as_view(), name = 'listar_prioridades')
]
