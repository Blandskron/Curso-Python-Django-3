DROP TRIGGER IF EXISTS trg_usuarios_updated_at ON usuarios;
CREATE TRIGGER trg_usuarios_updated_at
BEFORE UPDATE ON usuarios
FOR EACH ROW
EXECUTE FUNCTION fn_update_timestamp();

DROP TRIGGER IF EXISTS trg_categorias_updated_at ON categorias;
CREATE TRIGGER trg_categorias_updated_at
BEFORE UPDATE ON categorias
FOR EACH ROW
EXECUTE FUNCTION fn_update_timestamp();

DROP TRIGGER IF EXISTS trg_productos_updated_at ON productos;
CREATE TRIGGER trg_productos_updated_at
BEFORE UPDATE ON productos
FOR EACH ROW
EXECUTE FUNCTION fn_update_timestamp();

DROP TRIGGER IF EXISTS trg_stock_productos_updated_at ON stock_productos;
CREATE TRIGGER trg_stock_productos_updated_at
BEFORE UPDATE ON stock_productos
FOR EACH ROW
EXECUTE FUNCTION fn_update_timestamp();

DROP TRIGGER IF EXISTS trg_pedidos_updated_at ON pedidos;
CREATE TRIGGER trg_pedidos_updated_at
BEFORE UPDATE ON pedidos
FOR EACH ROW
EXECUTE FUNCTION fn_update_timestamp();
