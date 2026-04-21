def mostrar_catalogo(catalogo_productos):
    print("\n--- Catálogo de Productos ---")
    print("id - Nombre - Categoría - Precio")
    for id, producto in catalogo_productos.items():
        print(f"{id}: {producto['nombre']} - {producto['categoria']} - ${producto['precio']}")
