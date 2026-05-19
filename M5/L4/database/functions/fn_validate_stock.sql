CREATE OR REPLACE FUNCTION fn_validate_stock()
RETURNS TRIGGER AS $$
DECLARE
    v_estado_pedido VARCHAR(20);
    v_estado_producto VARCHAR(20);
    v_stock INTEGER;
BEGIN
    SELECT estado
    INTO v_estado_pedido
    FROM pedidos
    WHERE id = NEW.pedido_id;

    IF v_estado_pedido IS NULL THEN
        RAISE EXCEPTION 'Pedido % no existe', NEW.pedido_id;
    END IF;

    IF v_estado_pedido <> 'pendiente' THEN
        RAISE EXCEPTION 'Solo se pueden modificar detalles de pedidos pendientes. Estado actual: %', v_estado_pedido;
    END IF;

    SELECT p.estado, sp.cantidad_disponible
    INTO v_estado_producto, v_stock
    FROM productos p
    JOIN stock_productos sp ON sp.producto_id = p.id
    WHERE p.id = NEW.producto_id;

    IF v_estado_producto IS NULL THEN
        RAISE EXCEPTION 'Producto % no existe o no tiene registro de stock', NEW.producto_id;
    END IF;

    IF v_estado_producto <> 'activo' THEN
        RAISE EXCEPTION 'Producto % no esta activo. Estado actual: %', NEW.producto_id, v_estado_producto;
    END IF;

    IF NEW.cantidad <= 0 THEN
        RAISE EXCEPTION 'La cantidad debe ser mayor a cero';
    END IF;

    IF v_stock < NEW.cantidad THEN
        RAISE EXCEPTION 'Stock insuficiente para producto %. Disponible: %, solicitado: %', NEW.producto_id, v_stock, NEW.cantidad;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
