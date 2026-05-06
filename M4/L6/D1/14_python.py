# Ejemplo 14: Lectura/escritura en modo binario (imagen)

with open("data\\foto.jpg", "rb") as f:
    cabecera = f.read()  # primeros bytes (cabecera)
    print(cabecera)