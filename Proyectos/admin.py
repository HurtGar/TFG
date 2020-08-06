from django.contrib import admin
from Proyectos.models import Tarea, HistorialModificacionTarea, Proyecto, Prioridad, Estado, Bloque

# Register your models here.
admin.site.register(Tarea)
admin.site.register(HistorialModificacionTarea)
admin.site.register(Proyecto)
admin.site.register(Prioridad)
admin.site.register(Estado)
admin.site.register(Bloque)
