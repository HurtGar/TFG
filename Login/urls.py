"""URLS DE LA APLICACIÓN PARA EL LOGUEO"""
from django.urls import path

from Login import views

urlpatterns = [
    path('login/', views.Login.as_view(), name='login'),
    path('logout/', views.Logout.as_view(), name='logout'),
    path('permisosroles/', views.ListarPermisosRoles.as_view(), name = 'permisos_roles'),
    path('permisos/', views.ListarPermisos.as_view(), name = 'listar_permisos'),
    path('roles/', views.ListarRoles.as_view(), name='listar_roles'),
]
