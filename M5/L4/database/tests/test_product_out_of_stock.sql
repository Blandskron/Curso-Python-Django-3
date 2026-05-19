DO $$
DECLARE
    v_producto_id BIGINT;
    v_pedido_id BIGINT;
    v_nombre VARCHAR(160) := 'TEST Producto Agotado ' || txid_current();
    v_estado VARCHAR(20);
BEGIN
    INSERT INTO productos (categoria_id, nombre, descripcion, precio, estado)
    VALUES (1, v_nombre, 'Producto temporal de prueba.', 1000, 'activo')
    RETURNING id INTO v_producto_id;

    INSERT INTO stock_productos (producto_id, cantidad_disponible, stock_minimo)
    VALUES (v_producto_id, 3, 1);

    INSERT INTO pedidos (usuario_id) VALUES (2) RETURNING id INTO v_pedido_id;
    INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad)
    VALUES (v_pedido_id, v_producto_id, 3);

    UPDATE pedidos SET estado = 'confirmado' WHERE id = v_pedido_id;

    SELECT estado INTO v_estado FROM productos WHERE id = v_producto_id;

    IF v_estado <> 'agotado' THEN
        RAISE EXCEPTION 'Test producto agotado fallo. Estado: %', v_estado;
    END IF;
END;
$$;
