# Ejemplo 26: Agregación Carro -> Conductor (Conductor independiente)
class Conductor:
    def __init__(self, nombre: str):
        self.nombre = nombre

class CarroAgregado:
    def __init__(self, modelo: str, conductor: Conductor | None = None):
        self.modelo = modelo
        self.conductor = conductor  # referencia externa opcional

class ConducirCarro:
    def __init__(self, carro: CarroAgregado):
        self.carro = carro

    def conducir(self):
        if self.carro.conductor:
            print(f"{self.carro.conductor.nombre} está conduciendo el {self.carro.modelo}.")
        else:
            print(f"El {self.carro.modelo} no tiene conductor asignado.")