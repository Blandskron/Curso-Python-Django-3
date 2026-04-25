# Ejemplo 7: Asociación bidireccional muchos a muchos (Estudiante <-> Curso)
class CursoBidireccional:
    def __init__(self, titulo: str):
        self.titulo = titulo
        self.estudiantes: list["EstudianteBidireccional"] = []

class EstudianteBidireccional:
    def __init__(self, nombre: str):
        self.nombre = nombre
        self.cursos: list[CursoBidireccional] = []

    def inscribir(self, curso: CursoBidireccional) -> None:
        self.cursos.append(curso)
        curso.estudiantes.append(self)

class Estudiante:
    pass

class Curso:
    pass

class CursoEstudiante:
    pass
