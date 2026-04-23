# =====================================
# Ejemplo 1: Asociación simple ("conoce a")
# =====================================

class Libro:
    def __init__(self, titulo):
        self.title = titulo

class Estudiante:
    def __init__(self, nombre):
        self.name = nombre

    def leer(self, libro: Libro):
        print(f"{self.name} lee el libro {libro.title}")

libro = Libro("POO con Python")
libro2 = Libro("Estructuras de Datos en Python")
alumno = Estudiante("Ana")
alumno.leer(libro2)  # asociación: Estudiante conoce Libro
