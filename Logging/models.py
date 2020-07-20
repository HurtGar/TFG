from django.db import models


# Create your models here.

# ---------Usuarios---------

class Rol(models.Model):
    idrol = models.AutoField(primary_key=True)
    descrol = models.CharField(max_length=45)
    nivelrol = models.IntegerField()

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
    roles_idrol = models.ForeignKey('Rol', on_delete=models.SET_NULL, null=True, blank=True, db_column='roles_idrol')
    nombre = models.CharField(max_length=45)
    primerapellido = models.CharField(max_length=45)
    segundoapellido = models.CharField(max_length=45, null=True, blank=True)
    telefono = models.CharField(max_length=12, null=True, blank=True)
    email = models.EmailField()
    password = models.CharField(max_length=200)
    fecharegistro = models.DateTimeField()
    estado = models.IntegerField(choices=estado_enum, default=0)
    tareas = models.ManyToManyField('Tarea',through='Tareasusuario', through_fields=('usuarios_idusuario','tareas_idtarea'))

    class Meta:
        db_table = 'usuarios'
        verbose_name_plural = 'Usuarios'

    def __str__(self):
        return self.nombre + " " + self.primerapellido

class Tareasusuario(models.Model):
    tareas_idtarea = models.ForeignKey('Tarea', on_delete=models.DO_NOTHING)
    usuarios_idusuario = models.ForeignKey('Usuario', on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'tareasusuario'
        constraints = [
            models.UniqueConstraint(fields=['tareas_idtarea','usuarios_idusuario'], name='constraint_tareas_usuario')
        ]

class RegistroEntradaUsuario(models.Model):
    idregistroacceso = models.AutoField(primary_key=True)
    fechaacceso = models.DateField()
    horaacceso = models.TimeField()
    ipacceso = models.CharField(max_length=45)
    usuario_idusuario = models.ForeignKey('Usuario', on_delete=models.DO_NOTHING, db_column='usuario_idusuario')

    class Meta:
        db_table = 'registroEntradaUsuarios'
        verbose_name_plural = 'Registroentradausuarios'

    def __str__(self):
        return self.fechaacceso + " " + self.horaacceso


# ---------Proyecto---------

class Prioridad(models.Model):
    idprioridad = models.AutoField(primary_key=True)
    descprioridad = models.CharField(max_length=50)
    nivelprioridad = models.IntegerField()

    class Meta:
        db_table = 'prioridades'
        verbose_name_plural = 'Prioridades'

    def __str__(self):
        return self.descprioridad


class Estado(models.Model):
    idestado = models.AutoField(primary_key=True)
    descestado = models.CharField(max_length=50)

    class Meta:
        db_table = 'estados'
        verbose_name_plural = 'Estados'

    def __str__(self):
        return self.descestado


class Proyecto(models.Model):
    idproyecto = models.AutoField(primary_key=True)
    nombreproyecto = models.CharField(max_length=100)
    descproyecto = models.CharField(max_length=500)
    inicioproyecto = models.DateField()
    finproyecto = models.DateField()
    fechacreacion = models.DateTimeField()

    class Meta:
        db_table = 'proyectos'
        verbose_name_plural = 'Proyectos'

    def __str__(self):
        return self.nombreproyecto

class Bloque(models.Model):
    idbloque = models.AutoField(primary_key=True)
    nombrebloque = models.CharField(max_length=100)
    descbloque = models.CharField(max_length=1000)
    fechacreacion = models.DateTimeField()
    proyecto_idproyecto = models.ForeignKey('Proyecto', on_delete=models.CASCADE, db_column='proyecto_idproyecto')

    class Meta:
        db_table = 'bloques'
        verbose_name_plural = 'Bloques'
        constraints = [
            models.UniqueConstraint(fields=['idbloque', 'proyecto_idproyecto'], name='constraint_bloque_proyecto'),
        ]

    def __str__(self):
        return self.nombrebloque


class Tarea(models.Model):
    idtarea = models.AutoField(primary_key=True)
    nombretarea = models.CharField(max_length=100)
    desctarea = models.CharField(max_length=5000)
    fechacreacion = models.DateTimeField()
    fechaInicio = models.DateField()
    fechafin = models.DateField()
    fechaactualizacion = models.DateTimeField()
    estados_idestado = models.ForeignKey('Estado', on_delete=models.SET_NULL, null=True, db_column='estados_idestado')
    prioridades_idprioridad = models.ForeignKey('Prioridad', on_delete=models.SET_NULL, null=True,
                                                db_column='prioridades_idprioridad')
    bloques_idbloque = models.ForeignKey('Bloque', on_delete=models.CASCADE, db_column='bloques_idbloque')
    #proyectos_idproyecto = models.ForeignKey('Proyecto', on_delete=models.CASCADE, db_column='proyectos_idproyecto')

    class Meta:
        db_table = 'tareas'
        verbose_name_plural = 'Tareas'
        constraints = [
            models.UniqueConstraint(fields=['idtarea', 'bloques_idbloque'],
                                    name='constraint_tarea_bloque'),
            models.UniqueConstraint(fields=['idtarea', 'estados_idestado'], name='constraint_tarea_estado'),
            models.UniqueConstraint(fields=['idtarea', 'prioridades_idprioridad'],
                                    name='constraint_idtarea_prioridades'),
        ]

    def __str__(self):
        return self.nombretarea

class HistorialModificacionTarea(models.Model):
    idhistorico = models.AutoField(primary_key = True)
    fechahistorico = models.DateField()
    horahistorico = models.TimeField()
    idusuario = models.IntegerField()
    #usuarios_idusuario = models.ForeignKey('Usuario', on_delete=models.DO_NOTHING, db_column='usuarios_idusuario')
    tareas_idtarea = models.ForeignKey('Tarea', on_delete=models.CASCADE, db_column='tareas_idtarea')
    #bloques_idbloque = models.ForeignKey('Bloque', on_delete=models.CASCADE, db_column='bloques_idbloque')
    #proyectos_idproyecto = models.ForeignKey('Proyecto', on_delete=models.CASCADE, db_column='proyectos_idproyecto')

    class Meta:
        db_table = 'historialModificacionesTareas'
        verbose_name_plural = 'HistorialModificacionesTareas'
        constraints = [
            models.UniqueConstraint(fields=['idhistorico','tareas_idtarea'], name='constraint_historico_tarea'),
            models.UniqueConstraint(fields=['idhistorico','idusuario'], name='constraint_historico_usuario'),
        ]

    def __str__(self):
        return self.fechahistorico + " " + self.horahistorico