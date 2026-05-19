INSERT INTO productos (id, categoria_id, nombre, descripcion, precio, estado)
VALUES
    (1, 1, 'Teclado Mecanico', 'Teclado compacto con switches tactiles.', 59990, 'activo'),
    (2, 1, 'Mouse Inalambrico', 'Mouse ergonomico recargable.', 24990, 'activo'),
    (3, 1, 'Monitor 24 Pulgadas', 'Monitor Full HD para oficina.', 129990, 'activo'),
    (4, 2, 'Lampara LED', 'Lampara de escritorio regulable.', 18990, 'activo'),
    (5, 2, 'Organizador Modular', 'Organizador plastico apilable.', 9990, 'activo'),
    (6, 3, 'Polera Basica', 'Polera de algodon.', 7990, 'activo'),
    (7, 3, 'Chaqueta Urbana', 'Chaqueta liviana de media estacion.', 39990, 'inactivo'),
    (8, 4, 'Botella Deportiva', 'Botella reutilizable de acero.', 12990, 'activo'),
    (9, 4, 'Mat Yoga', 'Mat antideslizante.', 19990, 'activo'),
    (10, 5, 'Libro SQL Practico', 'Guia introductoria de SQL.', 21990, 'activo'),
    (11, 5, 'Libro Arquitectura Limpia', 'Buenas practicas de diseno de software.', 34990, 'activo'),
    (12, 1, 'Audifonos Bluetooth', 'Audifonos compactos con estuche.', 49990, 'agotado')
ON CONFLICT (id) DO UPDATE SET
    categoria_id = EXCLUDED.categoria_id,
    nombre = EXCLUDED.nombre,
    descripcion = EXCLUDED.descripcion,
    precio = EXCLUDED.precio,
    estado = EXCLUDED.estado;

SELECT setval('productos_id_seq', GREATEST((SELECT MAX(id) FROM productos), 1), TRUE);
