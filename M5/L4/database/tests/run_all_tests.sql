BEGIN;
\i tests/test_valid_sale.sql
\i tests/test_insufficient_stock.sql
\i tests/test_cancel_order.sql
\i tests/test_product_out_of_stock.sql
\i tests/test_empty_order.sql
\i tests/test_price_history.sql
ROLLBACK;
