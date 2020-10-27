"""URLS DE LA APLICACIÓN PARA EL LOGUEO"""
from django.urls import path

from Usuarios.views import viewsToken, viewsUser

urlpatterns = [
    path('login/', viewsUser.Login.as_view(), name='login'),
    path('logout/', viewsUser.Logout.as_view(), name='logout'),
    path('usuarios/', viewsUser.ListarUsuarios.as_view(), name='usuarios'),
    path('permisosroles/', viewsUser.ListarPermisosRoles.as_view(), name='permisos_roles'),
    path('permisos/', viewsUser.ListarPermisos.as_view(), name='listar_permisos'),
    path('roles/', viewsUser.ListarRoles.as_view(), name='listar_roles'),
]
