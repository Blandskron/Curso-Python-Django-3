class Animal:
    def hacer_sonido(self):
        raise NotImplementedError
    
class Salvaje(Animal):
    def hacer_sonido(self):
        print("Sonido salvaje")

class Leon(Salvaje):
    def hacer_sonido(self):
        print("Rugido")

class Oso(Salvaje):
    def hacer_sonido(self):
        print("Gruñido")
    
class Mascota(Animal):
    def hacer_sonido(self):
        print("Sonido de mascota")

class Perro(Mascota):
    def hacer_sonido(self):
        print("Guau")

class Gato(Mascota):
    def hacer_sonido(self):
        print("Miau")   

tom = Gato()
scooby = Perro()
garfield = Gato()
oddie = Perro()
simba = Leon()
kenai = Oso()


mascotas: list[Animal] = [tom, scooby, garfield, oddie, simba, kenai]

for m in mascotas:
    m.hacer_sonido()  # mismo mensaje, distintos métodos