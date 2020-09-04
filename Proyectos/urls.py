from django.urls import path

from Proyectos import views

urlpatterns = [

    path('user/<int:id_usuario>/', views.GetAllProjectFromAnUser.as_view(), name='proyectos_usuario'),

    path('user/<int:id_usuario>/<int:id_proyecto>', views.GetOneProjectFromAnUser.as_view(), name='listar_proyecto'),

    path('list_users/<int:id_project>', views.GetAllUsersFromAProject.as_view(), name='listar_usuarios'),

    path('project/<int:id_project>/blocks', views.GetAllBlocksFromAProject.as_view(), name='listar_bloques_proyecto'),

    path('project/<int:id_project>/tasks', views.GetAllTaskFromAProject.as_view(), name='listar_tareas_proyecto'),

    path('project/<int:id_project>/blocks/<int:id_block>/tasks', views.GetAllTaskFromABlock.as_view(),
         name='listar_tareas_bloque'),

    path('', views.GetAllProject.as_view(), name='listar_todos_proyectos'),
]
