# Codigo original
print("Hola, como te llamas?")
nombre=input()

print("Cuantos años tienes?")
edad=input()

edad=int(edad)

faltan=100-edad

print("Hola "+nombre+" te faltan "+str(faltan)+" años para tener 100")

# Codigo pythonico
def calcular_anios_para_100(edad: int) -> int:
    return 100 - edad


def main() -> None:
    nombre = input("Hola, ¿cómo te llamas? ").strip()
    edad = int(input("¿Cuántos años tienes? "))

    anios_faltantes = calcular_anios_para_100(edad)

    print(
        f"Hola {nombre}, te faltan {anios_faltantes} años para cumplir 100."
    )


if __name__ == "__main__":
    main()