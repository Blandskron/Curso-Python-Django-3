INSERT INTO pedidos (id, usuario_id, estado, total, stock_descontado)
VALUES
    (1, 2, 'pendiente', 0, FALSE),
    (2, 2, 'pendiente', 0, FALSE),
    (3, 3, 'pendiente', 0, FALSE),
    (4, 3, 'pendiente', 0, FALSE),
    (5, 2, 'pendiente', 0, FALSE)
ON CONFLICT (id) DO UPDATE SET
    usuario_id = EXCLUDED.usuario_id,
    estado = 'pendiente',
    total = 0,
    stock_descontado = FALSE;

SELECT setval('pedidos_id_seq', GREATEST((SELECT MAX(id) FROM pedidos), 1), TRUE);
