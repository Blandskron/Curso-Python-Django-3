DROP TRIGGER IF EXISTS trg_restore_stock ON pedidos;
CREATE TRIGGER trg_restore_stock
BEFORE UPDATE OF estado ON pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_restore_stock();
