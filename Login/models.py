from django.db import models
from Proyectos.models import *

# ---------Usuarios---------
from Proyectos.models import Proyecto


class Permisos(models.Model):
    idpermiso = models.AutoField(primary_key=True)
    nombrepermiso = models.CharField(max_length=100)
    codigonombre = models.CharField(max_length=100)

    class Meta:
        db_table = 'permisos'
        verbose_name_plural = 'Permisos'

    def __str__(self):
        return self.nombrepermiso


class Rol(models.Model):
    idrol = models.AutoField(primary_key=True)
    descrol = models.CharField(max_length=45)
    nivelrol = models.IntegerField()
    permisos = models.ManyToManyField(Permisos, related_name='permiso', through='PermisosRoles',
                                      through_fields=('roles_idrol',
                                                      'permisos_idpermiso'))

    class Meta:
        db_table = 'roles'
        verbose_name_plural = 'Roles'

    def __str__(self):
        return self.descrol


class Usuario(models.Model):
    estado_enum = (
        (0, "Inhabilitado"),
        (1, "Habilitado")
    )
    idusuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45)
    primerapellido = models.CharField(max_length=45)
    segundoapellido = models.CharField(max_length=45, null=True, blank=True)
    telefono = models.CharField(max_length=12, null=True, blank=True)
    email = models.EmailField()
    password = models.CharField(max_length=200)
    fecharegistro = models.DateTimeField()
    estado = models.IntegerField(choices=estado_enum, default=0)
    tareas = models.ManyToManyField(Tarea, through='TareasUsuarios', related_name='tareas',
                                    through_fields=(
                                        'usuarios_idusuario', 'tareas_idtarea', 'proyectos_idproyecto',
                                        'bloque_idbloque'))
    roles = models.ManyToManyField(Rol, related_name='rol', through='RolesUsuarios',
                                   through_fields=('usuarios_idusuario', 'roles_idrol'))

    class Meta:
        db_table = 'usuarios'
        verbose_name_plural = 'Usuarios'

    def __str__(self):
        return self.nombre + " " + self.primerapellido


class TareasUsuarios(models.Model):
    tareas_idtarea = models.ForeignKey(Tarea, on_delete=models.DO_NOTHING)
    usuarios_idusuario = models.ForeignKey(Usuario, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'tareas_usuario'
        constraints = [
            models.UniqueConstraint(
                fields=['tareas_idtarea', 'usuarios_idusuario'],
                name='constraint_tareas_usuario')
        ]


class RolesUsuarios(models.Model):
    roles_idrol = models.ForeignKey(Rol, on_delete=models.CASCADE, db_column='roles_idrol')
    usuarios_idusuario = models.ForeignKey(Usuario, on_delete=models.CASCADE, db_column='usuarios_idusuario')

    class Meta:
        db_table = 'roles_usuarios'
        constraints = [
            models.UniqueConstraint(fields=['roles_idrol', 'usuarios_idusuario'],
                                    name='constraint_roles_usuarios'),
        ]

    def __str__(self):
        return 'idUsuario=' + str(self.usuarios_idusuario) + ' ,idRol=' + str(self.roles_idrol)


class PermisosRoles(models.Model):
    permisos_idpermiso = models.ForeignKey(Permisos, related_name='permisos', on_delete=models.DO_NOTHING,
                                           db_column='permisos_idpermiso')
    roles_idrol = models.ForeignKey(Rol, related_name='roles', on_delete=models.DO_NOTHING, db_column='roles_idrol')

    class Meta:
        db_table = 'permisos_roles'
        constraints = [
            models.UniqueConstraint(fields=['permisos_idpermiso', 'roles_idrol'], name='constraint_permisos_roles'),
        ]

    def __str__(self):
        return 'idPermiso=' + str(self.permisos_idpermiso) + ' ,idRol=' + str(self.roles_idrol)


class RegistroEntradaUsuario(models.Model):
    idregistroacceso = models.AutoField(primary_key=True)
    fechaacceso = models.DateTimeField()
    ipacceso = models.CharField(max_length=45)
    usuario_idusuario = models.ForeignKey(Usuario, on_delete=models.DO_NOTHING, db_column='usuario_idusuario')

    class Meta:
        db_table = 'registroEntradaUsuarios'
        verbose_name_plural = 'Registroentradausuarios'

    def __str__(self):
        return self.fechaacceso
