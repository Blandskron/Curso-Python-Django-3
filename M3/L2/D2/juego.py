print("--- EL SIMULADOR DE RASTREO TOTAL ---")
print("Debes elegir: arriba, abajo, izquierda o derecha en CADA nivel.")

# NIVEL 1
d1 = input("\n[1] Entras al Bioma inicial. ¿Dirección? ").lower()

if d1 == "arriba":
    # NIVEL 2
    d2 = input("[2] Estás en la Tundra. ¿Dirección? ").lower()
    if d2 == "arriba":
        d3 = input("[3] Cueva de hielo. ¿Dirección? ").lower()
        if d3 == "arriba": print("¡Encontraste un Oso Polar! 🐻‍❄️")
        elif d3 == "abajo": print("¡Encontraste un Pingüino! 🐧")
        elif d3 == "izquierda": print("¡Encontraste un Zorro Ártico! 🦊")
        elif d3 == "derecha": print("¡Encontraste una Morsa! 🦭")
        else: print("Te congelaste.")
    elif d2 == "abajo":
        print("Caíste en una grieta de hielo.")
    elif d2 == "izquierda":
        print("Te persigue una ventisca.")
    elif d2 == "derecha":
        print("Llegaste a un muro de nieve.")

elif d1 == "abajo":
    # NIVEL 2
    d2 = input("[2] Estás en el Inframundo. ¿Dirección? ").lower()
    if d2 == "abajo":
        d3 = input("[3] Río de lava. ¿Dirección? ").lower()
        if d3 == "arriba": print("¡Encontraste una Salamandra de fuego! 🦎")
        elif d3 == "abajo": print("¡Encontraste un Murciélago de lava! 🦇")
        elif d3 == "izquierda": print("¡Encontraste un Gusano de roca! 🪱")
        elif d3 == "derecha": print("¡Encontraste un Dragón durmiente! 🐉")
        else: print("Te quemaste.")
    elif d2 == "arriba":
        print("El techo colapsó.")
    elif d2 == "izquierda":
        print("No hay salida por aquí.")
    elif d2 == "derecha":
        print("Demasiado calor para seguir.")

elif d1 == "izquierda":
    # NIVEL 2
    d2 = input("[2] Estás en la Ciudad Fantasma. ¿Dirección? ").lower()
    if d2 == "izquierda":
        d3 = input("[3] Callejón sin salida. ¿Dirección? ").lower()
        if d3 == "arriba": print("¡Encontraste un Gato callejero! 🐈")
        elif d3 == "abajo": print("¡Encontraste una Cucaracha de alcantarilla! 🪳")
        elif d3 == "izquierda": print("¡Encontraste un Perro abandonado! 🐕")
        elif d3 == "derecha": print("¡Encontraste una Rata de ciudad! 🐀")
        else: print("Te asustó un fantasma.")
    elif d2 == "arriba":
        print("Entraste a un edificio bloqueado.")
    elif d2 == "abajo":
        print("La calle está inundada.")
    elif d2 == "derecha":
        print("Hay una pandilla de mimos, no puedes pasar.")

elif d1 == "derecha":
    # NIVEL 2
    d2 = input("[2] Estás en el Oasis. ¿Dirección? ").lower()
    if d2 == "derecha":
        d3 = input("[3] Palmeras densas. ¿Dirección? ").lower()
        if d3 == "arriba": print("¡Encontraste un Camaleón! 🦎")
        elif d3 == "abajo": print("¡Encontraste un Escorpión! 🦂")
        elif d3 == "izquierda": print("¡Encontraste un Camello! 🐫")
        elif d3 == "derecha": print("¡Encontraste una Cobra! 🐍")
        else: print("Te quedaste sin agua.")
    elif d2 == "arriba":
        print("Espejismo: no hay nada aquí.")
    elif d2 == "abajo":
        print("Arena movediza.")
    elif d2 == "izquierda":
        print("El viento te empuja de vuelta.")

else:
    print("Opción inválida. El juego termina.")