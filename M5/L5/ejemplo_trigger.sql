CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    status VARCHAR(30) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_logs (
    log_id SERIAL PRIMARY KEY,
    order_id INT,
    action VARCHAR(50),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_order
        FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
);

-- Funcion que se ejecuta automaticamente
-- para guardar un log cuando se crea una orden
CREATE OR REPLACE FUNCTION create_order_log()
RETURNS TRIGGER AS $$
BEGIN

    INSERT INTO order_logs (
        order_id,
        action
    )
    VALUES (
        NEW.order_id,
        'ORDER CREATED'
    );

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

-- Trigger que detecta inserts en orders
-- y ejecuta automaticamente la funcion
CREATE TRIGGER trg_create_order_log
AFTER INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION create_order_log();

INSERT INTO orders (
    customer_name,
    total
)
VALUES (
    'Bastian Landskron',
    19990
);