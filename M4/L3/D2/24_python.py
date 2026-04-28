# Ejemplo 24: Contador estático de instancias
class TicketSoporte:
    _contador = 0  # atributo estático

    def __init__(self, asunto: str):
        TicketSoporte._contador += 1
        self.id = TicketSoporte._contador
        self.asunto = asunto

"""
TicketSoporte
________________________
contador (id) | asunto
________________________
0             | "Problema con la impresora"
1             | "Error en el software"
"""
