from modulos.catalogo import catalogo_productos
from modulos.mostrar_catalogo import mostrar_catalogo
from modulos.buscar_producto import buscar_producto
from modulos.carrito import carrito, agregar_al_carrito, ver_carrito, vaciar_carrito

# ciclo hasta seleccionar salir
while True:
    # Menu Principal
    print(
        """
        ==============================
        Bienvenido/a a tu Ecommerce
        ==============================
        1- Ver catálogo de productos
        2- Buscar producto por nombre o categoría
        3- Agregar producto al carrito
        4- Ver carrito y total
        5- Vaciar carrito
        0- Salir
        """
    )

    opcion = input("Selecciona una opción: ")

    if opcion == "1":
        mostrar_catalogo(catalogo_productos)
        
    elif opcion == "2":
        tipo_busqueda = input("¿Quieres buscar por nombre o categoría? (nombre/categoria): ").lower()
        if tipo_busqueda in ["nombre", "categoria"]:
            buscar_producto(tipo_busqueda, catalogo_productos)
        else:
            print("Opción no válida. Por favor, selecciona 'nombre' o 'categoria'.")

    elif opcion == "3":
        mostrar_catalogo(catalogo_productos)
        agregar_al_carrito(catalogo_productos, carrito)

    elif opcion == "4":
        ver_carrito(carrito)

    elif opcion == "5":
        confirmar = input("¿Estás seguro de vaciar el carrito? (s/n): ")
        if confirmar.lower() == 's':
            vaciar_carrito(carrito)

    elif opcion == "0":
        print("¡Gracias por tu visita. Hasta luego!")
        break
    else:
        print("Opción no válida. Por favor, selecciona una opción válida.")