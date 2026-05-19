DO $$
DECLARE
    v_producto_id BIGINT;
    v_pedido_id BIGINT;
    v_nombre VARCHAR(160) := 'TEST Cancelacion ' || txid_current();
    v_stock_final INTEGER;
BEGIN
    INSERT INTO productos (categoria_id, nombre, descripcion, precio, estado)
    VALUES (1, v_nombre, 'Producto temporal de prueba.', 1000, 'activo')
    RETURNING id INTO v_producto_id;

    INSERT INTO stock_productos (producto_id, cantidad_disponible, stock_minimo)
    VALUES (v_producto_id, 10, 1);

    INSERT INTO pedidos (usuario_id) VALUES (2) RETURNING id INTO v_pedido_id;
    INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad)
    VALUES (v_pedido_id, v_producto_id, 4);

    UPDATE pedidos SET estado = 'confirmado' WHERE id = v_pedido_id;
    UPDATE pedidos SET estado = 'cancelado' WHERE id = v_pedido_id;

    SELECT cantidad_disponible INTO v_stock_final
    FROM stock_productos
    WHERE producto_id = v_producto_id;

    IF v_stock_final <> 10 THEN
        RAISE EXCEPTION 'Test cancelacion fallo. Stock final: %', v_stock_final;
    END IF;
END;
$$;
