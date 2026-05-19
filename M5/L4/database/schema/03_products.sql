CREATE TABLE IF NOT EXISTS productos (
    id BIGSERIAL PRIMARY KEY,
    categoria_id BIGINT NOT NULL REFERENCES categorias(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    nombre VARCHAR(160) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(12, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_productos_precio CHECK (precio > 0),
    CONSTRAINT chk_productos_estado CHECK (estado IN ('activo', 'inactivo', 'agotado', 'eliminado')),
    CONSTRAINT uq_productos_categoria_nombre UNIQUE (categoria_id, nombre)
);
