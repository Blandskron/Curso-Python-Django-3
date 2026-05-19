# Reglas De Negocio

## Usuarios

- El email es unico y obligatorio.
- El rol solo puede ser `admin` o `cliente`.
- El estado solo puede ser `activo`, `bloqueado` o `eliminado`.
- Un usuario con compras no debe eliminarse fisicamente.

## Productos

- Todo producto pertenece a una categoria.
- El precio debe ser mayor a cero.
- Un producto vendido no debe eliminarse fisicamente.
- El estado `agotado` se actualiza automaticamente cuando el stock llega a cero.

## Stock

- Cada producto tiene un unico registro de stock.
- El stock disponible, reservado y minimo no puede ser negativo.
- El stock se vuelve a validar al confirmar el pedido.

## Pedidos

- Un pedido vacio no puede confirmarse.
- El total se recalcula desde `detalle_pedidos`.
- El stock se descuenta una sola vez al pasar de `pendiente` a `confirmado`.
- El stock se restaura al pasar de `confirmado` a `cancelado`.

## Detalles

- La cantidad debe ser mayor a cero.
- El precio unitario se copia desde `productos.precio` al crear el detalle y luego queda protegido como precio historico.
- El subtotal se calcula como `cantidad * precio_unitario`.
- Los detalles de pedidos cerrados quedan protegidos.
