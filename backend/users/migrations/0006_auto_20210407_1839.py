# Generated by Django 3.1.3 on 2021-04-07 16:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0005_auto_20210407_1832'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bloquesusuarios',
            name='usuarios_idusuario',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='users.usuario'),
        ),
        migrations.AlterField(
            model_name='tareasusuarios',
            name='usuarios_idusuario',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='users.usuario'),
        ),
    ]
