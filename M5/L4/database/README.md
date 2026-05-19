# Ecommerce MVP Database

Base de datos PostgreSQL para un ecommerce MVP con reglas de negocio integradas en la capa SQL.

## Orden de ejecucion

Ejecutar los archivos en este orden:

```sql
\i run_all.sql
```

O manualmente:

```sql
\i schema/01_users.sql
\i schema/02_categories.sql
\i schema/03_products.sql
\i schema/04_stock.sql
\i schema/05_orders.sql
\i schema/06_order_details.sql

\i functions/fn_update_timestamp.sql
\i functions/fn_calculate_subtotal.sql
\i functions/fn_calculate_order_total.sql
\i functions/fn_validate_stock.sql
\i functions/fn_discount_stock.sql
\i functions/fn_restore_stock.sql
\i functions/fn_update_product_status.sql

\i triggers/trg_update_timestamps.sql
\i triggers/trg_validate_stock.sql
\i triggers/trg_calculate_subtotal.sql
\i triggers/trg_update_order_total.sql
\i triggers/trg_discount_stock.sql
\i triggers/trg_restore_stock.sql
\i triggers/trg_product_status.sql

\i constraints/constraints_users.sql
\i constraints/constraints_products.sql
\i constraints/constraints_orders.sql
\i constraints/constraints_stock.sql

\i seed/seed_users.sql
\i seed/seed_categories.sql
\i seed/seed_products.sql
\i seed/seed_stock.sql
\i seed/seed_orders.sql
\i seed/seed_order_details.sql
```

## Pruebas

Los archivos de `tests/` son escenarios funcionales independientes. Se recomienda ejecutarlos dentro de una transaccion durante desarrollo:

```sql
BEGIN;
\i tests/test_valid_sale.sql
ROLLBACK;
```

## Reglas principales

- El stock se valida al agregar o modificar detalles de pedido.
- El precio historico se copia automaticamente desde `productos.precio`.
- El subtotal y total se recalculan automaticamente.
- El stock se descuenta al confirmar un pedido pendiente.
- El stock se restaura al cancelar un pedido confirmado.
- Los productos cambian automaticamente entre `activo` y `agotado` segun inventario.
- Los registros comerciales se protegen contra eliminaciones fisicas.
