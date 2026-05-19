DROP TRIGGER IF EXISTS trg_discount_stock ON pedidos;
CREATE TRIGGER trg_discount_stock
BEFORE UPDATE OF estado ON pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_discount_stock();
