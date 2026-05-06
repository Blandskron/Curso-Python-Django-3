# Ejemplo 26: Bitácora de eventos con creación, lectura y append

from pathlib import Path
import os


BITACORA = Path("eventos.csv")

def crear_bitacora() -> None:
    if os.path.exists(BITACORA):
        print(f"El archivo {BITACORA} ya existe")
        return
    else:
        encabezado = "id,evento,prioridad\n"
        with open(BITACORA, "w", encoding="utf-8") as f:
            f.write(encabezado)

def registrar_evento(id_ev: int, descripcion: str, prioridad: str) -> None:
    with open(BITACORA, "a", encoding="utf-8") as f:
        f.write(f"{id_ev},{descripcion},{prioridad}\n")


def leer_bitacora() -> None:
    if not BITACORA.exists():
        return
    with open(BITACORA, "r", encoding="utf-8") as f:
        for linea in f:
            print(linea.rstrip())

while True:
    print("1. Crear bitácora")
    print("2. Registrar evento")
    print("3. Leer bitácora")
    print("4. Salir")
    opcion = input("Seleccione una opción: ")
    if opcion == "1":
        crear_bitacora()
    elif opcion == "2":
        id_ev = int(input("Ingrese el ID del evento: "))
        descripcion = input("Ingrese la descripción del evento: ")
        prioridad = input("Ingrese la prioridad del evento: ")
        registrar_evento(id_ev, descripcion, prioridad)
    elif opcion == "3":
        leer_bitacora()
    elif opcion == "4":
        break
