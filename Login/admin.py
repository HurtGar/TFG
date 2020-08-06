from django.contrib import admin
from Login.models import Usuario, RegistroEntradaUsuario, Tareasusuario, Rol

# Register your models here.
admin.site.register(Usuario)
admin.site.register(RegistroEntradaUsuario)
admin.site.register(Tareasusuario)
admin.site.register(Rol)
