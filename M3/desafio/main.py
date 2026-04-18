# Diccionario de Productos
catalogo_productos = {
    1: {"nombre": "Camiseta", "categoria": "Ropa", "precio": 20},
    2: {"nombre": "Pantalón", "categoria": "Ropa", "precio": 30},
    3: {"nombre": "Zapatos", "categoria": "Calzado", "precio": 50},
    4: {"nombre": "Bolso", "categoria": "Accesorio", "precio": 40},
    5: {"nombre": "Reloj", "categoria": "Accesorio", "precio": 60},
}

# ciclo hasta seleccionar salir
while True:

    # Menu Principal
    print(
        """
        Bienvenido/a a tu Ecommerce

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
        # Ver catálogo de productos
        print("id - Nombre - Categoría - Precio")
        for id, producto in catalogo_productos.items():
            print(f"{id}: {producto['nombre']} - {producto['categoria']} - ${producto['precio']}")

    elif opcion == "2":
        # Buscar producto por nombre o categoría
        tipo_busqueda = input("¿Quieres buscar por nombre o categoría? (nombre/categoria): ")

        if tipo_busqueda == "nombre":
            busqueda = input("Ingresa el nombre del producto: ")

            for id, producto in catalogo_productos.items():
                if producto[tipo_busqueda] == busqueda:
                    print(f"{id}: {producto['nombre']} - {producto['categoria']} - ${producto['precio']}")

        elif tipo_busqueda == "categoria":
            busqueda = input("Ingresa la categoria del producto: ")

            for id, producto in catalogo_productos.items():
                if producto[tipo_busqueda] == busqueda:
                    print(f"{id}: {producto['nombre']} - {producto['categoria']} - ${producto['precio']}")
                elif producto[tipo_busqueda] != busqueda:
                    continue 
                else:
                    print("No se encontraron productos con esa categoria")
        else:
            print("Opción no válida. Por favor, selecciona 'nombre' o 'categoria'.")
    

    elif opcion == "3":
        # Agregar producto al carrito
        pass
    elif opcion == "4":
        # Ver carrito y total
        pass
    elif opcion == "5":
        # Vaciar carrito
        pass
    elif opcion == "0":
        # Salir
        print("¡Hasta luego!")
        break
    else:
        print("Opción no válida. Por favor, selecciona una opción válida.")