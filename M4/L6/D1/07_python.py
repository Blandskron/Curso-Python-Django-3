# Ejemplo 7: Inspección de atributos de archivo

with open("data/config.yml", "r", encoding="utf-8") as f:
    nombre = f.name
    modo = f.mode
    codificacion = f.encoding
    cerrado = f.closed
    print(f"Nombre: {nombre}")
    print(f"Modo: {modo}")
    print(f"Codificación: {codificacion}")
    print(f"Cerrado: {cerrado}")