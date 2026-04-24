class Autor:
    def __init__(self, nombre, pais):
        self.nombre = nombre
        self.pais = pais

class Libro:
    def __init__(self, titulo, autor: Autor,anio_publicacion, resumen = "Libro sin resumen disponible"):
        self.titulo = titulo
        self.autor = autor
        self.anio_publicacion = anio_publicacion
        self.resumen = resumen

    def mostrar_informacion(self):
        print(f"Título: {self.titulo} Autor: {self.autor.nombre} y País: {self.autor.pais} Resumen: {self.resumen} Año de publicación: {self.anio_publicacion}")

    def get_titulo(self):
        return self.titulo

    def set_titulo(self, nuevo_titulo):
        self.titulo = nuevo_titulo

    def get_anio_publicacion(self):
        return self.anio_publicacion
    
    def set_anio_publicacion(self, nuevo_anio):
        self.anio_publicacion = nuevo_anio


class Editorial:
    def __init__(self, nombre, ciudad, libros: Libro):
        self.nombre = nombre
        self.ciudad = ciudad
        self.libros = libros[Libro] 

    def agregar_libro(self, libro: Libro):
        self.libros.append(libro)

def resumen(self, resumen_texto = "Libro sin resumen disponible"):
    print(f"Resumen del libro '{self.titulo}': {resumen_texto}")

libros_coleccion = Editorial("Colección de Libros", "Madrid", [])
autor1 = Autor("Gabriel García Márquez", "Colombia")
libros_coleccion.agregar_libro(Libro("Cien años de soledad", autor1, 1967, "Novela que narra la historia de la familia Buendía a lo largo de varias generaciones en el mítico pueblo de Macondo."))


