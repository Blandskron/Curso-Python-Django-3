DROP TRIGGER IF EXISTS trg_calculate_subtotal ON detalle_pedidos;
CREATE TRIGGER trg_calculate_subtotal
BEFORE INSERT OR UPDATE OF producto_id, cantidad, precio_unitario ON detalle_pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_calculate_subtotal();
