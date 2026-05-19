DO $$
DECLARE
    v_pedido_id BIGINT;
BEGIN
    INSERT INTO pedidos (usuario_id) VALUES (2) RETURNING id INTO v_pedido_id;

    BEGIN
        UPDATE pedidos SET estado = 'confirmado' WHERE id = v_pedido_id;
        RAISE EXCEPTION 'Test pedido vacio fallo: el pedido fue confirmado';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLERRM NOT LIKE '%sin detalles%' THEN
                RAISE;
            END IF;
    END;
END;
$$;
