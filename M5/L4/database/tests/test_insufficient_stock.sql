DO $$
DECLARE
    v_producto_id BIGINT;
    v_pedido_id BIGINT;
    v_nombre VARCHAR(160) := 'TEST Sin Stock ' || txid_current();
BEGIN
    INSERT INTO productos (categoria_id, nombre, descripcion, precio, estado)
    VALUES (1, v_nombre, 'Producto temporal de prueba.', 1000, 'activo')
    RETURNING id INTO v_producto_id;

    INSERT INTO stock_productos (producto_id, cantidad_disponible, stock_minimo)
    VALUES (v_producto_id, 2, 1);

    INSERT INTO pedidos (usuario_id) VALUES (2) RETURNING id INTO v_pedido_id;

    BEGIN
        INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad)
        VALUES (v_pedido_id, v_producto_id, 5);

        RAISE EXCEPTION 'Test sin stock fallo: la venta invalida fue aceptada';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLERRM NOT LIKE '%Stock insuficiente%' THEN
                RAISE;
            END IF;
    END;
END;
$$;
