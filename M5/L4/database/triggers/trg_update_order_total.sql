DROP TRIGGER IF EXISTS trg_update_order_total ON detalle_pedidos;
CREATE TRIGGER trg_update_order_total
AFTER INSERT OR UPDATE OR DELETE ON detalle_pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_calculate_order_total();
