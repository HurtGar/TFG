from users.models import *


# Create your models here.

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


class HistorialModificaciones(models.Model):
    idhistorico = models.AutoField(primary_key=True)
    fechahistorico = models.DateTimeField()
    motivo = models.CharField(max_length=100)
    deschistorico = models.TextField(max_length=1000, null=True)
    usuarios_idusuario = models.IntegerField()

    class Meta:
        db_table = 'historial_modificaciones'
        verbose_name_plural = 'HistorialModificaciones'
        constraints = [
            models.UniqueConstraint(fields=['idhistorico', 'usuarios_idusuario'],
                                    name='constraint_historico_usuario_proyecto'),
        ]

    def __str__(self):
        return self.deschistorico + "-" + str(self.fechahistorico)


class Proyecto(models.Model):
    idproyecto = models.AutoField(primary_key=True)
    nombreproyecto = models.CharField(max_length=100)
    descproyecto = models.CharField(max_length=500, null=True, blank=True)
    inicioproyecto = models.DateField(null=True, blank=True)
    finproyecto = models.DateField(null=True, blank=True)
    fechacreacion = models.DateTimeField()
    modificaciones = models.ManyToManyField(HistorialModificaciones, through='HistorialModificacionProyecto',
                                            related_name='modificaciones_proyecto',
                                            through_fields=(
                                                'proyectos_idproyecto', 'historialModificaciones_idhistorial'))

    class Meta:
        db_table = 'proyectos'
        verbose_name_plural = 'Proyectos'

    def __str__(self):
        return self.nombreproyecto


class Bloque(models.Model):
    idbloque = models.AutoField(primary_key=True)
    nombrebloque = models.CharField(max_length=100)
    descbloque = models.CharField(max_length=1000, null=True, blank=True)
    iniciobloque = models.DateField(null=True, blank=True)
    finbloque = models.DateField(null=True, blank=True)
    fechacreacion = models.DateTimeField()
    proyecto_idproyecto = models.ForeignKey(Proyecto, related_name='proyecto_bloque', on_delete=models.CASCADE,
                                            db_column='proyecto_idproyecto')
    modificaciones = models.ManyToManyField(HistorialModificaciones, through='HistorialModificacionBloque',
                                            related_name='modificaciones_bloque',
                                            through_fields=(
                                                'bloques_idbloque', 'historialModificaciones_idhistorial'))

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
    desctarea = models.CharField(max_length=5000, null=True, blank=True)
    fechacreacion = models.DateTimeField()
    fechainicio = models.DateField(null=True)
    fechafin = models.DateField(null=True)
    fechaactualizacion = models.DateTimeField()
    horasestimacion = models.IntegerField(null=True)
    horasactuales = models.IntegerField(null=True)
    horasrestantes = models.IntegerField(null=True)
    estados_idestado = models.ForeignKey(Estado, related_name='estado', on_delete=models.SET_NULL, null=True,
                                         db_column='estados_idestado')
    prioridades_idprioridad = models.ForeignKey(Prioridad, related_name='prioridad', on_delete=models.SET_NULL,
                                                null=True,
                                                db_column='prioridades_idprioridad')
    bloques_idbloque = models.ForeignKey(Bloque, related_name='bloque', on_delete=models.CASCADE,
                                         db_column='bloques_idbloque', null=True)
    proyectos_idproyecto = models.ForeignKey(Proyecto, related_name='proyecto_tarea', on_delete=models.CASCADE,
                                             db_column='proyectos_idproyecto')
    modificaciones = models.ManyToManyField(HistorialModificaciones, through='HistorialModificacionTarea',
                                            related_name='modificaciones_tarea',
                                            through_fields=(
                                                'tareas_idtarea', 'historialModificaciones_idhistorial'))

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


class HistorialModificacionProyecto(models.Model):
    historialModificaciones_idhistorial = models.ForeignKey(HistorialModificaciones, on_delete=models.DO_NOTHING)
    proyectos_idproyecto = models.ForeignKey(Proyecto, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'historial_modificacion_proyecto'
        unique_together = (('historialModificaciones_idhistorial', 'proyectos_idproyecto'),)


class HistorialModificacionBloque(models.Model):
    historialModificaciones_idhistorial = models.ForeignKey(HistorialModificaciones, on_delete=models.DO_NOTHING)
    bloques_idbloque = models.ForeignKey(Bloque, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'historial_modificacion_bloque'
        unique_together = (('historialModificaciones_idhistorial', 'bloques_idbloque'),)


class HistorialModificacionTarea(models.Model):
    historialModificaciones_idhistorial = models.ForeignKey(HistorialModificaciones, on_delete=models.DO_NOTHING)
    tareas_idtarea = models.ForeignKey(Tarea, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = 'historial_modificacion_tarea'
        unique_together = (('historialModificaciones_idhistorial', 'tareas_idtarea'),)
