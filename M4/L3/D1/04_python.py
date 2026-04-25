# Ejemplo 4: Atributo derivado (/edad) usando @property
from datetime import date

class Persona:
    def __init__(self, nombre: str, fecha_nacimiento: date):
        self.nombre = nombre
        self._fecha_nacimiento = fecha_nacimiento

    @property
    def edad(self) -> int:  # /edad derivada de fecha_nacimiento
        hoy = date.today()
        return hoy.year - self._fecha_nacimiento.year

"""
Persona
______________
- nombre: str
- _fecha_nacimiento: date
_______________
+ edad() -> int # Calcular edad segun date time today - fecha_nacimiento
"""
