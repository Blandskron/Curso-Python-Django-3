CREATE OR REPLACE FUNCTION fn_prevent_delete_users_with_orders()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM pedidos WHERE usuario_id = OLD.id) THEN
        RAISE EXCEPTION 'No se puede eliminar fisicamente un usuario con historial comercial. Use estado = eliminado.';
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_prevent_delete_users_with_orders ON usuarios;
CREATE TRIGGER trg_prevent_delete_users_with_orders
BEFORE DELETE ON usuarios
FOR EACH ROW
EXECUTE FUNCTION fn_prevent_delete_users_with_orders();
