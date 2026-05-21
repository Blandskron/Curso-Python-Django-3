INSERT INTO usuarios (nombre, email, rol) VALUES
('Alice', 'alice@example.com', 'ADMIN'),
('Bob', 'bob@example.com', 'USER'),
('Charlie', 'charlie@example.com', 'USER'),
('Diana', 'diana@example.com', 'USER'),
('Eve', 'eve@example.com', 'USER');

INSERT INTO categorias (categoria) VALUES
('Electronics'),
('Accessories'),
('Office Supplies');

INSERT INTO productos (nombre, descripcion, precio, categorias_id, stock) VALUES
('Laptop', 'A high-performance laptop for work and gaming.', 999.99, 1, 10),
('Smartphone', 'A sleek smartphone with a powerful camera.', 499.99, 1, 20),
('Headphones', 'Noise-cancelling headphones for immersive sound.', 199.99, 2, 15),
('Smartwatch', 'A stylish smartwatch with fitness tracking features.', 299.99, 2, 25),
('Tablet', 'A versatile tablet for entertainment and productivity.', 399.99, 1, 30),
('Camera', 'A compact camera with excellent image quality.', 599.99, 3, 10),
('Printer', 'A reliable printer for home and office use.', 149.99, 3, 20),
('Monitor', 'A high-resolution monitor for gaming and work.', 249.99, 1, 15),
('Keyboard', 'A mechanical keyboard with customizable RGB lighting.', 89.99, 2, 25),
('Mouse', 'An ergonomic mouse with adjustable DPI settings.', 49.99, 2, 30);

INSERT INTO detalle_pedidos (productos_id, cantidad, total) VALUES
(1, 1, 999.99),
(2, 2, 999.98),
(3, 1, 199.99),
(4, 1, 299.99),
(5, 1, 399.99),
(6, 1, 599.99),
(7, 1, 149.99),
(8, 1, 249.99),
(9, 1, 89.99),
(10, 1, 49.99);

INSERT INTO pedidos (usuario_id, detalle_pedidos_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);