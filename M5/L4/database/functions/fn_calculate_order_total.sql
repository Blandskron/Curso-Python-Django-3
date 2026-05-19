CREATE OR REPLACE FUNCTION fn_calculate_order_total()
RETURNS TRIGGER AS $$
DECLARE
    v_pedido_id BIGINT;
BEGIN
    v_pedido_id = COALESCE(NEW.pedido_id, OLD.pedido_id);

    UPDATE pedidos
    SET total = COALESCE((
        SELECT SUM(subtotal)
        FROM detalle_pedidos
        WHERE pedido_id = v_pedido_id
    ), 0)
    WHERE id = v_pedido_id;

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;
