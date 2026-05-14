from django.db import models

class Persona(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    edad = models.IntegerField()

"""
persona
id | nombre | apellido  | edad
1  | Juan   | Perez     | 30
2  | Maria  | Gonzalez  | 25
3  | Carlos | Rojas     | 40
"""