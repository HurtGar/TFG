from django.urls import path

from Proyectos.views import viewsBlock

urlpatterns = [
    # Bloques
    path('user/<int:id_user>', viewsBlock.GetAllBlocsFromAnUser().as_view(), name='listar_bloques_usuario'),
    path('<int:id_block>/user/<int:id_user>', viewsBlock.GetOneBlocFromAnUser().as_view(),
         name='obtener_bloque_usuario'),
    path('<int:id_block>/list_users', viewsBlock.GetUsersFromABlock.as_view(), name='bloques_proyecto'),
    path('<int:id_block>/tasks', viewsBlock.GetAllTaskFromABlock.as_view(), name='listar_tareas_bloque'),
    path('<int:id_block>/hours', viewsBlock.GetHoursFromABlock.as_view(), name='horas_bloque'),
    path('search', viewsBlock.GetBlocksBetweenTwoDates.as_view(), name='bloques_fechas'),
    path('search/created_date', viewsBlock.GetCreatedBlocksBetweenTwoDates.as_view(), name='bloques_creacion_fecha'),
    path('<int:id_block>/records', viewsBlock.GetRecordsChangesFromProject.as_view(), name='historial_bloques'),
    path('<int:id_block>/assigment', viewsBlock.SetBlockToAProject.as_view(), name='asignar_bloque_proyecto'),
    path('create', viewsBlock.CreateBlock.as_view(), name='crear_bloque'),
    path('<int:id_block>/update', viewsBlock.UpdateBlock.as_view(), name='actualizar_bloque'),
    path('delete/<int:id_block>', viewsBlock.DeleteBlock.as_view(), name='borrar_bloque'),
    path('<int:id_block>/insert_record', viewsBlock.InsertRecord.as_view(), name='insertar_historico'),

]
