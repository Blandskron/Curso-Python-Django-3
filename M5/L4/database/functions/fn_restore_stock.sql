CREATE OR REPLACE FUNCTION fn_restore_stock()
RETURNS TRIGGER AS $$
DECLARE
    v_detalle RECORD;
BEGIN
    IF OLD.estado = 'confirmado' AND NEW.estado = 'cancelado' THEN
        IF NOT OLD.stock_descontado THEN
            RAISE EXCEPTION 'El pedido % no tiene stock descontado para restaurar', OLD.id;
        END IF;

        FOR v_detalle IN
            SELECT producto_id, cantidad
            FROM detalle_pedidos
            WHERE pedido_id = OLD.id
            ORDER BY producto_id
        LOOP
            UPDATE stock_productos
            SET cantidad_disponible = cantidad_disponible + v_detalle.cantidad
            WHERE producto_id = v_detalle.producto_id;
        END LOOP;

        NEW.stock_descontado = FALSE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
