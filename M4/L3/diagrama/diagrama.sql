-- 1. Tabla de Productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- 2. Tabla de Estrategias de Descuento
-- (Para guardar los diferentes tipos de descuentos disponibles)
CREATE TABLE estrategias_descuento (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50), -- Ej: 'Descuento Verano', 'Black Friday'
    porcentaje DECIMAL(5, 2) DEFAULT 0.00 -- Ej: 15.00 para 15%
);

-- 3. Tabla de Pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descuento_id INTEGER,
    CONSTRAINT fk_descuento 
        FOREIGN KEY (descuento_id) 
        REFERENCES estrategias_descuento(id)
);

-- 4. Tabla de Líneas de Pedido (Detalle)
-- Esta tabla une los productos con los pedidos y guarda la cantidad
CREATE TABLE lineas_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario_historico DECIMAL(10, 2), -- Recomendado: guardar el precio al momento de la compra
    CONSTRAINT fk_pedido 
        FOREIGN KEY (pedido_id) 
        REFERENCES pedidos(id) ON DELETE CASCADE,
    CONSTRAINT fk_producto 
        FOREIGN KEY (producto_id) 
        REFERENCES productos(id)
);

---
--- CONSULTA PARA OBTENER LOS TOTALES (Lógica del objeto Pedido)
---

-- Esta vista o consulta calcula lo que en tu diagrama eran:
-- total_bruto, total_descuento y total_neto.

SELECT 
    p.id AS pedido_num,
    SUM(lp.cantidad * pr.precio) AS total_bruto,
    COALESCE(ed.porcentaje, 0) AS pct_aplicado,
    (SUM(lp.cantidad * pr.precio) * (COALESCE(ed.porcentaje, 0) / 100)) AS total_descuento,
    (SUM(lp.cantidad * pr.precio) - (SUM(lp.cantidad * pr.precio) * (COALESCE(ed.porcentaje, 0) / 100))) AS total_neto
FROM pedidos p
JOIN lineas_pedido lp ON p.id = lp.pedido_id
JOIN productos pr ON lp.producto_id = pr.id
LEFT JOIN estrategias_descuento ed ON p.descuento_id = ed.id
GROUP BY p.id, ed.porcentaje;