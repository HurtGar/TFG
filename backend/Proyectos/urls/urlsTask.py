from django.urls import path

from backend.Proyectos.views import viewsTask

urlpatterns = [
    # Tareas
    path('user/<int:id_user>', viewsTask.GetAllTasksFromAnUser().as_view(), name='listar_tareas_usuario'),
    path('<int:id_task>/user/<int:id_user>', viewsTask.GetOneTaskFromAnUser.as_view(), name='obtener_tarea_usuario'),
    path('<int:id_task>/list_users', viewsTask.GetAllUsersFromATask.as_view(), name='listar_usuarios_tarea'),
    path('<int:id_task>/hours', viewsTask.GetTotalHoursFromATask.as_view(), name='horas_tarea'),
    path('search', viewsTask.GetTasksBetweenTwoDates.as_view(), name='tareas_fecha_inicio_fin'),
    path('search/created_date', viewsTask.GetCreatedTasksBetweenTwoDates.as_view(), name='tareas_fecha_creacion'),
    path('search/last_updated', viewsTask.GetLastUpdatedTask.as_view(), name='last_udpated_task'),
    path('<int:id_task>/records', viewsTask.GetRecordsFromATask.as_view(), name='historial_tarea'),
    path('state/<int:id_state>', viewsTask.GetTasksWithAState.as_view(), name='tareas_estado'),
    path('priority/<int:id_priority>', viewsTask.GetTasksWithAPriority.as_view(), name='tareas_prioridad'),
    path('search/priority/state', viewsTask.GetTaskByPriorityIdAndStateId.as_view(), name='tareas_estado_prioridad'),
    path('create/assignment', viewsTask.CreateATaskAssignment.as_view(), name='crear_asignacion'),
    path('delete/assignment', viewsTask.DeleteATaskAssignment.as_view(), name='eliminar_asignacion'),
    path('assignment/<int:id_task>', viewsTask.UpdateAssignmentTask.as_view(), name='actualizar_asignacion'),
    path('create',viewsTask.CreateTask.as_view(), name='crear_tarea'),
    path('<int:id_task>/update', viewsTask.UpdateTask.as_view(), name='actualizar_tarea'),
    path('delete/<int:id_task>', viewsTask.DeleteTask.as_view(), name='borrar_tarea'),
    path('<int:id_task>/insert_record', viewsTask.InsertRecord.as_view(), name='insertar_historico'),
]
