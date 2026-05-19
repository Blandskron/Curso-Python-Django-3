CREATE OR REPLACE FUNCTION fn_calculate_subtotal()
RETURNS TRIGGER AS $$
DECLARE
    v_precio NUMERIC(12, 2);
BEGIN
    IF TG_OP = 'INSERT' OR NEW.producto_id IS DISTINCT FROM OLD.producto_id THEN
        SELECT precio
        INTO v_precio
        FROM productos
        WHERE id = NEW.producto_id;

        IF v_precio IS NULL THEN
            RAISE EXCEPTION 'Producto % no existe', NEW.producto_id;
        END IF;

        NEW.precio_unitario = v_precio;
    ELSIF NEW.precio_unitario IS DISTINCT FROM OLD.precio_unitario THEN
        NEW.precio_unitario = OLD.precio_unitario;
    END IF;

    NEW.subtotal = NEW.cantidad * NEW.precio_unitario;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
