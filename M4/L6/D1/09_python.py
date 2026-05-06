# Ejemplo 9: Escritura acumulativa con 'a' (append)

with open("data/aplicacion.log", "a", encoding="utf-8") as f:
    f.write("2026-05-04T10:00Z - Ejecutando tarea\n")
