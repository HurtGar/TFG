from Login.models import *


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
    iniciobloque = models.DateField()
    finbloque = models.DateField()
    fechacreacion = models.DateTimeField()
    proyecto_idproyecto = models.ForeignKey(Proyecto, related_name='proyecto_bloque', on_delete=models.CASCADE,
                                            db_column='proyecto_idproyecto')

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
    fechainicio = models.DateField()
    fechafin = models.DateField()
    fechaactualizacion = models.DateTimeField()
    horasestimacion = models.IntegerField()
    horasactuales = models.IntegerField()
    horasrestantes = models.IntegerField()
    estados_idestado = models.ForeignKey(Estado, related_name='estado', on_delete=models.SET_NULL, null=True,
                                         db_column='estados_idestado')
    prioridades_idprioridad = models.ForeignKey(Prioridad, related_name='prioridad', on_delete=models.SET_NULL,
                                                null=True,
                                                db_column='prioridades_idprioridad')
    bloques_idbloque = models.ForeignKey(Bloque, related_name='bloque', on_delete=models.CASCADE,
                                         db_column='bloques_idbloque')
    proyectos_idproyecto = models.ForeignKey(Proyecto, related_name='proyecto_tarea', on_delete=models.CASCADE,
                                             db_column='proyectos_idproyecto')

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
    idhistorico = models.AutoField(primary_key=True)
    fechahistorico = models.DateTimeField()
    idusuario = models.IntegerField()
    motivo = models.CharField(max_length=100)
    deschistorico = models.TextField(max_length=1000)
    tareas_idtarea = models.ForeignKey(Tarea, on_delete=models.CASCADE, db_column='tareas_idtarea')

    class Meta:
        db_table = 'historialModificacionesTareas'
        verbose_name_plural = 'HistorialModificacionesTareas'
        constraints = [
            models.UniqueConstraint(fields=['idhistorico', 'tareas_idtarea'], name='constraint_historico_tarea'),
            models.UniqueConstraint(fields=['idhistorico', 'idusuario'], name='constraint_historico_usuario'),
        ]

    def __str__(self):
        return self.fechahistorico + " - " + self.deschistorico
