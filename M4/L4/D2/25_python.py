# Ejemplo 25: Sobrescritura parcial usando super()

class Filtro:
    def procesar(self, dato: str) -> str:
        return dato.strip()


class FiltroMayus(Filtro):
    def procesar(self, dato: str) -> str:
        base = super().procesar(dato)
        return base.upper()

ejemplo = FiltroMayus()
print(ejemplo.procesar("          Hola hemos recibido tu mensaje  "))