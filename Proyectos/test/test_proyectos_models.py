from django.test import TestCase
from Proyectos.models import Proyecto
import datetime
"""Archivo para realizar los test de validación para la
aplicación de Proyectos"""

class ProyectosTestCase(TestCase):

    """Con setUp todas las modificaciones que hagamos
    durante la ejecución de los test,
    tendrán efecto en los objetos creados. Es decir: se modificarán en tiempo de ejecución."""
    def setUp(self):
        self.proyecto = Proyecto.objects.create(
            idproyecto='5',
            nombreproyecto='Prueba test',
            descproyecto='Proyecto para realizar los tests',
            inicioproyecto=datetime.date.today(),
            finproyecto=datetime.datetime.today()+datetime.timedelta(days=5),
            fechacreacion=datetime.datetime.today(),
        )

    """Con setUpTestData, las modificaciones que realicemos
    durante la ejecución de los test no realizarán cambios
    en los objetos creados."""
    # def setUpTestData(cls):
    #     pass

    def test_nombre_proyecto(self):
        self.assertEqual(self.proyecto.nombreproyecto, 'Prueba test')


# """Ejemplo de como funcionan los test. Al ejecutarlo obtenemos un OK."""
# class SimpleTest(TestCase):
#     def test_basic_addition(self):
#         self.assertEqual(1+1,2)

