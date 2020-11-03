from django.contrib import admin
from backend.Usuarios.models import Usuario, RegistroEntradaUsuario, TareasUsuarios, Rol

# Register your models here.
admin.site.register(Usuario)
admin.site.register(RegistroEntradaUsuario)
admin.site.register(TareasUsuarios)
admin.site.register(Rol)
