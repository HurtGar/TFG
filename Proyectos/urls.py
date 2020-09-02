from django.urls import path

from Proyectos import views

urlpatterns = [
    path('', views.GetAllProject.as_view(), name='listar_todos_proyectos'),
    path('proyecto/<int:pk>/', views.GetOneProjectFromAnUser.as_view(), name='listar_proyecto'),
    path('usuario/<int:id_usuario>/', views.GetAllProjectFromAnUser.as_view(), name='proyectos_usuario'),
    path('prioridades/', views.ListarPrioridades.as_view(), name = 'listar_prioridades')
]
