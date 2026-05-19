CREATE OR REPLACE FUNCTION fn_prevent_stock_without_product()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM productos WHERE id = NEW.producto_id) THEN
        RAISE EXCEPTION 'No se puede crear stock para un producto inexistente';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_prevent_stock_without_product ON stock_productos;
CREATE TRIGGER trg_prevent_stock_without_product
BEFORE INSERT OR UPDATE OF producto_id ON stock_productos
FOR EACH ROW
EXECUTE FUNCTION fn_prevent_stock_without_product();
