from abc import ABC, abstractmethod

# --- ESTRATEGIA DE DESCUENTO (Patrón Strategy) ---

class EstrategiaDescuento(ABC):
    """Interfaz para las diferentes estrategias de descuento."""
    @abstractmethod
    def calcular(self, total_bruto):
        pass

class DescuentoPorcentaje(EstrategiaDescuento):
    """Implementación de descuento basado en un porcentaje."""
    def __init__(self, porcentaje):
        self.porcentaje = porcentaje  # Ej: 0.10 para 10%

    def calcular(self, total_bruto):
        return total_bruto * self.porcentaje

class SinDescuento(EstrategiaDescuento):
    """Clase de utilidad para pedidos sin descuento."""
    def calcular(self, total_bruto):
        return 0.0

# --- CLASES BASE ---

class Producto:
    def __init__(self, nombre, precio):
        self.__nombre = nombre
        self.__precio = precio

    def get_nombre(self):
        return self.__nombre

    def get_precio(self):
        return self.__precio

    def set_precio(self, nuevo_precio):
        self.__precio = nuevo_precio

class LineaPedido:
    def __init__(self, producto: Producto, cantidad: int):
        self.producto = producto
        self.cantidad = cantidad

    def sub_total(self):
        return self.producto.get_precio() * self.cantidad

class Pedido:
    def __init__(self, estrategia_descuento: EstrategiaDescuento = SinDescuento()):
        self.items = []
        self.descuento = estrategia_descuento

    def agregar(self, item: LineaPedido):
        self.items.append(item)

    def total_bruto(self):
        return sum(item.sub_total() for item in self.items)

    def total_descuento(self):
        # Delega el cálculo a la estrategia de descuento
        return self.descuento.calcular(self.total_bruto())

    def total_neto(self):
        return self.total_bruto() - self.total_descuento()

# --- EJEMPLO DE USO ---

if __name__ == "__main__":
    # 1. Crear productos
    p1 = Producto("Laptop", 1200.0)
    p2 = Producto("Mouse", 25.0)

    # 2. Definir una estrategia (15% de descuento)
    descuento_especial = DescuentoPorcentaje(0.15)

    # 3. Crear el pedido
    mi_pedido = Pedido(descuento_especial)
    mi_pedido.agregar(LineaPedido(p1, 1))
    mi_pedido.agregar(LineaPedido(p2, 2))

    # 4. Mostrar resultados
    print(f"Total Bruto: ${mi_pedido.total_bruto():.2f}")
    print(f"Descuento aplicado: ${mi_pedido.total_descuento():.2f}")
    print(f"Total a pagar (Neto): ${mi_pedido.total_neto():.2f}")