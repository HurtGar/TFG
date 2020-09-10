# Generated by Django 3.1.1 on 2020-09-09 17:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Proyectos', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Permisos',
            fields=[
                ('idpermiso', models.AutoField(primary_key=True, serialize=False)),
                ('nombrepermiso', models.CharField(max_length=100)),
                ('codigonombre', models.CharField(max_length=100)),
            ],
            options={
                'verbose_name_plural': 'Permisos',
                'db_table': 'permisos',
            },
        ),
        migrations.CreateModel(
            name='PermisosRoles',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('permisos_idpermiso', models.ForeignKey(db_column='permisos_idpermiso', on_delete=django.db.models.deletion.DO_NOTHING, related_name='permisos', to='Login.permisos')),
            ],
            options={
                'db_table': 'permisos_roles',
            },
        ),
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('idrol', models.AutoField(primary_key=True, serialize=False)),
                ('descrol', models.CharField(max_length=45)),
                ('nivelrol', models.IntegerField()),
                ('permisos', models.ManyToManyField(related_name='permiso', through='Login.PermisosRoles', to='Login.Permisos')),
            ],
            options={
                'verbose_name_plural': 'Roles',
                'db_table': 'roles',
            },
        ),
        migrations.CreateModel(
            name='RolesUsuarios',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('roles_idrol', models.ForeignKey(db_column='roles_idrol', on_delete=django.db.models.deletion.CASCADE, to='Login.rol')),
            ],
            options={
                'db_table': 'roles_usuarios',
            },
        ),
        migrations.CreateModel(
            name='TareasUsuarios',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bloques_idbloque', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Proyectos.bloque')),
                ('proyectos_idproyecto', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Proyectos.proyecto')),
                ('tareas_idtarea', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Proyectos.tarea')),
            ],
            options={
                'db_table': 'tareas_usuario',
            },
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('idusuario', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=45)),
                ('primerapellido', models.CharField(max_length=45)),
                ('segundoapellido', models.CharField(blank=True, max_length=45, null=True)),
                ('telefono', models.CharField(blank=True, max_length=12, null=True)),
                ('email', models.EmailField(max_length=254)),
                ('password', models.CharField(max_length=200)),
                ('fecharegistro', models.DateTimeField()),
                ('estado', models.IntegerField(choices=[(0, 'Inhabilitado'), (1, 'Habilitado')], default=0)),
                ('roles', models.ManyToManyField(related_name='rol', through='Login.RolesUsuarios', to='Login.Rol')),
                ('tareas', models.ManyToManyField(related_name='tareas', through='Login.TareasUsuarios', to='Proyectos.Tarea')),
            ],
            options={
                'verbose_name_plural': 'Usuarios',
                'db_table': 'usuarios',
            },
        ),
        migrations.AddField(
            model_name='tareasusuarios',
            name='usuarios_idusuario',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Login.usuario'),
        ),
        migrations.AddField(
            model_name='rolesusuarios',
            name='usuarios_idusuario',
            field=models.ForeignKey(db_column='usuarios_idusuario', on_delete=django.db.models.deletion.CASCADE, to='Login.usuario'),
        ),
        migrations.CreateModel(
            name='RegistroEntradaUsuario',
            fields=[
                ('idregistroacceso', models.AutoField(primary_key=True, serialize=False)),
                ('fechaacceso', models.DateTimeField()),
                ('ipacceso', models.CharField(max_length=45)),
                ('usuario_idusuario', models.ForeignKey(db_column='usuario_idusuario', on_delete=django.db.models.deletion.DO_NOTHING, to='Login.usuario')),
            ],
            options={
                'verbose_name_plural': 'Registroentradausuarios',
                'db_table': 'registroEntradaUsuarios',
            },
        ),
        migrations.AddField(
            model_name='permisosroles',
            name='roles_idrol',
            field=models.ForeignKey(db_column='roles_idrol', on_delete=django.db.models.deletion.DO_NOTHING, related_name='roles', to='Login.rol'),
        ),
        migrations.AddConstraint(
            model_name='tareasusuarios',
            constraint=models.UniqueConstraint(fields=('tareas_idtarea', 'usuarios_idusuario', 'proyectos_idproyecto', 'bloques_idbloque'), name='constraint_tareas_usuario'),
        ),
        migrations.AlterUniqueTogether(
            name='tareasusuarios',
            unique_together={('tareas_idtarea', 'usuarios_idusuario', 'proyectos_idproyecto', 'bloques_idbloque')},
        ),
        migrations.AddConstraint(
            model_name='rolesusuarios',
            constraint=models.UniqueConstraint(fields=('roles_idrol', 'usuarios_idusuario'), name='constraint_roles_usuarios'),
        ),
        migrations.AddConstraint(
            model_name='permisosroles',
            constraint=models.UniqueConstraint(fields=('permisos_idpermiso', 'roles_idrol'), name='constraint_permisos_roles'),
        ),
    ]
