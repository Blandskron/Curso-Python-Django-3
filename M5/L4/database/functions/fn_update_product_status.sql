CREATE OR REPLACE FUNCTION fn_update_product_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.cantidad_disponible = 0 THEN
        UPDATE productos
        SET estado = 'agotado'
        WHERE id = NEW.producto_id
          AND estado = 'activo';
    ELSIF NEW.cantidad_disponible > 0 THEN
        UPDATE productos
        SET estado = 'activo'
        WHERE id = NEW.producto_id
          AND estado = 'agotado';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
