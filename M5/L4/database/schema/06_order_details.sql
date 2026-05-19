CREATE TABLE IF NOT EXISTS detalle_pedidos (
    id BIGSERIAL PRIMARY KEY,
    pedido_id BIGINT NOT NULL REFERENCES pedidos(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    producto_id BIGINT NOT NULL REFERENCES productos(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    cantidad INTEGER NOT NULL,
    precio_unitario NUMERIC(12, 2) NOT NULL,
    subtotal NUMERIC(12, 2) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_detalle_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_precio_unitario CHECK (precio_unitario > 0),
    CONSTRAINT chk_detalle_subtotal CHECK (subtotal > 0),
    CONSTRAINT uq_detalle_pedido_producto UNIQUE (pedido_id, producto_id)
);
