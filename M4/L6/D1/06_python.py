# Ejemplo 6: Uso de seek() y tell() para mover el puntero

with open("data/texto.txt", "r+", encoding="utf-8") as f:
    inicio = f.tell()
    print(inicio)
    linea = f.readline()
    print(linea)
    posicion_despues = f.tell()
    print(posicion_despues)
    f.seek(inicio)  # volver al comienzo
