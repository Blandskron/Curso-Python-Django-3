DROP TRIGGER IF EXISTS trg_validate_stock ON detalle_pedidos;
CREATE TRIGGER trg_validate_stock
BEFORE INSERT OR UPDATE OF pedido_id, producto_id, cantidad ON detalle_pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_validate_stock();
