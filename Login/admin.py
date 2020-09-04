from django.contrib import admin
from Login.models import Usuario, RegistroEntradaUsuario, ProyectosUsuarios, Rol

# Register your models here.
admin.site.register(Usuario)
admin.site.register(RegistroEntradaUsuario)
admin.site.register(ProyectosUsuarios)
admin.site.register(Rol)
