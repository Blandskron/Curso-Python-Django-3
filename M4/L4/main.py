class Persona:
    def __init__(self, nombre, apellido):
        self.name = nombre
        self.lastname = apellido

    def hablar(self):
        return f"Hola mi nombre es {self.name}"
    
class Trabajador(Persona):
    def __init__(self, persona: Persona, numero):
        super().__init__(persona.name, persona.lastname)
        self.number = numero

    def hablar(self):
        return f"Hola mi nombre es {self.name}, y mi numero es {self.number}"
    
bastian = Persona("Bastian", "landskron")
num_uno = Trabajador(bastian, 1234)

print(num_uno.hablar())