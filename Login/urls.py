"""URLS DE LA APLICACIÓN PARA EL LOGUEO"""
from django.urls import path
from Login import views

urlpatterns = [
    path('proyectos/', views.ListarTodosLosProyectos.as_view(), name='listar_todos_proyectos'),
    path('proyectos/<int:pk>', views.ListarProyecto.as_view(), name='listar_proyecto'),
    path('login/', views.Login.as_view(), name='login'),
    path('logout/', views.Logout.as_view(), name='logout')
]
