from django.contrib import admin
from Proyectos.models import *

# Register your models here.
admin.site.register(Proyecto)
admin.site.register(Bloque)
admin.site.register(Tarea)
admin.site.register(Prioridad)
admin.site.register(Estado)
admin.site.register(HistorialModificaciones)
admin.site.register(HistorialModificacionProyecto)
admin.site.register(HistorialModificacionBloque)
admin.site.register(HistorialModificacionTarea)
