def buscar_producto(tipo_busqueda, catalogo_productos):
    busqueda = input(f"Ingresa el {tipo_busqueda} del producto: ").lower()
    encontrado = False
    print(f"\nResultados para '{busqueda}':")
    for id, producto in catalogo_productos.items():
        # Convertimos a minúsculas para que la búsqueda no falle por mayúsculas
        if busqueda in producto[tipo_busqueda].lower():
            print(f"{id}: {producto['nombre']} - {producto['categoria']} - ${producto['precio']}")
            encontrado = True
    
    if not encontrado:
        print("No se encontraron productos coincidentes.")
