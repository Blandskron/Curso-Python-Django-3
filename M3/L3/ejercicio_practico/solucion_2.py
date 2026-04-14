"""
Módulo para determinar la mayoría de edad.
Cumple con PEP 8 y los principios del Zen de Python.
"""

def verificar_mayoria_edad():
    """Solicita la edad al usuario y determina si es mayor de edad."""
    print("=== 1) Decisión simple: Mayor o menor de edad ===")
    
    try:
        entrada = input("Ingresa tu edad: ").strip()
        edad = int(entrada)

        if edad >= 18:
            print("Eres mayor de edad.")
        else:
            print("Eres menor de edad.")
            
    except ValueError:
        print("Error: Por favor, ingresa un número entero válido.")

if __name__ == "__main__":
    verificar_mayoria_edad()