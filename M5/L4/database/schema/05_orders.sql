CREATE TABLE IF NOT EXISTS pedidos (
    id BIGSERIAL PRIMARY KEY,
    usuario_id BIGINT NOT NULL REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    estado VARCHAR(20) NOT NULL DEFAULT 'pendiente',
    total NUMERIC(12, 2) NOT NULL DEFAULT 0,
    stock_descontado BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_pedidos_estado CHECK (estado IN ('pendiente', 'confirmado', 'cancelado', 'completado')),
    CONSTRAINT chk_pedidos_total CHECK (total >= 0)
);
