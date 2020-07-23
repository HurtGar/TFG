from django.contrib import admin
from Login.models import Tarea,HistorialModificacionTarea,Usuario, Proyecto, Prioridad, RegistroEntradaUsuario,Tareasusuario,Estado,Rol,Bloque

# Register your models here.

admin.site.register(Tarea)
admin.site.register(HistorialModificacionTarea)
admin.site.register(Usuario)
admin.site.register(Proyecto)
admin.site.register(Prioridad)
admin.site.register(RegistroEntradaUsuario)
admin.site.register(Tareasusuario)
admin.site.register(Estado)
admin.site.register(Rol)
admin.site.register(Bloque)