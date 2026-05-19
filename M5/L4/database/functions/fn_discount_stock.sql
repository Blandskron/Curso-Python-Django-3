CREATE OR REPLACE FUNCTION fn_discount_stock()
RETURNS TRIGGER AS $$
DECLARE
    v_detalle RECORD;
    v_detalles INTEGER;
    v_stock INTEGER;
    v_estado_producto VARCHAR(20);
BEGIN
    IF OLD.estado = 'pendiente' AND NEW.estado = 'confirmado' THEN
        IF OLD.stock_descontado THEN
            RAISE EXCEPTION 'El pedido % ya tiene stock descontado', OLD.id;
        END IF;

        SELECT COUNT(*)
        INTO v_detalles
        FROM detalle_pedidos
        WHERE pedido_id = OLD.id;

        IF v_detalles = 0 THEN
            RAISE EXCEPTION 'No se puede confirmar un pedido sin detalles';
        END IF;

        FOR v_detalle IN
            SELECT producto_id, cantidad
            FROM detalle_pedidos
            WHERE pedido_id = OLD.id
            ORDER BY producto_id
        LOOP
            SELECT p.estado, sp.cantidad_disponible
            INTO v_estado_producto, v_stock
            FROM stock_productos sp
            JOIN productos p ON p.id = sp.producto_id
            WHERE sp.producto_id = v_detalle.producto_id
            FOR UPDATE;

            IF v_estado_producto <> 'activo' THEN
                RAISE EXCEPTION 'Producto % no esta activo al confirmar pedido %. Estado actual: %',
                    v_detalle.producto_id, OLD.id, v_estado_producto;
            END IF;

            IF v_stock < v_detalle.cantidad THEN
                RAISE EXCEPTION 'Stock insuficiente al confirmar pedido %. Producto: %, disponible: %, solicitado: %',
                    OLD.id, v_detalle.producto_id, v_stock, v_detalle.cantidad;
            END IF;

            UPDATE stock_productos
            SET cantidad_disponible = cantidad_disponible - v_detalle.cantidad
            WHERE producto_id = v_detalle.producto_id;
        END LOOP;

        NEW.stock_descontado = TRUE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
