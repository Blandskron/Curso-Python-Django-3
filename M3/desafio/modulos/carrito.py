# Variable global para el carrito (Lista de productos)
carrito = []

def agregar_al_carrito(catalogo_productos, carrito):
    try:
        id_producto = int(input("\nIngresa el ID del producto que deseas agregar: "))
        if id_producto in catalogo_productos:
            carrito.append(catalogo_productos[id_producto])
            print(f"¡{catalogo_productos[id_producto]['nombre']} agregado con éxito!")
        else:
            print("ID no encontrado en el catálogo.")
    except ValueError:
        print("Error: Por favor ingresa un número válido.")

def ver_carrito(carrito):
    if not carrito:
        print("\nEl carrito está vacío.")
    else:
        print("\n--- Tu Carrito ---")
        total = 0
        for producto in carrito:
            print(f"- {producto['nombre']}: ${producto['precio']}")
            total += producto['precio']
        print(f"TOTAL A PAGAR: ${total}")

def vaciar_carrito(carrito):
    carrito.clear()
    print("\nCarrito vaciado correctamente.")