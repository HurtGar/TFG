"""URLS DE LA APLICACIÓN PARA EL LOGUEO"""
from django.urls import path

from Usuarios.views import viewsUser

urlpatterns = [
    # Login
    path('login/', viewsUser.Login.as_view(), name='login'),
    path('logout/', viewsUser.Logout.as_view(), name='logout'),

    # Usuarios
    path('list_users', viewsUser.ListAllUsers.as_view(), name='usuarios'),
    path('user/<int:user_id>', viewsUser.GetUserById.as_view(), name='usuario_id'),
    path('state/<int:state>', viewsUser.GetUserByState.as_view(), name='usuario_state'),
    path('create', viewsUser.CreateUser.as_view(), name='crear_usuario'),
    path('<int:user_id>/update', viewsUser.UpdateUser.as_view(), name='modificar_usuario'),
    path('<int:user_id>/delete', viewsUser.DeleteUser.as_view(), name='borrar_usuario'),
    path('find_access_dates', viewsUser.GetAccessBetweenTwoDates.as_view(), name='accesos_entre_fechas'),
    path('find_access', viewsUser.GetAccessByDates.as_view(), name='accesos_fecha'),
    path('find_access_ip', viewsUser.GetAccessByIp.as_view(), name='accesos_fecha'),
    path('find_access/<int:user_id>', viewsUser.GetAccessByUserId.as_view(), name='accesos_usuario'),
    path('permisosroles/', viewsUser.ListarPermisosRoles.as_view(), name='permisos_roles'),
    path('permisos/', viewsUser.ListarPermisos.as_view(), name='listar_permisos'),
    path('roles/', viewsUser.ListarRoles.as_view(), name='listar_roles'),
]
