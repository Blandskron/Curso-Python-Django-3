CREATE OR REPLACE FUNCTION fn_prevent_delete_commercial_history()
RETURNS TRIGGER AS $$
BEGIN
    RAISE EXCEPTION 'No se puede eliminar historial comercial. Use estados de negocio.';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_prevent_delete_closed_order_details()
RETURNS TRIGGER AS $$
DECLARE
    v_estado_pedido VARCHAR(20);
BEGIN
    SELECT estado
    INTO v_estado_pedido
    FROM pedidos
    WHERE id = OLD.pedido_id;

    IF v_estado_pedido <> 'pendiente' THEN
        RAISE EXCEPTION 'No se puede eliminar detalle de un pedido %. Estado actual: %', OLD.pedido_id, v_estado_pedido;
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_prevent_delete_orders ON pedidos;
CREATE TRIGGER trg_prevent_delete_orders
BEFORE DELETE ON pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_prevent_delete_commercial_history();

DROP TRIGGER IF EXISTS trg_prevent_delete_order_details ON detalle_pedidos;
CREATE TRIGGER trg_prevent_delete_order_details
BEFORE DELETE ON detalle_pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_prevent_delete_closed_order_details();
