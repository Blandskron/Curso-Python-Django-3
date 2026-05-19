CREATE TABLE IF NOT EXISTS stock_productos (
    id BIGSERIAL PRIMARY KEY,
    producto_id BIGINT NOT NULL UNIQUE REFERENCES productos(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    cantidad_disponible INTEGER NOT NULL DEFAULT 0,
    cantidad_reservada INTEGER NOT NULL DEFAULT 0,
    stock_minimo INTEGER NOT NULL DEFAULT 0,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_stock_disponible CHECK (cantidad_disponible >= 0),
    CONSTRAINT chk_stock_reservado CHECK (cantidad_reservada >= 0),
    CONSTRAINT chk_stock_minimo CHECK (stock_minimo >= 0)
);
