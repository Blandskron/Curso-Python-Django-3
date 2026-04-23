def alumno(nombre, edad):
    return f"El alumno se llama {nombre} y tiene {edad} años."

class Alumno:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def leer(self):
        print(f"{self.nombre} está leyendo.")

    def __str__(self):
        return f"El alumno se llama {self.nombre} y tiene {self.edad} años."

alumno2 = Alumno("Juan", 20)
alumno2.leer()
print(alumno2)

# Alumno
# nombre  | edad
# Juan    | 20
# Bastian | 22 