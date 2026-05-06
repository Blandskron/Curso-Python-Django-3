# Ejemplo 13: Modo 'x' para creación exclusiva

from pathlib import Path

ruta = Path("config_inicial.json")

try:
    with open(ruta, "x", encoding="utf-8") as f:
        f.write("{}\n")
except FileExistsError:
    # archivo ya existe, no se pisa
    print(f"El archivo {ruta} ya existe.")

