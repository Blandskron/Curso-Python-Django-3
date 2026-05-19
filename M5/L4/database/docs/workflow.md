# Workflow

## Crear un pedido

1. Crear registro en `pedidos` con estado `pendiente`.
2. Agregar productos en `detalle_pedidos`.
3. La base valida producto activo, cantidad y stock.
4. La base copia precio historico y calcula subtotal.
5. La base recalcula `pedidos.total`.

## Confirmar un pedido

1. Actualizar `pedidos.estado` desde `pendiente` a `confirmado`.
2. La base valida que el pedido tenga detalles.
3. La base bloquea filas de stock con `FOR UPDATE`.
4. La base valida stock nuevamente.
5. La base descuenta inventario.
6. La base marca `stock_descontado = true`.

## Cancelar un pedido

1. Actualizar `pedidos.estado` desde `confirmado` a `cancelado`.
2. La base devuelve las unidades al stock.
3. La base marca `stock_descontado = false`.

## Cerrar una venta

1. Actualizar `pedidos.estado` desde `confirmado` a `completado`.
2. El historial queda disponible para reportes.
3. La eliminacion fisica del pedido esta bloqueada.
