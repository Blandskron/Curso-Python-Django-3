INSERT INTO categorias (id, nombre, descripcion, estado)
VALUES
    (1, 'Electronica', 'Dispositivos y accesorios tecnologicos.', 'activo'),
    (2, 'Hogar', 'Productos funcionales para el hogar.', 'activo'),
    (3, 'Moda', 'Ropa y accesorios.', 'activo'),
    (4, 'Deportes', 'Equipamiento deportivo.', 'activo'),
    (5, 'Libros', 'Libros fisicos y material educativo.', 'activo')
ON CONFLICT (id) DO UPDATE SET
    nombre = EXCLUDED.nombre,
    descripcion = EXCLUDED.descripcion,
    estado = EXCLUDED.estado;

SELECT setval('categorias_id_seq', GREATEST((SELECT MAX(id) FROM categorias), 1), TRUE);
