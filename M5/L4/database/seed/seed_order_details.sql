INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 4, 1),
    (2, 5, 3),
    (3, 8, 2),
    (3, 10, 1),
    (4, 6, 4),
    (4, 9, 1),
    (5, 3, 1),
    (5, 11, 1)
ON CONFLICT (pedido_id, producto_id) DO UPDATE SET
    cantidad = EXCLUDED.cantidad;

UPDATE pedidos SET estado = 'confirmado' WHERE id IN (2, 3);
UPDATE pedidos SET estado = 'confirmado' WHERE id = 4;
UPDATE pedidos SET estado = 'cancelado' WHERE id = 4;
UPDATE pedidos SET estado = 'confirmado' WHERE id = 5;
UPDATE pedidos SET estado = 'completado' WHERE id = 5;

SELECT setval('detalle_pedidos_id_seq', GREATEST((SELECT MAX(id) FROM detalle_pedidos), 1), TRUE);
