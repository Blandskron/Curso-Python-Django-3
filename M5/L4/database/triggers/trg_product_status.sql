DROP TRIGGER IF EXISTS trg_product_status ON stock_productos;
CREATE TRIGGER trg_product_status
AFTER INSERT OR UPDATE OF cantidad_disponible ON stock_productos
FOR EACH ROW
EXECUTE FUNCTION fn_update_product_status();
