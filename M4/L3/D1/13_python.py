# Ejemplo 13: Biblioteca adquiriendo libros (composición)
class LibroBiblioteca:
    def __init__(self, titulo: str, autor: str, isbn: str):
        self.titulo = titulo
        self.autor = autor
        self.isbn = isbn
        self.disponible = True

class Biblioteca:
    def __init__(self, nombre: str):
        self.nombre = nombre
        self._catalogo: list[LibroBiblioteca] = []

    def adquirir_libro(self, titulo: str, autor: str, isbn: str) -> None:
        nuevo = LibroBiblioteca(titulo, autor, isbn)
        self._catalogo.append(nuevo)

"""
Biblioteca
id    | nombreLibro
1     | Harry Potter y la Piedra Filosofal
2     | El Señor de los Anillos
3     | El Código Da Vinci
""" 