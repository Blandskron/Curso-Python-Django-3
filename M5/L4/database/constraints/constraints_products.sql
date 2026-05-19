CREATE OR REPLACE FUNCTION fn_prevent_delete_products_with_sales()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM detalle_pedidos WHERE producto_id = OLD.id) THEN
        RAISE EXCEPTION 'No se puede eliminar fisicamente un producto vendido. Use estado = eliminado.';
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_prevent_delete_products_with_sales ON productos;
CREATE TRIGGER trg_prevent_delete_products_with_sales
BEFORE DELETE ON productos
FOR EACH ROW
EXECUTE FUNCTION fn_prevent_delete_products_with_sales();
