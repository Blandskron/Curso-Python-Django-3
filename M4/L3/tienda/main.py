class Cliente:
    def __init__(self, nombre, rut):
        self.nombre = nombre
        self.rut = rut

productos = []

class Descuento:
    def __init__(self, porcentaje):
        self.porcentaje = porcentaje

class Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio

    def ver_producto(self) -> str:
        return f"Producto: {self.nombre}, Precio: {self.precio}"

class Pedido:
    def __init__(self, numero: int, descuento: Descuento = None):
        self.numero = numero
        self.producto: list[Producto] = []
        self.descuento = descuento

    def agregar_producto(self, producto: Producto) -> None:
        self.producto.append(producto)

    def eliminar_producto(self, producto: Producto) -> None:
        if producto in self.producto:
            self.producto.remove(producto)

    def agregar_descuento(self, descuento: Descuento) -> None:
        self.descuento = descuento
        self.calcular_total()

    def calcular_total(self) -> float:
        total = sum(p.precio for p in self.producto)
        if self.descuento:
            total -= total * (self.descuento.porcentaje / 100)
        return total

def ver_productos(productos: list[Producto]) -> None:
    for producto in productos:
        print(producto.ver_producto())

class Vendedor:
    def __init__(self, nombre, codigo_vendedor):
        self.nombre = nombre
        self.codigo_vendedor = codigo_vendedor

    def iniciar_venta(self, pedido: Pedido) -> None:
        vender(pedido)

def vender(self, pedido: Pedido) -> None:
    while True:
        print("opciones 1 agregar producto, 2 eliminar producto, 3 agregar descuento, 4 calcular total")
        opcion = int(input("Ingrese la opción: "))
        if opcion == 1:
            ver_productos(productos)
            nombre_producto = input("Ingrese el nombre del producto: ")
            precio_producto = float(input("Ingrese el precio del producto: "))
            producto = Producto(nombre_producto, precio_producto)
            pedido.agregar_producto(producto)
        elif opcion == 2:
            nombre_producto = input("Ingrese el nombre del producto a eliminar: ")
            precio_producto = float(input("Ingrese el precio del producto a eliminar: "))
            producto = Producto(nombre_producto, precio_producto)
            pedido.eliminar_producto(producto)
        elif opcion == 3:
            porcentaje_descuento = float(input("Ingrese el porcentaje de descuento: "))
            descuento = Descuento(porcentaje_descuento)
            pedido.agregar_descuento(descuento)
        elif opcion == 4:
            total = pedido.calcular_total()
            print(f"El total del pedido es: {total}")
            break
        else:
            print("Opción inválida")


galletas = Producto("Galletas", 1.5)
leche = Producto("Leche", 0.99)
productos.append(galletas)
productos.append(leche)
juan = Vendedor("Juan", "V001")
juan.vender(Pedido(range(1, 1000)))
