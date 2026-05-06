# Ejemplo 20: Renombrar archivo con os.rename()

import os

antiguo = "borrador.txt"
nuevo = "borrador_final.txt"

try:
    os.rename(antiguo, nuevo)
except FileNotFoundError:
    print(f"El archivo {antiguo} no existe")
except FileExistsError:
    print(f"El archivo {nuevo} ya existe")

