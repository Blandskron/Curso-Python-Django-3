import os

TAM_ARCHIVO = 100 * 1024 * 1024  # 100 MB

with open("origen2.bin", "wb") as f:
    f.write(os.urandom(TAM_ARCHIVO))

print("Archivo origen2.bin creado con tamaño de 100 MB.")
