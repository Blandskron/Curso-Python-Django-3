# Ejemplo 10: Mixin de serialización

import json

class JsonMixin:
    def to_json(self) -> str:
        return json.dumps(self.__dict__)


class Usuario(JsonMixin):
    def __init__(self, nombre: str, email: str):
        self.nombre = nombre
        self.email = email

user = Usuario("bastian", "bastian@gmail.com")
print(user.to_json())

"""
{
    "nombre": "bastian",
    "email": "bastian@gmail.com"
}
"""