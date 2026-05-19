INSERT INTO stock_productos (id, producto_id, cantidad_disponible, cantidad_reservada, stock_minimo)
VALUES
    (1, 1, 50, 0, 5),
    (2, 2, 100, 0, 10),
    (3, 3, 12, 0, 3),
    (4, 4, 30, 0, 5),
    (5, 5, 80, 0, 10),
    (6, 6, 45, 0, 8),
    (7, 7, 3, 0, 2),
    (8, 8, 60, 0, 10),
    (9, 9, 25, 0, 5),
    (10, 10, 40, 0, 5),
    (11, 11, 15, 0, 3),
    (12, 12, 0, 0, 5)
ON CONFLICT (id) DO UPDATE SET
    producto_id = EXCLUDED.producto_id,
    cantidad_disponible = EXCLUDED.cantidad_disponible,
    cantidad_reservada = EXCLUDED.cantidad_reservada,
    stock_minimo = EXCLUDED.stock_minimo;

SELECT setval('stock_productos_id_seq', GREATEST((SELECT MAX(id) FROM stock_productos), 1), TRUE);
