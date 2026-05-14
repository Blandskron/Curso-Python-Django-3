CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
    fecha DATE,
    total NUMERIC,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO clientes (nombre, ciudad) VALUES
('Juan Pérez', 'Madrid'),
('María Gómez', 'Barcelona'),
('Carlos Sánchez', 'Valencia');

INSERT INTO pedidos (cliente_id, fecha, total) VALUES
(1, '2023-07-01', 150.00),
(1, '2023-07-15', 200.00),
(2, '2023-07-10', 300.00),
(3, '2023-07-20', 250.00),
(3, '2023-07-25', 100.00);

UPDATE clientes
SET ciudad = 'Viña del Mar'
WHERE id = 2;

