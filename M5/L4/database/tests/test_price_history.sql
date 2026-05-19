DO $$
DECLARE
    v_producto_id BIGINT;
    v_pedido_id BIGINT;
    v_nombre VARCHAR(160) := 'TEST Precio Historico ' || txid_current();
    v_precio_historico NUMERIC(12, 2);
BEGIN
    INSERT INTO productos (categoria_id, nombre, descripcion, precio, estado)
    VALUES (1, v_nombre, 'Producto temporal de prueba.', 1000, 'activo')
    RETURNING id INTO v_producto_id;

    INSERT INTO stock_productos (producto_id, cantidad_disponible, stock_minimo)
    VALUES (v_producto_id, 10, 1);

    INSERT INTO pedidos (usuario_id) VALUES (2) RETURNING id INTO v_pedido_id;
    INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad)
    VALUES (v_pedido_id, v_producto_id, 1);

    UPDATE productos SET precio = 2500 WHERE id = v_producto_id;

    SELECT precio_unitario INTO v_precio_historico
    FROM detalle_pedidos
    WHERE pedido_id = v_pedido_id
      AND producto_id = v_producto_id;

    IF v_precio_historico <> 1000 THEN
        RAISE EXCEPTION 'Test precio historico fallo. Precio guardado: %', v_precio_historico;
    END IF;
END;
$$;
